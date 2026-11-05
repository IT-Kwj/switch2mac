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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _415 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = _63 * _87;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _89 * _89;
    float _103 = fma(_93, _93, _101);
    float _105 = fma(_91, _91, _103);
    float _107 = rsqrt(_105);
    float _109 = _89 * _107;
    float _111 = _63 * _99;
    float _113 = _93 * _107;
    float _115 = _91 * _107;
    float _117 = _109 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _119 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[2].x, _117);
    float _121 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[2].z, _119);
    float _123 = fma(_121, 0.5, 0.5);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _127 = _125 + 1.0;
    float _129 = -_69;
    float _131 = fma(_129, _111, 1.0);
    float _133 = 1.0 / _131;
    float _135 = _133 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _139 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[7].x, _137);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = -_141;
    float _145 = _143 + 1.0;
    float _147 = abs(_145);
    float _149 = log2(_147);
    float _151 = _149 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _127, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _558 = float2(_65, _67);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _574 = float2(_123, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_574, float2(0.0), isnan(_574))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_574, float2(0.0), isnan(_574))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _149 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = exp2(_180);
    float _184 = -_182;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = -_162;
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = -_166;
    float _194 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _196 = fma(_186, _190, _162);
    float _198 = fma(_186, _194, _166);
    float _200 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _202 = -_164;
    float _204 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _202);
    float _206 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _208 = fma(_186, _204, _164);
    bool _212 = _200 >= 1.41299998760223388671875;
    bool _214 = isnan(_200);
    bool _216 = _212 || _214;
    bool _218 = isnan(1.41299998760223388671875);
    bool _220 = _216 || _218;
    bool _222 = _206 >= 1.41299998760223388671875;
    bool _224 = isnan(_206);
    bool _226 = _222 || _224;
    bool _228 = isnan(1.41299998760223388671875);
    bool _230 = _226 || _228;
    float _232 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _234 = _232 >= 1.41299998760223388671875;
    bool _236 = isnan(_232);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.41299998760223388671875);
    bool _242 = _238 || _240;
    int _245 = as_type<int>(_182);
    float _247 = _200;
    float _249 = _186;
    float _251 = _176;
    int _253 = as_type<int>(_166);
    float _255 = _157;
    float _257 = _162;
    float _259 = _164;
    float _261 = _232;
    int _263 = as_type<int>(_206);
    if (!_220)
    {
        float _265 = _200 * 0.38317000865936279296875;
        _245 = as_type<int>(_265);
    }
    int _267 = _245;
    if (_220)
    {
        float _269 = _200 * (-1.44269502162933349609375);
        _247 = _269;
    }
    float _271 = _247;
    if (!_230)
    {
        float _273 = _206 * 0.38317000865936279296875;
        _249 = _273;
    }
    float _275 = _249;
    if (_230)
    {
        float _277 = _206 * (-1.44269502162933349609375);
        _251 = _277;
    }
    float _279 = _251;
    int _281 = _267;
    if (!_220)
    {
        float _283 = abs(as_type<float>(_267));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    if (!_242)
    {
        float _289 = _232 * 0.38317000865936279296875;
        _253 = as_type<int>(_289);
    }
    int _291 = _253;
    if (_242)
    {
        float _293 = _232 * (-1.44269502162933349609375);
        _255 = _293;
    }
    float _295 = _255;
    int _297 = _291;
    if (!_242)
    {
        float _299 = abs(as_type<float>(_291));
        float _301 = log2(_299);
        _297 = as_type<int>(_301);
    }
    int _303 = _297;
    float _305 = _275;
    if (!_230)
    {
        float _307 = abs(_275);
        float _309 = log2(_307);
        _305 = _309;
    }
    float _311 = _305;
    int _313 = _287;
    if (!_220)
    {
        float _315 = as_type<float>(_287) * 0.4545454680919647216796875;
        _257 = _315;
    }
    float _317 = _257;
    int _319 = _303;
    if (!_242)
    {
        float _321 = as_type<float>(_303) * 0.4545454680919647216796875;
        _259 = _321;
    }
    float _323 = _259;
    float _325 = _271;
    if (_220)
    {
        float _327 = exp2(_271);
        _325 = _327;
    }
    float _329 = _325;
    if (!_230)
    {
        float _331 = _311 * 0.4545454680919647216796875;
        _261 = _331;
    }
    float _333 = _261;
    float _335 = _295;
    if (_242)
    {
        float _337 = exp2(_295);
        _335 = _337;
    }
    float _339 = _335;
    float _341 = _279;
    if (_230)
    {
        float _343 = exp2(_279);
        _341 = _343;
    }
    float _345 = _341;
    if (!_220)
    {
        float _347 = exp2(_317);
        _313 = as_type<int>(_347);
    }
    int _349 = _313;
    int _351 = _349;
    if (!_242)
    {
        float _353 = exp2(_323);
        _263 = as_type<int>(_353);
    }
    int _355 = _263;
    int _357 = _355;
    if (!_230)
    {
        float _359 = exp2(_333);
        _319 = as_type<int>(_359);
    }
    int _361 = _319;
    int _363 = _361;
    if (_220)
    {
        float _365 = -_329;
        float _367 = _365 + 1.0;
        _351 = as_type<int>(_367);
    }
    int _369 = _351;
    if (_242)
    {
        float _371 = -_339;
        float _373 = _371 + 1.0;
        _357 = as_type<int>(_373);
    }
    int _375 = _357;
    if (_230)
    {
        float _377 = -_345;
        float _379 = _377 + 1.0;
        _363 = as_type<int>(_379);
    }
    int _381 = _363;
    out.m_42.x = as_type<float>(_369);
    out.m_42.y = as_type<float>(_375);
    out.m_42.z = as_type<float>(_381);
    out.m_42.w = _168;
    return out;
}


struct main0_out_u
{
    uint4 m_42 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_35.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_35.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _415 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_415, float2(0.0), isnan(_415))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_415, float2(0.0), isnan(_415))).x;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_37.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.x;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = _63 * _75;
    float _91 = _63 * _81;
    float _93 = _63 * _87;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _89 * _89;
    float _103 = fma(_93, _93, _101);
    float _105 = fma(_91, _91, _103);
    float _107 = rsqrt(_105);
    float _109 = _89 * _107;
    float _111 = _63 * _99;
    float _113 = _93 * _107;
    float _115 = _91 * _107;
    float _117 = _109 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _119 = fma(_113, (*spvDescriptorSet0.fp_c4)._m0[2].x, _117);
    float _121 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[2].z, _119);
    float _123 = fma(_121, 0.5, 0.5);
    float _125 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _127 = _125 + 1.0;
    float _129 = -_69;
    float _131 = fma(_129, _111, 1.0);
    float _133 = 1.0 / _131;
    float _135 = _133 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _137 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _139 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[7].x, _137);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = -_141;
    float _145 = _143 + 1.0;
    float _147 = abs(_145);
    float _149 = log2(_147);
    float _151 = _149 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _153 = exp2(_151);
    float _155 = fma(_153, _127, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _157 = fma(_155, 0.5, 0.5);
    float2 _558 = float2(_65, _67);
    float4 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_558, float2(0.0), isnan(_558))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_558, float2(0.0), isnan(_558))).xyzw;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _160.w;
    float2 _574 = float2(_123, _157);
    float3 _172 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_574, float2(0.0), isnan(_574))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_574, float2(0.0), isnan(_574))).xyz;
    float _174 = _172.x;
    float _176 = _172.y;
    float _178 = _172.z;
    float _180 = _149 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _182 = exp2(_180);
    float _184 = -_182;
    float _186 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _188 = -_162;
    float _190 = fma(_174, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = -_166;
    float _194 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _192);
    float _196 = fma(_186, _190, _162);
    float _198 = fma(_186, _194, _166);
    float _200 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _202 = -_164;
    float _204 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[13].x, _202);
    float _206 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _208 = fma(_186, _204, _164);
    bool _212 = _200 >= 1.41299998760223388671875;
    bool _214 = isnan(_200);
    bool _216 = _212 || _214;
    bool _218 = isnan(1.41299998760223388671875);
    bool _220 = _216 || _218;
    bool _222 = _206 >= 1.41299998760223388671875;
    bool _224 = isnan(_206);
    bool _226 = _222 || _224;
    bool _228 = isnan(1.41299998760223388671875);
    bool _230 = _226 || _228;
    float _232 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _234 = _232 >= 1.41299998760223388671875;
    bool _236 = isnan(_232);
    bool _238 = _234 || _236;
    bool _240 = isnan(1.41299998760223388671875);
    bool _242 = _238 || _240;
    int _245 = as_type<int>(_182);
    float _247 = _200;
    float _249 = _186;
    float _251 = _176;
    int _253 = as_type<int>(_166);
    float _255 = _157;
    float _257 = _162;
    float _259 = _164;
    float _261 = _232;
    int _263 = as_type<int>(_206);
    if (!_220)
    {
        float _265 = _200 * 0.38317000865936279296875;
        _245 = as_type<int>(_265);
    }
    int _267 = _245;
    if (_220)
    {
        float _269 = _200 * (-1.44269502162933349609375);
        _247 = _269;
    }
    float _271 = _247;
    if (!_230)
    {
        float _273 = _206 * 0.38317000865936279296875;
        _249 = _273;
    }
    float _275 = _249;
    if (_230)
    {
        float _277 = _206 * (-1.44269502162933349609375);
        _251 = _277;
    }
    float _279 = _251;
    int _281 = _267;
    if (!_220)
    {
        float _283 = abs(as_type<float>(_267));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    if (!_242)
    {
        float _289 = _232 * 0.38317000865936279296875;
        _253 = as_type<int>(_289);
    }
    int _291 = _253;
    if (_242)
    {
        float _293 = _232 * (-1.44269502162933349609375);
        _255 = _293;
    }
    float _295 = _255;
    int _297 = _291;
    if (!_242)
    {
        float _299 = abs(as_type<float>(_291));
        float _301 = log2(_299);
        _297 = as_type<int>(_301);
    }
    int _303 = _297;
    float _305 = _275;
    if (!_230)
    {
        float _307 = abs(_275);
        float _309 = log2(_307);
        _305 = _309;
    }
    float _311 = _305;
    int _313 = _287;
    if (!_220)
    {
        float _315 = as_type<float>(_287) * 0.4545454680919647216796875;
        _257 = _315;
    }
    float _317 = _257;
    int _319 = _303;
    if (!_242)
    {
        float _321 = as_type<float>(_303) * 0.4545454680919647216796875;
        _259 = _321;
    }
    float _323 = _259;
    float _325 = _271;
    if (_220)
    {
        float _327 = exp2(_271);
        _325 = _327;
    }
    float _329 = _325;
    if (!_230)
    {
        float _331 = _311 * 0.4545454680919647216796875;
        _261 = _331;
    }
    float _333 = _261;
    float _335 = _295;
    if (_242)
    {
        float _337 = exp2(_295);
        _335 = _337;
    }
    float _339 = _335;
    float _341 = _279;
    if (_230)
    {
        float _343 = exp2(_279);
        _341 = _343;
    }
    float _345 = _341;
    if (!_220)
    {
        float _347 = exp2(_317);
        _313 = as_type<int>(_347);
    }
    int _349 = _313;
    int _351 = _349;
    if (!_242)
    {
        float _353 = exp2(_323);
        _263 = as_type<int>(_353);
    }
    int _355 = _263;
    int _357 = _355;
    if (!_230)
    {
        float _359 = exp2(_333);
        _319 = as_type<int>(_359);
    }
    int _361 = _319;
    int _363 = _361;
    if (_220)
    {
        float _365 = -_329;
        float _367 = _365 + 1.0;
        _351 = as_type<int>(_367);
    }
    int _369 = _351;
    if (_242)
    {
        float _371 = -_339;
        float _373 = _371 + 1.0;
        _357 = as_type<int>(_373);
    }
    int _375 = _357;
    if (_230)
    {
        float _377 = -_345;
        float _379 = _377 + 1.0;
        _363 = as_type<int>(_379);
    }
    int _381 = _363;
    out.m_42.x = as_type<float>(_369);
    out.m_42.y = as_type<float>(_375);
    out.m_42.z = as_type<float>(_381);
    out.m_42.w = _168;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

