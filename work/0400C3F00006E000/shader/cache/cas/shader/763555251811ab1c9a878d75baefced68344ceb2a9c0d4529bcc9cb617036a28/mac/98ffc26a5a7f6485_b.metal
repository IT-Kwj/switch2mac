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
    float2 _256 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    bool _81 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _83 = _71;
    if (_81)
    {
        discard_fragment();
    }
    float _85 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = precise::max(_87, _71);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = _89;
    if (_99)
    {
        _83 = 1.0;
    }
    float _103 = _83;
    float _105 = _103;
    if (_99)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _111;
    if (_99)
    {
        float _115 = fma(_89, _111, 1.0);
        _101 = _115;
    }
    float _117 = _101;
    if (_81)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _119 = _117;
    if (_99)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = 0.0;
    if (_99)
    {
        float _127 = _123 + (-1.0);
        _125 = _127;
    }
    float _129 = _125;
    int _132 = as_type<int>(_129);
    int _134 = 0;
    float _136 = _61;
    if (_99)
    {
        float2 _378 = float2(_59, _61);
        float3 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_378, float2(0.0), isnan(_378)), level(_129)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_378, float2(0.0), isnan(_378)), level(_129)).xyz;
        float _142 = _140.x;
        float _144 = _140.y;
        float _146 = _140.z;
        _132 = as_type<int>(_142);
        _134 = as_type<int>(_144);
        _136 = _146;
    }
    int _148 = _132;
    int _150 = _134;
    float _152 = _136;
    float _154 = in.m_33.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_33.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    if (_99)
    {
        float _166 = 0.0 + _123;
        float _168 = precise::clamp(_166, 0.0, 1.0);
        _113 = _168;
    }
    float _170 = _113;
    float _172 = _57 * _158;
    float _174 = _57 * _164;
    float _176 = 0.0;
    float _178 = _170;
    float _180 = _164;
    if (_99)
    {
        float _182 = fma(_174, _170, _172);
        _176 = _182;
    }
    float _184 = _176;
    if (_99)
    {
        float _186 = _170 * _174;
        _178 = _186;
    }
    float _188 = _178;
    float _190 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _192 = _188;
    if (_99)
    {
        float _194 = 1.0 / _184;
        _190 = _194;
    }
    float _196 = _190;
    int _198 = _148;
    int _200 = _150;
    if (_99)
    {
        float _202 = _152 * _188;
        _180 = _202;
    }
    float _204 = _180;
    int _206 = as_type<int>(_204);
    if (_99)
    {
        float _208 = _196 * _188;
        _192 = _208;
    }
    float _210 = _192;
    if (_99)
    {
        float _212 = _204 * _196;
        _206 = as_type<int>(_212);
    }
    int _214 = _206;
    if (_99)
    {
        float _216 = as_type<float>(_148) * _210;
        _198 = as_type<int>(_216);
    }
    int _218 = _198;
    if (_99)
    {
        float _220 = as_type<float>(_150) * _210;
        _200 = as_type<int>(_220);
    }
    int _222 = _200;
    if (_99)
    {
        out.m_36.x = as_type<float>(_218);
        out.m_36.y = as_type<float>(_222);
        out.m_36.z = as_type<float>(_214);
        out.m_36.w = _184;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _172;
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
    float2 _256 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    bool _81 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _83 = _71;
    if (_81)
    {
        discard_fragment();
    }
    float _85 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _87 = precise::clamp(_85, 0.0, 1.0);
    float _89 = precise::max(_87, _71);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = _89;
    if (_99)
    {
        _83 = 1.0;
    }
    float _103 = _83;
    float _105 = _103;
    if (_99)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _111;
    if (_99)
    {
        float _115 = fma(_89, _111, 1.0);
        _101 = _115;
    }
    float _117 = _101;
    if (_81)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _119 = _117;
    if (_99)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = 0.0;
    if (_99)
    {
        float _127 = _123 + (-1.0);
        _125 = _127;
    }
    float _129 = _125;
    int _132 = as_type<int>(_129);
    int _134 = 0;
    float _136 = _61;
    if (_99)
    {
        float2 _378 = float2(_59, _61);
        float3 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_378, float2(0.0), isnan(_378)), level(_129)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_378, float2(0.0), isnan(_378)), level(_129)).xyz;
        float _142 = _140.x;
        float _144 = _140.y;
        float _146 = _140.z;
        _132 = as_type<int>(_142);
        _134 = as_type<int>(_144);
        _136 = _146;
    }
    int _148 = _132;
    int _150 = _134;
    float _152 = _136;
    float _154 = in.m_33.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_33.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    if (_99)
    {
        float _166 = 0.0 + _123;
        float _168 = precise::clamp(_166, 0.0, 1.0);
        _113 = _168;
    }
    float _170 = _113;
    float _172 = _57 * _158;
    float _174 = _57 * _164;
    float _176 = 0.0;
    float _178 = _170;
    float _180 = _164;
    if (_99)
    {
        float _182 = fma(_174, _170, _172);
        _176 = _182;
    }
    float _184 = _176;
    if (_99)
    {
        float _186 = _170 * _174;
        _178 = _186;
    }
    float _188 = _178;
    float _190 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _192 = _188;
    if (_99)
    {
        float _194 = 1.0 / _184;
        _190 = _194;
    }
    float _196 = _190;
    int _198 = _148;
    int _200 = _150;
    if (_99)
    {
        float _202 = _152 * _188;
        _180 = _202;
    }
    float _204 = _180;
    int _206 = as_type<int>(_204);
    if (_99)
    {
        float _208 = _196 * _188;
        _192 = _208;
    }
    float _210 = _192;
    if (_99)
    {
        float _212 = _204 * _196;
        _206 = as_type<int>(_212);
    }
    int _214 = _206;
    if (_99)
    {
        float _216 = as_type<float>(_148) * _210;
        _198 = as_type<int>(_216);
    }
    int _218 = _198;
    if (_99)
    {
        float _220 = as_type<float>(_150) * _210;
        _200 = as_type<int>(_220);
    }
    int _222 = _200;
    if (_99)
    {
        out.m_36.x = as_type<float>(_218);
        out.m_36.y = as_type<float>(_222);
        out.m_36.z = as_type<float>(_214);
        out.m_36.w = _184;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _172;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

