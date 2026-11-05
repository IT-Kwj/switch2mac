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
    float2 _248 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = precise::max(_75, _71);
    bool _81 = _77 != 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _71;
    float _93 = _77;
    float _95 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_89)
    {
        _91 = 1.0;
    }
    float _97 = _91;
    float _99 = _97;
    if (_89)
    {
        float _101 = -_97;
        float _103 = _101 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _99 = _103;
    }
    float _105 = _99;
    float _107 = _105;
    if (_89)
    {
        float _109 = fma(_77, _105, 1.0);
        _93 = _109;
    }
    float _111 = _93;
    float _113 = _111;
    if (_89)
    {
        float _115 = log2(_111);
        _113 = _115;
    }
    float _117 = _113;
    float _119 = _117;
    if (_89)
    {
        float _121 = _117 + (-1.0);
        _95 = _121;
    }
    float _123 = _95;
    int _126 = as_type<int>(_59);
    int _128 = as_type<int>(_61);
    float _130 = _123;
    if (_89)
    {
        float2 _349 = float2(_59, _61);
        float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_349, float2(0.0), isnan(_349)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_349, float2(0.0), isnan(_349)), level(_123)).xyz;
        float _136 = _134.x;
        float _138 = _134.y;
        float _140 = _134.z;
        _126 = as_type<int>(_136);
        _128 = as_type<int>(_138);
        _130 = _140;
    }
    int _142 = _126;
    int _144 = _128;
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
    if (_89)
    {
        float _166 = 0.0 + _117;
        float _168 = precise::clamp(_166, 0.0, 1.0);
        _164 = _168;
    }
    float _170 = _164;
    float _172 = _170;
    if (_89)
    {
        float _174 = fma(_162, _170, _160);
        _107 = _174;
    }
    float _176 = _107;
    if (_89)
    {
        float _178 = _170 * _162;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (_89)
    {
        float _186 = 1.0 / _176;
        _182 = _186;
    }
    float _188 = _182;
    int _190 = _142;
    int _192 = _144;
    if (_89)
    {
        float _194 = _146 * _180;
        _119 = _194;
    }
    float _196 = _119;
    int _198 = as_type<int>(_196);
    if (_89)
    {
        float _200 = _188 * _180;
        _184 = _200;
    }
    float _202 = _184;
    if (_89)
    {
        float _204 = _196 * _188;
        _198 = as_type<int>(_204);
    }
    int _206 = _198;
    if (_89)
    {
        float _208 = as_type<float>(_142) * _202;
        _190 = as_type<int>(_208);
    }
    int _210 = _190;
    if (_89)
    {
        float _212 = as_type<float>(_144) * _202;
        _192 = as_type<int>(_212);
    }
    int _214 = _192;
    if (_89)
    {
        out.m_36.x = as_type<float>(_210);
        out.m_36.y = as_type<float>(_214);
        out.m_36.z = as_type<float>(_206);
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
    float2 _248 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_248, float2(0.0), isnan(_248))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_248, float2(0.0), isnan(_248))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = precise::max(_75, _71);
    bool _81 = _77 != 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _71;
    float _93 = _77;
    float _95 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_89)
    {
        _91 = 1.0;
    }
    float _97 = _91;
    float _99 = _97;
    if (_89)
    {
        float _101 = -_97;
        float _103 = _101 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _99 = _103;
    }
    float _105 = _99;
    float _107 = _105;
    if (_89)
    {
        float _109 = fma(_77, _105, 1.0);
        _93 = _109;
    }
    float _111 = _93;
    float _113 = _111;
    if (_89)
    {
        float _115 = log2(_111);
        _113 = _115;
    }
    float _117 = _113;
    float _119 = _117;
    if (_89)
    {
        float _121 = _117 + (-1.0);
        _95 = _121;
    }
    float _123 = _95;
    int _126 = as_type<int>(_59);
    int _128 = as_type<int>(_61);
    float _130 = _123;
    if (_89)
    {
        float2 _349 = float2(_59, _61);
        float3 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_349, float2(0.0), isnan(_349)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_349, float2(0.0), isnan(_349)), level(_123)).xyz;
        float _136 = _134.x;
        float _138 = _134.y;
        float _140 = _134.z;
        _126 = as_type<int>(_136);
        _128 = as_type<int>(_138);
        _130 = _140;
    }
    int _142 = _126;
    int _144 = _128;
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
    if (_89)
    {
        float _166 = 0.0 + _117;
        float _168 = precise::clamp(_166, 0.0, 1.0);
        _164 = _168;
    }
    float _170 = _164;
    float _172 = _170;
    if (_89)
    {
        float _174 = fma(_162, _170, _160);
        _107 = _174;
    }
    float _176 = _107;
    if (_89)
    {
        float _178 = _170 * _162;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = 0.0;
    float _184 = _180;
    if (_89)
    {
        float _186 = 1.0 / _176;
        _182 = _186;
    }
    float _188 = _182;
    int _190 = _142;
    int _192 = _144;
    if (_89)
    {
        float _194 = _146 * _180;
        _119 = _194;
    }
    float _196 = _119;
    int _198 = as_type<int>(_196);
    if (_89)
    {
        float _200 = _188 * _180;
        _184 = _200;
    }
    float _202 = _184;
    if (_89)
    {
        float _204 = _196 * _188;
        _198 = as_type<int>(_204);
    }
    int _206 = _198;
    if (_89)
    {
        float _208 = as_type<float>(_142) * _202;
        _190 = as_type<int>(_208);
    }
    int _210 = _190;
    if (_89)
    {
        float _212 = as_type<float>(_144) * _202;
        _192 = as_type<int>(_212);
    }
    int _214 = _192;
    if (_89)
    {
        out.m_36.x = as_type<float>(_210);
        out.m_36.y = as_type<float>(_214);
        out.m_36.z = as_type<float>(_206);
        out.m_36.w = _176;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _160;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

