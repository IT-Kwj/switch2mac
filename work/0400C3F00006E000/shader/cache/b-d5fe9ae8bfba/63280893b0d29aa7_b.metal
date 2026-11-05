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
    float4 m_34 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _474 = float2(_69, _71);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _491 = float2(_69, _71);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491)), int2(0, 1)).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _507 = float2(_69, _71);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507)), int2(1, 0)).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _522 = float2(_69, _71);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522)), int2(1)).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _537 = float2(_73, _75);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float2(0.0), isnan(_537))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float _119 = _83 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _91 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = _99 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _125 = _107 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _127 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[2].x, _119);
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _131 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float _133 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].x, _125);
    float _135 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _137 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _139 = _115 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _141 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float _143 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].z, _133);
    float _145 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].x, _139);
    float _147 = precise::min(_135, _137);
    float _149 = precise::min(_141, _143);
    float _151 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[2].z, _145);
    float _153 = precise::max(_135, _137);
    float _155 = precise::max(_141, _143);
    float _157 = precise::min(_147, _149);
    float _159 = precise::max(_153, _155);
    float _161 = precise::min(_151, _157);
    float _163 = precise::max(_151, _159);
    float _165 = _159 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _167 = -_161;
    float _169 = _167 + _163;
    float _171 = precise::max(_165, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _175 = _169 > _171;
    int _178 = as_type<int>(_169);
    int _180 = as_type<int>(_171);
    int _182 = as_type<int>(_165);
    int _184 = as_type<int>(_155);
    if (!_175)
    {
        _178 = 0;
        _180 = 0;
    }
    int _186 = _178;
    int _188 = _180;
    if (!_175)
    {
        _182 = 0;
        _184 = 0;
    }
    int _190 = _182;
    int _192 = _184;
    if (!_175)
    {
        out.m_32.x = as_type<float>(_186);
        out.m_32.y = as_type<float>(_188);
        out.m_32.z = as_type<float>(_190);
        out.m_32.w = as_type<float>(_192);
        return out;
    }
    float _194 = -_141;
    float _196 = _194 + _137;
    float _198 = -_135;
    float _200 = _198 + _143;
    float _202 = in.m_34.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_34.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_34.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = -_200;
    float _222 = _196 + _220;
    float _224 = _196 + _200;
    float _226 = in.m_34.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _222 * _222;
    float _234 = fma(_224, _224, _232);
    float _236 = _234 + 0.00260416674427688121795654296875;
    float _238 = rsqrt(_236);
    float _240 = _67 * _212;
    float _242 = _67 * _206;
    float _244 = _67 * _218;
    float _246 = _224 * _238;
    float _248 = _222 * _238;
    float _250 = _67 * _230;
    float _252 = -_240;
    float _254 = fma(_246, _252, _73);
    float _256 = -_242;
    float _258 = fma(_248, _256, _75);
    float _260 = abs(_246);
    float _262 = abs(_248);
    float _264 = precise::min(_260, _262);
    float _266 = _264 * 2.0;
    float _268 = 1.0 / _266;
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _272 = fma(_246, _240, _73);
    float _274 = _270 * 0.5;
    float _276 = fma(_246, _274, 0.5);
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_248, _274, 0.5);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = fma(_248, _242, _75);
    float _286 = _278 + (-0.5);
    float _288 = _282 + (-0.5);
    float _290 = -_244;
    float _292 = fma(_286, _290, _73);
    float _294 = fma(_286, _244, _73);
    float _296 = -_250;
    float _298 = fma(_288, _296, _75);
    float _300 = fma(_288, _250, _75);
    float2 _851 = float2(_254, _258);
    float4 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_851, float2(0.0), isnan(_851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_851, float2(0.0), isnan(_851))).xyzw;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float _311 = _303.w;
    float2 _867 = float2(_272, _284);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_867, float2(0.0), isnan(_867))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_867, float2(0.0), isnan(_867))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float2 _883 = float2(_292, _298);
    float4 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_883, float2(0.0), isnan(_883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_883, float2(0.0), isnan(_883))).xyzw;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _323.w;
    float2 _899 = float2(_294, _300);
    float4 _333 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_899, float2(0.0), isnan(_899))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_899, float2(0.0), isnan(_899))).xyzw;
    float _335 = _333.x;
    float _337 = _333.y;
    float _339 = _333.z;
    float _341 = _333.w;
    float _343 = _307 + _317;
    float _345 = _305 + _315;
    float _347 = _309 + _319;
    float _349 = _327 + _337;
    float _351 = _325 + _335;
    float _353 = _311 + _321;
    float _355 = _343 + _349;
    float _357 = _329 + _339;
    float _359 = _345 + _351;
    float _361 = _353 * 0.5;
    float _363 = _355 * 0.25;
    float _365 = _347 + _357;
    float _367 = _359 * 0.25;
    float _369 = _363 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _371 = _365 * 0.25;
    float _373 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[2].x, _369);
    float _375 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[2].z, _373);
    bool _377 = _375 >= _159;
    bool _379 = isnan(_375);
    bool _381 = _377 || _379;
    bool _383 = isnan(_159);
    bool _385 = _381 || _383;
    bool _387 = _157 < _375;
    bool _389 = !_385;
    bool _391 = _387 && _389;
    float _393 = _331 + _341;
    float _395 = _353 + _393;
    int _397 = as_type<int>(_367);
    int _399 = as_type<int>(_363);
    int _401 = as_type<int>(_371);
    int _403 = as_type<int>(_361);
    if (!_391)
    {
        float _405 = _345 * 0.5;
        _397 = as_type<int>(_405);
    }
    int _407 = _397;
    if (!_391)
    {
        float _409 = _343 * 0.5;
        _399 = as_type<int>(_409);
    }
    int _411 = _399;
    if (!_391)
    {
        float _413 = _347 * 0.5;
        _401 = as_type<int>(_413);
    }
    int _415 = _401;
    if (_391)
    {
        float _417 = _395 * 0.25;
        _403 = as_type<int>(_417);
    }
    int _419 = _403;
    out.m_32.x = as_type<float>(_407);
    out.m_32.y = as_type<float>(_411);
    out.m_32.z = as_type<float>(_415);
    out.m_32.w = as_type<float>(_419);
    return out;
}


struct main0_out_u
{
    uint4 m_32 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_29.z;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_29.w;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_29.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_29.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _41;
    float _69 = _67 * _47;
    float _71 = _67 * _53;
    float _73 = _67 * _59;
    float _75 = _67 * _65;
    float2 _474 = float2(_69, _71);
    float3 _79 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).xyz;
    float _81 = _79.x;
    float _83 = _79.y;
    float _85 = _79.z;
    float2 _491 = float2(_69, _71);
    float3 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_491, float2(0.0), isnan(_491)), int2(0, 1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_491, float2(0.0), isnan(_491)), int2(0, 1)).xyz;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float2 _507 = float2(_69, _71);
    float3 _95 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_507, float2(0.0), isnan(_507)), int2(1, 0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_507, float2(0.0), isnan(_507)), int2(1, 0)).xyz;
    float _97 = _95.x;
    float _99 = _95.y;
    float _101 = _95.z;
    float2 _522 = float2(_69, _71);
    float3 _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_522, float2(0.0), isnan(_522)), int2(1)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_522, float2(0.0), isnan(_522)), int2(1)).xyz;
    float _105 = _103.x;
    float _107 = _103.y;
    float _109 = _103.z;
    float2 _537 = float2(_73, _75);
    float3 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_537, float2(0.0), isnan(_537))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_537, float2(0.0), isnan(_537))).xyz;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float _119 = _83 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _121 = _91 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _123 = _99 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _125 = _107 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _127 = fma(_81, (*spvDescriptorSet0.fp_c3)._m0[2].x, _119);
    float _129 = fma(_89, (*spvDescriptorSet0.fp_c3)._m0[2].x, _121);
    float _131 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[2].x, _123);
    float _133 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[2].x, _125);
    float _135 = fma(_85, (*spvDescriptorSet0.fp_c3)._m0[2].z, _127);
    float _137 = fma(_93, (*spvDescriptorSet0.fp_c3)._m0[2].z, _129);
    float _139 = _115 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _141 = fma(_101, (*spvDescriptorSet0.fp_c3)._m0[2].z, _131);
    float _143 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].z, _133);
    float _145 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].x, _139);
    float _147 = precise::min(_135, _137);
    float _149 = precise::min(_141, _143);
    float _151 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[2].z, _145);
    float _153 = precise::max(_135, _137);
    float _155 = precise::max(_141, _143);
    float _157 = precise::min(_147, _149);
    float _159 = precise::max(_153, _155);
    float _161 = precise::min(_151, _157);
    float _163 = precise::max(_151, _159);
    float _165 = _159 * (*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _167 = -_161;
    float _169 = _167 + _163;
    float _171 = precise::max(_165, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    bool _175 = _169 > _171;
    int _178 = as_type<int>(_169);
    int _180 = as_type<int>(_171);
    int _182 = as_type<int>(_165);
    int _184 = as_type<int>(_155);
    if (!_175)
    {
        _178 = 0;
        _180 = 0;
    }
    int _186 = _178;
    int _188 = _180;
    if (!_175)
    {
        _182 = 0;
        _184 = 0;
    }
    int _190 = _182;
    int _192 = _184;
    if (!_175)
    {
        out.m_32.x = as_type<float>(_186);
        out.m_32.y = as_type<float>(_188);
        out.m_32.z = as_type<float>(_190);
        out.m_32.w = as_type<float>(_192);
        return main0_out_u{as_type<uint4>(out.m_32)};
    }
    float _194 = -_141;
    float _196 = _194 + _137;
    float _198 = -_135;
    float _200 = _198 + _143;
    float _202 = in.m_34.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_34.x;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = in.m_34.z;
    float _216 = gl_FragCoord.w;
    float _218 = _214 * _216;
    float _220 = -_200;
    float _222 = _196 + _220;
    float _224 = _196 + _200;
    float _226 = in.m_34.w;
    float _228 = gl_FragCoord.w;
    float _230 = _226 * _228;
    float _232 = _222 * _222;
    float _234 = fma(_224, _224, _232);
    float _236 = _234 + 0.00260416674427688121795654296875;
    float _238 = rsqrt(_236);
    float _240 = _67 * _212;
    float _242 = _67 * _206;
    float _244 = _67 * _218;
    float _246 = _224 * _238;
    float _248 = _222 * _238;
    float _250 = _67 * _230;
    float _252 = -_240;
    float _254 = fma(_246, _252, _73);
    float _256 = -_242;
    float _258 = fma(_248, _256, _75);
    float _260 = abs(_246);
    float _262 = abs(_248);
    float _264 = precise::min(_260, _262);
    float _266 = _264 * 2.0;
    float _268 = 1.0 / _266;
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _272 = fma(_246, _240, _73);
    float _274 = _270 * 0.5;
    float _276 = fma(_246, _274, 0.5);
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = fma(_248, _274, 0.5);
    float _282 = precise::clamp(_280, 0.0, 1.0);
    float _284 = fma(_248, _242, _75);
    float _286 = _278 + (-0.5);
    float _288 = _282 + (-0.5);
    float _290 = -_244;
    float _292 = fma(_286, _290, _73);
    float _294 = fma(_286, _244, _73);
    float _296 = -_250;
    float _298 = fma(_288, _296, _75);
    float _300 = fma(_288, _250, _75);
    float2 _851 = float2(_254, _258);
    float4 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_851, float2(0.0), isnan(_851))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_851, float2(0.0), isnan(_851))).xyzw;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float _311 = _303.w;
    float2 _867 = float2(_272, _284);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_867, float2(0.0), isnan(_867))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_867, float2(0.0), isnan(_867))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float2 _883 = float2(_292, _298);
    float4 _323 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_883, float2(0.0), isnan(_883))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_883, float2(0.0), isnan(_883))).xyzw;
    float _325 = _323.x;
    float _327 = _323.y;
    float _329 = _323.z;
    float _331 = _323.w;
    float2 _899 = float2(_294, _300);
    float4 _333 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_899, float2(0.0), isnan(_899))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_899, float2(0.0), isnan(_899))).xyzw;
    float _335 = _333.x;
    float _337 = _333.y;
    float _339 = _333.z;
    float _341 = _333.w;
    float _343 = _307 + _317;
    float _345 = _305 + _315;
    float _347 = _309 + _319;
    float _349 = _327 + _337;
    float _351 = _325 + _335;
    float _353 = _311 + _321;
    float _355 = _343 + _349;
    float _357 = _329 + _339;
    float _359 = _345 + _351;
    float _361 = _353 * 0.5;
    float _363 = _355 * 0.25;
    float _365 = _347 + _357;
    float _367 = _359 * 0.25;
    float _369 = _363 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _371 = _365 * 0.25;
    float _373 = fma(_367, (*spvDescriptorSet0.fp_c3)._m0[2].x, _369);
    float _375 = fma(_371, (*spvDescriptorSet0.fp_c3)._m0[2].z, _373);
    bool _377 = _375 >= _159;
    bool _379 = isnan(_375);
    bool _381 = _377 || _379;
    bool _383 = isnan(_159);
    bool _385 = _381 || _383;
    bool _387 = _157 < _375;
    bool _389 = !_385;
    bool _391 = _387 && _389;
    float _393 = _331 + _341;
    float _395 = _353 + _393;
    int _397 = as_type<int>(_367);
    int _399 = as_type<int>(_363);
    int _401 = as_type<int>(_371);
    int _403 = as_type<int>(_361);
    if (!_391)
    {
        float _405 = _345 * 0.5;
        _397 = as_type<int>(_405);
    }
    int _407 = _397;
    if (!_391)
    {
        float _409 = _343 * 0.5;
        _399 = as_type<int>(_409);
    }
    int _411 = _399;
    if (!_391)
    {
        float _413 = _347 * 0.5;
        _401 = as_type<int>(_413);
    }
    int _415 = _401;
    if (_391)
    {
        float _417 = _395 * 0.25;
        _403 = as_type<int>(_417);
    }
    int _419 = _403;
    out.m_32.x = as_type<float>(_407);
    out.m_32.y = as_type<float>(_411);
    out.m_32.z = as_type<float>(_415);
    out.m_32.w = as_type<float>(_419);
    return main0_out_u{as_type<uint4>(out.m_32)};
}

