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
    float4 m_38 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _205 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_205, float2(0.0), isnan(_205))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_205, float2(0.0), isnan(_205))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_69)
    {
        discard_fragment();
    }
    float2 _225 = float2(_61, _63);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_225, float2(0.0), isnan(_225))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_225, float2(0.0), isnan(_225))).x;
    float _73 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    if (_69)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _77 = in.m_38.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_38.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_38.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = precise::max(_71, _75);
    float _97 = _59 * _81;
    float _99 = _59 * _87;
    float _101 = _59 * _93;
    float _103 = precise::max(_95, _97);
    bool _105 = _103 != 0.0;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan(0.0);
    bool _113 = _109 || _111;
    bool _115 = !_113;
    if (!_115)
    {
        float _117 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _119 = fma(_103, _117, 1.0);
        float _121 = log2(_119);
        float _123 = _121 + (-1.0);
        float2 _315 = float2(_61, _63);
        float3 _127 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_315, float2(0.0), isnan(_315)), level(_123)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_315, float2(0.0), isnan(_315)), level(_123)).xyz;
        float _129 = _127.x;
        float _131 = _127.y;
        float _133 = _127.z;
        float _135 = 0.0 + _121;
        float _137 = precise::clamp(_135, 0.0, 1.0);
        float _139 = fma(_101, _137, _99);
        float _141 = 1.0 / _139;
        float _143 = _137 * _129;
        float _145 = _137 * _131;
        float _147 = _137 * _133;
        float _149 = -_143;
        float _151 = _149 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _153 = -_145;
        float _155 = _153 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _157 = -_147;
        float _159 = _157 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _161 = fma(_99, _151, _143);
        float _163 = fma(_99, _155, _145);
        float _165 = fma(_99, _159, _147);
        float _167 = _161 * _141;
        float _169 = _163 * _141;
        float _171 = _165 * _141;
        out.m_36.x = _167;
        out.m_36.y = _169;
        out.m_36.z = _171;
        out.m_36.w = _139;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _99;
    return out;
}

