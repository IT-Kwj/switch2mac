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
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c7 [[id(2)]];
    constant _16* fp_c9 [[id(3)]];
    constant _16* fp_c11 [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture3d<float> fp_t_tcb_18 [[id(7)]];
    sampler fp_t_tcb_18Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_10 [[id(9)]];
    sampler fp_t_tcb_10Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_8 [[id(11)]];
    sampler fp_t_tcb_8Smplr [[id(12)]];
    texture3d<float> fp_t_tcb_1A [[id(13)]];
    sampler fp_t_tcb_1ASmplr [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    sampler fp_t_tcb_18Smplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    sampler fp_t_tcb_8Smplr_w [[id(18)]];
    sampler fp_t_tcb_1ASmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_53 [[color(0)]];
    float4 m_55 [[color(1)]];
};

struct main0_in
{
    float4 m_50 [[user(locn0)]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _62 = gl_FragCoord.w;
    float _64 = in.m_46.z;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_46.x;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_46.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = 1.0 / _62;
    float _84 = _82 * _68;
    float _86 = _82 * _74;
    float _88 = _82 * _80;
    float _90 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _92 = _84 + _90;
    float _94 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _96 = _86 + _94;
    float _98 = _92 * _92;
    float _100 = fma(_96, _96, _98);
    float _102 = sqrt(_100);
    bool _106 = _102 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _108 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _110 = _102 + _108;
    float _112 = _98;
    float _114 = _80;
    float _116 = _110;
    if (_106)
    {
        float _118 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _112 = _118;
    }
    float _120 = _112;
    if (_106)
    {
        float _122 = _88 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _114 = _122;
    }
    float _124 = _114;
    float _126 = 0.0;
    float _128 = _124;
    if (_106)
    {
        float _130 = rsqrt(_100);
        _126 = _130;
    }
    float _132 = _126;
    float _134 = _132;
    if (_106)
    {
        float _136 = _110 * _120;
        _116 = _136;
    }
    float _138 = _116;
    float _140 = 0.0;
    if (_106)
    {
        float _142 = _138 * 0.15915493667125701904296875;
        _140 = _142;
    }
    float _144 = _140;
    float _146 = _138;
    if (_106)
    {
        float _148 = _144 * 6.283185482025146484375;
        float _150 = cos(_148);
        _146 = _150;
    }
    float _152 = _146;
    float _154 = _120;
    if (_106)
    {
        float _156 = _144 * 6.283185482025146484375;
        float _158 = sin(_156);
        _154 = _158;
    }
    float _160 = _154;
    float _162 = 0.0;
    float _164 = _152;
    if (_106)
    {
        float _166 = _152 + (-1.0);
        _162 = _166;
    }
    float _168 = _162;
    float _170 = 0.0;
    if (_106)
    {
        float _172 = _168 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _170 = _172;
    }
    float _174 = _170;
    float _176 = 0.0;
    float _178 = _160;
    if (_106)
    {
        float _180 = fma(_160, _124, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _176 = _180;
    }
    float _182 = _176;
    if (!_106)
    {
        _178 = _88;
    }
    float _184 = _178;
    float _186 = _184;
    if (_106)
    {
        float _188 = fma(_88, _152, _174);
        _186 = _188;
    }
    float _190 = _186;
    if (!_106)
    {
        _128 = _86;
    }
    float _192 = _128;
    float _194 = _192;
    if (_106)
    {
        float _196 = _132 * _182;
        _134 = _196;
    }
    float _198 = _134;
    if (!_106)
    {
        _164 = _84;
    }
    float _200 = _164;
    float _202 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _204 = _190 + _202;
    float _206 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _208 = _88 + _206;
    float _210 = _200;
    if (_106)
    {
        float _212 = fma(_96, _198, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _194 = _212;
    }
    float _214 = _194;
    if (_106)
    {
        float _216 = fma(_92, _198, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _210 = _216;
    }
    float _218 = _210;
    float _220 = _204 * _204;
    float _222 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _224 = _86 + _222;
    float _226 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _228 = _214 + _226;
    float _230 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _232 = _218 + _230;
    float _234 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _236 = _84 + _234;
    float _238 = in.m_48.w;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = fma(_228, _228, _220);
    float _246 = _208 * _208;
    float _248 = fma(_232, _232, _244);
    float _250 = fma(_224, _224, _246);
    float _252 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _254 = fma(_236, _236, _250);
    float _256 = rsqrt(_248);
    float _258 = precise::max(0.0, _252);
    float _260 = _256 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _262 = sqrt(_254);
    float _264 = _228 * _260;
    float _266 = _232 * _260;
    float _268 = -_260;
    float _270 = -_258;
    float _272 = fma(_204, _268, _270);
    float _274 = _264 * _264;
    float _276 = _266 * _266;
    float _278 = _274 + _276;
    float _280 = sqrt(_278);
    bool _282 = _280 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _284 = _258;
    float _286 = _236;
    float _288 = _250;
    float _290 = _264;
    float _292 = _266;
    if (!_282)
    {
        _284 = _276;
    }
    float _294 = _284;
    float _296 = _294;
    if (!_282)
    {
        _286 = _274;
    }
    float _298 = _286;
    float _300 = _298;
    if (!_282)
    {
        _288 = _272;
    }
    float _302 = _288;
    bool _304 = !_282;
    float _306 = _302;
    if (!_304)
    {
        float _308 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _310 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
        float _312 = _280 + _310;
        float _314 = _272 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _316 = rsqrt(_278);
        float _318 = _312 * _308;
        float _320 = _318 * 0.15915493667125701904296875;
        float _322 = _320 * 6.283185482025146484375;
        float _324 = sin(_322);
        float _326 = _320 * 6.283185482025146484375;
        float _328 = cos(_326);
        float _330 = fma(_324, _314, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        float _332 = _316 * _330;
        float _334 = _328 + (-1.0);
        float _336 = _264 * _332;
        float _338 = _266 * _332;
        float _340 = _334 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        float _342 = _338 * _338;
        float _344 = fma(_272, _328, _340);
        float _346 = _336 * _336;
        _306 = _344;
        _300 = _346;
        _296 = _342;
        _290 = _336;
        _292 = _338;
    }
    float _348 = _306;
    float _350 = _300;
    float _352 = _296;
    float _354 = _290;
    float _356 = _292;
    float _358 = fma(_348, _348, _350);
    float _360 = _82 * _242;
    float _362 = in.m_50.x;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = in.m_50.y;
    float _370 = gl_FragCoord.w;
    float _372 = _368 * _370;
    float _374 = _358 + _352;
    float _376 = _360 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _378 = gl_FragCoord.x;
    float _380 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _382 = _378 / _380;
    float _384 = rsqrt(_374);
    float _386 = gl_FragCoord.y;
    float _388 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _390 = _386 / _388;
    float _392 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _394 = fma(_262, (*spvDescriptorSet0.fp_c9)._m0[63].x, _392);
    float _396 = precise::clamp(_394, 0.0, 1.0);
    float _398 = -_396;
    float _400 = _398 + 1.0;
    float _402 = abs(_400);
    float _404 = log2(_402);
    float _406 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _408 = _384 * _354;
    float _410 = -_376;
    float _412 = fma(_410, _406, 1.0);
    float _414 = _384 * _348;
    float _416 = _384 * _356;
    float _418 = _408 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _420 = log2(_412);
    float _422 = -_418;
    float _424 = fma(_414, (*spvDescriptorSet0.fp_c9)._m0[69].y, _422);
    float _426 = _404 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _428 = -_416;
    float _430 = fma(_428, (*spvDescriptorSet0.fp_c9)._m0[69].z, _424);
    float _432 = _382 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _434 = fma(_430, -0.5, 0.5);
    float _436 = exp2(_426);
    float _438 = fma(_430, 0.5, 0.5);
    float _440 = _414 + 1.0;
    float _442 = _390 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float _444 = _420 * 0.693147182464599609375;
    float _446 = fma(_438, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _448 = _82 * _366;
    float _450 = _82 * _372;
    float _452 = sqrt(_434);
    float _454 = _444 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float _456 = -_414;
    float _458 = fma(_436, _440, _456);
    float _460 = fma(_438, _446, -0.212114393711090087890625);
    float _462 = fma(_458, 0.5, 0.5);
    float _464 = fma(_438, _460, 1.570728778839111328125);
    float _466 = _452 * 0.636619746685028076171875;
    float _468 = -_464;
    float _470 = fma(_466, _468, 1.0);
    float2 _1192 = float2(_448, _450);
    float3 _474 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1192, float2(0.0), isnan(_1192))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1192, float2(0.0), isnan(_1192))).xyz;
    float _476 = _474.x;
    float _478 = _474.y;
    float _480 = _474.z;
    float3 _1209 = float3(_432, _442, _454);
    float4 _483 = dm_bs(spvDescriptorSet0.fp_t_tcb_18.sample(spvDescriptorSet0.fp_t_tcb_18Smplr, select(_1209, float3(0.0), isnan(_1209))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_18, spvDescriptorSet0.fp_t_tcb_18Smplr_w, select(_1209, float3(0.0), isnan(_1209))).xyzw;
    float _485 = _483.x;
    float _487 = _483.y;
    float _489 = _483.z;
    float _491 = _483.w;
    float2 _1227 = float2(_470, _462);
    float3 _493 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1227, float2(0.0), isnan(_1227))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1227, float2(0.0), isnan(_1227))).xyz;
    float _495 = _493.x;
    float _497 = _493.y;
    float _499 = _493.z;
    float2 _1241 = float2(_448, _450);
    float _501 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1241, float2(0.0), isnan(_1241))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1241, float2(0.0), isnan(_1241))).w;
    float3 _1250 = float3(_432, _442, _454);
    float _503 = dm_bs(spvDescriptorSet0.fp_t_tcb_1A.sample(spvDescriptorSet0.fp_t_tcb_1ASmplr, select(_1250, float3(0.0), isnan(_1250))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_1A, spvDescriptorSet0.fp_t_tcb_1ASmplr_w, select(_1250, float3(0.0), isnan(_1250))).x;
    float _505 = _404 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    int _508 = as_type<int>((*spvDescriptorSet0.fp_c4)._m0[66].x) << 3;
    float _510 = exp2(_505);
    int _512 = _508 & 31;
    uint _515 = uint(int(uint(as_type<int>((*spvDescriptorSet0.fp_c7)._m0[13].z)) >> uint(_512)));
    bool _517 = uint(_512) < 32u;
    uint _519 = uint(_517 ? int(_515) : 0);
    uint _521 = extract_bits(_519, 0u, 8u);
    float _523 = float(_521);
    float _525 = -_510;
    float _527 = _525 + 1.0;
    float _529 = (*spvDescriptorSet0.fp_c7)._m0[15].y * 3.5;
    float _531 = _527 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _533 = -_531;
    float _535 = _533 + 1.0;
    float _537 = _523 * 0.0039215688593685626983642578125;
    float _539 = _476 * _529;
    float _541 = _531 * _491;
    float _543 = _478 * _529;
    float _545 = _480 * _529;
    float _547 = _535 * _491;
    float _549 = fma(_495, _541, _485);
    float _551 = fma(_497, _541, _487);
    float _553 = fma(_499, _541, _489);
    float _555 = _537 * _537;
    float _557 = _501 * (*spvDescriptorSet0.fp_c11)._m0[40].x;
    float _559 = precise::max(0.0, _539);
    float _561 = _503 * _549;
    float _563 = precise::max(0.0, _543);
    float _565 = _503 * _551;
    float _567 = precise::max(0.0, _545);
    float _569 = _503 * _553;
    float _571 = _557 * _555;
    float _573 = fma(_547, _559, _561);
    float _575 = fma(_547, _563, _565);
    float _577 = fma(_547, _567, _569);
    out.m_53.x = _573;
    out.m_53.y = _575;
    out.m_53.z = _577;
    out.m_53.w = _571;
    out.m_55.x = (*spvDescriptorSet0.fp_c11)._m0[44].z;
    return out;
}

