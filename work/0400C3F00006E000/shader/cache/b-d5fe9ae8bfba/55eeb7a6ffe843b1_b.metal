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
    float2 _264 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_264, float2(0.0), isnan(_264))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    float _81 = precise::max(_75, _79);
    float _83 = precise::max(_81, _71);
    bool _87 = _83 != 0.0;
    bool _89 = isnan(_83);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _71;
    float _101 = (*spvDescriptorSet0.fp_c3)._m0[4].y;
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
    if (_95)
    {
        float _113 = fma(_83, _111, 1.0);
        _99 = _113;
    }
    float _115 = _99;
    float _117 = _115;
    if (_95)
    {
        float _119 = log2(_115);
        _117 = _119;
    }
    float _121 = _117;
    float _123 = _121;
    if (_95)
    {
        float _125 = _121 + (-1.0);
        _101 = _125;
    }
    float _127 = _101;
    float _129 = _59;
    float _131 = _61;
    float _133 = 0.0;
    if (_95)
    {
        float2 _372 = float2(_59, _61);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_372, float2(0.0), isnan(_372)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_372, float2(0.0), isnan(_372)), level(_127)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        _129 = _139;
        _131 = _141;
        _133 = _143;
    }
    float _145 = _129;
    float _147 = _131;
    float _149 = _133;
    float _151 = in.m_33.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_33.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    if (_95)
    {
        float _163 = 0.0 + _121;
        float _165 = precise::clamp(_163, 0.0, 1.0);
        _123 = _165;
    }
    float _167 = _123;
    float _169 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = precise::min(_171, _175);
    float _179 = _57 * _155;
    float _181 = _57 * _161;
    int _184 = 0;
    float _186 = _175;
    float _188 = _179;
    float _190 = _181;
    if (_95)
    {
        float _192 = fma(_181, _167, _179);
        _184 = as_type<int>(_192);
    }
    int _194 = _184;
    if (_95)
    {
        float _196 = -_145;
        float _198 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _196);
        _186 = _198;
    }
    float _200 = _186;
    if (_95)
    {
        float _202 = -_147;
        float _204 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _202);
        _188 = _204;
    }
    float _206 = _188;
    if (_95)
    {
        float _208 = -_149;
        float _210 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _208);
        _190 = _210;
    }
    float _212 = _190;
    int _214 = 0;
    if (_95)
    {
        float _216 = fma(_177, _200, _145);
        _214 = as_type<int>(_216);
    }
    int _218 = _214;
    int _220 = 0;
    if (_95)
    {
        float _222 = fma(_177, _206, _147);
        _220 = as_type<int>(_222);
    }
    int _224 = _220;
    int _226 = 0;
    if (_95)
    {
        float _228 = fma(_177, _212, _149);
        _226 = as_type<int>(_228);
    }
    int _230 = _226;
    if (_95)
    {
        out.m_36.x = as_type<float>(_218);
        out.m_36.y = as_type<float>(_224);
        out.m_36.z = as_type<float>(_230);
        out.m_36.w = as_type<float>(_194);
        return out;
    }
    discard_fragment();
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
    float2 _264 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_264, float2(0.0), isnan(_264))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_264, float2(0.0), isnan(_264))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _79 = precise::clamp(_77, 0.0, 1.0);
    float _81 = precise::max(_75, _79);
    float _83 = precise::max(_81, _71);
    bool _87 = _83 != 0.0;
    bool _89 = isnan(_83);
    bool _91 = _87 || _89;
    bool _93 = isnan(0.0);
    bool _95 = _91 || _93;
    float _97 = _79;
    float _99 = _71;
    float _101 = (*spvDescriptorSet0.fp_c3)._m0[4].y;
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
    if (_95)
    {
        float _113 = fma(_83, _111, 1.0);
        _99 = _113;
    }
    float _115 = _99;
    float _117 = _115;
    if (_95)
    {
        float _119 = log2(_115);
        _117 = _119;
    }
    float _121 = _117;
    float _123 = _121;
    if (_95)
    {
        float _125 = _121 + (-1.0);
        _101 = _125;
    }
    float _127 = _101;
    float _129 = _59;
    float _131 = _61;
    float _133 = 0.0;
    if (_95)
    {
        float2 _372 = float2(_59, _61);
        float3 _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_372, float2(0.0), isnan(_372)), level(_127)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_372, float2(0.0), isnan(_372)), level(_127)).xyz;
        float _139 = _137.x;
        float _141 = _137.y;
        float _143 = _137.z;
        _129 = _139;
        _131 = _141;
        _133 = _143;
    }
    float _145 = _129;
    float _147 = _131;
    float _149 = _133;
    float _151 = in.m_33.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_33.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    if (_95)
    {
        float _163 = 0.0 + _121;
        float _165 = precise::clamp(_163, 0.0, 1.0);
        _123 = _165;
    }
    float _167 = _123;
    float _169 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = precise::min(_171, _175);
    float _179 = _57 * _155;
    float _181 = _57 * _161;
    int _184 = 0;
    float _186 = _175;
    float _188 = _179;
    float _190 = _181;
    if (_95)
    {
        float _192 = fma(_181, _167, _179);
        _184 = as_type<int>(_192);
    }
    int _194 = _184;
    if (_95)
    {
        float _196 = -_145;
        float _198 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].x, _196);
        _186 = _198;
    }
    float _200 = _186;
    if (_95)
    {
        float _202 = -_147;
        float _204 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].y, _202);
        _188 = _204;
    }
    float _206 = _188;
    if (_95)
    {
        float _208 = -_149;
        float _210 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].z, _208);
        _190 = _210;
    }
    float _212 = _190;
    int _214 = 0;
    if (_95)
    {
        float _216 = fma(_177, _200, _145);
        _214 = as_type<int>(_216);
    }
    int _218 = _214;
    int _220 = 0;
    if (_95)
    {
        float _222 = fma(_177, _206, _147);
        _220 = as_type<int>(_222);
    }
    int _224 = _220;
    int _226 = 0;
    if (_95)
    {
        float _228 = fma(_177, _212, _149);
        _226 = as_type<int>(_228);
    }
    int _230 = _226;
    if (_95)
    {
        out.m_36.x = as_type<float>(_218);
        out.m_36.y = as_type<float>(_224);
        out.m_36.z = as_type<float>(_230);
        out.m_36.w = as_type<float>(_194);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

