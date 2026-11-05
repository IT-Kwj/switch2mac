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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _457 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_457, float2(0.0), isnan(_457))).x;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _61 * _73;
    float _89 = _61 * _79;
    float _91 = _61 * _85;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _109 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[2].x, _107);
    float _111 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _109);
    float _113 = fma(_111, 0.5, 0.5);
    float _115 = fma(_113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _117 = fma(_113, _115, -0.212114393711090087890625);
    float _119 = fma(_113, _117, 1.570728778839111328125);
    float _121 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _125 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[7].x, _123);
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = fma(_111, -0.5, 0.5);
    float _131 = -_127;
    float _133 = _131 + 1.0;
    float _135 = sqrt(_129);
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _137 + 1.0;
    float _141 = abs(_133);
    float _143 = log2(_141);
    float _145 = _135 * 0.636619746685028076171875;
    float _147 = -_119;
    float _149 = fma(_145, _147, 1.0);
    float _151 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _139, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _610 = float2(_63, _65);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _626 = float2(_149, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_626, float2(0.0), isnan(_626))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _184 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[9].x, _182);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = exp2(_180);
    float _190 = -_186;
    float _192 = _190 + 1.0;
    float _194 = abs(_192);
    float _196 = log2(_194);
    float _198 = -_188;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _202 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _204 = _196 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _206 = exp2(_204);
    float _208 = -_206;
    float _210 = fma(_202, _208, _202);
    float _212 = -_162;
    float _214 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _212);
    float _216 = -_166;
    float _218 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _216);
    float _220 = fma(_200, _214, _162);
    float _222 = fma(_200, _218, _166);
    float _224 = -_220;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _228 = fma(_210, _226, _220);
    float _230 = -_164;
    float _232 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _230);
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _236 = fma(_200, _232, _164);
    float _238 = -_236;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _244 = _234 >= 1.41299998760223388671875;
    bool _246 = isnan(_234);
    bool _248 = _244 || _246;
    bool _250 = isnan(1.41299998760223388671875);
    bool _252 = _248 || _250;
    float _254 = fma(_210, _240, _236);
    float _256 = -_222;
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _260 = _254 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _262 = fma(_210, _258, _222);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _266 = _260 >= 1.41299998760223388671875;
    bool _268 = isnan(_260);
    bool _270 = _266 || _268;
    bool _272 = isnan(1.41299998760223388671875);
    bool _274 = _270 || _272;
    float _276 = _176;
    float _278 = _202;
    float _280 = _204;
    int _283 = as_type<int>(_166);
    float _285 = _196;
    float _287 = _188;
    float _289 = _200;
    float _291 = _234;
    int _293 = as_type<int>(_264);
    int _295 = as_type<int>(_260);
    if (!_252)
    {
        float _297 = _234 * 0.38317000865936279296875;
        _276 = _297;
    }
    float _299 = _276;
    if (_252)
    {
        float _301 = _234 * (-1.44269502162933349609375);
        _278 = _301;
    }
    float _303 = _278;
    bool _305 = _264 >= 1.41299998760223388671875;
    bool _307 = isnan(_264);
    bool _309 = _305 || _307;
    bool _311 = isnan(1.41299998760223388671875);
    bool _313 = _309 || _311;
    float _315 = _303;
    if (_252)
    {
        float _317 = exp2(_303);
        _280 = _317;
    }
    float _319 = _280;
    if (!_274)
    {
        float _321 = _260 * 0.38317000865936279296875;
        _283 = as_type<int>(_321);
    }
    int _323 = _283;
    float _325 = _299;
    if (!_252)
    {
        float _327 = abs(_299);
        float _329 = log2(_327);
        _325 = _329;
    }
    float _331 = _325;
    if (_274)
    {
        float _333 = _260 * (-1.44269502162933349609375);
        _285 = _333;
    }
    float _335 = _285;
    if (!_313)
    {
        float _337 = _264 * 0.38317000865936279296875;
        _287 = _337;
    }
    float _339 = _287;
    if (_313)
    {
        float _341 = _264 * (-1.44269502162933349609375);
        _289 = _341;
    }
    float _343 = _289;
    int _345 = _323;
    if (!_274)
    {
        float _347 = abs(as_type<float>(_323));
        float _349 = log2(_347);
        _345 = as_type<int>(_349);
    }
    int _351 = _345;
    float _353 = _339;
    if (!_313)
    {
        float _355 = abs(_339);
        float _357 = log2(_355);
        _353 = _357;
    }
    float _359 = _353;
    float _361 = _331;
    if (!_252)
    {
        float _363 = _331 * 0.4545454680919647216796875;
        _291 = _363;
    }
    float _365 = _291;
    int _367 = _351;
    if (!_274)
    {
        float _369 = as_type<float>(_351) * 0.4545454680919647216796875;
        _361 = _369;
    }
    float _371 = _361;
    float _373 = _335;
    if (_274)
    {
        float _375 = exp2(_335);
        _373 = _375;
    }
    float _377 = _373;
    if (!_313)
    {
        float _379 = _359 * 0.4545454680919647216796875;
        _315 = _379;
    }
    float _381 = _315;
    float _383 = _343;
    if (_313)
    {
        float _385 = exp2(_343);
        _383 = _385;
    }
    float _387 = _383;
    if (!_252)
    {
        float _389 = exp2(_365);
        _293 = as_type<int>(_389);
    }
    int _391 = _293;
    int _393 = _391;
    if (!_274)
    {
        float _395 = exp2(_371);
        _295 = as_type<int>(_395);
    }
    int _397 = _295;
    int _399 = _397;
    if (!_313)
    {
        float _401 = exp2(_381);
        _367 = as_type<int>(_401);
    }
    int _403 = _367;
    int _405 = _403;
    if (_252)
    {
        float _407 = -_319;
        float _409 = _407 + 1.0;
        _393 = as_type<int>(_409);
    }
    int _411 = _393;
    if (_274)
    {
        float _413 = -_377;
        float _415 = _413 + 1.0;
        _399 = as_type<int>(_415);
    }
    int _417 = _399;
    if (_313)
    {
        float _419 = -_387;
        float _421 = _419 + 1.0;
        _405 = as_type<int>(_421);
    }
    int _423 = _405;
    out.m_40.x = as_type<float>(_411);
    out.m_40.y = as_type<float>(_417);
    out.m_40.z = as_type<float>(_423);
    out.m_40.w = _168;
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _457 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_457, float2(0.0), isnan(_457))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_457, float2(0.0), isnan(_457))).x;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.z;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = _61 * _73;
    float _89 = _61 * _79;
    float _91 = _61 * _85;
    float _93 = _87 * _87;
    float _95 = fma(_89, _89, _93);
    float _97 = fma(_91, _91, _95);
    float _99 = rsqrt(_97);
    float _101 = _87 * _99;
    float _103 = _89 * _99;
    float _105 = _91 * _99;
    float _107 = _101 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _109 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[2].x, _107);
    float _111 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _109);
    float _113 = fma(_111, 0.5, 0.5);
    float _115 = fma(_113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _117 = fma(_113, _115, -0.212114393711090087890625);
    float _119 = fma(_113, _117, 1.570728778839111328125);
    float _121 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _125 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[7].x, _123);
    float _127 = precise::clamp(_125, 0.0, 1.0);
    float _129 = fma(_111, -0.5, 0.5);
    float _131 = -_127;
    float _133 = _131 + 1.0;
    float _135 = sqrt(_129);
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _137 + 1.0;
    float _141 = abs(_133);
    float _143 = log2(_141);
    float _145 = _135 * 0.636619746685028076171875;
    float _147 = -_119;
    float _149 = fma(_145, _147, 1.0);
    float _151 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _139, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _610 = float2(_63, _65);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_610, float2(0.0), isnan(_610))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_610, float2(0.0), isnan(_610))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _626 = float2(_149, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_626, float2(0.0), isnan(_626))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_626, float2(0.0), isnan(_626))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _184 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[9].x, _182);
    float _186 = precise::clamp(_184, 0.0, 1.0);
    float _188 = exp2(_180);
    float _190 = -_186;
    float _192 = _190 + 1.0;
    float _194 = abs(_192);
    float _196 = log2(_194);
    float _198 = -_188;
    float _200 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _202 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _204 = _196 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _206 = exp2(_204);
    float _208 = -_206;
    float _210 = fma(_202, _208, _202);
    float _212 = -_162;
    float _214 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _212);
    float _216 = -_166;
    float _218 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _216);
    float _220 = fma(_200, _214, _162);
    float _222 = fma(_200, _218, _166);
    float _224 = -_220;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _228 = fma(_210, _226, _220);
    float _230 = -_164;
    float _232 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _230);
    float _234 = _228 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _236 = fma(_200, _232, _164);
    float _238 = -_236;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _244 = _234 >= 1.41299998760223388671875;
    bool _246 = isnan(_234);
    bool _248 = _244 || _246;
    bool _250 = isnan(1.41299998760223388671875);
    bool _252 = _248 || _250;
    float _254 = fma(_210, _240, _236);
    float _256 = -_222;
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _260 = _254 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _262 = fma(_210, _258, _222);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _266 = _260 >= 1.41299998760223388671875;
    bool _268 = isnan(_260);
    bool _270 = _266 || _268;
    bool _272 = isnan(1.41299998760223388671875);
    bool _274 = _270 || _272;
    float _276 = _176;
    float _278 = _202;
    float _280 = _204;
    int _283 = as_type<int>(_166);
    float _285 = _196;
    float _287 = _188;
    float _289 = _200;
    float _291 = _234;
    int _293 = as_type<int>(_264);
    int _295 = as_type<int>(_260);
    if (!_252)
    {
        float _297 = _234 * 0.38317000865936279296875;
        _276 = _297;
    }
    float _299 = _276;
    if (_252)
    {
        float _301 = _234 * (-1.44269502162933349609375);
        _278 = _301;
    }
    float _303 = _278;
    bool _305 = _264 >= 1.41299998760223388671875;
    bool _307 = isnan(_264);
    bool _309 = _305 || _307;
    bool _311 = isnan(1.41299998760223388671875);
    bool _313 = _309 || _311;
    float _315 = _303;
    if (_252)
    {
        float _317 = exp2(_303);
        _280 = _317;
    }
    float _319 = _280;
    if (!_274)
    {
        float _321 = _260 * 0.38317000865936279296875;
        _283 = as_type<int>(_321);
    }
    int _323 = _283;
    float _325 = _299;
    if (!_252)
    {
        float _327 = abs(_299);
        float _329 = log2(_327);
        _325 = _329;
    }
    float _331 = _325;
    if (_274)
    {
        float _333 = _260 * (-1.44269502162933349609375);
        _285 = _333;
    }
    float _335 = _285;
    if (!_313)
    {
        float _337 = _264 * 0.38317000865936279296875;
        _287 = _337;
    }
    float _339 = _287;
    if (_313)
    {
        float _341 = _264 * (-1.44269502162933349609375);
        _289 = _341;
    }
    float _343 = _289;
    int _345 = _323;
    if (!_274)
    {
        float _347 = abs(as_type<float>(_323));
        float _349 = log2(_347);
        _345 = as_type<int>(_349);
    }
    int _351 = _345;
    float _353 = _339;
    if (!_313)
    {
        float _355 = abs(_339);
        float _357 = log2(_355);
        _353 = _357;
    }
    float _359 = _353;
    float _361 = _331;
    if (!_252)
    {
        float _363 = _331 * 0.4545454680919647216796875;
        _291 = _363;
    }
    float _365 = _291;
    int _367 = _351;
    if (!_274)
    {
        float _369 = as_type<float>(_351) * 0.4545454680919647216796875;
        _361 = _369;
    }
    float _371 = _361;
    float _373 = _335;
    if (_274)
    {
        float _375 = exp2(_335);
        _373 = _375;
    }
    float _377 = _373;
    if (!_313)
    {
        float _379 = _359 * 0.4545454680919647216796875;
        _315 = _379;
    }
    float _381 = _315;
    float _383 = _343;
    if (_313)
    {
        float _385 = exp2(_343);
        _383 = _385;
    }
    float _387 = _383;
    if (!_252)
    {
        float _389 = exp2(_365);
        _293 = as_type<int>(_389);
    }
    int _391 = _293;
    int _393 = _391;
    if (!_274)
    {
        float _395 = exp2(_371);
        _295 = as_type<int>(_395);
    }
    int _397 = _295;
    int _399 = _397;
    if (!_313)
    {
        float _401 = exp2(_381);
        _367 = as_type<int>(_401);
    }
    int _403 = _367;
    int _405 = _403;
    if (_252)
    {
        float _407 = -_319;
        float _409 = _407 + 1.0;
        _393 = as_type<int>(_409);
    }
    int _411 = _393;
    if (_274)
    {
        float _413 = -_377;
        float _415 = _413 + 1.0;
        _399 = as_type<int>(_415);
    }
    int _417 = _399;
    if (_313)
    {
        float _419 = -_387;
        float _421 = _419 + 1.0;
        _405 = as_type<int>(_421);
    }
    int _423 = _405;
    out.m_40.x = as_type<float>(_411);
    out.m_40.y = as_type<float>(_417);
    out.m_40.z = as_type<float>(_423);
    out.m_40.w = _168;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

