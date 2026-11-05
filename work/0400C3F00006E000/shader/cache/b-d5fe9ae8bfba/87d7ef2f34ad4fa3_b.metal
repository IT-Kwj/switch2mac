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

template<typename T>
inline T spvSubgroupShuffle(T value, ushort lane)
{
    return simd_shuffle(value, lane);
}

template<>
inline bool spvSubgroupShuffle(bool value, ushort lane)
{
    return !!simd_shuffle((ushort)value, lane);
}

template<uint N>
inline vec<bool, N> spvSubgroupShuffle(vec<bool, N> value, ushort lane)
{
    return (vec<bool, N>)simd_shuffle((vec<ushort, N>)value, lane);
}

template<>
inline ulong spvSubgroupShuffle(ulong value, ushort lane)
{
    return as_type<ulong>(spvSubgroupShuffle(as_type<uint2>(value), lane));
}

template<>
inline ulong2 spvSubgroupShuffle(ulong2 value, ushort lane)
{
    return ulong2(spvSubgroupShuffle(value.x, lane), spvSubgroupShuffle(value.y, lane));
}

inline ulong3 spvSubgroupShuffle(ulong3 value, ushort lane)
{
    return ulong3(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.z, lane));
}

inline ulong4 spvSubgroupShuffle(ulong4 value, ushort lane)
{
    return ulong4(spvSubgroupShuffle(value.xy, lane), spvSubgroupShuffle(value.zw, lane));
}

template<uint N>
inline vec<long, N> spvSubgroupShuffle(vec<long, N> value, ushort lane)
{
    return vec<long, N>(spvSubgroupShuffle(vec<ulong, N>(value), lane));
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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_31 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

static inline __attribute__((always_inline))
int _55(thread const int& _1573, thread const int& _1574, thread const int& _1575, thread int& _1576, thread uint& gl_SubgroupInvocationID)
{
    int _1579 = _1575 & 31;
    uint _1582 = uint(int(uint(_1575) >> uint(8)));
    int _1584 = int(_1582) & 31;
    float _1586 = as_type<float>(gl_SubgroupInvocationID);
    int _1588 = as_type<int>(_1586) & _1584;
    int _1590 = ~_1584;
    int _1592 = _1579 & _1590;
    int _1594 = _1592 | _1588;
    int _1596 = ~_1584;
    int _1598 = _1574 & _1596;
    int _1600 = _1598 | _1588;
    bool _1602 = uint(_1600) <= uint(_1594);
    _1576 = _1602 ? (-1) : 0;
    float _1604 = spvSubgroupShuffle(as_type<float>(_1573), uint(_1600));
    uint _1606 = uint(_1602 ? as_type<int>(_1604) : _1573);
    return int(_1606);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], bool gl_FrontFacing [[front_facing]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    bool _270 = false;
    float _59 = gl_FragCoord.w;
    float _61 = in.m_31.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = as_type<float>(gl_FrontFacing ? (-1) : 0);
    float _69 = in.m_31.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_31.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.z;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = 1.0 / _59;
    bool _102 = as_type<int>(_67) != 0;
    float _104 = _99 * _65;
    float _106 = _99 * _73;
    float _108 = _99 * _85;
    bool _110 = !_102;
    float _112 = -_104;
    float _114 = _110 ? _112 : _104;
    float _116 = _99 * _79;
    bool _118 = !_102;
    float _120 = -_106;
    float _122 = _118 ? _120 : _106;
    float _124 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _126 = _108 + _124;
    float _128 = _99 * _97;
    float _130 = _114 * _114;
    bool _132 = !_102;
    float _134 = -_116;
    float _136 = _132 ? _134 : _116;
    float _138 = _126 * _126;
    float _140 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _142 = _128 + _140;
    float _144 = fma(_122, _122, _130);
    float _146 = _99 * _91;
    float _148 = fma(_136, _136, _144);
    float _150 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _152 = _146 + _150;
    float _154 = fma(_152, _152, _138);
    float _156 = rsqrt(_148);
    float _158 = fma(_142, _142, _154);
    float _160 = rsqrt(_158);
    float _162 = _114 * _156;
    float _164 = _122 * _156;
    float _166 = _136 * _156;
    float _168 = _162 * _162;
    float _170 = fma(_164, _164, _168);
    float _172 = _126 * _160;
    float _174 = _152 * _160;
    float _176 = _142 * _160;
    float _178 = fma(_166, _166, _170);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _164 * _180;
    float _186 = _166 * _180;
    float _188 = -_172;
    float _190 = _182 * _188;
    float _192 = -_174;
    float _194 = fma(_184, _192, _190);
    float _196 = -_176;
    float _198 = fma(_186, _196, _194);
    float _200 = _198 + _198;
    float _202 = -_200;
    float _204 = -_176;
    float _206 = fma(_186, _202, _204);
    float _208 = -_200;
    float _210 = -_174;
    float _212 = fma(_184, _208, _210);
    float _214 = -_200;
    float _216 = -_172;
    float _218 = fma(_182, _214, _216);
    bool _220 = _206 != 0.0;
    bool _222 = isnan(_206);
    bool _224 = _220 || _222;
    bool _226 = isnan(0.0);
    bool _228 = _224 || _226;
    float _230 = _206;
    float _232 = _212;
    int _234 = as_type<int>(_186);
    float _268;
    if (!_228)
    {
        bool _236 = _212 > 0.0;
        bool _238 = _212 >= 0.0;
        bool _240 = isnan(_212);
        bool _242 = _238 || _240;
        bool _244 = isnan(0.0);
        bool _246 = _242 || _244;
        int _248 = _246 ? 0 : 1;
        int _250 = ~_248;
        int _252 = _250 + 1;
        int _254 = _252 + 1;
        int _256 = _254;
        if (!_236)
        {
            int _258 = ~_248;
            int _260 = _258 + 1;
            _256 = _260;
        }
        int _262 = _256;
        float _264 = float(_262);
        float _266 = _264 * 1.57079637050628662109375;
        _268 = _266;
        _270 = true;
    }
    else
    {
        float _272 = abs(_212);
        float _274 = abs(_206);
        float _276 = precise::max(_272, _274);
        bool _278 = _276 >= 16.0;
        float _280 = _276;
        if (_278)
        {
            float _282 = _206 * 0.0625;
            _230 = _282;
        }
        float _284 = _230;
        if (_278)
        {
            float _286 = _212 * 0.0625;
            _232 = _286;
        }
        float _288 = _232;
        float _290 = abs(_284);
        bool _292 = _290 != 0.0;
        bool _294 = isnan(_290);
        bool _296 = _292 || _294;
        bool _298 = isnan(0.0);
        bool _300 = _296 || _298;
        float _302 = abs(_288);
        bool _304 = _302 == 0.0;
        float _306 = abs(_288);
        bool _308 = _306 == 0.0;
        bool _310 = !_300;
        bool _312 = _308 && _310;
        bool _314 = false;
        if (_312)
        {
            bool _316 = as_type<int>(_288) >= 0;
            _314 = _316;
        }
        bool _318 = _314;
        int _320 = _318 ? (-1) : 0;
        if (_312)
        {
            int _322 = _318 ? 0 : 1078530011;
            _234 = _322;
        }
        int _324 = _234;
        int _326 = _324;
        if (_312)
        {
            int _328 = int(0x80000000) & as_type<int>(_284);
            int _330 = _324 | _328;
            _280 = as_type<float>(_330);
        }
        float _332 = _280;
        bool _334 = !_300;
        bool _336 = _334 && _304;
        float _338 = _332;
        float _340 = _332;
        if (!_336)
        {
            float _342 = abs(_284);
            bool _344 = _342 != as_type<float>(0x7f800000u /* inf */);
            bool _346 = isnan(_342);
            bool _348 = _344 || _346;
            bool _350 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _352 = _348 || _350;
            float _354 = abs(_288);
            bool _356 = _354 == as_type<float>(0x7f800000u /* inf */);
            float _358 = abs(_288);
            bool _360 = _358 == as_type<float>(0x7f800000u /* inf */);
            bool _362 = !_352;
            bool _364 = _360 && _362;
            if (_364)
            {
                bool _366 = as_type<int>(_288) >= 0;
                _320 = _366 ? (-1) : 0;
            }
            int _368 = _320;
            if (_364)
            {
                _326 = 1075235812;
            }
            int _370 = _326;
            int _372 = _370;
            if (_364)
            {
                int _374 = ~_368;
                int _376 = (_374 != 0) ? _370 : 1061752795;
                _372 = _376;
            }
            int _378 = _372;
            if (_364)
            {
                int _380 = int(0x80000000) & as_type<int>(_284);
                int _382 = _378 | _380;
                _338 = as_type<float>(_382);
            }
            float _384 = _338;
            bool _386 = !_352;
            bool _388 = _386 && _356;
            _340 = _384;
            if (!_388)
            {
                float _390 = abs(_284);
                float _392 = abs(_288);
                float _394 = precise::max(_390, _392);
                float _396 = abs(_284);
                float _398 = abs(_288);
                float _400 = precise::min(_396, _398);
                float _402 = 1.0 / _394;
                float _404 = abs(_284);
                float _406 = abs(_288);
                bool _408 = _404 > _406;
                bool _410 = as_type<int>(_288) >= 0;
                float _412 = _400 * _402;
                float _414 = abs(_284);
                float _416 = abs(_288);
                float _418 = _414 + _416;
                int _420 = as_type<int>(_284) & int(0x80000000);
                float _422 = _412 * _412;
                bool _424 = _418 > as_type<float>(0x7f800000u /* inf */);
                bool _426 = isnan(_418);
                bool _428 = _424 || _426;
                bool _430 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _432 = _428 || _430;
                float _434 = _422 + 11.33538818359375;
                float _436 = fma(_422, _434, 28.84246826171875);
                float _438 = fma(_422, _436, 19.6966705322265625);
                float _440 = fma(_422, -0.82336294651031494140625, -5.674867153167724609375);
                float _442 = fma(_422, _440, -6.565555095672607421875);
                float _444 = 1.0 / _438;
                float _446 = _422 * _442;
                float _448 = _412 * _446;
                float _450 = fma(_448, _444, _412);
                float _452 = _450;
                _340 = _418;
                if (_408)
                {
                    float _454 = -_450;
                    float _456 = _454 + 1.57079637050628662109375;
                    _452 = _456;
                }
                float _458 = _452;
                int _460 = as_type<int>(_458);
                if (!_410)
                {
                    float _462 = -_458;
                    float _464 = _462 + 3.1415927410125732421875;
                    _460 = as_type<int>(_464);
                }
                int _466 = _460;
                if (!_432)
                {
                    int _468 = _420 | _466;
                    _340 = as_type<float>(_468);
                }
            }
        }
        float _470 = _340;
        _268 = _470;
    }
    _270 = false;
    float _472 = _268;
    float _474 = in.m_39.w;
    float _476 = gl_FragCoord.w;
    float _478 = _474 * _476;
    float _480 = in.m_41.x;
    float _482 = gl_FragCoord.w;
    float _484 = _480 * _482;
    float _486 = fma(_472, 0.15915493667125701904296875, 1.0);
    float _488 = fma(_472, 0.15915493667125701904296875, 0.5);
    float _490 = floor(_486);
    int _492 = as_type<int>(_488);
    int _494 = 0;
    int _496 = 7171;
    int _498;
    int _1307 = _55(_492, _494, _496, _498, gl_SubgroupInvocationID);
    int _500 = _1307;
    float _502 = -_490;
    float _504 = _486 + _502;
    int _506 = as_type<int>(_504);
    int _508 = 0;
    int _510 = 7171;
    int _512;
    int _1315 = _55(_506, _508, _510, _512, gl_SubgroupInvocationID);
    int _514 = _1315;
    float _516 = _99 * _478;
    float _518 = _99 * _484;
    uint _1335 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _520 = (as_type<float>(_500) * float4(1.0, -1.0, 1.0, 0.0)[_1335]) + (_488 * float4(1.0, 1.0, -1.0, 1.0)[_1335]);
    float _522 = _516 * _516;
    int _524 = as_type<int>(_520);
    int _526 = 1;
    int _528 = 7171;
    int _530;
    int _1346 = _55(_524, _526, _528, _530, gl_SubgroupInvocationID);
    int _532 = _1346;
    float _534 = _522 * _522;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    int _538 = as_type<int>(_520);
    int _540 = 2;
    int _542 = 7171;
    int _544;
    int _1354 = _55(_538, _540, _542, _544, gl_SubgroupInvocationID);
    int _546 = _1354;
    float _548 = _536 * _518;
    bool _550 = _548 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _552 = isnan(_548);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _558 = _554 || _556;
    uint _1381 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _560 = (as_type<float>(_514) * float4(1.0, -1.0, 1.0, 0.0)[_1381]) + (_504 * float4(1.0, 1.0, -1.0, 1.0)[_1381]);
    int _562 = as_type<int>(_560);
    int _564 = 1;
    int _566 = 7171;
    int _568;
    int _1389 = _55(_562, _564, _566, _568, gl_SubgroupInvocationID);
    int _570 = _1389;
    int _572 = as_type<int>(_560);
    int _574 = 2;
    int _576 = 7171;
    int _578;
    int _1392 = _55(_572, _574, _576, _578, gl_SubgroupInvocationID);
    int _580 = _1392;
    if (!_558)
    {
        discard_fragment();
    }
    float _582 = abs(as_type<float>(_532));
    float _584 = abs(as_type<float>(_546));
    float _586 = _582 + _584;
    float _588 = _586 + (-9.9999997473787516355514526367188e-05);
    float _590 = abs(as_type<float>(_570));
    float _592 = abs(as_type<float>(_580));
    float _594 = _590 + _592;
    bool _596 = _588 >= _594;
    bool _598 = isnan(_588);
    bool _600 = _596 || _598;
    bool _602 = isnan(_594);
    bool _604 = _600 || _602;
    float _606 = fma(_218, 0.5, 0.5);
    bool _608 = !_604;
    float _610 = _608 ? _488 : 0.0;
    float2 _1442 = float2(_610, _606);
    float3 _614 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1442, float2(0.0), isnan(_1442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1442, float2(0.0), isnan(_1442))).xyz;
    float _616 = _614.x;
    float _618 = _614.y;
    float _620 = _614.z;
    float _622 = in.m_39.y;
    float _624 = gl_FragCoord.w;
    float _626 = _622 * _624;
    float _628 = in.m_39.x;
    float _630 = gl_FragCoord.w;
    float _632 = _628 * _630;
    float _634 = in.m_39.z;
    float _636 = gl_FragCoord.w;
    float _638 = _634 * _636;
    float _640 = in.m_43.x;
    float _642 = gl_FragCoord.w;
    float _644 = _640 * _642;
    float _646 = in.m_43.y;
    float _648 = gl_FragCoord.w;
    float _650 = _646 * _648;
    float _652 = in.m_43.z;
    float _654 = gl_FragCoord.w;
    float _656 = _652 * _654;
    float _658 = _99 * _626;
    float _660 = _99 * _632;
    float _662 = _99 * _638;
    float _664 = _99 * _644;
    float _666 = _99 * _650;
    float _668 = _99 * _656;
    float _670 = -_616;
    float _672 = _670 + 1.0;
    float _674 = -_618;
    float _676 = _674 + 1.0;
    float _678 = -_620;
    float _680 = _678 + 1.0;
    float _682 = _664 * _672;
    float _684 = _666 * _676;
    float _686 = _668 * _680;
    float _688 = fma(_616, _660, _682);
    float _690 = fma(_618, _658, _684);
    float _692 = fma(_620, _662, _686);
    if (!_558)
    {
        out.m_46.x = _688;
        out.m_46.y = _690;
        out.m_46.z = _692;
        out.m_46.w = _536;
        return out;
    }
    float _694 = 0.0 + _548;
    float _696 = precise::clamp(_694, 0.0, 1.0);
    out.m_46.x = _688;
    out.m_46.y = _690;
    out.m_46.z = _692;
    out.m_46.w = _696;
    return out;
}

