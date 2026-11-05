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
    texture2d<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_ESmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
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
    float2 _283 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).x;
    float2 _294 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_294, float2(0.0), isnan(_294))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _87 = precise::max(_85, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _89 = 1.0 / _87;
    bool _93 = _67 >= 0.00999999977648258209228515625;
    bool _95 = isnan(_67);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.00999999977648258209228515625);
    bool _101 = _97 || _99;
    int _104 = as_type<int>(_67);
    if (!_101)
    {
        _104 = 1065353216;
    }
    int _106 = _104;
    float _108 = _89 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _112 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _114 = fma(_112, 0.5, -0.5);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    bool _118 = _116 > 0.0;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    int _128 = _106;
    if (!_101)
    {
        out.m_38.x = as_type<float>(_106);
        return out;
    }
    if (!_126)
    {
        _128 = 1065353216;
    }
    int _130 = _128;
    if (!_126)
    {
        out.m_38.x = as_type<float>(_130);
        return out;
    }
    float2 _407 = float2(_83, _81);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_407, float2(0.0), isnan(_407))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _142 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _144 = fma(_138, 2.0, -1.0);
    float _146 = fma(_136, 2.0, -1.0);
    float _148 = _144 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _150 = _146 * _140;
    float _152 = _146 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _154 = _148 * _140;
    float _156 = fma(_144, _142, _150);
    float _158 = -_154;
    float _160 = fma(_152, _142, _158);
    float _162 = _63 + _156;
    float _164 = -_156;
    float _166 = _63 + _164;
    float _168 = -_160;
    float _170 = _61 + _168;
    float _172 = _61 + _160;
    float2 _475 = float2(_170, _166);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_475, float2(0.0), isnan(_475))).x;
    float2 _483 = float2(_172, _162);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float _178 = 1.0 / _110;
    float _180 = _178 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _182 = _180 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _184 = 0.5 * _182;
    float _186 = -_174;
    float _188 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _186);
    float _190 = -_176;
    float _192 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _190);
    float _194 = fma(_188, _184, 0.5);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = fma(_192, _184, 0.5);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -_188;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = -_192;
    float _210 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -_196;
    float _216 = _214 + 0.5;
    float _218 = -_200;
    float _220 = _218 + 0.5;
    float _222 = fma(_206, _216, 0.5);
    float _224 = fma(_212, _220, 0.5);
    float _226 = -_222;
    float _228 = _200 + _226;
    float _230 = -_224;
    float _232 = _196 + _230;
    float _234 = fma(_212, _228, _222);
    float _236 = fma(_206, _232, _224);
    float _238 = _234 + _236;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _242 = _240 + (-0.5);
    float _244 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -_246;
    float _250 = fma(_116, _248, 1.0);
    out.m_38.x = _250;
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
    float2 _283 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).x;
    float2 _294 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_294, float2(0.0), isnan(_294))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_294, float2(0.0), isnan(_294))).x;
    float _69 = in.m_35.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_35.z;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = _59 * _73;
    float _83 = _59 * _79;
    float _85 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _87 = precise::max(_85, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _89 = 1.0 / _87;
    bool _93 = _67 >= 0.00999999977648258209228515625;
    bool _95 = isnan(_67);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.00999999977648258209228515625);
    bool _101 = _97 || _99;
    int _104 = as_type<int>(_67);
    if (!_101)
    {
        _104 = 1065353216;
    }
    int _106 = _104;
    float _108 = _89 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _110 = _108 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _112 = _110 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _114 = fma(_112, 0.5, -0.5);
    float _116 = precise::clamp(_114, 0.0, 1.0);
    bool _118 = _116 > 0.0;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(0.0);
    bool _126 = _122 || _124;
    int _128 = _106;
    if (!_101)
    {
        out.m_38.x = as_type<float>(_106);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    if (!_126)
    {
        _128 = 1065353216;
    }
    int _130 = _128;
    if (!_126)
    {
        out.m_38.x = as_type<float>(_130);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    float2 _407 = float2(_83, _81);
    float2 _134 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_407, float2(0.0), isnan(_407))).xy;
    float _136 = _134.x;
    float _138 = _134.y;
    float _140 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _142 = _110 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _144 = fma(_138, 2.0, -1.0);
    float _146 = fma(_136, 2.0, -1.0);
    float _148 = _144 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _150 = _146 * _140;
    float _152 = _146 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _154 = _148 * _140;
    float _156 = fma(_144, _142, _150);
    float _158 = -_154;
    float _160 = fma(_152, _142, _158);
    float _162 = _63 + _156;
    float _164 = -_156;
    float _166 = _63 + _164;
    float _168 = -_160;
    float _170 = _61 + _168;
    float _172 = _61 + _160;
    float2 _475 = float2(_170, _166);
    float _174 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_475, float2(0.0), isnan(_475))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_475, float2(0.0), isnan(_475))).x;
    float2 _483 = float2(_172, _162);
    float _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float _178 = 1.0 / _110;
    float _180 = _178 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _182 = _180 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _184 = 0.5 * _182;
    float _186 = -_174;
    float _188 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _186);
    float _190 = -_176;
    float _192 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[1].z, _190);
    float _194 = fma(_188, _184, 0.5);
    float _196 = precise::clamp(_194, 0.0, 1.0);
    float _198 = fma(_192, _184, 0.5);
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = -_188;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = -_192;
    float _210 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = -_196;
    float _216 = _214 + 0.5;
    float _218 = -_200;
    float _220 = _218 + 0.5;
    float _222 = fma(_206, _216, 0.5);
    float _224 = fma(_212, _220, 0.5);
    float _226 = -_222;
    float _228 = _200 + _226;
    float _230 = -_224;
    float _232 = _196 + _230;
    float _234 = fma(_212, _228, _222);
    float _236 = fma(_206, _232, _224);
    float _238 = _234 + _236;
    float _240 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _242 = _240 + (-0.5);
    float _244 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = -_246;
    float _250 = fma(_116, _248, 1.0);
    out.m_38.x = _250;
    return main0_out_u{as_type<uint4>(out.m_38)};
}

