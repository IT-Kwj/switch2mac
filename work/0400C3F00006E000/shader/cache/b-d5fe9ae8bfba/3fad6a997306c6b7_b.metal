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
    float2 _226 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_226, float2(0.0), isnan(_226))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_226, float2(0.0), isnan(_226))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _83 = precise::clamp(_81, 0.0, 1.0);
    bool _87 = _83 != 0.0;
    bool _89 = isnan(_83);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _99 = precise::clamp(_97, 0.0, 1.0);
    float _101 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _103 = precise::clamp(_101, 0.0, 1.0);
    bool _105 = !_95;
    if (!_105)
    {
        float2 _302 = float2(_77, _79);
        float2 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_302, float2(0.0), isnan(_302))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_302, float2(0.0), isnan(_302))).xy;
        float _111 = _109.x;
        float _113 = _109.y;
        float _115 = (*spvDescriptorSet0.fp_c3)._m0[0].y + (-1.0);
        float _117 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[1].z;
        float _119 = fma(_83, _115, 1.0);
        float _121 = log2(_119);
        float _123 = _111 + (-0.5);
        float _125 = _113 + (-0.5);
        float _127 = _123 * _117;
        float _129 = _125 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
        float _131 = fma(_83, _127, _59);
        float _133 = precise::clamp(_131, 0.0, 1.0);
        float _135 = fma(_83, _129, _61);
        float _137 = precise::clamp(_135, 0.0, 1.0);
        float2 _352 = float2(_133, _137);
        float3 _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_352, float2(0.0), isnan(_352)), bias(_121)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_352, float2(0.0), isnan(_352)), bias(_121)).xyz;
        float _143 = _141.x;
        float _145 = _141.y;
        float _147 = _141.z;
        float _149 = precise::min(_99, _103);
        float _151 = _149 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _153 = _145 * 0.586600005626678466796875;
        float _155 = fma(_143, 0.29890000820159912109375, _153);
        float _157 = fma(_147, 0.1143999993801116943359375, _155);
        float _159 = -_143;
        float _161 = _159 + _157;
        float _163 = -_145;
        float _165 = _163 + _157;
        float _167 = -_147;
        float _169 = _167 + _157;
        float _171 = fma(_151, _161, _143);
        float _173 = fma(_151, _165, _145);
        float _175 = fma(_151, _169, _147);
        float _177 = -_171;
        float _179 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[13].x, _177);
        float _181 = -_173;
        float _183 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].y, _181);
        float _185 = -_175;
        float _187 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[13].z, _185);
        float _189 = fma(_149, _179, _171);
        float _191 = fma(_149, _183, _173);
        float _193 = fma(_149, _187, _175);
        out.m_36.x = _189;
        out.m_36.y = _191;
        out.m_36.z = _193;
        out.m_36.w = 1.0;
        return out;
    }
    discard_fragment();
    return out;
}

