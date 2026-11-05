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
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _201 = float2(_57, _59);
    float _61 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_201, float2(0.0), isnan(_201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_201, float2(0.0), isnan(_201))).x;
    float _63 = -_61;
    float _65 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _67 = 1.0 / _65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _71 = precise::clamp(_69, 0.0, 1.0);
    float _73 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = precise::max(_71, _75);
    float _79 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    bool _89 = _77 != 0.0;
    bool _91 = isnan(_77);
    bool _93 = _89 || _91;
    bool _95 = isnan(0.0);
    bool _97 = _93 || _95;
    float _99 = precise::min(_81, _85);
    bool _101 = !_97;
    if (!_101)
    {
        float _103 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _105 = fma(_77, _103, 1.0);
        float _107 = log2(_105);
        float _109 = _107 + (-1.0);
        float2 _293 = float2(_57, _59);
        float3 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_293, float2(0.0), isnan(_293)), level(_109)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_293, float2(0.0), isnan(_293)), level(_109)).xyz;
        float _115 = _113.x;
        float _117 = _113.y;
        float _119 = _113.z;
        float _121 = _99 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _123 = 0.0 + _107;
        float _125 = precise::clamp(_123, 0.0, 1.0);
        float _127 = _117 * 0.586600005626678466796875;
        float _129 = fma(_115, 0.29890000820159912109375, _127);
        float _131 = fma(_119, 0.1143999993801116943359375, _129);
        float _133 = -_115;
        float _135 = _133 + _131;
        float _137 = -_117;
        float _139 = _137 + _131;
        float _141 = -_119;
        float _143 = _141 + _131;
        float _145 = fma(_121, _135, _115);
        float _147 = fma(_121, _139, _117);
        float _149 = fma(_121, _143, _119);
        float _151 = -_145;
        float _153 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _151);
        float _155 = -_147;
        float _157 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _155);
        float _159 = -_149;
        float _161 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _159);
        float _163 = fma(_99, _153, _145);
        float _165 = fma(_99, _157, _147);
        float _167 = fma(_99, _161, _149);
        out.m_34.x = _163;
        out.m_34.y = _165;
        out.m_34.z = _167;
        out.m_34.w = _125;
        return out;
    }
    discard_fragment();
    return out;
}

