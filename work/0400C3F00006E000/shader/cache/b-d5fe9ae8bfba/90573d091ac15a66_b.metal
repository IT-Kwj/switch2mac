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
    float2 _256 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _71 = _59;
    if (_69)
    {
        discard_fragment();
    }
    float2 _277 = float2(_61, _63);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_277, float2(0.0), isnan(_277))).x;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _83 = precise::clamp(_81, 0.0, 1.0);
    float _85 = _59 * _79;
    float _87 = precise::max(_73, _83);
    float _89 = precise::max(_87, _85);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = _83;
    if (_99)
    {
        _101 = 1.0;
    }
    float _103 = _101;
    float _105 = _103;
    if (_99)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    if (_69)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return out;
    }
    int _114 = 0;
    if (_99)
    {
        float _116 = fma(_89, _111, 1.0);
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (_99)
    {
        float _122 = log2(as_type<float>(_118));
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    float _126 = 0.0;
    int _128 = _124;
    if (_99)
    {
        float _130 = as_type<float>(_124) + (-1.0);
        _126 = _130;
    }
    float _132 = _126;
    float _134 = _61;
    float _136 = _63;
    int _138 = as_type<int>(_132);
    if (_99)
    {
        float2 _383 = float2(_61, _63);
        float3 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_383, float2(0.0), isnan(_383)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_383, float2(0.0), isnan(_383)), level(_132)).xyz;
        float _144 = _142.x;
        float _146 = _142.y;
        float _148 = _142.z;
        _134 = _144;
        _136 = _146;
        _138 = as_type<int>(_148);
    }
    float _150 = _134;
    float _152 = _136;
    int _154 = _138;
    float _156 = in.m_35.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_35.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _59 * _160;
    float _170 = _59 * _166;
    float _172 = _160;
    if (_99)
    {
        float _174 = 0.0 + as_type<float>(_124);
        float _176 = precise::clamp(_174, 0.0, 1.0);
        _71 = _176;
    }
    float _178 = _71;
    float _180 = _178;
    if (_99)
    {
        float _182 = fma(_170, _178, _168);
        _172 = _182;
    }
    float _184 = _172;
    if (_99)
    {
        float _186 = _178 * _170;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _111;
    float _192 = _188;
    if (_99)
    {
        float _194 = 1.0 / _184;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = 0.0;
    int _200 = _154;
    if (_99)
    {
        float _202 = as_type<float>(_154) * _188;
        _198 = _202;
    }
    float _204 = _198;
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
        float _216 = _150 * _210;
        _128 = as_type<int>(_216);
    }
    int _218 = _128;
    if (_99)
    {
        float _220 = _152 * _210;
        _200 = as_type<int>(_220);
    }
    int _222 = _200;
    if (_99)
    {
        out.m_38.x = as_type<float>(_218);
        out.m_38.y = as_type<float>(_222);
        out.m_38.z = as_type<float>(_214);
        out.m_38.w = _184;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _168;
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
    float2 _256 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_256, float2(0.0), isnan(_256))).x;
    bool _69 = _65 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _71 = _59;
    if (_69)
    {
        discard_fragment();
    }
    float2 _277 = float2(_61, _63);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_277, float2(0.0), isnan(_277))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_277, float2(0.0), isnan(_277))).x;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _83 = precise::clamp(_81, 0.0, 1.0);
    float _85 = _59 * _79;
    float _87 = precise::max(_73, _83);
    float _89 = precise::max(_87, _85);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = _83;
    if (_99)
    {
        _101 = 1.0;
    }
    float _103 = _101;
    float _105 = _103;
    if (_99)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    if (_69)
    {
        out.m_38.x = 0.0;
        out.m_38.y = 0.0;
        out.m_38.z = 0.0;
        out.m_38.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    int _114 = 0;
    if (_99)
    {
        float _116 = fma(_89, _111, 1.0);
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (_99)
    {
        float _122 = log2(as_type<float>(_118));
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    float _126 = 0.0;
    int _128 = _124;
    if (_99)
    {
        float _130 = as_type<float>(_124) + (-1.0);
        _126 = _130;
    }
    float _132 = _126;
    float _134 = _61;
    float _136 = _63;
    int _138 = as_type<int>(_132);
    if (_99)
    {
        float2 _383 = float2(_61, _63);
        float3 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_383, float2(0.0), isnan(_383)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_383, float2(0.0), isnan(_383)), level(_132)).xyz;
        float _144 = _142.x;
        float _146 = _142.y;
        float _148 = _142.z;
        _134 = _144;
        _136 = _146;
        _138 = as_type<int>(_148);
    }
    float _150 = _134;
    float _152 = _136;
    int _154 = _138;
    float _156 = in.m_35.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_35.y;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = _59 * _160;
    float _170 = _59 * _166;
    float _172 = _160;
    if (_99)
    {
        float _174 = 0.0 + as_type<float>(_124);
        float _176 = precise::clamp(_174, 0.0, 1.0);
        _71 = _176;
    }
    float _178 = _71;
    float _180 = _178;
    if (_99)
    {
        float _182 = fma(_170, _178, _168);
        _172 = _182;
    }
    float _184 = _172;
    if (_99)
    {
        float _186 = _178 * _170;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _111;
    float _192 = _188;
    if (_99)
    {
        float _194 = 1.0 / _184;
        _190 = _194;
    }
    float _196 = _190;
    float _198 = 0.0;
    int _200 = _154;
    if (_99)
    {
        float _202 = as_type<float>(_154) * _188;
        _198 = _202;
    }
    float _204 = _198;
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
        float _216 = _150 * _210;
        _128 = as_type<int>(_216);
    }
    int _218 = _128;
    if (_99)
    {
        float _220 = _152 * _210;
        _200 = as_type<int>(_220);
    }
    int _222 = _200;
    if (_99)
    {
        out.m_38.x = as_type<float>(_218);
        out.m_38.y = as_type<float>(_222);
        out.m_38.z = as_type<float>(_214);
        out.m_38.w = _184;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _168;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

