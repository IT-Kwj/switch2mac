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
    float2 _449 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_449, float2(0.0), isnan(_449))).x;
    float2 _460 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float2 _468 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).xyzw;
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
    float _128 = fma(_126, 0.5, 0.5);
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _132 = _130 + 1.0;
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
    float _154 = fma(_152, _132, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _156 = fma(_154, 0.5, 0.5);
    float2 _601 = float2(_128, _156);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_601, float2(0.0), isnan(_601))).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _148 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _172 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].x, _170);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = exp2(_168);
    float _178 = -_174;
    float _180 = _178 + 1.0;
    float _182 = abs(_180);
    float _184 = log2(_182);
    float _186 = -_176;
    float _188 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _190 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _192 = _71 * _188;
    float _194 = _184 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _196 = exp2(_194);
    float _198 = -_196;
    float _200 = fma(_190, _198, _190);
    float _202 = _71 * _200;
    float _204 = -_76;
    float _206 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = -_80;
    float _210 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = fma(_192, _206, _76);
    float _214 = fma(_192, _210, _80);
    float _216 = -_212;
    float _218 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _220 = fma(_202, _218, _212);
    float _222 = -_78;
    float _224 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].x, _222);
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _228 = fma(_192, _224, _78);
    float _230 = -_228;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _236 = _226 >= 1.41299998760223388671875;
    bool _238 = isnan(_226);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    float _246 = fma(_202, _232, _228);
    float _248 = -_214;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _252 = _246 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _254 = fma(_202, _250, _214);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _258 = _252 >= 1.41299998760223388671875;
    bool _260 = isnan(_252);
    bool _262 = _258 || _260;
    bool _264 = isnan(1.41299998760223388671875);
    bool _266 = _262 || _264;
    float _268 = _71;
    float _270 = _176;
    float _272 = _194;
    int _275 = as_type<int>(_80);
    float _277 = _226;
    float _279 = _164;
    float _281 = _214;
    float _283 = _190;
    int _285 = as_type<int>(_256);
    int _287 = as_type<int>(_252);
    if (!_244)
    {
        float _289 = _226 * 0.38317000865936279296875;
        _268 = _289;
    }
    float _291 = _268;
    if (_244)
    {
        float _293 = _226 * (-1.44269502162933349609375);
        _270 = _293;
    }
    float _295 = _270;
    bool _297 = _256 >= 1.41299998760223388671875;
    bool _299 = isnan(_256);
    bool _301 = _297 || _299;
    bool _303 = isnan(1.41299998760223388671875);
    bool _305 = _301 || _303;
    float _307 = _295;
    if (_244)
    {
        float _309 = exp2(_295);
        _272 = _309;
    }
    float _311 = _272;
    if (!_266)
    {
        float _313 = _252 * 0.38317000865936279296875;
        _275 = as_type<int>(_313);
    }
    int _315 = _275;
    float _317 = _291;
    if (!_244)
    {
        float _319 = abs(_291);
        float _321 = log2(_319);
        _317 = _321;
    }
    float _323 = _317;
    if (_266)
    {
        float _325 = _252 * (-1.44269502162933349609375);
        _277 = _325;
    }
    float _327 = _277;
    if (!_305)
    {
        float _329 = _256 * 0.38317000865936279296875;
        _279 = _329;
    }
    float _331 = _279;
    if (_305)
    {
        float _333 = _256 * (-1.44269502162933349609375);
        _281 = _333;
    }
    float _335 = _281;
    int _337 = _315;
    if (!_266)
    {
        float _339 = abs(as_type<float>(_315));
        float _341 = log2(_339);
        _337 = as_type<int>(_341);
    }
    int _343 = _337;
    float _345 = _331;
    if (!_305)
    {
        float _347 = abs(_331);
        float _349 = log2(_347);
        _345 = _349;
    }
    float _351 = _345;
    float _353 = _323;
    if (!_244)
    {
        float _355 = _323 * 0.4545454680919647216796875;
        _353 = _355;
    }
    float _357 = _353;
    int _359 = _343;
    if (!_266)
    {
        float _361 = as_type<float>(_343) * 0.4545454680919647216796875;
        _307 = _361;
    }
    float _363 = _307;
    float _365 = _327;
    if (_266)
    {
        float _367 = exp2(_327);
        _365 = _367;
    }
    float _369 = _365;
    if (!_305)
    {
        float _371 = _351 * 0.4545454680919647216796875;
        _283 = _371;
    }
    float _373 = _283;
    float _375 = _335;
    if (_305)
    {
        float _377 = exp2(_335);
        _375 = _377;
    }
    float _379 = _375;
    if (!_244)
    {
        float _381 = exp2(_357);
        _285 = as_type<int>(_381);
    }
    int _383 = _285;
    int _385 = _383;
    if (!_266)
    {
        float _387 = exp2(_363);
        _287 = as_type<int>(_387);
    }
    int _389 = _287;
    int _391 = _389;
    if (!_305)
    {
        float _393 = exp2(_373);
        _359 = as_type<int>(_393);
    }
    int _395 = _359;
    int _397 = _395;
    if (_244)
    {
        float _399 = -_311;
        float _401 = _399 + 1.0;
        _385 = as_type<int>(_401);
    }
    int _403 = _385;
    if (_266)
    {
        float _405 = -_369;
        float _407 = _405 + 1.0;
        _391 = as_type<int>(_407);
    }
    int _409 = _391;
    if (_305)
    {
        float _411 = -_379;
        float _413 = _411 + 1.0;
        _397 = as_type<int>(_413);
    }
    int _415 = _397;
    out.m_42.x = as_type<float>(_403);
    out.m_42.y = as_type<float>(_409);
    out.m_42.z = as_type<float>(_415);
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
    float2 _449 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_449, float2(0.0), isnan(_449))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_449, float2(0.0), isnan(_449))).x;
    float2 _460 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_460, float2(0.0), isnan(_460))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_460, float2(0.0), isnan(_460))).x;
    float2 _468 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_468, float2(0.0), isnan(_468))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_468, float2(0.0), isnan(_468))).xyzw;
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
    float _128 = fma(_126, 0.5, 0.5);
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _132 = _130 + 1.0;
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
    float _154 = fma(_152, _132, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _156 = fma(_154, 0.5, 0.5);
    float2 _601 = float2(_128, _156);
    float3 _160 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_601, float2(0.0), isnan(_601))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_601, float2(0.0), isnan(_601))).xyz;
    float _162 = _160.x;
    float _164 = _160.y;
    float _166 = _160.z;
    float _168 = _148 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _170 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _172 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[9].x, _170);
    float _174 = precise::clamp(_172, 0.0, 1.0);
    float _176 = exp2(_168);
    float _178 = -_174;
    float _180 = _178 + 1.0;
    float _182 = abs(_180);
    float _184 = log2(_182);
    float _186 = -_176;
    float _188 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _190 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _192 = _71 * _188;
    float _194 = _184 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _196 = exp2(_194);
    float _198 = -_196;
    float _200 = fma(_190, _198, _190);
    float _202 = _71 * _200;
    float _204 = -_76;
    float _206 = fma(_162, (*spvDescriptorSet0.fp_c3)._m0[13].x, _204);
    float _208 = -_80;
    float _210 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].x, _208);
    float _212 = fma(_192, _206, _76);
    float _214 = fma(_192, _210, _80);
    float _216 = -_212;
    float _218 = _216 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _220 = fma(_202, _218, _212);
    float _222 = -_78;
    float _224 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].x, _222);
    float _226 = _220 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _228 = fma(_192, _224, _78);
    float _230 = -_228;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _236 = _226 >= 1.41299998760223388671875;
    bool _238 = isnan(_226);
    bool _240 = _236 || _238;
    bool _242 = isnan(1.41299998760223388671875);
    bool _244 = _240 || _242;
    float _246 = fma(_202, _232, _228);
    float _248 = -_214;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _252 = _246 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _254 = fma(_202, _250, _214);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _258 = _252 >= 1.41299998760223388671875;
    bool _260 = isnan(_252);
    bool _262 = _258 || _260;
    bool _264 = isnan(1.41299998760223388671875);
    bool _266 = _262 || _264;
    float _268 = _71;
    float _270 = _176;
    float _272 = _194;
    int _275 = as_type<int>(_80);
    float _277 = _226;
    float _279 = _164;
    float _281 = _214;
    float _283 = _190;
    int _285 = as_type<int>(_256);
    int _287 = as_type<int>(_252);
    if (!_244)
    {
        float _289 = _226 * 0.38317000865936279296875;
        _268 = _289;
    }
    float _291 = _268;
    if (_244)
    {
        float _293 = _226 * (-1.44269502162933349609375);
        _270 = _293;
    }
    float _295 = _270;
    bool _297 = _256 >= 1.41299998760223388671875;
    bool _299 = isnan(_256);
    bool _301 = _297 || _299;
    bool _303 = isnan(1.41299998760223388671875);
    bool _305 = _301 || _303;
    float _307 = _295;
    if (_244)
    {
        float _309 = exp2(_295);
        _272 = _309;
    }
    float _311 = _272;
    if (!_266)
    {
        float _313 = _252 * 0.38317000865936279296875;
        _275 = as_type<int>(_313);
    }
    int _315 = _275;
    float _317 = _291;
    if (!_244)
    {
        float _319 = abs(_291);
        float _321 = log2(_319);
        _317 = _321;
    }
    float _323 = _317;
    if (_266)
    {
        float _325 = _252 * (-1.44269502162933349609375);
        _277 = _325;
    }
    float _327 = _277;
    if (!_305)
    {
        float _329 = _256 * 0.38317000865936279296875;
        _279 = _329;
    }
    float _331 = _279;
    if (_305)
    {
        float _333 = _256 * (-1.44269502162933349609375);
        _281 = _333;
    }
    float _335 = _281;
    int _337 = _315;
    if (!_266)
    {
        float _339 = abs(as_type<float>(_315));
        float _341 = log2(_339);
        _337 = as_type<int>(_341);
    }
    int _343 = _337;
    float _345 = _331;
    if (!_305)
    {
        float _347 = abs(_331);
        float _349 = log2(_347);
        _345 = _349;
    }
    float _351 = _345;
    float _353 = _323;
    if (!_244)
    {
        float _355 = _323 * 0.4545454680919647216796875;
        _353 = _355;
    }
    float _357 = _353;
    int _359 = _343;
    if (!_266)
    {
        float _361 = as_type<float>(_343) * 0.4545454680919647216796875;
        _307 = _361;
    }
    float _363 = _307;
    float _365 = _327;
    if (_266)
    {
        float _367 = exp2(_327);
        _365 = _367;
    }
    float _369 = _365;
    if (!_305)
    {
        float _371 = _351 * 0.4545454680919647216796875;
        _283 = _371;
    }
    float _373 = _283;
    float _375 = _335;
    if (_305)
    {
        float _377 = exp2(_335);
        _375 = _377;
    }
    float _379 = _375;
    if (!_244)
    {
        float _381 = exp2(_357);
        _285 = as_type<int>(_381);
    }
    int _383 = _285;
    int _385 = _383;
    if (!_266)
    {
        float _387 = exp2(_363);
        _287 = as_type<int>(_387);
    }
    int _389 = _287;
    int _391 = _389;
    if (!_305)
    {
        float _393 = exp2(_373);
        _359 = as_type<int>(_393);
    }
    int _395 = _359;
    int _397 = _395;
    if (_244)
    {
        float _399 = -_311;
        float _401 = _399 + 1.0;
        _385 = as_type<int>(_401);
    }
    int _403 = _385;
    if (_266)
    {
        float _405 = -_369;
        float _407 = _405 + 1.0;
        _391 = as_type<int>(_407);
    }
    int _409 = _391;
    if (_305)
    {
        float _411 = -_379;
        float _413 = _411 + 1.0;
        _397 = as_type<int>(_413);
    }
    int _415 = _397;
    out.m_42.x = as_type<float>(_403);
    out.m_42.y = as_type<float>(_409);
    out.m_42.z = as_type<float>(_415);
    out.m_42.w = _82;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

