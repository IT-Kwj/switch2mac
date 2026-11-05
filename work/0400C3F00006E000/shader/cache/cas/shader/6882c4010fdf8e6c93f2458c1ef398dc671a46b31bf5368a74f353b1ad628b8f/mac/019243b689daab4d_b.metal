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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_45 [[user(locn1)]];
    float4 m_41 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _89 * _89;
    float _97 = fma(_91, _91, _95);
    float _99 = fma(_93, _93, _97);
    float _101 = rsqrt(_99);
    float _103 = _89 * _101;
    float _105 = _91 * _101;
    float _107 = _93 * _101;
    float _109 = _103 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _113 = _87 * _85;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].x, _109);
    float _117 = _87 * _79;
    float _119 = fma(_107, (*spvDescriptorSet0.fp_c5)._m0[2].z, _115);
    float _121 = fma(_111, 0.5, 0.5);
    float _123 = fma(_119, 0.5, 0.5);
    float2 _614 = float2(_117, _113);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_614, float2(0.0), isnan(_614))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _633 = float2(_123, _121);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_633, float2(0.0), isnan(_633))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = 0.0 + _111;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = in.m_43.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = abs(_154);
    float _164 = log2(_162);
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _168 = _166 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _170 = _87 * _150;
    float _172 = _164 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    bool _176 = _111 >= _170;
    float _178 = exp2(_172);
    float _180 = 0.0;
    float _182 = _164;
    float _184 = _170;
    if (!_176)
    {
        _180 = 0.0;
    }
    float _186 = _180;
    float _188 = _186;
    if (!_176)
    {
        _182 = 0.0;
        _184 = 0.0;
    }
    float _190 = _182;
    float _192 = _184;
    bool _194 = !_176;
    float _196 = _192;
    float _198 = _190;
    if (!_194)
    {
        float _200 = in.m_45.x;
        float _202 = gl_FragCoord.w;
        float _204 = _200 * _202;
        float _206 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _208 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _206;
        float _210 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _212 = 1.0 / _208;
        float _214 = log2(_210);
        float _216 = _87 * _204;
        float _218 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _220 = _216 + _218;
        float _222 = _220 * _212;
        float _224 = _214 * 0.1155245304107666015625;
        float _226 = sqrt(_222);
        float2 _752 = float2(_224, _226);
        float3 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_752, float2(0.0), isnan(_752))).xyz;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        _196 = _232;
        _198 = _234;
        _188 = _236;
    }
    float _238 = _196;
    float _240 = _198;
    float _242 = _188;
    float _244 = _138 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _246 = _144 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _252 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[12].z, _250);
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_178, _168, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _258 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _260 = _244 + _258;
    float _262 = _244 * _238;
    float _264 = _254 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _266 = _87 * _160;
    float _268 = fma(_248, _260, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _270 = _140 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _272 = _256 * _266;
    float _274 = fma(_262, _264, _268);
    float _276 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _278 = _270 + _276;
    float _280 = _142 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _282 = _270 * _240;
    float _284 = _274 * _134;
    float _286 = _280 * _242;
    float _288 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[13].y, _284);
    float _290 = fma(_248, _278, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _292 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _294 = _280 + _292;
    float _296 = -_288;
    float _298 = _296 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _300 = fma(_282, _264, _290);
    float _302 = fma(_248, _294, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _304 = fma(_272, _298, _288);
    float _306 = _300 * _134;
    float _308 = fma(_286, _264, _302);
    float _310 = _304 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _312 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[13].y, _306);
    float _314 = _308 * _134;
    float _316 = -_312;
    float _318 = _316 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _320 = fma(_132, (*spvDescriptorSet0.fp_c4)._m0[13].y, _314);
    bool _322 = _310 >= 1.41299998760223388671875;
    bool _324 = isnan(_310);
    bool _326 = _322 || _324;
    bool _328 = isnan(1.41299998760223388671875);
    bool _330 = _326 || _328;
    float _332 = fma(_272, _318, _312);
    float _334 = -_320;
    float _336 = _334 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _338 = _332 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _340 = fma(_272, _336, _320);
    float _342 = _340 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _344 = _338 >= 1.41299998760223388671875;
    bool _346 = isnan(_338);
    bool _348 = _344 || _346;
    bool _350 = isnan(1.41299998760223388671875);
    bool _352 = _348 || _350;
    int _355 = as_type<int>(_320);
    float _357 = _340;
    float _359 = _288;
    int _361 = as_type<int>(_312);
    float _363 = _338;
    float _365 = _270;
    float _367 = _342;
    float _369 = _310;
    float _371 = _280;
    float _373 = _302;
    if (!_330)
    {
        float _375 = _310 * 0.38317000865936279296875;
        _355 = as_type<int>(_375);
    }
    int _377 = _355;
    if (_330)
    {
        float _379 = _310 * (-1.44269502162933349609375);
        _357 = _379;
    }
    float _381 = _357;
    bool _383 = _342 >= 1.41299998760223388671875;
    bool _385 = isnan(_342);
    bool _387 = _383 || _385;
    bool _389 = isnan(1.41299998760223388671875);
    bool _391 = _387 || _389;
    int _393 = as_type<int>(_381);
    if (_330)
    {
        float _395 = exp2(_381);
        _359 = _395;
    }
    float _397 = _359;
    if (!_352)
    {
        float _399 = _338 * 0.38317000865936279296875;
        _361 = as_type<int>(_399);
    }
    int _401 = _361;
    int _403 = _377;
    if (!_330)
    {
        float _405 = abs(as_type<float>(_377));
        float _407 = log2(_405);
        _403 = as_type<int>(_407);
    }
    int _409 = _403;
    if (_352)
    {
        float _411 = _338 * (-1.44269502162933349609375);
        _363 = _411;
    }
    float _413 = _363;
    if (!_391)
    {
        float _415 = _342 * 0.38317000865936279296875;
        _365 = _415;
    }
    float _417 = _365;
    if (_391)
    {
        float _419 = _342 * (-1.44269502162933349609375);
        _367 = _419;
    }
    float _421 = _367;
    int _423 = _401;
    if (!_352)
    {
        float _425 = abs(as_type<float>(_401));
        float _427 = log2(_425);
        _423 = as_type<int>(_427);
    }
    int _429 = _423;
    float _431 = _417;
    if (!_391)
    {
        float _433 = abs(_417);
        float _435 = log2(_433);
        _431 = _435;
    }
    float _437 = _431;
    int _439 = _409;
    if (!_330)
    {
        float _441 = as_type<float>(_409) * 0.4545454680919647216796875;
        _369 = _441;
    }
    float _443 = _369;
    int _445 = _429;
    if (!_352)
    {
        float _447 = as_type<float>(_429) * 0.4545454680919647216796875;
        _371 = _447;
    }
    float _449 = _371;
    float _451 = _413;
    if (_352)
    {
        float _453 = exp2(_413);
        _451 = _453;
    }
    float _455 = _451;
    if (!_391)
    {
        float _457 = _437 * 0.4545454680919647216796875;
        _373 = _457;
    }
    float _459 = _373;
    if (!_352)
    {
        float _461 = exp2(_449);
        _393 = as_type<int>(_461);
    }
    int _463 = _393;
    float _465 = _421;
    int _467 = _463;
    if (_391)
    {
        float _469 = exp2(_421);
        _465 = _469;
    }
    float _471 = _465;
    if (!_330)
    {
        float _473 = exp2(_443);
        _439 = as_type<int>(_473);
    }
    int _475 = _439;
    int _477 = _475;
    if (_352)
    {
        float _479 = -_455;
        float _481 = _479 + 1.0;
        _467 = as_type<int>(_481);
    }
    int _483 = _467;
    if (!_391)
    {
        float _485 = exp2(_459);
        _445 = as_type<int>(_485);
    }
    int _487 = _445;
    int _489 = _487;
    if (_330)
    {
        float _491 = -_397;
        float _493 = _491 + 1.0;
        _477 = as_type<int>(_493);
    }
    int _495 = _477;
    if (_391)
    {
        float _497 = -_471;
        float _499 = _497 + 1.0;
        _489 = as_type<int>(_499);
    }
    int _501 = _489;
    out.m_48.x = as_type<float>(_495);
    out.m_48.y = as_type<float>(_483);
    out.m_48.z = as_type<float>(_501);
    out.m_48.w = 1.0;
    return out;
}


struct main0_out_u
{
    uint4 m_48 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.z;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_39.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _55;
    float _89 = _87 * _61;
    float _91 = _87 * _67;
    float _93 = _87 * _73;
    float _95 = _89 * _89;
    float _97 = fma(_91, _91, _95);
    float _99 = fma(_93, _93, _97);
    float _101 = rsqrt(_99);
    float _103 = _89 * _101;
    float _105 = _91 * _101;
    float _107 = _93 * _101;
    float _109 = _103 * (*spvDescriptorSet0.fp_c5)._m0[2].y;
    float _111 = _103 * (*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _113 = _87 * _85;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].x, _109);
    float _117 = _87 * _79;
    float _119 = fma(_107, (*spvDescriptorSet0.fp_c5)._m0[2].z, _115);
    float _121 = fma(_111, 0.5, 0.5);
    float _123 = fma(_119, 0.5, 0.5);
    float2 _614 = float2(_117, _113);
    float4 _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_614, float2(0.0), isnan(_614))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_614, float2(0.0), isnan(_614))).xyzw;
    float _128 = _126.x;
    float _130 = _126.y;
    float _132 = _126.z;
    float _134 = _126.w;
    float2 _633 = float2(_123, _121);
    float4 _136 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_633, float2(0.0), isnan(_633))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_633, float2(0.0), isnan(_633))).xyzw;
    float _138 = _136.x;
    float _140 = _136.y;
    float _142 = _136.z;
    float _144 = _136.w;
    float _146 = in.m_41.x;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = 0.0 + _111;
    float _154 = precise::clamp(_152, 0.0, 1.0);
    float _156 = in.m_43.x;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = abs(_154);
    float _164 = log2(_162);
    float _166 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _168 = _166 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _170 = _87 * _150;
    float _172 = _164 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    bool _176 = _111 >= _170;
    float _178 = exp2(_172);
    float _180 = 0.0;
    float _182 = _164;
    float _184 = _170;
    if (!_176)
    {
        _180 = 0.0;
    }
    float _186 = _180;
    float _188 = _186;
    if (!_176)
    {
        _182 = 0.0;
        _184 = 0.0;
    }
    float _190 = _182;
    float _192 = _184;
    bool _194 = !_176;
    float _196 = _192;
    float _198 = _190;
    if (!_194)
    {
        float _200 = in.m_45.x;
        float _202 = gl_FragCoord.w;
        float _204 = _200 * _202;
        float _206 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _208 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _206;
        float _210 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _212 = 1.0 / _208;
        float _214 = log2(_210);
        float _216 = _87 * _204;
        float _218 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _220 = _216 + _218;
        float _222 = _220 * _212;
        float _224 = _214 * 0.1155245304107666015625;
        float _226 = sqrt(_222);
        float2 _752 = float2(_224, _226);
        float3 _230 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_752, float2(0.0), isnan(_752))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_752, float2(0.0), isnan(_752))).xyz;
        float _232 = _230.x;
        float _234 = _230.y;
        float _236 = _230.z;
        _196 = _232;
        _198 = _234;
        _188 = _236;
    }
    float _238 = _196;
    float _240 = _198;
    float _242 = _188;
    float _244 = _138 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _246 = _144 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _252 = fma(_119, (*spvDescriptorSet0.fp_c4)._m0[12].z, _250);
    float _254 = precise::clamp(_252, 0.0, 1.0);
    float _256 = fma(_178, _168, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _258 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _260 = _244 + _258;
    float _262 = _244 * _238;
    float _264 = _254 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _266 = _87 * _160;
    float _268 = fma(_248, _260, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _270 = _140 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _272 = _256 * _266;
    float _274 = fma(_262, _264, _268);
    float _276 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _278 = _270 + _276;
    float _280 = _142 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _282 = _270 * _240;
    float _284 = _274 * _134;
    float _286 = _280 * _242;
    float _288 = fma(_128, (*spvDescriptorSet0.fp_c4)._m0[13].y, _284);
    float _290 = fma(_248, _278, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _292 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _294 = _280 + _292;
    float _296 = -_288;
    float _298 = _296 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _300 = fma(_282, _264, _290);
    float _302 = fma(_248, _294, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _304 = fma(_272, _298, _288);
    float _306 = _300 * _134;
    float _308 = fma(_286, _264, _302);
    float _310 = _304 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _312 = fma(_130, (*spvDescriptorSet0.fp_c4)._m0[13].y, _306);
    float _314 = _308 * _134;
    float _316 = -_312;
    float _318 = _316 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _320 = fma(_132, (*spvDescriptorSet0.fp_c4)._m0[13].y, _314);
    bool _322 = _310 >= 1.41299998760223388671875;
    bool _324 = isnan(_310);
    bool _326 = _322 || _324;
    bool _328 = isnan(1.41299998760223388671875);
    bool _330 = _326 || _328;
    float _332 = fma(_272, _318, _312);
    float _334 = -_320;
    float _336 = _334 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    float _338 = _332 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _340 = fma(_272, _336, _320);
    float _342 = _340 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _344 = _338 >= 1.41299998760223388671875;
    bool _346 = isnan(_338);
    bool _348 = _344 || _346;
    bool _350 = isnan(1.41299998760223388671875);
    bool _352 = _348 || _350;
    int _355 = as_type<int>(_320);
    float _357 = _340;
    float _359 = _288;
    int _361 = as_type<int>(_312);
    float _363 = _338;
    float _365 = _270;
    float _367 = _342;
    float _369 = _310;
    float _371 = _280;
    float _373 = _302;
    if (!_330)
    {
        float _375 = _310 * 0.38317000865936279296875;
        _355 = as_type<int>(_375);
    }
    int _377 = _355;
    if (_330)
    {
        float _379 = _310 * (-1.44269502162933349609375);
        _357 = _379;
    }
    float _381 = _357;
    bool _383 = _342 >= 1.41299998760223388671875;
    bool _385 = isnan(_342);
    bool _387 = _383 || _385;
    bool _389 = isnan(1.41299998760223388671875);
    bool _391 = _387 || _389;
    int _393 = as_type<int>(_381);
    if (_330)
    {
        float _395 = exp2(_381);
        _359 = _395;
    }
    float _397 = _359;
    if (!_352)
    {
        float _399 = _338 * 0.38317000865936279296875;
        _361 = as_type<int>(_399);
    }
    int _401 = _361;
    int _403 = _377;
    if (!_330)
    {
        float _405 = abs(as_type<float>(_377));
        float _407 = log2(_405);
        _403 = as_type<int>(_407);
    }
    int _409 = _403;
    if (_352)
    {
        float _411 = _338 * (-1.44269502162933349609375);
        _363 = _411;
    }
    float _413 = _363;
    if (!_391)
    {
        float _415 = _342 * 0.38317000865936279296875;
        _365 = _415;
    }
    float _417 = _365;
    if (_391)
    {
        float _419 = _342 * (-1.44269502162933349609375);
        _367 = _419;
    }
    float _421 = _367;
    int _423 = _401;
    if (!_352)
    {
        float _425 = abs(as_type<float>(_401));
        float _427 = log2(_425);
        _423 = as_type<int>(_427);
    }
    int _429 = _423;
    float _431 = _417;
    if (!_391)
    {
        float _433 = abs(_417);
        float _435 = log2(_433);
        _431 = _435;
    }
    float _437 = _431;
    int _439 = _409;
    if (!_330)
    {
        float _441 = as_type<float>(_409) * 0.4545454680919647216796875;
        _369 = _441;
    }
    float _443 = _369;
    int _445 = _429;
    if (!_352)
    {
        float _447 = as_type<float>(_429) * 0.4545454680919647216796875;
        _371 = _447;
    }
    float _449 = _371;
    float _451 = _413;
    if (_352)
    {
        float _453 = exp2(_413);
        _451 = _453;
    }
    float _455 = _451;
    if (!_391)
    {
        float _457 = _437 * 0.4545454680919647216796875;
        _373 = _457;
    }
    float _459 = _373;
    if (!_352)
    {
        float _461 = exp2(_449);
        _393 = as_type<int>(_461);
    }
    int _463 = _393;
    float _465 = _421;
    int _467 = _463;
    if (_391)
    {
        float _469 = exp2(_421);
        _465 = _469;
    }
    float _471 = _465;
    if (!_330)
    {
        float _473 = exp2(_443);
        _439 = as_type<int>(_473);
    }
    int _475 = _439;
    int _477 = _475;
    if (_352)
    {
        float _479 = -_455;
        float _481 = _479 + 1.0;
        _467 = as_type<int>(_481);
    }
    int _483 = _467;
    if (!_391)
    {
        float _485 = exp2(_459);
        _445 = as_type<int>(_485);
    }
    int _487 = _445;
    int _489 = _487;
    if (_330)
    {
        float _491 = -_397;
        float _493 = _491 + 1.0;
        _477 = as_type<int>(_493);
    }
    int _495 = _477;
    if (_391)
    {
        float _497 = -_471;
        float _499 = _497 + 1.0;
        _489 = as_type<int>(_499);
    }
    int _501 = _489;
    out.m_48.x = as_type<float>(_495);
    out.m_48.y = as_type<float>(_483);
    out.m_48.z = as_type<float>(_501);
    out.m_48.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_48)};
}

