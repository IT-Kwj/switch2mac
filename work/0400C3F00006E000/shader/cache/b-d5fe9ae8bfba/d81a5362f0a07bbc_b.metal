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
    float2 _239 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_239, float2(0.0), isnan(_239))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_239, float2(0.0), isnan(_239))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _271 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_271, float2(0.0), isnan(_271))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_271, float2(0.0), isnan(_271))).x;
    if (_75)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _79 = in.m_38.z;
    float _81 = gl_FragCoord.w;
    float _83 = _79 * _81;
    float _85 = in.m_38.x;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_38.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    float _105 = precise::max(_77, _99);
    float _107 = _59 * _83;
    float _109 = precise::max(_105, _107);
    bool _111 = _109 != 0.0;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan(0.0);
    bool _119 = _115 || _117;
    float _121 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _59 * _89;
    float _127 = _59 * _95;
    float _129 = precise::min(_123, _103);
    bool _131 = !_119;
    if (!_131)
    {
        float _133 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _135 = fma(_109, _133, 1.0);
        float _137 = log2(_135);
        float _139 = _137 + (-1.0);
        float2 _379 = float2(_61, _63);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_379, float2(0.0), isnan(_379)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_379, float2(0.0), isnan(_379)), level(_139)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = 0.0 + _137;
        float _153 = precise::clamp(_151, 0.0, 1.0);
        float _155 = fma(_127, _153, _125);
        float _157 = 1.0 / _155;
        float _159 = -_145;
        float _161 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _159);
        float _163 = -_147;
        float _165 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _163);
        float _167 = -_149;
        float _169 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _167);
        float _171 = fma(_129, _161, _145);
        float _173 = fma(_129, _165, _147);
        float _175 = fma(_129, _169, _149);
        float _177 = _153 * _171;
        float _179 = _153 * _173;
        float _181 = _153 * _175;
        float _183 = -_177;
        float _185 = _183 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _187 = -_179;
        float _189 = _187 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _191 = -_181;
        float _193 = _191 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _195 = fma(_125, _185, _177);
        float _197 = fma(_125, _189, _179);
        float _199 = fma(_125, _193, _181);
        float _201 = _195 * _157;
        float _203 = _197 * _157;
        float _205 = _199 * _157;
        out.m_36.x = _201;
        out.m_36.y = _203;
        out.m_36.z = _205;
        out.m_36.w = _155;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _125;
    return out;
}

