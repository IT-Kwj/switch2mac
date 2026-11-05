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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _265 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _83 = precise::max(_81, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _85 = 1.0 / _83;
    float _87 = _85 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _89 = _87 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _91 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _93 = fma(_91, 0.5, -0.5);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    bool _99 = _95 > 0.0;
    bool _101 = isnan(_95);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    int _110 = as_type<int>(_87);
    if (!_107)
    {
        _110 = 1065353216;
    }
    int _112 = _110;
    if (!_107)
    {
        out.m_36.x = as_type<float>(_112);
        return out;
    }
    float2 _356 = float2(_77, _79);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_356, float2(0.0), isnan(_356))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_356, float2(0.0), isnan(_356))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _124 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _126 = fma(_120, 2.0, -1.0);
    float _128 = fma(_118, 2.0, -1.0);
    float _130 = _126 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _132 = _128 * _122;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _136 = _130 * _122;
    float _138 = fma(_126, _124, _132);
    float _140 = -_136;
    float _142 = fma(_134, _124, _140);
    float _144 = _61 + _138;
    float _146 = -_138;
    float _148 = _61 + _146;
    float _150 = -_142;
    float _152 = _59 + _150;
    float _154 = _59 + _142;
    float2 _424 = float2(_152, _148);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_424, float2(0.0), isnan(_424))).x;
    float2 _432 = float2(_154, _144);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float _160 = 1.0 / _89;
    float _162 = _160 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _164 = _162 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _166 = 0.5 * _164;
    float _168 = -_156;
    float _170 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _168);
    float _172 = -_158;
    float _174 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _172);
    float _176 = fma(_170, _166, 0.5);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_174, _166, 0.5);
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = -_170;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -_174;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = -_178;
    float _198 = _196 + 0.5;
    float _200 = -_182;
    float _202 = _200 + 0.5;
    float _204 = fma(_188, _198, 0.5);
    float _206 = fma(_194, _202, 0.5);
    float _208 = -_204;
    float _210 = _182 + _208;
    float _212 = -_206;
    float _214 = _178 + _212;
    float _216 = fma(_194, _210, _204);
    float _218 = fma(_188, _214, _206);
    float _220 = _216 + _218;
    float _222 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _224 = _222 + (-0.5);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = -_228;
    float _232 = fma(_95, _230, 1.0);
    out.m_36.x = _232;
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
    float _45 = in.m_33.x;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_33.y;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = 1.0 / _43;
    float _59 = _57 * _49;
    float _61 = _57 * _55;
    float2 _265 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_265, float2(0.0), isnan(_265))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_265, float2(0.0), isnan(_265))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_33.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _57 * _69;
    float _79 = _57 * _75;
    float _81 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _83 = precise::max(_81, (*spvDescriptorSet0.fp_c3)._m0[0].y);
    float _85 = 1.0 / _83;
    float _87 = _85 * (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _89 = _87 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _91 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _93 = fma(_91, 0.5, -0.5);
    float _95 = precise::clamp(_93, 0.0, 1.0);
    bool _99 = _95 > 0.0;
    bool _101 = isnan(_95);
    bool _103 = _99 || _101;
    bool _105 = isnan(0.0);
    bool _107 = _103 || _105;
    int _110 = as_type<int>(_87);
    if (!_107)
    {
        _110 = 1065353216;
    }
    int _112 = _110;
    if (!_107)
    {
        out.m_36.x = as_type<float>(_112);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    float2 _356 = float2(_77, _79);
    float2 _116 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_356, float2(0.0), isnan(_356))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_356, float2(0.0), isnan(_356))).xy;
    float _118 = _116.x;
    float _120 = _116.y;
    float _122 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _124 = _89 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _126 = fma(_120, 2.0, -1.0);
    float _128 = fma(_118, 2.0, -1.0);
    float _130 = _126 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _132 = _128 * _122;
    float _134 = _128 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _136 = _130 * _122;
    float _138 = fma(_126, _124, _132);
    float _140 = -_136;
    float _142 = fma(_134, _124, _140);
    float _144 = _61 + _138;
    float _146 = -_138;
    float _148 = _61 + _146;
    float _150 = -_142;
    float _152 = _59 + _150;
    float _154 = _59 + _142;
    float2 _424 = float2(_152, _148);
    float _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_424, float2(0.0), isnan(_424))).x;
    float2 _432 = float2(_154, _144);
    float _158 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float _160 = 1.0 / _89;
    float _162 = _160 * (*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _164 = _162 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _166 = 0.5 * _164;
    float _168 = -_156;
    float _170 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _168);
    float _172 = -_158;
    float _174 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[1].z, _172);
    float _176 = fma(_170, _166, 0.5);
    float _178 = precise::clamp(_176, 0.0, 1.0);
    float _180 = fma(_174, _166, 0.5);
    float _182 = precise::clamp(_180, 0.0, 1.0);
    float _184 = -_170;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _188 = precise::clamp(_186, 0.0, 1.0);
    float _190 = -_174;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _194 = precise::clamp(_192, 0.0, 1.0);
    float _196 = -_178;
    float _198 = _196 + 0.5;
    float _200 = -_182;
    float _202 = _200 + 0.5;
    float _204 = fma(_188, _198, 0.5);
    float _206 = fma(_194, _202, 0.5);
    float _208 = -_204;
    float _210 = _182 + _208;
    float _212 = -_206;
    float _214 = _178 + _212;
    float _216 = fma(_194, _210, _204);
    float _218 = fma(_188, _214, _206);
    float _220 = _216 + _218;
    float _222 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[5].w, (*spvDescriptorSet0.fp_c3)._m0[0].w);
    float _224 = _222 + (-0.5);
    float _226 = _224 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _228 = precise::clamp(_226, 0.0, 1.0);
    float _230 = -_228;
    float _232 = fma(_95, _230, 1.0);
    out.m_36.x = _232;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

