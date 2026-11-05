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
    float2 _465 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _476 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_476, float2(0.0), isnan(_476))).x;
    float2 _484 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
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
    float _132 = fma(_130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _134 = sqrt(_128);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _138 = _136 + 1.0;
    float _140 = fma(_130, _132, -0.212114393711090087890625);
    float _142 = fma(_130, _140, 1.570728778839111328125);
    float _144 = _134 * 0.636619746685028076171875;
    float _146 = -_142;
    float _148 = fma(_144, _146, 1.0);
    float _150 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _154 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[7].x, _152);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = -_156;
    float _160 = _158 + 1.0;
    float _162 = abs(_160);
    float _164 = log2(_162);
    float _166 = _164 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _138, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _642 = float2(_148, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_642, float2(0.0), isnan(_642))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _164 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _188 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = exp2(_184);
    float _194 = -_190;
    float _196 = _194 + 1.0;
    float _198 = abs(_196);
    float _200 = log2(_198);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _206 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _208 = _71 * _204;
    float _210 = _200 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _212 = exp2(_210);
    float _214 = -_212;
    float _216 = fma(_206, _214, _206);
    float _218 = _71 * _216;
    float _220 = -_76;
    float _222 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = -_80;
    float _226 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _224);
    float _228 = fma(_208, _222, _76);
    float _230 = fma(_208, _226, _80);
    float _232 = -_228;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _236 = fma(_218, _234, _228);
    float _238 = -_78;
    float _240 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _238);
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _244 = fma(_208, _240, _78);
    float _246 = -_244;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _252 = _242 >= 1.41299998760223388671875;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = fma(_218, _248, _244);
    float _264 = -_230;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _268 = _262 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _270 = fma(_218, _266, _230);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _274 = _268 >= 1.41299998760223388671875;
    bool _276 = isnan(_268);
    bool _278 = _274 || _276;
    bool _280 = isnan(1.41299998760223388671875);
    bool _282 = _278 || _280;
    float _284 = _71;
    float _286 = _192;
    float _288 = _210;
    int _291 = as_type<int>(_80);
    float _293 = _242;
    float _295 = _180;
    float _297 = _208;
    float _299 = _206;
    int _301 = as_type<int>(_272);
    int _303 = as_type<int>(_268);
    if (!_260)
    {
        float _305 = _242 * 0.38317000865936279296875;
        _284 = _305;
    }
    float _307 = _284;
    if (_260)
    {
        float _309 = _242 * (-1.44269502162933349609375);
        _286 = _309;
    }
    float _311 = _286;
    bool _313 = _272 >= 1.41299998760223388671875;
    bool _315 = isnan(_272);
    bool _317 = _313 || _315;
    bool _319 = isnan(1.41299998760223388671875);
    bool _321 = _317 || _319;
    float _323 = _311;
    if (_260)
    {
        float _325 = exp2(_311);
        _288 = _325;
    }
    float _327 = _288;
    if (!_282)
    {
        float _329 = _268 * 0.38317000865936279296875;
        _291 = as_type<int>(_329);
    }
    int _331 = _291;
    float _333 = _307;
    if (!_260)
    {
        float _335 = abs(_307);
        float _337 = log2(_335);
        _333 = _337;
    }
    float _339 = _333;
    if (_282)
    {
        float _341 = _268 * (-1.44269502162933349609375);
        _293 = _341;
    }
    float _343 = _293;
    if (!_321)
    {
        float _345 = _272 * 0.38317000865936279296875;
        _295 = _345;
    }
    float _347 = _295;
    if (_321)
    {
        float _349 = _272 * (-1.44269502162933349609375);
        _297 = _349;
    }
    float _351 = _297;
    int _353 = _331;
    if (!_282)
    {
        float _355 = abs(as_type<float>(_331));
        float _357 = log2(_355);
        _353 = as_type<int>(_357);
    }
    int _359 = _353;
    float _361 = _347;
    if (!_321)
    {
        float _363 = abs(_347);
        float _365 = log2(_363);
        _361 = _365;
    }
    float _367 = _361;
    float _369 = _339;
    if (!_260)
    {
        float _371 = _339 * 0.4545454680919647216796875;
        _369 = _371;
    }
    float _373 = _369;
    int _375 = _359;
    if (!_282)
    {
        float _377 = as_type<float>(_359) * 0.4545454680919647216796875;
        _323 = _377;
    }
    float _379 = _323;
    float _381 = _343;
    if (_282)
    {
        float _383 = exp2(_343);
        _381 = _383;
    }
    float _385 = _381;
    if (!_321)
    {
        float _387 = _367 * 0.4545454680919647216796875;
        _299 = _387;
    }
    float _389 = _299;
    float _391 = _351;
    if (_321)
    {
        float _393 = exp2(_351);
        _391 = _393;
    }
    float _395 = _391;
    if (!_260)
    {
        float _397 = exp2(_373);
        _301 = as_type<int>(_397);
    }
    int _399 = _301;
    int _401 = _399;
    if (!_282)
    {
        float _403 = exp2(_379);
        _303 = as_type<int>(_403);
    }
    int _405 = _303;
    int _407 = _405;
    if (!_321)
    {
        float _409 = exp2(_389);
        _375 = as_type<int>(_409);
    }
    int _411 = _375;
    int _413 = _411;
    if (_260)
    {
        float _415 = -_327;
        float _417 = _415 + 1.0;
        _401 = as_type<int>(_417);
    }
    int _419 = _401;
    if (_282)
    {
        float _421 = -_385;
        float _423 = _421 + 1.0;
        _407 = as_type<int>(_423);
    }
    int _425 = _407;
    if (_321)
    {
        float _427 = -_395;
        float _429 = _427 + 1.0;
        _413 = as_type<int>(_429);
    }
    int _431 = _413;
    out.m_42.x = as_type<float>(_419);
    out.m_42.y = as_type<float>(_425);
    out.m_42.z = as_type<float>(_431);
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
    float2 _465 = float2(_65, _67);
    float _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _476 = float2(_65, _67);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_476, float2(0.0), isnan(_476))).x;
    float2 _484 = float2(_65, _67);
    float4 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
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
    float _132 = fma(_130, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _134 = sqrt(_128);
    float _136 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _138 = _136 + 1.0;
    float _140 = fma(_130, _132, -0.212114393711090087890625);
    float _142 = fma(_130, _140, 1.570728778839111328125);
    float _144 = _134 * 0.636619746685028076171875;
    float _146 = -_142;
    float _148 = fma(_144, _146, 1.0);
    float _150 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[5].z, (*spvDescriptorSet0.fp_c4)._m0[5].x);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _154 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[7].x, _152);
    float _156 = precise::clamp(_154, 0.0, 1.0);
    float _158 = -_156;
    float _160 = _158 + 1.0;
    float _162 = abs(_160);
    float _164 = log2(_162);
    float _166 = _164 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _138, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _642 = float2(_148, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_642, float2(0.0), isnan(_642))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_642, float2(0.0), isnan(_642))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _164 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _188 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = exp2(_184);
    float _194 = -_190;
    float _196 = _194 + 1.0;
    float _198 = abs(_196);
    float _200 = log2(_198);
    float _202 = -_192;
    float _204 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _206 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _208 = _71 * _204;
    float _210 = _200 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _212 = exp2(_210);
    float _214 = -_212;
    float _216 = fma(_206, _214, _206);
    float _218 = _71 * _216;
    float _220 = -_76;
    float _222 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = -_80;
    float _226 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _224);
    float _228 = fma(_208, _222, _76);
    float _230 = fma(_208, _226, _80);
    float _232 = -_228;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _236 = fma(_218, _234, _228);
    float _238 = -_78;
    float _240 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _238);
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _244 = fma(_208, _240, _78);
    float _246 = -_244;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _252 = _242 >= 1.41299998760223388671875;
    bool _254 = isnan(_242);
    bool _256 = _252 || _254;
    bool _258 = isnan(1.41299998760223388671875);
    bool _260 = _256 || _258;
    float _262 = fma(_218, _248, _244);
    float _264 = -_230;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _268 = _262 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _270 = fma(_218, _266, _230);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _274 = _268 >= 1.41299998760223388671875;
    bool _276 = isnan(_268);
    bool _278 = _274 || _276;
    bool _280 = isnan(1.41299998760223388671875);
    bool _282 = _278 || _280;
    float _284 = _71;
    float _286 = _192;
    float _288 = _210;
    int _291 = as_type<int>(_80);
    float _293 = _242;
    float _295 = _180;
    float _297 = _208;
    float _299 = _206;
    int _301 = as_type<int>(_272);
    int _303 = as_type<int>(_268);
    if (!_260)
    {
        float _305 = _242 * 0.38317000865936279296875;
        _284 = _305;
    }
    float _307 = _284;
    if (_260)
    {
        float _309 = _242 * (-1.44269502162933349609375);
        _286 = _309;
    }
    float _311 = _286;
    bool _313 = _272 >= 1.41299998760223388671875;
    bool _315 = isnan(_272);
    bool _317 = _313 || _315;
    bool _319 = isnan(1.41299998760223388671875);
    bool _321 = _317 || _319;
    float _323 = _311;
    if (_260)
    {
        float _325 = exp2(_311);
        _288 = _325;
    }
    float _327 = _288;
    if (!_282)
    {
        float _329 = _268 * 0.38317000865936279296875;
        _291 = as_type<int>(_329);
    }
    int _331 = _291;
    float _333 = _307;
    if (!_260)
    {
        float _335 = abs(_307);
        float _337 = log2(_335);
        _333 = _337;
    }
    float _339 = _333;
    if (_282)
    {
        float _341 = _268 * (-1.44269502162933349609375);
        _293 = _341;
    }
    float _343 = _293;
    if (!_321)
    {
        float _345 = _272 * 0.38317000865936279296875;
        _295 = _345;
    }
    float _347 = _295;
    if (_321)
    {
        float _349 = _272 * (-1.44269502162933349609375);
        _297 = _349;
    }
    float _351 = _297;
    int _353 = _331;
    if (!_282)
    {
        float _355 = abs(as_type<float>(_331));
        float _357 = log2(_355);
        _353 = as_type<int>(_357);
    }
    int _359 = _353;
    float _361 = _347;
    if (!_321)
    {
        float _363 = abs(_347);
        float _365 = log2(_363);
        _361 = _365;
    }
    float _367 = _361;
    float _369 = _339;
    if (!_260)
    {
        float _371 = _339 * 0.4545454680919647216796875;
        _369 = _371;
    }
    float _373 = _369;
    int _375 = _359;
    if (!_282)
    {
        float _377 = as_type<float>(_359) * 0.4545454680919647216796875;
        _323 = _377;
    }
    float _379 = _323;
    float _381 = _343;
    if (_282)
    {
        float _383 = exp2(_343);
        _381 = _383;
    }
    float _385 = _381;
    if (!_321)
    {
        float _387 = _367 * 0.4545454680919647216796875;
        _299 = _387;
    }
    float _389 = _299;
    float _391 = _351;
    if (_321)
    {
        float _393 = exp2(_351);
        _391 = _393;
    }
    float _395 = _391;
    if (!_260)
    {
        float _397 = exp2(_373);
        _301 = as_type<int>(_397);
    }
    int _399 = _301;
    int _401 = _399;
    if (!_282)
    {
        float _403 = exp2(_379);
        _303 = as_type<int>(_403);
    }
    int _405 = _303;
    int _407 = _405;
    if (!_321)
    {
        float _409 = exp2(_389);
        _375 = as_type<int>(_409);
    }
    int _411 = _375;
    int _413 = _411;
    if (_260)
    {
        float _415 = -_327;
        float _417 = _415 + 1.0;
        _401 = as_type<int>(_417);
    }
    int _419 = _401;
    if (_282)
    {
        float _421 = -_385;
        float _423 = _421 + 1.0;
        _407 = as_type<int>(_423);
    }
    int _425 = _407;
    if (_321)
    {
        float _427 = -_395;
        float _429 = _427 + 1.0;
        _413 = as_type<int>(_429);
    }
    int _431 = _413;
    out.m_42.x = as_type<float>(_419);
    out.m_42.y = as_type<float>(_425);
    out.m_42.z = as_type<float>(_431);
    out.m_42.w = _82;
    return main0_out_u{as_type<uint4>(out.m_42)};
}

