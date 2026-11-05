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
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _262 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_262, float2(0.0), isnan(_262))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = _71;
    float _79 = _59;
    if (_75)
    {
        discard_fragment();
    }
    float2 _296 = float2(_61, _63);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = _59 * _87;
    float _95 = precise::max(_81, _91);
    float _97 = precise::max(_95, _93);
    bool _99 = _97 != 0.0;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    if (_107)
    {
        _77 = 1.0;
    }
    float _109 = _77;
    float _111 = _109;
    if (_107)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    if (_75)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    int _120 = 0;
    if (_107)
    {
        float _122 = fma(_97, _117, 1.0);
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (_107)
    {
        float _128 = log2(as_type<float>(_124));
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    float _132 = 0.0;
    int _134 = _130;
    if (_107)
    {
        float _136 = as_type<float>(_130) + (-1.0);
        _132 = _136;
    }
    float _138 = _132;
    float _140 = _61;
    float _142 = _63;
    int _144 = as_type<int>(_138);
    if (_107)
    {
        float2 _400 = float2(_61, _63);
        float3 _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400)), level(_138)).xyz;
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
    float _162 = in.m_35.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_35.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _59 * _166;
    float _176 = _59 * _172;
    float _178 = _166;
    if (_107)
    {
        float _180 = 0.0 + as_type<float>(_130);
        float _182 = precise::clamp(_180, 0.0, 1.0);
        _79 = _182;
    }
    float _184 = _79;
    float _186 = _184;
    if (_107)
    {
        float _188 = fma(_176, _184, _174);
        _178 = _188;
    }
    float _190 = _178;
    if (_107)
    {
        float _192 = _184 * _176;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _117;
    float _198 = _194;
    if (_107)
    {
        float _200 = 1.0 / _190;
        _196 = _200;
    }
    float _202 = _196;
    float _204 = 0.0;
    int _206 = _160;
    if (_107)
    {
        float _208 = as_type<float>(_160) * _194;
        _204 = _208;
    }
    float _210 = _204;
    int _212 = as_type<int>(_210);
    if (_107)
    {
        float _214 = _202 * _194;
        _198 = _214;
    }
    float _216 = _198;
    if (_107)
    {
        float _218 = _210 * _202;
        _212 = as_type<int>(_218);
    }
    int _220 = _212;
    if (_107)
    {
        float _222 = _156 * _216;
        _134 = as_type<int>(_222);
    }
    int _224 = _134;
    if (_107)
    {
        float _226 = _158 * _216;
        _206 = as_type<int>(_226);
    }
    int _228 = _206;
    if (_107)
    {
        out.m_38.x = as_type<float>(_224);
        out.m_38.y = as_type<float>(_228);
        out.m_38.z = as_type<float>(_220);
        out.m_38.w = _190;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _174;
    return out;
}


struct main0_out_u
{
    uint4 m_38 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_33.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_33.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _262 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_262, float2(0.0), isnan(_262))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_262, float2(0.0), isnan(_262))).x;
    float _67 = -_65;
    float _69 = fma(_67, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _71 = 1.0 / _69;
    bool _75 = _71 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _77 = _71;
    float _79 = _59;
    if (_75)
    {
        discard_fragment();
    }
    float2 _296 = float2(_61, _63);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_296, float2(0.0), isnan(_296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_296, float2(0.0), isnan(_296))).x;
    float _83 = in.m_35.z;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _91 = precise::clamp(_89, 0.0, 1.0);
    float _93 = _59 * _87;
    float _95 = precise::max(_81, _91);
    float _97 = precise::max(_95, _93);
    bool _99 = _97 != 0.0;
    bool _101 = isnan(_97);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    if (_107)
    {
        _77 = 1.0;
    }
    float _109 = _77;
    float _111 = _109;
    if (_107)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    if (_75)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    int _120 = 0;
    if (_107)
    {
        float _122 = fma(_97, _117, 1.0);
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (_107)
    {
        float _128 = log2(as_type<float>(_124));
        _126 = as_type<int>(_128);
    }
    int _130 = _126;
    float _132 = 0.0;
    int _134 = _130;
    if (_107)
    {
        float _136 = as_type<float>(_130) + (-1.0);
        _132 = _136;
    }
    float _138 = _132;
    float _140 = _61;
    float _142 = _63;
    int _144 = as_type<int>(_138);
    if (_107)
    {
        float2 _400 = float2(_61, _63);
        float3 _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_400, float2(0.0), isnan(_400)), level(_138)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_400, float2(0.0), isnan(_400)), level(_138)).xyz;
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
    float _162 = in.m_35.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_35.y;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _59 * _166;
    float _176 = _59 * _172;
    float _178 = _166;
    if (_107)
    {
        float _180 = 0.0 + as_type<float>(_130);
        float _182 = precise::clamp(_180, 0.0, 1.0);
        _79 = _182;
    }
    float _184 = _79;
    float _186 = _184;
    if (_107)
    {
        float _188 = fma(_176, _184, _174);
        _178 = _188;
    }
    float _190 = _178;
    if (_107)
    {
        float _192 = _184 * _176;
        _186 = _192;
    }
    float _194 = _186;
    float _196 = _117;
    float _198 = _194;
    if (_107)
    {
        float _200 = 1.0 / _190;
        _196 = _200;
    }
    float _202 = _196;
    float _204 = 0.0;
    int _206 = _160;
    if (_107)
    {
        float _208 = as_type<float>(_160) * _194;
        _204 = _208;
    }
    float _210 = _204;
    int _212 = as_type<int>(_210);
    if (_107)
    {
        float _214 = _202 * _194;
        _198 = _214;
    }
    float _216 = _198;
    if (_107)
    {
        float _218 = _210 * _202;
        _212 = as_type<int>(_218);
    }
    int _220 = _212;
    if (_107)
    {
        float _222 = _156 * _216;
        _134 = as_type<int>(_222);
    }
    int _224 = _134;
    if (_107)
    {
        float _226 = _158 * _216;
        _206 = as_type<int>(_226);
    }
    int _228 = _206;
    if (_107)
    {
        out.m_38.x = as_type<float>(_224);
        out.m_38.y = as_type<float>(_228);
        out.m_38.z = as_type<float>(_220);
        out.m_38.w = _190;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _174;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

