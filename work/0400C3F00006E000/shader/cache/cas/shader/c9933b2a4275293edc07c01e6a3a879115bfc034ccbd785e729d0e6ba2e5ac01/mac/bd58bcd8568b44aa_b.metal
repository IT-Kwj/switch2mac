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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _41;
    float _51 = _49 * _47;
    bool _55 = _51 != 0.0;
    bool _57 = isnan(_51);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    bool _65 = !_63;
    if (!_65)
    {
        float _67 = in.m_31.x;
        float _69 = gl_FragCoord.w;
        float _71 = _67 * _69;
        float _73 = in.m_31.y;
        float _75 = gl_FragCoord.w;
        float _77 = _73 * _75;
        float _79 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _81 = fma(_51, _79, 1.0);
        float _83 = log2(_81);
        float _85 = _83 + (-1.0);
        float _87 = exp2(_85);
        float _89 = _49 * _71;
        float _91 = _49 * _77;
        float _93 = _87 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[8].x, _89);
        float _97 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[8].y, _91);
        float _99 = -_93;
        float _101 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[8].x, _89);
        float _103 = -_93;
        float _105 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[8].y, _91);
        float _107 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[8].z, _89);
        float _109 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[8].w, _91);
        float _111 = -_93;
        float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[8].z, _89);
        float2 _320 = float2(_95, _97);
        float3 _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_320, float2(0.0), isnan(_320)), level(_85)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_320, float2(0.0), isnan(_320)), level(_85)).xyz;
        float _119 = _117.x;
        float _121 = _117.y;
        float _123 = _117.z;
        float _125 = -_93;
        float _127 = fma(_125, (*spvDescriptorSet0.fp_c3)._m0[8].w, _91);
        float2 _344 = float2(_101, _105);
        float3 _129 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344)), level(_85)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344)), level(_85)).xyz;
        float _131 = _129.x;
        float _133 = _129.y;
        float _135 = _129.z;
        float2 _359 = float2(_107, _109);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359)), level(_85)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359)), level(_85)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float2 _374 = float2(_113, _127);
        float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374)), level(_85)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374)), level(_85)).xyz;
        float _147 = _145.x;
        float _149 = _145.y;
        float _151 = _145.z;
        float _153 = in.m_29.x;
        float _155 = gl_FragCoord.w;
        float _157 = _153 * _155;
        float _159 = in.m_29.y;
        float _161 = gl_FragCoord.w;
        float _163 = _159 * _161;
        float _165 = 0.0 + _83;
        float _167 = precise::clamp(_165, 0.0, 1.0);
        float _169 = _49 * _157;
        float _171 = _49 * _163;
        float _173 = fma(_171, _167, _169);
        float _175 = _121 + _133;
        float _177 = _119 + _131;
        float _179 = _123 + _135;
        float _181 = _175 + _141;
        float _183 = _177 + _139;
        float _185 = _179 + _143;
        float _187 = _181 + _149;
        float _189 = _183 + _147;
        float _191 = _185 + _151;
        float _193 = _187 * 0.25;
        float _195 = _189 * 0.25;
        float _197 = _191 * 0.25;
        out.m_34.x = _195;
        out.m_34.y = _193;
        out.m_34.z = _197;
        out.m_34.w = _173;
        return out;
    }
    discard_fragment();
    return out;
}

