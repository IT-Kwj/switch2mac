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
    texture2d<float> fp_t_tcb_E [[id(1)]];
    sampler fp_t_tcb_ESmplr [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_ESmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _275 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_275, float2(0.0), isnan(_275))).x;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= 0.00999999977648258209228515625;
    bool _87 = isnan(_65);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.00999999977648258209228515625);
    bool _93 = _89 || _91;
    int _96 = as_type<int>(_65);
    if (!_93)
    {
        _96 = 1065353216;
    }
    int _98 = _96;
    int _100 = _98;
    if (!_93)
    {
        out.m_38.x = as_type<float>(_98);
        return out;
    }
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _106 = fma(_104, 0.5, -0.5);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _108 > 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    if (!_118)
    {
        _100 = 1065353216;
    }
    int _120 = _100;
    if (!_118)
    {
        out.m_38.x = as_type<float>(_120);
        return out;
    }
    float2 _376 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _134 = fma(_128, 2.0, -1.0);
    float _136 = fma(_126, 2.0, -1.0);
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _140 = _136 * _130;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _144 = _138 * _130;
    float _146 = fma(_134, _132, _140);
    float _148 = -_144;
    float _150 = fma(_142, _132, _148);
    float _152 = -_146;
    float _154 = _63 + _152;
    float _156 = _63 + _146;
    float _158 = -_150;
    float _160 = _61 + _158;
    float _162 = _61 + _150;
    float2 _444 = float2(_61, _63);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_444, float2(0.0), isnan(_444))).x;
    float2 _452 = float2(_160, _154);
    float _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float2 _460 = float2(_162, _156);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float _170 = 1.0 / _102;
    float _172 = _170 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _174 = _172 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _176 = 0.5 * _174;
    float _178 = -_166;
    float _180 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].z, _178);
    float _182 = -_168;
    float _184 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].z, _182);
    float _186 = fma(_180, _176, 0.5);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -_180;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = fma(_184, _176, 0.5);
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = -_188;
    float _202 = _200 + 0.5;
    float _204 = -_184;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = -_198;
    float _212 = _210 + 0.5;
    float _214 = fma(_194, _202, 0.5);
    float _216 = fma(_208, _212, 0.5);
    float _218 = -_214;
    float _220 = _198 + _218;
    float _222 = -_216;
    float _224 = _188 + _222;
    float _226 = fma(_208, _220, _214);
    float _228 = fma(_194, _224, _216);
    float _230 = _226 + _228;
    float _232 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _234 = _232 + (-0.5);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = -_238;
    float _242 = fma(_108, _240, 1.0);
    out.m_38.x = _242;
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
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _275 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_275, float2(0.0), isnan(_275))).x;
    float _67 = in.m_35.z;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.w;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = _59 * _71;
    float _81 = _59 * _77;
    bool _85 = _65 >= 0.00999999977648258209228515625;
    bool _87 = isnan(_65);
    bool _89 = _85 || _87;
    bool _91 = isnan(0.00999999977648258209228515625);
    bool _93 = _89 || _91;
    int _96 = as_type<int>(_65);
    if (!_93)
    {
        _96 = 1065353216;
    }
    int _98 = _96;
    int _100 = _98;
    if (!_93)
    {
        out.m_38.x = as_type<float>(_98);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float _102 = (*spvDescriptorSet0.fp_c3)._m0[1].w * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _104 = _102 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _106 = fma(_104, 0.5, -0.5);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    bool _110 = _108 > 0.0;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    if (!_118)
    {
        _100 = 1065353216;
    }
    int _120 = _100;
    if (!_118)
    {
        out.m_38.x = as_type<float>(_120);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _376 = float2(_79, _81);
    float2 _124 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_376, float2(0.0), isnan(_376))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_376, float2(0.0), isnan(_376))).xy;
    float _126 = _124.x;
    float _128 = _124.y;
    float _130 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _132 = _102 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _134 = fma(_128, 2.0, -1.0);
    float _136 = fma(_126, 2.0, -1.0);
    float _138 = _134 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _140 = _136 * _130;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _144 = _138 * _130;
    float _146 = fma(_134, _132, _140);
    float _148 = -_144;
    float _150 = fma(_142, _132, _148);
    float _152 = -_146;
    float _154 = _63 + _152;
    float _156 = _63 + _146;
    float _158 = -_150;
    float _160 = _61 + _158;
    float _162 = _61 + _150;
    float2 _444 = float2(_61, _63);
    float _164 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_444, float2(0.0), isnan(_444))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_444, float2(0.0), isnan(_444))).x;
    float2 _452 = float2(_160, _154);
    float _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float2 _460 = float2(_162, _156);
    float _168 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float _170 = 1.0 / _102;
    float _172 = _170 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _174 = _172 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _176 = 0.5 * _174;
    float _178 = -_166;
    float _180 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].z, _178);
    float _182 = -_168;
    float _184 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[1].z, _182);
    float _186 = fma(_180, _176, 0.5);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -_180;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = fma(_184, _176, 0.5);
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = -_188;
    float _202 = _200 + 0.5;
    float _204 = -_184;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _208 = precise::clamp(_206, 0.0, 1.0);
    float _210 = -_198;
    float _212 = _210 + 0.5;
    float _214 = fma(_194, _202, 0.5);
    float _216 = fma(_208, _212, 0.5);
    float _218 = -_214;
    float _220 = _198 + _218;
    float _222 = -_216;
    float _224 = _188 + _222;
    float _226 = fma(_208, _220, _214);
    float _228 = fma(_194, _224, _216);
    float _230 = _226 + _228;
    float _232 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _234 = _232 + (-0.5);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = -_238;
    float _242 = fma(_108, _240, 1.0);
    out.m_38.x = _242;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

