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
    float2 _481 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float2 _492 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float2 _500 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).xyzw;
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
    float _142 = fma(_136, -0.5, 0.5);
    float _144 = 1.0 / _140;
    float _146 = sqrt(_142);
    float _148 = fma(_136, 0.5, 0.5);
    float _150 = fma(_148, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _154 = _152 + 1.0;
    float _156 = _144 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _158 = fma(_148, _150, -0.212114393711090087890625);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _162 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = fma(_148, _158, 1.570728778839111328125);
    float _168 = -_164;
    float _170 = _168 + 1.0;
    float _172 = abs(_170);
    float _174 = log2(_172);
    float _176 = _146 * 0.636619746685028076171875;
    float _178 = -_166;
    float _180 = fma(_176, _178, 1.0);
    float _182 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _184 = exp2(_182);
    float _186 = fma(_184, _154, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _188 = fma(_186, 0.5, 0.5);
    float2 _673 = float2(_180, _188);
    float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_673, float2(0.0), isnan(_673))).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _204 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = exp2(_200);
    float _210 = -_206;
    float _212 = _210 + 1.0;
    float _214 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _216 = abs(_212);
    float _218 = log2(_216);
    float _220 = -_208;
    float _222 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _224 = _73 * _222;
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _228 = exp2(_226);
    float _230 = -_228;
    float _232 = fma(_214, _230, _214);
    float _234 = _73 * _232;
    float _236 = -_78;
    float _238 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _236);
    float _240 = -_82;
    float _242 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _240);
    float _244 = fma(_224, _238, _78);
    float _246 = fma(_224, _242, _82);
    float _248 = -_244;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _252 = fma(_234, _250, _244);
    float _254 = -_80;
    float _256 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _254);
    float _258 = _252 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _260 = fma(_224, _256, _80);
    float _262 = -_260;
    float _264 = _262 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _268 = _258 >= 1.41299998760223388671875;
    bool _270 = isnan(_258);
    bool _272 = _268 || _270;
    bool _274 = isnan(1.41299998760223388671875);
    bool _276 = _272 || _274;
    float _278 = fma(_234, _264, _260);
    float _280 = -_246;
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _284 = _278 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _286 = fma(_234, _282, _246);
    float _288 = _286 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _290 = _284 >= 1.41299998760223388671875;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.41299998760223388671875);
    bool _298 = _294 || _296;
    float _300 = _73;
    float _302 = _218;
    float _304 = _214;
    int _307 = as_type<int>(_82);
    float _309 = _258;
    float _311 = _196;
    float _313 = _246;
    float _315 = _208;
    int _317 = as_type<int>(_288);
    int _319 = as_type<int>(_284);
    if (!_276)
    {
        float _321 = _258 * 0.38317000865936279296875;
        _300 = _321;
    }
    float _323 = _300;
    if (_276)
    {
        float _325 = _258 * (-1.44269502162933349609375);
        _302 = _325;
    }
    float _327 = _302;
    bool _329 = _288 >= 1.41299998760223388671875;
    bool _331 = isnan(_288);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.41299998760223388671875);
    bool _337 = _333 || _335;
    float _339 = _327;
    if (_276)
    {
        float _341 = exp2(_327);
        _304 = _341;
    }
    float _343 = _304;
    if (!_298)
    {
        float _345 = _284 * 0.38317000865936279296875;
        _307 = as_type<int>(_345);
    }
    int _347 = _307;
    float _349 = _323;
    if (!_276)
    {
        float _351 = abs(_323);
        float _353 = log2(_351);
        _349 = _353;
    }
    float _355 = _349;
    if (_298)
    {
        float _357 = _284 * (-1.44269502162933349609375);
        _309 = _357;
    }
    float _359 = _309;
    if (!_337)
    {
        float _361 = _288 * 0.38317000865936279296875;
        _311 = _361;
    }
    float _363 = _311;
    if (_337)
    {
        float _365 = _288 * (-1.44269502162933349609375);
        _313 = _365;
    }
    float _367 = _313;
    int _369 = _347;
    if (!_298)
    {
        float _371 = abs(as_type<float>(_347));
        float _373 = log2(_371);
        _369 = as_type<int>(_373);
    }
    int _375 = _369;
    float _377 = _363;
    if (!_337)
    {
        float _379 = abs(_363);
        float _381 = log2(_379);
        _377 = _381;
    }
    float _383 = _377;
    float _385 = _355;
    if (!_276)
    {
        float _387 = _355 * 0.4545454680919647216796875;
        _385 = _387;
    }
    float _389 = _385;
    int _391 = _375;
    if (!_298)
    {
        float _393 = as_type<float>(_375) * 0.4545454680919647216796875;
        _339 = _393;
    }
    float _395 = _339;
    float _397 = _359;
    if (_298)
    {
        float _399 = exp2(_359);
        _397 = _399;
    }
    float _401 = _397;
    if (!_337)
    {
        float _403 = _383 * 0.4545454680919647216796875;
        _315 = _403;
    }
    float _405 = _315;
    float _407 = _367;
    if (_337)
    {
        float _409 = exp2(_367);
        _407 = _409;
    }
    float _411 = _407;
    if (!_276)
    {
        float _413 = exp2(_389);
        _317 = as_type<int>(_413);
    }
    int _415 = _317;
    int _417 = _415;
    if (!_298)
    {
        float _419 = exp2(_395);
        _319 = as_type<int>(_419);
    }
    int _421 = _319;
    int _423 = _421;
    if (!_337)
    {
        float _425 = exp2(_405);
        _391 = as_type<int>(_425);
    }
    int _427 = _391;
    int _429 = _427;
    if (_276)
    {
        float _431 = -_343;
        float _433 = _431 + 1.0;
        _417 = as_type<int>(_433);
    }
    int _435 = _417;
    if (_298)
    {
        float _437 = -_401;
        float _439 = _437 + 1.0;
        _423 = as_type<int>(_439);
    }
    int _441 = _423;
    if (_337)
    {
        float _443 = -_411;
        float _445 = _443 + 1.0;
        _429 = as_type<int>(_445);
    }
    int _447 = _429;
    out.m_44.x = as_type<float>(_435);
    out.m_44.y = as_type<float>(_441);
    out.m_44.z = as_type<float>(_447);
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
    float2 _481 = float2(_67, _69);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float2 _492 = float2(_67, _69);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float2 _500 = float2(_67, _69);
    float4 _76 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_500, float2(0.0), isnan(_500))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_500, float2(0.0), isnan(_500))).xyzw;
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
    float _142 = fma(_136, -0.5, 0.5);
    float _144 = 1.0 / _140;
    float _146 = sqrt(_142);
    float _148 = fma(_136, 0.5, 0.5);
    float _150 = fma(_148, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _152 = -(*spvDescriptorSet0.fp_c3)._m0[8].w;
    float _154 = _152 + 1.0;
    float _156 = _144 * (*spvDescriptorSet0.fp_c4)._m0[5].x;
    float _158 = fma(_148, _150, -0.212114393711090087890625);
    float _160 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _162 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[7].x, _160);
    float _164 = precise::clamp(_162, 0.0, 1.0);
    float _166 = fma(_148, _158, 1.570728778839111328125);
    float _168 = -_164;
    float _170 = _168 + 1.0;
    float _172 = abs(_170);
    float _174 = log2(_172);
    float _176 = _146 * 0.636619746685028076171875;
    float _178 = -_166;
    float _180 = fma(_176, _178, 1.0);
    float _182 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _184 = exp2(_182);
    float _186 = fma(_184, _154, (*spvDescriptorSet0.fp_c3)._m0[8].w);
    float _188 = fma(_186, 0.5, 0.5);
    float2 _673 = float2(_180, _188);
    float3 _192 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_673, float2(0.0), isnan(_673))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_673, float2(0.0), isnan(_673))).xyz;
    float _194 = _192.x;
    float _196 = _192.y;
    float _198 = _192.z;
    float _200 = _174 * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _202 = -(*spvDescriptorSet0.fp_c3)._m0[9].y;
    float _204 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
    float _206 = precise::clamp(_204, 0.0, 1.0);
    float _208 = exp2(_200);
    float _210 = -_206;
    float _212 = _210 + 1.0;
    float _214 = (*spvDescriptorSet0.fp_c3)._m0[10].w * (*spvDescriptorSet0.fp_c3)._m0[11].w;
    float _216 = abs(_212);
    float _218 = log2(_216);
    float _220 = -_208;
    float _222 = fma(_220, (*spvDescriptorSet0.fp_c3)._m0[8].z, (*spvDescriptorSet0.fp_c3)._m0[8].z);
    float _224 = _73 * _222;
    float _226 = _218 * (*spvDescriptorSet0.fp_c3)._m0[10].x;
    float _228 = exp2(_226);
    float _230 = -_228;
    float _232 = fma(_214, _230, _214);
    float _234 = _73 * _232;
    float _236 = -_78;
    float _238 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[13].x, _236);
    float _240 = -_82;
    float _242 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _240);
    float _244 = fma(_224, _238, _78);
    float _246 = fma(_224, _242, _82);
    float _248 = -_244;
    float _250 = _248 + (*spvDescriptorSet0.fp_c3)._m0[11].x;
    float _252 = fma(_234, _250, _244);
    float _254 = -_80;
    float _256 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[13].x, _254);
    float _258 = _252 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _260 = fma(_224, _256, _80);
    float _262 = -_260;
    float _264 = _262 + (*spvDescriptorSet0.fp_c3)._m0[11].y;
    bool _268 = _258 >= 1.41299998760223388671875;
    bool _270 = isnan(_258);
    bool _272 = _268 || _270;
    bool _274 = isnan(1.41299998760223388671875);
    bool _276 = _272 || _274;
    float _278 = fma(_234, _264, _260);
    float _280 = -_246;
    float _282 = _280 + (*spvDescriptorSet0.fp_c3)._m0[11].z;
    float _284 = _278 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    float _286 = fma(_234, _282, _246);
    float _288 = _286 * (*spvDescriptorSet0.fp_c3)._m0[13].z;
    bool _290 = _284 >= 1.41299998760223388671875;
    bool _292 = isnan(_284);
    bool _294 = _290 || _292;
    bool _296 = isnan(1.41299998760223388671875);
    bool _298 = _294 || _296;
    float _300 = _73;
    float _302 = _218;
    float _304 = _214;
    int _307 = as_type<int>(_82);
    float _309 = _258;
    float _311 = _196;
    float _313 = _246;
    float _315 = _208;
    int _317 = as_type<int>(_288);
    int _319 = as_type<int>(_284);
    if (!_276)
    {
        float _321 = _258 * 0.38317000865936279296875;
        _300 = _321;
    }
    float _323 = _300;
    if (_276)
    {
        float _325 = _258 * (-1.44269502162933349609375);
        _302 = _325;
    }
    float _327 = _302;
    bool _329 = _288 >= 1.41299998760223388671875;
    bool _331 = isnan(_288);
    bool _333 = _329 || _331;
    bool _335 = isnan(1.41299998760223388671875);
    bool _337 = _333 || _335;
    float _339 = _327;
    if (_276)
    {
        float _341 = exp2(_327);
        _304 = _341;
    }
    float _343 = _304;
    if (!_298)
    {
        float _345 = _284 * 0.38317000865936279296875;
        _307 = as_type<int>(_345);
    }
    int _347 = _307;
    float _349 = _323;
    if (!_276)
    {
        float _351 = abs(_323);
        float _353 = log2(_351);
        _349 = _353;
    }
    float _355 = _349;
    if (_298)
    {
        float _357 = _284 * (-1.44269502162933349609375);
        _309 = _357;
    }
    float _359 = _309;
    if (!_337)
    {
        float _361 = _288 * 0.38317000865936279296875;
        _311 = _361;
    }
    float _363 = _311;
    if (_337)
    {
        float _365 = _288 * (-1.44269502162933349609375);
        _313 = _365;
    }
    float _367 = _313;
    int _369 = _347;
    if (!_298)
    {
        float _371 = abs(as_type<float>(_347));
        float _373 = log2(_371);
        _369 = as_type<int>(_373);
    }
    int _375 = _369;
    float _377 = _363;
    if (!_337)
    {
        float _379 = abs(_363);
        float _381 = log2(_379);
        _377 = _381;
    }
    float _383 = _377;
    float _385 = _355;
    if (!_276)
    {
        float _387 = _355 * 0.4545454680919647216796875;
        _385 = _387;
    }
    float _389 = _385;
    int _391 = _375;
    if (!_298)
    {
        float _393 = as_type<float>(_375) * 0.4545454680919647216796875;
        _339 = _393;
    }
    float _395 = _339;
    float _397 = _359;
    if (_298)
    {
        float _399 = exp2(_359);
        _397 = _399;
    }
    float _401 = _397;
    if (!_337)
    {
        float _403 = _383 * 0.4545454680919647216796875;
        _315 = _403;
    }
    float _405 = _315;
    float _407 = _367;
    if (_337)
    {
        float _409 = exp2(_367);
        _407 = _409;
    }
    float _411 = _407;
    if (!_276)
    {
        float _413 = exp2(_389);
        _317 = as_type<int>(_413);
    }
    int _415 = _317;
    int _417 = _415;
    if (!_298)
    {
        float _419 = exp2(_395);
        _319 = as_type<int>(_419);
    }
    int _421 = _319;
    int _423 = _421;
    if (!_337)
    {
        float _425 = exp2(_405);
        _391 = as_type<int>(_425);
    }
    int _427 = _391;
    int _429 = _427;
    if (_276)
    {
        float _431 = -_343;
        float _433 = _431 + 1.0;
        _417 = as_type<int>(_433);
    }
    int _435 = _417;
    if (_298)
    {
        float _437 = -_401;
        float _439 = _437 + 1.0;
        _423 = as_type<int>(_439);
    }
    int _441 = _423;
    if (_337)
    {
        float _443 = -_411;
        float _445 = _443 + 1.0;
        _429 = as_type<int>(_445);
    }
    int _447 = _429;
    out.m_44.x = as_type<float>(_435);
    out.m_44.y = as_type<float>(_441);
    out.m_44.z = as_type<float>(_447);
    out.m_44.w = _84;
    return main0_out_u{as_type<uint4>(out.m_44)};
}

