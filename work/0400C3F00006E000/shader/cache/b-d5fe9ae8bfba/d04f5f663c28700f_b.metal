#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d_array<float> fp_t_tcb_12 [[id(9)]];
    sampler fp_t_tcb_12Smplr [[id(10)]];
    texture2d<float> fp_t_tcb_A [[id(11)]];
    sampler fp_t_tcb_ASmplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _775 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _792 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_792, float2(0.0), isnan(_792))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_792, float2(0.0), isnan(_792))).x;
    float2 _800 = float2(_56, _58);
    float2 _74 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_800, float2(0.0), isnan(_800))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_800, float2(0.0), isnan(_800))).xy;
    float _76 = _74.x;
    float _78 = _74.y;
    float _80 = in.m_42.x;
    float _82 = in.m_42.y;
    float _84 = in.m_44.x;
    float _86 = in.m_44.y;
    float _88 = in.m_46.y;
    float _90 = in.m_46.x;
    float _92 = -_64;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = -_68;
    float _102 = fma(_100, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _104 = -_70;
    float _106 = fma(_104, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _108 = 1.0 / _94;
    float _110 = 1.0 / _98;
    float _112 = 1.0 / _102;
    float _114 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _116 = _108 * _114;
    float _118 = _80 * _116;
    float _120 = _82 * _116;
    float _122 = 1.0 / _106;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _110 * _124;
    float _128 = -_118;
    float _130 = fma(_126, _84, _128);
    float _132 = -_120;
    float _134 = fma(_126, _86, _132);
    float _136 = -_116;
    float _138 = _136 + _126;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = _112 * _140;
    float _144 = _134 * _134;
    float _146 = -_120;
    float _148 = fma(_142, _88, _146);
    float _150 = -_118;
    float _152 = fma(_142, _90, _150);
    float _154 = fma(_130, _130, _144);
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _158 = _122 * _156;
    float _160 = -_116;
    float _162 = _160 + _142;
    float _164 = fma(_138, _138, _154);
    float _166 = _158 * _82;
    float _168 = _158 * _80;
    float _170 = _148 * _148;
    float _172 = -_166;
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _176 = -_168;
    float _178 = _176 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _180 = rsqrt(_164);
    float _182 = -_166;
    float _184 = _182 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _186 = _174 * _174;
    float _188 = fma(_152, _152, _170);
    float _190 = _166 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _192 = _184 * _184;
    float _194 = fma(_178, _178, _186);
    float _196 = -_158;
    float _198 = _196 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _200 = fma(_162, _162, _188);
    float _202 = _166 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _204 = _166 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _206 = fma(_198, _198, _194);
    float _208 = rsqrt(_200);
    float _210 = -_168;
    float _212 = _210 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _214 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[31].x, _204);
    float _216 = _130 * _180;
    float _218 = _138 * _180;
    float _220 = fma(_212, _212, _192);
    float _222 = _134 * _180;
    float _224 = sqrt(_206);
    float _226 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[31].z, _214);
    float _228 = _162 * _208;
    float _230 = _148 * _208;
    float _232 = _152 * _208;
    float _234 = -_158;
    float _236 = _234 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _238 = _216 * _228;
    float _240 = _218 * _230;
    float _242 = fma(_236, _236, _220);
    bool _246 = _224 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _248 = -_238;
    float _250 = fma(_218, _232, _248);
    bool _252 = _224 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _254 = -_240;
    float _256 = fma(_222, _228, _254);
    float _258 = _222 * _232;
    bool _260 = !_246;
    int _263 = _260 ? 0 : 1;
    float _265 = sqrt(_242);
    float _267 = _250 * _250;
    float _269 = -_258;
    float _271 = fma(_216, _230, _269);
    float _273 = _166 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _275 = _166 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    int _277 = 2;
    int _279 = 2;
    if (!_246)
    {
        _277 = 1;
    }
    int _281 = _277;
    int _283 = _281;
    if (!_252)
    {
        _283 = _263;
    }
    int _285 = _283;
    float _287 = fma(_256, _256, _267);
    float _289 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[19].x, _273);
    float _291 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[22].x, _275);
    float _293 = float(_285);
    float _295 = fma(_271, _271, _287);
    float _297 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[19].z, _289);
    bool _299 = _265 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _301 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[22].z, _291);
    float _303 = rsqrt(_295);
    float _305 = precise::min(_293, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _307 = _297 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _309 = _265 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _311 = _166 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _313 = _305 != 1.0;
    bool _315 = isnan(_305);
    bool _317 = _313 || _315;
    bool _319 = isnan(1.0);
    bool _321 = _317 || _319;
    float _323 = _166 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _325 = _166 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    bool _327 = !_299;
    int _329 = _327 ? 0 : 1;
    float _331 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[24].x, _323);
    float _333 = _307;
    if (!_299)
    {
        _279 = 1;
    }
    int _335 = _279;
    float _337 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[28].x, _325);
    float _339 = _166 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _341 = _250 * _303;
    int _343 = _335;
    if (!_309)
    {
        _343 = _329;
    }
    int _345 = _343;
    if (_321)
    {
        float _347 = _301 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _333 = _347;
    }
    float _349 = _333;
    float _351 = _166 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _353 = _256 * _303;
    float _355 = _341 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _357 = _271 * _303;
    float _359 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[20].x, _351);
    float _361 = _166 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _363 = fma(_353, (*spvDescriptorSet0.fp_c3)._m0[35].x, _355);
    float _365 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[23].x, _311);
    float _367 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[20].z, _359);
    float _369 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[21].x, _361);
    float _371 = fma(_357, (*spvDescriptorSet0.fp_c3)._m0[35].z, _363);
    float _373 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[29].x, _190);
    float _375 = _367 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _377 = abs(_371);
    float _379 = -_377;
    float _381 = _379 + 1.0;
    float _383 = precise::clamp(_381, 0.0, 1.0);
    float _385 = float(_345);
    float _387 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[32].x, _202);
    float _389 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[21].z, _369);
    float _391 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[23].z, _365);
    float _393 = precise::min(_385, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _395 = abs(_383);
    float _397 = log2(_395);
    float _399 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[24].z, _331);
    float _401 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[29].z, _373);
    bool _403 = _393 != 1.0;
    bool _405 = isnan(_393);
    bool _407 = _403 || _405;
    bool _409 = isnan(1.0);
    bool _411 = _407 || _409;
    float _413 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[32].z, _387);
    float _415 = _389 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _417 = _166 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _419 = _375;
    float _421 = _415;
    float _423 = _349;
    if (_321)
    {
        float _425 = _391 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _419 = _425;
    }
    float _427 = _419;
    float _429 = _427;
    if (_321)
    {
        float _431 = _399 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _421 = _431;
    }
    float _433 = _421;
    float _435 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[28].z, _337);
    bool _437 = _305 != 0.0;
    bool _439 = isnan(_305);
    bool _441 = _437 || _439;
    bool _443 = isnan(0.0);
    bool _445 = _441 || _443;
    float _447 = _401 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _449 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[30].x, _417);
    float _451 = _166 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _453 = _435 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _455 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[18].x, _339);
    float _457 = _397 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _459 = _166 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _461 = _447;
    float _463 = _433;
    float _465 = _453;
    if (_411)
    {
        float _467 = _413 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _461 = _467;
    }
    float _469 = _461;
    float _471 = _166 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _473 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[16].x, _451);
    float _475 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[33].x, _459);
    float _477 = exp2(_457);
    float _479 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[30].z, _449);
    float _481 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[17].x, _471);
    float _483 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[18].z, _455);
    float _485 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[16].z, _473);
    float _487 = _166 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _489 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[17].z, _481);
    float _491 = _469;
    if (!_445)
    {
        float _493 = _483 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _463 = _493;
    }
    float _495 = _463;
    if (!_445)
    {
        float _497 = _485 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _423 = _497;
    }
    float _499 = _423;
    float _501 = _166 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    if (!_445)
    {
        float _503 = _489 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _429 = _503;
    }
    float _505 = _429;
    float _507 = _166 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _509 = _393 != 0.0;
    bool _511 = isnan(_393);
    bool _513 = _509 || _511;
    bool _515 = isnan(0.0);
    bool _517 = _513 || _515;
    float _519 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[26].x, _501);
    if (_411)
    {
        float _521 = _226 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _465 = _521;
    }
    float _523 = _465;
    float _525 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[27].x, _507);
    float _527 = _477 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _529 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[26].z, _519);
    float _531 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[33].z, _475);
    float _533 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[27].z, _525);
    float _535 = fma(_341, _527, _166);
    float _537 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[25].x, _487);
    float _539 = fma(_353, _527, _168);
    float _541 = fma(_357, _527, _158);
    float _543 = _535 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _545 = _523;
    if (!_517)
    {
        float _547 = _529 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _491 = _547;
    }
    float _549 = _491;
    float _551 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[25].z, _537);
    float _553 = fma(_539, (*spvDescriptorSet0.fp_c3)._m0[3].x, _543);
    float _555 = _535 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _557 = _535 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _559 = _535 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _561 = fma(_541, (*spvDescriptorSet0.fp_c3)._m0[3].z, _553);
    if (!_517)
    {
        float _563 = _551 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _545 = _563;
    }
    float _565 = _545;
    float _567 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _569 = 0.0 + _495;
    float _571 = precise::clamp(_569, 0.0, 1.0);
    float _573 = _561 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _575 = fma(_539, (*spvDescriptorSet0.fp_c3)._m0[0].x, _555);
    float _577 = fma(_539, (*spvDescriptorSet0.fp_c3)._m0[1].x, _557);
    float _579 = fma(_539, (*spvDescriptorSet0.fp_c3)._m0[2].x, _559);
    float _581 = _479 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _583 = _571 * _567;
    float _585 = 1.0 / _573;
    float _587 = _581;
    if (_411)
    {
        float _589 = _531 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _587 = _589;
    }
    float _591 = _587;
    float _593 = fma(_541, (*spvDescriptorSet0.fp_c3)._m0[0].z, _575);
    float _595 = fma(_541, (*spvDescriptorSet0.fp_c3)._m0[1].z, _577);
    float _597 = fma(_541, (*spvDescriptorSet0.fp_c3)._m0[2].z, _579);
    float _599 = _591;
    if (!_517)
    {
        float _601 = _533 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _599 = _601;
    }
    float _603 = _599;
    float _605 = fma(_583, 0.5, _499);
    float _607 = fma(_583, -0.5, _499);
    float _609 = _593 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _611 = _595 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _613 = _597 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _615 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _617 = 0.0 + _603;
    float _619 = precise::clamp(_617, 0.0, 1.0);
    float _621 = rint(_305);
    float _623 = precise::max(_621, 0.0);
    uint _626 = uint(_623);
    uint _628 = clamp(_626, 0u, 65535u);
    float _630 = _571 * _615;
    float _632 = _609 * _585;
    float _634 = _611 * _585;
    float _636 = _613 * _585;
    float _638 = precise::clamp(_636, 0.0, 1.0);
    float _640 = _615 * _619;
    float _642 = _567 * _619;
    float _644 = fma(_630, 0.5, _505);
    float _646 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _638;
    float _648 = fma(_640, 0.5, _549);
    float _650 = fma(_640, -0.5, _549);
    float _652 = fma(_630, -0.5, _505);
    float _654 = fma(_642, 0.5, _565);
    float _656 = fma(_642, -0.5, _565);
    float _658 = _646 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _660 = _646 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _662 = rint(_393);
    float _664 = precise::max(_662, 0.0);
    uint _666 = uint(_664);
    uint _668 = clamp(_666, 0u, 65535u);
    float _670 = fma(_78, 2.0, -1.0);
    float _672 = fma(_76, 2.0, -1.0);
    float _674 = fma(_658, 0.5, _632);
    float _676 = fma(_658, -0.5, _632);
    float _678 = fma(_660, 0.5, _634);
    float _680 = _670 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _682 = _672 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _684 = fma(_660, -0.5, _634);
    float3 _1866 = float3(_674, _678, float(0));
    float3 _1870 = select(_1866, float3(0.0), isnan(_1866));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1870.xy, uint(rint(_1870.z)), _638);
    float3 _1877 = float3(_676, _678, float(0));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1879.xy, uint(rint(_1879.z)), _638);
    float _690 = fma(_680, 2.0, _58);
    float _692 = fma(_682, 2.0, _56);
    float3 _1892 = float3(_674, _684, float(0));
    float3 _1894 = select(_1892, float3(0.0), isnan(_1892));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1894.xy, uint(rint(_1894.z)), _638);
    float3 _1901 = float3(_676, _684, float(0));
    float3 _1903 = select(_1901, float3(0.0), isnan(_1901));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1903.xy, uint(rint(_1903.z)), _638);
    float3 _1912 = float3(_607, _644, float(int(_628)));
    float3 _1914 = select(_1912, float3(0.0), isnan(_1912));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1914.xy, uint(rint(_1914.z)), _571);
    float3 _1923 = float3(_605, _644, float(int(_628)));
    float3 _1925 = select(_1923, float3(0.0), isnan(_1923));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1925.xy, uint(rint(_1925.z)), _571);
    float3 _1934 = float3(_605, _652, float(int(_628)));
    float3 _1936 = select(_1934, float3(0.0), isnan(_1934));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1936.xy, uint(rint(_1936.z)), _571);
    float3 _1945 = float3(_656, _648, float(int(_668)));
    float3 _1947 = select(_1945, float3(0.0), isnan(_1945));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1947.xy, uint(rint(_1947.z)), _619);
    float3 _1956 = float3(_654, _648, float(int(_668)));
    float3 _1958 = select(_1956, float3(0.0), isnan(_1956));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1958.xy, uint(rint(_1958.z)), _619);
    float3 _1967 = float3(_654, _650, float(int(_668)));
    float3 _1969 = select(_1967, float3(0.0), isnan(_1967));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1969.xy, uint(rint(_1969.z)), _619);
    float3 _1978 = float3(_607, _652, float(int(_628)));
    float3 _1980 = select(_1978, float3(0.0), isnan(_1978));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1980.xy, uint(rint(_1980.z)), _571);
    float3 _1989 = float3(_656, _650, float(int(_668)));
    float3 _1991 = select(_1989, float3(0.0), isnan(_1989));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _1991.xy, uint(rint(_1991.z)), _619);
    float2 _1997 = float2(_692, _690);
    float _714 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1997, float2(0.0), isnan(_1997))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1997, float2(0.0), isnan(_1997))).x;
    float _716 = -_158;
    float _718 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _720 = _716 + _718;
    float _722 = _720 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = _686 + _688;
    float _728 = -_158;
    float _730 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _732 = _728 + _730;
    float _734 = _732 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = _726 + _694;
    float _740 = _738 + _696;
    float _742 = _700 + _698;
    float _744 = fma(_740, 0.25, _736);
    float _746 = _742 + _702;
    float _748 = _706 + _704;
    float _750 = _748 + _708;
    float _752 = _746 + _710;
    float _754 = _750 + _712;
    float _756 = _752 * 0.25;
    float _758 = _754 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _760 = _758 * 0.25;
    float _762 = fma(_756, (*spvDescriptorSet0.fp_c3)._m0[49].z, _760);
    float _764 = _724 + _762;
    out.m_49.x = _714;
    out.m_49.y = _744;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _764;
    return out;
}

