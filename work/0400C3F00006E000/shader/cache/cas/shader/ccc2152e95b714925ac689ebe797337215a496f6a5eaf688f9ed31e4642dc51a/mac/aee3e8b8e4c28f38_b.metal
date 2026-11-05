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
    float2 _202 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_202, float2(0.0), isnan(_202))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_202, float2(0.0), isnan(_202))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    bool _79 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_79)
    {
        discard_fragment();
    }
    if (_79)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _81 = _57 * _69;
    float _83 = _57 * _75;
    float _85 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    bool _97 = _87 != 0.0;
    bool _99 = isnan(_87);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    bool _107 = !_105;
    if (!_107)
    {
        float2 _293 = float2(_81, _83);
        float2 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_293, float2(0.0), isnan(_293))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_293, float2(0.0), isnan(_293))).xy;
        float _113 = _111.x;
        float _115 = _111.y;
        float _117 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _119 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _121 = fma(_87, _117, 1.0);
        float _123 = log2(_121);
        float _125 = _113 + (-0.5);
        float _127 = _115 + (-0.5);
        float _129 = _125 * _119;
        float _131 = _127 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _133 = fma(_87, _129, _59);
        float _135 = precise::clamp(_133, 0.0, 1.0);
        float _137 = fma(_87, _131, _61);
        float _139 = precise::clamp(_137, 0.0, 1.0);
        float2 _343 = float2(_135, _139);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_343, float2(0.0), isnan(_343)), bias(_123)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_343, float2(0.0), isnan(_343)), bias(_123)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = precise::min(_91, _95);
        float _153 = -_147;
        float _155 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _153);
        float _157 = -_145;
        float _159 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _157);
        float _161 = -_149;
        float _163 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _161);
        float _165 = fma(_151, _155, _147);
        float _167 = fma(_151, _159, _145);
        float _169 = fma(_151, _163, _149);
        out.m_36.x = _167;
        out.m_36.y = _165;
        out.m_36.z = _169;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

