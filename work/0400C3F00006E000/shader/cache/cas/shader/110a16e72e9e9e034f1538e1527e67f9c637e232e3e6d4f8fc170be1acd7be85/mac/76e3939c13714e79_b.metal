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
    float2 _441 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_441, float2(0.0), isnan(_441))).x;
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
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _113 = _111 + 1.0;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _109);
    float _117 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _121 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[7].x, _119);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = -_123;
    float _127 = _125 + 1.0;
    float _129 = abs(_127);
    float _131 = log2(_129);
    float _133 = fma(_115, 0.5, 0.5);
    float _135 = _131 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _137 = exp2(_135);
    float _139 = fma(_137, _113, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _141 = fma(_139, 0.5, 0.5);
    float2 _569 = float2(_63, _65);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _585 = float2(_133, _141);
    float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_585, float2(0.0), isnan(_585))).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _131 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _168 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[9].x, _166);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = exp2(_164);
    float _174 = -_170;
    float _176 = _174 + 1.0;
    float _178 = abs(_176);
    float _180 = log2(_178);
    float _182 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _184 = -_172;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = _180 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _190 = exp2(_188);
    float _192 = -_190;
    float _194 = fma(_182, _192, _182);
    float _196 = -_146;
    float _198 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _196);
    float _200 = -_150;
    float _202 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _200);
    float _204 = fma(_186, _198, _146);
    float _206 = fma(_186, _202, _150);
    float _208 = -_204;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _212 = fma(_194, _210, _204);
    float _214 = -_148;
    float _216 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _220 = fma(_186, _216, _148);
    float _222 = -_220;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _228 = _218 >= 1.41299998760223388671875;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan(1.41299998760223388671875);
    bool _236 = _232 || _234;
    float _238 = fma(_194, _224, _220);
    float _240 = -_206;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _246 = fma(_194, _242, _206);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _250 = _244 >= 1.41299998760223388671875;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan(1.41299998760223388671875);
    bool _258 = _254 || _256;
    float _260 = _160;
    float _262 = _180;
    float _264 = _188;
    int _267 = as_type<int>(_150);
    float _269 = _182;
    float _271 = _186;
    float _273 = _172;
    float _275 = _218;
    int _277 = as_type<int>(_248);
    int _279 = as_type<int>(_244);
    if (!_236)
    {
        float _281 = _218 * 0.38317000865936279296875;
        _260 = _281;
    }
    float _283 = _260;
    if (_236)
    {
        float _285 = _218 * (-1.44269502162933349609375);
        _262 = _285;
    }
    float _287 = _262;
    bool _289 = _248 >= 1.41299998760223388671875;
    bool _291 = isnan(_248);
    bool _293 = _289 || _291;
    bool _295 = isnan(1.41299998760223388671875);
    bool _297 = _293 || _295;
    float _299 = _287;
    if (_236)
    {
        float _301 = exp2(_287);
        _264 = _301;
    }
    float _303 = _264;
    if (!_258)
    {
        float _305 = _244 * 0.38317000865936279296875;
        _267 = as_type<int>(_305);
    }
    int _307 = _267;
    float _309 = _283;
    if (!_236)
    {
        float _311 = abs(_283);
        float _313 = log2(_311);
        _309 = _313;
    }
    float _315 = _309;
    if (_258)
    {
        float _317 = _244 * (-1.44269502162933349609375);
        _269 = _317;
    }
    float _319 = _269;
    if (!_297)
    {
        float _321 = _248 * 0.38317000865936279296875;
        _271 = _321;
    }
    float _323 = _271;
    if (_297)
    {
        float _325 = _248 * (-1.44269502162933349609375);
        _273 = _325;
    }
    float _327 = _273;
    int _329 = _307;
    if (!_258)
    {
        float _331 = abs(as_type<float>(_307));
        float _333 = log2(_331);
        _329 = as_type<int>(_333);
    }
    int _335 = _329;
    float _337 = _323;
    if (!_297)
    {
        float _339 = abs(_323);
        float _341 = log2(_339);
        _337 = _341;
    }
    float _343 = _337;
    float _345 = _315;
    if (!_236)
    {
        float _347 = _315 * 0.4545454680919647216796875;
        _275 = _347;
    }
    float _349 = _275;
    int _351 = _335;
    if (!_258)
    {
        float _353 = as_type<float>(_335) * 0.4545454680919647216796875;
        _345 = _353;
    }
    float _355 = _345;
    float _357 = _319;
    if (_258)
    {
        float _359 = exp2(_319);
        _357 = _359;
    }
    float _361 = _357;
    if (!_297)
    {
        float _363 = _343 * 0.4545454680919647216796875;
        _299 = _363;
    }
    float _365 = _299;
    float _367 = _327;
    if (_297)
    {
        float _369 = exp2(_327);
        _367 = _369;
    }
    float _371 = _367;
    if (!_236)
    {
        float _373 = exp2(_349);
        _277 = as_type<int>(_373);
    }
    int _375 = _277;
    int _377 = _375;
    if (!_258)
    {
        float _379 = exp2(_355);
        _279 = as_type<int>(_379);
    }
    int _381 = _279;
    int _383 = _381;
    if (!_297)
    {
        float _385 = exp2(_365);
        _351 = as_type<int>(_385);
    }
    int _387 = _351;
    int _389 = _387;
    if (_236)
    {
        float _391 = -_303;
        float _393 = _391 + 1.0;
        _377 = as_type<int>(_393);
    }
    int _395 = _377;
    if (_258)
    {
        float _397 = -_361;
        float _399 = _397 + 1.0;
        _383 = as_type<int>(_399);
    }
    int _401 = _383;
    if (_297)
    {
        float _403 = -_371;
        float _405 = _403 + 1.0;
        _389 = as_type<int>(_405);
    }
    int _407 = _389;
    out.m_40.x = as_type<float>(_395);
    out.m_40.y = as_type<float>(_401);
    out.m_40.z = as_type<float>(_407);
    out.m_40.w = _152;
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
    float2 _441 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_441, float2(0.0), isnan(_441))).x;
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
    float _111 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _113 = _111 + 1.0;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c4)._m0[2].z, _109);
    float _117 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _119 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _121 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[7].x, _119);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = -_123;
    float _127 = _125 + 1.0;
    float _129 = abs(_127);
    float _131 = log2(_129);
    float _133 = fma(_115, 0.5, 0.5);
    float _135 = _131 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _137 = exp2(_135);
    float _139 = fma(_137, _113, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _141 = fma(_139, 0.5, 0.5);
    float2 _569 = float2(_63, _65);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_569, float2(0.0), isnan(_569))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_569, float2(0.0), isnan(_569))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _585 = float2(_133, _141);
    float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_585, float2(0.0), isnan(_585))).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _131 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _168 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[9].x, _166);
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = exp2(_164);
    float _174 = -_170;
    float _176 = _174 + 1.0;
    float _178 = abs(_176);
    float _180 = log2(_178);
    float _182 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _184 = -_172;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = _180 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _190 = exp2(_188);
    float _192 = -_190;
    float _194 = fma(_182, _192, _182);
    float _196 = -_146;
    float _198 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _196);
    float _200 = -_150;
    float _202 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _200);
    float _204 = fma(_186, _198, _146);
    float _206 = fma(_186, _202, _150);
    float _208 = -_204;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _212 = fma(_194, _210, _204);
    float _214 = -_148;
    float _216 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _214);
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _220 = fma(_186, _216, _148);
    float _222 = -_220;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _228 = _218 >= 1.41299998760223388671875;
    bool _230 = isnan(_218);
    bool _232 = _228 || _230;
    bool _234 = isnan(1.41299998760223388671875);
    bool _236 = _232 || _234;
    float _238 = fma(_194, _224, _220);
    float _240 = -_206;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _246 = fma(_194, _242, _206);
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _250 = _244 >= 1.41299998760223388671875;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan(1.41299998760223388671875);
    bool _258 = _254 || _256;
    float _260 = _160;
    float _262 = _180;
    float _264 = _188;
    int _267 = as_type<int>(_150);
    float _269 = _182;
    float _271 = _186;
    float _273 = _172;
    float _275 = _218;
    int _277 = as_type<int>(_248);
    int _279 = as_type<int>(_244);
    if (!_236)
    {
        float _281 = _218 * 0.38317000865936279296875;
        _260 = _281;
    }
    float _283 = _260;
    if (_236)
    {
        float _285 = _218 * (-1.44269502162933349609375);
        _262 = _285;
    }
    float _287 = _262;
    bool _289 = _248 >= 1.41299998760223388671875;
    bool _291 = isnan(_248);
    bool _293 = _289 || _291;
    bool _295 = isnan(1.41299998760223388671875);
    bool _297 = _293 || _295;
    float _299 = _287;
    if (_236)
    {
        float _301 = exp2(_287);
        _264 = _301;
    }
    float _303 = _264;
    if (!_258)
    {
        float _305 = _244 * 0.38317000865936279296875;
        _267 = as_type<int>(_305);
    }
    int _307 = _267;
    float _309 = _283;
    if (!_236)
    {
        float _311 = abs(_283);
        float _313 = log2(_311);
        _309 = _313;
    }
    float _315 = _309;
    if (_258)
    {
        float _317 = _244 * (-1.44269502162933349609375);
        _269 = _317;
    }
    float _319 = _269;
    if (!_297)
    {
        float _321 = _248 * 0.38317000865936279296875;
        _271 = _321;
    }
    float _323 = _271;
    if (_297)
    {
        float _325 = _248 * (-1.44269502162933349609375);
        _273 = _325;
    }
    float _327 = _273;
    int _329 = _307;
    if (!_258)
    {
        float _331 = abs(as_type<float>(_307));
        float _333 = log2(_331);
        _329 = as_type<int>(_333);
    }
    int _335 = _329;
    float _337 = _323;
    if (!_297)
    {
        float _339 = abs(_323);
        float _341 = log2(_339);
        _337 = _341;
    }
    float _343 = _337;
    float _345 = _315;
    if (!_236)
    {
        float _347 = _315 * 0.4545454680919647216796875;
        _275 = _347;
    }
    float _349 = _275;
    int _351 = _335;
    if (!_258)
    {
        float _353 = as_type<float>(_335) * 0.4545454680919647216796875;
        _345 = _353;
    }
    float _355 = _345;
    float _357 = _319;
    if (_258)
    {
        float _359 = exp2(_319);
        _357 = _359;
    }
    float _361 = _357;
    if (!_297)
    {
        float _363 = _343 * 0.4545454680919647216796875;
        _299 = _363;
    }
    float _365 = _299;
    float _367 = _327;
    if (_297)
    {
        float _369 = exp2(_327);
        _367 = _369;
    }
    float _371 = _367;
    if (!_236)
    {
        float _373 = exp2(_349);
        _277 = as_type<int>(_373);
    }
    int _375 = _277;
    int _377 = _375;
    if (!_258)
    {
        float _379 = exp2(_355);
        _279 = as_type<int>(_379);
    }
    int _381 = _279;
    int _383 = _381;
    if (!_297)
    {
        float _385 = exp2(_365);
        _351 = as_type<int>(_385);
    }
    int _387 = _351;
    int _389 = _387;
    if (_236)
    {
        float _391 = -_303;
        float _393 = _391 + 1.0;
        _377 = as_type<int>(_393);
    }
    int _395 = _377;
    if (_258)
    {
        float _397 = -_361;
        float _399 = _397 + 1.0;
        _383 = as_type<int>(_399);
    }
    int _401 = _383;
    if (_297)
    {
        float _403 = -_371;
        float _405 = _403 + 1.0;
        _389 = as_type<int>(_405);
    }
    int _407 = _389;
    out.m_40.x = as_type<float>(_395);
    out.m_40.y = as_type<float>(_401);
    out.m_40.z = as_type<float>(_407);
    out.m_40.w = _152;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

