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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_33.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_33.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _542 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_542, float2(0.0), isnan(_542))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_542, float2(0.0), isnan(_542))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_33.z;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_33.w;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _61 * _73;
    float _119 = _61 * _79;
    float _121 = _61 * _85;
    float _123 = _61 * _91;
    float _125 = _61 * _97;
    float _127 = _61 * _103;
    float _129 = _61 * _109;
    float _131 = _61 * _115;
    float2 _634 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _648 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_648, float2(0.0), isnan(_648)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_648, float2(0.0), isnan(_648)), int2(0, 1)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float _151 = fma(_119, _67, _117);
    float _153 = fma(_125, _67, _123);
    float _155 = fma(_127, _67, _121);
    float _157 = 1.0 / _151;
    float _159 = _153 * _157;
    float _161 = _155 * _157;
    float2 _685 = float2(_129, _131);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_685, float2(0.0), isnan(_685)), int2(1, 0)).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float2 _700 = float2(_129, _131);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_700, float2(0.0), isnan(_700)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_700, float2(0.0), isnan(_700)), int2(1)).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _715 = float2(_63, _65);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_715, float2(0.0), isnan(_715))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_715, float2(0.0), isnan(_715))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _731 = float2(_161, _159);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_731, float2(0.0), isnan(_731))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_731, float2(0.0), isnan(_731))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _202 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _204 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _200);
    float _206 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _202);
    float _208 = -_65;
    float _210 = _208 + _159;
    float _212 = -_63;
    float _214 = _212 + _161;
    float _216 = _210 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _218 = _214 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _220 = _216 * _216;
    float _222 = _167 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _224 = _175 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _226 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _204);
    float _228 = _184 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[2].x, _222);
    float _232 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[2].x, _224);
    float _234 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _206);
    float _236 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _238 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[2].z, _230);
    float _240 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _242 = precise::min(_226, _234);
    float _244 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].z, _236);
    float _246 = precise::max(_226, _234);
    float _248 = precise::min(_238, _240);
    float _250 = precise::max(_238, _240);
    float _252 = precise::min(_242, _248);
    float _254 = precise::max(_246, _250);
    float _256 = precise::min(_244, _252);
    float _258 = precise::max(_244, _254);
    float _260 = _254 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _262 = -_256;
    float _264 = _262 + _258;
    float _266 = precise::max(_260, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _270 = _264 > _266;
    float _272 = fma(_218, _218, _220);
    float _274 = _218;
    float _276 = _264;
    float _278 = _248;
    float _280 = _260;
    if (!_270)
    {
        _274 = _182;
    }
    float _282 = _274;
    float _284 = _282;
    if (!_270)
    {
        _276 = _184;
    }
    float _286 = _276;
    float _288 = _286;
    if (!_270)
    {
        _278 = _186;
    }
    float _290 = _278;
    float _292 = _290;
    if (!_270)
    {
        _280 = _188;
    }
    float _294 = _280;
    bool _296 = !_270;
    float _298 = _294;
    if (!_296)
    {
        float _300 = _226 + _238;
        float _302 = -_238;
        float _304 = _302 + _234;
        float _306 = -_226;
        float _308 = _306 + _240;
        float _310 = _234 + _300;
        float _312 = _304 + _308;
        float _314 = -_308;
        float _316 = _304 + _314;
        float _318 = _240 + _310;
        float _320 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _322 = abs(_312);
        float _324 = abs(_316);
        float _326 = precise::min(_322, _324);
        float _328 = fma(_318, _320, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _330 = precise::max(_328, _326);
        float _332 = 1.0 / _330;
        float _334 = _312 * _332;
        float _336 = _316 * _332;
        float _338 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _340 = precise::max(_334, _338);
        float _342 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _344 = precise::max(_336, _342);
        float _346 = precise::min(_340, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _348 = precise::min(_344, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _350 = -_346;
        float _352 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _354 = -_346;
        float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _358 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _360 = fma(_346, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _362 = -_348;
        float _364 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _366 = -_348;
        float _368 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _370 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _372 = fma(_348, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1044 = float2(_352, _364);
        float4 _374 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1044, float2(0.0), isnan(_1044))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1044, float2(0.0), isnan(_1044))).xyzw;
        float _376 = _374.x;
        float _378 = _374.y;
        float _380 = _374.z;
        float _382 = _374.w;
        float2 _1060 = float2(_356, _368);
        float4 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1060, float2(0.0), isnan(_1060))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1060, float2(0.0), isnan(_1060))).xyzw;
        float _386 = _384.x;
        float _388 = _384.y;
        float _390 = _384.z;
        float _392 = _384.w;
        float2 _1076 = float2(_358, _370);
        float4 _394 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1076, float2(0.0), isnan(_1076))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1076, float2(0.0), isnan(_1076))).xyzw;
        float _396 = _394.x;
        float _398 = _394.y;
        float _400 = _394.z;
        float _402 = _394.w;
        float2 _1092 = float2(_360, _372);
        float4 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1092, float2(0.0), isnan(_1092))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1092, float2(0.0), isnan(_1092))).xyzw;
        float _406 = _404.x;
        float _408 = _404.y;
        float _410 = _404.z;
        float _412 = _404.w;
        float _414 = _378 + _388;
        float _416 = _380 + _390;
        float _418 = _376 + _386;
        float _420 = _382 + _392;
        float _422 = _398 + _414;
        float _424 = _400 + _416;
        float _426 = _396 + _418;
        float _428 = _402 + _420;
        float _430 = _408 + _422;
        float _432 = _410 + _424;
        float _434 = _406 + _426;
        float _436 = _412 + _428;
        float _438 = _430 * 0.25;
        float _440 = _432 * 0.25;
        float _442 = _434 * 0.25;
        float _444 = _436 * 0.25;
        float _446 = -_438;
        float _448 = _184 + _446;
        float _450 = -_440;
        float _452 = _186 + _450;
        float _454 = -_442;
        float _456 = _182 + _454;
        float _458 = -_444;
        float _460 = _188 + _458;
        float _462 = fma(_448, (*spvDescriptorSet0.fp_c3)._m0[5].x, _438);
        float _464 = fma(_452, (*spvDescriptorSet0.fp_c3)._m0[5].x, _440);
        float _466 = fma(_456, (*spvDescriptorSet0.fp_c3)._m0[5].x, _442);
        float _468 = fma(_460, (*spvDescriptorSet0.fp_c3)._m0[5].x, _444);
        _284 = _466;
        _292 = _464;
        _298 = _468;
        _288 = _462;
    }
    float _470 = _284;
    float _472 = _292;
    float _474 = _298;
    float _476 = _288;
    float _478 = sqrt(_272);
    float _480 = -_470;
    float _482 = _192 + _480;
    float _484 = -_472;
    float _486 = _196 + _484;
    float _488 = -_474;
    float _490 = _198 + _488;
    float _492 = 0.0 + _478;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = fma(_494, -0.5, 0.5);
    float _498 = -_476;
    float _500 = _194 + _498;
    float _502 = fma(_496, _482, _470);
    float _504 = fma(_496, _500, _476);
    float _506 = fma(_496, _486, _472);
    float _508 = fma(_496, _490, _474);
    out.m_40.x = _502;
    out.m_40.y = _504;
    out.m_40.z = _506;
    out.m_40.w = _508;
    return out;
}

