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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
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
    float2 _260 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _77 = precise::clamp(_75, 0.0, 1.0);
    float _79 = _57 * _73;
    float _81 = precise::max(_77, _79);
    bool _83 = _81 != 0.0;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    float _93 = _79;
    if (_91)
    {
        _93 = 1.0;
    }
    float _95 = _93;
    float _97 = _95;
    if (_91)
    {
        float _99 = -_95;
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _97 = _101;
    }
    float _103 = _97;
    float _105 = 0.0;
    if (_91)
    {
        float _107 = fma(_81, _103, 1.0);
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _109;
    if (_91)
    {
        float _113 = log2(_109);
        _111 = _113;
    }
    float _115 = _111;
    float _117 = 0.0;
    float _119 = _115;
    if (_91)
    {
        float _121 = _115 + (-1.0);
        _117 = _121;
    }
    float _123 = _117;
    float _125 = _59;
    float _127 = _61;
    float _129 = 0.0;
    if (_91)
    {
        float2 _369 = float2(_59, _61);
        float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_369, float2(0.0), isnan(_369)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_369, float2(0.0), isnan(_369)), level(_123)).xyz;
        float _135 = _133.x;
        float _137 = _133.y;
        float _139 = _133.z;
        _125 = _135;
        _127 = _137;
        _129 = _139;
    }
    float _141 = _125;
    float _143 = _127;
    float _145 = _129;
    float _147 = in.m_36.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_36.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    if (_91)
    {
        float _159 = 0.0 + _115;
        float _161 = precise::clamp(_159, 0.0, 1.0);
        _119 = _161;
    }
    float _163 = _119;
    float _165 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = precise::min(_167, _171);
    float _175 = _57 * _151;
    float _177 = _57 * _157;
    int _180 = 0;
    float _182 = _171;
    float _184 = _175;
    float _186 = _177;
    if (_91)
    {
        float _188 = fma(_177, _163, _175);
        _180 = as_type<int>(_188);
    }
    int _190 = _180;
    if (_91)
    {
        float _192 = -_141;
        float _194 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
        _182 = _194;
    }
    float _196 = _182;
    if (_91)
    {
        float _198 = -_143;
        float _200 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].y, _198);
        _184 = _200;
    }
    float _202 = _184;
    if (_91)
    {
        float _204 = -_145;
        float _206 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].z, _204);
        _186 = _206;
    }
    float _208 = _186;
    int _210 = 0;
    if (_91)
    {
        float _212 = fma(_173, _196, _141);
        _210 = as_type<int>(_212);
    }
    int _214 = _210;
    int _216 = 0;
    if (_91)
    {
        float _218 = fma(_173, _202, _143);
        _216 = as_type<int>(_218);
    }
    int _220 = _216;
    int _222 = 0;
    if (_91)
    {
        float _224 = fma(_173, _208, _145);
        _222 = as_type<int>(_224);
    }
    int _226 = _222;
    if (_91)
    {
        out.m_34.x = as_type<float>(_214);
        out.m_34.y = as_type<float>(_220);
        out.m_34.z = as_type<float>(_226);
        out.m_34.w = as_type<float>(_190);
        return out;
    }
    discard_fragment();
    return out;
}


struct main0_out_u
{
    uint4 m_34 [[color(0)]];
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
    float2 _260 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_260, float2(0.0), isnan(_260))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_260, float2(0.0), isnan(_260))).x;
    bool _67 = _63 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_67)
    {
        discard_fragment();
    }
    if (_67)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _69 = in.m_36.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _77 = precise::clamp(_75, 0.0, 1.0);
    float _79 = _57 * _73;
    float _81 = precise::max(_77, _79);
    bool _83 = _81 != 0.0;
    bool _85 = isnan(_81);
    bool _87 = _83 || _85;
    bool _89 = isnan(0.0);
    bool _91 = _87 || _89;
    float _93 = _79;
    if (_91)
    {
        _93 = 1.0;
    }
    float _95 = _93;
    float _97 = _95;
    if (_91)
    {
        float _99 = -_95;
        float _101 = _99 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _97 = _101;
    }
    float _103 = _97;
    float _105 = 0.0;
    if (_91)
    {
        float _107 = fma(_81, _103, 1.0);
        _105 = _107;
    }
    float _109 = _105;
    float _111 = _109;
    if (_91)
    {
        float _113 = log2(_109);
        _111 = _113;
    }
    float _115 = _111;
    float _117 = 0.0;
    float _119 = _115;
    if (_91)
    {
        float _121 = _115 + (-1.0);
        _117 = _121;
    }
    float _123 = _117;
    float _125 = _59;
    float _127 = _61;
    float _129 = 0.0;
    if (_91)
    {
        float2 _369 = float2(_59, _61);
        float3 _133 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_369, float2(0.0), isnan(_369)), level(_123)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_369, float2(0.0), isnan(_369)), level(_123)).xyz;
        float _135 = _133.x;
        float _137 = _133.y;
        float _139 = _133.z;
        _125 = _135;
        _127 = _137;
        _129 = _139;
    }
    float _141 = _125;
    float _143 = _127;
    float _145 = _129;
    float _147 = in.m_36.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_36.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    if (_91)
    {
        float _159 = 0.0 + _115;
        float _161 = precise::clamp(_159, 0.0, 1.0);
        _119 = _161;
    }
    float _163 = _119;
    float _165 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = fma(_63, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = precise::min(_167, _171);
    float _175 = _57 * _151;
    float _177 = _57 * _157;
    int _180 = 0;
    float _182 = _171;
    float _184 = _175;
    float _186 = _177;
    if (_91)
    {
        float _188 = fma(_177, _163, _175);
        _180 = as_type<int>(_188);
    }
    int _190 = _180;
    if (_91)
    {
        float _192 = -_141;
        float _194 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
        _182 = _194;
    }
    float _196 = _182;
    if (_91)
    {
        float _198 = -_143;
        float _200 = fma(_143, (*spvDescriptorSet0.fp_c3)._m0[13].y, _198);
        _184 = _200;
    }
    float _202 = _184;
    if (_91)
    {
        float _204 = -_145;
        float _206 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[13].z, _204);
        _186 = _206;
    }
    float _208 = _186;
    int _210 = 0;
    if (_91)
    {
        float _212 = fma(_173, _196, _141);
        _210 = as_type<int>(_212);
    }
    int _214 = _210;
    int _216 = 0;
    if (_91)
    {
        float _218 = fma(_173, _202, _143);
        _216 = as_type<int>(_218);
    }
    int _220 = _216;
    int _222 = 0;
    if (_91)
    {
        float _224 = fma(_173, _208, _145);
        _222 = as_type<int>(_224);
    }
    int _226 = _222;
    if (_91)
    {
        out.m_34.x = as_type<float>(_214);
        out.m_34.y = as_type<float>(_220);
        out.m_34.z = as_type<float>(_226);
        out.m_34.w = as_type<float>(_190);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

