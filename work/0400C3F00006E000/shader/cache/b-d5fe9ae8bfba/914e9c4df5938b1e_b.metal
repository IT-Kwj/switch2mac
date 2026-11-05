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
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _41;
    float _51 = _49 * _47;
    bool _55 = _51 != 0.0;
    bool _57 = isnan(_51);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    float _65 = 0.0;
    float _67 = _47;
    float _69 = _51;
    float _71 = _49;
    if (_63)
    {
        float _73 = in.m_31.x;
        float _75 = gl_FragCoord.w;
        float _77 = _73 * _75;
        _65 = _77;
    }
    float _79 = _65;
    float _81 = 0.0;
    if (_63)
    {
        float _83 = in.m_31.y;
        float _85 = gl_FragCoord.w;
        float _87 = _83 * _85;
        _81 = _87;
    }
    float _89 = _81;
    if (_63)
    {
        _67 = 1.0;
    }
    float _91 = _67;
    float _93 = _91;
    if (_63)
    {
        float _95 = -_91;
        float _97 = _95 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _93 = _97;
    }
    float _99 = _93;
    float _101 = _99;
    if (_63)
    {
        float _103 = fma(_51, _99, 1.0);
        _69 = _103;
    }
    float _105 = _69;
    float _107 = _105;
    if (_63)
    {
        float _109 = log2(_105);
        _107 = _109;
    }
    float _111 = _107;
    float _113 = 0.0;
    if (_63)
    {
        float _115 = _49 * _79;
        _113 = _115;
    }
    float _117 = _113;
    float _119 = _89;
    if (_63)
    {
        float _121 = _49 * _89;
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _111;
    if (_63)
    {
        float _127 = _111 + (-1.0);
        _101 = _127;
    }
    float _129 = _101;
    float _131 = _117;
    float _133 = _123;
    int _136 = as_type<int>(_129);
    if (_63)
    {
        float2 _351 = float2(_117, _123);
        float3 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351)), level(_129)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351)), level(_129)).xyz;
        float _142 = _140.x;
        float _144 = _140.y;
        float _146 = _140.z;
        _131 = _142;
        _133 = _144;
        _136 = as_type<int>(_146);
    }
    float _148 = _131;
    float _150 = _133;
    int _152 = _136;
    float _154 = in.m_29.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_29.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _49 * _158;
    float _168 = _49 * _164;
    float _170 = _158;
    if (_63)
    {
        float _172 = 0.0 + _111;
        float _174 = precise::clamp(_172, 0.0, 1.0);
        _71 = _174;
    }
    float _176 = _71;
    float _178 = _176;
    if (_63)
    {
        float _180 = fma(_168, _176, _166);
        _170 = _180;
    }
    float _182 = _170;
    if (_63)
    {
        float _184 = _176 * _168;
        _125 = _184;
    }
    float _186 = _125;
    float _188 = 0.0;
    int _190 = as_type<int>(_186);
    if (_63)
    {
        float _192 = 1.0 / _182;
        _188 = _192;
    }
    float _194 = _188;
    float _196 = 0.0;
    if (_63)
    {
        float _198 = _194 * _186;
        _196 = _198;
    }
    float _200 = _196;
    int _202 = _152;
    if (_63)
    {
        float _204 = as_type<float>(_152) * _186;
        _178 = _204;
    }
    float _206 = _178;
    int _208 = as_type<int>(_206);
    if (_63)
    {
        float _210 = _148 * _200;
        _190 = as_type<int>(_210);
    }
    int _212 = _190;
    if (_63)
    {
        float _214 = _150 * _200;
        _202 = as_type<int>(_214);
    }
    int _216 = _202;
    if (_63)
    {
        float _218 = _206 * _194;
        _208 = as_type<int>(_218);
    }
    int _220 = _208;
    if (_63)
    {
        out.m_34.x = as_type<float>(_212);
        out.m_34.y = as_type<float>(_216);
        out.m_34.z = as_type<float>(_220);
        out.m_34.w = _182;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _166;
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = 1.0 / _41;
    float _51 = _49 * _47;
    bool _55 = _51 != 0.0;
    bool _57 = isnan(_51);
    bool _59 = _55 || _57;
    bool _61 = isnan(0.0);
    bool _63 = _59 || _61;
    float _65 = 0.0;
    float _67 = _47;
    float _69 = _51;
    float _71 = _49;
    if (_63)
    {
        float _73 = in.m_31.x;
        float _75 = gl_FragCoord.w;
        float _77 = _73 * _75;
        _65 = _77;
    }
    float _79 = _65;
    float _81 = 0.0;
    if (_63)
    {
        float _83 = in.m_31.y;
        float _85 = gl_FragCoord.w;
        float _87 = _83 * _85;
        _81 = _87;
    }
    float _89 = _81;
    if (_63)
    {
        _67 = 1.0;
    }
    float _91 = _67;
    float _93 = _91;
    if (_63)
    {
        float _95 = -_91;
        float _97 = _95 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _93 = _97;
    }
    float _99 = _93;
    float _101 = _99;
    if (_63)
    {
        float _103 = fma(_51, _99, 1.0);
        _69 = _103;
    }
    float _105 = _69;
    float _107 = _105;
    if (_63)
    {
        float _109 = log2(_105);
        _107 = _109;
    }
    float _111 = _107;
    float _113 = 0.0;
    if (_63)
    {
        float _115 = _49 * _79;
        _113 = _115;
    }
    float _117 = _113;
    float _119 = _89;
    if (_63)
    {
        float _121 = _49 * _89;
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _111;
    if (_63)
    {
        float _127 = _111 + (-1.0);
        _101 = _127;
    }
    float _129 = _101;
    float _131 = _117;
    float _133 = _123;
    int _136 = as_type<int>(_129);
    if (_63)
    {
        float2 _351 = float2(_117, _123);
        float3 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_351, float2(0.0), isnan(_351)), level(_129)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_351, float2(0.0), isnan(_351)), level(_129)).xyz;
        float _142 = _140.x;
        float _144 = _140.y;
        float _146 = _140.z;
        _131 = _142;
        _133 = _144;
        _136 = as_type<int>(_146);
    }
    float _148 = _131;
    float _150 = _133;
    int _152 = _136;
    float _154 = in.m_29.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_29.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _49 * _158;
    float _168 = _49 * _164;
    float _170 = _158;
    if (_63)
    {
        float _172 = 0.0 + _111;
        float _174 = precise::clamp(_172, 0.0, 1.0);
        _71 = _174;
    }
    float _176 = _71;
    float _178 = _176;
    if (_63)
    {
        float _180 = fma(_168, _176, _166);
        _170 = _180;
    }
    float _182 = _170;
    if (_63)
    {
        float _184 = _176 * _168;
        _125 = _184;
    }
    float _186 = _125;
    float _188 = 0.0;
    int _190 = as_type<int>(_186);
    if (_63)
    {
        float _192 = 1.0 / _182;
        _188 = _192;
    }
    float _194 = _188;
    float _196 = 0.0;
    if (_63)
    {
        float _198 = _194 * _186;
        _196 = _198;
    }
    float _200 = _196;
    int _202 = _152;
    if (_63)
    {
        float _204 = as_type<float>(_152) * _186;
        _178 = _204;
    }
    float _206 = _178;
    int _208 = as_type<int>(_206);
    if (_63)
    {
        float _210 = _148 * _200;
        _190 = as_type<int>(_210);
    }
    int _212 = _190;
    if (_63)
    {
        float _214 = _150 * _200;
        _202 = as_type<int>(_214);
    }
    int _216 = _202;
    if (_63)
    {
        float _218 = _206 * _194;
        _208 = as_type<int>(_218);
    }
    int _220 = _208;
    if (_63)
    {
        out.m_34.x = as_type<float>(_212);
        out.m_34.y = as_type<float>(_216);
        out.m_34.z = as_type<float>(_220);
        out.m_34.w = _182;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _166;
    return main0_out_u{as_type<uint4>(out.m_34)};
}

