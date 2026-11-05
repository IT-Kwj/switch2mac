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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_23 [[user(locn0)]];
    float4 m_27 [[user(locn1)]];
    float4 m_29 [[user(locn2)]];
    float4 m_25 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_23.y;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_25.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_23.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_25.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_23.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_23.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_27.x;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_27.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_27.z;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_27.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_29.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_29.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_29.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_29.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = 1.0 / _39;
    float _127 = _125 * _45;
    float _129 = _125 * _51;
    float _131 = _125 * _57;
    float _133 = _125 * _63;
    float _135 = _125 * _69;
    float _137 = _125 * _75;
    float _139 = _125 * _81;
    float _141 = _125 * _87;
    float _143 = _125 * _93;
    float _145 = _125 * _99;
    float _147 = _125 * _105;
    float _149 = _125 * _111;
    float _151 = _125 * _117;
    float _153 = _125 * _123;
    float2 _341 = float2(_131, _127);
    float _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_341, float2(0.0), isnan(_341))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_341, float2(0.0), isnan(_341))).x;
    float2 _353 = float2(_129, _133);
    float2 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_353, float2(0.0), isnan(_353))).xy;
    float _161 = _159.x;
    float _163 = _159.y;
    float2 _365 = float2(_135, _137);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_365, float2(0.0), isnan(_365))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_365, float2(0.0), isnan(_365))).x;
    float2 _373 = float2(_139, _141);
    float _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_373, float2(0.0), isnan(_373))).x;
    float2 _381 = float2(_143, _145);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_381, float2(0.0), isnan(_381))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_381, float2(0.0), isnan(_381))).x;
    float2 _389 = float2(_147, _149);
    float _171 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_389, float2(0.0), isnan(_389))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_389, float2(0.0), isnan(_389))).x;
    float2 _397 = float2(_151, _153);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_397, float2(0.0), isnan(_397))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_397, float2(0.0), isnan(_397))).x;
    float _175 = _161 + _155;
    float _177 = _165 + _175;
    float _179 = _167 + _177;
    float _181 = _169 + _179;
    float _183 = _171 + _181;
    float _185 = _173 + _183;
    float _187 = _185 * 0.14285714924335479736328125;
    out.m_32.x = _187;
    out.m_32.y = _163;
    return out;
}

