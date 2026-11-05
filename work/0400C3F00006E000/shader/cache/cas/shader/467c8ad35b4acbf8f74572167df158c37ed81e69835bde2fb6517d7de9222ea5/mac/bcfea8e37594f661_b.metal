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
    float2 _199 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_199, float2(0.0), isnan(_199))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_199, float2(0.0), isnan(_199))).x;
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
    bool _109 = !_107;
    if (!_109)
    {
        float _111 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _113 = fma(_97, _111, 1.0);
        float _115 = log2(_113);
        float _117 = _115 + (-1.0);
        float2 _298 = float2(_59, _61);
        float3 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_298, float2(0.0), isnan(_298)), level(_117)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_298, float2(0.0), isnan(_298)), level(_117)).xyz;
        float _123 = _121.x;
        float _125 = _121.y;
        float _127 = _121.z;
        float _129 = 0.0 + _115;
        float _131 = precise::clamp(_129, 0.0, 1.0);
        float _133 = fma(_95, _131, _93);
        float _135 = 1.0 / _133;
        float _137 = _131 * _123;
        float _139 = _131 * _125;
        float _141 = _131 * _127;
        float _143 = -_137;
        float _145 = _143 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _147 = -_139;
        float _149 = _147 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _151 = -_141;
        float _153 = _151 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _155 = fma(_93, _145, _137);
        float _157 = fma(_93, _149, _139);
        float _159 = fma(_93, _153, _141);
        float _161 = _155 * _135;
        float _163 = _157 * _135;
        float _165 = _159 * _135;
        out.m_34.x = _161;
        out.m_34.y = _163;
        out.m_34.z = _165;
        out.m_34.w = _133;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _93;
    return out;
}

