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
    float2 _270 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).x;
    float2 _281 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_281, float2(0.0), isnan(_281))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = _59 * _73;
    float _77 = -_65;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _81 = 1.0 / _79;
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_67, _85);
    float _89 = precise::max(_87, _75);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    float _103 = _85;
    float _105 = _73;
    float _107 = _75;
    if (_101)
    {
        _103 = 1.0;
    }
    float _109 = _103;
    float _111 = _109;
    if (_101)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    if (_101)
    {
        float _119 = fma(_89, _117, 1.0);
        _105 = _119;
    }
    float _121 = _105;
    float _123 = _121;
    if (_101)
    {
        float _125 = log2(_121);
        _123 = _125;
    }
    float _127 = _123;
    float _129 = _127;
    if (_101)
    {
        float _131 = _127 + (-1.0);
        _107 = _131;
    }
    float _133 = _107;
    float _135 = _61;
    float _137 = _63;
    float _139 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_101)
    {
        float2 _390 = float2(_61, _63);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_390, float2(0.0), isnan(_390)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_390, float2(0.0), isnan(_390)), level(_133)).xyz;
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
    float _157 = in.m_35.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_35.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    if (_101)
    {
        float _169 = 0.0 + _127;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        _129 = _171;
    }
    float _173 = _129;
    float _175 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = precise::min(_177, _181);
    float _185 = _59 * _161;
    float _187 = _59 * _167;
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
        out.m_38.x = as_type<float>(_224);
        out.m_38.y = as_type<float>(_230);
        out.m_38.z = as_type<float>(_236);
        out.m_38.w = as_type<float>(_200);
        return out;
    }
    discard_fragment();
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
    float2 _270 = float2(_61, _63);
    float _65 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_270, float2(0.0), isnan(_270))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_270, float2(0.0), isnan(_270))).x;
    float2 _281 = float2(_61, _63);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_281, float2(0.0), isnan(_281))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_281, float2(0.0), isnan(_281))).x;
    float _69 = in.m_35.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = _59 * _73;
    float _77 = -_65;
    float _79 = fma(_77, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _81 = 1.0 / _79;
    float _83 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _85 = precise::clamp(_83, 0.0, 1.0);
    float _87 = precise::max(_67, _85);
    float _89 = precise::max(_87, _75);
    bool _93 = _89 != 0.0;
    bool _95 = isnan(_89);
    bool _97 = _93 || _95;
    bool _99 = isnan(0.0);
    bool _101 = _97 || _99;
    float _103 = _85;
    float _105 = _73;
    float _107 = _75;
    if (_101)
    {
        _103 = 1.0;
    }
    float _109 = _103;
    float _111 = _109;
    if (_101)
    {
        float _113 = -_109;
        float _115 = _113 + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        _111 = _115;
    }
    float _117 = _111;
    if (_101)
    {
        float _119 = fma(_89, _117, 1.0);
        _105 = _119;
    }
    float _121 = _105;
    float _123 = _121;
    if (_101)
    {
        float _125 = log2(_121);
        _123 = _125;
    }
    float _127 = _123;
    float _129 = _127;
    if (_101)
    {
        float _131 = _127 + (-1.0);
        _107 = _131;
    }
    float _133 = _107;
    float _135 = _61;
    float _137 = _63;
    float _139 = (*spvDescriptorSet0.fp_c3)._m0[4].x;
    if (_101)
    {
        float2 _390 = float2(_61, _63);
        float3 _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_390, float2(0.0), isnan(_390)), level(_133)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_390, float2(0.0), isnan(_390)), level(_133)).xyz;
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
    float _157 = in.m_35.x;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_35.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    if (_101)
    {
        float _169 = 0.0 + _127;
        float _171 = precise::clamp(_169, 0.0, 1.0);
        _129 = _171;
    }
    float _173 = _129;
    float _175 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = precise::min(_177, _181);
    float _185 = _59 * _161;
    float _187 = _59 * _167;
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
        out.m_38.x = as_type<float>(_224);
        out.m_38.y = as_type<float>(_230);
        out.m_38.z = as_type<float>(_236);
        out.m_38.w = as_type<float>(_200);
        return main0_out_u{as_type<uint4>(out.m_38)};
    }
    discard_fragment();
    return main0_out_u{as_type<uint4>(out.m_38)};
}

