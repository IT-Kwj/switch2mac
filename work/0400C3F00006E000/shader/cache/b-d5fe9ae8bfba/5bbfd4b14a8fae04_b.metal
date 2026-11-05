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
    float2 _235 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_235, float2(0.0), isnan(_235))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_235, float2(0.0), isnan(_235))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_36.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_36.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = _57 * _73;
    float _93 = _57 * _79;
    float _95 = _57 * _85;
    float _97 = precise::max(_89, _91);
    bool _99 = _97 != 0.0;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    float _109 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = precise::min(_111, _115);
    bool _119 = !_107;
    if (!_119)
    {
        float _121 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _123 = fma(_97, _121, 1.0);
        float _125 = log2(_123);
        float _127 = _125 + (-1.0);
        float2 _353 = float2(_59, _61);
        float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_353, float2(0.0), isnan(_353)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_353, float2(0.0), isnan(_353)), level(_127)).xyz;
        float _133 = _131.x;
        float _135 = _131.y;
        float _137 = _131.z;
        float _139 = 0.0 + _125;
        float _141 = precise::clamp(_139, 0.0, 1.0);
        float _143 = fma(_95, _141, _93);
        float _145 = _141 * _95;
        float _147 = _117 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _149 = 1.0 / _143;
        float _151 = _135 * 0.586600005626678466796875;
        float _153 = fma(_133, 0.29890000820159912109375, _151);
        float _155 = fma(_137, 0.1143999993801116943359375, _153);
        float _157 = -_137;
        float _159 = _157 + _155;
        float _161 = -_133;
        float _163 = _161 + _155;
        float _165 = -_135;
        float _167 = _165 + _155;
        float _169 = fma(_147, _159, _137);
        float _171 = fma(_147, _163, _133);
        float _173 = fma(_147, _167, _135);
        float _175 = _149 * _145;
        float _177 = -_169;
        float _179 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[13].z, _177);
        float _181 = -_171;
        float _183 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[13].x, _181);
        float _185 = -_173;
        float _187 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[13].y, _185);
        float _189 = fma(_117, _179, _169);
        float _191 = fma(_117, _183, _171);
        float _193 = fma(_117, _187, _173);
        float _195 = _189 * _145;
        float _197 = _191 * _175;
        float _199 = _193 * _175;
        float _201 = _195 * _149;
        out.m_34.x = _197;
        out.m_34.y = _199;
        out.m_34.z = _201;
        out.m_34.w = _143;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _93;
    return out;
}

