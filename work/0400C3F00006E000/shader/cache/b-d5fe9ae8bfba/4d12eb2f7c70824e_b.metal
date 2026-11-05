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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_30 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_25 [[user(locn1)]];
    float4 m_27 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _37 = gl_FragCoord.w;
    float _39 = in.m_23.x;
    float _41 = gl_FragCoord.w;
    float _43 = _39 * _41;
    float _45 = in.m_23.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_23.z;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_23.w;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_25.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_25.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_25.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_25.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_27.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = in.m_27.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_27.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_27.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = 1.0 / _37;
    float _113 = _111 * _43;
    float _115 = _111 * _49;
    float _117 = _111 * _55;
    float _119 = _111 * _61;
    float _121 = _111 * _67;
    float _123 = _111 * _73;
    float _125 = _111 * _79;
    float2 _341 = float2(_113, _115);
    float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).xyz;
    float _131 = _129.x;
    float _133 = _129.y;
    float _135 = _129.z;
    float _137 = _111 * _85;
    float2 _362 = float2(_117, _119);
    float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).xyz;
    float _141 = _139.x;
    float _143 = _139.y;
    float _145 = _139.z;
    float _147 = _111 * _91;
    float2 _379 = float2(_121, _123);
    float3 _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).xyz;
    float _151 = _149.x;
    float _153 = _149.y;
    float _155 = _149.z;
    float _157 = _111 * _97;
    float _159 = _111 * _103;
    float2 _399 = float2(_125, _137);
    float3 _161 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_399, float2(0.0), isnan(_399))).xyz;
    float _163 = _161.x;
    float _165 = _161.y;
    float _167 = _161.z;
    float _169 = _111 * _109;
    float2 _416 = float2(_147, _157);
    float3 _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_416, float2(0.0), isnan(_416))).xyz;
    float _173 = _171.x;
    float _175 = _171.y;
    float _177 = _171.z;
    float2 _430 = float2(_159, _169);
    float3 _179 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).xyz;
    float _181 = _179.x;
    float _183 = _179.y;
    float _185 = _179.z;
    float _187 = _131 + _141;
    float _189 = _133 + _143;
    float _191 = _135 + _145;
    float _193 = _187 * 0.16666667163372039794921875;
    float _195 = _189 * 0.16666667163372039794921875;
    float _197 = _191 * 0.16666667163372039794921875;
    float _199 = fma(_151, 0.16666667163372039794921875, _193);
    float _201 = fma(_153, 0.16666667163372039794921875, _195);
    float _203 = fma(_155, 0.16666667163372039794921875, _197);
    float _205 = fma(_163, 0.16666667163372039794921875, _199);
    float _207 = fma(_165, 0.16666667163372039794921875, _201);
    float _209 = fma(_167, 0.16666667163372039794921875, _203);
    float _211 = fma(_173, 0.16666667163372039794921875, _205);
    float _213 = fma(_175, 0.16666667163372039794921875, _207);
    float _215 = fma(_177, 0.16666667163372039794921875, _209);
    float _217 = fma(_181, 0.16666667163372039794921875, _211);
    float _219 = fma(_183, 0.16666667163372039794921875, _213);
    float _221 = fma(_185, 0.16666667163372039794921875, _215);
    out.m_30.x = _217;
    out.m_30.y = _219;
    out.m_30.z = _221;
    out.m_30.w = 1.0;
    return out;
}

