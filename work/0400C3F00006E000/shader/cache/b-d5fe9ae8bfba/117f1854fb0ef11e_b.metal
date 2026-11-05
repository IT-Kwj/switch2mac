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
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _201 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_201, float2(0.0), isnan(_201))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_201, float2(0.0), isnan(_201))).x;
    float2 _212 = float2(_59, _61);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_212, float2(0.0), isnan(_212))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_212, float2(0.0), isnan(_212))).x;
    float _67 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _69 = precise::clamp(_67, 0.0, 1.0);
    bool _73 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    bool _75 = !_73;
    float _77 = _75 ? _69 : 0.0;
    float _79 = precise::max(_65, _77);
    bool _81 = _79 != 0.0;
    bool _83 = isnan(_79);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _93 = precise::clamp(_91, 0.0, 1.0);
    float _95 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _97 = precise::clamp(_95, 0.0, 1.0);
    float _99 = precise::min(_93, _97);
    bool _101 = !_89;
    if (!_101)
    {
        float _103 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _105 = fma(_79, _103, 1.0);
        float _107 = log2(_105);
        float _109 = _107 + (-1.0);
        float2 _291 = float2(_59, _61);
        float3 _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_291, float2(0.0), isnan(_291)), level(_109)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_291, float2(0.0), isnan(_291)), level(_109)).xyz;
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
        out.m_36.x = _163;
        out.m_36.y = _165;
        out.m_36.z = _167;
        out.m_36.w = _125;
        return out;
    }
    discard_fragment();
    return out;
}

