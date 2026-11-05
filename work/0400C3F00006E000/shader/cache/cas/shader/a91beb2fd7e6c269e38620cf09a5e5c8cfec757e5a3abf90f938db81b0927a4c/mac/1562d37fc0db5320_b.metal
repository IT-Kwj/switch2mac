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
    float2 _421 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float2 _432 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float2 _440 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440))).xyzw;
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
    float _126 = fma(_120, (*spvDescriptorSet0.fp_c4)._m0[2].z, _124);
    float _128 = fma(_126, -0.5, 0.5);
    float _130 = fma(_126, 0.5, 0.5);
    float _132 = sqrt(_128);
    float _134 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].x, _136);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = fma(_130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _144 = -_140;
    float _146 = _144 + 1.0;
    float _148 = fma(_130, _142, -0.212114393711090087890625);
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _152 = _150 + 1.0;
    float _154 = abs(_146);
    float _156 = log2(_154);
    float _158 = fma(_130, _148, 1.570728778839111328125);
    float _160 = _132 * 0.636619746685028076171875;
    float _162 = -_158;
    float _164 = fma(_160, _162, 1.0);
    float _166 = _156 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _152, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _598 = float2(_164, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_598, float2(0.0), isnan(_598))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _156 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = exp2(_184);
    float _188 = -_186;
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _192 = _71 * _190;
    float _194 = -_76;
    float _196 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _194);
    float _198 = -_80;
    float _200 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
    float _202 = fma(_192, _196, _76);
    float _204 = -_78;
    float _206 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = fma(_192, _200, _80);
    float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _212 = fma(_192, _206, _78);
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _220 = _210 >= 1.41299998760223388671875;
    bool _222 = isnan(_210);
    bool _224 = _220 || _222;
    bool _226 = isnan(1.41299998760223388671875);
    bool _228 = _224 || _226;
    bool _230 = _214 >= 1.41299998760223388671875;
    bool _232 = isnan(_214);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.41299998760223388671875);
    bool _238 = _234 || _236;
    bool _240 = _216 >= 1.41299998760223388671875;
    bool _242 = isnan(_216);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.41299998760223388671875);
    bool _248 = _244 || _246;
    int _251 = as_type<int>(_78);
    float _253 = (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _255 = _180;
    float _257 = _192;
    int _259 = as_type<int>(_80);
    float _261 = _178;
    float _263 = _210;
    float _265 = _214;
    int _267 = as_type<int>(_216);
    if (!_228)
    {
        float _269 = _210 * 0.38317000865936279296875;
        _251 = as_type<int>(_269);
    }
    int _271 = _251;
    if (_228)
    {
        float _273 = _210 * (-1.44269502162933349609375);
        _253 = _273;
    }
    float _275 = _253;
    float _277 = _275;
    if (!_238)
    {
        float _279 = _214 * 0.38317000865936279296875;
        _255 = _279;
    }
    float _281 = _255;
    if (_238)
    {
        float _283 = _214 * (-1.44269502162933349609375);
        _257 = _283;
    }
    float _285 = _257;
    if (!_248)
    {
        float _287 = _216 * 0.38317000865936279296875;
        _259 = as_type<int>(_287);
    }
    int _289 = _259;
    if (_248)
    {
        float _291 = _216 * (-1.44269502162933349609375);
        _261 = _291;
    }
    float _293 = _261;
    int _295 = _271;
    if (!_228)
    {
        float _297 = abs(as_type<float>(_271));
        float _299 = log2(_297);
        _295 = as_type<int>(_299);
    }
    int _301 = _295;
    int _303 = _289;
    if (!_248)
    {
        float _305 = abs(as_type<float>(_289));
        float _307 = log2(_305);
        _303 = as_type<int>(_307);
    }
    int _309 = _303;
    float _311 = _281;
    if (!_238)
    {
        float _313 = abs(_281);
        float _315 = log2(_313);
        _311 = _315;
    }
    float _317 = _311;
    int _319 = _301;
    if (!_228)
    {
        float _321 = as_type<float>(_301) * 0.4545454680919647216796875;
        _263 = _321;
    }
    float _323 = _263;
    float _325 = _158;
    if (_228)
    {
        float _327 = exp2(_275);
        _325 = _327;
    }
    float _329 = _325;
    int _331 = _309;
    if (!_248)
    {
        float _333 = as_type<float>(_309) * 0.4545454680919647216796875;
        _265 = _333;
    }
    float _335 = _265;
    float _337 = _293;
    if (_248)
    {
        float _339 = exp2(_293);
        _337 = _339;
    }
    float _341 = _337;
    if (!_238)
    {
        float _343 = _317 * 0.4545454680919647216796875;
        _277 = _343;
    }
    float _345 = _277;
    float _347 = _285;
    if (_238)
    {
        float _349 = exp2(_285);
        _347 = _349;
    }
    float _351 = _347;
    if (!_228)
    {
        float _353 = exp2(_323);
        _267 = as_type<int>(_353);
    }
    int _355 = _267;
    int _357 = _355;
    if (!_248)
    {
        float _359 = exp2(_335);
        _319 = as_type<int>(_359);
    }
    int _361 = _319;
    int _363 = _361;
    if (!_238)
    {
        float _365 = exp2(_345);
        _331 = as_type<int>(_365);
    }
    int _367 = _331;
    int _369 = _367;
    if (_228)
    {
        float _371 = -_329;
        float _373 = _371 + 1.0;
        _357 = as_type<int>(_373);
    }
    int _375 = _357;
    if (_248)
    {
        float _377 = -_341;
        float _379 = _377 + 1.0;
        _363 = as_type<int>(_379);
    }
    int _381 = _363;
    if (_238)
    {
        float _383 = -_351;
        float _385 = _383 + 1.0;
        _369 = as_type<int>(_385);
    }
    int _387 = _369;
    out.m_42.x = as_type<float>(_375);
    out.m_42.y = as_type<float>(_381);
    out.m_42.z = as_type<float>(_387);
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
    float2 _421 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float2 _432 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float2 _440 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440))).xyzw;
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
    float _126 = fma(_120, (*spvDescriptorSet0.fp_c4)._m0[2].z, _124);
    float _128 = fma(_126, -0.5, 0.5);
    float _130 = fma(_126, 0.5, 0.5);
    float _132 = sqrt(_128);
    float _134 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _138 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].x, _136);
    float _140 = precise::clamp(_138, 0.0, 1.0);
    float _142 = fma(_130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _144 = -_140;
    float _146 = _144 + 1.0;
    float _148 = fma(_130, _142, -0.212114393711090087890625);
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _152 = _150 + 1.0;
    float _154 = abs(_146);
    float _156 = log2(_154);
    float _158 = fma(_130, _148, 1.570728778839111328125);
    float _160 = _132 * 0.636619746685028076171875;
    float _162 = -_158;
    float _164 = fma(_160, _162, 1.0);
    float _166 = _156 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _152, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _598 = float2(_164, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_598, float2(0.0), isnan(_598))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_598, float2(0.0), isnan(_598))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _156 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = exp2(_184);
    float _188 = -_186;
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _192 = _71 * _190;
    float _194 = -_76;
    float _196 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _194);
    float _198 = -_80;
    float _200 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _198);
    float _202 = fma(_192, _196, _76);
    float _204 = -_78;
    float _206 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = fma(_192, _200, _80);
    float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _212 = fma(_192, _206, _78);
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _216 = _212 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _220 = _210 >= 1.41299998760223388671875;
    bool _222 = isnan(_210);
    bool _224 = _220 || _222;
    bool _226 = isnan(1.41299998760223388671875);
    bool _228 = _224 || _226;
    bool _230 = _214 >= 1.41299998760223388671875;
    bool _232 = isnan(_214);
    bool _234 = _230 || _232;
    bool _236 = isnan(1.41299998760223388671875);
    bool _238 = _234 || _236;
    bool _240 = _216 >= 1.41299998760223388671875;
    bool _242 = isnan(_216);
    bool _244 = _240 || _242;
    bool _246 = isnan(1.41299998760223388671875);
    bool _248 = _244 || _246;
    int _251 = as_type<int>(_78);
    float _253 = (*spvDescriptorSet0.fp_c3)._m0[8].z;
    float _255 = _180;
    float _257 = _192;
    int _259 = as_type<int>(_80);
    float _261 = _178;
    float _263 = _210;
    float _265 = _214;
    int _267 = as_type<int>(_216);
    if (!_228)
    {
        float _269 = _210 * 0.38317000865936279296875;
        _251 = as_type<int>(_269);
    }
    int _271 = _251;
    if (_228)
    {
        float _273 = _210 * (-1.44269502162933349609375);
        _253 = _273;
    }
    float _275 = _253;
    float _277 = _275;
    if (!_238)
    {
        float _279 = _214 * 0.38317000865936279296875;
        _255 = _279;
    }
    float _281 = _255;
    if (_238)
    {
        float _283 = _214 * (-1.44269502162933349609375);
        _257 = _283;
    }
    float _285 = _257;
    if (!_248)
    {
        float _287 = _216 * 0.38317000865936279296875;
        _259 = as_type<int>(_287);
    }
    int _289 = _259;
    if (_248)
    {
        float _291 = _216 * (-1.44269502162933349609375);
        _261 = _291;
    }
    float _293 = _261;
    int _295 = _271;
    if (!_228)
    {
        float _297 = abs(as_type<float>(_271));
        float _299 = log2(_297);
        _295 = as_type<int>(_299);
    }
    int _301 = _295;
    int _303 = _289;
    if (!_248)
    {
        float _305 = abs(as_type<float>(_289));
        float _307 = log2(_305);
        _303 = as_type<int>(_307);
    }
    int _309 = _303;
    float _311 = _281;
    if (!_238)
    {
        float _313 = abs(_281);
        float _315 = log2(_313);
        _311 = _315;
    }
    float _317 = _311;
    int _319 = _301;
    if (!_228)
    {
        float _321 = as_type<float>(_301) * 0.4545454680919647216796875;
        _263 = _321;
    }
    float _323 = _263;
    float _325 = _158;
    if (_228)
    {
        float _327 = exp2(_275);
        _325 = _327;
    }
    float _329 = _325;
    int _331 = _309;
    if (!_248)
    {
        float _333 = as_type<float>(_309) * 0.4545454680919647216796875;
        _265 = _333;
    }
    float _335 = _265;
    float _337 = _293;
    if (_248)
    {
        float _339 = exp2(_293);
        _337 = _339;
    }
    float _341 = _337;
    if (!_238)
    {
        float _343 = _317 * 0.4545454680919647216796875;
        _277 = _343;
    }
    float _345 = _277;
    float _347 = _285;
    if (_238)
    {
        float _349 = exp2(_285);
        _347 = _349;
    }
    float _351 = _347;
    if (!_228)
    {
        float _353 = exp2(_323);
        _267 = as_type<int>(_353);
    }
    int _355 = _267;
    int _357 = _355;
    if (!_248)
    {
        float _359 = exp2(_335);
        _319 = as_type<int>(_359);
    }
    int _361 = _319;
    int _363 = _361;
    if (!_238)
    {
        float _365 = exp2(_345);
        _331 = as_type<int>(_365);
    }
    int _367 = _331;
    int _369 = _367;
    if (_228)
    {
        float _371 = -_329;
        float _373 = _371 + 1.0;
        _357 = as_type<int>(_373);
    }
    int _375 = _357;
    if (_248)
    {
        float _377 = -_341;
        float _379 = _377 + 1.0;
        _363 = as_type<int>(_379);
    }
    int _381 = _363;
    if (_238)
    {
        float _383 = -_351;
        float _385 = _383 + 1.0;
        _369 = as_type<int>(_385);
    }
    int _387 = _369;
    out.m_42.x = as_type<float>(_375);
    out.m_42.y = as_type<float>(_381);
    out.m_42.z = as_type<float>(_387);
    out.m_42.w = _82;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

