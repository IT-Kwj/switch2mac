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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = 1.0 / _39;
    float _55 = _53 * _45;
    float _57 = _53 * _51;
    float2 _212 = float2(_55, _57);
    float3 _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_212, float2(0.0), isnan(_212)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_212, float2(0.0), isnan(_212)), int2(1, 0)).xyz;
    float _63 = _61.x;
    float _65 = _61.y;
    float _67 = _61.z;
    float2 _231 = float2(_55, _57);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231)), int2(0, 1)).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float2 _246 = float2(_55, _57);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_246, float2(0.0), isnan(_246)), int2(0, -1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_246, float2(0.0), isnan(_246)), int2(0, -1)).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _262 = float2(_55, _57);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262)), int2(-1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_262, float2(0.0), isnan(_262)), int2(-1, 0)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _277 = float2(_55, _57);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_277, float2(0.0), isnan(_277))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float _101 = _65 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _103 = _73 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _105 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _107 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _109 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[2].x, _101);
    float _111 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[2].x, _103);
    float _113 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _105);
    float _115 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _107);
    float _117 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[2].z, _109);
    float _119 = fma(_75, (*spvDescriptorSet0.fp_c3)._m0[2].z, _111);
    float _121 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _113);
    float _125 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _115);
    float _127 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _129 = precise::max(_117, _119);
    float _131 = precise::max(_123, _125);
    float _133 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _135 = precise::min(_117, _119);
    float _137 = precise::min(_123, _125);
    float _139 = precise::max(_131, _129);
    float _141 = precise::min(_137, _135);
    float _143 = precise::max(_133, _139);
    float _145 = precise::min(_133, _141);
    float _147 = _143 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _149 = -_145;
    float _151 = _143 + _149;
    float _153 = precise::max(_147, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _157 = _151 >= _153;
    bool _159 = isnan(_151);
    bool _161 = _157 || _159;
    bool _163 = isnan(_153);
    bool _165 = _161 || _163;
    bool _167 = !_165;
    if (!_167)
    {
        float2 _419 = float2(_55, _57);
        float4 _170 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_419, float2(0.0), isnan(_419))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_419, float2(0.0), isnan(_419))).xyzw;
        float _172 = _170.x;
        float _174 = _170.y;
        float _176 = _170.z;
        float _178 = _170.w;
        out.m_32.x = _172;
        out.m_32.y = _174;
        out.m_32.z = _176;
        out.m_32.w = _178;
        return out;
    }
    out.m_32.x = 0.0;
    out.m_32.y = 0.0;
    out.m_32.z = 0.0;
    out.m_32.w = 0.0;
    return out;
}

