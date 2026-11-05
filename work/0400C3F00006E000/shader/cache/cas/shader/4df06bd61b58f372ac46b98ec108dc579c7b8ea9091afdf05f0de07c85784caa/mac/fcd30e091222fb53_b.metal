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
    float2 _892 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_892, float2(0.0), isnan(_892))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_892, float2(0.0), isnan(_892))).x;
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
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _100 = _62 * _76;
    float _102 = abs(_96);
    float _104 = log2(_102);
    float _106 = _94 * (*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _108 = _62 * _84;
    float _110 = _62 * _90;
    float _112 = abs(_106);
    float _114 = log2(_112);
    float _116 = _104 * _70;
    float _118 = abs(_98);
    float _120 = log2(_118);
    float _122 = _114 * _70;
    float _124 = exp2(_116);
    float _126 = _120 * _70;
    float _128 = in.m_36.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _62 * _132;
    float _136 = -_68;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _140 = _94 * (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _142 = 1.0 / _138;
    float _144 = abs(_140);
    float _146 = log2(_144);
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _150 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[8].y, _148);
    float _152 = _150 * _94;
    float _154 = exp2(_122);
    float _156 = _146 * _70;
    float _158 = abs(_152);
    float _160 = log2(_158);
    float _162 = exp2(_156);
    float _164 = _160 * _70;
    float _166 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _168 = exp2(_126);
    float _170 = _166 * _124;
    float _172 = _166 * _154;
    float _174 = _166 * _162;
    float _176 = exp2(_164);
    float _178 = ceil(_170);
    int _181 = int(_178);
    float _183 = _166 * _168;
    float _185 = _166 * _176;
    float _187 = ceil(_174);
    float _189 = precise::min(_166, _185);
    float _191 = trunc(_189);
    int _193 = int(_191);
    float _195 = ceil(_172);
    int _197 = min(_181, _193);
    float _199 = ceil(_183);
    float _201 = float(_197);
    int _203 = ~_197;
    int _205 = _193 + _203;
    int _207 = _205 + 1;
    float _209 = -_201;
    float _211 = _187 + _209;
    float _213 = trunc(_211);
    int _215 = int(_213);
    int _217 = min(_215, _207);
    int _219 = _197 + _217;
    float _221 = float(_219);
    int _223 = ~_219;
    int _225 = _193 + _223;
    int _227 = _225 + 1;
    float _229 = -_221;
    float _231 = _195 + _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = min(_235, _227);
    int _239 = _219 + _237;
    float _241 = float(_239);
    int _243 = ~_239;
    int _245 = _193 + _243;
    int _247 = _245 + 1;
    float _249 = -_241;
    float _251 = _199 + _249;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = min(_255, _247);
    int _259 = ~_239;
    int _261 = ~_257;
    int _263 = _193 + _259;
    int _265 = _263 + _261;
    int _267 = _265 + 2;
    int _269 = 0;
    int _271 = as_type<int>(_187);
    int _273 = 0;
    float _275 = 0.0;
    int _277 = 0;
    int _279 = 0;
    int _281 = 0;
    int _283 = 0;
    int _285 = 0;
    int _287 = 0;
    float _289 = 0.0;
    bool _293;
    bool _568;
    float _836;
    int _854;
    do
    {
        int _295 = _269;
        int _297 = _271;
        int _299 = _273;
        float _301 = _275;
        int _303 = _277;
        int _305 = _279;
        int _307 = _281;
        int _309 = _283;
        int _311 = _285;
        int _313 = _287;
        float _315 = _289;
        int _317 = _295 * 4;
        bool _319 = _317 == 0;
        bool _321 = _317 == 4;
        bool _323 = _317 == 8;
        bool _325 = _317 == 12;
        int _327 = _297;
        int _329 = _317;
        float _331 = _301;
        float _333 = _315;
        float _335 = as_type<float>(_299);
        float _337 = _301;
        int _339 = _303;
        int _341 = _305;
        int _343 = _307;
        int _345 = _309;
        int _347 = _311;
        int _349 = _313;
        float _351 = _315;
        if (_319)
        {
            _327 = _197;
        }
        int _353 = _327;
        bool _355 = _317 == 16;
        int _357 = _353;
        if (_321)
        {
            _357 = _217;
        }
        int _359 = _357;
        int _361 = _359;
        if (_323)
        {
            _361 = _237;
        }
        int _363 = _361;
        int _365 = _363;
        if (_325)
        {
            _365 = _257;
        }
        int _367 = _365;
        int _369 = _367;
        if (_355)
        {
            _369 = _267;
        }
        int _371 = _369;
        bool _373 = _371 > 0;
        _271 = _371;
        if (!_373)
        {
            _329 = _299;
        }
        int _375 = _329;
        bool _377 = !_373;
        int _379 = _375;
        if (!_377)
        {
            float _381 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x));
            int _383 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y));
            float _385 = float(uint(_295));
            float _387 = 1.0 / _381;
            float _389 = float(uint(_383));
            int _391 = abs(_295);
            float _393 = float(uint(_391));
            float _395 = 1.0 / _389;
            int _397 = as_type<int>(_387) + (-2);
            float _399 = as_type<float>(_397) * _385;
            int _401 = as_type<int>(_395) + (-2);
            float _403 = trunc(_399);
            float _405 = precise::max(_403, 0.0);
            uint _408 = uint(_405);
            float _410 = as_type<float>(_401) * _393;
            float _412 = trunc(_410);
            float _414 = precise::max(_412, 0.0);
            uint _416 = uint(_414);
            int _418 = ~int(_408);
            int _420 = _418 + 1;
            int _422 = _420 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _424 = _422 + _295;
            int _426 = ~int(_416);
            int _428 = _426 + 1;
            float _430 = float(uint(_424));
            int _432 = _428 * _383;
            int _434 = _432 + _391;
            float _436 = as_type<float>(_397) * _430;
            float _438 = float(uint(_434));
            float _440 = trunc(_436);
            float _442 = precise::max(_440, 0.0);
            uint _444 = uint(_442);
            float _446 = as_type<float>(_401) * _438;
            float _448 = trunc(_446);
            float _450 = precise::max(_448, 0.0);
            uint _452 = uint(_450);
            int _454 = _295 << 6;
            int _456 = int(_408) + int(_444);
            int _458 = ~_456;
            int _460 = _458 + 1;
            int _462 = int(_416) + int(_452);
            float _464 = in.m_38.x;
            float _466 = gl_FragCoord.w;
            float _468 = _464 * _466;
            int _470 = -_462;
            int _472 = _460 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _474 = _472 + _295;
            int _476 = _470 * _383;
            int _478 = _476 + _391;
            float _480 = in.m_38.y;
            float _482 = gl_FragCoord.w;
            float _484 = _480 * _482;
            bool _486 = uint(_474) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            float _488 = in.m_38.z;
            float _490 = gl_FragCoord.w;
            float _492 = _488 * _490;
            bool _494 = !_486;
            int _496 = _494 ? 0 : (-1);
            bool _498 = uint(_478) >= uint(_383);
            int _500 = ~_456;
            int _502 = _500 + _496;
            int _504 = _502 + 1;
            int _506 = _295 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            bool _508 = !_498;
            int _510 = _508 ? 0 : (-1);
            uint _512 = uint(int(uint(_506) >> uint(31)));
            int _514 = _504 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _516 = _514 + _295;
            bool _518 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _520 = ~_510;
            int _522 = _462 + _520;
            int _524 = _522 + 1;
            bool _526 = !_518;
            int _528 = _526 ? _516 : (-1);
            int _530 = ~int(_512);
            int _532 = _530 + 1;
            float _534 = float(_528);
            float _536 = _62 * _468;
            int _538 = _524 ^ _532;
            bool _540 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            float _542 = rint(_534);
            float _544 = precise::max(_542, 0.0);
            uint _546 = uint(_544);
            uint _548 = clamp(_546, 0u, 65535u);
            int _550 = ~_532;
            int _552 = _550 + _538;
            int _554 = _552 + 1;
            float _556 = _62 * _484;
            float _558 = _62 * _492;
            bool _560 = !_540;
            int _562 = _560 ? _554 : (-1);
            float _564 = float(_562);
            int _566 = 0;
            do
            {
                float _570 = _331;
                float _572 = _333;
                int _574 = _566;
                float _576 = _335;
                float _578 = _570 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _580 = _454 + 160;
                uint _582 = uint(int(uint(_580) >> uint(2)));
                uint _584 = uint(int(uint(int(_582)) >> uint(2)));
                int _586 = int(_582) & 3;
                float _588 = (*spvDescriptorSet0.fp_c3)._m0[int(_584)][_586];
                int _590 = int(_582) + 1;
                uint _592 = uint(int(uint(_590) >> uint(2)));
                int _594 = _590 & 3;
                float _596 = (*spvDescriptorSet0.fp_c3)._m0[int(_592)][_594];
                float _598 = abs(_578);
                float _600 = log2(_598);
                int _602 = _454 + 176;
                uint _604 = uint(int(uint(_602) >> uint(2)));
                uint _606 = uint(int(uint(int(_604)) >> uint(2)));
                int _608 = int(_604) & 3;
                float _610 = (*spvDescriptorSet0.fp_c3)._m0[int(_606)][_608];
                int _612 = int(_604) + 1;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                int _616 = _612 & 3;
                float _618 = (*spvDescriptorSet0.fp_c3)._m0[int(_614)][_616];
                int _620 = _454 + 192;
                uint _622 = uint(int(uint(_620) >> uint(2)));
                uint _624 = uint(int(uint(int(_622)) >> uint(2)));
                int _626 = int(_622) & 3;
                float _628 = (*spvDescriptorSet0.fp_c3)._m0[int(_624)][_626];
                int _630 = int(_622) + 1;
                uint _632 = uint(int(uint(_630) >> uint(2)));
                int _634 = _630 & 3;
                float _636 = (*spvDescriptorSet0.fp_c3)._m0[int(_632)][_634];
                float _638 = _600 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _640 = _454 + 208;
                uint _642 = uint(int(uint(_640) >> uint(2)));
                uint _644 = uint(int(uint(int(_642)) >> uint(2)));
                int _646 = int(_642) & 3;
                float _648 = (*spvDescriptorSet0.fp_c3)._m0[int(_644)][_646];
                int _650 = int(_642) + 1;
                uint _652 = uint(int(uint(_650) >> uint(2)));
                int _654 = _650 & 3;
                float _656 = (*spvDescriptorSet0.fp_c3)._m0[int(_652)][_654];
                float _658 = exp2(_638);
                int _660 = _454 + 216;
                uint _662 = uint(int(uint(_660) >> uint(2)));
                uint _664 = uint(int(uint(int(_662)) >> uint(2)));
                int _666 = int(_662) & 3;
                float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
                int _670 = int(_662) + 1;
                uint _672 = uint(int(uint(_670) >> uint(2)));
                int _674 = _670 & 3;
                float _676 = (*spvDescriptorSet0.fp_c3)._m0[int(_672)][_674];
                float _678 = fma(_658, _556, _100);
                float _680 = _678 * _596;
                float _682 = _678 * _618;
                float _684 = fma(_658, _536, _134);
                float _686 = _678 * _636;
                float _688 = _678 * _656;
                float _690 = fma(_684, _588, _680);
                float _692 = fma(_684, _610, _682);
                float _694 = fma(_684, _628, _686);
                float _696 = fma(_684, _648, _688);
                int _698 = _454 + 168;
                uint _700 = uint(int(uint(_698) >> uint(2)));
                uint _702 = uint(int(uint(int(_700)) >> uint(2)));
                int _704 = int(_700) & 3;
                float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
                int _708 = int(_700) + 1;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                int _712 = _708 & 3;
                float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
                float _716 = fma(_658, _558, _108);
                float _718 = fma(_716, _668, _696);
                int _720 = _454 + 200;
                uint _722 = uint(int(uint(_720) >> uint(2)));
                uint _724 = uint(int(uint(int(_722)) >> uint(2)));
                int _726 = int(_722) & 3;
                float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
                int _730 = int(_722) + 1;
                uint _732 = uint(int(uint(_730) >> uint(2)));
                int _734 = _730 & 3;
                float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
                float _738 = fma(_110, _676, _718);
                float _740 = 1.0 / _738;
                int _742 = _454 + 184;
                uint _744 = uint(int(uint(_742) >> uint(2)));
                uint _746 = uint(int(uint(int(_744)) >> uint(2)));
                int _748 = int(_744) & 3;
                float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
                int _752 = int(_744) + 1;
                uint _754 = uint(int(uint(_752) >> uint(2)));
                int _756 = _752 & 3;
                float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
                float _760 = fma(_716, _706, _690);
                float _762 = fma(_110, _714, _760);
                float _764 = fma(_716, _728, _694);
                float _766 = _762 * _740;
                float _768 = fma(_110, _736, _764);
                float _770 = -(*spvDescriptorSet0.fp_c3)._m0[35].z;
                float _772 = _766 + _770;
                float _774 = fma(_716, _750, _692);
                float _776 = _768 * _740;
                float _778 = fma(_110, _758, _774);
                float _780 = _778 * _740;
                float _782 = _766 + (*spvDescriptorSet0.fp_c3)._m0[35].z;
                float _784 = -(*spvDescriptorSet0.fp_c3)._m0[35].w;
                float _786 = _780 + _784;
                float3 _1888 = float3(_766, _780, float(int(_548)));
                float3 _1892 = select(_1888, float3(0.0), isnan(_1888));
                float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1892.xy, uint(rint(_1892.z)), _776, level(_564));
                float _790 = _780 + (*spvDescriptorSet0.fp_c3)._m0[35].w;
                float3 _1906 = float3(_772, _780, float(int(_548)));
                float3 _1908 = select(_1906, float3(0.0), isnan(_1906));
                float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1908.xy, uint(rint(_1908.z)), _776, level(_564));
                float3 _1918 = float3(_766, _786, float(int(_548)));
                float3 _1920 = select(_1918, float3(0.0), isnan(_1918));
                float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1920.xy, uint(rint(_1920.z)), _776, level(_564));
                float3 _1930 = float3(_782, _780, float(int(_548)));
                float3 _1932 = select(_1930, float3(0.0), isnan(_1930));
                float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1932.xy, uint(rint(_1932.z)), _776, level(_564));
                float3 _1942 = float3(_766, _790, float(int(_548)));
                float3 _1944 = select(_1942, float3(0.0), isnan(_1942));
                float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1944.xy, uint(rint(_1944.z)), _776, level(_564));
                float _800 = _788 + _572;
                float _802 = _800 + _792;
                float _804 = _802 + _794;
                float _806 = _804 + _796;
                float3 _1966 = float3(_772, _786, float(int(_548)));
                float3 _1968 = select(_1966, float3(0.0), isnan(_1966));
                float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1968.xy, uint(rint(_1968.z)), _776, level(_564));
                float3 _1978 = float3(_782, _786, float(int(_548)));
                float3 _1980 = select(_1978, float3(0.0), isnan(_1978));
                float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1980.xy, uint(rint(_1980.z)), _776, level(_564));
                float3 _1990 = float3(_772, _790, float(int(_548)));
                float3 _1992 = select(_1990, float3(0.0), isnan(_1990));
                float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1992.xy, uint(rint(_1992.z)), _776, level(_564));
                float3 _2002 = float3(_782, _790, float(int(_548)));
                float3 _2004 = select(_2002, float3(0.0), isnan(_2002));
                float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2004.xy, uint(rint(_2004.z)), _776, level(_564));
                float _816 = _806 + _798;
                int _818 = _574 + 1;
                float _820 = _570 + 1.0;
                bool _822 = _818 >= _371;
                float _824 = _816 + _808;
                float _826 = _824 + _810;
                float _828 = _826 + _812;
                float _830 = _828 + _814;
                float _832 = _830 * 0.111111111938953399658203125;
                float _834 = fma(_832, (*spvDescriptorSet0.fp_c3)._m0[35].x, (*spvDescriptorSet0.fp_c3)._m0[35].y);
                _836 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[8].x, _576);
                _568 = !_822;
                _331 = _820;
                _333 = _832;
                _566 = _818;
                _335 = _836;
                _337 = _820;
                _339 = int(_548);
                _341 = as_type<int>(_782);
                _343 = as_type<int>(_798);
                _345 = as_type<int>(_766);
                _347 = int(_548);
                _349 = as_type<int>(_772);
                _351 = _832;
            } while (_568);
            _379 = as_type<int>(_836);
        }
        float _838 = _337;
        int _840 = _339;
        int _842 = _341;
        int _844 = _343;
        int _846 = _345;
        int _848 = _347;
        int _850 = _349;
        float _852 = _351;
        _854 = _379;
        int _856 = _295 + 1;
        bool _858 = _856 >= 5;
        _293 = !_858;
        _269 = _856;
        _273 = _854;
        _275 = _838;
        _277 = _840;
        _279 = _842;
        _281 = _844;
        _283 = _846;
        _285 = _848;
        _287 = _850;
        _289 = _852;
    } while (_293);
    out.m_41.x = as_type<float>(_854);
    out.m_41.y = as_type<float>(_854);
    out.m_41.z = as_type<float>(_854);
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
    float2 _892 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_892, float2(0.0), isnan(_892))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_892, float2(0.0), isnan(_892))).x;
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
    float _98 = _94 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _100 = _62 * _76;
    float _102 = abs(_96);
    float _104 = log2(_102);
    float _106 = _94 * (*spvDescriptorSet0.fp_c3)._m0[33].x;
    float _108 = _62 * _84;
    float _110 = _62 * _90;
    float _112 = abs(_106);
    float _114 = log2(_112);
    float _116 = _104 * _70;
    float _118 = abs(_98);
    float _120 = log2(_118);
    float _122 = _114 * _70;
    float _124 = exp2(_116);
    float _126 = _120 * _70;
    float _128 = in.m_36.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = _62 * _132;
    float _136 = -_68;
    float _138 = fma(_136, (*spvDescriptorSet0.fp_c3)._m0[8].w, 1.0);
    float _140 = _94 * (*spvDescriptorSet0.fp_c3)._m0[32].x;
    float _142 = 1.0 / _138;
    float _144 = abs(_140);
    float _146 = log2(_144);
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _150 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[8].y, _148);
    float _152 = _150 * _94;
    float _154 = exp2(_122);
    float _156 = _146 * _70;
    float _158 = abs(_152);
    float _160 = log2(_158);
    float _162 = exp2(_156);
    float _164 = _160 * _70;
    float _166 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[9].x));
    float _168 = exp2(_126);
    float _170 = _166 * _124;
    float _172 = _166 * _154;
    float _174 = _166 * _162;
    float _176 = exp2(_164);
    float _178 = ceil(_170);
    int _181 = int(_178);
    float _183 = _166 * _168;
    float _185 = _166 * _176;
    float _187 = ceil(_174);
    float _189 = precise::min(_166, _185);
    float _191 = trunc(_189);
    int _193 = int(_191);
    float _195 = ceil(_172);
    int _197 = min(_181, _193);
    float _199 = ceil(_183);
    float _201 = float(_197);
    int _203 = ~_197;
    int _205 = _193 + _203;
    int _207 = _205 + 1;
    float _209 = -_201;
    float _211 = _187 + _209;
    float _213 = trunc(_211);
    int _215 = int(_213);
    int _217 = min(_215, _207);
    int _219 = _197 + _217;
    float _221 = float(_219);
    int _223 = ~_219;
    int _225 = _193 + _223;
    int _227 = _225 + 1;
    float _229 = -_221;
    float _231 = _195 + _229;
    float _233 = trunc(_231);
    int _235 = int(_233);
    int _237 = min(_235, _227);
    int _239 = _219 + _237;
    float _241 = float(_239);
    int _243 = ~_239;
    int _245 = _193 + _243;
    int _247 = _245 + 1;
    float _249 = -_241;
    float _251 = _199 + _249;
    float _253 = trunc(_251);
    int _255 = int(_253);
    int _257 = min(_255, _247);
    int _259 = ~_239;
    int _261 = ~_257;
    int _263 = _193 + _259;
    int _265 = _263 + _261;
    int _267 = _265 + 2;
    int _269 = 0;
    int _271 = as_type<int>(_187);
    int _273 = 0;
    float _275 = 0.0;
    int _277 = 0;
    int _279 = 0;
    int _281 = 0;
    int _283 = 0;
    int _285 = 0;
    int _287 = 0;
    float _289 = 0.0;
    bool _293;
    bool _568;
    float _836;
    int _854;
    do
    {
        int _295 = _269;
        int _297 = _271;
        int _299 = _273;
        float _301 = _275;
        int _303 = _277;
        int _305 = _279;
        int _307 = _281;
        int _309 = _283;
        int _311 = _285;
        int _313 = _287;
        float _315 = _289;
        int _317 = _295 * 4;
        bool _319 = _317 == 0;
        bool _321 = _317 == 4;
        bool _323 = _317 == 8;
        bool _325 = _317 == 12;
        int _327 = _297;
        int _329 = _317;
        float _331 = _301;
        float _333 = _315;
        float _335 = as_type<float>(_299);
        float _337 = _301;
        int _339 = _303;
        int _341 = _305;
        int _343 = _307;
        int _345 = _309;
        int _347 = _311;
        int _349 = _313;
        float _351 = _315;
        if (_319)
        {
            _327 = _197;
        }
        int _353 = _327;
        bool _355 = _317 == 16;
        int _357 = _353;
        if (_321)
        {
            _357 = _217;
        }
        int _359 = _357;
        int _361 = _359;
        if (_323)
        {
            _361 = _237;
        }
        int _363 = _361;
        int _365 = _363;
        if (_325)
        {
            _365 = _257;
        }
        int _367 = _365;
        int _369 = _367;
        if (_355)
        {
            _369 = _267;
        }
        int _371 = _369;
        bool _373 = _371 > 0;
        _271 = _371;
        if (!_373)
        {
            _329 = _299;
        }
        int _375 = _329;
        bool _377 = !_373;
        int _379 = _375;
        if (!_377)
        {
            float _381 = float(as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x));
            int _383 = abs(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y));
            float _385 = float(uint(_295));
            float _387 = 1.0 / _381;
            float _389 = float(uint(_383));
            int _391 = abs(_295);
            float _393 = float(uint(_391));
            float _395 = 1.0 / _389;
            int _397 = as_type<int>(_387) + (-2);
            float _399 = as_type<float>(_397) * _385;
            int _401 = as_type<int>(_395) + (-2);
            float _403 = trunc(_399);
            float _405 = precise::max(_403, 0.0);
            uint _408 = uint(_405);
            float _410 = as_type<float>(_401) * _393;
            float _412 = trunc(_410);
            float _414 = precise::max(_412, 0.0);
            uint _416 = uint(_414);
            int _418 = ~int(_408);
            int _420 = _418 + 1;
            int _422 = _420 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _424 = _422 + _295;
            int _426 = ~int(_416);
            int _428 = _426 + 1;
            float _430 = float(uint(_424));
            int _432 = _428 * _383;
            int _434 = _432 + _391;
            float _436 = as_type<float>(_397) * _430;
            float _438 = float(uint(_434));
            float _440 = trunc(_436);
            float _442 = precise::max(_440, 0.0);
            uint _444 = uint(_442);
            float _446 = as_type<float>(_401) * _438;
            float _448 = trunc(_446);
            float _450 = precise::max(_448, 0.0);
            uint _452 = uint(_450);
            int _454 = _295 << 6;
            int _456 = int(_408) + int(_444);
            int _458 = ~_456;
            int _460 = _458 + 1;
            int _462 = int(_416) + int(_452);
            float _464 = in.m_38.x;
            float _466 = gl_FragCoord.w;
            float _468 = _464 * _466;
            int _470 = -_462;
            int _472 = _460 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _474 = _472 + _295;
            int _476 = _470 * _383;
            int _478 = _476 + _391;
            float _480 = in.m_38.y;
            float _482 = gl_FragCoord.w;
            float _484 = _480 * _482;
            bool _486 = uint(_474) >= as_type<uint>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            float _488 = in.m_38.z;
            float _490 = gl_FragCoord.w;
            float _492 = _488 * _490;
            bool _494 = !_486;
            int _496 = _494 ? 0 : (-1);
            bool _498 = uint(_478) >= uint(_383);
            int _500 = ~_456;
            int _502 = _500 + _496;
            int _504 = _502 + 1;
            int _506 = _295 ^ as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            bool _508 = !_498;
            int _510 = _508 ? 0 : (-1);
            uint _512 = uint(int(uint(_506) >> uint(31)));
            int _514 = _504 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _516 = _514 + _295;
            bool _518 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].x);
            int _520 = ~_510;
            int _522 = _462 + _520;
            int _524 = _522 + 1;
            bool _526 = !_518;
            int _528 = _526 ? _516 : (-1);
            int _530 = ~int(_512);
            int _532 = _530 + 1;
            float _534 = float(_528);
            float _536 = _62 * _468;
            int _538 = _524 ^ _532;
            bool _540 = 0 == as_type<int>((*spvDescriptorSet0.fp_c3)._m0[36].y);
            float _542 = rint(_534);
            float _544 = precise::max(_542, 0.0);
            uint _546 = uint(_544);
            uint _548 = clamp(_546, 0u, 65535u);
            int _550 = ~_532;
            int _552 = _550 + _538;
            int _554 = _552 + 1;
            float _556 = _62 * _484;
            float _558 = _62 * _492;
            bool _560 = !_540;
            int _562 = _560 ? _554 : (-1);
            float _564 = float(_562);
            int _566 = 0;
            do
            {
                float _570 = _331;
                float _572 = _333;
                int _574 = _566;
                float _576 = _335;
                float _578 = _570 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
                int _580 = _454 + 160;
                uint _582 = uint(int(uint(_580) >> uint(2)));
                uint _584 = uint(int(uint(int(_582)) >> uint(2)));
                int _586 = int(_582) & 3;
                float _588 = (*spvDescriptorSet0.fp_c3)._m0[int(_584)][_586];
                int _590 = int(_582) + 1;
                uint _592 = uint(int(uint(_590) >> uint(2)));
                int _594 = _590 & 3;
                float _596 = (*spvDescriptorSet0.fp_c3)._m0[int(_592)][_594];
                float _598 = abs(_578);
                float _600 = log2(_598);
                int _602 = _454 + 176;
                uint _604 = uint(int(uint(_602) >> uint(2)));
                uint _606 = uint(int(uint(int(_604)) >> uint(2)));
                int _608 = int(_604) & 3;
                float _610 = (*spvDescriptorSet0.fp_c3)._m0[int(_606)][_608];
                int _612 = int(_604) + 1;
                uint _614 = uint(int(uint(_612) >> uint(2)));
                int _616 = _612 & 3;
                float _618 = (*spvDescriptorSet0.fp_c3)._m0[int(_614)][_616];
                int _620 = _454 + 192;
                uint _622 = uint(int(uint(_620) >> uint(2)));
                uint _624 = uint(int(uint(int(_622)) >> uint(2)));
                int _626 = int(_622) & 3;
                float _628 = (*spvDescriptorSet0.fp_c3)._m0[int(_624)][_626];
                int _630 = int(_622) + 1;
                uint _632 = uint(int(uint(_630) >> uint(2)));
                int _634 = _630 & 3;
                float _636 = (*spvDescriptorSet0.fp_c3)._m0[int(_632)][_634];
                float _638 = _600 * (*spvDescriptorSet0.fp_c3)._m0[8].z;
                int _640 = _454 + 208;
                uint _642 = uint(int(uint(_640) >> uint(2)));
                uint _644 = uint(int(uint(int(_642)) >> uint(2)));
                int _646 = int(_642) & 3;
                float _648 = (*spvDescriptorSet0.fp_c3)._m0[int(_644)][_646];
                int _650 = int(_642) + 1;
                uint _652 = uint(int(uint(_650) >> uint(2)));
                int _654 = _650 & 3;
                float _656 = (*spvDescriptorSet0.fp_c3)._m0[int(_652)][_654];
                float _658 = exp2(_638);
                int _660 = _454 + 216;
                uint _662 = uint(int(uint(_660) >> uint(2)));
                uint _664 = uint(int(uint(int(_662)) >> uint(2)));
                int _666 = int(_662) & 3;
                float _668 = (*spvDescriptorSet0.fp_c3)._m0[int(_664)][_666];
                int _670 = int(_662) + 1;
                uint _672 = uint(int(uint(_670) >> uint(2)));
                int _674 = _670 & 3;
                float _676 = (*spvDescriptorSet0.fp_c3)._m0[int(_672)][_674];
                float _678 = fma(_658, _556, _100);
                float _680 = _678 * _596;
                float _682 = _678 * _618;
                float _684 = fma(_658, _536, _134);
                float _686 = _678 * _636;
                float _688 = _678 * _656;
                float _690 = fma(_684, _588, _680);
                float _692 = fma(_684, _610, _682);
                float _694 = fma(_684, _628, _686);
                float _696 = fma(_684, _648, _688);
                int _698 = _454 + 168;
                uint _700 = uint(int(uint(_698) >> uint(2)));
                uint _702 = uint(int(uint(int(_700)) >> uint(2)));
                int _704 = int(_700) & 3;
                float _706 = (*spvDescriptorSet0.fp_c3)._m0[int(_702)][_704];
                int _708 = int(_700) + 1;
                uint _710 = uint(int(uint(_708) >> uint(2)));
                int _712 = _708 & 3;
                float _714 = (*spvDescriptorSet0.fp_c3)._m0[int(_710)][_712];
                float _716 = fma(_658, _558, _108);
                float _718 = fma(_716, _668, _696);
                int _720 = _454 + 200;
                uint _722 = uint(int(uint(_720) >> uint(2)));
                uint _724 = uint(int(uint(int(_722)) >> uint(2)));
                int _726 = int(_722) & 3;
                float _728 = (*spvDescriptorSet0.fp_c3)._m0[int(_724)][_726];
                int _730 = int(_722) + 1;
                uint _732 = uint(int(uint(_730) >> uint(2)));
                int _734 = _730 & 3;
                float _736 = (*spvDescriptorSet0.fp_c3)._m0[int(_732)][_734];
                float _738 = fma(_110, _676, _718);
                float _740 = 1.0 / _738;
                int _742 = _454 + 184;
                uint _744 = uint(int(uint(_742) >> uint(2)));
                uint _746 = uint(int(uint(int(_744)) >> uint(2)));
                int _748 = int(_744) & 3;
                float _750 = (*spvDescriptorSet0.fp_c3)._m0[int(_746)][_748];
                int _752 = int(_744) + 1;
                uint _754 = uint(int(uint(_752) >> uint(2)));
                int _756 = _752 & 3;
                float _758 = (*spvDescriptorSet0.fp_c3)._m0[int(_754)][_756];
                float _760 = fma(_716, _706, _690);
                float _762 = fma(_110, _714, _760);
                float _764 = fma(_716, _728, _694);
                float _766 = _762 * _740;
                float _768 = fma(_110, _736, _764);
                float _770 = -(*spvDescriptorSet0.fp_c3)._m0[35].z;
                float _772 = _766 + _770;
                float _774 = fma(_716, _750, _692);
                float _776 = _768 * _740;
                float _778 = fma(_110, _758, _774);
                float _780 = _778 * _740;
                float _782 = _766 + (*spvDescriptorSet0.fp_c3)._m0[35].z;
                float _784 = -(*spvDescriptorSet0.fp_c3)._m0[35].w;
                float _786 = _780 + _784;
                float3 _1888 = float3(_766, _780, float(int(_548)));
                float3 _1892 = select(_1888, float3(0.0), isnan(_1888));
                float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1892.xy, uint(rint(_1892.z)), _776, level(_564));
                float _790 = _780 + (*spvDescriptorSet0.fp_c3)._m0[35].w;
                float3 _1906 = float3(_772, _780, float(int(_548)));
                float3 _1908 = select(_1906, float3(0.0), isnan(_1906));
                float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1908.xy, uint(rint(_1908.z)), _776, level(_564));
                float3 _1918 = float3(_766, _786, float(int(_548)));
                float3 _1920 = select(_1918, float3(0.0), isnan(_1918));
                float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1920.xy, uint(rint(_1920.z)), _776, level(_564));
                float3 _1930 = float3(_782, _780, float(int(_548)));
                float3 _1932 = select(_1930, float3(0.0), isnan(_1930));
                float _796 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1932.xy, uint(rint(_1932.z)), _776, level(_564));
                float3 _1942 = float3(_766, _790, float(int(_548)));
                float3 _1944 = select(_1942, float3(0.0), isnan(_1942));
                float _798 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1944.xy, uint(rint(_1944.z)), _776, level(_564));
                float _800 = _788 + _572;
                float _802 = _800 + _792;
                float _804 = _802 + _794;
                float _806 = _804 + _796;
                float3 _1966 = float3(_772, _786, float(int(_548)));
                float3 _1968 = select(_1966, float3(0.0), isnan(_1966));
                float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1968.xy, uint(rint(_1968.z)), _776, level(_564));
                float3 _1978 = float3(_782, _786, float(int(_548)));
                float3 _1980 = select(_1978, float3(0.0), isnan(_1978));
                float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1980.xy, uint(rint(_1980.z)), _776, level(_564));
                float3 _1990 = float3(_772, _790, float(int(_548)));
                float3 _1992 = select(_1990, float3(0.0), isnan(_1990));
                float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _1992.xy, uint(rint(_1992.z)), _776, level(_564));
                float3 _2002 = float3(_782, _790, float(int(_548)));
                float3 _2004 = select(_2002, float3(0.0), isnan(_2002));
                float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_8).sample_compare(spvDescriptorSet0.fp_t_tcb_8Smplr, _2004.xy, uint(rint(_2004.z)), _776, level(_564));
                float _816 = _806 + _798;
                int _818 = _574 + 1;
                float _820 = _570 + 1.0;
                bool _822 = _818 >= _371;
                float _824 = _816 + _808;
                float _826 = _824 + _810;
                float _828 = _826 + _812;
                float _830 = _828 + _814;
                float _832 = _830 * 0.111111111938953399658203125;
                float _834 = fma(_832, (*spvDescriptorSet0.fp_c3)._m0[35].x, (*spvDescriptorSet0.fp_c3)._m0[35].y);
                _836 = fma(_834, (*spvDescriptorSet0.fp_c3)._m0[8].x, _576);
                _568 = !_822;
                _331 = _820;
                _333 = _832;
                _566 = _818;
                _335 = _836;
                _337 = _820;
                _339 = int(_548);
                _341 = as_type<int>(_782);
                _343 = as_type<int>(_798);
                _345 = as_type<int>(_766);
                _347 = int(_548);
                _349 = as_type<int>(_772);
                _351 = _832;
            } while (_568);
            _379 = as_type<int>(_836);
        }
        float _838 = _337;
        int _840 = _339;
        int _842 = _341;
        int _844 = _343;
        int _846 = _345;
        int _848 = _347;
        int _850 = _349;
        float _852 = _351;
        _854 = _379;
        int _856 = _295 + 1;
        bool _858 = _856 >= 5;
        _293 = !_858;
        _269 = _856;
        _273 = _854;
        _275 = _838;
        _277 = _840;
        _279 = _842;
        _281 = _844;
        _283 = _846;
        _285 = _848;
        _287 = _850;
        _289 = _852;
    } while (_293);
    out.m_41.x = as_type<float>(_854);
    out.m_41.y = as_type<float>(_854);
    out.m_41.z = as_type<float>(_854);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

