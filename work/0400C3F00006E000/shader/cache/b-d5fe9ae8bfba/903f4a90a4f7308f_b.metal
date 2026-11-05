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
    float2 _270 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_81, _85);
    float _89 = precise::max(_87, _71);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    float _103 = _85;
    float _105 = _71;
    if (_101)
    {
        _103 = 1.0;
    }
    float _107 = _103;
    float _109 = _107;
    if (_101)
    {
        float _111 = -_107;
        float _113 = _111 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _109 = _113;
    }
    float _115 = _109;
    if (_101)
    {
        float _117 = fma(_89, _115, 1.0);
        _105 = _117;
    }
    float _119 = _105;
    float _121 = _119;
    if (_101)
    {
        float _123 = log2(_119);
        _121 = _123;
    }
    float _125 = _121;
    float _127 = 0.0;
    float _129 = _125;
    if (_101)
    {
        float _131 = _125 + (-1.0);
        _127 = _131;
    }
    float _133 = _127;
    float _135 = _59;
    float _137 = _61;
    float _139 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_101)
    {
        float2 _389 = float2(_59, _61);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389)), level(_133)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        _135 = _145;
        _137 = _147;
        _139 = _149;
    }
    float _151 = _135;
    float _153 = _137;
    float _155 = _139;
    float _157 = in.m_33.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_33.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    if (_101)
    {
        float _169 = 0.0 + _125;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        _129 = _171;
    }
    float _173 = _129;
    float _175 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = precise::min(_177, _181);
    float _185 = _57 * _161;
    float _187 = _57 * _167;
    int _190 = 0;
    float _192 = _177;
    float _194 = _185;
    float _196 = _187;
    if (_101)
    {
        float _198 = fma(_187, _173, _185);
        _190 = as_type<int>(_198);
    }
    int _200 = _190;
    if (_101)
    {
        float _202 = -_151;
        float _204 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[13].x, _202);
        _192 = _204;
    }
    float _206 = _192;
    if (_101)
    {
        float _208 = -_153;
        float _210 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].y, _208);
        _194 = _210;
    }
    float _212 = _194;
    if (_101)
    {
        float _214 = -_155;
        float _216 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[13].z, _214);
        _196 = _216;
    }
    float _218 = _196;
    int _220 = 0;
    if (_101)
    {
        float _222 = fma(_183, _206, _151);
        _220 = as_type<int>(_222);
    }
    int _224 = _220;
    int _226 = 0;
    if (_101)
    {
        float _228 = fma(_183, _212, _153);
        _226 = as_type<int>(_228);
    }
    int _230 = _226;
    int _232 = 0;
    if (_101)
    {
        float _234 = fma(_183, _218, _155);
        _232 = as_type<int>(_234);
    }
    int _236 = _232;
    if (_101)
    {
        out.m_36.x = as_type<float>(_224);
        out.m_36.y = as_type<float>(_230);
        out.m_36.z = as_type<float>(_236);
        out.m_36.w = as_type<float>(_200);
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
    float2 _270 = float2(_59, _61);
    float _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).x;
    float _65 = in.m_33.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = _57 * _69;
    float _73 = -_63;
    float _75 = fma(_73, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _77 = 1.0 / _75;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _81 = precise::clamp(_79, 0.0, 1.0);
    float _83 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_81, _85);
    float _89 = precise::max(_87, _71);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    float _103 = _85;
    float _105 = _71;
    if (_101)
    {
        _103 = 1.0;
    }
    float _107 = _103;
    float _109 = _107;
    if (_101)
    {
        float _111 = -_107;
        float _113 = _111 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _109 = _113;
    }
    float _115 = _109;
    if (_101)
    {
        float _117 = fma(_89, _115, 1.0);
        _105 = _117;
    }
    float _119 = _105;
    float _121 = _119;
    if (_101)
    {
        float _123 = log2(_119);
        _121 = _123;
    }
    float _125 = _121;
    float _127 = 0.0;
    float _129 = _125;
    if (_101)
    {
        float _131 = _125 + (-1.0);
        _127 = _131;
    }
    float _133 = _127;
    float _135 = _59;
    float _137 = _61;
    float _139 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_101)
    {
        float2 _389 = float2(_59, _61);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_389, float2(0.0), isnan(_389)), level(_133)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_389, float2(0.0), isnan(_389)), level(_133)).xyz;
        float _145 = _143.x;
        float _147 = _143.y;
        float _149 = _143.z;
        _135 = _145;
        _137 = _147;
        _139 = _149;
    }
    float _151 = _135;
    float _153 = _137;
    float _155 = _139;
    float _157 = in.m_33.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_33.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    if (_101)
    {
        float _169 = 0.0 + _125;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        _129 = _171;
    }
    float _173 = _129;
    float _175 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = precise::min(_177, _181);
    float _185 = _57 * _161;
    float _187 = _57 * _167;
    int _190 = 0;
    float _192 = _177;
    float _194 = _185;
    float _196 = _187;
    if (_101)
    {
        float _198 = fma(_187, _173, _185);
        _190 = as_type<int>(_198);
    }
    int _200 = _190;
    if (_101)
    {
        float _202 = -_151;
        float _204 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[13].x, _202);
        _192 = _204;
    }
    float _206 = _192;
    if (_101)
    {
        float _208 = -_153;
        float _210 = fma(_153, (*spvDescriptorSet0.fp_c3)._m0[13].y, _208);
        _194 = _210;
    }
    float _212 = _194;
    if (_101)
    {
        float _214 = -_155;
        float _216 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[13].z, _214);
        _196 = _216;
    }
    float _218 = _196;
    int _220 = 0;
    if (_101)
    {
        float _222 = fma(_183, _206, _151);
        _220 = as_type<int>(_222);
    }
    int _224 = _220;
    int _226 = 0;
    if (_101)
    {
        float _228 = fma(_183, _212, _153);
        _226 = as_type<int>(_228);
    }
    int _230 = _226;
    int _232 = 0;
    if (_101)
    {
        float _234 = fma(_183, _218, _155);
        _232 = as_type<int>(_234);
    }
    int _236 = _232;
    if (_101)
    {
        out.m_36.x = as_type<float>(_224);
        out.m_36.y = as_type<float>(_230);
        out.m_36.z = as_type<float>(_236);
        out.m_36.w = as_type<float>(_200);
        return main0_out_u{as_type<uint4>(out.m_36)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_36)};
}

