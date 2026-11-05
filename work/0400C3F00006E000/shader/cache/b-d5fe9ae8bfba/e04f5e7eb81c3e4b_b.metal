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
    float2 _518 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_518, float2(0.0), isnan(_518))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_518, float2(0.0), isnan(_518))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.w;
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
    float2 _610 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _624 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624)), int2(1, 0)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _640 = float2(_129, _131);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_640, float2(0.0), isnan(_640)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_640, float2(0.0), isnan(_640)), int2(0, 1)).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float2 _655 = float2(_129, _131);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_655, float2(0.0), isnan(_655)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_655, float2(0.0), isnan(_655)), int2(1)).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float _167 = fma(_123, _67, _121);
    float _169 = fma(_125, _67, _119);
    float _171 = fma(_127, _67, _117);
    float _173 = 1.0 / _167;
    float _175 = _171 * _173;
    float _177 = _169 * _173;
    float2 _691 = float2(_63, _65);
    float4 _180 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_691, float2(0.0), isnan(_691))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_691, float2(0.0), isnan(_691))).xyzw;
    float _182 = _180.x;
    float _184 = _180.y;
    float _186 = _180.z;
    float _188 = _180.w;
    float2 _707 = float2(_175, _177);
    float4 _190 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_707, float2(0.0), isnan(_707))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_707, float2(0.0), isnan(_707))).xyzw;
    float _192 = _190.x;
    float _194 = _190.y;
    float _196 = _190.z;
    float _198 = _190.w;
    float _200 = -_65;
    float _202 = _200 + _177;
    float _204 = -_63;
    float _206 = _204 + _175;
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _210 = _206 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _212 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _214 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _216 = _208 * _208;
    float _218 = _155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _220 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _212);
    float _222 = _163 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _224 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _214);
    float _226 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, _218);
    float _228 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _220);
    float _230 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[2].x, _222);
    float _232 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _224);
    float _234 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[2].z, _226);
    float _236 = fma(_210, _210, _216);
    float _238 = fma(_165, (*spvDescriptorSet0.fp_c3)._m0[2].z, _230);
    float _240 = precise::min(_228, _234);
    float _242 = precise::min(_232, _238);
    float _244 = sqrt(_236);
    float _246 = precise::max(_228, _234);
    float _248 = precise::max(_232, _238);
    float _250 = precise::min(_240, _242);
    float _252 = precise::max(_246, _248);
    float _254 = _184 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _256 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[2].x, _254);
    float _258 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[2].z, _256);
    float _260 = precise::min(_258, _250);
    float _262 = precise::max(_258, _252);
    float _264 = _252 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _266 = -_260;
    float _268 = _266 + _262;
    float _270 = precise::max(_264, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _274 = _268 > _270;
    float _276 = 0.0 + _244;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_278, -0.5, 0.5);
    float _282 = 0.5;
    float _284 = _268;
    float _286 = _182;
    float _288 = _186;
    if (!_274)
    {
        _282 = _182;
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
        _286 = _184;
    }
    float _298 = _286;
    float _300 = _298;
    if (!_274)
    {
        _288 = _188;
    }
    float _302 = _288;
    bool _304 = !_274;
    float _306 = _302;
    if (!_304)
    {
        float _308 = _228 + _232;
        float _310 = -_232;
        float _312 = _310 + _234;
        float _314 = -_228;
        float _316 = _314 + _238;
        float _318 = _234 + _308;
        float _320 = _312 + _316;
        float _322 = -_316;
        float _324 = _312 + _322;
        float _326 = _238 + _318;
        float _328 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _330 = abs(_320);
        float _332 = abs(_324);
        float _334 = precise::min(_330, _332);
        float _336 = fma(_326, _328, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _338 = precise::max(_336, _334);
        float _340 = 1.0 / _338;
        float _342 = _320 * _340;
        float _344 = _324 * _340;
        float _346 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _348 = precise::max(_342, _346);
        float _350 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _352 = precise::max(_344, _350);
        float _354 = precise::min(_348, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _356 = precise::min(_352, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _358 = -_354;
        float _360 = fma(_358, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _362 = -_354;
        float _364 = fma(_362, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _366 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[1].z, _63);
        float _368 = fma(_354, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _370 = -_356;
        float _372 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _374 = -_356;
        float _376 = fma(_374, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _378 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[1].w, _65);
        float _380 = fma(_356, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1029 = float2(_360, _372);
        float4 _382 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1029, float2(0.0), isnan(_1029))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1029, float2(0.0), isnan(_1029))).xyzw;
        float _384 = _382.x;
        float _386 = _382.y;
        float _388 = _382.z;
        float _390 = _382.w;
        float2 _1045 = float2(_364, _376);
        float4 _392 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1045, float2(0.0), isnan(_1045))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1045, float2(0.0), isnan(_1045))).xyzw;
        float _394 = _392.x;
        float _396 = _392.y;
        float _398 = _392.z;
        float _400 = _392.w;
        float2 _1061 = float2(_366, _378);
        float4 _402 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1061, float2(0.0), isnan(_1061))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1061, float2(0.0), isnan(_1061))).xyzw;
        float _404 = _402.x;
        float _406 = _402.y;
        float _408 = _402.z;
        float _410 = _402.w;
        float2 _1077 = float2(_368, _380);
        float4 _412 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1077, float2(0.0), isnan(_1077))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1077, float2(0.0), isnan(_1077))).xyzw;
        float _414 = _412.x;
        float _416 = _412.y;
        float _418 = _412.z;
        float _420 = _412.w;
        float _422 = _386 + _396;
        float _424 = _388 + _398;
        float _426 = _384 + _394;
        float _428 = _390 + _400;
        float _430 = _406 + _422;
        float _432 = _408 + _424;
        float _434 = _404 + _426;
        float _436 = _410 + _428;
        float _438 = _416 + _430;
        float _440 = _418 + _432;
        float _442 = _414 + _434;
        float _444 = _420 + _436;
        float _446 = _438 * 0.25;
        float _448 = _440 * 0.25;
        float _450 = _442 * 0.25;
        float _452 = _444 * 0.25;
        _292 = _450;
        _300 = _446;
        _296 = _448;
        _306 = _452;
    }
    float _454 = _292;
    float _456 = _300;
    float _458 = _296;
    float _460 = _306;
    float _462 = -_454;
    float _464 = _192 + _462;
    float _466 = -_456;
    float _468 = _194 + _466;
    float _470 = -_458;
    float _472 = _196 + _470;
    float _474 = -_460;
    float _476 = _198 + _474;
    float _478 = fma(_280, _464, _454);
    float _480 = fma(_280, _468, _456);
    float _482 = fma(_280, _472, _458);
    float _484 = fma(_280, _476, _460);
    out.m_40.x = _478;
    out.m_40.y = _480;
    out.m_40.z = _482;
    out.m_40.w = _484;
    return out;
}

