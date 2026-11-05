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
    float _49 = in.m_29.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    bool _63 = _57 != 0.0;
    bool _65 = isnan(_57);
    bool _67 = _63 || _65;
    bool _69 = isnan(0.0);
    bool _71 = _67 || _69;
    bool _73 = !_71;
    if (!_73)
    {
        float _75 = in.m_31.x;
        float _77 = gl_FragCoord.w;
        float _79 = _75 * _77;
        float _81 = in.m_31.y;
        float _83 = gl_FragCoord.w;
        float _85 = _81 * _83;
        float _87 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _89 = fma(_57, _87, 1.0);
        float _91 = log2(_89);
        float _93 = _91 + (-1.0);
        float _95 = _55 * _79;
        float _97 = _55 * _85;
        float _99 = exp2(_93);
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
        float _103 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].x, _95);
        float _105 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].y, _97);
        float _107 = -_101;
        float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[8].x, _95);
        float _111 = -_101;
        float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[8].y, _97);
        float _115 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].z, _95);
        float _117 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[8].w, _97);
        float _119 = -_101;
        float _121 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[8].z, _95);
        float2 _346 = float2(_103, _105);
        float3 _125 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346)), level(_93)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346)), level(_93)).xyz;
        float _127 = _125.x;
        float _129 = _125.y;
        float _131 = _125.z;
        float _133 = -_101;
        float _135 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[8].w, _97);
        float2 _370 = float2(_109, _113);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_370, float2(0.0), isnan(_370)), level(_93)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_370, float2(0.0), isnan(_370)), level(_93)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float2 _385 = float2(_115, _117);
        float3 _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_385, float2(0.0), isnan(_385)), level(_93)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_385, float2(0.0), isnan(_385)), level(_93)).xyz;
        float _147 = _145.x;
        float _149 = _145.y;
        float _151 = _145.z;
        float2 _400 = float2(_121, _135);
        float3 _153 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_400, float2(0.0), isnan(_400)), level(_93)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_400, float2(0.0), isnan(_400)), level(_93)).xyz;
        float _155 = _153.x;
        float _157 = _153.y;
        float _159 = _153.z;
        float _161 = in.m_29.y;
        float _163 = gl_FragCoord.w;
        float _165 = _161 * _163;
        float _167 = _55 * _165;
        float _169 = 0.0 + _91;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        float _173 = fma(_167, _171, _59);
        float _175 = 1.0 / _173;
        float _177 = _127 + _139;
        float _179 = _129 + _141;
        float _181 = _131 + _143;
        float _183 = _167 * _175;
        float _185 = _177 + _147;
        float _187 = _179 + _149;
        float _189 = _181 + _151;
        float _191 = _185 + _155;
        float _193 = _187 + _157;
        float _195 = _189 + _159;
        float _197 = _171 * _191;
        float _199 = _197 * 0.25;
        float _201 = _171 * _193;
        float _203 = _201 * 0.25;
        float _205 = _171 * _195;
        float _207 = _205 * 0.25;
        float _209 = _199 * _183;
        float _211 = _203 * _183;
        float _213 = _207 * _183;
        out.m_34.x = _209;
        out.m_34.y = _211;
        out.m_34.z = _213;
        out.m_34.w = _173;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _59;
    return out;
}

