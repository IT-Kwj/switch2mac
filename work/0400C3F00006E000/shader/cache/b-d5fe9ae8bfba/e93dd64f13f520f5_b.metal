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
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
    float4 m_42 [[color(2)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_33.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_31.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_31.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_35.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_35.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_35.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_35.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _49;
    float _113 = _111 * _55;
    float _115 = _111 * _61;
    float _117 = _111 * _67;
    float _119 = _111 * _73;
    float _121 = _111 * _79;
    float _123 = _111 * _85;
    float _125 = _111 * _91;
    float _127 = _111 * _97;
    float _129 = _111 * _103;
    float _131 = _111 * _109;
    float2 _493 = float2(_113, _115);
    float3 _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_493, float2(0.0), isnan(_493))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_493, float2(0.0), isnan(_493))).xyz;
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float2 _511 = float2(_117, _119);
    float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).xyz;
    float _145 = _143.x;
    float _147 = _143.y;
    float _149 = _143.z;
    float2 _525 = float2(_121, _123);
    float3 _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_525, float2(0.0), isnan(_525))).xyz;
    float _153 = _151.x;
    float _155 = _151.y;
    float _157 = _151.z;
    float2 _539 = float2(_125, _127);
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float2 _553 = float2(_117, _119);
    float4 _168 = spvDescriptorSet0.fp_t_tcb_A.gather(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_553, float2(0.0), isnan(_553)), int2(0), component::x).xyzw;
    float _170 = _168.x;
    float _172 = _168.y;
    float _174 = _168.z;
    float _176 = _168.w;
    float2 _569 = float2(_129, _131);
    float3 _178 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).xyz;
    float _180 = _178.x;
    float _182 = _178.y;
    float _184 = _178.z;
    float _186 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _188 = _145 + _137;
    float _190 = _147 + _139;
    float _192 = _149 + _141;
    float _194 = _155 + _190;
    float _196 = _153 + _188;
    float _198 = -_172;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _202 = -_174;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _206 = _163 + _194;
    float _208 = -_170;
    float _210 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _212 = _161 + _196;
    float _214 = _200 * _186;
    float _216 = _210 * _186;
    float _218 = -_176;
    float _220 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[2].w, 1.0);
    float _222 = _180 + _212;
    float _224 = _204 * _186;
    float _226 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _228 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _230 = _220 * _186;
    float _232 = _157 + _192;
    float _234 = -_216;
    float _236 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[0].z, _226);
    float _238 = -_216;
    float _240 = -_226;
    float _242 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[0].z, _240);
    float _244 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _246 = -_214;
    float _248 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _228);
    float _250 = -_214;
    float _252 = -_228;
    float _254 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].z, _252);
    float _256 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[0].y, -1.0);
    float _258 = -_224;
    float _260 = fma(_258, (*spvDescriptorSet0.fp_c3)._m0[0].z, _244);
    float _262 = -_224;
    float _264 = -_244;
    float _266 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _264);
    float _268 = -_230;
    float _270 = fma(_268, (*spvDescriptorSet0.fp_c3)._m0[0].z, _256);
    float _272 = -_230;
    float _274 = -_256;
    float _276 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[0].z, _274);
    float _278 = precise::max(0.0, _236);
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[1].x * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _282 = precise::max(0.0, _248);
    float _284 = _165 + _232;
    float _286 = precise::max(0.0, _242);
    float _288 = _278 * _280;
    float _290 = precise::max(0.0, _254);
    float _292 = _282 * _280;
    float _294 = precise::max(0.0, _260);
    float _296 = _286 * _280;
    float _298 = precise::max(0.0, _266);
    float _300 = _290 * _280;
    float _302 = precise::max(0.0, _276);
    float _304 = _294 * _280;
    float _306 = precise::max(0.0, _270);
    float _308 = _298 * _280;
    float _310 = precise::max(_288, -0.00999999977648258209228515625);
    float _312 = _302 * _280;
    float _314 = precise::max(_292, -0.00999999977648258209228515625);
    float _316 = _306 * _280;
    float _318 = precise::max(_296, -0.00999999977648258209228515625);
    float _320 = _182 + _206;
    float _322 = precise::max(_300, -0.00999999977648258209228515625);
    float _324 = _184 + _284;
    float _326 = precise::min(_310, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _328 = _222 * 0.20000000298023223876953125;
    float _330 = precise::min(_314, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _332 = precise::min(_318, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _334 = precise::min(_322, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _336 = precise::max(_304, -0.00999999977648258209228515625);
    float _338 = precise::max(_308, -0.00999999977648258209228515625);
    float _340 = precise::max(_326, _330);
    float _342 = precise::min(_332, _334);
    float _344 = precise::max(_316, -0.00999999977648258209228515625);
    float _346 = precise::min(_336, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _348 = precise::min(_338, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _350 = precise::max(_312, -0.00999999977648258209228515625);
    float _352 = precise::max(_346, _340);
    float _354 = _324 * 0.20000000298023223876953125;
    float _356 = precise::min(_348, _342);
    float _358 = precise::min(_344, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _360 = precise::min(_350, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _362 = precise::max(_358, _352);
    float _364 = precise::min(_360, _356);
    float _366 = _320 * 0.20000000298023223876953125;
    float _368 = _366 * _364;
    float _370 = _366 * _362;
    float _372 = _328 * _364;
    float _374 = _354 * _364;
    float _376 = _328 * _362;
    float _378 = _354 * _362;
    out.m_38.x = _372;
    out.m_38.y = _368;
    out.m_38.z = _374;
    out.m_38.w = _364;
    out.m_40.x = _362;
    out.m_40.y = _364;
    out.m_42.x = _376;
    out.m_42.y = _370;
    out.m_42.z = _378;
    out.m_42.w = _362;
    return out;
}

