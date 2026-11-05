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
    float2 _522 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_522, float2(0.0), isnan(_522))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_522, float2(0.0), isnan(_522))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.x;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.y;
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
    float2 _614 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_614, float2(0.0), isnan(_614))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _628 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_628, float2(0.0), isnan(_628)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_628, float2(0.0), isnan(_628)), int2(1, 0)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _644 = float2(_129, _131);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_644, float2(0.0), isnan(_644)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_644, float2(0.0), isnan(_644)), int2(0, 1)).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = fma(_121, _67, _119);
    float _161 = fma(_127, _67, _123);
    float _163 = fma(_125, _67, _117);
    float _165 = 1.0 / _159;
    float2 _674 = float2(_129, _131);
    float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_674, float2(0.0), isnan(_674)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_674, float2(0.0), isnan(_674)), int2(1)).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _163 * _165;
    float _177 = _161 * _165;
    float2 _695 = float2(_63, _65);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _711 = float2(_175, _177);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_711, float2(0.0), isnan(_711))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_711, float2(0.0), isnan(_711))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = -_65;
    float _202 = _200 + _177;
    float _204 = _202 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _206 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _208 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _210 = _155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _212 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _206);
    float _214 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _208);
    float _216 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, _210);
    float _218 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _214);
    float _220 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[2].z, _216);
    float _222 = -_63;
    float _224 = _222 + _175;
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _228 = _171 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _230 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _212);
    float _232 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[2].x, _228);
    float _234 = precise::max(_230, _220);
    float _236 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[2].z, _232);
    float _238 = precise::min(_230, _220);
    float _240 = precise::min(_218, _236);
    float _242 = precise::max(_218, _236);
    float _244 = _184 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = precise::min(_238, _240);
    float _248 = precise::max(_234, _242);
    float _250 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _252 = _204 * _204;
    float _254 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].z, _250);
    float _256 = fma(_226, _226, _252);
    float _258 = precise::min(_254, _246);
    float _260 = precise::max(_254, _248);
    float _262 = _248 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _264 = sqrt(_256);
    float _266 = -_258;
    float _268 = _266 + _260;
    float _270 = precise::max(_262, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _274 = _268 > _270;
    float _276 = 0.0 + _264;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_278, -0.5, 0.5);
    float _282 = _238;
    float _284 = 0.5;
    float _286 = _226;
    float _288 = _182;
    if (!_274)
    {
        _282 = _184;
    }
    float _290 = _282;
    float _292 = _290;
    if (!_274)
    {
        _284 = _186;
    }
    float _294 = _284;
    float _296 = _294;
    if (!_274)
    {
        _286 = _188;
    }
    float _298 = _286;
    bool _300 = !_274;
    float _302 = _298;
    if (!_300)
    {
        float _304 = _230 + _218;
        float _306 = -_218;
        float _308 = _306 + _220;
        float _310 = -_230;
        float _312 = _310 + _236;
        float _314 = _220 + _304;
        float _316 = _308 + _312;
        float _318 = -_312;
        float _320 = _308 + _318;
        float _322 = _236 + _314;
        float _324 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _326 = abs(_316);
        float _328 = abs(_320);
        float _330 = precise::min(_326, _328);
        float _332 = fma(_322, _324, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _334 = precise::max(_332, _330);
        float _336 = 1.0 / _334;
        float _338 = _316 * _336;
        float _340 = _320 * _336;
        float _342 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _344 = precise::max(_338, _342);
        float _346 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _348 = precise::max(_340, _346);
        float _350 = precise::min(_344, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _352 = precise::min(_348, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _354 = -_350;
        float _356 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _358 = fma(_350, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _360 = -_352;
        float _362 = fma(_360, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _364 = fma(_352, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1002 = float2(_356, _362);
        float4 _366 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1002, float2(0.0), isnan(_1002))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1002, float2(0.0), isnan(_1002))).xyzw;
        float _368 = _366.x;
        float _370 = _366.y;
        float _372 = _366.z;
        float _374 = _366.w;
        float2 _1018 = float2(_358, _364);
        float4 _376 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1018, float2(0.0), isnan(_1018))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1018, float2(0.0), isnan(_1018))).xyzw;
        float _378 = _376.x;
        float _380 = _376.y;
        float _382 = _376.z;
        float _384 = _376.w;
        float _386 = -_368;
        float _388 = _386 + _378;
        float _390 = -_372;
        float _392 = _390 + _382;
        float _394 = -_370;
        float _396 = _394 + _380;
        float _398 = -_374;
        float _400 = _398 + _384;
        float _402 = fma(_388, 0.5, _368);
        float _404 = fma(_392, 0.5, _372);
        float _406 = fma(_396, 0.5, _370);
        float _408 = fma(_400, 0.5, _374);
        float _410 = -_402;
        float _412 = _182 + _410;
        float _414 = -_404;
        float _416 = _186 + _414;
        float _418 = -_406;
        float _420 = _184 + _418;
        float _422 = -_408;
        float _424 = _188 + _422;
        float _426 = fma(_412, 0.3499999940395355224609375, _402);
        float _428 = fma(_416, 0.3499999940395355224609375, _404);
        float _430 = fma(_420, 0.3499999940395355224609375, _406);
        float _432 = fma(_424, 0.3499999940395355224609375, _408);
        float _434 = -_426;
        float _436 = _182 + _434;
        float _438 = -_428;
        float _440 = _186 + _438;
        float _442 = -_430;
        float _444 = _184 + _442;
        float _446 = -_432;
        float _448 = _188 + _446;
        float _450 = fma(_436, (*spvDescriptorSet0.fp_c3)._m0[5].x, _426);
        float _452 = fma(_440, (*spvDescriptorSet0.fp_c3)._m0[5].x, _428);
        float _454 = fma(_444, (*spvDescriptorSet0.fp_c3)._m0[5].x, _430);
        float _456 = fma(_448, (*spvDescriptorSet0.fp_c3)._m0[5].x, _432);
        _288 = _450;
        _292 = _454;
        _296 = _452;
        _302 = _456;
    }
    float _458 = _288;
    float _460 = _292;
    float _462 = _296;
    float _464 = _302;
    float _466 = -_458;
    float _468 = _192 + _466;
    float _470 = -_460;
    float _472 = _194 + _470;
    float _474 = -_462;
    float _476 = _196 + _474;
    float _478 = -_464;
    float _480 = _198 + _478;
    float _482 = fma(_280, _468, _458);
    float _484 = fma(_280, _472, _460);
    float _486 = fma(_280, _476, _462);
    float _488 = fma(_280, _480, _464);
    out.m_40.x = _482;
    out.m_40.y = _484;
    out.m_40.z = _486;
    out.m_40.w = _488;
    return out;
}

