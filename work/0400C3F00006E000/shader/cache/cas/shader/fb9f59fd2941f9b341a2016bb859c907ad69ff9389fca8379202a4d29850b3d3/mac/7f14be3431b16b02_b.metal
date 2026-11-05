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
    float _113 = _87 * _79;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].x, _109);
    float _117 = fma(_107, (*spvDescriptorSet0.fp_c5)._m0[2].z, _115);
    float _119 = fma(_111, 0.5, 0.5);
    float _121 = fma(_117, -0.5, 0.5);
    float _123 = fma(_117, 0.5, 0.5);
    float _125 = fma(_123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _127 = sqrt(_121);
    float _129 = fma(_123, _125, -0.212114393711090087890625);
    float _131 = fma(_123, _129, 1.570728778839111328125);
    float _133 = _127 * 0.636619746685028076171875;
    float _135 = -_131;
    float _137 = fma(_133, _135, 1.0);
    float _139 = _87 * _85;
    float2 _655 = float2(_113, _139);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_655, float2(0.0), isnan(_655))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float2 _674 = float2(_137, _119);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_674, float2(0.0), isnan(_674))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = 0.0 + _111;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = in.m_43.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = abs(_170);
    float _180 = log2(_178);
    float _182 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _184 = _182 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _186 = _180 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _188 = exp2(_186);
    float _190 = _87 * _166;
    bool _194 = _111 >= _190;
    float _196 = 0.0;
    float _198 = _190;
    if (!_194)
    {
        _196 = 0.0;
    }
    float _200 = _196;
    float _202 = 0.0;
    float _204 = _200;
    if (!_194)
    {
        _198 = 0.0;
        _202 = 0.0;
    }
    float _206 = _198;
    float _208 = _202;
    bool _210 = !_194;
    float _212 = _208;
    float _214 = _206;
    if (!_210)
    {
        float _216 = in.m_45.x;
        float _218 = gl_FragCoord.w;
        float _220 = _216 * _218;
        float _222 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _224 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _222;
        float _226 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _228 = 1.0 / _224;
        float _230 = log2(_226);
        float _232 = _87 * _220;
        float _234 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _236 = _232 + _234;
        float _238 = _230 * 0.1155245304107666015625;
        float _240 = _236 * _228;
        float _242 = sqrt(_240);
        float2 _792 = float2(_238, _242);
        float3 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_792, float2(0.0), isnan(_792))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_792, float2(0.0), isnan(_792))).xyz;
        float _248 = _246.x;
        float _250 = _246.y;
        float _252 = _246.z;
        _212 = _248;
        _214 = _250;
        _204 = _252;
    }
    float _254 = _212;
    float _256 = _214;
    float _258 = _204;
    float _260 = _154 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _262 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _264 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[12].z, _262);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _160 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = fma(_188, _184, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _274 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _276 = _260 + _274;
    float _278 = _260 * _254;
    float _280 = _266 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _282 = _87 * _176;
    float _284 = fma(_270, _276, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _286 = _156 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _288 = _158 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _290 = _272 * _282;
    float _292 = fma(_278, _280, _284);
    float _294 = _286 * _256;
    float _296 = _292 * _150;
    float _298 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _300 = _286 + _298;
    float _302 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _304 = _288 + _302;
    float _306 = _288 * _258;
    float _308 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[13].y, _296);
    float _310 = fma(_270, _300, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _312 = fma(_270, _304, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _314 = -_308;
    float _316 = _314 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _318 = fma(_294, _280, _310);
    float _320 = fma(_306, _280, _312);
    float _322 = fma(_290, _316, _308);
    float _324 = _318 * _150;
    float _326 = _320 * _150;
    float _328 = _322 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _330 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _324);
    float _332 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[13].y, _326);
    float _334 = -_330;
    float _336 = _334 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _338 = -_332;
    float _340 = _338 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _342 = _328 >= 1.41299998760223388671875;
    bool _344 = isnan(_328);
    bool _346 = _342 || _344;
    bool _348 = isnan(1.41299998760223388671875);
    bool _350 = _346 || _348;
    float _352 = fma(_290, _336, _330);
    float _354 = fma(_290, _340, _332);
    float _356 = _352 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _358 = _354 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _360 = _356 >= 1.41299998760223388671875;
    bool _362 = isnan(_356);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.41299998760223388671875);
    bool _368 = _364 || _366;
    bool _370 = _358 >= 1.41299998760223388671875;
    bool _372 = isnan(_358);
    bool _374 = _370 || _372;
    bool _376 = isnan(1.41299998760223388671875);
    bool _378 = _374 || _376;
    int _381 = as_type<int>(_352);
    float _383 = _354;
    float _385 = _296;
    int _387 = as_type<int>(_332);
    float _389 = _356;
    float _391 = _328;
    float _393 = _358;
    float _395 = _308;
    float _397 = _330;
    float _399 = _270;
    if (!_350)
    {
        float _401 = _328 * 0.38317000865936279296875;
        _381 = as_type<int>(_401);
    }
    int _403 = _381;
    if (_350)
    {
        float _405 = _328 * (-1.44269502162933349609375);
        _383 = _405;
    }
    float _407 = _383;
    int _409 = as_type<int>(_407);
    if (_350)
    {
        float _411 = exp2(_407);
        _385 = _411;
    }
    float _413 = _385;
    if (!_368)
    {
        float _415 = _356 * 0.38317000865936279296875;
        _387 = as_type<int>(_415);
    }
    int _417 = _387;
    if (_368)
    {
        float _419 = _356 * (-1.44269502162933349609375);
        _389 = _419;
    }
    float _421 = _389;
    if (!_378)
    {
        float _423 = _358 * 0.38317000865936279296875;
        _391 = _423;
    }
    float _425 = _391;
    int _427 = _403;
    if (!_350)
    {
        float _429 = abs(as_type<float>(_403));
        float _431 = log2(_429);
        _427 = as_type<int>(_431);
    }
    int _433 = _427;
    if (_378)
    {
        float _435 = _358 * (-1.44269502162933349609375);
        _393 = _435;
    }
    float _437 = _393;
    int _439 = _417;
    if (!_368)
    {
        float _441 = abs(as_type<float>(_417));
        float _443 = log2(_441);
        _439 = as_type<int>(_443);
    }
    int _445 = _439;
    float _447 = _425;
    if (!_378)
    {
        float _449 = abs(_425);
        float _451 = log2(_449);
        _447 = _451;
    }
    float _453 = _447;
    int _455 = _433;
    if (!_350)
    {
        float _457 = as_type<float>(_433) * 0.4545454680919647216796875;
        _395 = _457;
    }
    float _459 = _395;
    int _461 = _445;
    if (!_368)
    {
        float _463 = as_type<float>(_445) * 0.4545454680919647216796875;
        _397 = _463;
    }
    float _465 = _397;
    float _467 = _421;
    if (_368)
    {
        float _469 = exp2(_421);
        _467 = _469;
    }
    float _471 = _467;
    if (!_378)
    {
        float _473 = _453 * 0.4545454680919647216796875;
        _399 = _473;
    }
    float _475 = _399;
    if (!_368)
    {
        float _477 = exp2(_465);
        _409 = as_type<int>(_477);
    }
    int _479 = _409;
    float _481 = _437;
    int _483 = _479;
    if (_378)
    {
        float _485 = exp2(_437);
        _481 = _485;
    }
    float _487 = _481;
    if (!_350)
    {
        float _489 = exp2(_459);
        _455 = as_type<int>(_489);
    }
    int _491 = _455;
    int _493 = _491;
    if (_368)
    {
        float _495 = -_471;
        float _497 = _495 + 1.0;
        _483 = as_type<int>(_497);
    }
    int _499 = _483;
    if (!_378)
    {
        float _501 = exp2(_475);
        _461 = as_type<int>(_501);
    }
    int _503 = _461;
    int _505 = _503;
    if (_350)
    {
        float _507 = -_413;
        float _509 = _507 + 1.0;
        _493 = as_type<int>(_509);
    }
    int _511 = _493;
    if (_378)
    {
        float _513 = -_487;
        float _515 = _513 + 1.0;
        _505 = as_type<int>(_515);
    }
    int _517 = _505;
    out.m_48.x = as_type<float>(_511);
    out.m_48.y = as_type<float>(_499);
    out.m_48.z = as_type<float>(_517);
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
    float _113 = _87 * _79;
    float _115 = fma(_105, (*spvDescriptorSet0.fp_c5)._m0[2].x, _109);
    float _117 = fma(_107, (*spvDescriptorSet0.fp_c5)._m0[2].z, _115);
    float _119 = fma(_111, 0.5, 0.5);
    float _121 = fma(_117, -0.5, 0.5);
    float _123 = fma(_117, 0.5, 0.5);
    float _125 = fma(_123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _127 = sqrt(_121);
    float _129 = fma(_123, _125, -0.212114393711090087890625);
    float _131 = fma(_123, _129, 1.570728778839111328125);
    float _133 = _127 * 0.636619746685028076171875;
    float _135 = -_131;
    float _137 = fma(_133, _135, 1.0);
    float _139 = _87 * _85;
    float2 _655 = float2(_113, _139);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_655, float2(0.0), isnan(_655))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_655, float2(0.0), isnan(_655))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float2 _674 = float2(_137, _119);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_674, float2(0.0), isnan(_674))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_674, float2(0.0), isnan(_674))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float _162 = in.m_41.x;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = 0.0 + _111;
    float _170 = precise::clamp(_168, 0.0, 1.0);
    float _172 = in.m_43.x;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = abs(_170);
    float _180 = log2(_178);
    float _182 = -(*spvDescriptorSet0.fp_c4)._m0[10].w;
    float _184 = _182 + (*spvDescriptorSet0.fp_c4)._m0[10].z;
    float _186 = _180 * (*spvDescriptorSet0.fp_c4)._m0[10].y;
    float _188 = exp2(_186);
    float _190 = _87 * _166;
    bool _194 = _111 >= _190;
    float _196 = 0.0;
    float _198 = _190;
    if (!_194)
    {
        _196 = 0.0;
    }
    float _200 = _196;
    float _202 = 0.0;
    float _204 = _200;
    if (!_194)
    {
        _198 = 0.0;
        _202 = 0.0;
    }
    float _206 = _198;
    float _208 = _202;
    bool _210 = !_194;
    float _212 = _208;
    float _214 = _206;
    if (!_210)
    {
        float _216 = in.m_45.x;
        float _218 = gl_FragCoord.w;
        float _220 = _216 * _218;
        float _222 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _224 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _222;
        float _226 = fma(_111, 350.80767822265625, 53.62115478515625);
        float _228 = 1.0 / _224;
        float _230 = log2(_226);
        float _232 = _87 * _220;
        float _234 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
        float _236 = _232 + _234;
        float _238 = _230 * 0.1155245304107666015625;
        float _240 = _236 * _228;
        float _242 = sqrt(_240);
        float2 _792 = float2(_238, _242);
        float3 _246 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_792, float2(0.0), isnan(_792))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_792, float2(0.0), isnan(_792))).xyz;
        float _248 = _246.x;
        float _250 = _246.y;
        float _252 = _246.z;
        _212 = _248;
        _214 = _250;
        _204 = _252;
    }
    float _254 = _212;
    float _256 = _214;
    float _258 = _204;
    float _260 = _154 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _262 = -(*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _264 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[12].z, _262);
    float _266 = precise::clamp(_264, 0.0, 1.0);
    float _268 = _160 + (*spvDescriptorSet0.fp_c5)._m0[6].w;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    float _272 = fma(_188, _184, (*spvDescriptorSet0.fp_c4)._m0[10].w);
    float _274 = -(*spvDescriptorSet0.fp_c5)._m0[6].x;
    float _276 = _260 + _274;
    float _278 = _260 * _254;
    float _280 = _266 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _282 = _87 * _176;
    float _284 = fma(_270, _276, (*spvDescriptorSet0.fp_c5)._m0[6].x);
    float _286 = _156 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _288 = _158 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _290 = _272 * _282;
    float _292 = fma(_278, _280, _284);
    float _294 = _286 * _256;
    float _296 = _292 * _150;
    float _298 = -(*spvDescriptorSet0.fp_c5)._m0[6].y;
    float _300 = _286 + _298;
    float _302 = -(*spvDescriptorSet0.fp_c5)._m0[6].z;
    float _304 = _288 + _302;
    float _306 = _288 * _258;
    float _308 = fma(_144, (*spvDescriptorSet0.fp_c4)._m0[13].y, _296);
    float _310 = fma(_270, _300, (*spvDescriptorSet0.fp_c5)._m0[6].y);
    float _312 = fma(_270, _304, (*spvDescriptorSet0.fp_c5)._m0[6].z);
    float _314 = -_308;
    float _316 = _314 + (*spvDescriptorSet0.fp_c4)._m0[11].x;
    float _318 = fma(_294, _280, _310);
    float _320 = fma(_306, _280, _312);
    float _322 = fma(_290, _316, _308);
    float _324 = _318 * _150;
    float _326 = _320 * _150;
    float _328 = _322 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _330 = fma(_146, (*spvDescriptorSet0.fp_c4)._m0[13].y, _324);
    float _332 = fma(_148, (*spvDescriptorSet0.fp_c4)._m0[13].y, _326);
    float _334 = -_330;
    float _336 = _334 + (*spvDescriptorSet0.fp_c4)._m0[11].y;
    float _338 = -_332;
    float _340 = _338 + (*spvDescriptorSet0.fp_c4)._m0[11].z;
    bool _342 = _328 >= 1.41299998760223388671875;
    bool _344 = isnan(_328);
    bool _346 = _342 || _344;
    bool _348 = isnan(1.41299998760223388671875);
    bool _350 = _346 || _348;
    float _352 = fma(_290, _336, _330);
    float _354 = fma(_290, _340, _332);
    float _356 = _352 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    float _358 = _354 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    bool _360 = _356 >= 1.41299998760223388671875;
    bool _362 = isnan(_356);
    bool _364 = _360 || _362;
    bool _366 = isnan(1.41299998760223388671875);
    bool _368 = _364 || _366;
    bool _370 = _358 >= 1.41299998760223388671875;
    bool _372 = isnan(_358);
    bool _374 = _370 || _372;
    bool _376 = isnan(1.41299998760223388671875);
    bool _378 = _374 || _376;
    int _381 = as_type<int>(_352);
    float _383 = _354;
    float _385 = _296;
    int _387 = as_type<int>(_332);
    float _389 = _356;
    float _391 = _328;
    float _393 = _358;
    float _395 = _308;
    float _397 = _330;
    float _399 = _270;
    if (!_350)
    {
        float _401 = _328 * 0.38317000865936279296875;
        _381 = as_type<int>(_401);
    }
    int _403 = _381;
    if (_350)
    {
        float _405 = _328 * (-1.44269502162933349609375);
        _383 = _405;
    }
    float _407 = _383;
    int _409 = as_type<int>(_407);
    if (_350)
    {
        float _411 = exp2(_407);
        _385 = _411;
    }
    float _413 = _385;
    if (!_368)
    {
        float _415 = _356 * 0.38317000865936279296875;
        _387 = as_type<int>(_415);
    }
    int _417 = _387;
    if (_368)
    {
        float _419 = _356 * (-1.44269502162933349609375);
        _389 = _419;
    }
    float _421 = _389;
    if (!_378)
    {
        float _423 = _358 * 0.38317000865936279296875;
        _391 = _423;
    }
    float _425 = _391;
    int _427 = _403;
    if (!_350)
    {
        float _429 = abs(as_type<float>(_403));
        float _431 = log2(_429);
        _427 = as_type<int>(_431);
    }
    int _433 = _427;
    if (_378)
    {
        float _435 = _358 * (-1.44269502162933349609375);
        _393 = _435;
    }
    float _437 = _393;
    int _439 = _417;
    if (!_368)
    {
        float _441 = abs(as_type<float>(_417));
        float _443 = log2(_441);
        _439 = as_type<int>(_443);
    }
    int _445 = _439;
    float _447 = _425;
    if (!_378)
    {
        float _449 = abs(_425);
        float _451 = log2(_449);
        _447 = _451;
    }
    float _453 = _447;
    int _455 = _433;
    if (!_350)
    {
        float _457 = as_type<float>(_433) * 0.4545454680919647216796875;
        _395 = _457;
    }
    float _459 = _395;
    int _461 = _445;
    if (!_368)
    {
        float _463 = as_type<float>(_445) * 0.4545454680919647216796875;
        _397 = _463;
    }
    float _465 = _397;
    float _467 = _421;
    if (_368)
    {
        float _469 = exp2(_421);
        _467 = _469;
    }
    float _471 = _467;
    if (!_378)
    {
        float _473 = _453 * 0.4545454680919647216796875;
        _399 = _473;
    }
    float _475 = _399;
    if (!_368)
    {
        float _477 = exp2(_465);
        _409 = as_type<int>(_477);
    }
    int _479 = _409;
    float _481 = _437;
    int _483 = _479;
    if (_378)
    {
        float _485 = exp2(_437);
        _481 = _485;
    }
    float _487 = _481;
    if (!_350)
    {
        float _489 = exp2(_459);
        _455 = as_type<int>(_489);
    }
    int _491 = _455;
    int _493 = _491;
    if (_368)
    {
        float _495 = -_471;
        float _497 = _495 + 1.0;
        _483 = as_type<int>(_497);
    }
    int _499 = _483;
    if (!_378)
    {
        float _501 = exp2(_475);
        _461 = as_type<int>(_501);
    }
    int _503 = _461;
    int _505 = _503;
    if (_350)
    {
        float _507 = -_413;
        float _509 = _507 + 1.0;
        _493 = as_type<int>(_509);
    }
    int _511 = _493;
    if (_378)
    {
        float _513 = -_487;
        float _515 = _513 + 1.0;
        _505 = as_type<int>(_515);
    }
    int _517 = _505;
    out.m_48.x = as_type<float>(_511);
    out.m_48.y = as_type<float>(_499);
    out.m_48.z = as_type<float>(_517);
    out.m_48.w = 1.0;
    return main0_out_u{as_type<uint4>(out.m_48)};
}

