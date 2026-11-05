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
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _43 = gl_FragCoord.w;
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = _65 * _77;
    float _81 = _67 * _77;
    float _83 = _69 * _77;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _89 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _91 = fma(_89, -0.5, 0.5);
    float _93 = fma(_89, 0.5, 0.5);
    float _95 = fma(_93, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _97 = sqrt(_91);
    float _99 = fma(_93, _95, -0.212114393711090087890625);
    float _101 = _79 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _103 = fma(_93, _99, 1.570728778839111328125);
    float _105 = fma(_101, 0.5, 0.5);
    float _107 = _97 * 0.636619746685028076171875;
    float _109 = -_103;
    float _111 = fma(_107, _109, 1.0);
    float2 _485 = float2(_111, _105);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_485, float2(0.0), isnan(_485))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = 0.0 + _101;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = in.m_33.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = abs(_126);
    float _136 = log2(_134);
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _140 = _138 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _144 = exp2(_142);
    float _146 = _63 * _132;
    float _148 = fma(_144, _140, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _150 = _148 * _146;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _154 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _152);
    float _156 = _122 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _162 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
    float _164 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _166 = fma(_158, _162, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _168 = -_164;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _172 = fma(_150, _170, _164);
    float _174 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _180 = fma(_158, _176, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _182 = -_166;
    float _184 = _182 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _186 = -_180;
    float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _190 = fma(_150, _184, _166);
    bool _194 = _178 >= 1.41299998760223388671875;
    bool _196 = isnan(_178);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.41299998760223388671875);
    bool _202 = _198 || _200;
    float _204 = fma(_150, _188, _180);
    float _206 = _190 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _208 = _204 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _210 = _206 >= 1.41299998760223388671875;
    bool _212 = isnan(_206);
    bool _214 = _210 || _212;
    bool _216 = isnan(1.41299998760223388671875);
    bool _218 = _214 || _216;
    bool _220 = _208 >= 1.41299998760223388671875;
    bool _222 = isnan(_208);
    bool _224 = _220 || _222;
    bool _226 = isnan(1.41299998760223388671875);
    bool _228 = _224 || _226;
    int _231 = as_type<int>(_166);
    float _233 = _118;
    float _235 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _237 = _144;
    int _239 = as_type<int>(_180);
    float _241 = _208;
    float _243 = _178;
    float _245 = _150;
    int _247 = as_type<int>(_206);
    if (!_202)
    {
        float _249 = _178 * 0.38317000865936279296875;
        _231 = as_type<int>(_249);
    }
    int _251 = _231;
    if (_202)
    {
        float _253 = _178 * (-1.44269502162933349609375);
        _233 = _253;
    }
    float _255 = _233;
    float _257 = _255;
    if (_202)
    {
        float _259 = exp2(_255);
        _235 = _259;
    }
    float _261 = _235;
    if (!_218)
    {
        float _263 = _206 * 0.38317000865936279296875;
        _237 = _263;
    }
    float _265 = _237;
    float _267 = 0.0;
    if (_218)
    {
        float _269 = _206 * (-1.44269502162933349609375);
        _267 = _269;
    }
    float _271 = _267;
    if (!_228)
    {
        float _273 = _208 * 0.38317000865936279296875;
        _239 = as_type<int>(_273);
    }
    int _275 = _239;
    if (_228)
    {
        float _277 = _208 * (-1.44269502162933349609375);
        _241 = _277;
    }
    float _279 = _241;
    int _281 = _251;
    if (!_202)
    {
        float _283 = abs(as_type<float>(_251));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    int _289 = _275;
    if (!_228)
    {
        float _291 = abs(as_type<float>(_275));
        float _293 = log2(_291);
        _289 = as_type<int>(_293);
    }
    int _295 = _289;
    float _297 = _265;
    if (!_218)
    {
        float _299 = abs(_265);
        float _301 = log2(_299);
        _297 = _301;
    }
    float _303 = _297;
    int _305 = _287;
    if (!_202)
    {
        float _307 = as_type<float>(_287) * 0.4545454680919647216796875;
        _243 = _307;
    }
    float _309 = _243;
    int _311 = _295;
    if (!_228)
    {
        float _313 = as_type<float>(_295) * 0.4545454680919647216796875;
        _257 = _313;
    }
    float _315 = _257;
    float _317 = _279;
    if (_228)
    {
        float _319 = exp2(_279);
        _317 = _319;
    }
    float _321 = _317;
    if (!_218)
    {
        float _323 = _303 * 0.4545454680919647216796875;
        _245 = _323;
    }
    float _325 = _245;
    if (!_228)
    {
        float _327 = exp2(_315);
        _247 = as_type<int>(_327);
    }
    int _329 = _247;
    float _331 = _271;
    int _333 = _329;
    if (_218)
    {
        float _335 = exp2(_271);
        _331 = _335;
    }
    float _337 = _331;
    if (!_202)
    {
        float _339 = exp2(_309);
        _305 = as_type<int>(_339);
    }
    int _341 = _305;
    int _343 = _341;
    if (_228)
    {
        float _345 = -_321;
        float _347 = _345 + 1.0;
        _333 = as_type<int>(_347);
    }
    int _349 = _333;
    if (!_218)
    {
        float _351 = exp2(_325);
        _311 = as_type<int>(_351);
    }
    int _353 = _311;
    int _355 = _353;
    if (_202)
    {
        float _357 = -_261;
        float _359 = _357 + 1.0;
        _343 = as_type<int>(_359);
    }
    int _361 = _343;
    if (_218)
    {
        float _363 = -_337;
        float _365 = _363 + 1.0;
        _355 = as_type<int>(_365);
    }
    int _367 = _355;
    out.m_36.x = as_type<float>(_361);
    out.m_36.y = as_type<float>(_349);
    out.m_36.z = as_type<float>(_367);
    out.m_36.w = 1.0;
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
    float _45 = in.m_31.y;
    float _47 = gl_FragCoord.w;
    float _49 = _45 * _47;
    float _51 = in.m_31.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_31.z;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _43;
    float _65 = _63 * _49;
    float _67 = _63 * _55;
    float _69 = _63 * _61;
    float _71 = _65 * _65;
    float _73 = fma(_67, _67, _71);
    float _75 = fma(_69, _69, _73);
    float _77 = rsqrt(_75);
    float _79 = _65 * _77;
    float _81 = _67 * _77;
    float _83 = _69 * _77;
    float _85 = _79 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _87 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[2].x, _85);
    float _89 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _91 = fma(_89, -0.5, 0.5);
    float _93 = fma(_89, 0.5, 0.5);
    float _95 = fma(_93, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _97 = sqrt(_91);
    float _99 = fma(_93, _95, -0.212114393711090087890625);
    float _101 = _79 * (*spvDescriptorSet0.fp_c3)._m0[14].x;
    float _103 = fma(_93, _99, 1.570728778839111328125);
    float _105 = fma(_101, 0.5, 0.5);
    float _107 = _97 * 0.636619746685028076171875;
    float _109 = -_103;
    float _111 = fma(_107, _109, 1.0);
    float2 _485 = float2(_111, _105);
    float4 _114 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_485, float2(0.0), isnan(_485))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_485, float2(0.0), isnan(_485))).xyzw;
    float _116 = _114.x;
    float _118 = _114.y;
    float _120 = _114.z;
    float _122 = _114.w;
    float _124 = 0.0 + _101;
    float _126 = precise::clamp(_124, 0.0, 1.0);
    float _128 = in.m_33.x;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = abs(_126);
    float _136 = log2(_134);
    float _138 = -(*spvDescriptorSet0.fp_c3)._m0[10].w;
    float _140 = _138 + (*spvDescriptorSet0.fp_c3)._m0[10].z;
    float _142 = _136 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
    float _144 = exp2(_142);
    float _146 = _63 * _132;
    float _148 = fma(_144, _140, (*spvDescriptorSet0.fp_c3)._m0[10].w);
    float _150 = _148 * _146;
    float _152 = -(*spvDescriptorSet0.fp_c4)._m0[6].x;
    float _154 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[13].x, _152);
    float _156 = _122 + (*spvDescriptorSet0.fp_c4)._m0[6].w;
    float _158 = precise::clamp(_156, 0.0, 1.0);
    float _160 = -(*spvDescriptorSet0.fp_c4)._m0[6].z;
    float _162 = fma(_120, (*spvDescriptorSet0.fp_c3)._m0[13].x, _160);
    float _164 = fma(_158, _154, (*spvDescriptorSet0.fp_c4)._m0[6].x);
    float _166 = fma(_158, _162, (*spvDescriptorSet0.fp_c4)._m0[6].z);
    float _168 = -_164;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _172 = fma(_150, _170, _164);
    float _174 = -(*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _176 = fma(_118, (*spvDescriptorSet0.fp_c3)._m0[13].x, _174);
    float _178 = _172 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _180 = fma(_158, _176, (*spvDescriptorSet0.fp_c4)._m0[6].y);
    float _182 = -_166;
    float _184 = _182 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _186 = -_180;
    float _188 = _186 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    float _190 = fma(_150, _184, _166);
    bool _194 = _178 >= 1.41299998760223388671875;
    bool _196 = isnan(_178);
    bool _198 = _194 || _196;
    bool _200 = isnan(1.41299998760223388671875);
    bool _202 = _198 || _200;
    float _204 = fma(_150, _188, _180);
    float _206 = _190 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _208 = _204 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _210 = _206 >= 1.41299998760223388671875;
    bool _212 = isnan(_206);
    bool _214 = _210 || _212;
    bool _216 = isnan(1.41299998760223388671875);
    bool _218 = _214 || _216;
    bool _220 = _208 >= 1.41299998760223388671875;
    bool _222 = isnan(_208);
    bool _224 = _220 || _222;
    bool _226 = isnan(1.41299998760223388671875);
    bool _228 = _224 || _226;
    int _231 = as_type<int>(_166);
    float _233 = _118;
    float _235 = (*spvDescriptorSet0.fp_c3)._m0[13].x;
    float _237 = _144;
    int _239 = as_type<int>(_180);
    float _241 = _208;
    float _243 = _178;
    float _245 = _150;
    int _247 = as_type<int>(_206);
    if (!_202)
    {
        float _249 = _178 * 0.38317000865936279296875;
        _231 = as_type<int>(_249);
    }
    int _251 = _231;
    if (_202)
    {
        float _253 = _178 * (-1.44269502162933349609375);
        _233 = _253;
    }
    float _255 = _233;
    float _257 = _255;
    if (_202)
    {
        float _259 = exp2(_255);
        _235 = _259;
    }
    float _261 = _235;
    if (!_218)
    {
        float _263 = _206 * 0.38317000865936279296875;
        _237 = _263;
    }
    float _265 = _237;
    float _267 = 0.0;
    if (_218)
    {
        float _269 = _206 * (-1.44269502162933349609375);
        _267 = _269;
    }
    float _271 = _267;
    if (!_228)
    {
        float _273 = _208 * 0.38317000865936279296875;
        _239 = as_type<int>(_273);
    }
    int _275 = _239;
    if (_228)
    {
        float _277 = _208 * (-1.44269502162933349609375);
        _241 = _277;
    }
    float _279 = _241;
    int _281 = _251;
    if (!_202)
    {
        float _283 = abs(as_type<float>(_251));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    int _289 = _275;
    if (!_228)
    {
        float _291 = abs(as_type<float>(_275));
        float _293 = log2(_291);
        _289 = as_type<int>(_293);
    }
    int _295 = _289;
    float _297 = _265;
    if (!_218)
    {
        float _299 = abs(_265);
        float _301 = log2(_299);
        _297 = _301;
    }
    float _303 = _297;
    int _305 = _287;
    if (!_202)
    {
        float _307 = as_type<float>(_287) * 0.4545454680919647216796875;
        _243 = _307;
    }
    float _309 = _243;
    int _311 = _295;
    if (!_228)
    {
        float _313 = as_type<float>(_295) * 0.4545454680919647216796875;
        _257 = _313;
    }
    float _315 = _257;
    float _317 = _279;
    if (_228)
    {
        float _319 = exp2(_279);
        _317 = _319;
    }
    float _321 = _317;
    if (!_218)
    {
        float _323 = _303 * 0.4545454680919647216796875;
        _245 = _323;
    }
    float _325 = _245;
    if (!_228)
    {
        float _327 = exp2(_315);
        _247 = as_type<int>(_327);
    }
    int _329 = _247;
    float _331 = _271;
    int _333 = _329;
    if (_218)
    {
        float _335 = exp2(_271);
        _331 = _335;
    }
    float _337 = _331;
    if (!_202)
    {
        float _339 = exp2(_309);
        _305 = as_type<int>(_339);
    }
    int _341 = _305;
    int _343 = _341;
    if (_228)
    {
        float _345 = -_321;
        float _347 = _345 + 1.0;
        _333 = as_type<int>(_347);
    }
    int _349 = _333;
    if (!_218)
    {
        float _351 = exp2(_325);
        _311 = as_type<int>(_351);
    }
    int _353 = _311;
    int _355 = _353;
    if (_202)
    {
        float _357 = -_261;
        float _359 = _357 + 1.0;
        _343 = as_type<int>(_359);
    }
    int _361 = _343;
    if (_218)
    {
        float _363 = -_337;
        float _365 = _363 + 1.0;
        _355 = as_type<int>(_365);
    }
    int _367 = _355;
    out.m_36.x = as_type<float>(_361);
    out.m_36.y = as_type<float>(_349);
    out.m_36.z = as_type<float>(_367);
    out.m_36.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_36)};
}

