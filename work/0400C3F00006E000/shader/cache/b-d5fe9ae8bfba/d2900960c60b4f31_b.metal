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
    float2 _263 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_263, float2(0.0), isnan(_263))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_263, float2(0.0), isnan(_263))).x;
    float2 _274 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_274, float2(0.0), isnan(_274))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_274, float2(0.0), isnan(_274))).x;
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
    float _105 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = precise::max(_103, _91);
    bool _113 = _109 != 0.0;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    float _123 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = precise::min(_125, _107);
    bool _129 = !_121;
    if (!_129)
    {
        float _131 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _133 = fma(_109, _131, 1.0);
        float _135 = log2(_133);
        float _137 = _135 + (-1.0);
        float2 _388 = float2(_61, _63);
        float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_388, float2(0.0), isnan(_388)), level(_137)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_388, float2(0.0), isnan(_388)), level(_137)).xyz;
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
        float _179 = fma(_89, _171, _87);
        float _181 = -_173;
        float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].x, _181);
        float _185 = -_175;
        float _187 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[13].y, _185);
        float _189 = -_177;
        float _191 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[13].z, _189);
        float _193 = 1.0 / _179;
        float _195 = fma(_127, _183, _173);
        float _197 = fma(_127, _187, _175);
        float _199 = fma(_127, _191, _177);
        float _201 = _171 * _195;
        float _203 = _171 * _197;
        float _205 = _171 * _199;
        float _207 = -_201;
        float _209 = _207 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _211 = -_203;
        float _213 = _211 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _215 = -_205;
        float _217 = _215 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _219 = fma(_87, _209, _201);
        float _221 = fma(_87, _213, _203);
        float _223 = fma(_87, _217, _205);
        float _225 = _219 * _193;
        float _227 = _221 * _193;
        float _229 = _223 * _193;
        out.m_38.x = _225;
        out.m_38.y = _227;
        out.m_38.z = _229;
        out.m_38.w = _179;
        return out;
    }
    out.m_38.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_38.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_38.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_38.w = _87;
    return out;
}

