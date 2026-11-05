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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_37.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _405 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float2 _416 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float2 _424 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_424, float2(0.0), isnan(_424))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_39.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_39.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _63 * _88;
    float _104 = _63 * _94;
    float _106 = _63 * _100;
    float _108 = _102 * _102;
    float _110 = fma(_104, _104, _108);
    float _112 = fma(_106, _106, _110);
    float _114 = rsqrt(_112);
    float _116 = _102 * _114;
    float _118 = _104 * _114;
    float _120 = _106 * _114;
    float _122 = _116 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _124 = fma(_118, (*spvDescriptorSet0.fp_c4)._m0[2].x, _122);
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _128 = _126 + 1.0;
    float _130 = fma(_120, (*spvDescriptorSet0.fp_c4)._m0[2].z, _124);
    float _132 = fma(_130, 0.5, 0.5);
    float _134 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].x, _136);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = -_140;
    float _144 = _142 + 1.0;
    float _146 = abs(_144);
    float _148 = log2(_146);
    float _150 = _148 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _152 = exp2(_150);
    float _154 = fma(_152, _128, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _156 = fma(_154, 0.5, 0.5);
    float2 _557 = float2(_132, _156);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_557, float2(0.0), isnan(_557))).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _148 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _170 = exp2(_168);
    float _172 = -_170;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _176 = _71 * _174;
    float _178 = -_76;
    float _180 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _178);
    float _182 = -_80;
    float _184 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].x, _182);
    float _186 = fma(_176, _180, _76);
    float _188 = -_78;
    float _190 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = fma(_176, _184, _80);
    float _194 = _186 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _196 = fma(_176, _190, _78);
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _200 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _204 = _194 >= 1.41299998760223388671875;
    bool _206 = isnan(_194);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.41299998760223388671875);
    bool _212 = _208 || _210;
    bool _214 = _198 >= 1.41299998760223388671875;
    bool _216 = isnan(_198);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.41299998760223388671875);
    bool _222 = _218 || _220;
    bool _224 = _200 >= 1.41299998760223388671875;
    bool _226 = isnan(_200);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.41299998760223388671875);
    bool _232 = _228 || _230;
    int _235 = as_type<int>(_78);
    float _237 = _176;
    float _239 = _164;
    float _241 = _198;
    float _243 = _80;
    float _245 = _162;
    float _247 = _194;
    float _249 = _170;
    int _251 = as_type<int>(_200);
    if (!_212)
    {
        float _253 = _194 * 0.38317000865936279296875;
        _235 = as_type<int>(_253);
    }
    int _255 = _235;
    if (_212)
    {
        float _257 = _194 * (-1.44269502162933349609375);
        _237 = _257;
    }
    float _259 = _237;
    float _261 = _259;
    if (!_222)
    {
        float _263 = _198 * 0.38317000865936279296875;
        _239 = _263;
    }
    float _265 = _239;
    if (_222)
    {
        float _267 = _198 * (-1.44269502162933349609375);
        _241 = _267;
    }
    float _269 = _241;
    if (!_232)
    {
        float _271 = _200 * 0.38317000865936279296875;
        _243 = _271;
    }
    float _273 = _243;
    float _275 = _273;
    if (_232)
    {
        float _277 = _200 * (-1.44269502162933349609375);
        _245 = _277;
    }
    float _279 = _245;
    int _281 = _255;
    if (!_212)
    {
        float _283 = abs(as_type<float>(_255));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    if (!_232)
    {
        float _289 = abs(_273);
        float _291 = log2(_289);
        _275 = _291;
    }
    float _293 = _275;
    float _295 = _265;
    int _297 = as_type<int>(_293);
    if (!_222)
    {
        float _299 = abs(_265);
        float _301 = log2(_299);
        _295 = _301;
    }
    float _303 = _295;
    int _305 = _287;
    if (!_212)
    {
        float _307 = as_type<float>(_287) * 0.4545454680919647216796875;
        _247 = _307;
    }
    float _309 = _247;
    float _311 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
    if (_212)
    {
        float _313 = exp2(_259);
        _311 = _313;
    }
    float _315 = _311;
    if (!_222)
    {
        float _317 = _303 * 0.4545454680919647216796875;
        _249 = _317;
    }
    float _319 = _249;
    if (!_232)
    {
        float _321 = _293 * 0.4545454680919647216796875;
        _261 = _321;
    }
    float _323 = _261;
    float _325 = _279;
    if (_232)
    {
        float _327 = exp2(_279);
        _325 = _327;
    }
    float _329 = _325;
    float _331 = _269;
    if (_222)
    {
        float _333 = exp2(_269);
        _331 = _333;
    }
    float _335 = _331;
    if (!_212)
    {
        float _337 = exp2(_309);
        _251 = as_type<int>(_337);
    }
    int _339 = _251;
    int _341 = _339;
    if (!_232)
    {
        float _343 = exp2(_323);
        _305 = as_type<int>(_343);
    }
    int _345 = _305;
    int _347 = _345;
    if (!_222)
    {
        float _349 = exp2(_319);
        _297 = as_type<int>(_349);
    }
    int _351 = _297;
    int _353 = _351;
    if (_212)
    {
        float _355 = -_315;
        float _357 = _355 + 1.0;
        _341 = as_type<int>(_357);
    }
    int _359 = _341;
    if (_232)
    {
        float _361 = -_329;
        float _363 = _361 + 1.0;
        _347 = as_type<int>(_363);
    }
    int _365 = _347;
    if (_222)
    {
        float _367 = -_335;
        float _369 = _367 + 1.0;
        _353 = as_type<int>(_369);
    }
    int _371 = _353;
    out.m_42.x = as_type<float>(_359);
    out.m_42.y = as_type<float>(_365);
    out.m_42.z = as_type<float>(_371);
    out.m_42.w = _82;
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
    float _51 = in.m_37.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _405 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float2 _416 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_416, float2(0.0), isnan(_416))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_416, float2(0.0), isnan(_416))).x;
    float2 _424 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_424, float2(0.0), isnan(_424))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_424, float2(0.0), isnan(_424))).xyzw;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = _74.z;
    float _82 = _74.w;
    float _84 = in.m_39.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_39.x;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = in.m_39.z;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = _63 * _88;
    float _104 = _63 * _94;
    float _106 = _63 * _100;
    float _108 = _102 * _102;
    float _110 = fma(_104, _104, _108);
    float _112 = fma(_106, _106, _110);
    float _114 = rsqrt(_112);
    float _116 = _102 * _114;
    float _118 = _104 * _114;
    float _120 = _106 * _114;
    float _122 = _116 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _124 = fma(_118, (*spvDescriptorSet0.fp_c4)._m0[2].x, _122);
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _128 = _126 + 1.0;
    float _130 = fma(_120, (*spvDescriptorSet0.fp_c4)._m0[2].z, _124);
    float _132 = fma(_130, 0.5, 0.5);
    float _134 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].x, _136);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = -_140;
    float _144 = _142 + 1.0;
    float _146 = abs(_144);
    float _148 = log2(_146);
    float _150 = _148 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _152 = exp2(_150);
    float _154 = fma(_152, _128, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _156 = fma(_154, 0.5, 0.5);
    float2 _557 = float2(_132, _156);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_557, float2(0.0), isnan(_557))).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _148 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _170 = exp2(_168);
    float _172 = -_170;
    float _174 = fma(_172, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _176 = _71 * _174;
    float _178 = -_76;
    float _180 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _178);
    float _182 = -_80;
    float _184 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].x, _182);
    float _186 = fma(_176, _180, _76);
    float _188 = -_78;
    float _190 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].x, _188);
    float _192 = fma(_176, _184, _80);
    float _194 = _186 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _196 = fma(_176, _190, _78);
    float _198 = _192 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _200 = _196 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _204 = _194 >= 1.41299998760223388671875;
    bool _206 = isnan(_194);
    bool _208 = _204 || _206;
    bool _210 = isnan(1.41299998760223388671875);
    bool _212 = _208 || _210;
    bool _214 = _198 >= 1.41299998760223388671875;
    bool _216 = isnan(_198);
    bool _218 = _214 || _216;
    bool _220 = isnan(1.41299998760223388671875);
    bool _222 = _218 || _220;
    bool _224 = _200 >= 1.41299998760223388671875;
    bool _226 = isnan(_200);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.41299998760223388671875);
    bool _232 = _228 || _230;
    int _235 = as_type<int>(_78);
    float _237 = _176;
    float _239 = _164;
    float _241 = _198;
    float _243 = _80;
    float _245 = _162;
    float _247 = _194;
    float _249 = _170;
    int _251 = as_type<int>(_200);
    if (!_212)
    {
        float _253 = _194 * 0.38317000865936279296875;
        _235 = as_type<int>(_253);
    }
    int _255 = _235;
    if (_212)
    {
        float _257 = _194 * (-1.44269502162933349609375);
        _237 = _257;
    }
    float _259 = _237;
    float _261 = _259;
    if (!_222)
    {
        float _263 = _198 * 0.38317000865936279296875;
        _239 = _263;
    }
    float _265 = _239;
    if (_222)
    {
        float _267 = _198 * (-1.44269502162933349609375);
        _241 = _267;
    }
    float _269 = _241;
    if (!_232)
    {
        float _271 = _200 * 0.38317000865936279296875;
        _243 = _271;
    }
    float _273 = _243;
    float _275 = _273;
    if (_232)
    {
        float _277 = _200 * (-1.44269502162933349609375);
        _245 = _277;
    }
    float _279 = _245;
    int _281 = _255;
    if (!_212)
    {
        float _283 = abs(as_type<float>(_255));
        float _285 = log2(_283);
        _281 = as_type<int>(_285);
    }
    int _287 = _281;
    if (!_232)
    {
        float _289 = abs(_273);
        float _291 = log2(_289);
        _275 = _291;
    }
    float _293 = _275;
    float _295 = _265;
    int _297 = as_type<int>(_293);
    if (!_222)
    {
        float _299 = abs(_265);
        float _301 = log2(_299);
        _295 = _301;
    }
    float _303 = _295;
    int _305 = _287;
    if (!_212)
    {
        float _307 = as_type<float>(_287) * 0.4545454680919647216796875;
        _247 = _307;
    }
    float _309 = _247;
    float _311 = (*spvDescriptorSet0.fp_c4)._m0[5].z;
    if (_212)
    {
        float _313 = exp2(_259);
        _311 = _313;
    }
    float _315 = _311;
    if (!_222)
    {
        float _317 = _303 * 0.4545454680919647216796875;
        _249 = _317;
    }
    float _319 = _249;
    if (!_232)
    {
        float _321 = _293 * 0.4545454680919647216796875;
        _261 = _321;
    }
    float _323 = _261;
    float _325 = _279;
    if (_232)
    {
        float _327 = exp2(_279);
        _325 = _327;
    }
    float _329 = _325;
    float _331 = _269;
    if (_222)
    {
        float _333 = exp2(_269);
        _331 = _333;
    }
    float _335 = _331;
    if (!_212)
    {
        float _337 = exp2(_309);
        _251 = as_type<int>(_337);
    }
    int _339 = _251;
    int _341 = _339;
    if (!_232)
    {
        float _343 = exp2(_323);
        _305 = as_type<int>(_343);
    }
    int _345 = _305;
    int _347 = _345;
    if (!_222)
    {
        float _349 = exp2(_319);
        _297 = as_type<int>(_349);
    }
    int _351 = _297;
    int _353 = _351;
    if (_212)
    {
        float _355 = -_315;
        float _357 = _355 + 1.0;
        _341 = as_type<int>(_357);
    }
    int _359 = _341;
    if (_232)
    {
        float _361 = -_329;
        float _363 = _361 + 1.0;
        _347 = as_type<int>(_363);
    }
    int _365 = _347;
    if (_222)
    {
        float _367 = -_335;
        float _369 = _367 + 1.0;
        _353 = as_type<int>(_369);
    }
    int _371 = _353;
    out.m_42.x = as_type<float>(_359);
    out.m_42.y = as_type<float>(_365);
    out.m_42.z = as_type<float>(_371);
    out.m_42.w = _82;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

