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
[[clang::optnone]] T spvFAdd(T l, T r)
{
    return fma(T(1), l, r);
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c4 [[id(3)]];
    constant _16* fp_c11 [[id(4)]];
    constant _16* fp_c13 [[id(5)]];
    texture2d<float> fp_t_tcb_1E [[id(6)]];
    sampler fp_t_tcb_1ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_16 [[id(8)]];
    sampler fp_t_tcb_16Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_14 [[id(12)]];
    sampler fp_t_tcb_14Smplr [[id(13)]];
    texture2d<float> fp_t_tcb_8 [[id(14)]];
    sampler fp_t_tcb_8Smplr [[id(15)]];
    texture2d<float> fp_t_tcb_10 [[id(16)]];
    sampler fp_t_tcb_10Smplr [[id(17)]];
    texture2d_array<float> fp_t_tcb_18 [[id(18)]];
    sampler fp_t_tcb_18Smplr [[id(19)]];
    texturecube_array<float> fp_t_tcb_20 [[id(20)]];
    sampler fp_t_tcb_20Smplr [[id(21)]];
    texture3d<float> fp_t_tcb_22 [[id(22)]];
    sampler fp_t_tcb_22Smplr [[id(23)]];
    texture2d<float> fp_t_tcb_1C [[id(24)]];
    sampler fp_t_tcb_1CSmplr [[id(25)]];
    texture2d<float> fp_t_tcb_1A [[id(26)]];
    sampler fp_t_tcb_1ASmplr [[id(27)]];
    sampler fp_t_tcb_1ESmplr_w [[id(28)]];
    sampler fp_t_tcb_16Smplr_w [[id(29)]];
    sampler fp_t_tcb_12Smplr_w [[id(30)]];
    sampler fp_t_tcb_14Smplr_w [[id(31)]];
    sampler fp_t_tcb_8Smplr_w [[id(32)]];
    sampler fp_t_tcb_10Smplr_w [[id(33)]];
    sampler fp_t_tcb_18Smplr_w [[id(34)]];
    sampler fp_t_tcb_20Smplr_w [[id(35)]];
    sampler fp_t_tcb_22Smplr_w [[id(36)]];
    sampler fp_t_tcb_1CSmplr_w [[id(37)]];
    sampler fp_t_tcb_1ASmplr_w [[id(38)]];
    constant dm_border_t* dm_border [[id(39)]];
};

struct main0_out
{
    float4 m_73 [[color(0)]];
    float4 m_75 [[color(1)]];
};

struct main0_in
{
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _82 = gl_FragCoord.x;
    float _84 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _86 = _82 / _84;
    float _88 = gl_FragCoord.y;
    float _90 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _92 = _88 / _90;
    float _94 = _86 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _96 = _92 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _1418 = float2(_94, _96);
    float2 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1418, float2(0.0), isnan(_1418))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1418, float2(0.0), isnan(_1418))).xy;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = gl_FragCoord.w;
    float _108 = in.m_66.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = in.m_66.z;
    float _116 = gl_FragCoord.w;
    float _118 = _114 * _116;
    float _120 = in.m_68.z;
    float _122 = gl_FragCoord.w;
    float _124 = _120 * _122;
    float _126 = in.m_68.w;
    float _128 = gl_FragCoord.w;
    float _130 = _126 * _128;
    int _133 = 1 & as_type<int>((*spvDescriptorSet0.fp_c9)._m0[40].w);
    bool _137 = _133 != 0;
    float _139 = 1.0 / _106;
    float _141 = _139 * _112;
    float _143 = _139 * _118;
    float _145 = fma(_141, (*spvDescriptorSet0.fp_c15)._m0[5].x, (*spvDescriptorSet0.fp_c15)._m0[5].z);
    float _147 = fma(_143, (*spvDescriptorSet0.fp_c15)._m0[5].x, (*spvDescriptorSet0.fp_c15)._m0[5].w);
    float _149 = fma(_145, (*spvDescriptorSet0.fp_c15)._m0[13].x, (*spvDescriptorSet0.fp_c15)._m0[13].z);
    float _151 = fma(_147, (*spvDescriptorSet0.fp_c15)._m0[13].x, (*spvDescriptorSet0.fp_c15)._m0[13].w);
    float _153 = fma(_145, (*spvDescriptorSet0.fp_c15)._m0[11].x, (*spvDescriptorSet0.fp_c15)._m0[11].z);
    float _155 = fma(_147, (*spvDescriptorSet0.fp_c15)._m0[11].x, (*spvDescriptorSet0.fp_c15)._m0[11].w);
    float _157 = fma(_145, (*spvDescriptorSet0.fp_c15)._m0[12].x, (*spvDescriptorSet0.fp_c15)._m0[12].z);
    float _159 = fma(_145, (*spvDescriptorSet0.fp_c15)._m0[10].x, (*spvDescriptorSet0.fp_c15)._m0[10].z);
    float _161 = fma(_147, (*spvDescriptorSet0.fp_c15)._m0[12].x, (*spvDescriptorSet0.fp_c15)._m0[12].w);
    float _163 = fma(_147, (*spvDescriptorSet0.fp_c15)._m0[10].x, (*spvDescriptorSet0.fp_c15)._m0[10].w);
    float _165 = _139 * _124;
    float _167 = _139 * _130;
    float2 _1552 = float2(_149, _151);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_16.sample(spvDescriptorSet0.fp_t_tcb_16Smplr, select(_1552, float2(0.0), isnan(_1552))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_16, spvDescriptorSet0.fp_t_tcb_16Smplr_w, select(_1552, float2(0.0), isnan(_1552))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _1566 = float2(_153, _155);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_12.sample(spvDescriptorSet0.fp_t_tcb_12Smplr, select(_1566, float2(0.0), isnan(_1566))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_12, spvDescriptorSet0.fp_t_tcb_12Smplr_w, select(_1566, float2(0.0), isnan(_1566))).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float _187 = fma(_102, 2.0, -1.0);
    float _189 = fma(_104, 2.0, -1.0);
    float2 _1586 = float2(_157, _161);
    float3 _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_14.sample(spvDescriptorSet0.fp_t_tcb_14Smplr, select(_1586, float2(0.0), isnan(_1586))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_14, spvDescriptorSet0.fp_t_tcb_14Smplr_w, select(_1586, float2(0.0), isnan(_1586))).xyz;
    float _193 = _191.x;
    float _195 = _191.y;
    float _197 = _191.z;
    float2 _1600 = float2(_165, _167);
    float2 _199 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1600, float2(0.0), isnan(_1600))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1600, float2(0.0), isnan(_1600))).xy;
    float _201 = _199.x;
    float _203 = _199.y;
    float2 _1612 = float2(_159, _163);
    float4 _206 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1612, float2(0.0), isnan(_1612))), spvDescriptorSet0.dm_border, 5u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1612, float2(0.0), isnan(_1612))).xyzw;
    float _208 = _206.x;
    float _210 = _206.y;
    float _212 = _206.z;
    float _214 = _206.w;
    float _216 = fma(_187, (*spvDescriptorSet0.fp_c9)._m0[983].z, _94);
    float _218 = fma(_189, (*spvDescriptorSet0.fp_c9)._m0[983].w, _96);
    bool _220 = !_137;
    float _222 = _220 ? _94 : _216;
    bool _224 = !_137;
    float _226 = _224 ? _96 : _218;
    float3 _1652 = float3(_222, _226, float(1));
    float3 _1656 = select(_1652, float3(0.0), isnan(_1652));
    float _228 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _1656.xy, uint(rint(_1656.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _1656.xy, uint(rint(_1656.z))).x;
    float _230 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _232 = _143 + _230;
    float _234 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _236 = _141 + _234;
    float _238 = in.m_66.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _246 = _141 + _244;
    float _248 = _232 * _232;
    float _250 = fma(_236, _236, _248);
    float _252 = sqrt(_250);
    bool _254 = _252 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _256 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _258 = _252 + _256;
    float _260 = _248;
    float _262 = _258;
    float _264 = _161;
    if (_254)
    {
        float _266 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (_254)
    {
        float _272 = rsqrt(_250);
        _270 = _272;
    }
    float _274 = _270;
    float _276 = _274;
    if (_254)
    {
        float _278 = _258 * _268;
        _262 = _278;
    }
    float _280 = _262;
    float _282 = _139 * _242;
    float _284 = 0.0;
    float _286 = _242;
    if (_254)
    {
        float _288 = _280 * 0.15915493667125701904296875;
        _284 = _288;
    }
    float _290 = _284;
    float _292 = 1.4012984643248170709237295832899e-45;
    if (_254)
    {
        float _294 = _290 * 6.283185482025146484375;
        float _296 = cos(_294);
        _292 = _296;
    }
    float _298 = _292;
    if (_254)
    {
        float _300 = _282 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _264 = _300;
    }
    float _302 = _264;
    float _304 = _280;
    if (_254)
    {
        float _306 = _290 * 6.283185482025146484375;
        float _308 = sin(_306);
        _304 = _308;
    }
    float _310 = _304;
    float _312 = _298;
    if (_254)
    {
        float _314 = _298 + (-1.0);
        _286 = _314;
    }
    float _316 = _286;
    float _318 = 0.0;
    float _320 = _316;
    if (_254)
    {
        float _322 = _316 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _318 = _322;
    }
    float _324 = _318;
    if (!_254)
    {
        _320 = _141;
    }
    float _326 = _320;
    float _328 = 0.0;
    float _330 = _310;
    float _332 = _326;
    if (_254)
    {
        float _334 = fma(_310, _302, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _328 = _334;
    }
    float _336 = _328;
    if (!_254)
    {
        _330 = _282;
    }
    float _338 = _330;
    float _340 = _338;
    if (_254)
    {
        float _342 = fma(_282, _298, _324);
        _340 = _342;
    }
    float _344 = _340;
    if (!_254)
    {
        _312 = _143;
    }
    float _346 = _312;
    float _348 = _346;
    if (_254)
    {
        float _350 = _274 * _336;
        _276 = _350;
    }
    float _352 = _276;
    float _354 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _356 = _344 + _354;
    if (_254)
    {
        float _358 = fma(_236, _352, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _332 = _358;
    }
    float _360 = _332;
    if (_254)
    {
        float _362 = fma(_232, _352, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _348 = _362;
    }
    float _364 = _348;
    float _366 = _356 * _356;
    float _368 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _370 = _360 + _368;
    float _372 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _374 = _364 + _372;
    float _376 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _378 = _143 + _376;
    float _380 = fma(_370, _370, _366);
    float _382 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _384 = _282 + _382;
    float _386 = fma(_374, _374, _380);
    float _388 = _384 * _384;
    float _390 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _392 = fma(_246, _246, _388);
    float _394 = rsqrt(_386);
    float _396 = precise::max(0.0, _390);
    float _398 = fma(_378, _378, _392);
    float _400 = sqrt(_398);
    float _402 = _394 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _404 = _370 * _402;
    float _406 = _374 * _402;
    float _408 = -_402;
    float _410 = -_396;
    float _412 = fma(_356, _408, _410);
    float _414 = _404 * _404;
    float _416 = _406 * _406;
    float _418 = spvFAdd(_400, 9.9999997473787516355514526367188e-06);
    float _420 = _414 + _416;
    float _422 = 1.0 / _418;
    float _424 = sqrt(_420);
    float _426 = _246 * _422;
    float _428 = _384 * _422;
    float _430 = _378 * _422;
    bool _432 = _424 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _434 = _418;
    float _436 = _416;
    float _438 = _414;
    float _440 = _404;
    float _442 = _406;
    if (!_432)
    {
        _434 = _416;
    }
    float _444 = _434;
    float _446 = _444;
    if (!_432)
    {
        _436 = _412;
    }
    float _448 = _436;
    bool _450 = !_432;
    float _452 = _448;
    if (!_450)
    {
        float _454 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _456 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _458 = _424 + _456;
        float _460 = rsqrt(_420);
        float _462 = _458 * _454;
        float _464 = _412 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _466 = _462 * 0.15915493667125701904296875;
        float _468 = _466 * 6.283185482025146484375;
        float _470 = sin(_468);
        float _472 = _466 * 6.283185482025146484375;
        float _474 = cos(_472);
        float _476 = fma(_470, _464, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _478 = _460 * _476;
        float _480 = _474 + (-1.0);
        float _482 = _404 * _478;
        float _484 = _406 * _478;
        float _486 = _480 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _488 = _484 * _484;
        float _490 = fma(_412, _474, _486);
        float _492 = _482 * _482;
        _452 = _490;
        _438 = _492;
        _446 = _488;
        _440 = _482;
        _442 = _484;
    }
    float _494 = _452;
    float _496 = _438;
    float _498 = _446;
    float _500 = _440;
    float _502 = _442;
    float _504 = _428 + (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _506 = (*spvDescriptorSet0.fp_c9)._m0[915].x * 0.5641896724700927734375;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _426 + (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _512 = (*spvDescriptorSet0.fp_c9)._m0[914].x * 0.28209483623504638671875;
    float _514 = precise::clamp(_512, 0.0, 1.0);
    float _516 = _504 * _504;
    float _518 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].x;
    float _520 = -_508;
    float _522 = _520 + 1.0;
    float _524 = _508 * 0.88622701168060302734375;
    float _526 = _430 + (*spvDescriptorSet0.fp_c9)._m0[67].z;
    float _528 = fma(_510, _510, _516);
    float _530 = _518 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _532 = _524 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _534 = fma(_494, _494, _496);
    float _536 = fma(_526, _526, _528);
    float _538 = _428 + (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _540 = fma(_530, _522, _532);
    float _542 = _534 + _498;
    float _544 = -_514;
    float _546 = _544 + 1.0;
    float _548 = _426 + (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _550 = rsqrt(_536);
    float _552 = _538 * _538;
    float _554 = fma(_546, (*spvDescriptorSet0.fp_c9)._m0[37].y, _514);
    float _556 = _430 + (*spvDescriptorSet0.fp_c9)._m0[69].z;
    float _558 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].z;
    float _560 = fma(_548, _548, _552);
    float _562 = 0.88622701168060302734375 * (*spvDescriptorSet0.fp_c9)._m0[908].y;
    float _564 = _554 * 0.88622701168060302734375;
    float _566 = rsqrt(_542);
    float _568 = fma(_556, _556, _560);
    float _570 = _558 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _572 = _562 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _574 = _524 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _576 = _524 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _578 = _504 * _550;
    float _580 = rsqrt(_568);
    float _582 = fma(_572, _522, _574);
    float _584 = fma(_570, _522, _576);
    float _586 = fma(_564, (*spvDescriptorSet0.fp_c9)._m0[911].x, _540);
    float _588 = _510 * _550;
    float _590 = _578 * (*spvDescriptorSet0.fp_c9)._m0[67].y;
    float _592 = _526 * _550;
    float _594 = _566 * _500;
    float _596 = _566 * _494;
    float _598 = fma(_588, (*spvDescriptorSet0.fp_c9)._m0[67].x, _590);
    float _600 = _566 * _502;
    float _602 = _594 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _604 = fma(_564, (*spvDescriptorSet0.fp_c9)._m0[911].y, _582);
    float _606 = fma(_564, (*spvDescriptorSet0.fp_c9)._m0[911].z, _584);
    float _608 = -_602;
    float _610 = fma(_596, (*spvDescriptorSet0.fp_c9)._m0[69].y, _608);
    float _612 = _548 * _580;
    float _614 = fma(_201, 2.007874011993408203125, -1.007874011993408203125);
    float _616 = fma(_203, 2.007874011993408203125, -1.007874011993408203125);
    float _618 = -_600;
    float _620 = fma(_618, (*spvDescriptorSet0.fp_c9)._m0[69].z, _610);
    float _622 = _538 * _580;
    float _624 = _614 * _614;
    float _626 = _604 * 0.18672408163547515869140625;
    float _628 = _556 * _580;
    float _630 = fma(_592, (*spvDescriptorSet0.fp_c9)._m0[67].z, _598);
    float _632 = precise::clamp(_630, 0.0, 1.0);
    float _634 = fma(_616, _616, _624);
    float _636 = fma(_586, 0.095146648585796356201171875, _626);
    float _638 = -(*spvDescriptorSet0.fp_c9)._m0[1007].x;
    float _640 = _638 + (*spvDescriptorSet0.fp_c9)._m0[1006].x;
    float _642 = -_634;
    float _644 = _642 + 1.0;
    float _646 = precise::clamp(_644, 0.0, 1.0);
    float _648 = fma(_606, 0.0364394821226596832275390625, _636);
    float _650 = fma(_620, 0.5, 0.5);
    float _652 = fma(_620, -0.5, 0.5);
    float _654 = sqrt(_646);
    float _656 = fma(_650, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _658 = fma(_650, _656, -0.212114393711090087890625);
    float _660 = -(*spvDescriptorSet0.fp_c9)._m0[1001].z;
    float _662 = _660 + (*spvDescriptorSet0.fp_c9)._m0[1000].z;
    float _664 = sqrt(_652);
    float _666 = fma(_650, _658, 1.570728778839111328125);
    float _668 = -(*spvDescriptorSet0.fp_c9)._m0[1001].x;
    float _670 = _668 + (*spvDescriptorSet0.fp_c9)._m0[1000].x;
    float _672 = -(*spvDescriptorSet0.fp_c9)._m0[1001].y;
    float _674 = _672 + (*spvDescriptorSet0.fp_c9)._m0[1000].y;
    float _676 = -(*spvDescriptorSet0.fp_c9)._m0[1007].y;
    float _678 = _676 + (*spvDescriptorSet0.fp_c9)._m0[1006].y;
    float _680 = -(*spvDescriptorSet0.fp_c9)._m0[1007].z;
    float _682 = _680 + (*spvDescriptorSet0.fp_c9)._m0[1006].z;
    float _684 = fma(_654, _654, _624);
    float _686 = fma(_616, _616, _684);
    float _688 = _664 * 0.636619746685028076171875;
    float _690 = rsqrt(_686);
    float _692 = -_666;
    float _694 = fma(_688, _692, 1.0);
    float _696 = _632 * _632;
    float _698 = fma(_696, 2.0, 0.5);
    float _700 = fma(_214, _698, -1.0);
    float _702 = _614 * _690;
    float _704 = _654 * _690;
    float _706 = _616 * _690;
    float _708 = _622 * (*spvDescriptorSet0.fp_c9)._m0[69].y;
    float _710 = _426 * _702;
    float _712 = _428 * _704;
    float _714 = _430 * _706;
    float _716 = fma(_704, 0.5, 0.5);
    float _718 = fma(_612, (*spvDescriptorSet0.fp_c9)._m0[69].x, _708);
    float _720 = _710 + _712;
    float _722 = -_710;
    float _724 = -_712;
    float _726 = _722 + _724;
    float _728 = fma(_716, _640, (*spvDescriptorSet0.fp_c9)._m0[1007].x);
    float _730 = _612 * _702;
    float _732 = _714 + _720;
    float _734 = -_714;
    float _736 = _734 + _726;
    float _738 = precise::clamp(_736, 0.0, 1.0);
    float _740 = fma(_716, _662, (*spvDescriptorSet0.fp_c9)._m0[1001].z);
    float _742 = fma(_716, _670, (*spvDescriptorSet0.fp_c9)._m0[1001].x);
    float _744 = fma(_716, _674, (*spvDescriptorSet0.fp_c9)._m0[1001].y);
    float _746 = _738 * (-9.27999973297119140625);
    float _748 = fma(_716, _678, (*spvDescriptorSet0.fp_c9)._m0[1007].y);
    float _750 = fma(_716, _682, (*spvDescriptorSet0.fp_c9)._m0[1007].z);
    float _752 = -_622;
    float _754 = -_730;
    float _756 = fma(_752, _704, _754);
    float _758 = _702 * (*spvDescriptorSet0.fp_c9)._m0[67].x;
    float _760 = _732 + _732;
    float _762 = exp2(_746);
    float _764 = _702 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _766 = _704 * _704;
    float _768 = -_704;
    float _770 = -_758;
    float _772 = fma(_768, (*spvDescriptorSet0.fp_c9)._m0[67].y, _770);
    float _774 = -_760;
    float _776 = fma(_704, _774, _428);
    float _778 = -_704;
    float _780 = -_764;
    float _782 = fma(_778, (*spvDescriptorSet0.fp_c9)._m0[69].y, _780);
    float _784 = -_430;
    float _786 = fma(_706, _760, _784);
    float _788 = -_214;
    float _790 = _788 + 1.0;
    float _792 = _748 * 0.715200006961822509765625;
    float _794 = -_760;
    float _796 = fma(_702, _794, _426);
    float _798 = fma(_702, _702, _766);
    float _800 = fma(_628, (*spvDescriptorSet0.fp_c9)._m0[69].z, _718);
    float _802 = precise::clamp(_800, 0.0, 1.0);
    float _804 = -_628;
    float _806 = fma(_804, _706, _756);
    float _808 = precise::clamp(_806, 0.0, 1.0);
    float _810 = _790 * _790;
    float _812 = fma(_728, 0.2125999927520751953125, _792);
    float _814 = _744 * 0.31830990314483642578125;
    float _816 = _740 * 0.31830990314483642578125;
    float _818 = fma(_750, 0.072200000286102294921875, _812);
    float _820 = precise::min(_810, _762);
    float _822 = fma(_214, -0.0274999998509883880615234375, 0.0425000004470348358154296875);
    float _824 = -_706;
    float _826 = fma(_824, (*spvDescriptorSet0.fp_c9)._m0[67].z, _772);
    float _828 = precise::clamp(_826, 0.0, 1.0);
    float _830 = -_738;
    float _832 = _830 + 1.0;
    float _834 = fma(_790, _820, _822);
    float _836 = 1.0 / _818;
    float _838 = -_828;
    float _840 = _838 + 1.0;
    float _842 = -_706;
    float _844 = fma(_842, (*spvDescriptorSet0.fp_c9)._m0[69].z, _782);
    float _846 = precise::clamp(_844, 0.0, 1.0);
    float _848 = fma(_706, _706, _798);
    float _850 = precise::clamp(_848, 0.0, 1.0);
    float _852 = _832 * _832;
    float _854 = _840 * _840;
    float _856 = -_228;
    float _858 = _856 + 1.0;
    float _860 = _193 * 0.4774648249149322509765625;
    float _862 = _852 * _852;
    float _864 = _854 * _854;
    float _866 = _195 * 0.4774648249149322509765625;
    float _868 = _840 * _864;
    float _870 = _832 * _862;
    float _872 = _836 * (*spvDescriptorSet0.fp_c9)._m0[39].z;
    float _874 = precise::clamp(_872, 0.0, 1.0);
    float _876 = _175 + (*spvDescriptorSet0.fp_c9)._m0[37].y;
    float _878 = precise::clamp(_876, 0.0, 1.0);
    float _880 = fma(_868, _700, 1.0);
    float _882 = fma(_870, _700, 1.0);
    float _884 = fma(_874, (*spvDescriptorSet0.fp_c9)._m0[39].y, (*spvDescriptorSet0.fp_c9)._m0[39].x);
    float _886 = fma(_183, _878, _866);
    float _888 = fma(_181, _878, _860);
    float _890 = _884 * 0.31830990314483642578125;
    float _892 = -_858;
    float _894 = fma(_892, (*spvDescriptorSet0.fp_c11)._m0[36].x, 1.0);
    float _896 = _886 * 0.586610972881317138671875;
    float _898 = _197 * 0.4774648249149322509765625;
    float _900 = abs(_796);
    float _902 = abs(_776);
    float _904 = precise::max(_900, _902);
    float _906 = _750 * _890;
    float _908 = fma(_888, 0.298911988735198974609375, _896);
    float _910 = fma(_185, _878, _898);
    float _912 = abs(_786);
    float _914 = precise::max(_912, _904);
    float _916 = _728 * _890;
    float _918 = _742 * 0.31830990314483642578125;
    float _920 = fma(_910, 0.114477999508380889892578125, _908);
    float _922 = -(*spvDescriptorSet0.fp_c9)._m0[1008].w;
    float _924 = fma(_400, (*spvDescriptorSet0.fp_c9)._m0[1008].z, _922);
    float _926 = precise::clamp(_924, 0.0, 1.0);
    float _928 = 1.0 / _914;
    float _930 = _920 * (*spvDescriptorSet0.fp_c9)._m0[1007].w;
    float _932 = _926 * (*spvDescriptorSet0.fp_c9)._m0[1006].w;
    float _934 = _748 * _890;
    float _936 = -(*spvDescriptorSet0.fp_c9)._m0[1008].y;
    float _938 = fma(_894, (*spvDescriptorSet0.fp_c9)._m0[1008].x, _936);
    float _940 = precise::clamp(_938, 0.0, 1.0);
    float _942 = precise::max(_648, 0.00999999977648258209228515625);
    float _944 = _596 + 1.0;
    float _946 = _880 * _882;
    float _948 = _932 * _940;
    float _950 = fma(_214, 0.02199999988079071044921875, -0.039999999105930328369140625);
    float _952 = -_948;
    float _954 = fma(_930, _952, _948);
    float _956 = _183 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _958 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _960 = fma(_400, (*spvDescriptorSet0.fp_c9)._m0[63].x, _958);
    float _962 = precise::clamp(_960, 0.0, 1.0);
    float _964 = _860 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _966 = _796 * _928;
    float _968 = _776 * _928;
    float _970 = -_962;
    float _972 = _970 + 1.0;
    float _974 = _786 * _928;
    float _976 = _181 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _978 = _866 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _980 = precise::max(_177, _954);
    float _982 = abs(_972);
    float _984 = log2(_982);
    float _986 = precise::max(_976, _918);
    float _988 = fma(_878, _976, _964);
    float _990 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].x;
    float _992 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].y;
    float _994 = fma(_878, _956, _978);
    float _996 = precise::max(_964, _916);
    float _998 = fma(_980, _990, _988);
    float _1000 = precise::max(_956, _814);
    float _1002 = fma(_980, _992, _994);
    float _1004 = _185 * (*spvDescriptorSet0.fp_c9)._m0[40].z;
    float _1006 = _898 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1008 = _1002 * 0.586610972881317138671875;
    float _1010 = 0.2820948064327239990234375 * (*spvDescriptorSet0.fp_c9)._m0[991].z;
    float _1012 = fma(_878, _1004, _1006);
    float _1014 = _984 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _1016 = fma(_998, 0.298911988735198974609375, _1008);
    float _1018 = precise::max(_1004, _816);
    float _1020 = fma(_980, _1010, _1012);
    float _1022 = fma(_980, _1010, _1006);
    float _1024 = in.m_70.w;
    float _1026 = gl_FragCoord.w;
    float _1028 = _1024 * _1026;
    float _1030 = exp2(_1014);
    float _1032 = fma(_1020, 0.114477999508380889892578125, _1016);
    float _1034 = precise::max(_1006, _906);
    float _1036 = 1.0 / _942;
    float _1038 = fma(_214, -0.572000026702880859375, 1.03999996185302734375);
    float _1040 = fma(_834, -1.03999996185302734375, _1038);
    float _1042 = precise::clamp(_1040, 0.0, 1.0);
    float _1044 = fma(_834, 1.03999996185302734375, _950);
    float _1046 = precise::clamp(_1044, 0.0, 1.0);
    float _1048 = -_596;
    float _1050 = fma(_1030, _944, _1048);
    float _1052 = fma(_980, _992, _978);
    float _1054 = fma(_1050, 0.5, 0.5);
    float _1056 = _1052 * 0.586610972881317138671875;
    float _1058 = fma(_980, _990, _964);
    float _1060 = _1032 * _1036;
    float _1062 = fma(_1058, 0.298911988735198974609375, _1056);
    float _1064 = precise::max(_978, _934);
    float _1066 = in.m_70.x;
    float _1068 = gl_FragCoord.w;
    float _1070 = _1066 * _1068;
    float _1072 = fma(_1022, 0.114477999508380889892578125, _1062);
    float _1074 = _139 * _1028;
    float _1076 = in.m_70.y;
    float _1078 = gl_FragCoord.w;
    float _1080 = _1076 * _1078;
    float _1082 = in.m_70.z;
    float _1084 = gl_FragCoord.w;
    float _1086 = _1082 * _1084;
    float _1088 = _1074 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _1090 = (-1.0) + (*spvDescriptorSet0.fp_c9)._m0[62].z;
    float _1092 = -_1088;
    float _1094 = fma(_1090, _1092, 1.0);
    float _1096 = log2(_1094);
    float _1098 = _214 * 7.0;
    float _1100 = _139 * _1070;
    float _1102 = _1096 * 0.693147182464599609375;
    float _1104 = fma(_214, -0.337748348712921142578125, 1.0);
    float _1106 = _139 * _1080;
    float _1108 = _139 * _1086;
    float _1110 = _1104 * _946;
    float _1112 = _1102 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float3 _3044 = float3(_222, _226, float(0));
    float3 _3046 = select(_3044, float3(0.0), isnan(_3044));
    float3 _1114 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, _3046.xy, uint(rint(_3046.z))), spvDescriptorSet0.dm_border, 6u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, _3046.xy, uint(rint(_3046.z))).xzw;
    float _1116 = _1114.x;
    float _1118 = _1114.y;
    float _1120 = _1114.z;
    float4 _3060 = float4(_966, _968, _974, float(1));
    float4 _3064 = select(_3060, float4(0.0), isnan(_3060));
    float3 _1122 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, _3064.xyz, uint(rint(_3064.w)), level(_1098)), spvDescriptorSet0.dm_border, 7u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, _3064.xyz, uint(rint(_3064.w)), level(_1098)).xyz;
    float _1124 = _1122.x;
    float _1126 = _1122.y;
    float _1128 = _1122.z;
    float3 _3078 = float3(_94, _96, _1112);
    float _1130 = dm_bs(spvDescriptorSet0.fp_t_tcb_22.sample(spvDescriptorSet0.fp_t_tcb_22Smplr, select(_3078, float3(0.0), isnan(_3078))), spvDescriptorSet0.dm_border, 8u, spvDescriptorSet0.fp_t_tcb_22, spvDescriptorSet0.fp_t_tcb_22Smplr_w, select(_3078, float3(0.0), isnan(_3078))).x;
    float2 _3086 = float2(_694, _1054);
    float3 _1132 = dm_bs(spvDescriptorSet0.fp_t_tcb_1C.sample(spvDescriptorSet0.fp_t_tcb_1CSmplr, select(_3086, float2(0.0), isnan(_3086))), spvDescriptorSet0.dm_border, 9u, spvDescriptorSet0.fp_t_tcb_1C, spvDescriptorSet0.fp_t_tcb_1CSmplr_w, select(_3086, float2(0.0), isnan(_3086))).xyz;
    float _1134 = _1132.x;
    float _1136 = _1132.y;
    float _1138 = _1132.z;
    float2 _3100 = float2(_216, _218);
    float4 _1140 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_3100, float2(0.0), isnan(_3100))), spvDescriptorSet0.dm_border, 10u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_3100, float2(0.0), isnan(_3100))).xyzw;
    float _1142 = _1140.x;
    float _1144 = _1140.y;
    float _1146 = _1140.z;
    float _1148 = _1140.w;
    float _1150 = fma(_850, 0.5, 0.5);
    float _1152 = fma(_214, 0.5, 0.5);
    float _1154 = fma(_214, _214, 0.00999999977648258209228515625);
    float _1156 = precise::clamp(_1154, 0.0, 1.0);
    float _1158 = _984 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _1160 = -_802;
    float _1162 = _1160 + 1.0;
    float _1164 = _1152 * _1152;
    float _1166 = _1164 * 0.5;
    float _1168 = _828 * _1110;
    float _1170 = fma(_878, _986, _996);
    float _1172 = _1162 * _1162;
    float _1174 = exp2(_1158);
    float _1176 = fma(_878, _1000, _1064);
    float _1178 = fma(_1042, 0.039999999105930328369140625, _1046);
    float _1180 = fma(_878, _1018, _1034);
    float _1182 = _1156 * _1156;
    float _1184 = _808 * _808;
    float _1186 = -_1166;
    float _1188 = _1186 + 1.0;
    float _1190 = _1172 * _1172;
    float _1192 = _1182 + (-1.0);
    float _1194 = _1182 * 0.31830990314483642578125;
    float _1196 = fma(_738, _1188, _1166);
    float _1198 = fma(_846, _1188, _1166);
    float _1200 = fma(_1184, _1192, 1.0);
    float _1202 = _1106 * 0.18672408163547515869140625;
    float _1204 = fma(_980, _990, _1170);
    float _1206 = _1196 * _1198;
    float _1208 = _1200 * _1200;
    float _1210 = fma(_1100, 0.095146648585796356201171875, _1202);
    float _1212 = _1162 * _1190;
    float _1214 = fma(_1108, 0.0364394821226596832275390625, _1210);
    float _1216 = 1.0 / _1208;
    float _1218 = fma(_1212, 0.959999978542327880859375, 0.039999999105930328369140625);
    float _1220 = -_1174;
    float _1222 = _1220 + 1.0;
    float _1224 = -(*spvDescriptorSet0.fp_c9)._m0[1001].w;
    float _1226 = fma(_400, (*spvDescriptorSet0.fp_c9)._m0[1000].w, _1224);
    float _1228 = precise::clamp(_1226, 0.0, 1.0);
    float _1230 = precise::max(_1214, 0.00999999977648258209228515625);
    float _1232 = fma(_980, _992, _1176);
    float _1234 = _1222 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _1236 = fma(_980, _1010, _1180);
    float _1238 = 1.0 / _1206;
    float _1240 = 1.0 / _1230;
    float _1242 = _1194 * _1216;
    float _1244 = _208 * _1204;
    float _1246 = precise::min(_1060, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1248 = _846 * _1242;
    float _1250 = _1168 * 0.31830990314483642578125;
    float _1252 = _1248 * _1238;
    float _1254 = _1252 * 0.25;
    float _1256 = _1250 * (*spvDescriptorSet0.fp_c9)._m0[68].x;
    float _1258 = _1250 * (*spvDescriptorSet0.fp_c9)._m0[68].y;
    float _1260 = _1250 * (*spvDescriptorSet0.fp_c9)._m0[68].z;
    float _1262 = _1218 * _1254;
    float _1264 = _1072 * _1240;
    float _1266 = _1262 * (*spvDescriptorSet0.fp_c9)._m0[70].y;
    float _1268 = precise::min(_1264, (*spvDescriptorSet0.fp_c9)._m0[27].w);
    float _1270 = _1268 * 0.31830990314483642578125;
    float _1272 = _173 * _1116;
    float _1274 = precise::min(_894, 1.0);
    float _1276 = _1246 * _1124;
    float _1278 = _1246 * _1126;
    float _1280 = -_1120;
    float _1282 = _1280 + 1.0;
    float _1284 = _1246 * _1128;
    float _1286 = precise::min(_1118, _1274);
    float _1288 = -_1276;
    float _1290 = fma(_1100, _1270, _1288);
    float _1292 = -_1278;
    float _1294 = fma(_1106, _1270, _1292);
    float _1296 = -_1282;
    float _1298 = fma(_1296, (*spvDescriptorSet0.fp_c13)._m0[1].w, 1.0);
    float _1300 = -_1118;
    float _1302 = _1300 + 1.0;
    float _1304 = -_1284;
    float _1306 = fma(_1108, _1270, _1304);
    float _1308 = precise::min(_1150, _1286);
    float _1310 = _1262 * (*spvDescriptorSet0.fp_c9)._m0[70].x;
    float _1312 = _1178 * _1286;
    float _1314 = fma(_1228, _1290, _1276);
    float _1316 = fma(_1228, _1294, _1278);
    float _1318 = _1272 * _1298;
    float _1320 = -_1302;
    float _1322 = fma(_1320, (*spvDescriptorSet0.fp_c13)._m0[5].y, 1.0);
    float _1324 = precise::clamp(_1322, 0.0, 1.0);
    float _1326 = _1262 * (*spvDescriptorSet0.fp_c9)._m0[70].z;
    float _1328 = fma(_1228, _1306, _1284);
    float _1330 = fma(_208, _1256, _1310);
    float _1332 = _210 * _1232;
    float _1334 = -_1234;
    float _1336 = _1334 + 1.0;
    float _1338 = _1314 * _1312;
    float _1340 = _1316 * _1312;
    float _1342 = _1318 * _1324;
    float _1344 = fma(_210, _1258, _1266);
    float _1346 = fma(_212, _1260, _1326);
    float _1348 = _1328 * _1312;
    float _1350 = _1148 * _1336;
    float _1352 = _212 * _1236;
    float _1354 = fma(_1342, _1330, _1338);
    float _1356 = fma(_1342, _1344, _1340);
    float _1358 = fma(_1342, _1346, _1348);
    float _1360 = _1148 * _1130;
    float _1362 = fma(_1308, _1244, _1354);
    float _1364 = fma(_1308, _1332, _1356);
    float _1366 = fma(_1308, _1352, _1358);
    float _1368 = _1234 * _1360;
    float _1370 = precise::max(0.0, _1362);
    float _1372 = precise::max(0.0, _1364);
    float _1374 = fma(_1134, _1368, _1142);
    float _1376 = precise::max(0.0, _1366);
    float _1378 = fma(_1136, _1368, _1144);
    float _1380 = fma(_1138, _1368, _1146);
    float _1382 = fma(_1350, _1370, _1374);
    float _1384 = fma(_1350, _1372, _1378);
    float _1386 = fma(_1350, _1376, _1380);
    out.m_73.x = _1382;
    out.m_73.y = _1384;
    out.m_73.z = _1386;
    out.m_73.w = 1.0;
    out.m_75.x = (*spvDescriptorSet0.fp_c11)._m0[34].x;
    return out;
}

