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
    float2 _924 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_924, float2(0.0), isnan(_924))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_924, float2(0.0), isnan(_924))).x;
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
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _98 = abs(_90);
    float _100 = log2(_98);
    float _102 = _88 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _104 = _88 * (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _106 = _62 * _76;
    float _108 = _62 * _82;
    float _110 = abs(_92);
    float _112 = log2(_110);
    float _114 = abs(_94);
    float _116 = log2(_114);
    float _118 = _112 * _70;
    float _120 = abs(_96);
    float _122 = log2(_120);
    float _124 = _116 * _70;
    float _126 = exp2(_118);
    float _128 = _100 * _70;
    float _130 = abs(_104);
    float _132 = log2(_130);
    float _134 = _122 * _70;
    float _136 = exp2(_134);
    float _138 = _132 * _70;
    float _140 = -_68;
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _144 = abs(_102);
    float _146 = log2(_144);
    float _148 = 1.0 / _142;
    float _150 = _146 * _70;
    float _152 = exp2(_128);
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _156 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[8].y, _154);
    float _158 = exp2(_124);
    float _160 = _156 * _88;
    float _162 = abs(_160);
    float _164 = log2(_162);
    float _166 = exp2(_150);
    float _168 = _164 * _70;
    float _170 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _172 = exp2(_138);
    float _174 = in.m_36.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _170 * _126;
    float _182 = _170 * _158;
    float _184 = _170 * _152;
    float _186 = _170 * _136;
    float _188 = exp2(_168);
    float _190 = _170 * _166;
    float _192 = ceil(_180);
    int _195 = int(_192);
    float _197 = _170 * _172;
    float _199 = _170 * _188;
    float _201 = ceil(_182);
    float _203 = precise::min(_170, _199);
    float _205 = ceil(_184);
    float _207 = _62 * _178;
    float _209 = trunc(_203);
    int _211 = int(_209);
    float _213 = ceil(_186);
    int _215 = min(_195, _211);
    float _217 = ceil(_190);
    float _219 = float(_215);
    int _221 = ~_215;
    int _223 = _211 + _221;
    int _225 = _223 + 1;
    float _227 = -_219;
    float _229 = _201 + _227;
    float _231 = ceil(_197);
    float _233 = trunc(_229);
    int _235 = int(_233);
    int _237 = min(_235, _225);
    int _239 = _215 + _237;
    float _241 = float(_239);
    int _243 = ~_239;
    int _245 = _211 + _243;
    int _247 = _245 + 1;
    float _249 = -_241;
    float _251 = _205 + _249;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = min(_255, _247);
    int _259 = _239 + _257;
    float _261 = float(_259);
    int _263 = ~_259;
    int _265 = _211 + _263;
    int _267 = _265 + 1;
    float _269 = -_261;
    float _271 = _213 + _269;
    float _273 = trunc(_271);
    int _275 = int(_273);
    int _277 = min(_275, _267);
    float _279 = in.m_36.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    int _285 = _259 + _277;
    float _287 = float(_285);
    int _289 = ~_285;
    int _291 = _211 + _289;
    int _293 = _291 + 1;
    float _295 = -_287;
    float _297 = _217 + _295;
    float _299 = trunc(_297);
    int _301 = int(_299);
    float _303 = _62 * _283;
    int _305 = min(_301, _293);
    int _307 = _285 + _305;
    float _309 = float(_307);
    int _311 = ~_307;
    int _313 = _211 + _311;
    int _315 = _313 + 1;
    float _317 = -_309;
    float _319 = _231 + _317;
    float _321 = trunc(_319);
    int _323 = int(_321);
    int _325 = min(_323, _315);
    int _327 = ~_307;
    int _329 = ~_325;
    int _331 = _211 + _327;
    int _333 = _331 + _329;
    int _335 = _333 + 2;
    int _337 = 0;
    int _339 = 0;
    int _341 = 0;
    int _343 = 0;
    int _345 = 0;
    float _347 = 0.0;
    int _349 = 0;
    int _351 = 0;
    int _353 = 0;
    bool _357;
    bool _632;
    float _872;
    int _886;
    do
    {
        int _359 = _337;
        int _361 = _339;
        int _363 = _341;
        int _365 = _343;
        int _367 = _345;
        float _369 = _347;
        int _371 = _349;
        int _373 = _351;
        int _375 = _353;
        int _377 = _359 << 2;
        bool _379 = _377 == 0;
        bool _381 = _377 == 4;
        bool _383 = _377 == 8;
        bool _385 = _377 == 12;
        int _387 = _361;
        int _389 = _377;
        float _391 = _369;
        float _393 = as_type<float>(_363);
        int _395 = _365;
        int _397 = _367;
        float _399 = _369;
        int _401 = _371;
        int _403 = _373;
        int _405 = _375;
        if (_379)
        {
            _387 = _215;
        }
        int _407 = _387;
        bool _409 = _377 == 16;
        int _411 = _407;
        if (_381)
        {
            _411 = _237;
        }
        int _413 = _411;
        int _415 = _413;
        if (_383)
        {
            _415 = _257;
        }
        int _417 = _415;
        bool _419 = _377 == 20;
        bool _421 = _377 == 24;
        int _423 = _417;
        if (_385)
        {
            _423 = _277;
        }
        int _425 = _423;
        int _427 = _425;
        if (_409)
        {
            _427 = _305;
        }
        int _429 = _427;
        int _431 = _429;
        if (_419)
        {
            _431 = _325;
        }
        int _433 = _431;
        int _435 = _433;
        if (_421)
        {
            _435 = _335;
        }
        int _437 = _435;
        bool _439 = _437 > 0;
        _339 = _437;
        if (!_439)
        {
            _389 = _363;
        }
        int _441 = _389;
        bool _443 = !_439;
        int _445 = _441;
        if (!_443)
        {
            float _447 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[46].x));
            float _449 = in.m_38.x;
            float _451 = gl_FragCoord.w;
            float _453 = _449 * _451;
            int _455 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].y));
            float _457 = in.m_38.z;
            float _459 = gl_FragCoord.w;
            float _461 = _457 * _459;
            float _463 = float(uint(_359));
            float _465 = float(uint(_455));
            float _467 = 1.0 / _447;
            int _469 = abs(_359);
            float _471 = float(uint(_469));
            int _473 = _359 << 6;
            float _475 = 1.0 / _465;
            int _477 = as_type<int>(_467) + (-2);
            float _479 = as_type<float>(_477) * _463;
            int _481 = as_type<int>(_475) + (-2);
            float _483 = _62 * _453;
            float _485 = trunc(_479);
            float _487 = precise::max(_485, 0.0);
            uint _490 = uint(_487);
            float _492 = _62 * _461;
            float _494 = as_type<float>(_481) * _471;
            float _496 = trunc(_494);
            float _498 = precise::max(_496, 0.0);
            uint _500 = uint(_498);
            int _502 = -int(_490);
            int _504 = _502 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _506 = _504 + _359;
            int _508 = ~int(_500);
            int _510 = _508 + 1;
            float _512 = float(uint(_506));
            int _514 = _510 * _455;
            int _516 = _514 + _469;
            float _518 = as_type<float>(_477) * _512;
            float _520 = float(uint(_516));
            float _522 = trunc(_518);
            float _524 = precise::max(_522, 0.0);
            uint _526 = uint(_524);
            float _528 = as_type<float>(_481) * _520;
            float _530 = trunc(_528);
            float _532 = precise::max(_530, 0.0);
            uint _534 = uint(_532);
            int _536 = int(_490) + int(_526);
            int _538 = ~_536;
            int _540 = _538 + 1;
            int _542 = int(_500) + int(_534);
            int _544 = _540 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _546 = _544 + _359;
            int _548 = ~_542;
            int _550 = _548 + 1;
            bool _552 = uint(_546) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            float _554 = in.m_38.y;
            float _556 = gl_FragCoord.w;
            float _558 = _554 * _556;
            int _560 = _550 * _455;
            int _562 = _560 + _469;
            bool _564 = !_552;
            int _566 = _564 ? 0 : (-1);
            bool _568 = uint(_562) >= uint(_455);
            int _570 = -_536;
            int _572 = _566 + _570;
            int _574 = _359 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].y);
            bool _576 = !_568;
            int _578 = _576 ? 0 : (-1);
            uint _580 = uint(int(uint(_574) >> uint(31)));
            int _582 = _572 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _584 = _582 + _359;
            bool _586 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _588 = ~_578;
            int _590 = _542 + _588;
            int _592 = _590 + 1;
            bool _594 = !_586;
            int _596 = _594 ? _584 : (-1);
            int _598 = ~int(_580);
            int _600 = _598 + 1;
            float _602 = float(_596);
            int _604 = _592 ^ _600;
            bool _606 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].y);
            float _608 = rint(_602);
            float _610 = precise::max(_608, 0.0);
            uint _612 = uint(_610);
            uint _614 = clamp(_612, 0u, 65535u);
            int _616 = ~_600;
            int _618 = _616 + _604;
            int _620 = _618 + 1;
            float _622 = _62 * _558;
            bool _624 = !_606;
            int _626 = _624 ? _620 : (-1);
            float _628 = float(_626);
            int _630 = 0;
            _395 = as_type<int>(_483);
            _397 = as_type<int>(_492);
            do
            {
                float _634 = _391;
                int _636 = _630;
                float _638 = _393;
                float _640 = _634 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _642 = _473 + 176;
                uint _644 = uint(int(uint(_642) >> uint(2)));
                uint _646 = uint(int(uint(int(_644)) >> uint(2)));
                int _648 = int(_644) & 3;
                float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
                int _652 = int(_644) + 1;
                uint _654 = uint(int(uint(_652) >> uint(2)));
                int _656 = _652 & 3;
                float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
                float _660 = abs(_640);
                float _662 = log2(_660);
                int _664 = _473 + 160;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                uint _668 = uint(int(uint(int(_666)) >> uint(2)));
                int _670 = int(_666) & 3;
                float _672 = (*spvDescriptorSet0.fp_c3)._m0[int(_668)][_670];
                int _674 = int(_666) + 1;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                int _678 = _674 & 3;
                float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
                int _682 = _473 + 192;
                uint _684 = uint(int(uint(_682) >> uint(2)));
                uint _686 = uint(int(uint(int(_684)) >> uint(2)));
                int _688 = int(_684) & 3;
                float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
                int _692 = int(_684) + 1;
                uint _694 = uint(int(uint(_692) >> uint(2)));
                int _696 = _692 & 3;
                float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
                float _700 = _662 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _702 = _473 + 208;
                uint _704 = uint(int(uint(_702) >> uint(2)));
                uint _706 = uint(int(uint(int(_704)) >> uint(2)));
                int _708 = int(_704) & 3;
                float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
                int _712 = int(_704) + 1;
                uint _714 = uint(int(uint(_712) >> uint(2)));
                int _716 = _712 & 3;
                float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
                float _720 = exp2(_700);
                float _722 = fma(_720, _622, _106);
                float _724 = fma(_720, _483, _303);
                float _726 = fma(_720, _492, _207);
                float _728 = _722 * _658;
                float _730 = _722 * _680;
                float _732 = _722 * _718;
                float _734 = fma(_724, _650, _728);
                float _736 = fma(_724, _672, _730);
                int _738 = _473 + 216;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                uint _742 = uint(int(uint(int(_740)) >> uint(2)));
                int _744 = int(_740) & 3;
                float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
                int _748 = int(_740) + 1;
                uint _750 = uint(int(uint(_748) >> uint(2)));
                int _752 = _748 & 3;
                float _754 = (*spvDescriptorSet0.fp_c3)._m0[int(_750)][_752];
                float _756 = _722 * _698;
                float _758 = fma(_724, _690, _756);
                float _760 = fma(_724, _710, _732);
                int _762 = _473 + 168;
                uint _764 = uint(int(uint(_762) >> uint(2)));
                uint _766 = uint(int(uint(int(_764)) >> uint(2)));
                int _768 = int(_764) & 3;
                float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
                int _772 = int(_764) + 1;
                uint _774 = uint(int(uint(_772) >> uint(2)));
                int _776 = _772 & 3;
                float _778 = (*spvDescriptorSet0.fp_c3)._m0[int(_774)][_776];
                int _780 = _473 + 184;
                uint _782 = uint(int(uint(_780) >> uint(2)));
                uint _784 = uint(int(uint(int(_782)) >> uint(2)));
                int _786 = int(_782) & 3;
                float _788 = (*spvDescriptorSet0.fp_c3)._m0[int(_784)][_786];
                int _790 = int(_782) + 1;
                uint _792 = uint(int(uint(_790) >> uint(2)));
                int _794 = _790 & 3;
                float _796 = (*spvDescriptorSet0.fp_c3)._m0[int(_792)][_794];
                int _798 = _473 + 200;
                uint _800 = uint(int(uint(_798) >> uint(2)));
                uint _802 = uint(int(uint(int(_800)) >> uint(2)));
                int _804 = int(_800) & 3;
                float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
                int _808 = int(_800) + 1;
                uint _810 = uint(int(uint(_808) >> uint(2)));
                int _812 = _808 & 3;
                float _814 = (*spvDescriptorSet0.fp_c3)._m0[int(_810)][_812];
                float _816 = fma(_726, _746, _760);
                float _818 = fma(_726, _770, _736);
                float _820 = fma(_108, _754, _816);
                float _822 = fma(_108, _778, _818);
                float _824 = 1.0 / _820;
                float _826 = fma(_726, _788, _734);
                float _828 = fma(_108, _796, _826);
                float _830 = fma(_726, _806, _758);
                float _832 = fma(_108, _814, _830);
                float _834 = _828 * _824;
                float _836 = _822 * _824;
                float _838 = _832 * _824;
                float _840 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[45].w, _834);
                float _842 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[45].z, _836);
                float _844 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[45].z, _836);
                float _846 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[45].w, _834);
                float3 _2021 = float3(_844, _840, float(int(_614)));
                float3 _2025 = select(_2021, float3(0.0), isnan(_2021));
                float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2025.xy, uint(rint(_2025.z)), _838, level(_628));
                float3 _2035 = float3(_842, _840, float(int(_614)));
                float3 _2037 = select(_2035, float3(0.0), isnan(_2035));
                float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2037.xy, uint(rint(_2037.z)), _838, level(_628));
                float3 _2047 = float3(_842, _846, float(int(_614)));
                float3 _2049 = select(_2047, float3(0.0), isnan(_2047));
                float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2049.xy, uint(rint(_2049.z)), _838, level(_628));
                float3 _2059 = float3(_844, _846, float(int(_614)));
                float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
                float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2061.xy, uint(rint(_2061.z)), _838, level(_628));
                int _856 = _636 + 1;
                float _858 = _634 + 1.0;
                bool _860 = _856 >= _437;
                float _862 = _850 + _848;
                float _864 = _862 + _852;
                float _866 = _864 + _854;
                float _868 = _866 * 0.25;
                float _870 = fma(_868, (*spvDescriptorSet0.fp_c3)._m0[45].x, (*spvDescriptorSet0.fp_c3)._m0[45].y);
                _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[8].x, _638);
                _632 = !_860;
                _391 = _858;
                _630 = _856;
                _393 = _872;
                _399 = _858;
                _401 = as_type<int>(_868);
                _403 = as_type<int>(_870);
                _405 = int(_614);
            } while (_632);
            _445 = as_type<int>(_872);
        }
        int _874 = _395;
        int _876 = _397;
        float _878 = _399;
        int _880 = _401;
        int _882 = _403;
        int _884 = _405;
        _886 = _445;
        int _888 = _359 + 1;
        bool _890 = _888 >= 7;
        _357 = !_890;
        _337 = _888;
        _341 = _886;
        _343 = _874;
        _345 = _876;
        _347 = _878;
        _349 = _880;
        _351 = _882;
        _353 = _884;
    } while (_357);
    out.m_41.x = as_type<float>(_886);
    out.m_41.y = as_type<float>(_886);
    out.m_41.z = as_type<float>(_886);
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
    float2 _924 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_924, float2(0.0), isnan(_924))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_924, float2(0.0), isnan(_924))).x;
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
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _98 = abs(_90);
    float _100 = log2(_98);
    float _102 = _88 * (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _104 = _88 * (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _106 = _62 * _76;
    float _108 = _62 * _82;
    float _110 = abs(_92);
    float _112 = log2(_110);
    float _114 = abs(_94);
    float _116 = log2(_114);
    float _118 = _112 * _70;
    float _120 = abs(_96);
    float _122 = log2(_120);
    float _124 = _116 * _70;
    float _126 = exp2(_118);
    float _128 = _100 * _70;
    float _130 = abs(_104);
    float _132 = log2(_130);
    float _134 = _122 * _70;
    float _136 = exp2(_134);
    float _138 = _132 * _70;
    float _140 = -_68;
    float _142 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _144 = abs(_102);
    float _146 = log2(_144);
    float _148 = 1.0 / _142;
    float _150 = _146 * _70;
    float _152 = exp2(_128);
    float _154 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _156 = fma(_148, (*spvDescriptorSet0.fp_c3)._m0[8].y, _154);
    float _158 = exp2(_124);
    float _160 = _156 * _88;
    float _162 = abs(_160);
    float _164 = log2(_162);
    float _166 = exp2(_150);
    float _168 = _164 * _70;
    float _170 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _172 = exp2(_138);
    float _174 = in.m_36.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = _170 * _126;
    float _182 = _170 * _158;
    float _184 = _170 * _152;
    float _186 = _170 * _136;
    float _188 = exp2(_168);
    float _190 = _170 * _166;
    float _192 = ceil(_180);
    int _195 = int(_192);
    float _197 = _170 * _172;
    float _199 = _170 * _188;
    float _201 = ceil(_182);
    float _203 = precise::min(_170, _199);
    float _205 = ceil(_184);
    float _207 = _62 * _178;
    float _209 = trunc(_203);
    int _211 = int(_209);
    float _213 = ceil(_186);
    int _215 = min(_195, _211);
    float _217 = ceil(_190);
    float _219 = float(_215);
    int _221 = ~_215;
    int _223 = _211 + _221;
    int _225 = _223 + 1;
    float _227 = -_219;
    float _229 = _201 + _227;
    float _231 = ceil(_197);
    float _233 = trunc(_229);
    int _235 = int(_233);
    int _237 = min(_235, _225);
    int _239 = _215 + _237;
    float _241 = float(_239);
    int _243 = ~_239;
    int _245 = _211 + _243;
    int _247 = _245 + 1;
    float _249 = -_241;
    float _251 = _205 + _249;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = min(_255, _247);
    int _259 = _239 + _257;
    float _261 = float(_259);
    int _263 = ~_259;
    int _265 = _211 + _263;
    int _267 = _265 + 1;
    float _269 = -_261;
    float _271 = _213 + _269;
    float _273 = trunc(_271);
    int _275 = int(_273);
    int _277 = min(_275, _267);
    float _279 = in.m_36.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    int _285 = _259 + _277;
    float _287 = float(_285);
    int _289 = ~_285;
    int _291 = _211 + _289;
    int _293 = _291 + 1;
    float _295 = -_287;
    float _297 = _217 + _295;
    float _299 = trunc(_297);
    int _301 = int(_299);
    float _303 = _62 * _283;
    int _305 = min(_301, _293);
    int _307 = _285 + _305;
    float _309 = float(_307);
    int _311 = ~_307;
    int _313 = _211 + _311;
    int _315 = _313 + 1;
    float _317 = -_309;
    float _319 = _231 + _317;
    float _321 = trunc(_319);
    int _323 = int(_321);
    int _325 = min(_323, _315);
    int _327 = ~_307;
    int _329 = ~_325;
    int _331 = _211 + _327;
    int _333 = _331 + _329;
    int _335 = _333 + 2;
    int _337 = 0;
    int _339 = 0;
    int _341 = 0;
    int _343 = 0;
    int _345 = 0;
    float _347 = 0.0;
    int _349 = 0;
    int _351 = 0;
    int _353 = 0;
    bool _357;
    bool _632;
    float _872;
    int _886;
    do
    {
        int _359 = _337;
        int _361 = _339;
        int _363 = _341;
        int _365 = _343;
        int _367 = _345;
        float _369 = _347;
        int _371 = _349;
        int _373 = _351;
        int _375 = _353;
        int _377 = _359 << 2;
        bool _379 = _377 == 0;
        bool _381 = _377 == 4;
        bool _383 = _377 == 8;
        bool _385 = _377 == 12;
        int _387 = _361;
        int _389 = _377;
        float _391 = _369;
        float _393 = as_type<float>(_363);
        int _395 = _365;
        int _397 = _367;
        float _399 = _369;
        int _401 = _371;
        int _403 = _373;
        int _405 = _375;
        if (_379)
        {
            _387 = _215;
        }
        int _407 = _387;
        bool _409 = _377 == 16;
        int _411 = _407;
        if (_381)
        {
            _411 = _237;
        }
        int _413 = _411;
        int _415 = _413;
        if (_383)
        {
            _415 = _257;
        }
        int _417 = _415;
        bool _419 = _377 == 20;
        bool _421 = _377 == 24;
        int _423 = _417;
        if (_385)
        {
            _423 = _277;
        }
        int _425 = _423;
        int _427 = _425;
        if (_409)
        {
            _427 = _305;
        }
        int _429 = _427;
        int _431 = _429;
        if (_419)
        {
            _431 = _325;
        }
        int _433 = _431;
        int _435 = _433;
        if (_421)
        {
            _435 = _335;
        }
        int _437 = _435;
        bool _439 = _437 > 0;
        _339 = _437;
        if (!_439)
        {
            _389 = _363;
        }
        int _441 = _389;
        bool _443 = !_439;
        int _445 = _441;
        if (!_443)
        {
            float _447 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[46].x));
            float _449 = in.m_38.x;
            float _451 = gl_FragCoord.w;
            float _453 = _449 * _451;
            int _455 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].y));
            float _457 = in.m_38.z;
            float _459 = gl_FragCoord.w;
            float _461 = _457 * _459;
            float _463 = float(uint(_359));
            float _465 = float(uint(_455));
            float _467 = 1.0 / _447;
            int _469 = abs(_359);
            float _471 = float(uint(_469));
            int _473 = _359 << 6;
            float _475 = 1.0 / _465;
            int _477 = as_type<int>(_467) + (-2);
            float _479 = as_type<float>(_477) * _463;
            int _481 = as_type<int>(_475) + (-2);
            float _483 = _62 * _453;
            float _485 = trunc(_479);
            float _487 = precise::max(_485, 0.0);
            uint _490 = uint(_487);
            float _492 = _62 * _461;
            float _494 = as_type<float>(_481) * _471;
            float _496 = trunc(_494);
            float _498 = precise::max(_496, 0.0);
            uint _500 = uint(_498);
            int _502 = -int(_490);
            int _504 = _502 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _506 = _504 + _359;
            int _508 = ~int(_500);
            int _510 = _508 + 1;
            float _512 = float(uint(_506));
            int _514 = _510 * _455;
            int _516 = _514 + _469;
            float _518 = as_type<float>(_477) * _512;
            float _520 = float(uint(_516));
            float _522 = trunc(_518);
            float _524 = precise::max(_522, 0.0);
            uint _526 = uint(_524);
            float _528 = as_type<float>(_481) * _520;
            float _530 = trunc(_528);
            float _532 = precise::max(_530, 0.0);
            uint _534 = uint(_532);
            int _536 = int(_490) + int(_526);
            int _538 = ~_536;
            int _540 = _538 + 1;
            int _542 = int(_500) + int(_534);
            int _544 = _540 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _546 = _544 + _359;
            int _548 = ~_542;
            int _550 = _548 + 1;
            bool _552 = uint(_546) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            float _554 = in.m_38.y;
            float _556 = gl_FragCoord.w;
            float _558 = _554 * _556;
            int _560 = _550 * _455;
            int _562 = _560 + _469;
            bool _564 = !_552;
            int _566 = _564 ? 0 : (-1);
            bool _568 = uint(_562) >= uint(_455);
            int _570 = -_536;
            int _572 = _566 + _570;
            int _574 = _359 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].y);
            bool _576 = !_568;
            int _578 = _576 ? 0 : (-1);
            uint _580 = uint(int(uint(_574) >> uint(31)));
            int _582 = _572 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _584 = _582 + _359;
            bool _586 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].x);
            int _588 = ~_578;
            int _590 = _542 + _588;
            int _592 = _590 + 1;
            bool _594 = !_586;
            int _596 = _594 ? _584 : (-1);
            int _598 = ~int(_580);
            int _600 = _598 + 1;
            float _602 = float(_596);
            int _604 = _592 ^ _600;
            bool _606 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[46].y);
            float _608 = rint(_602);
            float _610 = precise::max(_608, 0.0);
            uint _612 = uint(_610);
            uint _614 = clamp(_612, 0u, 65535u);
            int _616 = ~_600;
            int _618 = _616 + _604;
            int _620 = _618 + 1;
            float _622 = _62 * _558;
            bool _624 = !_606;
            int _626 = _624 ? _620 : (-1);
            float _628 = float(_626);
            int _630 = 0;
            _395 = as_type<int>(_483);
            _397 = as_type<int>(_492);
            do
            {
                float _634 = _391;
                int _636 = _630;
                float _638 = _393;
                float _640 = _634 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _642 = _473 + 176;
                uint _644 = uint(int(uint(_642) >> uint(2)));
                uint _646 = uint(int(uint(int(_644)) >> uint(2)));
                int _648 = int(_644) & 3;
                float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
                int _652 = int(_644) + 1;
                uint _654 = uint(int(uint(_652) >> uint(2)));
                int _656 = _652 & 3;
                float _658 = (*spvDescriptorSet0.fp_c3)._m0[int(_654)][_656];
                float _660 = abs(_640);
                float _662 = log2(_660);
                int _664 = _473 + 160;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                uint _668 = uint(int(uint(int(_666)) >> uint(2)));
                int _670 = int(_666) & 3;
                float _672 = (*spvDescriptorSet0.fp_c3)._m0[int(_668)][_670];
                int _674 = int(_666) + 1;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                int _678 = _674 & 3;
                float _680 = (*spvDescriptorSet0.fp_c3)._m0[int(_676)][_678];
                int _682 = _473 + 192;
                uint _684 = uint(int(uint(_682) >> uint(2)));
                uint _686 = uint(int(uint(int(_684)) >> uint(2)));
                int _688 = int(_684) & 3;
                float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
                int _692 = int(_684) + 1;
                uint _694 = uint(int(uint(_692) >> uint(2)));
                int _696 = _692 & 3;
                float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
                float _700 = _662 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _702 = _473 + 208;
                uint _704 = uint(int(uint(_702) >> uint(2)));
                uint _706 = uint(int(uint(int(_704)) >> uint(2)));
                int _708 = int(_704) & 3;
                float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
                int _712 = int(_704) + 1;
                uint _714 = uint(int(uint(_712) >> uint(2)));
                int _716 = _712 & 3;
                float _718 = (*spvDescriptorSet0.fp_c3)._m0[int(_714)][_716];
                float _720 = exp2(_700);
                float _722 = fma(_720, _622, _106);
                float _724 = fma(_720, _483, _303);
                float _726 = fma(_720, _492, _207);
                float _728 = _722 * _658;
                float _730 = _722 * _680;
                float _732 = _722 * _718;
                float _734 = fma(_724, _650, _728);
                float _736 = fma(_724, _672, _730);
                int _738 = _473 + 216;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                uint _742 = uint(int(uint(int(_740)) >> uint(2)));
                int _744 = int(_740) & 3;
                float _746 = (*spvDescriptorSet0.fp_c3)._m0[int(_742)][_744];
                int _748 = int(_740) + 1;
                uint _750 = uint(int(uint(_748) >> uint(2)));
                int _752 = _748 & 3;
                float _754 = (*spvDescriptorSet0.fp_c3)._m0[int(_750)][_752];
                float _756 = _722 * _698;
                float _758 = fma(_724, _690, _756);
                float _760 = fma(_724, _710, _732);
                int _762 = _473 + 168;
                uint _764 = uint(int(uint(_762) >> uint(2)));
                uint _766 = uint(int(uint(int(_764)) >> uint(2)));
                int _768 = int(_764) & 3;
                float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
                int _772 = int(_764) + 1;
                uint _774 = uint(int(uint(_772) >> uint(2)));
                int _776 = _772 & 3;
                float _778 = (*spvDescriptorSet0.fp_c3)._m0[int(_774)][_776];
                int _780 = _473 + 184;
                uint _782 = uint(int(uint(_780) >> uint(2)));
                uint _784 = uint(int(uint(int(_782)) >> uint(2)));
                int _786 = int(_782) & 3;
                float _788 = (*spvDescriptorSet0.fp_c3)._m0[int(_784)][_786];
                int _790 = int(_782) + 1;
                uint _792 = uint(int(uint(_790) >> uint(2)));
                int _794 = _790 & 3;
                float _796 = (*spvDescriptorSet0.fp_c3)._m0[int(_792)][_794];
                int _798 = _473 + 200;
                uint _800 = uint(int(uint(_798) >> uint(2)));
                uint _802 = uint(int(uint(int(_800)) >> uint(2)));
                int _804 = int(_800) & 3;
                float _806 = (*spvDescriptorSet0.fp_c3)._m0[int(_802)][_804];
                int _808 = int(_800) + 1;
                uint _810 = uint(int(uint(_808) >> uint(2)));
                int _812 = _808 & 3;
                float _814 = (*spvDescriptorSet0.fp_c3)._m0[int(_810)][_812];
                float _816 = fma(_726, _746, _760);
                float _818 = fma(_726, _770, _736);
                float _820 = fma(_108, _754, _816);
                float _822 = fma(_108, _778, _818);
                float _824 = 1.0 / _820;
                float _826 = fma(_726, _788, _734);
                float _828 = fma(_108, _796, _826);
                float _830 = fma(_726, _806, _758);
                float _832 = fma(_108, _814, _830);
                float _834 = _828 * _824;
                float _836 = _822 * _824;
                float _838 = _832 * _824;
                float _840 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[45].w, _834);
                float _842 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[45].z, _836);
                float _844 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[45].z, _836);
                float _846 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[45].w, _834);
                float3 _2021 = float3(_844, _840, float(int(_614)));
                float3 _2025 = select(_2021, float3(0.0), isnan(_2021));
                float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2025.xy, uint(rint(_2025.z)), _838, level(_628));
                float3 _2035 = float3(_842, _840, float(int(_614)));
                float3 _2037 = select(_2035, float3(0.0), isnan(_2035));
                float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2037.xy, uint(rint(_2037.z)), _838, level(_628));
                float3 _2047 = float3(_842, _846, float(int(_614)));
                float3 _2049 = select(_2047, float3(0.0), isnan(_2047));
                float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2049.xy, uint(rint(_2049.z)), _838, level(_628));
                float3 _2059 = float3(_844, _846, float(int(_614)));
                float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
                float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2061.xy, uint(rint(_2061.z)), _838, level(_628));
                int _856 = _636 + 1;
                float _858 = _634 + 1.0;
                bool _860 = _856 >= _437;
                float _862 = _850 + _848;
                float _864 = _862 + _852;
                float _866 = _864 + _854;
                float _868 = _866 * 0.25;
                float _870 = fma(_868, (*spvDescriptorSet0.fp_c3)._m0[45].x, (*spvDescriptorSet0.fp_c3)._m0[45].y);
                _872 = fma(_870, (*spvDescriptorSet0.fp_c3)._m0[8].x, _638);
                _632 = !_860;
                _391 = _858;
                _630 = _856;
                _393 = _872;
                _399 = _858;
                _401 = as_type<int>(_868);
                _403 = as_type<int>(_870);
                _405 = int(_614);
            } while (_632);
            _445 = as_type<int>(_872);
        }
        int _874 = _395;
        int _876 = _397;
        float _878 = _399;
        int _880 = _401;
        int _882 = _403;
        int _884 = _405;
        _886 = _445;
        int _888 = _359 + 1;
        bool _890 = _888 >= 7;
        _357 = !_890;
        _337 = _888;
        _341 = _886;
        _343 = _874;
        _345 = _876;
        _347 = _878;
        _349 = _880;
        _351 = _882;
        _353 = _884;
    } while (_357);
    out.m_41.x = as_type<float>(_886);
    out.m_41.y = as_type<float>(_886);
    out.m_41.z = as_type<float>(_886);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

