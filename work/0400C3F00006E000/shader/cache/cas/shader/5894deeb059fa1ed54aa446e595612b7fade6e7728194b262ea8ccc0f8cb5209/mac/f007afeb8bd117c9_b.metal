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
    float2 _227 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_227, float2(0.0), isnan(_227))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_227, float2(0.0), isnan(_227))).x;
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
    float _101 = _57 * _85;
    float _103 = _57 * _91;
    bool _105 = _99 != 0.0;
    bool _107 = isnan(_99);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    float _115 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = precise::min(_117, _121);
    bool _125 = !_113;
    if (!_125)
    {
        float _127 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _129 = fma(_99, _127, 1.0);
        float _131 = log2(_129);
        float _133 = _131 + (-1.0);
        float2 _356 = float2(_59, _61);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_356, float2(0.0), isnan(_356)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_356, float2(0.0), isnan(_356)), level(_133)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        float _145 = _123 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _147 = _141 * 0.586600005626678466796875;
        float _149 = fma(_139, 0.29890000820159912109375, _147);
        float _151 = fma(_143, 0.1143999993801116943359375, _149);
        float _153 = -_139;
        float _155 = _153 + _151;
        float _157 = -_141;
        float _159 = _157 + _151;
        float _161 = -_143;
        float _163 = _161 + _151;
        float _165 = 0.0 + _131;
        float _167 = precise::clamp(_165, 0.0, 1.0);
        float _169 = fma(_145, _155, _139);
        float _171 = fma(_145, _159, _141);
        float _173 = fma(_145, _163, _143);
        float _175 = fma(_103, _167, _101);
        float _177 = -_169;
        float _179 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[13].x, _177);
        float _181 = -_171;
        float _183 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[13].y, _181);
        float _185 = -_173;
        float _187 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].z, _185);
        float _189 = fma(_123, _179, _169);
        float _191 = fma(_123, _183, _171);
        float _193 = fma(_123, _187, _173);
        out.m_34.x = _189;
        out.m_34.y = _191;
        out.m_34.z = _193;
        out.m_34.w = _175;
        return out;
    }
    discard_fragment();
    return out;
}

