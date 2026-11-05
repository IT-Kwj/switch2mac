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
    float2 _484 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_484, float2(0.0), isnan(_484))).x;
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
    float _133 = -_67;
    float _135 = -(*spvDescriptorSet0.fp_c3)._m0[12].z;
    float _137 = _133 + _135;
    float _139 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[12].y, (*spvDescriptorSet0.fp_c3)._m0[12].w);
    float _141 = _127 * _139;
    float _143 = _123 * _139;
    float _145 = _125 * _139;
    float _147 = fma(_121, _137, _141);
    float _149 = fma(_117, _137, _143);
    float _151 = fma(_119, _137, _145);
    float _153 = 1.0 / _147;
    float2 _616 = float2(_129, _131);
    float3 _157 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_616, float2(0.0), isnan(_616))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_616, float2(0.0), isnan(_616))).xyz;
    float _159 = _157.x;
    float _161 = _157.y;
    float _163 = _157.z;
    float2 _630 = float2(_129, _131);
    float3 _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_630, float2(0.0), isnan(_630)), int2(1, 0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_630, float2(0.0), isnan(_630)), int2(1, 0)).xyz;
    float _167 = _165.x;
    float _169 = _165.y;
    float _171 = _165.z;
    float2 _646 = float2(_129, _131);
    float3 _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_646, float2(0.0), isnan(_646)), int2(0, 1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_646, float2(0.0), isnan(_646)), int2(0, 1)).xyz;
    float _175 = _173.x;
    float _177 = _173.y;
    float _179 = _173.z;
    float2 _661 = float2(_129, _131);
    float3 _181 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_661, float2(0.0), isnan(_661)), int2(1)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_661, float2(0.0), isnan(_661)), int2(1)).xyz;
    float _183 = _181.x;
    float _185 = _181.y;
    float _187 = _181.z;
    float _189 = _149 * _153;
    float _191 = _151 * _153;
    float2 _682 = float2(_63, _65);
    float4 _194 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_682, float2(0.0), isnan(_682))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_682, float2(0.0), isnan(_682))).xyzw;
    float _196 = _194.x;
    float _198 = _194.y;
    float _200 = _194.z;
    float _202 = _194.w;
    float2 _698 = float2(_189, _191);
    float4 _204 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_698, float2(0.0), isnan(_698))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_698, float2(0.0), isnan(_698))).xyzw;
    float _206 = _204.x;
    float _208 = _204.y;
    float _210 = _204.z;
    float _212 = _204.w;
    float _214 = -_65;
    float _216 = _214 + _191;
    float _218 = -_63;
    float _220 = _218 + _189;
    float _222 = _216 * (*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _224 = _220 * (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _226 = _222 * _222;
    float _228 = fma(_224, _224, _226);
    float _230 = sqrt(_228);
    float _232 = _161 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _234 = _169 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _236 = _177 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _238 = _185 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _240 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[2].x, _232);
    float _242 = fma(_167, (*spvDescriptorSet0.fp_c3)._m0[2].x, _234);
    float _244 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[2].x, _236);
    float _246 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[2].x, _238);
    float _248 = fma(_163, (*spvDescriptorSet0.fp_c3)._m0[2].z, _240);
    float _250 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[2].z, _242);
    float _252 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[2].z, _244);
    float _254 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[2].z, _246);
    float _256 = precise::min(_248, _252);
    float _258 = precise::min(_250, _254);
    float _260 = _198 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _262 = precise::max(_248, _252);
    float _264 = precise::max(_250, _254);
    float _266 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[2].x, _260);
    float _268 = precise::min(_256, _258);
    float _270 = precise::max(_262, _264);
    float _272 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[2].z, _266);
    float _274 = precise::min(_272, _268);
    float _276 = precise::max(_272, _270);
    float _278 = _270 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _280 = -_274;
    float _282 = _280 + _276;
    float _284 = precise::max(_278, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _288 = _282 > _284;
    float _290 = 0.0 + _230;
    float _292 = precise::clamp(_290, 0.0, 1.0);
    float _294 = fma(_292, -0.5, 0.5);
    float _296 = 0.5;
    float _298 = _282;
    float _300 = _196;
    float _302 = _200;
    if (!_288)
    {
        _296 = _196;
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
        _300 = _198;
    }
    float _312 = _300;
    float _314 = _312;
    if (!_288)
    {
        _302 = _202;
    }
    float _316 = _302;
    bool _318 = !_288;
    float _320 = _316;
    if (!_318)
    {
        float _322 = _248 + _250;
        float _324 = -_250;
        float _326 = _324 + _252;
        float _328 = -_248;
        float _330 = _328 + _254;
        float _332 = _252 + _322;
        float _334 = _326 + _330;
        float _336 = -_330;
        float _338 = _326 + _336;
        float _340 = _254 + _332;
        float _342 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _344 = abs(_334);
        float _346 = abs(_338);
        float _348 = precise::min(_344, _346);
        float _350 = fma(_340, _342, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _352 = precise::max(_350, _348);
        float _354 = 1.0 / _352;
        float _356 = _334 * _354;
        float _358 = _338 * _354;
        float _360 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _362 = precise::max(_356, _360);
        float _364 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _366 = precise::max(_358, _364);
        float _368 = precise::min(_362, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _370 = precise::min(_366, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _372 = -_368;
        float _374 = fma(_372, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _376 = fma(_368, (*spvDescriptorSet0.fp_c3)._m0[1].x, _63);
        float _378 = -_370;
        float _380 = fma(_378, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float _382 = fma(_370, (*spvDescriptorSet0.fp_c3)._m0[1].y, _65);
        float2 _995 = float2(_374, _380);
        float4 _384 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_995, float2(0.0), isnan(_995))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_995, float2(0.0), isnan(_995))).xyzw;
        float _386 = _384.x;
        float _388 = _384.y;
        float _390 = _384.z;
        float _392 = _384.w;
        float2 _1011 = float2(_376, _382);
        float4 _394 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1011, float2(0.0), isnan(_1011))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1011, float2(0.0), isnan(_1011))).xyzw;
        float _396 = _394.x;
        float _398 = _394.y;
        float _400 = _394.z;
        float _402 = _394.w;
        float _404 = _386 + _396;
        float _406 = _388 + _398;
        float _408 = _390 + _400;
        float _410 = _392 + _402;
        float _412 = _404 * 0.5;
        float _414 = _406 * 0.5;
        float _416 = _408 * 0.5;
        float _418 = _410 * 0.5;
        _306 = _412;
        _314 = _414;
        _310 = _416;
        _320 = _418;
    }
    float _420 = _306;
    float _422 = _314;
    float _424 = _310;
    float _426 = _320;
    float _428 = -_420;
    float _430 = _206 + _428;
    float _432 = -_422;
    float _434 = _208 + _432;
    float _436 = -_424;
    float _438 = _210 + _436;
    float _440 = -_426;
    float _442 = _212 + _440;
    float _444 = fma(_294, _430, _420);
    float _446 = fma(_294, _434, _422);
    float _448 = fma(_294, _438, _424);
    float _450 = fma(_294, _442, _426);
    out.m_40.x = _444;
    out.m_40.y = _446;
    out.m_40.z = _448;
    out.m_40.w = _450;
    return out;
}

