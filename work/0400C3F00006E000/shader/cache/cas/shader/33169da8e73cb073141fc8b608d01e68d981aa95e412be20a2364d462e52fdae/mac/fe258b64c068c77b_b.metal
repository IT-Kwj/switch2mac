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
    float2 _900 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_900, float2(0.0), isnan(_900))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_900, float2(0.0), isnan(_900))).x;
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
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[35].x;
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _98 = _62 * _76;
    float _100 = abs(_92);
    float _102 = log2(_100);
    float _104 = _62 * _82;
    float _106 = abs(_90);
    float _108 = log2(_106);
    float _110 = abs(_94);
    float _112 = log2(_110);
    float _114 = _102 * _70;
    float _116 = _108 * _70;
    float _118 = abs(_96);
    float _120 = log2(_118);
    float _122 = exp2(_116);
    float _124 = _120 * _70;
    float _126 = -_68;
    float _128 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _130 = _88 * (*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _132 = abs(_130);
    float _134 = log2(_132);
    float _136 = 1.0 / _128;
    float _138 = _112 * _70;
    float _140 = _134 * _70;
    float _142 = exp2(_138);
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _146 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[8].y, _144);
    float _148 = exp2(_140);
    float _150 = _146 * _88;
    float _152 = exp2(_114);
    float _154 = abs(_150);
    float _156 = log2(_154);
    float _158 = _156 * _70;
    float _160 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _162 = exp2(_124);
    float _164 = _160 * _122;
    float _166 = _160 * _152;
    float _168 = _160 * _142;
    float _170 = _160 * _148;
    float _172 = exp2(_158);
    float _174 = in.m_36.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = ceil(_164);
    int _183 = int(_180);
    float _185 = _160 * _162;
    float _187 = _160 * _172;
    float _189 = ceil(_166);
    float _191 = precise::min(_160, _187);
    float _193 = ceil(_168);
    float _195 = trunc(_191);
    int _197 = int(_195);
    float _199 = _62 * _178;
    float _201 = ceil(_170);
    int _203 = min(_183, _197);
    float _205 = ceil(_185);
    float _207 = float(_203);
    int _209 = ~_203;
    int _211 = _197 + _209;
    int _213 = _211 + 1;
    float _215 = -_207;
    float _217 = _189 + _215;
    float _219 = trunc(_217);
    int _221 = int(_219);
    int _223 = min(_221, _213);
    int _225 = _203 + _223;
    float _227 = float(_225);
    int _229 = ~_225;
    int _231 = _197 + _229;
    int _233 = _231 + 1;
    float _235 = -_227;
    float _237 = _193 + _235;
    float _239 = trunc(_237);
    int _241 = int(_239);
    int _243 = min(_241, _233);
    int _245 = _225 + _243;
    float _247 = float(_245);
    int _249 = -_245;
    int _251 = _197 + _249;
    float _253 = -_247;
    float _255 = _201 + _253;
    float _257 = trunc(_255);
    int _259 = int(_257);
    int _261 = min(_259, _251);
    float _263 = in.m_36.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    int _269 = _245 + _261;
    float _271 = float(_269);
    int _273 = ~_269;
    int _275 = _197 + _273;
    int _277 = _275 + 1;
    float _279 = -_271;
    float _281 = _205 + _279;
    float _283 = trunc(_281);
    int _285 = int(_283);
    float _287 = _62 * _267;
    int _289 = min(_285, _277);
    int _291 = ~_269;
    int _293 = ~_289;
    int _295 = _197 + _291;
    int _297 = _295 + _293;
    int _299 = _297 + 2;
    int _301 = 0;
    int _303 = 0;
    int _305 = 0;
    int _307 = 0;
    int _309 = 0;
    float _311 = 0.0;
    int _313 = 0;
    int _315 = 0;
    int _317 = 0;
    int _319 = 0;
    int _321 = 0;
    bool _325;
    bool _604;
    float _844;
    int _862;
    do
    {
        int _327 = _301;
        int _329 = _303;
        int _331 = _305;
        int _333 = _307;
        int _335 = _309;
        float _337 = _311;
        int _339 = _313;
        int _341 = _315;
        int _343 = _317;
        int _345 = _319;
        int _347 = _321;
        int _349 = _327 << 2;
        bool _351 = _349 == 0;
        bool _353 = _349 == 4;
        bool _355 = _349 == 8;
        bool _357 = _349 == 12;
        int _359 = _329;
        int _361 = _349;
        float _363 = _337;
        float _365 = as_type<float>(_331);
        int _367 = _333;
        int _369 = _335;
        float _371 = _337;
        int _373 = _339;
        int _375 = _341;
        int _377 = _343;
        int _379 = _345;
        int _381 = _347;
        if (_351)
        {
            _359 = _203;
        }
        int _383 = _359;
        bool _385 = _349 == 16;
        int _387 = _383;
        if (_353)
        {
            _387 = _223;
        }
        int _389 = _387;
        int _391 = _389;
        if (_355)
        {
            _391 = _243;
        }
        int _393 = _391;
        bool _395 = _349 == 20;
        int _397 = _393;
        if (_357)
        {
            _397 = _261;
        }
        int _399 = _397;
        int _401 = _399;
        if (_385)
        {
            _401 = _289;
        }
        int _403 = _401;
        int _405 = _403;
        if (_395)
        {
            _405 = _299;
        }
        int _407 = _405;
        bool _409 = _407 > 0;
        _303 = _407;
        if (!_409)
        {
            _361 = _331;
        }
        int _411 = _361;
        bool _413 = !_409;
        int _415 = _411;
        if (!_413)
        {
            float _417 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[41].x));
            float _419 = in.m_38.x;
            float _421 = gl_FragCoord.w;
            float _423 = _419 * _421;
            int _425 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].y));
            float _427 = in.m_38.z;
            float _429 = gl_FragCoord.w;
            float _431 = _427 * _429;
            float _433 = float(uint(_327));
            float _435 = 1.0 / _417;
            float _437 = float(uint(_425));
            int _439 = abs(_327);
            float _441 = float(uint(_439));
            float _443 = 1.0 / _437;
            int _445 = as_type<int>(_435) + (-2);
            float _447 = as_type<float>(_445) * _433;
            int _449 = as_type<int>(_443) + (-2);
            float _451 = trunc(_447);
            float _453 = precise::max(_451, 0.0);
            uint _456 = uint(_453);
            float _458 = _62 * _423;
            float _460 = as_type<float>(_449) * _441;
            float _462 = _62 * _431;
            float _464 = trunc(_460);
            float _466 = precise::max(_464, 0.0);
            uint _468 = uint(_466);
            int _470 = ~int(_456);
            int _472 = _470 + 1;
            int _474 = _472 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _476 = _474 + _327;
            int _478 = ~int(_468);
            int _480 = _478 + 1;
            float _482 = float(uint(_476));
            int _484 = _480 * _425;
            int _486 = _484 + _439;
            float _488 = as_type<float>(_445) * _482;
            float _490 = float(uint(_486));
            float _492 = trunc(_488);
            float _494 = precise::max(_492, 0.0);
            uint _496 = uint(_494);
            float _498 = as_type<float>(_449) * _490;
            float _500 = trunc(_498);
            float _502 = precise::max(_500, 0.0);
            uint _504 = uint(_502);
            int _506 = int(_456) + int(_496);
            int _508 = ~_506;
            int _510 = _508 + 1;
            int _512 = int(_468) + int(_504);
            int _514 = _510 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _516 = _514 + _327;
            int _518 = _327 << 6;
            int _520 = ~_512;
            int _522 = _520 + 1;
            bool _524 = uint(_516) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            float _526 = in.m_38.y;
            float _528 = gl_FragCoord.w;
            float _530 = _526 * _528;
            int _532 = _522 * _425;
            int _534 = _532 + _439;
            bool _536 = !_524;
            int _538 = _536 ? 0 : (-1);
            bool _540 = uint(_534) >= uint(_425);
            int _542 = ~_506;
            int _544 = _542 + _538;
            int _546 = _544 + 1;
            int _548 = _327 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].y);
            bool _550 = !_540;
            int _552 = _550 ? 0 : (-1);
            uint _554 = uint(int(uint(_548) >> uint(31)));
            int _556 = _546 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _558 = _556 + _327;
            bool _560 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _562 = ~_552;
            int _564 = _512 + _562;
            int _566 = _564 + 1;
            bool _568 = !_560;
            int _570 = _568 ? _558 : (-1);
            int _572 = ~int(_554);
            int _574 = _572 + 1;
            float _576 = float(_570);
            int _578 = _566 ^ _574;
            bool _580 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].y);
            float _582 = rint(_576);
            float _584 = precise::max(_582, 0.0);
            uint _586 = uint(_584);
            uint _588 = clamp(_586, 0u, 65535u);
            int _590 = -_574;
            int _592 = _578 + _590;
            float _594 = _62 * _530;
            bool _596 = !_580;
            int _598 = _596 ? _592 : (-1);
            float _600 = float(_598);
            int _602 = 0;
            _367 = as_type<int>(_458);
            _369 = as_type<int>(_462);
            do
            {
                float _606 = _363;
                int _608 = _602;
                float _610 = _365;
                float _612 = _606 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _614 = _518 + 160;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                uint _618 = uint(int(uint(int(_616)) >> uint(2)));
                int _620 = int(_616) & 3;
                float _622 = (*spvDescriptorSet0.fp_c3)._m0[int(_618)][_620];
                int _624 = int(_616) + 1;
                uint _626 = uint(int(uint(_624) >> uint(2)));
                int _628 = _624 & 3;
                float _630 = (*spvDescriptorSet0.fp_c3)._m0[int(_626)][_628];
                float _632 = abs(_612);
                float _634 = log2(_632);
                int _636 = _518 + 176;
                uint _638 = uint(int(uint(_636) >> uint(2)));
                uint _640 = uint(int(uint(int(_638)) >> uint(2)));
                int _642 = int(_638) & 3;
                float _644 = (*spvDescriptorSet0.fp_c3)._m0[int(_640)][_642];
                int _646 = int(_638) + 1;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                int _650 = _646 & 3;
                float _652 = (*spvDescriptorSet0.fp_c3)._m0[int(_648)][_650];
                int _654 = _518 + 192;
                uint _656 = uint(int(uint(_654) >> uint(2)));
                uint _658 = uint(int(uint(int(_656)) >> uint(2)));
                int _660 = int(_656) & 3;
                float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
                int _664 = int(_656) + 1;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                int _668 = _664 & 3;
                float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
                float _672 = _634 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _674 = _518 + 208;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                uint _678 = uint(int(uint(int(_676)) >> uint(2)));
                int _680 = int(_676) & 3;
                float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
                int _684 = int(_676) + 1;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                int _688 = _684 & 3;
                float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
                float _692 = exp2(_672);
                int _694 = _518 + 216;
                uint _696 = uint(int(uint(_694) >> uint(2)));
                uint _698 = uint(int(uint(int(_696)) >> uint(2)));
                int _700 = int(_696) & 3;
                float _702 = (*spvDescriptorSet0.fp_c3)._m0[int(_698)][_700];
                int _704 = int(_696) + 1;
                uint _706 = uint(int(uint(_704) >> uint(2)));
                int _708 = _704 & 3;
                float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
                float _712 = fma(_692, _594, _98);
                float _714 = _712 * _630;
                float _716 = _712 * _652;
                float _718 = fma(_692, _458, _287);
                float _720 = _712 * _670;
                float _722 = _712 * _690;
                float _724 = fma(_718, _644, _716);
                float _726 = fma(_718, _622, _714);
                int _728 = _518 + 184;
                uint _730 = uint(int(uint(_728) >> uint(2)));
                uint _732 = uint(int(uint(int(_730)) >> uint(2)));
                int _734 = int(_730) & 3;
                float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
                int _738 = int(_730) + 1;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                int _742 = _738 & 3;
                float _744 = (*spvDescriptorSet0.fp_c3)._m0[int(_740)][_742];
                float _746 = fma(_718, _662, _720);
                float _748 = fma(_718, _682, _722);
                float _750 = fma(_692, _462, _199);
                float _752 = fma(_750, _702, _748);
                int _754 = _518 + 168;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                uint _758 = uint(int(uint(int(_756)) >> uint(2)));
                int _760 = int(_756) & 3;
                float _762 = (*spvDescriptorSet0.fp_c3)._m0[int(_758)][_760];
                int _764 = int(_756) + 1;
                uint _766 = uint(int(uint(_764) >> uint(2)));
                int _768 = _764 & 3;
                float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
                float _772 = fma(_104, _710, _752);
                int _774 = _518 + 200;
                uint _776 = uint(int(uint(_774) >> uint(2)));
                uint _778 = uint(int(uint(int(_776)) >> uint(2)));
                int _780 = int(_776) & 3;
                float _782 = (*spvDescriptorSet0.fp_c3)._m0[int(_778)][_780];
                int _784 = int(_776) + 1;
                uint _786 = uint(int(uint(_784) >> uint(2)));
                int _788 = _784 & 3;
                float _790 = (*spvDescriptorSet0.fp_c3)._m0[int(_786)][_788];
                float _792 = 1.0 / _772;
                float _794 = fma(_750, _736, _724);
                float _796 = fma(_104, _744, _794);
                float _798 = fma(_750, _762, _726);
                float _800 = _796 * _792;
                float _802 = fma(_104, _770, _798);
                float _804 = fma(_750, _782, _746);
                float _806 = _802 * _792;
                float _808 = fma(_104, _790, _804);
                float _810 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[40].z, _806);
                float _812 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[40].z, _806);
                float _814 = _808 * _792;
                float _816 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[40].w, _800);
                float _818 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[40].w, _800);
                float3 _1949 = float3(_812, _816, float(int(_588)));
                float3 _1953 = select(_1949, float3(0.0), isnan(_1949));
                float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1953.xy, uint(rint(_1953.z)), _814, level(_600));
                float3 _1963 = float3(_810, _816, float(int(_588)));
                float3 _1965 = select(_1963, float3(0.0), isnan(_1963));
                float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1965.xy, uint(rint(_1965.z)), _814, level(_600));
                float3 _1975 = float3(_810, _818, float(int(_588)));
                float3 _1977 = select(_1975, float3(0.0), isnan(_1975));
                float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1977.xy, uint(rint(_1977.z)), _814, level(_600));
                float3 _1987 = float3(_812, _818, float(int(_588)));
                float3 _1989 = select(_1987, float3(0.0), isnan(_1987));
                float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1989.xy, uint(rint(_1989.z)), _814, level(_600));
                int _828 = _608 + 1;
                float _830 = _606 + 1.0;
                bool _832 = _828 >= _407;
                float _834 = _822 + _820;
                float _836 = _834 + _824;
                float _838 = _836 + _826;
                float _840 = _838 * 0.25;
                float _842 = fma(_840, (*spvDescriptorSet0.fp_c3)._m0[40].x, (*spvDescriptorSet0.fp_c3)._m0[40].y);
                _844 = fma(_842, (*spvDescriptorSet0.fp_c3)._m0[8].x, _610);
                _604 = !_832;
                _363 = _830;
                _602 = _828;
                _365 = _844;
                _371 = _830;
                _373 = int(_588);
                _375 = as_type<int>(_842);
                _377 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
                _379 = as_type<int>(_702);
                _381 = as_type<int>(_710);
            } while (_604);
            _415 = as_type<int>(_844);
        }
        int _846 = _367;
        int _848 = _369;
        float _850 = _371;
        int _852 = _373;
        int _854 = _375;
        int _856 = _377;
        int _858 = _379;
        int _860 = _381;
        _862 = _415;
        int _864 = _327 + 1;
        bool _866 = _864 >= 6;
        _325 = !_866;
        _301 = _864;
        _305 = _862;
        _307 = _846;
        _309 = _848;
        _311 = _850;
        _313 = _852;
        _315 = _854;
        _317 = _856;
        _319 = _858;
        _321 = _860;
    } while (_325);
    out.m_41.x = as_type<float>(_862);
    out.m_41.y = as_type<float>(_862);
    out.m_41.z = as_type<float>(_862);
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
    float2 _900 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_900, float2(0.0), isnan(_900))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_900, float2(0.0), isnan(_900))).x;
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
    float _90 = _88 * (*spvDescriptorSet0.fp_c3)._m0[35].x;
    float _92 = _88 * (*spvDescriptorSet0.fp_c3)._m0[36].x;
    float _94 = _88 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _96 = _88 * (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _98 = _62 * _76;
    float _100 = abs(_92);
    float _102 = log2(_100);
    float _104 = _62 * _82;
    float _106 = abs(_90);
    float _108 = log2(_106);
    float _110 = abs(_94);
    float _112 = log2(_110);
    float _114 = _102 * _70;
    float _116 = _108 * _70;
    float _118 = abs(_96);
    float _120 = log2(_118);
    float _122 = exp2(_116);
    float _124 = _120 * _70;
    float _126 = -_68;
    float _128 = fma(_126, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _130 = _88 * (*spvDescriptorSet0.fp_c3)._m0[38].x;
    float _132 = abs(_130);
    float _134 = log2(_132);
    float _136 = 1.0 / _128;
    float _138 = _112 * _70;
    float _140 = _134 * _70;
    float _142 = exp2(_138);
    float _144 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _146 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[8].y, _144);
    float _148 = exp2(_140);
    float _150 = _146 * _88;
    float _152 = exp2(_114);
    float _154 = abs(_150);
    float _156 = log2(_154);
    float _158 = _156 * _70;
    float _160 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _162 = exp2(_124);
    float _164 = _160 * _122;
    float _166 = _160 * _152;
    float _168 = _160 * _142;
    float _170 = _160 * _148;
    float _172 = exp2(_158);
    float _174 = in.m_36.z;
    float _176 = gl_FragCoord.w;
    float _178 = _174 * _176;
    float _180 = ceil(_164);
    int _183 = int(_180);
    float _185 = _160 * _162;
    float _187 = _160 * _172;
    float _189 = ceil(_166);
    float _191 = precise::min(_160, _187);
    float _193 = ceil(_168);
    float _195 = trunc(_191);
    int _197 = int(_195);
    float _199 = _62 * _178;
    float _201 = ceil(_170);
    int _203 = min(_183, _197);
    float _205 = ceil(_185);
    float _207 = float(_203);
    int _209 = ~_203;
    int _211 = _197 + _209;
    int _213 = _211 + 1;
    float _215 = -_207;
    float _217 = _189 + _215;
    float _219 = trunc(_217);
    int _221 = int(_219);
    int _223 = min(_221, _213);
    int _225 = _203 + _223;
    float _227 = float(_225);
    int _229 = ~_225;
    int _231 = _197 + _229;
    int _233 = _231 + 1;
    float _235 = -_227;
    float _237 = _193 + _235;
    float _239 = trunc(_237);
    int _241 = int(_239);
    int _243 = min(_241, _233);
    int _245 = _225 + _243;
    float _247 = float(_245);
    int _249 = -_245;
    int _251 = _197 + _249;
    float _253 = -_247;
    float _255 = _201 + _253;
    float _257 = trunc(_255);
    int _259 = int(_257);
    int _261 = min(_259, _251);
    float _263 = in.m_36.x;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    int _269 = _245 + _261;
    float _271 = float(_269);
    int _273 = ~_269;
    int _275 = _197 + _273;
    int _277 = _275 + 1;
    float _279 = -_271;
    float _281 = _205 + _279;
    float _283 = trunc(_281);
    int _285 = int(_283);
    float _287 = _62 * _267;
    int _289 = min(_285, _277);
    int _291 = ~_269;
    int _293 = ~_289;
    int _295 = _197 + _291;
    int _297 = _295 + _293;
    int _299 = _297 + 2;
    int _301 = 0;
    int _303 = 0;
    int _305 = 0;
    int _307 = 0;
    int _309 = 0;
    float _311 = 0.0;
    int _313 = 0;
    int _315 = 0;
    int _317 = 0;
    int _319 = 0;
    int _321 = 0;
    bool _325;
    bool _604;
    float _844;
    int _862;
    do
    {
        int _327 = _301;
        int _329 = _303;
        int _331 = _305;
        int _333 = _307;
        int _335 = _309;
        float _337 = _311;
        int _339 = _313;
        int _341 = _315;
        int _343 = _317;
        int _345 = _319;
        int _347 = _321;
        int _349 = _327 << 2;
        bool _351 = _349 == 0;
        bool _353 = _349 == 4;
        bool _355 = _349 == 8;
        bool _357 = _349 == 12;
        int _359 = _329;
        int _361 = _349;
        float _363 = _337;
        float _365 = as_type<float>(_331);
        int _367 = _333;
        int _369 = _335;
        float _371 = _337;
        int _373 = _339;
        int _375 = _341;
        int _377 = _343;
        int _379 = _345;
        int _381 = _347;
        if (_351)
        {
            _359 = _203;
        }
        int _383 = _359;
        bool _385 = _349 == 16;
        int _387 = _383;
        if (_353)
        {
            _387 = _223;
        }
        int _389 = _387;
        int _391 = _389;
        if (_355)
        {
            _391 = _243;
        }
        int _393 = _391;
        bool _395 = _349 == 20;
        int _397 = _393;
        if (_357)
        {
            _397 = _261;
        }
        int _399 = _397;
        int _401 = _399;
        if (_385)
        {
            _401 = _289;
        }
        int _403 = _401;
        int _405 = _403;
        if (_395)
        {
            _405 = _299;
        }
        int _407 = _405;
        bool _409 = _407 > 0;
        _303 = _407;
        if (!_409)
        {
            _361 = _331;
        }
        int _411 = _361;
        bool _413 = !_409;
        int _415 = _411;
        if (!_413)
        {
            float _417 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[41].x));
            float _419 = in.m_38.x;
            float _421 = gl_FragCoord.w;
            float _423 = _419 * _421;
            int _425 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].y));
            float _427 = in.m_38.z;
            float _429 = gl_FragCoord.w;
            float _431 = _427 * _429;
            float _433 = float(uint(_327));
            float _435 = 1.0 / _417;
            float _437 = float(uint(_425));
            int _439 = abs(_327);
            float _441 = float(uint(_439));
            float _443 = 1.0 / _437;
            int _445 = as_type<int>(_435) + (-2);
            float _447 = as_type<float>(_445) * _433;
            int _449 = as_type<int>(_443) + (-2);
            float _451 = trunc(_447);
            float _453 = precise::max(_451, 0.0);
            uint _456 = uint(_453);
            float _458 = _62 * _423;
            float _460 = as_type<float>(_449) * _441;
            float _462 = _62 * _431;
            float _464 = trunc(_460);
            float _466 = precise::max(_464, 0.0);
            uint _468 = uint(_466);
            int _470 = ~int(_456);
            int _472 = _470 + 1;
            int _474 = _472 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _476 = _474 + _327;
            int _478 = ~int(_468);
            int _480 = _478 + 1;
            float _482 = float(uint(_476));
            int _484 = _480 * _425;
            int _486 = _484 + _439;
            float _488 = as_type<float>(_445) * _482;
            float _490 = float(uint(_486));
            float _492 = trunc(_488);
            float _494 = precise::max(_492, 0.0);
            uint _496 = uint(_494);
            float _498 = as_type<float>(_449) * _490;
            float _500 = trunc(_498);
            float _502 = precise::max(_500, 0.0);
            uint _504 = uint(_502);
            int _506 = int(_456) + int(_496);
            int _508 = ~_506;
            int _510 = _508 + 1;
            int _512 = int(_468) + int(_504);
            int _514 = _510 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _516 = _514 + _327;
            int _518 = _327 << 6;
            int _520 = ~_512;
            int _522 = _520 + 1;
            bool _524 = uint(_516) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            float _526 = in.m_38.y;
            float _528 = gl_FragCoord.w;
            float _530 = _526 * _528;
            int _532 = _522 * _425;
            int _534 = _532 + _439;
            bool _536 = !_524;
            int _538 = _536 ? 0 : (-1);
            bool _540 = uint(_534) >= uint(_425);
            int _542 = ~_506;
            int _544 = _542 + _538;
            int _546 = _544 + 1;
            int _548 = _327 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].y);
            bool _550 = !_540;
            int _552 = _550 ? 0 : (-1);
            uint _554 = uint(int(uint(_548) >> uint(31)));
            int _556 = _546 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _558 = _556 + _327;
            bool _560 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].x);
            int _562 = ~_552;
            int _564 = _512 + _562;
            int _566 = _564 + 1;
            bool _568 = !_560;
            int _570 = _568 ? _558 : (-1);
            int _572 = ~int(_554);
            int _574 = _572 + 1;
            float _576 = float(_570);
            int _578 = _566 ^ _574;
            bool _580 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[41].y);
            float _582 = rint(_576);
            float _584 = precise::max(_582, 0.0);
            uint _586 = uint(_584);
            uint _588 = clamp(_586, 0u, 65535u);
            int _590 = -_574;
            int _592 = _578 + _590;
            float _594 = _62 * _530;
            bool _596 = !_580;
            int _598 = _596 ? _592 : (-1);
            float _600 = float(_598);
            int _602 = 0;
            _367 = as_type<int>(_458);
            _369 = as_type<int>(_462);
            do
            {
                float _606 = _363;
                int _608 = _602;
                float _610 = _365;
                float _612 = _606 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _614 = _518 + 160;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                uint _618 = uint(int(uint(int(_616)) >> uint(2)));
                int _620 = int(_616) & 3;
                float _622 = (*spvDescriptorSet0.fp_c3)._m0[int(_618)][_620];
                int _624 = int(_616) + 1;
                uint _626 = uint(int(uint(_624) >> uint(2)));
                int _628 = _624 & 3;
                float _630 = (*spvDescriptorSet0.fp_c3)._m0[int(_626)][_628];
                float _632 = abs(_612);
                float _634 = log2(_632);
                int _636 = _518 + 176;
                uint _638 = uint(int(uint(_636) >> uint(2)));
                uint _640 = uint(int(uint(int(_638)) >> uint(2)));
                int _642 = int(_638) & 3;
                float _644 = (*spvDescriptorSet0.fp_c3)._m0[int(_640)][_642];
                int _646 = int(_638) + 1;
                uint _648 = uint(int(uint(_646) >> uint(2)));
                int _650 = _646 & 3;
                float _652 = (*spvDescriptorSet0.fp_c3)._m0[int(_648)][_650];
                int _654 = _518 + 192;
                uint _656 = uint(int(uint(_654) >> uint(2)));
                uint _658 = uint(int(uint(int(_656)) >> uint(2)));
                int _660 = int(_656) & 3;
                float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
                int _664 = int(_656) + 1;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                int _668 = _664 & 3;
                float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
                float _672 = _634 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _674 = _518 + 208;
                uint _676 = uint(int(uint(_674) >> uint(2)));
                uint _678 = uint(int(uint(int(_676)) >> uint(2)));
                int _680 = int(_676) & 3;
                float _682 = (*spvDescriptorSet0.fp_c3)._m0[int(_678)][_680];
                int _684 = int(_676) + 1;
                uint _686 = uint(int(uint(_684) >> uint(2)));
                int _688 = _684 & 3;
                float _690 = (*spvDescriptorSet0.fp_c3)._m0[int(_686)][_688];
                float _692 = exp2(_672);
                int _694 = _518 + 216;
                uint _696 = uint(int(uint(_694) >> uint(2)));
                uint _698 = uint(int(uint(int(_696)) >> uint(2)));
                int _700 = int(_696) & 3;
                float _702 = (*spvDescriptorSet0.fp_c3)._m0[int(_698)][_700];
                int _704 = int(_696) + 1;
                uint _706 = uint(int(uint(_704) >> uint(2)));
                int _708 = _704 & 3;
                float _710 = (*spvDescriptorSet0.fp_c3)._m0[int(_706)][_708];
                float _712 = fma(_692, _594, _98);
                float _714 = _712 * _630;
                float _716 = _712 * _652;
                float _718 = fma(_692, _458, _287);
                float _720 = _712 * _670;
                float _722 = _712 * _690;
                float _724 = fma(_718, _644, _716);
                float _726 = fma(_718, _622, _714);
                int _728 = _518 + 184;
                uint _730 = uint(int(uint(_728) >> uint(2)));
                uint _732 = uint(int(uint(int(_730)) >> uint(2)));
                int _734 = int(_730) & 3;
                float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
                int _738 = int(_730) + 1;
                uint _740 = uint(int(uint(_738) >> uint(2)));
                int _742 = _738 & 3;
                float _744 = (*spvDescriptorSet0.fp_c3)._m0[int(_740)][_742];
                float _746 = fma(_718, _662, _720);
                float _748 = fma(_718, _682, _722);
                float _750 = fma(_692, _462, _199);
                float _752 = fma(_750, _702, _748);
                int _754 = _518 + 168;
                uint _756 = uint(int(uint(_754) >> uint(2)));
                uint _758 = uint(int(uint(int(_756)) >> uint(2)));
                int _760 = int(_756) & 3;
                float _762 = (*spvDescriptorSet0.fp_c3)._m0[int(_758)][_760];
                int _764 = int(_756) + 1;
                uint _766 = uint(int(uint(_764) >> uint(2)));
                int _768 = _764 & 3;
                float _770 = (*spvDescriptorSet0.fp_c3)._m0[int(_766)][_768];
                float _772 = fma(_104, _710, _752);
                int _774 = _518 + 200;
                uint _776 = uint(int(uint(_774) >> uint(2)));
                uint _778 = uint(int(uint(int(_776)) >> uint(2)));
                int _780 = int(_776) & 3;
                float _782 = (*spvDescriptorSet0.fp_c3)._m0[int(_778)][_780];
                int _784 = int(_776) + 1;
                uint _786 = uint(int(uint(_784) >> uint(2)));
                int _788 = _784 & 3;
                float _790 = (*spvDescriptorSet0.fp_c3)._m0[int(_786)][_788];
                float _792 = 1.0 / _772;
                float _794 = fma(_750, _736, _724);
                float _796 = fma(_104, _744, _794);
                float _798 = fma(_750, _762, _726);
                float _800 = _796 * _792;
                float _802 = fma(_104, _770, _798);
                float _804 = fma(_750, _782, _746);
                float _806 = _802 * _792;
                float _808 = fma(_104, _790, _804);
                float _810 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[40].z, _806);
                float _812 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[40].z, _806);
                float _814 = _808 * _792;
                float _816 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[40].w, _800);
                float _818 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[40].w, _800);
                float3 _1949 = float3(_812, _816, float(int(_588)));
                float3 _1953 = select(_1949, float3(0.0), isnan(_1949));
                float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1953.xy, uint(rint(_1953.z)), _814, level(_600));
                float3 _1963 = float3(_810, _816, float(int(_588)));
                float3 _1965 = select(_1963, float3(0.0), isnan(_1963));
                float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1965.xy, uint(rint(_1965.z)), _814, level(_600));
                float3 _1975 = float3(_810, _818, float(int(_588)));
                float3 _1977 = select(_1975, float3(0.0), isnan(_1975));
                float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1977.xy, uint(rint(_1977.z)), _814, level(_600));
                float3 _1987 = float3(_812, _818, float(int(_588)));
                float3 _1989 = select(_1987, float3(0.0), isnan(_1987));
                float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1989.xy, uint(rint(_1989.z)), _814, level(_600));
                int _828 = _608 + 1;
                float _830 = _606 + 1.0;
                bool _832 = _828 >= _407;
                float _834 = _822 + _820;
                float _836 = _834 + _824;
                float _838 = _836 + _826;
                float _840 = _838 * 0.25;
                float _842 = fma(_840, (*spvDescriptorSet0.fp_c3)._m0[40].x, (*spvDescriptorSet0.fp_c3)._m0[40].y);
                _844 = fma(_842, (*spvDescriptorSet0.fp_c3)._m0[8].x, _610);
                _604 = !_832;
                _363 = _830;
                _602 = _828;
                _365 = _844;
                _371 = _830;
                _373 = int(_588);
                _375 = as_type<int>(_842);
                _377 = as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
                _379 = as_type<int>(_702);
                _381 = as_type<int>(_710);
            } while (_604);
            _415 = as_type<int>(_844);
        }
        int _846 = _367;
        int _848 = _369;
        float _850 = _371;
        int _852 = _373;
        int _854 = _375;
        int _856 = _377;
        int _858 = _379;
        int _860 = _381;
        _862 = _415;
        int _864 = _327 + 1;
        bool _866 = _864 >= 6;
        _325 = !_866;
        _301 = _864;
        _305 = _862;
        _307 = _846;
        _309 = _848;
        _311 = _850;
        _313 = _852;
        _315 = _854;
        _317 = _856;
        _319 = _858;
        _321 = _860;
    } while (_325);
    out.m_41.x = as_type<float>(_862);
    out.m_41.y = as_type<float>(_862);
    out.m_41.z = as_type<float>(_862);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

