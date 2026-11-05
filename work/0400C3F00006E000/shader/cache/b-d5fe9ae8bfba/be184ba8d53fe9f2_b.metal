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
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _465 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _476 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_476, float2(0.0), isnan(_476))).x;
    float2 _484 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_39.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _65 * _90;
    float _106 = _65 * _96;
    float _108 = in.m_41.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _65 * _102;
    float _116 = _104 * _104;
    float _118 = fma(_106, _106, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _104 * _122;
    float _126 = _65 * _112;
    float _128 = _106 * _122;
    float _130 = _114 * _122;
    float _132 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _134 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[2].x, _132);
    float _136 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[2].z, _134);
    float _138 = -_71;
    float _140 = fma(_138, _126, 1.0);
    float _142 = 1.0 / _140;
    float _144 = _142 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[7].x, _146);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = -_150;
    float _154 = _152 + 1.0;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _158 = _156 + 1.0;
    float _160 = abs(_154);
    float _162 = log2(_160);
    float _164 = fma(_136, 0.5, 0.5);
    float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _158, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _632 = float2(_164, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_632, float2(0.0), isnan(_632))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _162 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _188 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = exp2(_184);
    float _194 = -_190;
    float _196 = _194 + 1.0;
    float _198 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _200 = abs(_196);
    float _202 = log2(_200);
    float _204 = -_192;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _208 = _73 * _206;
    float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _212 = exp2(_210);
    float _214 = -_212;
    float _216 = fma(_198, _214, _198);
    float _218 = _73 * _216;
    float _220 = -_78;
    float _222 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = -_82;
    float _226 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _224);
    float _228 = fma(_208, _222, _78);
    float _230 = fma(_208, _226, _82);
    float _232 = -_228;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _236 = fma(_218, _234, _228);
    float _238 = -_80;
    float _240 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _238);
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _244 = fma(_208, _240, _80);
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
    float _284 = _73;
    float _286 = _202;
    float _288 = _198;
    int _291 = as_type<int>(_82);
    float _293 = _242;
    float _295 = _180;
    float _297 = _208;
    float _299 = _192;
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
    out.m_44.x = as_type<float>(_419);
    out.m_44.y = as_type<float>(_425);
    out.m_44.z = as_type<float>(_431);
    out.m_44.w = _84;
    return out;
}


struct main0_out_u
{
    uint4 m_44 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_37.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_37.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _465 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _476 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_476, float2(0.0), isnan(_476))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_476, float2(0.0), isnan(_476))).x;
    float2 _484 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_484, float2(0.0), isnan(_484))).xyzw;
    float _78 = _76.x;
    float _80 = _76.y;
    float _82 = _76.z;
    float _84 = _76.w;
    float _86 = in.m_39.y;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_39.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_39.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = _65 * _90;
    float _106 = _65 * _96;
    float _108 = in.m_41.x;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _65 * _102;
    float _116 = _104 * _104;
    float _118 = fma(_106, _106, _116);
    float _120 = fma(_114, _114, _118);
    float _122 = rsqrt(_120);
    float _124 = _104 * _122;
    float _126 = _65 * _112;
    float _128 = _106 * _122;
    float _130 = _114 * _122;
    float _132 = _124 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _134 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[2].x, _132);
    float _136 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[2].z, _134);
    float _138 = -_71;
    float _140 = fma(_138, _126, 1.0);
    float _142 = 1.0 / _140;
    float _144 = _142 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _146 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _148 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[7].x, _146);
    float _150 = precise::clamp(_148, 0.0, 1.0);
    float _152 = -_150;
    float _154 = _152 + 1.0;
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _158 = _156 + 1.0;
    float _160 = abs(_154);
    float _162 = log2(_160);
    float _164 = fma(_136, 0.5, 0.5);
    float _166 = _162 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _168 = exp2(_166);
    float _170 = fma(_168, _158, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _172 = fma(_170, 0.5, 0.5);
    float2 _632 = float2(_164, _172);
    float3 _176 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_632, float2(0.0), isnan(_632))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_632, float2(0.0), isnan(_632))).xyz;
    float _178 = _176.x;
    float _180 = _176.y;
    float _182 = _176.z;
    float _184 = _162 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _186 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _188 = fma(_144, (*spvDescriptorSet0.fp_c3)._m0[9].x, _186);
    float _190 = precise::clamp(_188, 0.0, 1.0);
    float _192 = exp2(_184);
    float _194 = -_190;
    float _196 = _194 + 1.0;
    float _198 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _200 = abs(_196);
    float _202 = log2(_200);
    float _204 = -_192;
    float _206 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _208 = _73 * _206;
    float _210 = _202 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _212 = exp2(_210);
    float _214 = -_212;
    float _216 = fma(_198, _214, _198);
    float _218 = _73 * _216;
    float _220 = -_78;
    float _222 = fma(_178, (*spvDescriptorSet0.fp_c3)._m0[13].x, _220);
    float _224 = -_82;
    float _226 = fma(_182, (*spvDescriptorSet0.fp_c3)._m0[13].x, _224);
    float _228 = fma(_208, _222, _78);
    float _230 = fma(_208, _226, _82);
    float _232 = -_228;
    float _234 = _232 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _236 = fma(_218, _234, _228);
    float _238 = -_80;
    float _240 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[13].x, _238);
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _244 = fma(_208, _240, _80);
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
    float _284 = _73;
    float _286 = _202;
    float _288 = _198;
    int _291 = as_type<int>(_82);
    float _293 = _242;
    float _295 = _180;
    float _297 = _208;
    float _299 = _192;
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
    out.m_44.x = as_type<float>(_419);
    out.m_44.y = as_type<float>(_425);
    out.m_44.z = as_type<float>(_431);
    out.m_44.w = _84;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

