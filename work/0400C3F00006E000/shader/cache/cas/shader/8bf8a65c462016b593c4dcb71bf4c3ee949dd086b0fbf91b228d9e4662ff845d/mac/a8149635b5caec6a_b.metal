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
    float2 _262 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_262, float2(0.0), isnan(_262))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    bool _81 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_81)
    {
        discard_fragment();
    }
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = precise::max(_89, _85);
    float _93 = _85;
    if (_81)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _95 = precise::max(_91, _71);
    bool _97 = _95 != 0.0;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    float _107 = 0.0;
    if (_105)
    {
        _107 = 1.0;
    }
    float _109 = _107;
    float _111 = _109;
    if (_105)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    int _120 = as_type<int>(_117);
    if (_105)
    {
        float _122 = fma(_95, _117, 1.0);
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (_105)
    {
        float _128 = log2(as_type<float>(_124));
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    float _132 = 0.0;
    int _134 = _130;
    if (_105)
    {
        float _136 = as_type<float>(_130) + (-1.0);
        _132 = _136;
    }
    float _138 = _132;
    float _140 = _59;
    float _142 = _61;
    int _144 = as_type<int>(_138);
    if (_105)
    {
        float2 _401 = float2(_59, _61);
        float3 _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_401, float2(0.0), isnan(_401)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_401, float2(0.0), isnan(_401)), level(_138)).xyz;
        float _150 = _148.x;
        float _152 = _148.y;
        float _154 = _148.z;
        _140 = _150;
        _142 = _152;
        _144 = as_type<int>(_154);
    }
    float _156 = _140;
    float _158 = _142;
    int _160 = _144;
    float _162 = in.m_33.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_33.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    if (_105)
    {
        float _174 = 0.0 + as_type<float>(_130);
        float _176 = precise::clamp(_174, 0.0, 1.0);
        _93 = _176;
    }
    float _178 = _93;
    float _180 = _57 * _166;
    float _182 = _57 * _172;
    float _184 = 0.0;
    float _186 = _178;
    float _188 = _172;
    if (_105)
    {
        float _190 = fma(_182, _178, _180);
        _184 = _190;
    }
    float _192 = _184;
    if (_105)
    {
        float _194 = _178 * _182;
        _186 = _194;
    }
    float _196 = _186;
    float _198 = _95;
    float _200 = _196;
    if (_105)
    {
        float _202 = 1.0 / _192;
        _198 = _202;
    }
    float _204 = _198;
    int _206 = _160;
    if (_105)
    {
        float _208 = as_type<float>(_160) * _196;
        _188 = _208;
    }
    float _210 = _188;
    int _212 = as_type<int>(_210);
    if (_105)
    {
        float _214 = _204 * _196;
        _200 = _214;
    }
    float _216 = _200;
    if (_105)
    {
        float _218 = _210 * _204;
        _212 = as_type<int>(_218);
    }
    int _220 = _212;
    if (_105)
    {
        float _222 = _156 * _216;
        _134 = as_type<int>(_222);
    }
    int _224 = _134;
    if (_105)
    {
        float _226 = _158 * _216;
        _206 = as_type<int>(_226);
    }
    int _228 = _206;
    if (_105)
    {
        out.m_36.x = as_type<float>(_224);
        out.m_36.y = as_type<float>(_228);
        out.m_36.z = as_type<float>(_220);
        out.m_36.w = _192;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _180;
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
    float2 _262 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_262, float2(0.0), isnan(_262))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    bool _81 = _77 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_81)
    {
        discard_fragment();
    }
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _89 = precise::clamp(_87, 0.0, 1.0);
    float _91 = precise::max(_89, _85);
    float _93 = _85;
    if (_81)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float _95 = precise::max(_91, _71);
    bool _97 = _95 != 0.0;
    bool _99 = isnan(_95);
    bool _101 = _97 || _99;
    bool _103 = isnan(0.0);
    bool _105 = _101 || _103;
    float _107 = 0.0;
    if (_105)
    {
        _107 = 1.0;
    }
    float _109 = _107;
    float _111 = _109;
    if (_105)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    int _120 = as_type<int>(_117);
    if (_105)
    {
        float _122 = fma(_95, _117, 1.0);
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (_105)
    {
        float _128 = log2(as_type<float>(_124));
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    float _132 = 0.0;
    int _134 = _130;
    if (_105)
    {
        float _136 = as_type<float>(_130) + (-1.0);
        _132 = _136;
    }
    float _138 = _132;
    float _140 = _59;
    float _142 = _61;
    int _144 = as_type<int>(_138);
    if (_105)
    {
        float2 _401 = float2(_59, _61);
        float3 _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_401, float2(0.0), isnan(_401)), level(_138)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_401, float2(0.0), isnan(_401)), level(_138)).xyz;
        float _150 = _148.x;
        float _152 = _148.y;
        float _154 = _148.z;
        _140 = _150;
        _142 = _152;
        _144 = as_type<int>(_154);
    }
    float _156 = _140;
    float _158 = _142;
    int _160 = _144;
    float _162 = in.m_33.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_33.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    if (_105)
    {
        float _174 = 0.0 + as_type<float>(_130);
        float _176 = precise::clamp(_174, 0.0, 1.0);
        _93 = _176;
    }
    float _178 = _93;
    float _180 = _57 * _166;
    float _182 = _57 * _172;
    float _184 = 0.0;
    float _186 = _178;
    float _188 = _172;
    if (_105)
    {
        float _190 = fma(_182, _178, _180);
        _184 = _190;
    }
    float _192 = _184;
    if (_105)
    {
        float _194 = _178 * _182;
        _186 = _194;
    }
    float _196 = _186;
    float _198 = _95;
    float _200 = _196;
    if (_105)
    {
        float _202 = 1.0 / _192;
        _198 = _202;
    }
    float _204 = _198;
    int _206 = _160;
    if (_105)
    {
        float _208 = as_type<float>(_160) * _196;
        _188 = _208;
    }
    float _210 = _188;
    int _212 = as_type<int>(_210);
    if (_105)
    {
        float _214 = _204 * _196;
        _200 = _214;
    }
    float _216 = _200;
    if (_105)
    {
        float _218 = _210 * _204;
        _212 = as_type<int>(_218);
    }
    int _220 = _212;
    if (_105)
    {
        float _222 = _156 * _216;
        _134 = as_type<int>(_222);
    }
    int _224 = _134;
    if (_105)
    {
        float _226 = _158 * _216;
        _206 = as_type<int>(_226);
    }
    int _228 = _206;
    if (_105)
    {
        out.m_36.x = as_type<float>(_224);
        out.m_36.y = as_type<float>(_228);
        out.m_36.z = as_type<float>(_220);
        out.m_36.w = _192;
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _180;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

