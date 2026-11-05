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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_29.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_29.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _61;
    float _69 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _71 = _63 * _55;
    float _73 = precise::max(0.0, _67);
    float _75 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _77 = floor(_69);
    float _79 = fma(_73, 2.0, _73);
    float _81 = -_73;
    bool _85 = _79 != _81;
    bool _87 = isnan(_79);
    bool _89 = _85 || _87;
    bool _91 = isnan(_81);
    bool _93 = _89 || _91;
    float _95 = floor(_75);
    float _97 = _77 + 0.5;
    float _99 = _97 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _101 = _95 + 0.5;
    float _103 = _101 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    if (!_93)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        out.m_36.x = 0.0;
        return out;
    }
    float _105 = _103 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _107 = _99 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _312 = float2(_107, _105);
    float4 _110 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_312, float2(0.0), isnan(_312))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_312, float2(0.0), isnan(_312))).xyzw;
    float _112 = _110.x;
    float _114 = _110.y;
    float _116 = _110.z;
    float _118 = _110.w;
    float2 _330 = float2(_99, _105);
    float4 _120 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_330, float2(0.0), isnan(_330))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_330, float2(0.0), isnan(_330))).xyzw;
    float _122 = _120.x;
    float _124 = _120.y;
    float _126 = _120.z;
    float _128 = _120.w;
    float2 _346 = float2(_107, _103);
    float4 _130 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).xyzw;
    float _132 = _130.x;
    float _134 = _130.y;
    float _136 = _130.z;
    float _138 = _130.w;
    float2 _362 = float2(_99, _103);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float _150 = _73 + _79;
    float _152 = -_73;
    bool _154 = _79 > _152;
    float _156 = 1.0 / _150;
    float _158 = _73 * _118;
    float _160 = _73 * _112;
    float _162 = _73 * _114;
    float _164 = _73 * _116;
    float _166 = fma(_73, _128, _158);
    float _168 = fma(_73, _122, _160);
    float _170 = fma(_73, _124, _162);
    float _172 = fma(_73, _126, _164);
    float _174 = fma(_73, _138, _166);
    float _176 = _154 ? _156 : 1.0;
    float _178 = fma(_73, _132, _168);
    float _180 = fma(_73, _134, _170);
    float _182 = fma(_73, _136, _172);
    float _184 = fma(_73, _148, _174);
    float _186 = fma(_73, _142, _178);
    float _188 = fma(_73, _144, _180);
    float _190 = fma(_73, _146, _182);
    float _192 = _184 * _176;
    float _194 = _186 * _176;
    float _196 = _188 * _176;
    float _198 = _190 * _176;
    out.m_34.x = _194;
    out.m_34.y = _196;
    out.m_34.z = _198;
    out.m_34.w = _192;
    out.m_36.x = _192;
    return out;
}

