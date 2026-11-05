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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c4 [[id(2)]];
    constant _16* fp_c11 [[id(3)]];
    texture2d<float> fp_t_tcb_22 [[id(4)]];
    sampler fp_t_tcb_22Smplr [[id(5)]];
    texture3d<float> fp_t_tcb_28 [[id(6)]];
    sampler fp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_1E [[id(8)]];
    sampler fp_t_tcb_1ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_20 [[id(10)]];
    sampler fp_t_tcb_20Smplr [[id(11)]];
    sampler fp_t_tcb_22Smplr_w [[id(12)]];
    sampler fp_t_tcb_28Smplr_w [[id(13)]];
    sampler fp_t_tcb_1ESmplr_w [[id(14)]];
    sampler fp_t_tcb_20Smplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
    float4 m_49 [[color(1)]];
};

struct main0_in
{
    float4 m_42 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.x;
    float _58 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _60 = _56 / _58;
    float _62 = gl_FragCoord.y;
    float _64 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _66 = _62 / _64;
    float _68 = _60 * (*spvDescriptorSet0.fp_c9)._m0[989].x;
    float _70 = _66 * (*spvDescriptorSet0.fp_c9)._m0[989].y;
    float2 _577 = float2(_68, _70);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_22.sample(spvDescriptorSet0.fp_t_tcb_22Smplr, select(_577, float2(0.0), isnan(_577))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_22, spvDescriptorSet0.fp_t_tcb_22Smplr_w, select(_577, float2(0.0), isnan(_577))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = gl_FragCoord.w;
    float _82 = in.m_42.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_42.x;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_42.y;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = 1.0 / _80;
    float _102 = _100 * _86;
    float _104 = _100 * _92;
    float _106 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _108 = _102 + _106;
    float _110 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _112 = _104 + _110;
    float _114 = _108 * _108;
    float _116 = fma(_112, _112, _114);
    float _118 = sqrt(_116);
    bool _122 = _118 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _124 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _126 = _118 + _124;
    float _128 = _114;
    float _130 = _126;
    float _132 = _102;
    if (_122)
    {
        float _134 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _128 = _134;
    }
    float _136 = _128;
    float _138 = 0.0;
    if (_122)
    {
        float _140 = rsqrt(_116);
        _138 = _140;
    }
    float _142 = _138;
    float _144 = _142;
    if (_122)
    {
        float _146 = _126 * _136;
        _130 = _146;
    }
    float _148 = _130;
    float _150 = 0.0;
    if (_122)
    {
        float _152 = _148 * 0.15915493667125701904296875;
        _150 = _152;
    }
    float _154 = _150;
    float _156 = _100 * _98;
    float _158 = _136;
    float _160 = _98;
    if (_122)
    {
        float _162 = _154 * 6.283185482025146484375;
        float _164 = cos(_162);
        _158 = _164;
    }
    float _166 = _158;
    float _168 = 0.0;
    if (_122)
    {
        float _170 = _156 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _168 = _170;
    }
    float _172 = _168;
    float _174 = 0.0;
    float _176 = _172;
    if (_122)
    {
        float _178 = _154 * 6.283185482025146484375;
        float _180 = sin(_178);
        _174 = _180;
    }
    float _182 = _174;
    float _184 = 0.0;
    float _186 = _166;
    if (_122)
    {
        float _188 = _166 + (-1.0);
        _184 = _188;
    }
    float _190 = _184;
    float _192 = _190;
    if (_122)
    {
        float _194 = _190 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _192 = _194;
    }
    float _196 = _192;
    float _198 = 0.0;
    float _200 = _182;
    if (_122)
    {
        float _202 = fma(_182, _172, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _198 = _202;
    }
    float _204 = _198;
    if (!_122)
    {
        _200 = _156;
    }
    float _206 = _200;
    float _208 = _206;
    if (_122)
    {
        float _210 = fma(_156, _166, _196);
        _208 = _210;
    }
    float _212 = _208;
    if (!_122)
    {
        _176 = _104;
    }
    float _214 = _176;
    float _216 = _214;
    if (_122)
    {
        float _218 = _142 * _204;
        _144 = _218;
    }
    float _220 = _144;
    if (!_122)
    {
        _186 = _102;
    }
    float _222 = _186;
    float _224 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _226 = _156 + _224;
    float _228 = -(*spvDescriptorSet0.fp_c4)._m0[11].w;
    float _230 = _104 + _228;
    float _232 = _222;
    float _234 = _230;
    if (_122)
    {
        float _236 = fma(_112, _220, (*spvDescriptorSet0.fp_c9)._m0[26].x);
        _216 = _236;
    }
    float _238 = _216;
    float _240 = -(*spvDescriptorSet0.fp_c9)._m0[26].y;
    float _242 = _212 + _240;
    float _244 = _242;
    if (_122)
    {
        float _246 = fma(_108, _220, (*spvDescriptorSet0.fp_c9)._m0[26].z);
        _232 = _246;
    }
    float _248 = _232;
    float _250 = _226 * _226;
    float _252 = -(*spvDescriptorSet0.fp_c9)._m0[26].x;
    float _254 = _238 + _252;
    float _256 = _242 * _242;
    float _258 = -(*spvDescriptorSet0.fp_c9)._m0[26].z;
    float _260 = _248 + _258;
    float _262 = fma(_254, _254, _256);
    float _264 = fma(_260, _260, _262);
    float _266 = rsqrt(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c9)._m0[26].w;
    float _270 = _254 * _268;
    float _272 = _260 * _268;
    float _274 = _270 * _270;
    float _276 = _272 * _272;
    float _278 = _274 + _276;
    float _280 = sqrt(_278);
    bool _282 = _280 > (*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _284 = -(*spvDescriptorSet0.fp_c9)._m0[42].y;
    float _286 = _280 + _284;
    float _288 = _220;
    float _290 = _266;
    float _292 = _272;
    float _294 = _274;
    float _296 = _276;
    if (_282)
    {
        float _298 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _288 = _298;
    }
    float _300 = _288;
    if (_282)
    {
        float _302 = _286 * _300;
        _290 = _302;
    }
    float _304 = _290;
    if (_282)
    {
        float _306 = _304 * 0.15915493667125701904296875;
        _160 = _306;
    }
    float _308 = _160;
    float _310 = _204;
    if (_282)
    {
        float _312 = _308 * 6.283185482025146484375;
        float _314 = sin(_312);
        _310 = _314;
    }
    float _316 = _310;
    float _318 = (*spvDescriptorSet0.fp_c9)._m0[26].y + (-220.0);
    float _320 = precise::max(0.0, _318);
    float _322 = _300;
    if (_282)
    {
        float _324 = _308 * 6.283185482025146484375;
        float _326 = cos(_324);
        _322 = _326;
    }
    float _328 = _322;
    float _330 = -_268;
    float _332 = -_320;
    float _334 = fma(_242, _330, _332);
    float _336 = fma(_230, _230, _250);
    float _338 = -(*spvDescriptorSet0.fp_c4)._m0[13].w;
    float _340 = _102 + _338;
    float _342 = _318;
    if (_282)
    {
        float _344 = rsqrt(_278);
        _342 = _344;
    }
    float _346 = _342;
    if (_282)
    {
        float _348 = _334 + (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _244 = _348;
    }
    float _350 = _244;
    float _352 = fma(_340, _340, _336);
    if (!_282)
    {
        _132 = _334;
    }
    float _354 = _132;
    float _356 = _316;
    float _358 = _354;
    if (_282)
    {
        float _360 = fma(_316, _350, (*spvDescriptorSet0.fp_c9)._m0[42].y);
        _356 = _360;
    }
    float _362 = _356;
    float _364 = in.m_44.w;
    float _366 = gl_FragCoord.w;
    float _368 = _364 * _366;
    float _370 = _362;
    if (_282)
    {
        float _372 = _328 + (-1.0);
        _234 = _372;
    }
    float _374 = _234;
    float _376 = sqrt(_352);
    float _378 = _346;
    float _380 = _374;
    if (_282)
    {
        float _382 = _346 * _362;
        _378 = _382;
    }
    float _384 = _378;
    if (_282)
    {
        float _386 = _374 * (*spvDescriptorSet0.fp_c9)._m0[42].z;
        _370 = _386;
    }
    float _388 = _370;
    if (!_282)
    {
        _380 = _270;
    }
    float _390 = _380;
    float _392 = _390;
    if (_282)
    {
        float _394 = _270 * _384;
        _392 = _394;
    }
    float _396 = _392;
    if (_282)
    {
        float _398 = fma(_334, _328, _388);
        _358 = _398;
    }
    float _400 = _358;
    if (_282)
    {
        float _402 = _272 * _384;
        _292 = _402;
    }
    float _404 = _292;
    if (_282)
    {
        float _406 = _396 * _396;
        _294 = _406;
    }
    float _408 = _294;
    float _410 = -(*spvDescriptorSet0.fp_c9)._m0[63].y;
    float _412 = fma(_376, (*spvDescriptorSet0.fp_c9)._m0[63].x, _410);
    float _414 = precise::clamp(_412, 0.0, 1.0);
    if (_282)
    {
        float _416 = _404 * _404;
        _296 = _416;
    }
    float _418 = _296;
    float _420 = fma(_400, _400, _408);
    float _422 = -_414;
    float _424 = _422 + 1.0;
    float _426 = _420 + _418;
    float _428 = abs(_424);
    float _430 = log2(_428);
    float _432 = _100 * _368;
    float _434 = rsqrt(_426);
    float _436 = _432 * (*spvDescriptorSet0.fp_c9)._m0[62].y;
    float _438 = _434 * _396;
    float _440 = _434 * _400;
    float _442 = _434 * _404;
    float _444 = _438 * (*spvDescriptorSet0.fp_c9)._m0[69].x;
    float _446 = _440 + 1.0;
    float _448 = -_444;
    float _450 = fma(_440, (*spvDescriptorSet0.fp_c9)._m0[69].y, _448);
    float _452 = _430 * (*spvDescriptorSet0.fp_c9)._m0[64].x;
    float _454 = -_442;
    float _456 = fma(_454, (*spvDescriptorSet0.fp_c9)._m0[69].z, _450);
    float _458 = exp2(_452);
    float _460 = fma(_456, -0.5, 0.5);
    float _462 = fma(_456, 0.5, 0.5);
    float _464 = (*spvDescriptorSet0.fp_c9)._m0[62].z + (-1.0);
    float _466 = -_436;
    float _468 = fma(_464, _466, 1.0);
    float _470 = sqrt(_460);
    float _472 = fma(_462, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _474 = log2(_468);
    float _476 = -_440;
    float _478 = fma(_458, _446, _476);
    float _480 = fma(_462, _472, -0.212114393711090087890625);
    float _482 = fma(_478, 0.5, 0.5);
    float _484 = fma(_462, _480, 1.570728778839111328125);
    float _486 = _470 * 0.636619746685028076171875;
    float _488 = fma(_76, 2.0, -1.0);
    float _490 = fma(_78, 2.0, -1.0);
    float _492 = -_484;
    float _494 = fma(_486, _492, 1.0);
    float _496 = fma(_488, (*spvDescriptorSet0.fp_c9)._m0[983].z, _68);
    float _498 = fma(_490, (*spvDescriptorSet0.fp_c9)._m0[983].w, _70);
    float _500 = _474 * 0.693147182464599609375;
    float _502 = _500 * (*spvDescriptorSet0.fp_c9)._m0[62].w;
    float3 _1237 = float3(_68, _70, _502);
    float _504 = dm_bs(spvDescriptorSet0.fp_t_tcb_28.sample(spvDescriptorSet0.fp_t_tcb_28Smplr, select(_1237, float3(0.0), isnan(_1237))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_28, spvDescriptorSet0.fp_t_tcb_28Smplr_w, select(_1237, float3(0.0), isnan(_1237))).x;
    float2 _1247 = float2(_496, _498);
    float4 _507 = dm_bs(spvDescriptorSet0.fp_t_tcb_1E.sample(spvDescriptorSet0.fp_t_tcb_1ESmplr, select(_1247, float2(0.0), isnan(_1247))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_1E, spvDescriptorSet0.fp_t_tcb_1ESmplr_w, select(_1247, float2(0.0), isnan(_1247))).xyzw;
    float _509 = _507.x;
    float _511 = _507.y;
    float _513 = _507.z;
    float _515 = _507.w;
    float2 _1263 = float2(_494, _482);
    float3 _519 = dm_bs(spvDescriptorSet0.fp_t_tcb_20.sample(spvDescriptorSet0.fp_t_tcb_20Smplr, select(_1263, float2(0.0), isnan(_1263))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_20, spvDescriptorSet0.fp_t_tcb_20Smplr_w, select(_1263, float2(0.0), isnan(_1263))).xyz;
    float _521 = _519.x;
    float _523 = _519.y;
    float _525 = _519.z;
    float _527 = _430 * (*spvDescriptorSet0.fp_c9)._m0[64].y;
    float _529 = exp2(_527);
    float _531 = -_529;
    float _533 = _531 + 1.0;
    float _535 = _533 * (*spvDescriptorSet0.fp_c9)._m0[64].z;
    float _537 = _515 * _504;
    float _539 = _535 * _537;
    float _541 = fma(_525, _539, _513);
    float _543 = fma(_521, _539, _509);
    float _545 = fma(_523, _539, _511);
    out.m_47.x = _543;
    out.m_47.y = _545;
    out.m_47.z = _541;
    out.m_47.w = 1.0;
    out.m_49.x = (*spvDescriptorSet0.fp_c11)._m0[34].x;
    return out;
}

