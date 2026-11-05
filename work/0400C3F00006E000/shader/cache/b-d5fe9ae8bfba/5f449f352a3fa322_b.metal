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
    float2 _512 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_512, float2(0.0), isnan(_512))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_512, float2(0.0), isnan(_512))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_37.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_37.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.w;
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
    float2 _604 = float2(_129, _131);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_604, float2(0.0), isnan(_604))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_604, float2(0.0), isnan(_604))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _618 = float2(_129, _131);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_618, float2(0.0), isnan(_618)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_618, float2(0.0), isnan(_618)), int2(1, 0)).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _634 = float2(_129, _131);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_634, float2(0.0), isnan(_634)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_634, float2(0.0), isnan(_634)), int2(0, 1)).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float _159 = -_67;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _163 = _159 + _161;
    float _165 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _167 = _127 * _165;
    float _169 = _123 * _165;
    float _171 = fma(_121, _163, _167);
    float _173 = _125 * _165;
    float _175 = fma(_117, _163, _169);
    float _177 = 1.0 / _171;
    float2 _685 = float2(_129, _131);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_685, float2(0.0), isnan(_685)), int2(1)).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float _187 = fma(_119, _163, _173);
    float _189 = _175 * _177;
    float _191 = _187 * _177;
    float2 _710 = float2(_63, _65);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float2 _726 = float2(_189, _191);
    float4 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_726, float2(0.0), isnan(_726))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_726, float2(0.0), isnan(_726))).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    float _214 = _147 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _216 = _139 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _218 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[2].x, _214);
    float _220 = _155 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _222 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[2].x, _216);
    float _224 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[2].x, _220);
    float _226 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[2].z, _218);
    float _228 = -_65;
    float _230 = _228 + _191;
    float _232 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[2].z, _224);
    float _234 = -_63;
    float _236 = _234 + _189;
    float _238 = _230 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _240 = _236 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _242 = _183 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _244 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[2].z, _222);
    float _246 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[2].x, _242);
    float _248 = precise::max(_244, _232);
    float _250 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[2].z, _246);
    float _252 = precise::min(_244, _232);
    float _254 = precise::min(_226, _250);
    float _256 = precise::max(_226, _250);
    float _258 = precise::min(_252, _254);
    float _260 = _198 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _262 = precise::max(_248, _256);
    float _264 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[2].x, _260);
    float _266 = _238 * _238;
    float _268 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[2].z, _264);
    float _270 = fma(_240, _240, _266);
    float _272 = precise::min(_268, _258);
    float _274 = precise::max(_268, _262);
    float _276 = _262 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _278 = sqrt(_270);
    float _280 = -_272;
    float _282 = _280 + _274;
    float _284 = precise::max(_276, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _288 = _282 > _284;
    float _290 = 0.0 + _278;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = fma(_292, -0.5, 0.5);
    float _296 = _252;
    float _298 = 0.5;
    float _300 = _240;
    float _302 = _196;
    if (!_288)
    {
        _296 = _198;
    }
    float _304 = _296;
    float _306 = _304;
    if (!_288)
    {
        _298 = _200;
    }
    float _308 = _298;
    float _310 = _308;
    if (!_288)
    {
        _300 = _202;
    }
    float _312 = _300;
    bool _314 = !_288;
    float _316 = _312;
    if (!_314)
    {
        float _318 = _244 + _226;
        float _320 = -_226;
        float _322 = _320 + _232;
        float _324 = -_244;
        float _326 = _324 + _250;
        float _328 = _232 + _318;
        float _330 = _322 + _326;
        float _332 = -_326;
        float _334 = _322 + _332;
        float _336 = _250 + _328;
        float _338 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _340 = abs(_330);
        float _342 = abs(_334);
        float _344 = precise::min(_340, _342);
        float _346 = fma(_336, _338, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _348 = precise::max(_346, _344);
        float _350 = 1.0 / _348;
        float _352 = _330 * _350;
        float _354 = _334 * _350;
        float _356 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _358 = precise::max(_352, _356);
        float _360 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _362 = precise::max(_354, _360);
        float _364 = precise::min(_358, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _366 = precise::min(_362, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _368 = -_364;
        float _370 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _372 = fma(_364, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _374 = -_366;
        float _376 = fma(_374, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _378 = fma(_366, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _1016 = float2(_370, _376);
        float4 _380 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1016, float2(0.0), isnan(_1016))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1016, float2(0.0), isnan(_1016))).xyzw;
        float _382 = _380.x;
        float _384 = _380.y;
        float _386 = _380.z;
        float _388 = _380.w;
        float2 _1032 = float2(_372, _378);
        float4 _390 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1032, float2(0.0), isnan(_1032))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1032, float2(0.0), isnan(_1032))).xyzw;
        float _392 = _390.x;
        float _394 = _390.y;
        float _396 = _390.z;
        float _398 = _390.w;
        float _400 = -_382;
        float _402 = _400 + _392;
        float _404 = -_386;
        float _406 = _404 + _396;
        float _408 = -_384;
        float _410 = _408 + _394;
        float _412 = -_388;
        float _414 = _412 + _398;
        float _416 = fma(_402, 0.5, _382);
        float _418 = fma(_406, 0.5, _386);
        float _420 = fma(_410, 0.5, _384);
        float _422 = fma(_414, 0.5, _388);
        float _424 = -_416;
        float _426 = _196 + _424;
        float _428 = -_418;
        float _430 = _200 + _428;
        float _432 = -_420;
        float _434 = _198 + _432;
        float _436 = -_422;
        float _438 = _202 + _436;
        float _440 = fma(_426, 0.3499999940395355224609375, _416);
        float _442 = fma(_430, 0.3499999940395355224609375, _418);
        float _444 = fma(_434, 0.3499999940395355224609375, _420);
        float _446 = fma(_438, 0.3499999940395355224609375, _422);
        _302 = _440;
        _306 = _444;
        _310 = _442;
        _316 = _446;
    }
    float _448 = _302;
    float _450 = _306;
    float _452 = _310;
    float _454 = _316;
    float _456 = -_448;
    float _458 = _206 + _456;
    float _460 = -_450;
    float _462 = _208 + _460;
    float _464 = -_452;
    float _466 = _210 + _464;
    float _468 = -_454;
    float _470 = _212 + _468;
    float _472 = fma(_294, _458, _448);
    float _474 = fma(_294, _462, _450);
    float _476 = fma(_294, _466, _452);
    float _478 = fma(_294, _470, _454);
    out.m_40.x = _472;
    out.m_40.y = _474;
    out.m_40.z = _476;
    out.m_40.w = _478;
    return out;
}

