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
    float2 _860 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_860, float2(0.0), isnan(_860))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_860, float2(0.0), isnan(_860))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_36.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _96 = _94 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _102 = _62 * _76;
    float _104 = abs(_96);
    float _106 = log2(_104);
    float _108 = _62 * _84;
    float _110 = _62 * _90;
    float _112 = abs(_98);
    float _114 = log2(_112);
    float _116 = abs(_100);
    float _118 = log2(_116);
    float _120 = _106 * _70;
    float _122 = exp2(_120);
    float _124 = _114 * _70;
    float _126 = _118 * _70;
    float _128 = -_68;
    float _130 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _132 = _94 * (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _134 = 1.0 / _130;
    float _136 = abs(_132);
    float _138 = log2(_136);
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _142 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[8].y, _140);
    float _144 = _142 * _94;
    float _146 = exp2(_124);
    float _148 = _138 * _70;
    float _150 = abs(_144);
    float _152 = log2(_150);
    float _154 = exp2(_148);
    float _156 = _152 * _70;
    float _158 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _160 = exp2(_126);
    float _162 = _158 * _122;
    float _164 = _158 * _146;
    float _166 = _158 * _154;
    float _168 = exp2(_156);
    float _170 = in.m_36.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = _158 * _160;
    float _178 = ceil(_162);
    int _181 = int(_178);
    float _183 = _158 * _168;
    float _185 = ceil(_166);
    float _187 = precise::min(_158, _183);
    float _189 = trunc(_187);
    int _191 = int(_189);
    float _193 = ceil(_164);
    float _195 = _62 * _174;
    int _197 = min(_181, _191);
    float _199 = ceil(_176);
    float _201 = float(_197);
    int _203 = ~_197;
    int _205 = _191 + _203;
    int _207 = _205 + 1;
    float _209 = -_201;
    float _211 = _185 + _209;
    float _213 = trunc(_211);
    int _215 = int(_213);
    int _217 = min(_215, _207);
    int _219 = _197 + _217;
    float _221 = float(_219);
    int _223 = ~_219;
    int _225 = _191 + _223;
    int _227 = _225 + 1;
    float _229 = -_221;
    float _231 = _193 + _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = min(_235, _227);
    int _239 = _219 + _237;
    float _241 = float(_239);
    int _243 = -_239;
    int _245 = _191 + _243;
    float _247 = -_241;
    float _249 = _199 + _247;
    float _251 = trunc(_249);
    int _253 = int(_251);
    int _255 = min(_253, _245);
    int _257 = ~_239;
    int _259 = ~_255;
    int _261 = _191 + _257;
    int _263 = _261 + _259;
    int _265 = _263 + 2;
    int _267 = 0;
    int _269 = 0;
    int _271 = 0;
    int _273 = 0;
    int _275 = 0;
    float _277 = 0.0;
    int _279 = 0;
    int _281 = 0;
    int _283 = 0;
    int _285 = 0;
    int _287 = 0;
    bool _291;
    bool _564;
    float _804;
    int _822;
    do
    {
        int _293 = _267;
        int _295 = _269;
        int _297 = _271;
        int _299 = _273;
        int _301 = _275;
        float _303 = _277;
        int _305 = _279;
        int _307 = _281;
        int _309 = _283;
        int _311 = _285;
        int _313 = _287;
        int _315 = _293 << 2;
        bool _317 = _315 == 0;
        bool _319 = _315 == 4;
        bool _321 = _315 == 8;
        bool _323 = _315 == 12;
        int _325 = _295;
        int _327 = _315;
        float _329 = _303;
        float _331 = as_type<float>(_297);
        int _333 = _299;
        int _335 = _301;
        float _337 = _303;
        int _339 = _305;
        int _341 = _307;
        int _343 = _309;
        int _345 = _311;
        int _347 = _313;
        if (_317)
        {
            _325 = _197;
        }
        int _349 = _325;
        bool _351 = _315 == 16;
        int _353 = _349;
        if (_319)
        {
            _353 = _217;
        }
        int _355 = _353;
        int _357 = _355;
        if (_321)
        {
            _357 = _237;
        }
        int _359 = _357;
        int _361 = _359;
        if (_323)
        {
            _361 = _255;
        }
        int _363 = _361;
        int _365 = _363;
        if (_351)
        {
            _365 = _265;
        }
        int _367 = _365;
        bool _369 = _367 > 0;
        _269 = _367;
        if (!_369)
        {
            _327 = _297;
        }
        int _371 = _327;
        bool _373 = !_369;
        int _375 = _371;
        if (!_373)
        {
            float _377 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x));
            float _379 = in.m_38.x;
            float _381 = gl_FragCoord.w;
            float _383 = _379 * _381;
            int _385 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y));
            float _387 = in.m_38.z;
            float _389 = gl_FragCoord.w;
            float _391 = _387 * _389;
            float _393 = float(uint(_293));
            float _395 = 1.0 / _377;
            float _397 = float(uint(_385));
            int _399 = abs(_293);
            int _401 = _293 << 6;
            float _403 = float(uint(_399));
            float _405 = 1.0 / _397;
            int _407 = as_type<int>(_395) + (-2);
            float _409 = as_type<float>(_407) * _393;
            int _411 = as_type<int>(_405) + (-2);
            float _413 = trunc(_409);
            float _415 = precise::max(_413, 0.0);
            uint _418 = uint(_415);
            float _420 = _62 * _383;
            float _422 = as_type<float>(_411) * _403;
            float _424 = _62 * _391;
            float _426 = trunc(_422);
            float _428 = precise::max(_426, 0.0);
            uint _430 = uint(_428);
            int _432 = ~int(_418);
            int _434 = _432 + 1;
            int _436 = _434 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _438 = _436 + _293;
            int _440 = ~int(_430);
            int _442 = _440 + 1;
            float _444 = float(uint(_438));
            int _446 = _442 * _385;
            int _448 = _446 + _399;
            float _450 = as_type<float>(_407) * _444;
            float _452 = float(uint(_448));
            float _454 = trunc(_450);
            float _456 = precise::max(_454, 0.0);
            uint _458 = uint(_456);
            float _460 = as_type<float>(_411) * _452;
            float _462 = trunc(_460);
            float _464 = precise::max(_462, 0.0);
            uint _466 = uint(_464);
            int _468 = int(_418) + int(_458);
            int _470 = -_468;
            int _472 = int(_430) + int(_466);
            int _474 = _470 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _476 = _474 + _293;
            int _478 = ~_472;
            int _480 = _478 + 1;
            bool _482 = uint(_476) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            float _484 = in.m_38.y;
            float _486 = gl_FragCoord.w;
            float _488 = _484 * _486;
            int _490 = _480 * _385;
            int _492 = _490 + _399;
            bool _494 = !_482;
            int _496 = _494 ? 0 : (-1);
            bool _498 = uint(_492) >= uint(_385);
            int _500 = ~_468;
            int _502 = _500 + _496;
            int _504 = _502 + 1;
            int _506 = _293 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            bool _508 = !_498;
            int _510 = _508 ? 0 : (-1);
            uint _512 = uint(int(uint(_506) >> uint(31)));
            int _514 = _504 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _516 = _514 + _293;
            bool _518 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _520 = ~_510;
            int _522 = _472 + _520;
            int _524 = _522 + 1;
            bool _526 = !_518;
            int _528 = _526 ? _516 : (-1);
            int _530 = ~int(_512);
            int _532 = _530 + 1;
            float _534 = float(_528);
            int _536 = _524 ^ _532;
            bool _538 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            float _540 = rint(_534);
            float _542 = precise::max(_540, 0.0);
            uint _544 = uint(_542);
            uint _546 = clamp(_544, 0u, 65535u);
            int _548 = ~_532;
            int _550 = _548 + _536;
            int _552 = _550 + 1;
            float _554 = _62 * _488;
            bool _556 = !_538;
            int _558 = _556 ? _552 : (-1);
            float _560 = float(_558);
            int _562 = 0;
            _333 = as_type<int>(_420);
            _335 = as_type<int>(_424);
            do
            {
                float _566 = _329;
                int _568 = _562;
                float _570 = _331;
                float _572 = _566 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _574 = _401 + 160;
                uint _576 = uint(int(uint(_574) >> uint(2)));
                uint _578 = uint(int(uint(int(_576)) >> uint(2)));
                int _580 = int(_576) & 3;
                float _582 = (*spvDescriptorSet0.fp_c3)._m0[int(_578)][_580];
                int _584 = int(_576) + 1;
                uint _586 = uint(int(uint(_584) >> uint(2)));
                int _588 = _584 & 3;
                float _590 = (*spvDescriptorSet0.fp_c3)._m0[int(_586)][_588];
                float _592 = abs(_572);
                float _594 = log2(_592);
                int _596 = _401 + 176;
                uint _598 = uint(int(uint(_596) >> uint(2)));
                uint _600 = uint(int(uint(int(_598)) >> uint(2)));
                int _602 = int(_598) & 3;
                float _604 = (*spvDescriptorSet0.fp_c3)._m0[int(_600)][_602];
                int _606 = int(_598) + 1;
                uint _608 = uint(int(uint(_606) >> uint(2)));
                int _610 = _606 & 3;
                float _612 = (*spvDescriptorSet0.fp_c3)._m0[int(_608)][_610];
                int _614 = _401 + 192;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                uint _618 = uint(int(uint(int(_616)) >> uint(2)));
                int _620 = int(_616) & 3;
                float _622 = (*spvDescriptorSet0.fp_c3)._m0[int(_618)][_620];
                int _624 = int(_616) + 1;
                uint _626 = uint(int(uint(_624) >> uint(2)));
                int _628 = _624 & 3;
                float _630 = (*spvDescriptorSet0.fp_c3)._m0[int(_626)][_628];
                float _632 = _594 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _634 = _401 + 208;
                uint _636 = uint(int(uint(_634) >> uint(2)));
                uint _638 = uint(int(uint(int(_636)) >> uint(2)));
                int _640 = int(_636) & 3;
                float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
                int _644 = int(_636) + 1;
                uint _646 = uint(int(uint(_644) >> uint(2)));
                int _648 = _644 & 3;
                float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
                float _652 = exp2(_632);
                int _654 = _401 + 216;
                uint _656 = uint(int(uint(_654) >> uint(2)));
                uint _658 = uint(int(uint(int(_656)) >> uint(2)));
                int _660 = int(_656) & 3;
                float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
                int _664 = int(_656) + 1;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                int _668 = _664 & 3;
                float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
                float _672 = fma(_652, _554, _102);
                float _674 = _672 * _590;
                float _676 = _672 * _612;
                float _678 = fma(_652, _420, _195);
                float _680 = _672 * _630;
                float _682 = _672 * _650;
                float _684 = fma(_652, _424, _108);
                float _686 = fma(_678, _604, _676);
                float _688 = fma(_678, _582, _674);
                int _690 = _401 + 184;
                uint _692 = uint(int(uint(_690) >> uint(2)));
                uint _694 = uint(int(uint(int(_692)) >> uint(2)));
                int _696 = int(_692) & 3;
                float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
                int _700 = int(_692) + 1;
                uint _702 = uint(int(uint(_700) >> uint(2)));
                int _704 = _700 & 3;
                float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
                float _708 = fma(_678, _622, _680);
                float _710 = fma(_678, _642, _682);
                float _712 = fma(_684, _662, _710);
                int _714 = _401 + 168;
                uint _716 = uint(int(uint(_714) >> uint(2)));
                uint _718 = uint(int(uint(int(_716)) >> uint(2)));
                int _720 = int(_716) & 3;
                float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
                int _724 = int(_716) + 1;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                int _728 = _724 & 3;
                float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
                float _732 = fma(_110, _670, _712);
                int _734 = _401 + 200;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                uint _738 = uint(int(uint(int(_736)) >> uint(2)));
                int _740 = int(_736) & 3;
                float _742 = (*spvDescriptorSet0.fp_c3)._m0[int(_738)][_740];
                int _744 = int(_736) + 1;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                int _748 = _744 & 3;
                float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
                float _752 = 1.0 / _732;
                float _754 = fma(_684, _698, _686);
                float _756 = fma(_110, _706, _754);
                float _758 = fma(_684, _722, _688);
                float _760 = _756 * _752;
                float _762 = fma(_110, _730, _758);
                float _764 = fma(_684, _742, _708);
                float _766 = _762 * _752;
                float _768 = fma(_110, _750, _764);
                float _770 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[35].z, _766);
                float _772 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[35].z, _766);
                float _774 = _768 * _752;
                float _776 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[35].w, _760);
                float _778 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[35].w, _760);
                float3 _1856 = float3(_770, _776, float(int(_546)));
                float3 _1860 = select(_1856, float3(0.0), isnan(_1856));
                float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1860.xy, uint(rint(_1860.z)), _774, level(_560));
                float3 _1870 = float3(_772, _776, float(int(_546)));
                float3 _1872 = select(_1870, float3(0.0), isnan(_1870));
                float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1872.xy, uint(rint(_1872.z)), _774, level(_560));
                float3 _1882 = float3(_770, _778, float(int(_546)));
                float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
                float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1884.xy, uint(rint(_1884.z)), _774, level(_560));
                float3 _1894 = float3(_772, _778, float(int(_546)));
                float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
                float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1896.xy, uint(rint(_1896.z)), _774, level(_560));
                int _788 = _568 + 1;
                float _790 = _566 + 1.0;
                bool _792 = _788 >= _367;
                float _794 = _780 + _782;
                float _796 = _794 + _784;
                float _798 = _796 + _786;
                float _800 = _798 * 0.25;
                float _802 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[35].x, (*spvDescriptorSet0.fp_c3)._m0[35].y);
                _804 = fma(_802, (*spvDescriptorSet0.fp_c3)._m0[8].x, _570);
                _564 = !_792;
                _329 = _790;
                _562 = _788;
                _331 = _804;
                _337 = _790;
                _339 = int(_546);
                _341 = as_type<int>(_800);
                _343 = as_type<int>(_802);
                _345 = as_type<int>(_662);
                _347 = as_type<int>(_670);
            } while (_564);
            _375 = as_type<int>(_804);
        }
        int _806 = _333;
        int _808 = _335;
        float _810 = _337;
        int _812 = _339;
        int _814 = _341;
        int _816 = _343;
        int _818 = _345;
        int _820 = _347;
        _822 = _375;
        int _824 = _293 + 1;
        bool _826 = _824 >= 5;
        _291 = !_826;
        _267 = _824;
        _271 = _822;
        _273 = _806;
        _275 = _808;
        _277 = _810;
        _279 = _812;
        _281 = _814;
        _283 = _816;
        _285 = _818;
        _287 = _820;
    } while (_291);
    out.m_41.x = as_type<float>(_822);
    out.m_41.y = as_type<float>(_822);
    out.m_41.z = as_type<float>(_822);
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
    float2 _860 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_860, float2(0.0), isnan(_860))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_860, float2(0.0), isnan(_860))).x;
    float _70 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _72 = in.m_36.y;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = (*spvDescriptorSet0.fp_c3)._m0[7].z * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_36.w;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = 1.0 / _78;
    float _94 = _92 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _96 = _94 * (*spvDescriptorSet0.fp_c3)._m0[31].x;
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _100 = _94 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _102 = _62 * _76;
    float _104 = abs(_96);
    float _106 = log2(_104);
    float _108 = _62 * _84;
    float _110 = _62 * _90;
    float _112 = abs(_98);
    float _114 = log2(_112);
    float _116 = abs(_100);
    float _118 = log2(_116);
    float _120 = _106 * _70;
    float _122 = exp2(_120);
    float _124 = _114 * _70;
    float _126 = _118 * _70;
    float _128 = -_68;
    float _130 = fma(_128, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _132 = _94 * (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _134 = 1.0 / _130;
    float _136 = abs(_132);
    float _138 = log2(_136);
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _142 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[8].y, _140);
    float _144 = _142 * _94;
    float _146 = exp2(_124);
    float _148 = _138 * _70;
    float _150 = abs(_144);
    float _152 = log2(_150);
    float _154 = exp2(_148);
    float _156 = _152 * _70;
    float _158 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _160 = exp2(_126);
    float _162 = _158 * _122;
    float _164 = _158 * _146;
    float _166 = _158 * _154;
    float _168 = exp2(_156);
    float _170 = in.m_36.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = _158 * _160;
    float _178 = ceil(_162);
    int _181 = int(_178);
    float _183 = _158 * _168;
    float _185 = ceil(_166);
    float _187 = precise::min(_158, _183);
    float _189 = trunc(_187);
    int _191 = int(_189);
    float _193 = ceil(_164);
    float _195 = _62 * _174;
    int _197 = min(_181, _191);
    float _199 = ceil(_176);
    float _201 = float(_197);
    int _203 = ~_197;
    int _205 = _191 + _203;
    int _207 = _205 + 1;
    float _209 = -_201;
    float _211 = _185 + _209;
    float _213 = trunc(_211);
    int _215 = int(_213);
    int _217 = min(_215, _207);
    int _219 = _197 + _217;
    float _221 = float(_219);
    int _223 = ~_219;
    int _225 = _191 + _223;
    int _227 = _225 + 1;
    float _229 = -_221;
    float _231 = _193 + _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = min(_235, _227);
    int _239 = _219 + _237;
    float _241 = float(_239);
    int _243 = -_239;
    int _245 = _191 + _243;
    float _247 = -_241;
    float _249 = _199 + _247;
    float _251 = trunc(_249);
    int _253 = int(_251);
    int _255 = min(_253, _245);
    int _257 = ~_239;
    int _259 = ~_255;
    int _261 = _191 + _257;
    int _263 = _261 + _259;
    int _265 = _263 + 2;
    int _267 = 0;
    int _269 = 0;
    int _271 = 0;
    int _273 = 0;
    int _275 = 0;
    float _277 = 0.0;
    int _279 = 0;
    int _281 = 0;
    int _283 = 0;
    int _285 = 0;
    int _287 = 0;
    bool _291;
    bool _564;
    float _804;
    int _822;
    do
    {
        int _293 = _267;
        int _295 = _269;
        int _297 = _271;
        int _299 = _273;
        int _301 = _275;
        float _303 = _277;
        int _305 = _279;
        int _307 = _281;
        int _309 = _283;
        int _311 = _285;
        int _313 = _287;
        int _315 = _293 << 2;
        bool _317 = _315 == 0;
        bool _319 = _315 == 4;
        bool _321 = _315 == 8;
        bool _323 = _315 == 12;
        int _325 = _295;
        int _327 = _315;
        float _329 = _303;
        float _331 = as_type<float>(_297);
        int _333 = _299;
        int _335 = _301;
        float _337 = _303;
        int _339 = _305;
        int _341 = _307;
        int _343 = _309;
        int _345 = _311;
        int _347 = _313;
        if (_317)
        {
            _325 = _197;
        }
        int _349 = _325;
        bool _351 = _315 == 16;
        int _353 = _349;
        if (_319)
        {
            _353 = _217;
        }
        int _355 = _353;
        int _357 = _355;
        if (_321)
        {
            _357 = _237;
        }
        int _359 = _357;
        int _361 = _359;
        if (_323)
        {
            _361 = _255;
        }
        int _363 = _361;
        int _365 = _363;
        if (_351)
        {
            _365 = _265;
        }
        int _367 = _365;
        bool _369 = _367 > 0;
        _269 = _367;
        if (!_369)
        {
            _327 = _297;
        }
        int _371 = _327;
        bool _373 = !_369;
        int _375 = _371;
        if (!_373)
        {
            float _377 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x));
            float _379 = in.m_38.x;
            float _381 = gl_FragCoord.w;
            float _383 = _379 * _381;
            int _385 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y));
            float _387 = in.m_38.z;
            float _389 = gl_FragCoord.w;
            float _391 = _387 * _389;
            float _393 = float(uint(_293));
            float _395 = 1.0 / _377;
            float _397 = float(uint(_385));
            int _399 = abs(_293);
            int _401 = _293 << 6;
            float _403 = float(uint(_399));
            float _405 = 1.0 / _397;
            int _407 = as_type<int>(_395) + (-2);
            float _409 = as_type<float>(_407) * _393;
            int _411 = as_type<int>(_405) + (-2);
            float _413 = trunc(_409);
            float _415 = precise::max(_413, 0.0);
            uint _418 = uint(_415);
            float _420 = _62 * _383;
            float _422 = as_type<float>(_411) * _403;
            float _424 = _62 * _391;
            float _426 = trunc(_422);
            float _428 = precise::max(_426, 0.0);
            uint _430 = uint(_428);
            int _432 = ~int(_418);
            int _434 = _432 + 1;
            int _436 = _434 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _438 = _436 + _293;
            int _440 = ~int(_430);
            int _442 = _440 + 1;
            float _444 = float(uint(_438));
            int _446 = _442 * _385;
            int _448 = _446 + _399;
            float _450 = as_type<float>(_407) * _444;
            float _452 = float(uint(_448));
            float _454 = trunc(_450);
            float _456 = precise::max(_454, 0.0);
            uint _458 = uint(_456);
            float _460 = as_type<float>(_411) * _452;
            float _462 = trunc(_460);
            float _464 = precise::max(_462, 0.0);
            uint _466 = uint(_464);
            int _468 = int(_418) + int(_458);
            int _470 = -_468;
            int _472 = int(_430) + int(_466);
            int _474 = _470 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _476 = _474 + _293;
            int _478 = ~_472;
            int _480 = _478 + 1;
            bool _482 = uint(_476) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            float _484 = in.m_38.y;
            float _486 = gl_FragCoord.w;
            float _488 = _484 * _486;
            int _490 = _480 * _385;
            int _492 = _490 + _399;
            bool _494 = !_482;
            int _496 = _494 ? 0 : (-1);
            bool _498 = uint(_492) >= uint(_385);
            int _500 = ~_468;
            int _502 = _500 + _496;
            int _504 = _502 + 1;
            int _506 = _293 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            bool _508 = !_498;
            int _510 = _508 ? 0 : (-1);
            uint _512 = uint(int(uint(_506) >> uint(31)));
            int _514 = _504 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _516 = _514 + _293;
            bool _518 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _520 = ~_510;
            int _522 = _472 + _520;
            int _524 = _522 + 1;
            bool _526 = !_518;
            int _528 = _526 ? _516 : (-1);
            int _530 = ~int(_512);
            int _532 = _530 + 1;
            float _534 = float(_528);
            int _536 = _524 ^ _532;
            bool _538 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            float _540 = rint(_534);
            float _542 = precise::max(_540, 0.0);
            uint _544 = uint(_542);
            uint _546 = clamp(_544, 0u, 65535u);
            int _548 = ~_532;
            int _550 = _548 + _536;
            int _552 = _550 + 1;
            float _554 = _62 * _488;
            bool _556 = !_538;
            int _558 = _556 ? _552 : (-1);
            float _560 = float(_558);
            int _562 = 0;
            _333 = as_type<int>(_420);
            _335 = as_type<int>(_424);
            do
            {
                float _566 = _329;
                int _568 = _562;
                float _570 = _331;
                float _572 = _566 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _574 = _401 + 160;
                uint _576 = uint(int(uint(_574) >> uint(2)));
                uint _578 = uint(int(uint(int(_576)) >> uint(2)));
                int _580 = int(_576) & 3;
                float _582 = (*spvDescriptorSet0.fp_c3)._m0[int(_578)][_580];
                int _584 = int(_576) + 1;
                uint _586 = uint(int(uint(_584) >> uint(2)));
                int _588 = _584 & 3;
                float _590 = (*spvDescriptorSet0.fp_c3)._m0[int(_586)][_588];
                float _592 = abs(_572);
                float _594 = log2(_592);
                int _596 = _401 + 176;
                uint _598 = uint(int(uint(_596) >> uint(2)));
                uint _600 = uint(int(uint(int(_598)) >> uint(2)));
                int _602 = int(_598) & 3;
                float _604 = (*spvDescriptorSet0.fp_c3)._m0[int(_600)][_602];
                int _606 = int(_598) + 1;
                uint _608 = uint(int(uint(_606) >> uint(2)));
                int _610 = _606 & 3;
                float _612 = (*spvDescriptorSet0.fp_c3)._m0[int(_608)][_610];
                int _614 = _401 + 192;
                uint _616 = uint(int(uint(_614) >> uint(2)));
                uint _618 = uint(int(uint(int(_616)) >> uint(2)));
                int _620 = int(_616) & 3;
                float _622 = (*spvDescriptorSet0.fp_c3)._m0[int(_618)][_620];
                int _624 = int(_616) + 1;
                uint _626 = uint(int(uint(_624) >> uint(2)));
                int _628 = _624 & 3;
                float _630 = (*spvDescriptorSet0.fp_c3)._m0[int(_626)][_628];
                float _632 = _594 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _634 = _401 + 208;
                uint _636 = uint(int(uint(_634) >> uint(2)));
                uint _638 = uint(int(uint(int(_636)) >> uint(2)));
                int _640 = int(_636) & 3;
                float _642 = (*spvDescriptorSet0.fp_c3)._m0[int(_638)][_640];
                int _644 = int(_636) + 1;
                uint _646 = uint(int(uint(_644) >> uint(2)));
                int _648 = _644 & 3;
                float _650 = (*spvDescriptorSet0.fp_c3)._m0[int(_646)][_648];
                float _652 = exp2(_632);
                int _654 = _401 + 216;
                uint _656 = uint(int(uint(_654) >> uint(2)));
                uint _658 = uint(int(uint(int(_656)) >> uint(2)));
                int _660 = int(_656) & 3;
                float _662 = (*spvDescriptorSet0.fp_c3)._m0[int(_658)][_660];
                int _664 = int(_656) + 1;
                uint _666 = uint(int(uint(_664) >> uint(2)));
                int _668 = _664 & 3;
                float _670 = (*spvDescriptorSet0.fp_c3)._m0[int(_666)][_668];
                float _672 = fma(_652, _554, _102);
                float _674 = _672 * _590;
                float _676 = _672 * _612;
                float _678 = fma(_652, _420, _195);
                float _680 = _672 * _630;
                float _682 = _672 * _650;
                float _684 = fma(_652, _424, _108);
                float _686 = fma(_678, _604, _676);
                float _688 = fma(_678, _582, _674);
                int _690 = _401 + 184;
                uint _692 = uint(int(uint(_690) >> uint(2)));
                uint _694 = uint(int(uint(int(_692)) >> uint(2)));
                int _696 = int(_692) & 3;
                float _698 = (*spvDescriptorSet0.fp_c3)._m0[int(_694)][_696];
                int _700 = int(_692) + 1;
                uint _702 = uint(int(uint(_700) >> uint(2)));
                int _704 = _700 & 3;
                float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
                float _708 = fma(_678, _622, _680);
                float _710 = fma(_678, _642, _682);
                float _712 = fma(_684, _662, _710);
                int _714 = _401 + 168;
                uint _716 = uint(int(uint(_714) >> uint(2)));
                uint _718 = uint(int(uint(int(_716)) >> uint(2)));
                int _720 = int(_716) & 3;
                float _722 = (*spvDescriptorSet0.fp_c3)._m0[int(_718)][_720];
                int _724 = int(_716) + 1;
                uint _726 = uint(int(uint(_724) >> uint(2)));
                int _728 = _724 & 3;
                float _730 = (*spvDescriptorSet0.fp_c3)._m0[int(_726)][_728];
                float _732 = fma(_110, _670, _712);
                int _734 = _401 + 200;
                uint _736 = uint(int(uint(_734) >> uint(2)));
                uint _738 = uint(int(uint(int(_736)) >> uint(2)));
                int _740 = int(_736) & 3;
                float _742 = (*spvDescriptorSet0.fp_c3)._m0[int(_738)][_740];
                int _744 = int(_736) + 1;
                uint _746 = uint(int(uint(_744) >> uint(2)));
                int _748 = _744 & 3;
                float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
                float _752 = 1.0 / _732;
                float _754 = fma(_684, _698, _686);
                float _756 = fma(_110, _706, _754);
                float _758 = fma(_684, _722, _688);
                float _760 = _756 * _752;
                float _762 = fma(_110, _730, _758);
                float _764 = fma(_684, _742, _708);
                float _766 = _762 * _752;
                float _768 = fma(_110, _750, _764);
                float _770 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[35].z, _766);
                float _772 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[35].z, _766);
                float _774 = _768 * _752;
                float _776 = fma(-0.5, (*spvDescriptorSet0.fp_c3)._m0[35].w, _760);
                float _778 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[35].w, _760);
                float3 _1856 = float3(_770, _776, float(int(_546)));
                float3 _1860 = select(_1856, float3(0.0), isnan(_1856));
                float _780 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1860.xy, uint(rint(_1860.z)), _774, level(_560));
                float3 _1870 = float3(_772, _776, float(int(_546)));
                float3 _1872 = select(_1870, float3(0.0), isnan(_1870));
                float _782 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1872.xy, uint(rint(_1872.z)), _774, level(_560));
                float3 _1882 = float3(_770, _778, float(int(_546)));
                float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
                float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1884.xy, uint(rint(_1884.z)), _774, level(_560));
                float3 _1894 = float3(_772, _778, float(int(_546)));
                float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
                float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1896.xy, uint(rint(_1896.z)), _774, level(_560));
                int _788 = _568 + 1;
                float _790 = _566 + 1.0;
                bool _792 = _788 >= _367;
                float _794 = _780 + _782;
                float _796 = _794 + _784;
                float _798 = _796 + _786;
                float _800 = _798 * 0.25;
                float _802 = fma(_800, (*spvDescriptorSet0.fp_c3)._m0[35].x, (*spvDescriptorSet0.fp_c3)._m0[35].y);
                _804 = fma(_802, (*spvDescriptorSet0.fp_c3)._m0[8].x, _570);
                _564 = !_792;
                _329 = _790;
                _562 = _788;
                _331 = _804;
                _337 = _790;
                _339 = int(_546);
                _341 = as_type<int>(_800);
                _343 = as_type<int>(_802);
                _345 = as_type<int>(_662);
                _347 = as_type<int>(_670);
            } while (_564);
            _375 = as_type<int>(_804);
        }
        int _806 = _333;
        int _808 = _335;
        float _810 = _337;
        int _812 = _339;
        int _814 = _341;
        int _816 = _343;
        int _818 = _345;
        int _820 = _347;
        _822 = _375;
        int _824 = _293 + 1;
        bool _826 = _824 >= 5;
        _291 = !_826;
        _267 = _824;
        _271 = _822;
        _273 = _806;
        _275 = _808;
        _277 = _810;
        _279 = _812;
        _281 = _814;
        _283 = _816;
        _285 = _818;
        _287 = _820;
    } while (_291);
    out.m_41.x = as_type<float>(_822);
    out.m_41.y = as_type<float>(_822);
    out.m_41.z = as_type<float>(_822);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

