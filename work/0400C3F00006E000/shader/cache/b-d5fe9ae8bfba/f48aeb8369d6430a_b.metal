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
    float2 _265 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
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
    float _97 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = precise::max(_95, _99);
    float _103 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = _57 * _79;
    float _109 = precise::max(_101, _107);
    float _111 = _57 * _91;
    bool _113 = _109 != 0.0;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan(0.0);
    bool _121 = _117 || _119;
    float _123 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _57 * _85;
    float _129 = precise::min(_125, _105);
    bool _131 = !_121;
    if (!_131)
    {
        float _133 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _135 = fma(_109, _133, 1.0);
        float _137 = log2(_135);
        float _139 = _137 + (-1.0);
        float2 _405 = float2(_59, _61);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_405, float2(0.0), isnan(_405)), level(_139)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_405, float2(0.0), isnan(_405)), level(_139)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        float _151 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _153 = _147 * 0.586600005626678466796875;
        float _155 = fma(_145, 0.29890000820159912109375, _153);
        float _157 = fma(_149, 0.1143999993801116943359375, _155);
        float _159 = -_145;
        float _161 = _159 + _157;
        float _163 = -_147;
        float _165 = _163 + _157;
        float _167 = -_149;
        float _169 = _167 + _157;
        float _171 = 0.0 + _137;
        float _173 = precise::clamp(_171, 0.0, 1.0);
        float _175 = fma(_151, _161, _145);
        float _177 = fma(_151, _165, _147);
        float _179 = fma(_151, _169, _149);
        float _181 = fma(_111, _173, _127);
        float _183 = -_175;
        float _185 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[13].x, _183);
        float _187 = -_177;
        float _189 = fma(_177, (*spvDescriptorSet0.fp_c3)._m0[13].y, _187);
        float _191 = -_179;
        float _193 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[13].z, _191);
        float _195 = 1.0 / _181;
        float _197 = fma(_129, _185, _175);
        float _199 = fma(_129, _189, _177);
        float _201 = fma(_129, _193, _179);
        float _203 = _173 * _197;
        float _205 = _173 * _199;
        float _207 = _173 * _201;
        float _209 = -_203;
        float _211 = _209 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _213 = -_205;
        float _215 = _213 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _217 = -_207;
        float _219 = _217 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _221 = fma(_127, _211, _203);
        float _223 = fma(_127, _215, _205);
        float _225 = fma(_127, _219, _207);
        float _227 = _221 * _195;
        float _229 = _223 * _195;
        float _231 = _225 * _195;
        out.m_34.x = _227;
        out.m_34.y = _229;
        out.m_34.z = _231;
        out.m_34.w = _181;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _127;
    return out;
}

