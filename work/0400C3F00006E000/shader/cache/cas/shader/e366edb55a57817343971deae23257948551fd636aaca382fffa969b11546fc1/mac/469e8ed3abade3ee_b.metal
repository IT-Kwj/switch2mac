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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
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
    float2 _245 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_245, float2(0.0), isnan(_245))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_245, float2(0.0), isnan(_245))).x;
    float2 _256 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float _69 = in.m_35.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _59 * _73;
    float _89 = _59 * _79;
    float _91 = _59 * _85;
    float _93 = -_65;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _97 = 1.0 / _95;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _101 = precise::clamp(_99, 0.0, 1.0);
    float _103 = precise::max(_67, _101);
    float _105 = precise::max(_103, _91);
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _109 = precise::clamp(_107, 0.0, 1.0);
    bool _113 = _105 != 0.0;
    bool _115 = isnan(_105);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = precise::min(_109, _125);
    bool _129 = !_121;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_105, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float2 _370 = float2(_61, _63);
        float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_370, float2(0.0), isnan(_370)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_370, float2(0.0), isnan(_370)), level(_137)).xyz;
        float _143 = _141.x;
        float _145 = _141.y;
        float _147 = _141.z;
        float _149 = 0.0 + _135;
        float _151 = precise::clamp(_149, 0.0, 1.0);
        float _153 = fma(_89, _151, _87);
        float _155 = _151 * _89;
        float _157 = _127 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _159 = 1.0 / _153;
        float _161 = _145 * 0.586600005626678466796875;
        float _163 = fma(_143, 0.29890000820159912109375, _161);
        float _165 = fma(_147, 0.1143999993801116943359375, _163);
        float _167 = -_147;
        float _169 = _167 + _165;
        float _171 = -_143;
        float _173 = _171 + _165;
        float _175 = -_145;
        float _177 = _175 + _165;
        float _179 = fma(_157, _169, _147);
        float _181 = fma(_157, _173, _143);
        float _183 = fma(_157, _177, _145);
        float _185 = -_179;
        float _187 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[13].z, _185);
        float _189 = -_181;
        float _191 = fma(_181, (*spvDescriptorSet0.fp_c3)._m0[13].x, _189);
        float _193 = -_183;
        float _195 = fma(_183, (*spvDescriptorSet0.fp_c3)._m0[13].y, _193);
        float _197 = fma(_127, _187, _179);
        float _199 = fma(_127, _191, _181);
        float _201 = _159 * _155;
        float _203 = fma(_127, _195, _183);
        float _205 = _197 * _155;
        float _207 = _199 * _201;
        float _209 = _203 * _201;
        float _211 = _205 * _159;
        out.m_38.x = _207;
        out.m_38.y = _209;
        out.m_38.z = _211;
        out.m_38.w = _153;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _87;
    return out;
}

