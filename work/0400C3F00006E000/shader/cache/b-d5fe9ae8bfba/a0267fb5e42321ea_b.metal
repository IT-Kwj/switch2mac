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
    float2 _399 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).x;
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
    float _117 = fma(_115, 0.5, 0.5);
    float _119 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _123 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[7].x, _121);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = -_125;
    float _129 = _127 + 1.0;
    float _131 = abs(_129);
    float _133 = log2(_131);
    float _135 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _137 = exp2(_135);
    float _139 = fma(_137, _113, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _141 = fma(_139, 0.5, 0.5);
    float2 _527 = float2(_63, _65);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _543 = float2(_117, _141);
    float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_543, float2(0.0), isnan(_543))).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = exp2(_164);
    float _168 = -_166;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _172 = -_146;
    float _174 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _172);
    float _176 = -_150;
    float _178 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _176);
    float _180 = fma(_170, _174, _146);
    float _182 = fma(_170, _178, _150);
    float _184 = _180 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _186 = -_148;
    float _188 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = _182 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _192 = fma(_170, _188, _148);
    bool _196 = _184 >= 1.41299998760223388671875;
    bool _198 = isnan(_184);
    bool _200 = _196 || _198;
    bool _202 = isnan(1.41299998760223388671875);
    bool _204 = _200 || _202;
    bool _206 = _190 >= 1.41299998760223388671875;
    bool _208 = isnan(_190);
    bool _210 = _206 || _208;
    bool _212 = isnan(1.41299998760223388671875);
    bool _214 = _210 || _212;
    float _216 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _218 = _216 >= 1.41299998760223388671875;
    bool _220 = isnan(_216);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.41299998760223388671875);
    bool _226 = _222 || _224;
    float _228 = _146;
    float _230 = _184;
    float _232 = _170;
    float _234 = _160;
    int _237 = as_type<int>(_150);
    float _239 = _166;
    float _241 = _148;
    float _243 = _158;
    int _245 = as_type<int>(_216);
    int _247 = as_type<int>(_190);
    if (!_204)
    {
        float _249 = _184 * 0.38317000865936279296875;
        _228 = _249;
    }
    float _251 = _228;
    if (_204)
    {
        float _253 = _184 * (-1.44269502162933349609375);
        _230 = _253;
    }
    float _255 = _230;
    if (!_214)
    {
        float _257 = _190 * 0.38317000865936279296875;
        _232 = _257;
    }
    float _259 = _232;
    if (_214)
    {
        float _261 = _190 * (-1.44269502162933349609375);
        _234 = _261;
    }
    float _263 = _234;
    float _265 = _251;
    if (!_204)
    {
        float _267 = abs(_251);
        float _269 = log2(_267);
        _265 = _269;
    }
    float _271 = _265;
    if (!_226)
    {
        float _273 = _216 * 0.38317000865936279296875;
        _237 = as_type<int>(_273);
    }
    int _275 = _237;
    if (_226)
    {
        float _277 = _216 * (-1.44269502162933349609375);
        _239 = _277;
    }
    float _279 = _239;
    int _281 = _275;
    if (!_226)
    {
        float _283 = abs(as_type<float>(_275));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    float _289 = _259;
    if (!_214)
    {
        float _291 = abs(_259);
        float _293 = log2(_291);
        _289 = _293;
    }
    float _295 = _289;
    float _297 = _271;
    if (!_204)
    {
        float _299 = _271 * 0.4545454680919647216796875;
        _297 = _299;
    }
    float _301 = _297;
    int _303 = _287;
    if (!_226)
    {
        float _305 = as_type<float>(_287) * 0.4545454680919647216796875;
        _241 = _305;
    }
    float _307 = _241;
    float _309 = _255;
    if (_204)
    {
        float _311 = exp2(_255);
        _309 = _311;
    }
    float _313 = _309;
    if (!_214)
    {
        float _315 = _295 * 0.4545454680919647216796875;
        _243 = _315;
    }
    float _317 = _243;
    float _319 = _279;
    if (_226)
    {
        float _321 = exp2(_279);
        _319 = _321;
    }
    float _323 = _319;
    float _325 = _263;
    if (_214)
    {
        float _327 = exp2(_263);
        _325 = _327;
    }
    float _329 = _325;
    if (!_204)
    {
        float _331 = exp2(_301);
        _245 = as_type<int>(_331);
    }
    int _333 = _245;
    int _335 = _333;
    if (!_226)
    {
        float _337 = exp2(_307);
        _247 = as_type<int>(_337);
    }
    int _339 = _247;
    int _341 = _339;
    if (!_214)
    {
        float _343 = exp2(_317);
        _303 = as_type<int>(_343);
    }
    int _345 = _303;
    int _347 = _345;
    if (_204)
    {
        float _349 = -_313;
        float _351 = _349 + 1.0;
        _335 = as_type<int>(_351);
    }
    int _353 = _335;
    if (_226)
    {
        float _355 = -_323;
        float _357 = _355 + 1.0;
        _341 = as_type<int>(_357);
    }
    int _359 = _341;
    if (_214)
    {
        float _361 = -_329;
        float _363 = _361 + 1.0;
        _347 = as_type<int>(_363);
    }
    int _365 = _347;
    out.m_40.x = as_type<float>(_353);
    out.m_40.y = as_type<float>(_359);
    out.m_40.z = as_type<float>(_365);
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
    float2 _399 = float2(_63, _65);
    float _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_399, float2(0.0), isnan(_399))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_399, float2(0.0), isnan(_399))).x;
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
    float _117 = fma(_115, 0.5, 0.5);
    float _119 = fma(_67, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _121 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _123 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[7].x, _121);
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = -_125;
    float _129 = _127 + 1.0;
    float _131 = abs(_129);
    float _133 = log2(_131);
    float _135 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _137 = exp2(_135);
    float _139 = fma(_137, _113, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _141 = fma(_139, 0.5, 0.5);
    float2 _527 = float2(_63, _65);
    float4 _144 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_527, float2(0.0), isnan(_527))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_527, float2(0.0), isnan(_527))).xyzw;
    float _146 = _144.x;
    float _148 = _144.y;
    float _150 = _144.z;
    float _152 = _144.w;
    float2 _543 = float2(_117, _141);
    float3 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_543, float2(0.0), isnan(_543))).xyz;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _133 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _166 = exp2(_164);
    float _168 = -_166;
    float _170 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _172 = -_146;
    float _174 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[13].x, _172);
    float _176 = -_150;
    float _178 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _176);
    float _180 = fma(_170, _174, _146);
    float _182 = fma(_170, _178, _150);
    float _184 = _180 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _186 = -_148;
    float _188 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _186);
    float _190 = _182 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _192 = fma(_170, _188, _148);
    bool _196 = _184 >= 1.41299998760223388671875;
    bool _198 = isnan(_184);
    bool _200 = _196 || _198;
    bool _202 = isnan(1.41299998760223388671875);
    bool _204 = _200 || _202;
    bool _206 = _190 >= 1.41299998760223388671875;
    bool _208 = isnan(_190);
    bool _210 = _206 || _208;
    bool _212 = isnan(1.41299998760223388671875);
    bool _214 = _210 || _212;
    float _216 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _218 = _216 >= 1.41299998760223388671875;
    bool _220 = isnan(_216);
    bool _222 = _218 || _220;
    bool _224 = isnan(1.41299998760223388671875);
    bool _226 = _222 || _224;
    float _228 = _146;
    float _230 = _184;
    float _232 = _170;
    float _234 = _160;
    int _237 = as_type<int>(_150);
    float _239 = _166;
    float _241 = _148;
    float _243 = _158;
    int _245 = as_type<int>(_216);
    int _247 = as_type<int>(_190);
    if (!_204)
    {
        float _249 = _184 * 0.38317000865936279296875;
        _228 = _249;
    }
    float _251 = _228;
    if (_204)
    {
        float _253 = _184 * (-1.44269502162933349609375);
        _230 = _253;
    }
    float _255 = _230;
    if (!_214)
    {
        float _257 = _190 * 0.38317000865936279296875;
        _232 = _257;
    }
    float _259 = _232;
    if (_214)
    {
        float _261 = _190 * (-1.44269502162933349609375);
        _234 = _261;
    }
    float _263 = _234;
    float _265 = _251;
    if (!_204)
    {
        float _267 = abs(_251);
        float _269 = log2(_267);
        _265 = _269;
    }
    float _271 = _265;
    if (!_226)
    {
        float _273 = _216 * 0.38317000865936279296875;
        _237 = as_type<int>(_273);
    }
    int _275 = _237;
    if (_226)
    {
        float _277 = _216 * (-1.44269502162933349609375);
        _239 = _277;
    }
    float _279 = _239;
    int _281 = _275;
    if (!_226)
    {
        float _283 = abs(as_type<float>(_275));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    float _289 = _259;
    if (!_214)
    {
        float _291 = abs(_259);
        float _293 = log2(_291);
        _289 = _293;
    }
    float _295 = _289;
    float _297 = _271;
    if (!_204)
    {
        float _299 = _271 * 0.4545454680919647216796875;
        _297 = _299;
    }
    float _301 = _297;
    int _303 = _287;
    if (!_226)
    {
        float _305 = as_type<float>(_287) * 0.4545454680919647216796875;
        _241 = _305;
    }
    float _307 = _241;
    float _309 = _255;
    if (_204)
    {
        float _311 = exp2(_255);
        _309 = _311;
    }
    float _313 = _309;
    if (!_214)
    {
        float _315 = _295 * 0.4545454680919647216796875;
        _243 = _315;
    }
    float _317 = _243;
    float _319 = _279;
    if (_226)
    {
        float _321 = exp2(_279);
        _319 = _321;
    }
    float _323 = _319;
    float _325 = _263;
    if (_214)
    {
        float _327 = exp2(_263);
        _325 = _327;
    }
    float _329 = _325;
    if (!_204)
    {
        float _331 = exp2(_301);
        _245 = as_type<int>(_331);
    }
    int _333 = _245;
    int _335 = _333;
    if (!_226)
    {
        float _337 = exp2(_307);
        _247 = as_type<int>(_337);
    }
    int _339 = _247;
    int _341 = _339;
    if (!_214)
    {
        float _343 = exp2(_317);
        _303 = as_type<int>(_343);
    }
    int _345 = _303;
    int _347 = _345;
    if (_204)
    {
        float _349 = -_313;
        float _351 = _349 + 1.0;
        _335 = as_type<int>(_351);
    }
    int _353 = _335;
    if (_226)
    {
        float _355 = -_323;
        float _357 = _355 + 1.0;
        _341 = as_type<int>(_357);
    }
    int _359 = _341;
    if (_214)
    {
        float _361 = -_329;
        float _363 = _361 + 1.0;
        _347 = as_type<int>(_363);
    }
    int _365 = _347;
    out.m_40.x = as_type<float>(_353);
    out.m_40.y = as_type<float>(_359);
    out.m_40.z = as_type<float>(_365);
    out.m_40.w = _152;
    return main0_out_u{as_type<uint4>(out.m_40)};
}

