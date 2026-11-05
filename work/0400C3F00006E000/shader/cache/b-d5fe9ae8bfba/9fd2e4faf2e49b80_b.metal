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
    float2 _415 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415))).x;
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
    float _123 = fma(_111, -0.5, 0.5);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _127 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[7].x, _125);
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = sqrt(_123);
    float _133 = -_129;
    float _135 = _133 + 1.0;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _137 + 1.0;
    float _141 = abs(_135);
    float _143 = log2(_141);
    float _145 = _131 * 0.636619746685028076171875;
    float _147 = -_119;
    float _149 = fma(_145, _147, 1.0);
    float _151 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _139, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _568 = float2(_63, _65);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _584 = float2(_149, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_584, float2(0.0), isnan(_584))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = exp2(_180);
    float _184 = -_182;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = -_162;
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = -_166;
    float _194 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _196 = fma(_186, _190, _162);
    float _198 = -_164;
    float _200 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
    float _202 = fma(_186, _194, _166);
    float _204 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _206 = fma(_186, _200, _164);
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _210 = _206 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _214 = _204 >= 1.41299998760223388671875;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.41299998760223388671875);
    bool _222 = _218 || _220;
    bool _224 = _208 >= 1.41299998760223388671875;
    bool _226 = isnan(_208);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.41299998760223388671875);
    bool _232 = _228 || _230;
    bool _234 = _210 >= 1.41299998760223388671875;
    bool _236 = isnan(_210);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.41299998760223388671875);
    bool _242 = _238 || _240;
    int _245 = as_type<int>(_164);
    float _247 = _174;
    float _249 = _186;
    float _251 = _176;
    int _253 = as_type<int>(_166);
    float _255 = _182;
    float _257 = _204;
    float _259 = _208;
    int _261 = as_type<int>(_210);
    if (!_222)
    {
        float _263 = _204 * 0.38317000865936279296875;
        _245 = as_type<int>(_263);
    }
    int _265 = _245;
    if (_222)
    {
        float _267 = _204 * (-1.44269502162933349609375);
        _247 = _267;
    }
    float _269 = _247;
    float _271 = _269;
    if (!_232)
    {
        float _273 = _208 * 0.38317000865936279296875;
        _249 = _273;
    }
    float _275 = _249;
    if (_232)
    {
        float _277 = _208 * (-1.44269502162933349609375);
        _251 = _277;
    }
    float _279 = _251;
    if (!_242)
    {
        float _281 = _210 * 0.38317000865936279296875;
        _253 = as_type<int>(_281);
    }
    int _283 = _253;
    if (_242)
    {
        float _285 = _210 * (-1.44269502162933349609375);
        _255 = _285;
    }
    float _287 = _255;
    int _289 = _265;
    if (!_222)
    {
        float _291 = abs(as_type<float>(_265));
        float _293 = log2(_291);
        _289 = as_type<int>(_293);
    }
    int _295 = _289;
    int _297 = _283;
    if (!_242)
    {
        float _299 = abs(as_type<float>(_283));
        float _301 = log2(_299);
        _297 = as_type<int>(_301);
    }
    int _303 = _297;
    float _305 = _275;
    if (!_232)
    {
        float _307 = abs(_275);
        float _309 = log2(_307);
        _305 = _309;
    }
    float _311 = _305;
    int _313 = _295;
    if (!_222)
    {
        float _315 = as_type<float>(_295) * 0.4545454680919647216796875;
        _257 = _315;
    }
    float _317 = _257;
    float _319 = 0.5;
    if (_222)
    {
        float _321 = exp2(_269);
        _319 = _321;
    }
    float _323 = _319;
    int _325 = _303;
    if (!_242)
    {
        float _327 = as_type<float>(_303) * 0.4545454680919647216796875;
        _259 = _327;
    }
    float _329 = _259;
    float _331 = _287;
    if (_242)
    {
        float _333 = exp2(_287);
        _331 = _333;
    }
    float _335 = _331;
    if (!_232)
    {
        float _337 = _311 * 0.4545454680919647216796875;
        _271 = _337;
    }
    float _339 = _271;
    float _341 = _279;
    if (_232)
    {
        float _343 = exp2(_279);
        _341 = _343;
    }
    float _345 = _341;
    if (!_222)
    {
        float _347 = exp2(_317);
        _261 = as_type<int>(_347);
    }
    int _349 = _261;
    int _351 = _349;
    if (!_242)
    {
        float _353 = exp2(_329);
        _313 = as_type<int>(_353);
    }
    int _355 = _313;
    int _357 = _355;
    if (!_232)
    {
        float _359 = exp2(_339);
        _325 = as_type<int>(_359);
    }
    int _361 = _325;
    int _363 = _361;
    if (_222)
    {
        float _365 = -_323;
        float _367 = _365 + 1.0;
        _351 = as_type<int>(_367);
    }
    int _369 = _351;
    if (_242)
    {
        float _371 = -_335;
        float _373 = _371 + 1.0;
        _357 = as_type<int>(_373);
    }
    int _375 = _357;
    if (_232)
    {
        float _377 = -_345;
        float _379 = _377 + 1.0;
        _363 = as_type<int>(_379);
    }
    int _381 = _363;
    out.m_40.x = as_type<float>(_369);
    out.m_40.y = as_type<float>(_375);
    out.m_40.z = as_type<float>(_381);
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
    float2 _415 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415))).x;
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
    float _123 = fma(_111, -0.5, 0.5);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _127 = fma(_121, (*spvDescriptorSet0.fp_c3)._m0[7].x, _125);
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = sqrt(_123);
    float _133 = -_129;
    float _135 = _133 + 1.0;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _139 = _137 + 1.0;
    float _141 = abs(_135);
    float _143 = log2(_141);
    float _145 = _131 * 0.636619746685028076171875;
    float _147 = -_119;
    float _149 = fma(_145, _147, 1.0);
    float _151 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _139, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _568 = float2(_63, _65);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_568, float2(0.0), isnan(_568))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _584 = float2(_149, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_584, float2(0.0), isnan(_584))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_584, float2(0.0), isnan(_584))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _143 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = exp2(_180);
    float _184 = -_182;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = -_162;
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = -_166;
    float _194 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _196 = fma(_186, _190, _162);
    float _198 = -_164;
    float _200 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
    float _202 = fma(_186, _194, _166);
    float _204 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _206 = fma(_186, _200, _164);
    float _208 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _210 = _206 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _214 = _204 >= 1.41299998760223388671875;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.41299998760223388671875);
    bool _222 = _218 || _220;
    bool _224 = _208 >= 1.41299998760223388671875;
    bool _226 = isnan(_208);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.41299998760223388671875);
    bool _232 = _228 || _230;
    bool _234 = _210 >= 1.41299998760223388671875;
    bool _236 = isnan(_210);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.41299998760223388671875);
    bool _242 = _238 || _240;
    int _245 = as_type<int>(_164);
    float _247 = _174;
    float _249 = _186;
    float _251 = _176;
    int _253 = as_type<int>(_166);
    float _255 = _182;
    float _257 = _204;
    float _259 = _208;
    int _261 = as_type<int>(_210);
    if (!_222)
    {
        float _263 = _204 * 0.38317000865936279296875;
        _245 = as_type<int>(_263);
    }
    int _265 = _245;
    if (_222)
    {
        float _267 = _204 * (-1.44269502162933349609375);
        _247 = _267;
    }
    float _269 = _247;
    float _271 = _269;
    if (!_232)
    {
        float _273 = _208 * 0.38317000865936279296875;
        _249 = _273;
    }
    float _275 = _249;
    if (_232)
    {
        float _277 = _208 * (-1.44269502162933349609375);
        _251 = _277;
    }
    float _279 = _251;
    if (!_242)
    {
        float _281 = _210 * 0.38317000865936279296875;
        _253 = as_type<int>(_281);
    }
    int _283 = _253;
    if (_242)
    {
        float _285 = _210 * (-1.44269502162933349609375);
        _255 = _285;
    }
    float _287 = _255;
    int _289 = _265;
    if (!_222)
    {
        float _291 = abs(as_type<float>(_265));
        float _293 = log2(_291);
        _289 = as_type<int>(_293);
    }
    int _295 = _289;
    int _297 = _283;
    if (!_242)
    {
        float _299 = abs(as_type<float>(_283));
        float _301 = log2(_299);
        _297 = as_type<int>(_301);
    }
    int _303 = _297;
    float _305 = _275;
    if (!_232)
    {
        float _307 = abs(_275);
        float _309 = log2(_307);
        _305 = _309;
    }
    float _311 = _305;
    int _313 = _295;
    if (!_222)
    {
        float _315 = as_type<float>(_295) * 0.4545454680919647216796875;
        _257 = _315;
    }
    float _317 = _257;
    float _319 = 0.5;
    if (_222)
    {
        float _321 = exp2(_269);
        _319 = _321;
    }
    float _323 = _319;
    int _325 = _303;
    if (!_242)
    {
        float _327 = as_type<float>(_303) * 0.4545454680919647216796875;
        _259 = _327;
    }
    float _329 = _259;
    float _331 = _287;
    if (_242)
    {
        float _333 = exp2(_287);
        _331 = _333;
    }
    float _335 = _331;
    if (!_232)
    {
        float _337 = _311 * 0.4545454680919647216796875;
        _271 = _337;
    }
    float _339 = _271;
    float _341 = _279;
    if (_232)
    {
        float _343 = exp2(_279);
        _341 = _343;
    }
    float _345 = _341;
    if (!_222)
    {
        float _347 = exp2(_317);
        _261 = as_type<int>(_347);
    }
    int _349 = _261;
    int _351 = _349;
    if (!_242)
    {
        float _353 = exp2(_329);
        _313 = as_type<int>(_353);
    }
    int _355 = _313;
    int _357 = _355;
    if (!_232)
    {
        float _359 = exp2(_339);
        _325 = as_type<int>(_359);
    }
    int _361 = _325;
    int _363 = _361;
    if (_222)
    {
        float _365 = -_323;
        float _367 = _365 + 1.0;
        _351 = as_type<int>(_367);
    }
    int _369 = _351;
    if (_242)
    {
        float _371 = -_335;
        float _373 = _371 + 1.0;
        _357 = as_type<int>(_373);
    }
    int _375 = _357;
    if (_232)
    {
        float _377 = -_345;
        float _379 = _377 + 1.0;
        _363 = as_type<int>(_379);
    }
    int _381 = _363;
    out.m_40.x = as_type<float>(_369);
    out.m_40.y = as_type<float>(_375);
    out.m_40.z = as_type<float>(_381);
    out.m_40.w = _168;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

