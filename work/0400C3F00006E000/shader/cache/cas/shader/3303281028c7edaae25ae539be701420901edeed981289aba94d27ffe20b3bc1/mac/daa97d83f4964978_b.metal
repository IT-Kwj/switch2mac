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
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _215 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_215, float2(0.0), isnan(_215))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_215, float2(0.0), isnan(_215))).x;
    float _65 = -_63;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _69 = 1.0 / _67;
    bool _73 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_73)
    {
        discard_fragment();
    }
    if (_73)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _75 = in.m_36.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.x;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_36.y;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    float _97 = _57 * _79;
    float _99 = precise::max(_95, _97);
    bool _101 = _99 != 0.0;
    bool _103 = isnan(_99);
    bool _105 = _101 || _103;
    bool _107 = isnan(0.0);
    bool _109 = _105 || _107;
    float _111 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _57 * _85;
    float _121 = _57 * _91;
    float _123 = precise::min(_113, _117);
    bool _125 = !_109;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_99, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float2 _344 = float2(_59, _61);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_344, float2(0.0), isnan(_344)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_344, float2(0.0), isnan(_344)), level(_133)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float _145 = 0.0 + _131;
        float _147 = precise::clamp(_145, 0.0, 1.0);
        float _149 = fma(_121, _147, _119);
        float _151 = _147 * _121;
        float _153 = 1.0 / _149;
        float _155 = -_143;
        float _157 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _155);
        float _159 = -_141;
        float _161 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].y, _159);
        float _163 = -_139;
        float _165 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].x, _163);
        float _167 = fma(_123, _157, _143);
        float _169 = _153 * _151;
        float _171 = fma(_123, _161, _141);
        float _173 = fma(_123, _165, _139);
        float _175 = _167 * _151;
        float _177 = _171 * _169;
        float _179 = _173 * _169;
        float _181 = _175 * _153;
        out.m_34.x = _179;
        out.m_34.y = _177;
        out.m_34.z = _181;
        out.m_34.w = _149;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _119;
    return out;
}

