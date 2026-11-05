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
    texture2d<float> fp_t_tcb_C [[id(1)]];
    sampler fp_t_tcb_CSmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_CSmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _238 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_238, float2(0.0), isnan(_238))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_238, float2(0.0), isnan(_238))).x;
    float _67 = in.m_33.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = fma(_61, (*spvDescriptorSet0.fp_c3)._m0[8].z, -0.5);
    float _75 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[8].w, -0.5);
    float _77 = floor(_73);
    float _79 = floor(_75);
    float _81 = _59 * _71;
    float _83 = _77 + 0.5;
    float _85 = _79 + 0.5;
    float _87 = _83 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _89 = _85 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _91 = precise::max(0.0, _65);
    float _93 = precise::max(_91, _81);
    float _95 = fma(_93, 2.0, _93);
    float _97 = -_93;
    bool _101 = _95 != _97;
    bool _103 = isnan(_95);
    bool _105 = _101 || _103;
    bool _107 = isnan(_97);
    bool _109 = _105 || _107;
    if (!_109)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        out.m_38.x = 0.0;
        return out;
    }
    float _111 = _89 + (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _113 = _87 + (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float2 _331 = float2(_113, _111);
    float4 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_331, float2(0.0), isnan(_331))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_331, float2(0.0), isnan(_331))).xyzw;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _116.z;
    float _124 = _116.w;
    float2 _347 = float2(_87, _111);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _363 = float2(_113, _89);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_363, float2(0.0), isnan(_363))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_363, float2(0.0), isnan(_363))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float2 _379 = float2(_87, _89);
    float4 _146 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_379, float2(0.0), isnan(_379))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_379, float2(0.0), isnan(_379))).xyzw;
    float _148 = _146.x;
    float _150 = _146.y;
    float _152 = _146.z;
    float _154 = _146.w;
    float _156 = _93 + _95;
    float _158 = -_93;
    bool _160 = _95 > _158;
    float _162 = 1.0 / _156;
    float _164 = _93 * _124;
    float _166 = _93 * _118;
    float _168 = _93 * _120;
    float _170 = _93 * _122;
    float _172 = fma(_93, _134, _164);
    float _174 = fma(_93, _128, _166);
    float _176 = fma(_93, _130, _168);
    float _178 = fma(_93, _132, _170);
    float _180 = fma(_93, _144, _172);
    float _182 = _160 ? _162 : 1.0;
    float _184 = fma(_93, _138, _174);
    float _186 = fma(_93, _140, _176);
    float _188 = fma(_93, _142, _178);
    float _190 = fma(_93, _154, _180);
    float _192 = fma(_93, _148, _184);
    float _194 = fma(_93, _150, _186);
    float _196 = fma(_93, _152, _188);
    float _198 = _190 * _182;
    float _200 = _192 * _182;
    float _202 = _194 * _182;
    float _204 = _196 * _182;
    out.m_36.x = _200;
    out.m_36.y = _202;
    out.m_36.z = _204;
    out.m_36.w = _198;
    out.m_38.x = _198;
    return out;
}

