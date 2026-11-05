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
    float2 _344 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _361 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _377 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _392 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _407 = float2(_71, _73);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _119 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _125 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _119);
    float _129 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _131 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float _133 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _125);
    float _135 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _137 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _139 = _113 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _141 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float _143 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[2].x, _139);
    float _145 = precise::min(_137, _133);
    float _147 = precise::min(_135, _141);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].z, _143);
    float _151 = precise::max(_137, _133);
    float _153 = precise::max(_135, _141);
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
    int _178 = as_type<int>(_169);
    int _180 = as_type<int>(_163);
    int _182 = as_type<int>(_147);
    if (!_173)
    {
        _176 = 0;
        _178 = 0;
    }
    int _184 = _176;
    int _186 = _178;
    if (!_173)
    {
        _180 = 0;
        _182 = 0;
    }
    int _188 = _180;
    int _190 = _182;
    if (!_173)
    {
        out.m_32.x = as_type<float>(_184);
        out.m_32.y = as_type<float>(_186);
        out.m_32.z = as_type<float>(_188);
        out.m_32.w = as_type<float>(_190);
        return out;
    }
    float _192 = _137 + _135;
    float _194 = -_135;
    float _196 = _194 + _133;
    float _198 = -_137;
    float _200 = _198 + _141;
    float _202 = _133 + _192;
    float _204 = _196 + _200;
    float _206 = -_200;
    float _208 = _196 + _206;
    float _210 = _141 + _202;
    float _212 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _214 = abs(_204);
    float _216 = abs(_208);
    float _218 = precise::min(_214, _216);
    float _220 = fma(_210, _212, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _222 = precise::max(_220, _218);
    float _224 = 1.0 / _222;
    float _226 = _204 * _224;
    float _228 = _208 * _224;
    float _230 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _232 = precise::max(_226, _230);
    float _234 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _236 = precise::max(_228, _234);
    float _238 = precise::min(_232, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _240 = precise::min(_236, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _242 = -_238;
    float _244 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _246 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _248 = -_240;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float2 _669 = float2(_244, _250);
    float4 _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_669, float2(0.0), isnan(_669))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_669, float2(0.0), isnan(_669))).xyzw;
    float _257 = _255.x;
    float _259 = _255.y;
    float _261 = _255.z;
    float _263 = _255.w;
    float2 _685 = float2(_246, _252);
    float4 _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_685, float2(0.0), isnan(_685))).xyzw;
    float _267 = _265.x;
    float _269 = _265.y;
    float _271 = _265.z;
    float _273 = _265.w;
    float _275 = _257 + _267;
    float _277 = _259 + _269;
    float _279 = _261 + _271;
    float _281 = _263 + _273;
    float _283 = _275 * 0.5;
    float _285 = _277 * 0.5;
    float _287 = _279 * 0.5;
    float _289 = _281 * 0.5;
    out.m_32.x = _283;
    out.m_32.y = _285;
    out.m_32.z = _287;
    out.m_32.w = _289;
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
    float2 _344 = float2(_67, _69);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_344, float2(0.0), isnan(_344))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_344, float2(0.0), isnan(_344))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float2 _361 = float2(_67, _69);
    float3 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_361, float2(0.0), isnan(_361)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_361, float2(0.0), isnan(_361)), int2(0, 1)).xyz;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float2 _377 = float2(_67, _69);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_377, float2(0.0), isnan(_377)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_377, float2(0.0), isnan(_377)), int2(1, 0)).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _392 = float2(_67, _69);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_392, float2(0.0), isnan(_392)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_392, float2(0.0), isnan(_392)), int2(1)).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _407 = float2(_71, _73);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_407, float2(0.0), isnan(_407))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_407, float2(0.0), isnan(_407))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = _89 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _119 = _97 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _81 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = _105 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _125 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[2].x, _117);
    float _127 = fma(_95, (*spvDescriptorSet0.fp_c3)._m0[2].x, _119);
    float _129 = fma(_79, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _131 = fma(_103, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float _133 = fma(_91, (*spvDescriptorSet0.fp_c3)._m0[2].z, _125);
    float _135 = fma(_99, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _137 = fma(_83, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _139 = _113 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _141 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float _143 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[2].x, _139);
    float _145 = precise::min(_137, _133);
    float _147 = precise::min(_135, _141);
    float _149 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[2].z, _143);
    float _151 = precise::max(_137, _133);
    float _153 = precise::max(_135, _141);
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
    int _178 = as_type<int>(_169);
    int _180 = as_type<int>(_163);
    int _182 = as_type<int>(_147);
    if (!_173)
    {
        _176 = 0;
        _178 = 0;
    }
    int _184 = _176;
    int _186 = _178;
    if (!_173)
    {
        _180 = 0;
        _182 = 0;
    }
    int _188 = _180;
    int _190 = _182;
    if (!_173)
    {
        out.m_32.x = as_type<float>(_184);
        out.m_32.y = as_type<float>(_186);
        out.m_32.z = as_type<float>(_188);
        out.m_32.w = as_type<float>(_190);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _192 = _137 + _135;
    float _194 = -_135;
    float _196 = _194 + _133;
    float _198 = -_137;
    float _200 = _198 + _141;
    float _202 = _133 + _192;
    float _204 = _196 + _200;
    float _206 = -_200;
    float _208 = _196 + _206;
    float _210 = _141 + _202;
    float _212 = (*spvDescriptorSet0.fp_c3)._m0[4].z * 0.25;
    float _214 = abs(_204);
    float _216 = abs(_208);
    float _218 = precise::min(_214, _216);
    float _220 = fma(_210, _212, (*spvDescriptorSet0.fp_c3)._m0[4].w);
    float _222 = precise::max(_220, _218);
    float _224 = 1.0 / _222;
    float _226 = _204 * _224;
    float _228 = _208 * _224;
    float _230 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _232 = precise::max(_226, _230);
    float _234 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _236 = precise::max(_228, _234);
    float _238 = precise::min(_232, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _240 = precise::min(_236, (*spvDescriptorSet0.fp_c3)._m0[4].y);
    float _242 = -_238;
    float _244 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _246 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[1].x, _71);
    float _248 = -_240;
    float _250 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].y, _73);
    float2 _669 = float2(_244, _250);
    float4 _255 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_669, float2(0.0), isnan(_669))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_669, float2(0.0), isnan(_669))).xyzw;
    float _257 = _255.x;
    float _259 = _255.y;
    float _261 = _255.z;
    float _263 = _255.w;
    float2 _685 = float2(_246, _252);
    float4 _265 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_685, float2(0.0), isnan(_685))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_685, float2(0.0), isnan(_685))).xyzw;
    float _267 = _265.x;
    float _269 = _265.y;
    float _271 = _265.z;
    float _273 = _265.w;
    float _275 = _257 + _267;
    float _277 = _259 + _269;
    float _279 = _261 + _271;
    float _281 = _263 + _273;
    float _283 = _275 * 0.5;
    float _285 = _277 * 0.5;
    float _287 = _279 * 0.5;
    float _289 = _281 * 0.5;
    out.m_32.x = _283;
    out.m_32.y = _285;
    out.m_32.z = _287;
    out.m_32.w = _289;
    return main0_out_u{as_type<uint4>(out.m_32)};
}

