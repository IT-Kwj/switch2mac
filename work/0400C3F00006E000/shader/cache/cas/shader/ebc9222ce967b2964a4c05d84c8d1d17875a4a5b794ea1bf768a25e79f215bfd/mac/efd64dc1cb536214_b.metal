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
    float2 _258 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_258, float2(0.0), isnan(_258))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_258, float2(0.0), isnan(_258))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = precise::max(_75, _71);
    bool _81 = _77 != 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _71;
    if (_89)
    {
        _91 = 1.0;
    }
    float _93 = _91;
    float _95 = _93;
    if (_89)
    {
        float _97 = -_93;
        float _99 = _97 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _95 = _99;
    }
    float _101 = _95;
    float _103 = 0.0;
    if (_89)
    {
        float _105 = fma(_77, _101, 1.0);
        _103 = _105;
    }
    float _107 = _103;
    float _109 = _107;
    if (_89)
    {
        float _111 = log2(_107);
        _109 = _111;
    }
    float _113 = _109;
    float _115 = 0.0;
    float _117 = _113;
    if (_89)
    {
        float _119 = _113 + (-1.0);
        _115 = _119;
    }
    float _121 = _115;
    float _123 = _59;
    float _125 = _61;
    float _127 = 0.0;
    if (_89)
    {
        float2 _352 = float2(_59, _61);
        float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_352, float2(0.0), isnan(_352)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_352, float2(0.0), isnan(_352)), level(_121)).xyz;
        float _133 = _131.x;
        float _135 = _131.y;
        float _137 = _131.z;
        _123 = _133;
        _125 = _135;
        _127 = _137;
    }
    float _139 = _123;
    float _141 = _125;
    float _143 = _127;
    float _145 = in.m_33.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_33.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    if (_89)
    {
        float _157 = 0.0 + _113;
        float _159 = precise::clamp(_157, 0.0, 1.0);
        _117 = _159;
    }
    float _161 = _117;
    float _163 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = precise::min(_165, _169);
    float _173 = _57 * _149;
    float _175 = _57 * _155;
    int _178 = 0;
    float _180 = _169;
    float _182 = _173;
    float _184 = _175;
    if (_89)
    {
        float _186 = fma(_175, _161, _173);
        _178 = as_type<int>(_186);
    }
    int _188 = _178;
    if (_89)
    {
        float _190 = -_139;
        float _192 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].x, _190);
        _180 = _192;
    }
    float _194 = _180;
    if (_89)
    {
        float _196 = -_141;
        float _198 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].y, _196);
        _182 = _198;
    }
    float _200 = _182;
    if (_89)
    {
        float _202 = -_143;
        float _204 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _202);
        _184 = _204;
    }
    float _206 = _184;
    int _208 = 0;
    if (_89)
    {
        float _210 = fma(_171, _194, _139);
        _208 = as_type<int>(_210);
    }
    int _212 = _208;
    int _214 = 0;
    if (_89)
    {
        float _216 = fma(_171, _200, _141);
        _214 = as_type<int>(_216);
    }
    int _218 = _214;
    int _220 = 0;
    if (_89)
    {
        float _222 = fma(_171, _206, _143);
        _220 = as_type<int>(_222);
    }
    int _224 = _220;
    if (_89)
    {
        out.m_36.x = as_type<float>(_212);
        out.m_36.y = as_type<float>(_218);
        out.m_36.z = as_type<float>(_224);
        out.m_36.w = as_type<float>(_188);
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
    float2 _258 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_258, float2(0.0), isnan(_258))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_258, float2(0.0), isnan(_258))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _75 = precise::clamp(_73, 0.0, 1.0);
    float _77 = precise::max(_75, _71);
    bool _81 = _77 != 0.0;
    bool _83 = isnan(_77);
    bool _85 = _81 || _83;
    bool _87 = isnan(0.0);
    bool _89 = _85 || _87;
    float _91 = _71;
    if (_89)
    {
        _91 = 1.0;
    }
    float _93 = _91;
    float _95 = _93;
    if (_89)
    {
        float _97 = -_93;
        float _99 = _97 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _95 = _99;
    }
    float _101 = _95;
    float _103 = 0.0;
    if (_89)
    {
        float _105 = fma(_77, _101, 1.0);
        _103 = _105;
    }
    float _107 = _103;
    float _109 = _107;
    if (_89)
    {
        float _111 = log2(_107);
        _109 = _111;
    }
    float _113 = _109;
    float _115 = 0.0;
    float _117 = _113;
    if (_89)
    {
        float _119 = _113 + (-1.0);
        _115 = _119;
    }
    float _121 = _115;
    float _123 = _59;
    float _125 = _61;
    float _127 = 0.0;
    if (_89)
    {
        float2 _352 = float2(_59, _61);
        float3 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_352, float2(0.0), isnan(_352)), level(_121)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_352, float2(0.0), isnan(_352)), level(_121)).xyz;
        float _133 = _131.x;
        float _135 = _131.y;
        float _137 = _131.z;
        _123 = _133;
        _125 = _135;
        _127 = _137;
    }
    float _139 = _123;
    float _141 = _125;
    float _143 = _127;
    float _145 = in.m_33.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_33.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    if (_89)
    {
        float _157 = 0.0 + _113;
        float _159 = precise::clamp(_157, 0.0, 1.0);
        _117 = _159;
    }
    float _161 = _117;
    float _163 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = precise::min(_165, _169);
    float _173 = _57 * _149;
    float _175 = _57 * _155;
    int _178 = 0;
    float _180 = _169;
    float _182 = _173;
    float _184 = _175;
    if (_89)
    {
        float _186 = fma(_175, _161, _173);
        _178 = as_type<int>(_186);
    }
    int _188 = _178;
    if (_89)
    {
        float _190 = -_139;
        float _192 = fma(_139, (*spvDescriptorSet0.fp_c3)._m0[13].x, _190);
        _180 = _192;
    }
    float _194 = _180;
    if (_89)
    {
        float _196 = -_141;
        float _198 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].y, _196);
        _182 = _198;
    }
    float _200 = _182;
    if (_89)
    {
        float _202 = -_143;
        float _204 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].z, _202);
        _184 = _204;
    }
    float _206 = _184;
    int _208 = 0;
    if (_89)
    {
        float _210 = fma(_171, _194, _139);
        _208 = as_type<int>(_210);
    }
    int _212 = _208;
    int _214 = 0;
    if (_89)
    {
        float _216 = fma(_171, _200, _141);
        _214 = as_type<int>(_216);
    }
    int _218 = _214;
    int _220 = 0;
    if (_89)
    {
        float _222 = fma(_171, _206, _143);
        _220 = as_type<int>(_222);
    }
    int _224 = _220;
    if (_89)
    {
        out.m_36.x = as_type<float>(_212);
        out.m_36.y = as_type<float>(_218);
        out.m_36.z = as_type<float>(_224);
        out.m_36.w = as_type<float>(_188);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

