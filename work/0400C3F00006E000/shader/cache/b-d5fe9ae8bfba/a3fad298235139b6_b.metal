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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
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
    float2 _231 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_231, float2(0.0), isnan(_231))).x;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_33.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = _57 * _69;
    float _85 = _57 * _75;
    float _87 = _57 * _81;
    float _89 = -_63;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _93 = 1.0 / _91;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = precise::max(_97, _101);
    float _105 = precise::max(_103, _87);
    bool _109 = _105 != 0.0;
    bool _111 = isnan(_105);
    bool _113 = _109 || _111;
    bool _115 = isnan(0.0);
    bool _117 = _113 || _115;
    float _119 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = precise::min(_121, _125);
    bool _129 = !_117;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_105, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float2 _356 = float2(_59, _61);
        float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_356, float2(0.0), isnan(_356)), level(_137)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_356, float2(0.0), isnan(_356)), level(_137)).xyz;
        float _143 = _141.x;
        float _145 = _141.y;
        float _147 = _141.z;
        float _149 = _127 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _151 = _145 * 0.586600005626678466796875;
        float _153 = fma(_143, 0.29890000820159912109375, _151);
        float _155 = fma(_147, 0.1143999993801116943359375, _153);
        float _157 = -_143;
        float _159 = _157 + _155;
        float _161 = -_145;
        float _163 = _161 + _155;
        float _165 = -_147;
        float _167 = _165 + _155;
        float _169 = 0.0 + _135;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        float _173 = fma(_149, _159, _143);
        float _175 = fma(_149, _163, _145);
        float _177 = fma(_149, _167, _147);
        float _179 = fma(_85, _171, _83);
        float _181 = -_173;
        float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].x, _181);
        float _185 = -_175;
        float _187 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[13].y, _185);
        float _189 = -_177;
        float _191 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[13].z, _189);
        float _193 = fma(_127, _183, _173);
        float _195 = fma(_127, _187, _175);
        float _197 = fma(_127, _191, _177);
        out.m_36.x = _193;
        out.m_36.y = _195;
        out.m_36.z = _197;
        out.m_36.w = _179;
        return out;
    }
    discard_fragment();
    return out;
}

