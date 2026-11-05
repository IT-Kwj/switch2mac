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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_CSmplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
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
    float2 _244 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_244, float2(0.0), isnan(_244))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = precise::max(_63, _71);
    bool _77 = _73 != 0.0;
    bool _79 = isnan(_73);
    bool _81 = _77 || _79;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    float _87 = _71;
    float _89 = _73;
    int _92 = as_type<int>(_59);
    int _94 = as_type<int>(_61);
    if (_85)
    {
        _87 = 1.0;
    }
    float _96 = _87;
    float _98 = _96;
    if (_85)
    {
        float _100 = -_96;
        float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _98 = _102;
    }
    float _104 = _98;
    float _106 = _104;
    if (_85)
    {
        float _108 = fma(_73, _104, 1.0);
        _89 = _108;
    }
    float _110 = _89;
    float _112 = _110;
    if (_85)
    {
        float _114 = log2(_110);
        _112 = _114;
    }
    float _116 = _112;
    float _118 = 0.0;
    float _120 = _116;
    if (_85)
    {
        float _122 = _116 + (-1.0);
        _118 = _122;
    }
    float _124 = _118;
    float _126 = _69;
    float _128 = 0.0;
    float _130 = _124;
    if (_85)
    {
        float2 _334 = float2(_59, _61);
        float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_334, float2(0.0), isnan(_334)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_334, float2(0.0), isnan(_334)), level(_124)).xyz;
        float _136 = _134.x;
        float _138 = _134.y;
        float _140 = _134.z;
        _126 = _136;
        _128 = _138;
        _130 = _140;
    }
    float _142 = _126;
    float _144 = _128;
    float _146 = _130;
    float _148 = in.m_33.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_33.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _57 * _152;
    float _162 = _57 * _158;
    float _164 = _158;
    if (_85)
    {
        float _166 = 0.0 + _116;
        float _168 = precise::clamp(_166, 0.0, 1.0);
        _164 = _168;
    }
    float _170 = _164;
    float _172 = _170;
    if (_85)
    {
        float _174 = fma(_162, _170, _160);
        _106 = _174;
    }
    float _176 = _106;
    if (_85)
    {
        float _178 = _170 * _162;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (_85)
    {
        float _186 = 1.0 / _176;
        _182 = _186;
    }
    float _188 = _182;
    if (_85)
    {
        float _190 = _146 * _180;
        _120 = _190;
    }
    float _192 = _120;
    int _194 = as_type<int>(_192);
    if (_85)
    {
        float _196 = _188 * _180;
        _184 = _196;
    }
    float _198 = _184;
    if (_85)
    {
        float _200 = _192 * _188;
        _194 = as_type<int>(_200);
    }
    int _202 = _194;
    if (_85)
    {
        float _204 = _142 * _198;
        _92 = as_type<int>(_204);
    }
    int _206 = _92;
    if (_85)
    {
        float _208 = _144 * _198;
        _94 = as_type<int>(_208);
    }
    int _210 = _94;
    if (_85)
    {
        out.m_36.x = as_type<float>(_206);
        out.m_36.y = as_type<float>(_210);
        out.m_36.z = as_type<float>(_202);
        out.m_36.w = _176;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _160;
    return out;
}


struct main0_out_u
{
    uint4 m_36 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _244 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_244, float2(0.0), isnan(_244))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_244, float2(0.0), isnan(_244))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = precise::max(_63, _71);
    bool _77 = _73 != 0.0;
    bool _79 = isnan(_73);
    bool _81 = _77 || _79;
    bool _83 = isnan(0.0);
    bool _85 = _81 || _83;
    float _87 = _71;
    float _89 = _73;
    int _92 = as_type<int>(_59);
    int _94 = as_type<int>(_61);
    if (_85)
    {
        _87 = 1.0;
    }
    float _96 = _87;
    float _98 = _96;
    if (_85)
    {
        float _100 = -_96;
        float _102 = _100 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _98 = _102;
    }
    float _104 = _98;
    float _106 = _104;
    if (_85)
    {
        float _108 = fma(_73, _104, 1.0);
        _89 = _108;
    }
    float _110 = _89;
    float _112 = _110;
    if (_85)
    {
        float _114 = log2(_110);
        _112 = _114;
    }
    float _116 = _112;
    float _118 = 0.0;
    float _120 = _116;
    if (_85)
    {
        float _122 = _116 + (-1.0);
        _118 = _122;
    }
    float _124 = _118;
    float _126 = _69;
    float _128 = 0.0;
    float _130 = _124;
    if (_85)
    {
        float2 _334 = float2(_59, _61);
        float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_334, float2(0.0), isnan(_334)), level(_124)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_334, float2(0.0), isnan(_334)), level(_124)).xyz;
        float _136 = _134.x;
        float _138 = _134.y;
        float _140 = _134.z;
        _126 = _136;
        _128 = _138;
        _130 = _140;
    }
    float _142 = _126;
    float _144 = _128;
    float _146 = _130;
    float _148 = in.m_33.x;
    float _150 = gl_FragCoord.w;
    float _152 = _148 * _150;
    float _154 = in.m_33.y;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = _57 * _152;
    float _162 = _57 * _158;
    float _164 = _158;
    if (_85)
    {
        float _166 = 0.0 + _116;
        float _168 = precise::clamp(_166, 0.0, 1.0);
        _164 = _168;
    }
    float _170 = _164;
    float _172 = _170;
    if (_85)
    {
        float _174 = fma(_162, _170, _160);
        _106 = _174;
    }
    float _176 = _106;
    if (_85)
    {
        float _178 = _170 * _162;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (_85)
    {
        float _186 = 1.0 / _176;
        _182 = _186;
    }
    float _188 = _182;
    if (_85)
    {
        float _190 = _146 * _180;
        _120 = _190;
    }
    float _192 = _120;
    int _194 = as_type<int>(_192);
    if (_85)
    {
        float _196 = _188 * _180;
        _184 = _196;
    }
    float _198 = _184;
    if (_85)
    {
        float _200 = _192 * _188;
        _194 = as_type<int>(_200);
    }
    int _202 = _194;
    if (_85)
    {
        float _204 = _142 * _198;
        _92 = as_type<int>(_204);
    }
    int _206 = _92;
    if (_85)
    {
        float _208 = _144 * _198;
        _94 = as_type<int>(_208);
    }
    int _210 = _94;
    if (_85)
    {
        out.m_36.x = as_type<float>(_206);
        out.m_36.y = as_type<float>(_210);
        out.m_36.z = as_type<float>(_202);
        out.m_36.w = _176;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _160;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

