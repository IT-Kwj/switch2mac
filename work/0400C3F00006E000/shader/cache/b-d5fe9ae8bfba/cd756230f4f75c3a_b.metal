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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_27 [[user(locn0), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _37 = in.m_27.y;
    float _39 = in.m_27.x;
    float _41 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _43 = _37 + _41;
    float _45 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _47 = _39 + _45;
    float _49 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _51 = fma(2.0, _49, _43);
    float _53 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _55 = fma(2.0, _53, _47);
    float _57 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[1].x, _47);
    float _59 = fma((*spvDescriptorSet0.fp_c3)._m0[1].x, 4.0, _47);
    float2 _337 = float2(_55, _51);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_337, float2(0.0), isnan(_337))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_337, float2(0.0), isnan(_337))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _355 = float2(_47, _51);
    float3 _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_355, float2(0.0), isnan(_355))).xyz;
    float _73 = _71.x;
    float _75 = _71.y;
    float _77 = _71.z;
    float2 _369 = float2(_57, _51);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _383 = float2(_59, _51);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_383, float2(0.0), isnan(_383))).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _397 = float2(_55, _43);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _411 = float2(_47, _43);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float _111 = _65 + _73;
    float _113 = _67 + _75;
    float _115 = fma(2.0, (*spvDescriptorSet0.fp_c3)._m0[1].y, _43);
    float _117 = _69 + _77;
    float _119 = _111 + _81;
    float _121 = _113 + _83;
    float _123 = _117 + _85;
    float _125 = _119 + _89;
    float _127 = _121 + _91;
    float _129 = fma((*spvDescriptorSet0.fp_c3)._m0[1].y, 4.0, _43);
    float _131 = _125 + _97;
    float _133 = _127 + _99;
    float _135 = _123 + _93;
    float _137 = _131 + _105;
    float2 _469 = float2(_57, _43);
    float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_469, float2(0.0), isnan(_469))).xyz;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float2 _483 = float2(_59, _43);
    float3 _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).xyz;
    float _149 = _147.x;
    float _151 = _147.y;
    float _153 = _147.z;
    float2 _497 = float2(_55, _115);
    float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_497, float2(0.0), isnan(_497))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_497, float2(0.0), isnan(_497))).xyz;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float2 _511 = float2(_47, _115);
    float3 _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_511, float2(0.0), isnan(_511))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_511, float2(0.0), isnan(_511))).xyz;
    float _165 = _163.x;
    float _167 = _163.y;
    float _169 = _163.z;
    float2 _525 = float2(_57, _115);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_525, float2(0.0), isnan(_525))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _539 = float2(_59, _115);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_539, float2(0.0), isnan(_539))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_539, float2(0.0), isnan(_539))).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float _187 = _135 + _101;
    float2 _556 = float2(_55, _129);
    float3 _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_556, float2(0.0), isnan(_556))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_556, float2(0.0), isnan(_556))).xyz;
    float _191 = _189.x;
    float _193 = _189.y;
    float _195 = _189.z;
    float2 _570 = float2(_47, _129);
    float3 _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_570, float2(0.0), isnan(_570))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_570, float2(0.0), isnan(_570))).xyz;
    float _199 = _197.x;
    float _201 = _197.y;
    float _203 = _197.z;
    float2 _584 = float2(_57, _129);
    float3 _205 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_584, float2(0.0), isnan(_584))).xyz;
    float _207 = _205.x;
    float _209 = _205.y;
    float _211 = _205.z;
    float2 _598 = float2(_59, _129);
    float3 _213 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_598, float2(0.0), isnan(_598))).xyz;
    float _215 = _213.x;
    float _217 = _213.y;
    float _219 = _213.z;
    float _221 = _133 + _107;
    float _223 = _187 + _109;
    float _225 = _137 + _141;
    float _227 = _221 + _143;
    float _229 = _223 + _145;
    float _231 = _225 + _149;
    float _233 = _227 + _151;
    float _235 = _229 + _153;
    float _237 = _231 + _157;
    float _239 = _233 + _159;
    float _241 = _235 + _161;
    float _243 = _237 + _165;
    float _245 = _239 + _167;
    float _247 = _241 + _169;
    float _249 = _243 + _173;
    float _251 = _245 + _175;
    float _253 = _247 + _177;
    float _255 = _249 + _181;
    float _257 = _251 + _183;
    float _259 = _253 + _185;
    float _261 = _255 + _191;
    float _263 = _257 + _193;
    float _265 = _259 + _195;
    float _267 = _261 + _199;
    float _269 = _263 + _201;
    float _271 = _265 + _203;
    float _273 = _267 + _207;
    float _275 = _269 + _209;
    float _277 = _271 + _211;
    float _279 = _273 + _215;
    float _281 = _275 + _217;
    float _283 = _277 + _219;
    float _285 = _279 * 0.0625;
    float _287 = _281 * 0.0625;
    float _289 = _283 * 0.0625;
    out.m_30.x = _285;
    out.m_30.y = _287;
    out.m_30.z = _289;
    return out;
}

