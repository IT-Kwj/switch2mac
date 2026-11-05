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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = _65 * _63;
    float2 _299 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _316 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _332 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_332, float2(0.0), isnan(_332)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_332, float2(0.0), isnan(_332)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _347 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _362 = float2(_71, _73);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _119 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _125 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _119);
    float _129 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _131 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float _133 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _125);
    float _135 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _137 = _113 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _139 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _141 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float _143 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[2].x, _137);
    float _145 = precise::min(_133, _135);
    float _147 = precise::min(_139, _141);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].z, _143);
    float _151 = precise::max(_133, _135);
    float _153 = precise::max(_139, _141);
    float _155 = precise::min(_145, _147);
    float _157 = precise::max(_151, _153);
    float _159 = precise::min(_149, _155);
    float _161 = precise::max(_149, _157);
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _165 = -_159;
    float _167 = _165 + _161;
    float _169 = precise::max(_163, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _173 = _167 > _169;
    int _176 = as_type<int>(_167);
    if (!_173)
    {
        _176 = 0;
    }
    int _178 = _176;
    bool _180 = !_173;
    int _182 = _178;
    if (!_180)
    {
        float _184 = _133 + _139;
        float _186 = -_139;
        float _188 = _186 + _135;
        float _190 = -_133;
        float _192 = _190 + _141;
        float _194 = _135 + _184;
        float _196 = _188 + _192;
        float _198 = -_192;
        float _200 = _188 + _198;
        float _202 = _141 + _194;
        float _204 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _206 = abs(_196);
        float _208 = abs(_200);
        float _210 = precise::min(_206, _208);
        float _212 = fma(_202, _204, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _214 = precise::max(_212, _210);
        float _216 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _218 = 1.0 / _214;
        float _220 = _200 * _218;
        float _222 = _196 * _218;
        float _224 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _226 = precise::max(_220, _224);
        float _228 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _230 = precise::max(_222, _228);
        float _232 = precise::min(_226, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _234 = precise::min(_230, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _236 = _232 * _232;
        float _238 = fma(_234, _234, _236);
        float _240 = sqrt(_238);
        float _242 = _240 * _216;
        _182 = as_type<int>(_242);
    }
    int _244 = _182;
    out.m_32.x = as_type<float>(_244);
    out.m_32.y = as_type<float>(_244);
    out.m_32.z = as_type<float>(_244);
    out.m_32.w = as_type<float>(_244);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_29.z;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_29.w;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_29.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_29.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _39;
    float _67 = _65 * _45;
    float _69 = _65 * _51;
    float _71 = _65 * _57;
    float _73 = _65 * _63;
    float2 _299 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_299, float2(0.0), isnan(_299))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_299, float2(0.0), isnan(_299))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _316 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_316, float2(0.0), isnan(_316)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_316, float2(0.0), isnan(_316)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _332 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_332, float2(0.0), isnan(_332)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_332, float2(0.0), isnan(_332)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _347 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_347, float2(0.0), isnan(_347)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_347, float2(0.0), isnan(_347)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _362 = float2(_71, _73);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _119 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _125 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _119);
    float _129 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _131 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float _133 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _125);
    float _135 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _137 = _113 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _139 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _141 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float _143 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[2].x, _137);
    float _145 = precise::min(_133, _135);
    float _147 = precise::min(_139, _141);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].z, _143);
    float _151 = precise::max(_133, _135);
    float _153 = precise::max(_139, _141);
    float _155 = precise::min(_145, _147);
    float _157 = precise::max(_151, _153);
    float _159 = precise::min(_149, _155);
    float _161 = precise::max(_149, _157);
    float _163 = _157 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _165 = -_159;
    float _167 = _165 + _161;
    float _169 = precise::max(_163, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _173 = _167 > _169;
    int _176 = as_type<int>(_167);
    if (!_173)
    {
        _176 = 0;
    }
    int _178 = _176;
    bool _180 = !_173;
    int _182 = _178;
    if (!_180)
    {
        float _184 = _133 + _139;
        float _186 = -_139;
        float _188 = _186 + _135;
        float _190 = -_133;
        float _192 = _190 + _141;
        float _194 = _135 + _184;
        float _196 = _188 + _192;
        float _198 = -_192;
        float _200 = _188 + _198;
        float _202 = _141 + _194;
        float _204 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
        float _206 = abs(_196);
        float _208 = abs(_200);
        float _210 = precise::min(_206, _208);
        float _212 = fma(_202, _204, (*spvDescriptorSet0.fp_c3)._m0[4].w);
        float _214 = precise::max(_212, _210);
        float _216 = 1.0 / (*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _218 = 1.0 / _214;
        float _220 = _200 * _218;
        float _222 = _196 * _218;
        float _224 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _226 = precise::max(_220, _224);
        float _228 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _230 = precise::max(_222, _228);
        float _232 = precise::min(_226, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _234 = precise::min(_230, (*spvDescriptorSet0.fp_c3)._m0[4].y);
        float _236 = _232 * _232;
        float _238 = fma(_234, _234, _236);
        float _240 = sqrt(_238);
        float _242 = _240 * _216;
        _182 = as_type<int>(_242);
    }
    int _244 = _182;
    out.m_32.x = as_type<float>(_244);
    out.m_32.y = as_type<float>(_244);
    out.m_32.z = as_type<float>(_244);
    out.m_32.w = as_type<float>(_244);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

