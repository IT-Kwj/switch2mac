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
    float2 _266 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_266, float2(0.0), isnan(_266))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_266, float2(0.0), isnan(_266))).x;
    float _65 = -_63;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _69 = 1.0 / _67;
    bool _73 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _75 = (*spvDescriptorSet0.fp_c3)._m0[6].y;
    if (_73)
    {
        discard_fragment();
    }
    if (_73)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _77 = in.m_36.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = _57 * _81;
    float _89 = precise::max(_85, _87);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = _87;
    float _103 = _81;
    if (_99)
    {
        _101 = 1.0;
    }
    float _105 = _101;
    float _107 = _105;
    if (_99)
    {
        float _109 = -_105;
        float _111 = _109 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _107 = _111;
    }
    float _113 = _107;
    if (_99)
    {
        float _115 = fma(_89, _113, 1.0);
        _103 = _115;
    }
    float _117 = _103;
    float _119 = _117;
    if (_99)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _123;
    if (_99)
    {
        float _127 = _123 + (-1.0);
        _75 = _127;
    }
    float _129 = _75;
    float _131 = _59;
    float _133 = _61;
    float _135 = 0.0;
    if (_99)
    {
        float2 _389 = float2(_59, _61);
        float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389)), level(_129)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389)), level(_129)).xyz;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        _131 = _141;
        _133 = _143;
        _135 = _145;
    }
    float _147 = _131;
    float _149 = _133;
    float _151 = _135;
    float _153 = in.m_36.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_36.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    if (_99)
    {
        float _165 = 0.0 + _123;
        float _167 = precise::clamp(_165, 0.0, 1.0);
        _125 = _167;
    }
    float _169 = _125;
    float _171 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = precise::min(_173, _177);
    float _181 = _57 * _157;
    float _183 = _57 * _163;
    int _186 = 0;
    float _188 = _173;
    float _190 = _181;
    float _192 = _183;
    if (_99)
    {
        float _194 = fma(_183, _169, _181);
        _186 = as_type<int>(_194);
    }
    int _196 = _186;
    if (_99)
    {
        float _198 = -_147;
        float _200 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
        _188 = _200;
    }
    float _202 = _188;
    if (_99)
    {
        float _204 = -_149;
        float _206 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].y, _204);
        _190 = _206;
    }
    float _208 = _190;
    if (_99)
    {
        float _210 = -_151;
        float _212 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[13].z, _210);
        _192 = _212;
    }
    float _214 = _192;
    int _216 = 0;
    if (_99)
    {
        float _218 = fma(_179, _202, _147);
        _216 = as_type<int>(_218);
    }
    int _220 = _216;
    int _222 = 0;
    if (_99)
    {
        float _224 = fma(_179, _208, _149);
        _222 = as_type<int>(_224);
    }
    int _226 = _222;
    int _228 = 0;
    if (_99)
    {
        float _230 = fma(_179, _214, _151);
        _228 = as_type<int>(_230);
    }
    int _232 = _228;
    if (_99)
    {
        out.m_34.x = as_type<float>(_220);
        out.m_34.y = as_type<float>(_226);
        out.m_34.z = as_type<float>(_232);
        out.m_34.w = as_type<float>(_196);
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
    float2 _266 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_266, float2(0.0), isnan(_266))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_266, float2(0.0), isnan(_266))).x;
    float _65 = -_63;
    float _67 = fma(_65, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _69 = 1.0 / _67;
    bool _73 = _69 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    float _75 = (*spvDescriptorSet0.fp_c3)._m0[6].y;
    if (_73)
    {
        discard_fragment();
    }
    if (_73)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    float _77 = in.m_36.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = _57 * _81;
    float _89 = precise::max(_85, _87);
    bool _91 = _89 != 0.0;
    bool _93 = isnan(_89);
    bool _95 = _91 || _93;
    bool _97 = isnan(0.0);
    bool _99 = _95 || _97;
    float _101 = _87;
    float _103 = _81;
    if (_99)
    {
        _101 = 1.0;
    }
    float _105 = _101;
    float _107 = _105;
    if (_99)
    {
        float _109 = -_105;
        float _111 = _109 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _107 = _111;
    }
    float _113 = _107;
    if (_99)
    {
        float _115 = fma(_89, _113, 1.0);
        _103 = _115;
    }
    float _117 = _103;
    float _119 = _117;
    if (_99)
    {
        float _121 = log2(_117);
        _119 = _121;
    }
    float _123 = _119;
    float _125 = _123;
    if (_99)
    {
        float _127 = _123 + (-1.0);
        _75 = _127;
    }
    float _129 = _75;
    float _131 = _59;
    float _133 = _61;
    float _135 = 0.0;
    if (_99)
    {
        float2 _389 = float2(_59, _61);
        float3 _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389)), level(_129)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389)), level(_129)).xyz;
        float _141 = _139.x;
        float _143 = _139.y;
        float _145 = _139.z;
        _131 = _141;
        _133 = _143;
        _135 = _145;
    }
    float _147 = _131;
    float _149 = _133;
    float _151 = _135;
    float _153 = in.m_36.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_36.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    if (_99)
    {
        float _165 = 0.0 + _123;
        float _167 = precise::clamp(_165, 0.0, 1.0);
        _125 = _167;
    }
    float _169 = _125;
    float _171 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = fma(_69, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = precise::min(_173, _177);
    float _181 = _57 * _157;
    float _183 = _57 * _163;
    int _186 = 0;
    float _188 = _173;
    float _190 = _181;
    float _192 = _183;
    if (_99)
    {
        float _194 = fma(_183, _169, _181);
        _186 = as_type<int>(_194);
    }
    int _196 = _186;
    if (_99)
    {
        float _198 = -_147;
        float _200 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
        _188 = _200;
    }
    float _202 = _188;
    if (_99)
    {
        float _204 = -_149;
        float _206 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[13].y, _204);
        _190 = _206;
    }
    float _208 = _190;
    if (_99)
    {
        float _210 = -_151;
        float _212 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[13].z, _210);
        _192 = _212;
    }
    float _214 = _192;
    int _216 = 0;
    if (_99)
    {
        float _218 = fma(_179, _202, _147);
        _216 = as_type<int>(_218);
    }
    int _220 = _216;
    int _222 = 0;
    if (_99)
    {
        float _224 = fma(_179, _208, _149);
        _222 = as_type<int>(_224);
    }
    int _226 = _222;
    int _228 = 0;
    if (_99)
    {
        float _230 = fma(_179, _214, _151);
        _228 = as_type<int>(_230);
    }
    int _232 = _228;
    if (_99)
    {
        out.m_34.x = as_type<float>(_220);
        out.m_34.y = as_type<float>(_226);
        out.m_34.z = as_type<float>(_232);
        out.m_34.w = as_type<float>(_196);
        return main0_out_u{as_type<uint4>(out.m_34)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_34)};
}

