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
    float2 _254 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_254, float2(0.0), isnan(_254))).x;
    float2 _265 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = _59 * _73;
    float _77 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    float _81 = precise::max(_67, _79);
    float _83 = precise::max(_81, _75);
    bool _87 = _83 != 0.0;
    bool _89 = isnan(_83);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _83;
    float _101 = _75;
    if (_95)
    {
        _97 = 1.0;
    }
    float _103 = _97;
    float _105 = _103;
    if (_95)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _111;
    if (_95)
    {
        float _115 = fma(_83, _111, 1.0);
        _99 = _115;
    }
    float _117 = _99;
    float _119 = _117;
    if (_95)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _123;
    if (_95)
    {
        float _127 = _123 + (-1.0);
        _101 = _127;
    }
    float _129 = _101;
    int _132 = as_type<int>(_61);
    int _134 = as_type<int>(_63);
    float _136 = _129;
    if (_95)
    {
        float2 _365 = float2(_61, _63);
        float3 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_365, float2(0.0), isnan(_365)), level(_129)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_365, float2(0.0), isnan(_365)), level(_129)).xyz;
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
    float _154 = in.m_35.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_35.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _59 * _158;
    float _168 = _59 * _164;
    float _170 = _164;
    if (_95)
    {
        float _172 = 0.0 + _123;
        float _174 = precise::clamp(_172, 0.0, 1.0);
        _170 = _174;
    }
    float _176 = _170;
    float _178 = _176;
    if (_95)
    {
        float _180 = fma(_168, _176, _166);
        _113 = _180;
    }
    float _182 = _113;
    if (_95)
    {
        float _184 = _176 * _168;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = 0.0;
    float _190 = _186;
    if (_95)
    {
        float _192 = 1.0 / _182;
        _188 = _192;
    }
    float _194 = _188;
    int _196 = _148;
    int _198 = _150;
    if (_95)
    {
        float _200 = _152 * _186;
        _125 = _200;
    }
    float _202 = _125;
    int _204 = as_type<int>(_202);
    if (_95)
    {
        float _206 = _194 * _186;
        _190 = _206;
    }
    float _208 = _190;
    if (_95)
    {
        float _210 = _202 * _194;
        _204 = as_type<int>(_210);
    }
    int _212 = _204;
    if (_95)
    {
        float _214 = as_type<float>(_148) * _208;
        _196 = as_type<int>(_214);
    }
    int _216 = _196;
    if (_95)
    {
        float _218 = as_type<float>(_150) * _208;
        _198 = as_type<int>(_218);
    }
    int _220 = _198;
    if (_95)
    {
        out.m_38.x = as_type<float>(_216);
        out.m_38.y = as_type<float>(_220);
        out.m_38.z = as_type<float>(_212);
        out.m_38.w = _182;
        return out;
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _166;
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
    float2 _254 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_254, float2(0.0), isnan(_254))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_254, float2(0.0), isnan(_254))).x;
    float2 _265 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = _59 * _73;
    float _77 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    float _81 = precise::max(_67, _79);
    float _83 = precise::max(_81, _75);
    bool _87 = _83 != 0.0;
    bool _89 = isnan(_83);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _83;
    float _101 = _75;
    if (_95)
    {
        _97 = 1.0;
    }
    float _103 = _97;
    float _105 = _103;
    if (_95)
    {
        float _107 = -_103;
        float _109 = _107 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _105 = _109;
    }
    float _111 = _105;
    float _113 = _111;
    if (_95)
    {
        float _115 = fma(_83, _111, 1.0);
        _99 = _115;
    }
    float _117 = _99;
    float _119 = _117;
    if (_95)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _123;
    if (_95)
    {
        float _127 = _123 + (-1.0);
        _101 = _127;
    }
    float _129 = _101;
    int _132 = as_type<int>(_61);
    int _134 = as_type<int>(_63);
    float _136 = _129;
    if (_95)
    {
        float2 _365 = float2(_61, _63);
        float3 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_365, float2(0.0), isnan(_365)), level(_129)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_365, float2(0.0), isnan(_365)), level(_129)).xyz;
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
    float _154 = in.m_35.x;
    float _156 = gl_FragCoord.w;
    float _158 = _154 * _156;
    float _160 = in.m_35.y;
    float _162 = gl_FragCoord.w;
    float _164 = _160 * _162;
    float _166 = _59 * _158;
    float _168 = _59 * _164;
    float _170 = _164;
    if (_95)
    {
        float _172 = 0.0 + _123;
        float _174 = precise::clamp(_172, 0.0, 1.0);
        _170 = _174;
    }
    float _176 = _170;
    float _178 = _176;
    if (_95)
    {
        float _180 = fma(_168, _176, _166);
        _113 = _180;
    }
    float _182 = _113;
    if (_95)
    {
        float _184 = _176 * _168;
        _178 = _184;
    }
    float _186 = _178;
    float _188 = 0.0;
    float _190 = _186;
    if (_95)
    {
        float _192 = 1.0 / _182;
        _188 = _192;
    }
    float _194 = _188;
    int _196 = _148;
    int _198 = _150;
    if (_95)
    {
        float _200 = _152 * _186;
        _125 = _200;
    }
    float _202 = _125;
    int _204 = as_type<int>(_202);
    if (_95)
    {
        float _206 = _194 * _186;
        _190 = _206;
    }
    float _208 = _190;
    if (_95)
    {
        float _210 = _202 * _194;
        _204 = as_type<int>(_210);
    }
    int _212 = _204;
    if (_95)
    {
        float _214 = as_type<float>(_148) * _208;
        _196 = as_type<int>(_214);
    }
    int _216 = _196;
    if (_95)
    {
        float _218 = as_type<float>(_150) * _208;
        _198 = as_type<int>(_218);
    }
    int _220 = _198;
    if (_95)
    {
        out.m_38.x = as_type<float>(_216);
        out.m_38.y = as_type<float>(_220);
        out.m_38.z = as_type<float>(_212);
        out.m_38.w = _182;
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    out.m_38.x = 0.0;
    out.m_38.y = 0.0;
    out.m_38.z = 0.0;
    out.m_38.w = _166;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

