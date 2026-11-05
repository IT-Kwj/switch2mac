#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
    float4 m_34 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _966 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_966, float2(0.0), isnan(_966))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_966, float2(0.0), isnan(_966))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = 1.0 / _84;
    float _88 = _86 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _98 = abs(_90);
    float _100 = log2(_98);
    float _102 = _88 * (*spvDescriptorSet0.fp_c3)._m0[46].x;
    float _104 = _88 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _106 = _62 * _76;
    float _108 = _62 * _82;
    float _110 = abs(_92);
    float _112 = log2(_110);
    float _114 = abs(_94);
    float _116 = log2(_114);
    float _118 = _88 * (*spvDescriptorSet0.fp_c3)._m0[49].x;
    float _120 = _100 * _70;
    float _122 = abs(_96);
    float _124 = log2(_122);
    float _126 = _112 * _70;
    float _128 = abs(_102);
    float _130 = log2(_128);
    float _132 = _116 * _70;
    float _134 = abs(_104);
    float _136 = log2(_134);
    float _138 = _124 * _70;
    float _140 = _130 * _70;
    float _142 = exp2(_132);
    float _144 = _136 * _70;
    float _146 = exp2(_126);
    float _148 = exp2(_138);
    float _150 = exp2(_140);
    float _152 = exp2(_120);
    float _154 = exp2(_144);
    float _156 = -_68;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _160 = abs(_118);
    float _162 = log2(_160);
    float _164 = 1.0 / _158;
    float _166 = _162 * _70;
    float _168 = exp2(_166);
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _172 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[8].y, _170);
    float _174 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _176 = _172 * _88;
    float _178 = _174 * _146;
    float _180 = _174 * _148;
    float _182 = _174 * _142;
    float _184 = _174 * _150;
    float _186 = abs(_176);
    float _188 = log2(_186);
    float _190 = _174 * _152;
    float _192 = ceil(_178);
    int _195 = int(_192);
    float _197 = _188 * _70;
    float _199 = _174 * _154;
    float _201 = ceil(_180);
    float _203 = exp2(_197);
    float _205 = ceil(_182);
    float _207 = _174 * _168;
    float _209 = _174 * _203;
    float _211 = ceil(_184);
    float _213 = precise::min(_174, _209);
    float _215 = ceil(_190);
    float _217 = trunc(_213);
    int _219 = int(_217);
    float _221 = ceil(_199);
    int _223 = min(_195, _219);
    float _225 = ceil(_207);
    float _227 = float(_223);
    int _229 = ~_223;
    int _231 = _219 + _229;
    int _233 = _231 + 1;
    float _235 = -_227;
    float _237 = _201 + _235;
    float _239 = trunc(_237);
    int _241 = int(_239);
    int _243 = min(_241, _233);
    int _245 = _223 + _243;
    float _247 = float(_245);
    int _249 = ~_245;
    int _251 = _219 + _249;
    int _253 = _251 + 1;
    float _255 = -_247;
    float _257 = _205 + _255;
    float _259 = trunc(_257);
    int _261 = int(_259);
    int _263 = min(_261, _253);
    int _265 = _245 + _263;
    float _267 = float(_265);
    int _269 = ~_265;
    int _271 = _219 + _269;
    int _273 = _271 + 1;
    float _275 = -_267;
    float _277 = _211 + _275;
    float _279 = trunc(_277);
    int _281 = int(_279);
    int _283 = min(_281, _273);
    int _285 = _265 + _283;
    float _287 = float(_285);
    int _289 = ~_285;
    int _291 = _219 + _289;
    int _293 = _291 + 1;
    float _295 = -_287;
    float _297 = _215 + _295;
    float _299 = trunc(_297);
    int _301 = int(_299);
    float _303 = in.m_36.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    int _309 = min(_301, _293);
    int _311 = _285 + _309;
    float _313 = float(_311);
    int _315 = ~_311;
    int _317 = _219 + _315;
    int _319 = _317 + 1;
    float _321 = -_313;
    float _323 = _221 + _321;
    float _325 = trunc(_323);
    int _327 = int(_325);
    float _329 = _62 * _307;
    int _331 = min(_327, _319);
    float _333 = in.m_36.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    int _339 = _311 + _331;
    float _341 = float(_339);
    int _343 = ~_339;
    int _345 = _219 + _343;
    int _347 = _345 + 1;
    float _349 = -_341;
    float _351 = _225 + _349;
    float _353 = trunc(_351);
    int _355 = int(_353);
    float _357 = _62 * _337;
    int _359 = min(_355, _347);
    int _361 = ~_339;
    int _363 = ~_359;
    int _365 = _219 + _361;
    int _367 = _365 + _363;
    int _369 = _367 + 2;
    int _371 = 0;
    int _373 = 0;
    int _375 = 0;
    int _377 = 0;
    int _379 = 0;
    float _381 = 0.0;
    int _383 = 0;
    int _385 = 0;
    int _387 = 0;
    bool _391;
    bool _674;
    float _914;
    int _928;
    do
    {
        int _393 = _371;
        int _395 = _373;
        int _397 = _375;
        int _399 = _377;
        int _401 = _379;
        float _403 = _381;
        int _405 = _383;
        int _407 = _385;
        int _409 = _387;
        int _411 = _393 << 2;
        bool _413 = _411 == 0;
        bool _415 = _411 == 4;
        bool _417 = _411 == 8;
        bool _419 = _411 == 12;
        int _421 = _395;
        int _423 = _411;
        float _425 = _403;
        float _427 = as_type<float>(_397);
        int _429 = _399;
        int _431 = _401;
        float _433 = _403;
        int _435 = _405;
        int _437 = _407;
        int _439 = _409;
        if (_413)
        {
            _421 = _223;
        }
        int _441 = _421;
        bool _443 = _411 == 16;
        int _445 = _441;
        if (_415)
        {
            _445 = _243;
        }
        int _447 = _445;
        int _449 = _447;
        if (_417)
        {
            _449 = _263;
        }
        int _451 = _449;
        bool _453 = _411 == 20;
        bool _455 = _411 == 24;
        int _457 = _451;
        if (_419)
        {
            _457 = _283;
        }
        int _459 = _457;
        bool _461 = _411 == 28;
        int _463 = _459;
        if (_443)
        {
            _463 = _309;
        }
        int _465 = _463;
        int _467 = _465;
        if (_453)
        {
            _467 = _331;
        }
        int _469 = _467;
        int _471 = _469;
        if (_455)
        {
            _471 = _359;
        }
        int _473 = _471;
        int _475 = _473;
        if (_461)
        {
            _475 = _369;
        }
        int _477 = _475;
        bool _479 = _477 > 0;
        _373 = _477;
        if (!_479)
        {
            _423 = _397;
        }
        int _481 = _423;
        bool _483 = !_479;
        int _485 = _481;
        if (!_483)
        {
            float _487 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[51].x));
            float _489 = in.m_38.x;
            float _491 = gl_FragCoord.w;
            float _493 = _489 * _491;
            int _495 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].y));
            float _497 = in.m_38.z;
            float _499 = gl_FragCoord.w;
            float _501 = _497 * _499;
            float _503 = float(uint(_393));
            float _505 = 1.0 / _487;
            float _507 = float(uint(_495));
            int _509 = abs(_393);
            float _511 = float(uint(_509));
            float _513 = 1.0 / _507;
            int _515 = as_type<int>(_505) + (-2);
            float _517 = as_type<float>(_515) * _503;
            int _519 = as_type<int>(_513) + (-2);
            float _521 = trunc(_517);
            float _523 = precise::max(_521, 0.0);
            uint _526 = uint(_523);
            float _528 = _62 * _493;
            float _530 = as_type<float>(_519) * _511;
            float _532 = _62 * _501;
            float _534 = trunc(_530);
            float _536 = precise::max(_534, 0.0);
            uint _538 = uint(_536);
            int _540 = ~int(_526);
            int _542 = _540 + 1;
            int _544 = _542 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _546 = _544 + _393;
            int _548 = ~int(_538);
            int _550 = _548 + 1;
            float _552 = float(uint(_546));
            int _554 = _550 * _495;
            int _556 = _554 + _509;
            float _558 = as_type<float>(_515) * _552;
            float _560 = float(uint(_556));
            float _562 = trunc(_558);
            float _564 = precise::max(_562, 0.0);
            uint _566 = uint(_564);
            float _568 = as_type<float>(_519) * _560;
            float _570 = trunc(_568);
            float _572 = precise::max(_570, 0.0);
            uint _574 = uint(_572);
            int _576 = int(_526) + int(_566);
            int _578 = ~_576;
            int _580 = _578 + 1;
            int _582 = int(_538) + int(_574);
            int _584 = _580 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _586 = _584 + _393;
            int _588 = _393 * 64;
            int _590 = -_582;
            bool _592 = uint(_586) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            float _594 = in.m_38.y;
            float _596 = gl_FragCoord.w;
            float _598 = _594 * _596;
            int _600 = _590 * _495;
            int _602 = _600 + _509;
            bool _604 = !_592;
            int _606 = _604 ? 0 : (-1);
            bool _608 = uint(_602) >= uint(_495);
            int _610 = ~_576;
            int _612 = _610 + _606;
            int _614 = _612 + 1;
            int _616 = _393 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].y);
            bool _618 = !_608;
            int _620 = _618 ? 0 : (-1);
            uint _622 = uint(int(uint(_616) >> uint(31)));
            int _624 = _614 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _626 = _624 + _393;
            bool _628 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _630 = ~_620;
            int _632 = _582 + _630;
            int _634 = _632 + 1;
            bool _636 = !_628;
            int _638 = _636 ? _626 : (-1);
            int _640 = ~int(_622);
            int _642 = _640 + 1;
            float _644 = float(_638);
            int _646 = _634 ^ _642;
            bool _648 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].y);
            float _650 = rint(_644);
            float _652 = precise::max(_650, 0.0);
            uint _654 = uint(_652);
            uint _656 = clamp(_654, 0u, 65535u);
            int _658 = ~_642;
            int _660 = _658 + _646;
            int _662 = _660 + 1;
            float _664 = _62 * _598;
            bool _666 = !_648;
            int _668 = _666 ? _662 : (-1);
            float _670 = float(_668);
            int _672 = 0;
            _429 = as_type<int>(_528);
            _431 = as_type<int>(_532);
            do
            {
                float _676 = _425;
                int _678 = _672;
                float _680 = _427;
                float _682 = _676 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _684 = _588 + 176;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                uint _688 = uint(int(uint(int(_686)) >> uint(2)));
                int _690 = int(_686) & 3;
                float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
                int _694 = int(_686) + 1;
                uint _696 = uint(int(uint(_694) >> uint(2)));
                int _698 = _694 & 3;
                float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
                float _702 = abs(_682);
                float _704 = log2(_702);
                int _706 = _588 + 160;
                uint _708 = uint(int(uint(_706) >> uint(2)));
                uint _710 = uint(int(uint(int(_708)) >> uint(2)));
                int _712 = int(_708) & 3;
                float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
                int _716 = int(_708) + 1;
                uint _718 = uint(int(uint(_716) >> uint(2)));
                int _720 = _716 & 3;
                float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
                int _724 = _588 + 192;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                uint _728 = uint(int(uint(int(_726)) >> uint(2)));
                int _730 = int(_726) & 3;
                float _732 = (*spvDescriptorSet0.fp_c3)._m0[int(_728)][_730];
                int _734 = int(_726) + 1;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                int _738 = _734 & 3;
                float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
                float _742 = _704 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _744 = _588 + 208;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                uint _748 = uint(int(uint(int(_746)) >> uint(2)));
                int _750 = int(_746) & 3;
                float _752 = (*spvDescriptorSet0.fp_c3)._m0[int(_748)][_750];
                int _754 = int(_746) + 1;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                int _758 = _754 & 3;
                float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
                float _762 = exp2(_742);
                float _764 = fma(_762, _664, _106);
                float _766 = fma(_762, _528, _329);
                float _768 = fma(_762, _532, _357);
                float _770 = _764 * _700;
                float _772 = _764 * _722;
                float _774 = _764 * _740;
                float _776 = _764 * _760;
                float _778 = fma(_766, _692, _770);
                float _780 = fma(_766, _714, _772);
                float _782 = fma(_766, _732, _774);
                int _784 = _588 + 168;
                uint _786 = uint(int(uint(_784) >> uint(2)));
                uint _788 = uint(int(uint(int(_786)) >> uint(2)));
                int _790 = int(_786) & 3;
                float _792 = (*spvDescriptorSet0.fp_c3)._m0[int(_788)][_790];
                int _794 = int(_786) + 1;
                uint _796 = uint(int(uint(_794) >> uint(2)));
                int _798 = _794 & 3;
                float _800 = (*spvDescriptorSet0.fp_c3)._m0[int(_796)][_798];
                float _802 = fma(_766, _752, _776);
                int _804 = _588 + 216;
                uint _806 = uint(int(uint(_804) >> uint(2)));
                uint _808 = uint(int(uint(int(_806)) >> uint(2)));
                int _810 = int(_806) & 3;
                float _812 = (*spvDescriptorSet0.fp_c3)._m0[int(_808)][_810];
                int _814 = int(_806) + 1;
                uint _816 = uint(int(uint(_814) >> uint(2)));
                int _818 = _814 & 3;
                float _820 = (*spvDescriptorSet0.fp_c3)._m0[int(_816)][_818];
                int _822 = _588 + 184;
                uint _824 = uint(int(uint(_822) >> uint(2)));
                uint _826 = uint(int(uint(int(_824)) >> uint(2)));
                int _828 = int(_824) & 3;
                float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
                int _832 = int(_824) + 1;
                uint _834 = uint(int(uint(_832) >> uint(2)));
                int _836 = _832 & 3;
                float _838 = (*spvDescriptorSet0.fp_c3)._m0[int(_834)][_836];
                float _840 = fma(_768, _792, _780);
                int _842 = _588 + 200;
                uint _844 = uint(int(uint(_842) >> uint(2)));
                uint _846 = uint(int(uint(int(_844)) >> uint(2)));
                int _848 = int(_844) & 3;
                float _850 = (*spvDescriptorSet0.fp_c3)._m0[int(_846)][_848];
                int _852 = int(_844) + 1;
                uint _854 = uint(int(uint(_852) >> uint(2)));
                int _856 = _852 & 3;
                float _858 = (*spvDescriptorSet0.fp_c3)._m0[int(_854)][_856];
                float _860 = fma(_108, _800, _840);
                float _862 = fma(_768, _812, _802);
                float _864 = fma(_108, _820, _862);
                float _866 = 1.0 / _864;
                float _868 = fma(_768, _830, _778);
                float _870 = fma(_108, _838, _868);
                float _872 = fma(_768, _850, _782);
                float _874 = fma(_108, _858, _872);
                float _876 = _870 * _866;
                float _878 = _860 * _866;
                float _880 = _874 * _866;
                float _882 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[50].w, _876);
                float _884 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[50].z, _878);
                float _886 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[50].z, _878);
                float _888 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[50].w, _876);
                float3 _2117 = float3(_886, _882, float(int(_656)));
                float3 _2121 = select(_2117, float3(0.0), isnan(_2117));
                float _890 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2121.xy, uint(rint(_2121.z)), _880, level(_670));
                float3 _2131 = float3(_884, _882, float(int(_656)));
                float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
                float _892 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2133.xy, uint(rint(_2133.z)), _880, level(_670));
                float3 _2143 = float3(_884, _888, float(int(_656)));
                float3 _2145 = select(_2143, float3(0.0), isnan(_2143));
                float _894 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2145.xy, uint(rint(_2145.z)), _880, level(_670));
                float3 _2155 = float3(_886, _888, float(int(_656)));
                float3 _2157 = select(_2155, float3(0.0), isnan(_2155));
                float _896 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2157.xy, uint(rint(_2157.z)), _880, level(_670));
                int _898 = _678 + 1;
                float _900 = _676 + 1.0;
                bool _902 = _898 >= _477;
                float _904 = _892 + _890;
                float _906 = _904 + _894;
                float _908 = _906 + _896;
                float _910 = _908 * 0.25;
                float _912 = fma(_910, (*spvDescriptorSet0.fp_c3)._m0[50].x, (*spvDescriptorSet0.fp_c3)._m0[50].y);
                _914 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[8].x, _680);
                _674 = !_902;
                _425 = _900;
                _672 = _898;
                _427 = _914;
                _433 = _900;
                _435 = int(_656);
                _437 = as_type<int>(_912);
                _439 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[50].x);
            } while (_674);
            _485 = as_type<int>(_914);
        }
        int _916 = _429;
        int _918 = _431;
        float _920 = _433;
        int _922 = _435;
        int _924 = _437;
        int _926 = _439;
        _928 = _485;
        int _930 = _393 + 1;
        bool _932 = _930 >= 8;
        _391 = !_932;
        _371 = _930;
        _375 = _928;
        _377 = _916;
        _379 = _918;
        _381 = _920;
        _383 = _922;
        _385 = _924;
        _387 = _926;
    } while (_391);
    out.m_41.x = as_type<float>(_928);
    out.m_41.y = as_type<float>(_928);
    out.m_41.z = as_type<float>(_928);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _966 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_966, float2(0.0), isnan(_966))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_966, float2(0.0), isnan(_966))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_36.w;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _86 = 1.0 / _84;
    float _88 = _86 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _98 = abs(_90);
    float _100 = log2(_98);
    float _102 = _88 * (*spvDescriptorSet0.fp_c3)._m0[46].x;
    float _104 = _88 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _106 = _62 * _76;
    float _108 = _62 * _82;
    float _110 = abs(_92);
    float _112 = log2(_110);
    float _114 = abs(_94);
    float _116 = log2(_114);
    float _118 = _88 * (*spvDescriptorSet0.fp_c3)._m0[49].x;
    float _120 = _100 * _70;
    float _122 = abs(_96);
    float _124 = log2(_122);
    float _126 = _112 * _70;
    float _128 = abs(_102);
    float _130 = log2(_128);
    float _132 = _116 * _70;
    float _134 = abs(_104);
    float _136 = log2(_134);
    float _138 = _124 * _70;
    float _140 = _130 * _70;
    float _142 = exp2(_132);
    float _144 = _136 * _70;
    float _146 = exp2(_126);
    float _148 = exp2(_138);
    float _150 = exp2(_140);
    float _152 = exp2(_120);
    float _154 = exp2(_144);
    float _156 = -_68;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _160 = abs(_118);
    float _162 = log2(_160);
    float _164 = 1.0 / _158;
    float _166 = _162 * _70;
    float _168 = exp2(_166);
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _172 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[8].y, _170);
    float _174 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _176 = _172 * _88;
    float _178 = _174 * _146;
    float _180 = _174 * _148;
    float _182 = _174 * _142;
    float _184 = _174 * _150;
    float _186 = abs(_176);
    float _188 = log2(_186);
    float _190 = _174 * _152;
    float _192 = ceil(_178);
    int _195 = int(_192);
    float _197 = _188 * _70;
    float _199 = _174 * _154;
    float _201 = ceil(_180);
    float _203 = exp2(_197);
    float _205 = ceil(_182);
    float _207 = _174 * _168;
    float _209 = _174 * _203;
    float _211 = ceil(_184);
    float _213 = precise::min(_174, _209);
    float _215 = ceil(_190);
    float _217 = trunc(_213);
    int _219 = int(_217);
    float _221 = ceil(_199);
    int _223 = min(_195, _219);
    float _225 = ceil(_207);
    float _227 = float(_223);
    int _229 = ~_223;
    int _231 = _219 + _229;
    int _233 = _231 + 1;
    float _235 = -_227;
    float _237 = _201 + _235;
    float _239 = trunc(_237);
    int _241 = int(_239);
    int _243 = min(_241, _233);
    int _245 = _223 + _243;
    float _247 = float(_245);
    int _249 = ~_245;
    int _251 = _219 + _249;
    int _253 = _251 + 1;
    float _255 = -_247;
    float _257 = _205 + _255;
    float _259 = trunc(_257);
    int _261 = int(_259);
    int _263 = min(_261, _253);
    int _265 = _245 + _263;
    float _267 = float(_265);
    int _269 = ~_265;
    int _271 = _219 + _269;
    int _273 = _271 + 1;
    float _275 = -_267;
    float _277 = _211 + _275;
    float _279 = trunc(_277);
    int _281 = int(_279);
    int _283 = min(_281, _273);
    int _285 = _265 + _283;
    float _287 = float(_285);
    int _289 = ~_285;
    int _291 = _219 + _289;
    int _293 = _291 + 1;
    float _295 = -_287;
    float _297 = _215 + _295;
    float _299 = trunc(_297);
    int _301 = int(_299);
    float _303 = in.m_36.x;
    float _305 = gl_FragCoord.w;
    float _307 = _303 * _305;
    int _309 = min(_301, _293);
    int _311 = _285 + _309;
    float _313 = float(_311);
    int _315 = ~_311;
    int _317 = _219 + _315;
    int _319 = _317 + 1;
    float _321 = -_313;
    float _323 = _221 + _321;
    float _325 = trunc(_323);
    int _327 = int(_325);
    float _329 = _62 * _307;
    int _331 = min(_327, _319);
    float _333 = in.m_36.z;
    float _335 = gl_FragCoord.w;
    float _337 = _333 * _335;
    int _339 = _311 + _331;
    float _341 = float(_339);
    int _343 = ~_339;
    int _345 = _219 + _343;
    int _347 = _345 + 1;
    float _349 = -_341;
    float _351 = _225 + _349;
    float _353 = trunc(_351);
    int _355 = int(_353);
    float _357 = _62 * _337;
    int _359 = min(_355, _347);
    int _361 = ~_339;
    int _363 = ~_359;
    int _365 = _219 + _361;
    int _367 = _365 + _363;
    int _369 = _367 + 2;
    int _371 = 0;
    int _373 = 0;
    int _375 = 0;
    int _377 = 0;
    int _379 = 0;
    float _381 = 0.0;
    int _383 = 0;
    int _385 = 0;
    int _387 = 0;
    bool _391;
    bool _674;
    float _914;
    int _928;
    do
    {
        int _393 = _371;
        int _395 = _373;
        int _397 = _375;
        int _399 = _377;
        int _401 = _379;
        float _403 = _381;
        int _405 = _383;
        int _407 = _385;
        int _409 = _387;
        int _411 = _393 << 2;
        bool _413 = _411 == 0;
        bool _415 = _411 == 4;
        bool _417 = _411 == 8;
        bool _419 = _411 == 12;
        int _421 = _395;
        int _423 = _411;
        float _425 = _403;
        float _427 = as_type<float>(_397);
        int _429 = _399;
        int _431 = _401;
        float _433 = _403;
        int _435 = _405;
        int _437 = _407;
        int _439 = _409;
        if (_413)
        {
            _421 = _223;
        }
        int _441 = _421;
        bool _443 = _411 == 16;
        int _445 = _441;
        if (_415)
        {
            _445 = _243;
        }
        int _447 = _445;
        int _449 = _447;
        if (_417)
        {
            _449 = _263;
        }
        int _451 = _449;
        bool _453 = _411 == 20;
        bool _455 = _411 == 24;
        int _457 = _451;
        if (_419)
        {
            _457 = _283;
        }
        int _459 = _457;
        bool _461 = _411 == 28;
        int _463 = _459;
        if (_443)
        {
            _463 = _309;
        }
        int _465 = _463;
        int _467 = _465;
        if (_453)
        {
            _467 = _331;
        }
        int _469 = _467;
        int _471 = _469;
        if (_455)
        {
            _471 = _359;
        }
        int _473 = _471;
        int _475 = _473;
        if (_461)
        {
            _475 = _369;
        }
        int _477 = _475;
        bool _479 = _477 > 0;
        _373 = _477;
        if (!_479)
        {
            _423 = _397;
        }
        int _481 = _423;
        bool _483 = !_479;
        int _485 = _481;
        if (!_483)
        {
            float _487 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[51].x));
            float _489 = in.m_38.x;
            float _491 = gl_FragCoord.w;
            float _493 = _489 * _491;
            int _495 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].y));
            float _497 = in.m_38.z;
            float _499 = gl_FragCoord.w;
            float _501 = _497 * _499;
            float _503 = float(uint(_393));
            float _505 = 1.0 / _487;
            float _507 = float(uint(_495));
            int _509 = abs(_393);
            float _511 = float(uint(_509));
            float _513 = 1.0 / _507;
            int _515 = as_type<int>(_505) + (-2);
            float _517 = as_type<float>(_515) * _503;
            int _519 = as_type<int>(_513) + (-2);
            float _521 = trunc(_517);
            float _523 = precise::max(_521, 0.0);
            uint _526 = uint(_523);
            float _528 = _62 * _493;
            float _530 = as_type<float>(_519) * _511;
            float _532 = _62 * _501;
            float _534 = trunc(_530);
            float _536 = precise::max(_534, 0.0);
            uint _538 = uint(_536);
            int _540 = ~int(_526);
            int _542 = _540 + 1;
            int _544 = _542 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _546 = _544 + _393;
            int _548 = ~int(_538);
            int _550 = _548 + 1;
            float _552 = float(uint(_546));
            int _554 = _550 * _495;
            int _556 = _554 + _509;
            float _558 = as_type<float>(_515) * _552;
            float _560 = float(uint(_556));
            float _562 = trunc(_558);
            float _564 = precise::max(_562, 0.0);
            uint _566 = uint(_564);
            float _568 = as_type<float>(_519) * _560;
            float _570 = trunc(_568);
            float _572 = precise::max(_570, 0.0);
            uint _574 = uint(_572);
            int _576 = int(_526) + int(_566);
            int _578 = ~_576;
            int _580 = _578 + 1;
            int _582 = int(_538) + int(_574);
            int _584 = _580 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _586 = _584 + _393;
            int _588 = _393 * 64;
            int _590 = -_582;
            bool _592 = uint(_586) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            float _594 = in.m_38.y;
            float _596 = gl_FragCoord.w;
            float _598 = _594 * _596;
            int _600 = _590 * _495;
            int _602 = _600 + _509;
            bool _604 = !_592;
            int _606 = _604 ? 0 : (-1);
            bool _608 = uint(_602) >= uint(_495);
            int _610 = ~_576;
            int _612 = _610 + _606;
            int _614 = _612 + 1;
            int _616 = _393 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].y);
            bool _618 = !_608;
            int _620 = _618 ? 0 : (-1);
            uint _622 = uint(int(uint(_616) >> uint(31)));
            int _624 = _614 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _626 = _624 + _393;
            bool _628 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].x);
            int _630 = ~_620;
            int _632 = _582 + _630;
            int _634 = _632 + 1;
            bool _636 = !_628;
            int _638 = _636 ? _626 : (-1);
            int _640 = ~int(_622);
            int _642 = _640 + 1;
            float _644 = float(_638);
            int _646 = _634 ^ _642;
            bool _648 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[51].y);
            float _650 = rint(_644);
            float _652 = precise::max(_650, 0.0);
            uint _654 = uint(_652);
            uint _656 = clamp(_654, 0u, 65535u);
            int _658 = ~_642;
            int _660 = _658 + _646;
            int _662 = _660 + 1;
            float _664 = _62 * _598;
            bool _666 = !_648;
            int _668 = _666 ? _662 : (-1);
            float _670 = float(_668);
            int _672 = 0;
            _429 = as_type<int>(_528);
            _431 = as_type<int>(_532);
            do
            {
                float _676 = _425;
                int _678 = _672;
                float _680 = _427;
                float _682 = _676 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _684 = _588 + 176;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                uint _688 = uint(int(uint(int(_686)) >> uint(2)));
                int _690 = int(_686) & 3;
                float _692 = (*spvDescriptorSet0.fp_c3)._m0[int(_688)][_690];
                int _694 = int(_686) + 1;
                uint _696 = uint(int(uint(_694) >> uint(2)));
                int _698 = _694 & 3;
                float _700 = (*spvDescriptorSet0.fp_c3)._m0[int(_696)][_698];
                float _702 = abs(_682);
                float _704 = log2(_702);
                int _706 = _588 + 160;
                uint _708 = uint(int(uint(_706) >> uint(2)));
                uint _710 = uint(int(uint(int(_708)) >> uint(2)));
                int _712 = int(_708) & 3;
                float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
                int _716 = int(_708) + 1;
                uint _718 = uint(int(uint(_716) >> uint(2)));
                int _720 = _716 & 3;
                float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
                int _724 = _588 + 192;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                uint _728 = uint(int(uint(int(_726)) >> uint(2)));
                int _730 = int(_726) & 3;
                float _732 = (*spvDescriptorSet0.fp_c3)._m0[int(_728)][_730];
                int _734 = int(_726) + 1;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                int _738 = _734 & 3;
                float _740 = (*spvDescriptorSet0.fp_c3)._m0[int(_736)][_738];
                float _742 = _704 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _744 = _588 + 208;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                uint _748 = uint(int(uint(int(_746)) >> uint(2)));
                int _750 = int(_746) & 3;
                float _752 = (*spvDescriptorSet0.fp_c3)._m0[int(_748)][_750];
                int _754 = int(_746) + 1;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                int _758 = _754 & 3;
                float _760 = (*spvDescriptorSet0.fp_c3)._m0[int(_756)][_758];
                float _762 = exp2(_742);
                float _764 = fma(_762, _664, _106);
                float _766 = fma(_762, _528, _329);
                float _768 = fma(_762, _532, _357);
                float _770 = _764 * _700;
                float _772 = _764 * _722;
                float _774 = _764 * _740;
                float _776 = _764 * _760;
                float _778 = fma(_766, _692, _770);
                float _780 = fma(_766, _714, _772);
                float _782 = fma(_766, _732, _774);
                int _784 = _588 + 168;
                uint _786 = uint(int(uint(_784) >> uint(2)));
                uint _788 = uint(int(uint(int(_786)) >> uint(2)));
                int _790 = int(_786) & 3;
                float _792 = (*spvDescriptorSet0.fp_c3)._m0[int(_788)][_790];
                int _794 = int(_786) + 1;
                uint _796 = uint(int(uint(_794) >> uint(2)));
                int _798 = _794 & 3;
                float _800 = (*spvDescriptorSet0.fp_c3)._m0[int(_796)][_798];
                float _802 = fma(_766, _752, _776);
                int _804 = _588 + 216;
                uint _806 = uint(int(uint(_804) >> uint(2)));
                uint _808 = uint(int(uint(int(_806)) >> uint(2)));
                int _810 = int(_806) & 3;
                float _812 = (*spvDescriptorSet0.fp_c3)._m0[int(_808)][_810];
                int _814 = int(_806) + 1;
                uint _816 = uint(int(uint(_814) >> uint(2)));
                int _818 = _814 & 3;
                float _820 = (*spvDescriptorSet0.fp_c3)._m0[int(_816)][_818];
                int _822 = _588 + 184;
                uint _824 = uint(int(uint(_822) >> uint(2)));
                uint _826 = uint(int(uint(int(_824)) >> uint(2)));
                int _828 = int(_824) & 3;
                float _830 = (*spvDescriptorSet0.fp_c3)._m0[int(_826)][_828];
                int _832 = int(_824) + 1;
                uint _834 = uint(int(uint(_832) >> uint(2)));
                int _836 = _832 & 3;
                float _838 = (*spvDescriptorSet0.fp_c3)._m0[int(_834)][_836];
                float _840 = fma(_768, _792, _780);
                int _842 = _588 + 200;
                uint _844 = uint(int(uint(_842) >> uint(2)));
                uint _846 = uint(int(uint(int(_844)) >> uint(2)));
                int _848 = int(_844) & 3;
                float _850 = (*spvDescriptorSet0.fp_c3)._m0[int(_846)][_848];
                int _852 = int(_844) + 1;
                uint _854 = uint(int(uint(_852) >> uint(2)));
                int _856 = _852 & 3;
                float _858 = (*spvDescriptorSet0.fp_c3)._m0[int(_854)][_856];
                float _860 = fma(_108, _800, _840);
                float _862 = fma(_768, _812, _802);
                float _864 = fma(_108, _820, _862);
                float _866 = 1.0 / _864;
                float _868 = fma(_768, _830, _778);
                float _870 = fma(_108, _838, _868);
                float _872 = fma(_768, _850, _782);
                float _874 = fma(_108, _858, _872);
                float _876 = _870 * _866;
                float _878 = _860 * _866;
                float _880 = _874 * _866;
                float _882 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[50].w, _876);
                float _884 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[50].z, _878);
                float _886 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[50].z, _878);
                float _888 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[50].w, _876);
                float3 _2117 = float3(_886, _882, float(int(_656)));
                float3 _2121 = select(_2117, float3(0.0), isnan(_2117));
                float _890 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2121.xy, uint(rint(_2121.z)), _880, level(_670));
                float3 _2131 = float3(_884, _882, float(int(_656)));
                float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
                float _892 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2133.xy, uint(rint(_2133.z)), _880, level(_670));
                float3 _2143 = float3(_884, _888, float(int(_656)));
                float3 _2145 = select(_2143, float3(0.0), isnan(_2143));
                float _894 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2145.xy, uint(rint(_2145.z)), _880, level(_670));
                float3 _2155 = float3(_886, _888, float(int(_656)));
                float3 _2157 = select(_2155, float3(0.0), isnan(_2155));
                float _896 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2157.xy, uint(rint(_2157.z)), _880, level(_670));
                int _898 = _678 + 1;
                float _900 = _676 + 1.0;
                bool _902 = _898 >= _477;
                float _904 = _892 + _890;
                float _906 = _904 + _894;
                float _908 = _906 + _896;
                float _910 = _908 * 0.25;
                float _912 = fma(_910, (*spvDescriptorSet0.fp_c3)._m0[50].x, (*spvDescriptorSet0.fp_c3)._m0[50].y);
                _914 = fma(_912, (*spvDescriptorSet0.fp_c3)._m0[8].x, _680);
                _674 = !_902;
                _425 = _900;
                _672 = _898;
                _427 = _914;
                _433 = _900;
                _435 = int(_656);
                _437 = as_type<int>(_912);
                _439 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[50].x);
            } while (_674);
            _485 = as_type<int>(_914);
        }
        int _916 = _429;
        int _918 = _431;
        float _920 = _433;
        int _922 = _435;
        int _924 = _437;
        int _926 = _439;
        _928 = _485;
        int _930 = _393 + 1;
        bool _932 = _930 >= 8;
        _391 = !_932;
        _371 = _930;
        _375 = _928;
        _377 = _916;
        _379 = _918;
        _381 = _920;
        _383 = _922;
        _385 = _924;
        _387 = _926;
    } while (_391);
    out.m_41.x = as_type<float>(_928);
    out.m_41.y = as_type<float>(_928);
    out.m_41.z = as_type<float>(_928);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

