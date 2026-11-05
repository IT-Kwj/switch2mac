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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c15 [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_10Smplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_57 [[color(0)]];
};

struct main0_in
{
    float4 m_52 [[user(locn0)]];
    float4 m_50 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_44 [[user(locn3)]];
    float4 m_54 [[user(locn4)]];
    float4 m_48 [[user(locn5), flat]];
};

static inline __attribute__((always_inline))
int _66(thread const int& _3002, thread const int& _3003, thread const int& _3004, thread int& _3005, thread uint& gl_SubgroupInvocationID)
{
    int _3008 = _3004 & 31;
    uint _3010 = uint(int(uint(_3004) >> uint(8)));
    int _3012 = int(_3010) & 31;
    float _3014 = as_type<float>(gl_SubgroupInvocationID);
    int _3016 = as_type<int>(_3014) & _3012;
    int _3018 = ~_3012;
    int _3020 = _3008 & _3018;
    int _3022 = _3020 | _3016;
    int _3024 = ~_3012;
    int _3026 = _3003 & _3024;
    int _3028 = _3026 | _3016;
    bool _3030 = uint(_3028) <= uint(_3022);
    _3005 = _3030 ? (-1) : 0;
    float _3032 = spvSubgroupShuffle(as_type<float>(_3002), uint(_3028));
    uint _3034 = uint(_3030 ? as_type<int>(_3032) : _3002);
    return int(_3034);
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]], uint gl_SubgroupInvocationID [[thread_index_in_simdgroup]])
{
    main0_out out = {};
    float _70 = gl_FragCoord.w;
    float _72 = in.m_44.w;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_44.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_44.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = 1.0 / _70;
    float _92 = _90 * _76;
    float _94 = _90 * _82;
    float _96 = _90 * _88;
    float _98 = 1.0 / _92;
    float _100 = _94 * _98;
    float _102 = _96 * _98;
    float2 _1235 = float2(_100, _102);
    float _104 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1235, float2(0.0), isnan(_1235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1235, float2(0.0), isnan(_1235))).x;
    float _106 = fma(_102, 2.0, -1.0);
    float _108 = -(*spvDescriptorSet0.fp_c8)._m0[17].y;
    float _110 = _106 * _108;
    float _112 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _114 = fma(_104, (*spvDescriptorSet0.fp_c8)._m0[30].w, _112);
    float _116 = 1.0 / _114;
    float _118 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _120 = _116 * _118;
    float _122 = _120 * (*spvDescriptorSet0.fp_c8)._m0[30].w;
    float _124 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _126 = fma(_120, (*spvDescriptorSet0.fp_c8)._m0[30].y, _124);
    float _128 = fma(_100, 2.0, -1.0);
    float _130 = -(*spvDescriptorSet0.fp_c8)._m0[16].y;
    float _132 = _106 * _130;
    float _134 = 1.0 / _122;
    float _136 = fma(_128, (*spvDescriptorSet0.fp_c8)._m0[17].x, _110);
    float _138 = -(*spvDescriptorSet0.fp_c8)._m0[18].y;
    float _140 = _106 * _138;
    float _142 = fma(_128, (*spvDescriptorSet0.fp_c8)._m0[16].x, _132);
    float _144 = -(*spvDescriptorSet0.fp_c8)._m0[19].y;
    float _146 = _106 * _144;
    float _148 = fma(_128, (*spvDescriptorSet0.fp_c8)._m0[18].x, _140);
    float _150 = fma(_128, (*spvDescriptorSet0.fp_c8)._m0[19].x, _146);
    float _152 = _126 * _134;
    float _154 = fma(_152, 2.0, -1.0);
    float _156 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[17].z, _136);
    float _158 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[16].z, _142);
    float _160 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[18].z, _148);
    float _162 = fma(_154, (*spvDescriptorSet0.fp_c8)._m0[19].z, _150);
    float _164 = _156 + (*spvDescriptorSet0.fp_c8)._m0[17].w;
    float _166 = _158 + (*spvDescriptorSet0.fp_c8)._m0[16].w;
    float _168 = _160 + (*spvDescriptorSet0.fp_c8)._m0[18].w;
    float _170 = _162 + (*spvDescriptorSet0.fp_c8)._m0[19].w;
    float _172 = _164 * (*spvDescriptorSet0.fp_c8)._m0[15].y;
    float _174 = _164 * (*spvDescriptorSet0.fp_c8)._m0[12].y;
    float _176 = _164 * (*spvDescriptorSet0.fp_c8)._m0[14].y;
    float _178 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[15].x, _172);
    float _180 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[12].x, _174);
    float _182 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[14].x, _176);
    float _184 = fma(_168, (*spvDescriptorSet0.fp_c8)._m0[15].z, _178);
    float _186 = fma(_168, (*spvDescriptorSet0.fp_c8)._m0[12].z, _180);
    float _188 = fma(_168, (*spvDescriptorSet0.fp_c8)._m0[14].z, _182);
    float _190 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[15].w, _184);
    float _192 = _164 * (*spvDescriptorSet0.fp_c8)._m0[13].y;
    float _194 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[12].w, _186);
    float _196 = 1.0 / _190;
    float _198 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[13].x, _192);
    float _200 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[14].w, _188);
    float _202 = fma(_168, (*spvDescriptorSet0.fp_c8)._m0[13].z, _198);
    float _204 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _206 = fma(_170, (*spvDescriptorSet0.fp_c8)._m0[13].w, _202);
    float _208 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _210 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _212 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _208);
    float _214 = _206 * _196;
    float _216 = _194 * _196;
    float _218 = _200 * _196;
    float _220 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _210);
    float _222 = _214 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _224 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _204);
    float _226 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _212);
    float _228 = fma(_216, (*spvDescriptorSet0.fp_c8)._m0[2].x, _222);
    float _230 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _224);
    float _232 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _220);
    float _234 = fma(_218, (*spvDescriptorSet0.fp_c8)._m0[2].z, _228);
    float _236 = _230 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _238 = _232 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _240 = _234 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _242 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _244 = _214 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _246 = 1.0 / _240;
    float _248 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _242);
    float _250 = _214 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _252 = fma(_216, (*spvDescriptorSet0.fp_c8)._m0[1].x, _244);
    float _254 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _248);
    float _256 = fma(_216, (*spvDescriptorSet0.fp_c8)._m0[0].x, _250);
    float _258 = fma(_218, (*spvDescriptorSet0.fp_c8)._m0[1].z, _252);
    float _260 = _226 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _262 = fma(_218, (*spvDescriptorSet0.fp_c8)._m0[0].z, _256);
    float _264 = rsqrt(_254);
    float _266 = _258 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _268 = _262 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _270 = _238 * _246;
    float _272 = -_260;
    float _274 = fma(_268, _270, _272);
    float _276 = -_236;
    float _278 = fma(_266, _270, _276);
    float _280 = _274 * _264;
    float _282 = _278 * _264;
    float _284 = abs(_280);
    float _286 = abs(_282);
    float _288 = precise::max(_284, _286);
    bool _292 = _288 >= 16.0;
    float _294 = _282 * _282;
    float _296 = fma(_280, _280, _294);
    float _298 = _280;
    float _300 = _282;
    int _302 = as_type<int>(_294);
    if (_292)
    {
        float _304 = _280 * 0.0625;
        _298 = _304;
    }
    float _306 = _298;
    if (_292)
    {
        float _308 = _282 * 0.0625;
        _300 = _308;
    }
    float _310 = _300;
    float _312 = abs(_306);
    bool _314 = _312 != 0.0;
    bool _316 = isnan(_312);
    bool _318 = _314 || _316;
    bool _320 = isnan(0.0);
    bool _322 = _318 || _320;
    float _324 = abs(_310);
    bool _326 = _324 == 0.0;
    float _328 = abs(_310);
    bool _330 = _328 == 0.0;
    bool _332 = !_322;
    bool _334 = _330 && _332;
    bool _336 = false;
    if (_334)
    {
        bool _338 = as_type<int>(_310) >= 0;
        _336 = _338;
    }
    bool _340 = _336;
    int _342 = _340 ? (-1) : 0;
    if (_334)
    {
        int _344 = _340 ? 0 : 1078530011;
        _302 = _344;
    }
    int _346 = _302;
    int _348 = _346;
    if (_334)
    {
        int _350 = int(0x80000000) & as_type<int>(_306);
        int _352 = _346 | _350;
        _348 = _352;
    }
    int _354 = _348;
    bool _356 = !_322;
    bool _358 = _356 && _326;
    int _360 = _354;
    float _362 = as_type<float>(_354);
    if (!_358)
    {
        float _364 = abs(_306);
        bool _366 = _364 != as_type<float>(0x7f800000u /* inf */);
        bool _368 = isnan(_364);
        bool _370 = _366 || _368;
        bool _372 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _374 = _370 || _372;
        float _376 = abs(_310);
        bool _378 = _376 == as_type<float>(0x7f800000u /* inf */);
        float _380 = abs(_310);
        bool _382 = _380 == as_type<float>(0x7f800000u /* inf */);
        bool _384 = !_374;
        bool _386 = _382 && _384;
        if (_386)
        {
            bool _388 = as_type<int>(_310) >= 0;
            _342 = _388 ? (-1) : 0;
        }
        int _390 = _342;
        if (_386)
        {
            _360 = 1075235812;
        }
        int _392 = _360;
        int _394 = _392;
        if (_386)
        {
            int _396 = ~_390;
            int _398 = (_396 != 0) ? _392 : 1061752795;
            _394 = _398;
        }
        int _400 = _394;
        float _402 = as_type<float>(_400);
        if (_386)
        {
            int _404 = int(0x80000000) & as_type<int>(_306);
            int _406 = _400 | _404;
            _402 = as_type<float>(_406);
        }
        float _408 = _402;
        bool _410 = !_374;
        bool _412 = _410 && _378;
        _362 = _408;
        if (!_412)
        {
            float _414 = abs(_306);
            float _416 = abs(_310);
            float _418 = precise::max(_414, _416);
            float _420 = abs(_306);
            float _422 = abs(_310);
            float _424 = precise::min(_420, _422);
            float _426 = 1.0 / _418;
            float _428 = abs(_306);
            float _430 = abs(_310);
            bool _432 = _428 > _430;
            bool _434 = as_type<int>(_310) >= 0;
            float _436 = _424 * _426;
            float _438 = _436 * _436;
            float _440 = _438 + 11.33538818359375;
            float _442 = fma(_438, _440, 28.84246826171875);
            float _444 = fma(_438, _442, 19.6966705322265625);
            float _446 = fma(_438, -0.82336294651031494140625, -5.674867153167724609375);
            float _448 = fma(_438, _446, -6.565555095672607421875);
            float _450 = 1.0 / _444;
            float _452 = _438 * _448;
            float _454 = abs(_306);
            float _456 = abs(_310);
            float _458 = _454 + _456;
            int _460 = as_type<int>(_306) & int(0x80000000);
            float _462 = _436 * _452;
            bool _464 = _458 > as_type<float>(0x7f800000u /* inf */);
            bool _466 = isnan(_458);
            bool _468 = _464 || _466;
            bool _470 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _472 = _468 || _470;
            float _474 = fma(_462, _450, _436);
            float _476 = _474;
            _362 = _458;
            if (_432)
            {
                float _478 = -_474;
                float _480 = _478 + 1.57079637050628662109375;
                _476 = _480;
            }
            float _482 = _476;
            int _484 = as_type<int>(_482);
            if (!_434)
            {
                float _486 = -_482;
                float _488 = _486 + 3.1415927410125732421875;
                _484 = as_type<int>(_488);
            }
            int _490 = _484;
            if (!_472)
            {
                int _492 = _460 | _490;
                _362 = as_type<float>(_492);
            }
        }
    }
    float _494 = _362;
    float _496 = fma(_494, 0.15915493667125701904296875, 1.0);
    float _498 = fma(_494, 0.15915493667125701904296875, 0.5);
    float _500 = in.m_46.y;
    float _502 = gl_FragCoord.w;
    float _504 = _500 * _502;
    float _506 = in.m_48.x;
    float _508 = floor(_496);
    float _510 = in.m_46.x;
    float _512 = gl_FragCoord.w;
    float _514 = _510 * _512;
    int _516 = as_type<int>(_498);
    int _518 = 0;
    int _520 = 7171;
    int _522;
    int _1960 = _66(_516, _518, _520, _522, gl_SubgroupInvocationID);
    int _524 = _1960;
    float _526 = sqrt(_296);
    float _528 = -_508;
    float _530 = _496 + _528;
    int _532 = as_type<int>(_530);
    int _534 = 0;
    int _536 = 7171;
    int _538;
    int _1970 = _66(_532, _534, _536, _538, gl_SubgroupInvocationID);
    int _540 = _1970;
    uint _1983 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _542 = (as_type<float>(_524) * float4(1.0, -1.0, 1.0, 0.0)[_1983]) + (_498 * float4(1.0, 1.0, -1.0, 1.0)[_1983]);
    int _544 = as_type<int>(_542);
    int _546 = 2;
    int _548 = 7171;
    int _550;
    int _1991 = _66(_544, _546, _548, _550, gl_SubgroupInvocationID);
    int _552 = _1991;
    uint _1999 = (235u >> ((gl_SubgroupInvocationID & 3u) << 1u)) & 3u;
    float _554 = (as_type<float>(_540) * float4(1.0, -1.0, 1.0, 0.0)[_1999]) + (_530 * float4(1.0, 1.0, -1.0, 1.0)[_1999]);
    int _556 = as_type<int>(_542);
    int _558 = 1;
    int _560 = 7171;
    int _562;
    int _2007 = _66(_556, _558, _560, _562, gl_SubgroupInvocationID);
    int _564 = _2007;
    int _566 = as_type<int>(_554);
    int _568 = 1;
    int _570 = 7171;
    int _572;
    int _2010 = _66(_566, _568, _570, _572, gl_SubgroupInvocationID);
    int _574 = _2010;
    int _576 = as_type<int>(_554);
    int _578 = 2;
    int _580 = 7171;
    int _582;
    int _2013 = _66(_576, _578, _580, _582, gl_SubgroupInvocationID);
    int _584 = _2013;
    float _586 = _90 * _514;
    float _588 = abs(as_type<float>(_564));
    float _590 = abs(as_type<float>(_552));
    float _592 = _588 + _590;
    float _594 = rint(_506);
    float _596 = precise::max(_594, 0.0);
    uint _599 = uint(_596);
    uint _601 = clamp(_599, 0u, 65535u);
    float _603 = _592 + (-9.9999997473787516355514526367188e-05);
    float _605 = abs(as_type<float>(_574));
    float _607 = abs(as_type<float>(_584));
    float _609 = _605 + _607;
    bool _611 = _603 >= _609;
    bool _613 = isnan(_603);
    bool _615 = _611 || _613;
    bool _617 = isnan(_609);
    bool _619 = _615 || _617;
    float _621 = (*spvDescriptorSet0.fp_c10)._m0[2].x * (-0.4000000059604644775390625);
    float _623 = _90 * _504;
    bool _625 = !_619;
    float _627 = _625 ? _498 : 0.0;
    float _629 = fma(_526, 0.5, _621);
    float3 _2083 = float3(_586, _623, float(int(_601)));
    float3 _2087 = select(_2083, float3(0.0), isnan(_2083));
    float _631 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _2087.xy, uint(rint(_2087.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _2087.xy, uint(rint(_2087.z))).w;
    float2 _2093 = float2(_627, _629);
    float _633 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2093, float2(0.0), isnan(_2093))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2093, float2(0.0), isnan(_2093))).w;
    float _635 = 0.0 + (*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _637 = precise::clamp(_635, 0.0, 1.0);
    float _639 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _641 = (*spvDescriptorSet0.fp_c9)._m0[124].w + _639;
    float _643 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _645 = _643 + (*spvDescriptorSet0.fp_c9)._m0[125].w;
    float _647 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _649 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _647;
    float _651 = 1.0 / _641;
    float _653 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _655 = _653 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _657 = -(*spvDescriptorSet0.fp_c9)._m0[115].w;
    float _659 = _657 + (*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _661 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _663 = _637 + _661;
    float _665 = 1.0 / _649;
    float _667 = -(*spvDescriptorSet0.fp_c9)._m0[123].w;
    float _669 = _637 + _667;
    bool _671 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _673 = isnan(_637);
    bool _675 = _671 || _673;
    bool _677 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _679 = _675 || _677;
    float _681 = float(_679);
    float _683 = -(*spvDescriptorSet0.fp_c9)._m0[123].z;
    float _685 = (*spvDescriptorSet0.fp_c9)._m0[124].z + _683;
    float _687 = -(*spvDescriptorSet0.fp_c9)._m0[124].z;
    float _689 = _687 + (*spvDescriptorSet0.fp_c9)._m0[125].z;
    bool _691 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[116].w;
    bool _693 = isnan(_637);
    bool _695 = _691 || _693;
    bool _697 = isnan((*spvDescriptorSet0.fp_c9)._m0[116].w);
    bool _699 = _695 || _697;
    float _701 = float(_699);
    float _703 = 1.0 / _645;
    float _705 = in.m_44.z;
    float _707 = gl_FragCoord.w;
    float _709 = _705 * _707;
    float _711 = _669 * _651;
    float _713 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _715 = _637 + _713;
    float _717 = fma(_685, _711, (*spvDescriptorSet0.fp_c9)._m0[123].z);
    float _719 = 1.0 / _655;
    float _721 = -(*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _723 = _721 + (*spvDescriptorSet0.fp_c9)._m0[117].w;
    float _725 = -(*spvDescriptorSet0.fp_c9)._m0[124].w;
    float _727 = _637 + _725;
    float _729 = -(*spvDescriptorSet0.fp_c9)._m0[115].x;
    float _731 = (*spvDescriptorSet0.fp_c9)._m0[116].x + _729;
    float _733 = _663 * _665;
    float _735 = 1.0 / _659;
    float _737 = _727 * _703;
    float _739 = -(*spvDescriptorSet0.fp_c9)._m0[123].y;
    float _741 = (*spvDescriptorSet0.fp_c9)._m0[124].y + _739;
    float _743 = 1.0 / _723;
    float _745 = _715 * _719;
    float _747 = -(*spvDescriptorSet0.fp_c9)._m0[124].y;
    float _749 = _747 + (*spvDescriptorSet0.fp_c9)._m0[125].y;
    float _751 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _753 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _751;
    float _755 = -(*spvDescriptorSet0.fp_c9)._m0[123].x;
    float _757 = (*spvDescriptorSet0.fp_c9)._m0[124].x + _755;
    float _759 = -(*spvDescriptorSet0.fp_c9)._m0[124].x;
    float _761 = _759 + (*spvDescriptorSet0.fp_c9)._m0[125].x;
    float _763 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _765 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _763;
    float _767 = _731 * _735;
    float _769 = -(*spvDescriptorSet0.fp_c9)._m0[116].x;
    float _771 = _769 + (*spvDescriptorSet0.fp_c9)._m0[117].x;
    float _773 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _775 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _773;
    float _777 = fma(_765, _733, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _779 = fma(_761, _737, (*spvDescriptorSet0.fp_c9)._m0[124].x);
    float _781 = -(*spvDescriptorSet0.fp_c9)._m0[115].w;
    float _783 = _637 + _781;
    float _785 = fma(_757, _711, (*spvDescriptorSet0.fp_c9)._m0[123].x);
    float _787 = fma(_741, _711, (*spvDescriptorSet0.fp_c9)._m0[123].y);
    float _789 = _771 * _743;
    float _791 = fma(_749, _737, (*spvDescriptorSet0.fp_c9)._m0[124].y);
    float _793 = fma(_775, _733, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _795 = fma(_753, _733, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    float _797 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _799 = _797 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _801 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _803 = _801 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _805 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _807 = _805 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _809 = _90 * _709;
    float _811 = fma(_799, _745, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _813 = fma(_803, _745, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _815 = -(*spvDescriptorSet0.fp_c9)._m0[116].w;
    float _817 = _637 + _815;
    float _819 = fma(_807, _745, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    bool _821 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[125].w;
    bool _823 = isnan(_637);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.fp_c9)._m0[125].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_689, _737, (*spvDescriptorSet0.fp_c9)._m0[124].z);
    bool _835 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _837 = isnan(_637);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = fma(_789, _817, (*spvDescriptorSet0.fp_c9)._m0[116].x);
    bool _849 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[124].w;
    bool _851 = isnan(_637);
    bool _853 = _849 || _851;
    bool _855 = isnan((*spvDescriptorSet0.fp_c9)._m0[124].w);
    bool _857 = _853 || _855;
    float _859 = float(_857);
    float _861 = -_831;
    float _863 = _861 + 1.0;
    float _865 = fma(_767, _783, (*spvDescriptorSet0.fp_c9)._m0[115].x);
    float _867 = -_845;
    float _869 = _867 + 1.0;
    float _871 = _809 * _98;
    bool _873 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[123].w;
    bool _875 = isnan(_637);
    bool _877 = _873 || _875;
    bool _879 = isnan((*spvDescriptorSet0.fp_c9)._m0[123].w);
    bool _881 = _877 || _879;
    float _883 = float(_881);
    float _885 = -_859;
    float _887 = _885 + 1.0;
    bool _889 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _891 = isnan(_637);
    bool _893 = _889 || _891;
    bool _895 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _897 = _893 || _895;
    float _899 = float(_897);
    bool _901 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[115].w;
    bool _903 = isnan(_637);
    bool _905 = _901 || _903;
    bool _907 = isnan((*spvDescriptorSet0.fp_c9)._m0[115].w);
    bool _909 = _905 || _907;
    float _911 = float(_909);
    bool _913 = _637 >= (*spvDescriptorSet0.fp_c9)._m0[117].w;
    bool _915 = isnan(_637);
    bool _917 = _913 || _915;
    bool _919 = isnan((*spvDescriptorSet0.fp_c9)._m0[117].w);
    bool _921 = _917 || _919;
    float _923 = float(_921);
    float _925 = _859 * _863;
    float _927 = _681 * _869;
    float _929 = -_681;
    float _931 = _929 + 1.0;
    float _933 = _883 * _887;
    float _935 = -_883;
    float _937 = _935 + 1.0;
    float _939 = -_701;
    float _941 = _939 + 1.0;
    float _943 = _899 * _931;
    float _945 = _785 * _933;
    float _947 = -_899;
    float _949 = _947 + 1.0;
    float _951 = _787 * _933;
    float _953 = _777 * _943;
    float _955 = _793 * _943;
    float _957 = _795 * _943;
    float _959 = fma(_937, (*spvDescriptorSet0.fp_c9)._m0[123].x, _945);
    float _961 = fma(_949, (*spvDescriptorSet0.fp_c9)._m0[107].x, _953);
    float _963 = fma(_949, (*spvDescriptorSet0.fp_c9)._m0[107].y, _955);
    float _965 = fma(_949, (*spvDescriptorSet0.fp_c9)._m0[107].z, _957);
    float _967 = fma(_779, _925, _959);
    float _969 = _717 * _933;
    float _971 = in.m_50.w;
    float _973 = gl_FragCoord.w;
    float _975 = _971 * _973;
    float _977 = fma(_813, _927, _963);
    float _979 = _911 * _941;
    float _981 = in.m_52.w;
    float _983 = gl_FragCoord.w;
    float _985 = _981 * _983;
    float _987 = fma(_937, (*spvDescriptorSet0.fp_c9)._m0[123].y, _951);
    float _989 = -_923;
    float _991 = _989 + 1.0;
    float _993 = _865 * _979;
    float _995 = -_911;
    float _997 = _995 + 1.0;
    float _999 = fma(_791, _925, _987);
    float _1001 = _701 * _991;
    float _1003 = fma(_997, (*spvDescriptorSet0.fp_c9)._m0[115].x, _993);
    float _1005 = fma(_937, (*spvDescriptorSet0.fp_c9)._m0[123].z, _969);
    float _1007 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _1009 = fma(_871, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1007);
    float _1011 = fma(_831, (*spvDescriptorSet0.fp_c9)._m0[125].y, _999);
    float _1013 = fma(_847, _1001, _1003);
    float _1015 = fma(_833, _925, _1005);
    float _1017 = in.m_54.x;
    float _1019 = gl_FragCoord.w;
    float _1021 = _1017 * _1019;
    float _1023 = fma(_811, _927, _961);
    float _1025 = fma(_923, (*spvDescriptorSet0.fp_c9)._m0[117].x, _1013);
    float _1027 = 1.0 / _1009;
    float _1029 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _1031 = fma(_104, (*spvDescriptorSet0.fp_c8)._m0[30].w, _1029);
    float _1033 = fma(_845, (*spvDescriptorSet0.fp_c9)._m0[109].x, _1023);
    float _1035 = fma(_819, _927, _965);
    float _1037 = fma(_845, (*spvDescriptorSet0.fp_c9)._m0[109].y, _977);
    float _1039 = precise::max(_526, 0.02999999932944774627685546875);
    float _1041 = fma(_845, (*spvDescriptorSet0.fp_c9)._m0[109].z, _1035);
    float _1043 = 1.0 / _1031;
    float _1045 = fma(_831, (*spvDescriptorSet0.fp_c9)._m0[125].x, _967);
    float _1047 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _1049 = _90 * _975;
    float _1051 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1053 = _1027 * _1051;
    float _1055 = precise::min(_1039, 0.300000011920928955078125);
    float _1057 = fma(_831, (*spvDescriptorSet0.fp_c9)._m0[125].z, _1015);
    float _1059 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _1061 = -_1053;
    float _1063 = fma(_1043, _1059, _1061);
    float _1065 = _90 * _1021;
    float _1067 = _1063 * _1047;
    float _1069 = precise::clamp(_1067, 0.0, 1.0);
    float _1071 = -_1057;
    float _1073 = _1071 + _1041;
    float _1075 = _631 + _633;
    float _1077 = precise::max(_1075, 0.4000000059604644775390625);
    float _1079 = precise::min(_1077, 0.60000002384185791015625);
    float _1081 = fma(_1079, 4.999999523162841796875, -1.99999988079071044921875);
    float _1083 = _1081 * _1049;
    float _1085 = _90 * _985;
    float _1087 = _1083 * _1085;
    float _1089 = _1087 * _1025;
    float _1091 = 0.0 + _1089;
    float _1093 = precise::clamp(_1091, 0.0, 1.0);
    float _1095 = _1093 * _1069;
    float _1097 = _1095 * _1065;
    bool _1099 = _1097 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _1101 = isnan(_1097);
    bool _1103 = _1099 || _1101;
    bool _1105 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _1107 = _1103 || _1105;
    float _1109 = fma(_1079, -4.999999523162841796875, 3.0);
    float _1111 = _1011;
    if (!_1107)
    {
        discard_fragment();
    }
    float _1113 = fma(_1055, -3.7037036418914794921875, 1.111111164093017578125);
    float _1115 = _1109 * _1109;
    float _1117 = _1115 * 0.5;
    float _1119 = -_1045;
    float _1121 = _1119 + _1033;
    float _1123 = fma(_1113, _1113, _1117);
    float _1125 = -_1011;
    float _1127 = _1125 + _1037;
    float _1129 = fma(_1123, _1121, _1045);
    float _1131 = fma(_1123, _1127, _1011);
    float _1133 = fma(_1123, _1073, _1057);
    if (!_1107)
    {
        out.m_57.x = _1129;
        out.m_57.y = _1131;
        out.m_57.z = _1133;
        out.m_57.w = _1089;
        return out;
    }
    float _1135 = _1131 * 0.715200006961822509765625;
    float _1137 = fma(_1129, 0.2125999927520751953125, _1135);
    float _1139 = fma(_1133, 0.072200000286102294921875, _1137);
    bool _1141 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _1143 = 1.0 / _1139;
    float _1145 = 0.0 + _1097;
    float _1147 = precise::clamp(_1145, 0.0, 1.0);
    float _1149 = _1147;
    if (_1141)
    {
        float _1151 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _1153 = _1053 + _1151;
        _1111 = _1153;
    }
    float _1155 = _1111;
    float _1157 = _1143 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _1159 = precise::clamp(_1157, 0.0, 1.0);
    float _1161 = _1155;
    if (_1141)
    {
        float _1163 = _1155 * 8.0;
        float _1165 = precise::clamp(_1163, 0.0, 1.0);
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = fma(_1159, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_1141)
    {
        float _1171 = _1147 * _1167;
        _1149 = _1171;
    }
    float _1173 = _1149;
    float _1175 = _1129 * _1169;
    float _1177 = _1131 * _1169;
    float _1179 = _1133 * _1169;
    float _1181 = 0.0 + _1173;
    float _1183 = precise::clamp(_1181, 0.0, 1.0);
    out.m_57.x = _1175;
    out.m_57.y = _1177;
    out.m_57.z = _1179;
    out.m_57.w = _1183;
    return out;
}

