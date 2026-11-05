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
    float2 _247 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_247, float2(0.0), isnan(_247))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_247, float2(0.0), isnan(_247))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_75)
    {
        discard_fragment();
    }
    float2 _279 = float2(_61, _63);
    float _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_279, float2(0.0), isnan(_279))).x;
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
    float _101 = precise::max(_77, _99);
    float _103 = _59 * _83;
    float _105 = precise::max(_101, _103);
    bool _107 = _105 != 0.0;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan(0.0);
    bool _115 = _111 || _113;
    float _117 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _59 * _89;
    float _127 = _59 * _95;
    float _129 = precise::min(_119, _123);
    bool _131 = !_115;
    if (!_131)
    {
        float _133 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _135 = fma(_105, _133, 1.0);
        float _137 = log2(_135);
        float _139 = _137 + (-1.0);
        float2 _387 = float2(_61, _63);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_387, float2(0.0), isnan(_387)), level(_139)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_387, float2(0.0), isnan(_387)), level(_139)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = 0.0 + _137;
        float _153 = precise::clamp(_151, 0.0, 1.0);
        float _155 = fma(_127, _153, _125);
        float _157 = _153 * _127;
        float _159 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _161 = 1.0 / _155;
        float _163 = _147 * 0.586600005626678466796875;
        float _165 = fma(_145, 0.29890000820159912109375, _163);
        float _167 = fma(_149, 0.1143999993801116943359375, _165);
        float _169 = -_149;
        float _171 = _169 + _167;
        float _173 = -_145;
        float _175 = _173 + _167;
        float _177 = -_147;
        float _179 = _177 + _167;
        float _181 = fma(_159, _171, _149);
        float _183 = fma(_159, _175, _145);
        float _185 = fma(_159, _179, _147);
        float _187 = _161 * _157;
        float _189 = -_181;
        float _191 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[13].z, _189);
        float _193 = -_183;
        float _195 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[13].x, _193);
        float _197 = -_185;
        float _199 = fma(_185, (*spvDescriptorSet0.fp_c3)._m0[13].y, _197);
        float _201 = fma(_129, _191, _181);
        float _203 = fma(_129, _195, _183);
        float _205 = fma(_129, _199, _185);
        float _207 = _201 * _157;
        float _209 = _203 * _187;
        float _211 = _205 * _187;
        float _213 = _207 * _161;
        out.m_36.x = _209;
        out.m_36.y = _211;
        out.m_36.z = _213;
        out.m_36.w = _155;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _125;
    return out;
}

