#pragma clang diagnostic ignored "-Wmissing-prototypes"
#pragma clang diagnostic ignored "-Wmissing-braces"

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

template<typename T, size_t Num>
struct spvUnsafeArray
{
    T elements[Num ? Num : 1];
    
    thread T& operator [] (size_t pos) thread
    {
        return elements[pos];
    }
    constexpr const thread T& operator [] (size_t pos) const thread
    {
        return elements[pos];
    }
    
    device T& operator [] (size_t pos) device
    {
        return elements[pos];
    }
    constexpr const device T& operator [] (size_t pos) const device
    {
        return elements[pos];
    }
    
    constexpr const constant T& operator [] (size_t pos) const constant
    {
        return elements[pos];
    }
    
    threadgroup T& operator [] (size_t pos) threadgroup
    {
        return elements[pos];
    }
    constexpr const threadgroup T& operator [] (size_t pos) const threadgroup
    {
        return elements[pos];
    }
};

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
    texturecube<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_41 [[color(0)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
    float4 m_36 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5478 = false;
    bool _5460 = false;
    bool _5316 = false;
    bool _5298 = false;
    bool _5154 = false;
    bool _5136 = false;
    bool _4992 = false;
    bool _4974 = false;
    bool _4830 = false;
    bool _4812 = false;
    bool _4668 = false;
    bool _4650 = false;
    bool _4506 = false;
    bool _4488 = false;
    bool _4344 = false;
    bool _4326 = false;
    bool _4182 = false;
    bool _4164 = false;
    bool _4020 = false;
    bool _4002 = false;
    bool _3858 = false;
    bool _3840 = false;
    bool _3696 = false;
    bool _3678 = false;
    bool _3534 = false;
    bool _3516 = false;
    bool _3372 = false;
    bool _3354 = false;
    bool _3210 = false;
    bool _3192 = false;
    bool _3082 = false;
    bool _3048 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_36.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_34.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _48;
    float _106 = _104 * _54;
    float _108 = _104 * _60;
    float _110 = _104 * _66;
    float _112 = _104 * _72;
    float _114 = _104 * _78;
    float _116 = _104 * _84;
    float _118 = abs(_106);
    float _120 = abs(_108);
    float _122 = precise::max(_118, _120);
    float _124 = _106 + _110;
    float _126 = _108 + _112;
    float _128 = _104 * _90;
    float _130 = _104 * _96;
    float _132 = abs(_114);
    float _134 = precise::max(_132, _122);
    float _136 = _114 + _116;
    float _138 = abs(_124);
    float _140 = abs(_126);
    float _142 = precise::max(_138, _140);
    float _144 = fma(_110, 2.0, _106);
    float _146 = fma(_112, 2.0, _108);
    float _148 = _104 * _102;
    float _150 = _106 + _128;
    float _152 = _108 + _130;
    float _154 = 1.0 / _134;
    float _156 = abs(_136);
    float _158 = precise::max(_156, _142);
    float _160 = fma(_116, 2.0, _114);
    float _162 = _114 + _148;
    float _164 = abs(_144);
    float _166 = abs(_146);
    float _168 = precise::max(_164, _166);
    float _170 = fma(_128, 2.0, _106);
    float _172 = fma(_130, 2.0, _108);
    float _174 = fma(_128, 3.0, _106);
    float _176 = abs(_160);
    float _178 = precise::max(_176, _168);
    float _180 = 1.0 / _158;
    float _182 = abs(_150);
    float _184 = abs(_152);
    float _186 = precise::max(_182, _184);
    float _188 = fma(_148, 2.0, _114);
    float _190 = fma(_110, 3.0, _106);
    float _192 = fma(_112, 3.0, _108);
    float _194 = abs(_162);
    float _196 = precise::max(_194, _186);
    float _198 = fma(_130, 3.0, _108);
    float _200 = fma(_148, 3.0, _114);
    float _202 = 1.0 / _178;
    float _204 = abs(_170);
    float _206 = abs(_172);
    float _208 = precise::max(_204, _206);
    float _210 = _114 * _154;
    float _212 = abs(_174);
    float _214 = abs(_198);
    float _216 = precise::max(_212, _214);
    float _218 = fma(_116, 3.0, _114);
    float _220 = abs(_188);
    float _222 = precise::max(_220, _208);
    float _224 = _150 + _110;
    float _226 = abs(_200);
    float _228 = precise::max(_226, _216);
    float _230 = 1.0 / _196;
    float _232 = _152 + _112;
    float _234 = abs(_190);
    float _236 = abs(_192);
    float _238 = precise::max(_234, _236);
    float _240 = _170 + _110;
    float _242 = _172 + _112;
    float _244 = _108 * _154;
    float _246 = abs(_218);
    float _248 = precise::max(_246, _238);
    float _250 = _162 + _116;
    float _252 = 1.0 / _222;
    float _254 = abs(_224);
    float _256 = abs(_232);
    float _258 = precise::max(_254, _256);
    float _260 = _124 * _180;
    float _262 = _126 * _180;
    float _264 = _136 * _180;
    float _266 = _188 + _116;
    float _268 = _174 + _110;
    float _270 = _198 + _112;
    float _272 = 1.0 / _228;
    float _274 = abs(_240);
    float _276 = abs(_242);
    float _278 = precise::max(_274, _276);
    float _280 = _144 * _202;
    float _282 = abs(_250);
    float _284 = precise::max(_282, _258);
    float _286 = _146 * _202;
    float _288 = _160 * _202;
    float _290 = _200 + _116;
    float _292 = abs(_266);
    float _294 = precise::max(_292, _278);
    float _296 = _106 * _154;
    float _298 = abs(_268);
    float _300 = abs(_270);
    float _302 = precise::max(_298, _300);
    float _304 = fma(_110, 2.0, _150);
    float _306 = fma(_110, 3.0, _150);
    float _308 = 1.0 / _284;
    float _310 = fma(_112, 2.0, _152);
    float _312 = _150 * _230;
    float _314 = _152 * _230;
    float _316 = _162 * _230;
    float _318 = fma(_116, 2.0, _162);
    float _320 = _170 * _252;
    float _322 = _172 * _252;
    float _324 = 1.0 / _294;
    float _326 = abs(_290);
    float _328 = precise::max(_326, _302);
    float _330 = _188 * _252;
    float _332 = fma(_110, 2.0, _170);
    float _334 = abs(_304);
    float _336 = abs(_310);
    float _338 = precise::max(_334, _336);
    float _340 = fma(_112, 2.0, _172);
    float3 _7672 = float3(_296, _244, _210);
    float4 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7672, float3(0.0), isnan(_7672)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7672, float3(0.0), isnan(_7672)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = _343.w;
    float3 _7695 = float3(_312, _314, _316);
    float4 _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7695, float3(0.0), isnan(_7695)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7695, float3(0.0), isnan(_7695)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _355 = _353.x;
    float _357 = _353.y;
    float _359 = _353.z;
    float _361 = _353.w;
    float3 _7714 = float3(_320, _322, _330);
    float4 _363 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7714, float3(0.0), isnan(_7714)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _365 = _363.x;
    float _367 = _363.y;
    float _369 = _363.z;
    float _371 = _363.w;
    float _373 = fma(_110, 3.0, _170);
    float _375 = fma(_110, 2.0, _174);
    float _377 = 1.0 / _328;
    float _379 = fma(_110, 3.0, _174);
    float _381 = _174 * _272;
    float _383 = _198 * _272;
    float _385 = _200 * _272;
    float _387 = fma(_116, 2.0, _188);
    float _389 = abs(_318);
    float _391 = precise::max(_389, _338);
    float _393 = fma(_112, 2.0, _198);
    float _395 = abs(_332);
    float _397 = abs(_340);
    float _399 = precise::max(_395, _397);
    float _401 = fma(_116, 2.0, _200);
    float3 _7774 = float3(_381, _383, _385);
    float4 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7774, float3(0.0), isnan(_7774)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7774, float3(0.0), isnan(_7774)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = _403.w;
    float3 _7793 = float3(_260, _262, _264);
    float4 _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7793, float3(0.0), isnan(_7793)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7793, float3(0.0), isnan(_7793)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _415 = _413.x;
    float _417 = _413.y;
    float _419 = _413.z;
    float _421 = _413.w;
    float _423 = abs(_375);
    float _425 = abs(_393);
    float _427 = precise::max(_423, _425);
    float _429 = 1.0 / _391;
    float _431 = abs(_387);
    float _433 = precise::max(_431, _399);
    float _435 = _224 * _308;
    float _437 = _232 * _308;
    float _439 = _250 * _308;
    float _441 = fma(_112, 3.0, _152);
    float _443 = abs(_401);
    float _445 = precise::max(_443, _427);
    float _447 = _240 * _324;
    float _449 = 1.0 / _433;
    float _451 = _242 * _324;
    float _453 = _266 * _324;
    float _455 = fma(_116, 3.0, _162);
    float _457 = fma(_112, 3.0, _172);
    float _459 = abs(_306);
    float _461 = abs(_441);
    float _463 = precise::max(_459, _461);
    float3 _7867 = float3(_435, _437, _439);
    float4 _465 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7867, float3(0.0), isnan(_7867)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7867, float3(0.0), isnan(_7867)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _467 = _465.x;
    float _469 = _465.y;
    float _471 = _465.z;
    float _473 = _465.w;
    float _475 = _268 * _377;
    float _477 = 1.0 / _445;
    float _479 = _270 * _377;
    float _481 = _290 * _377;
    float _483 = fma(_116, 3.0, _188);
    float _485 = fma(_112, 3.0, _198);
    float _487 = abs(_455);
    float _489 = precise::max(_487, _463);
    float3 _7908 = float3(_447, _451, _453);
    float4 _491 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7908, float3(0.0), isnan(_7908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7908, float3(0.0), isnan(_7908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _493 = _491.x;
    float _495 = _491.y;
    float _497 = _491.z;
    float _499 = _491.w;
    float _501 = abs(_373);
    float _503 = abs(_457);
    float _505 = precise::max(_501, _503);
    float _507 = 1.0 / _248;
    float _509 = fma(_116, 3.0, _200);
    float _511 = abs(_379);
    float _513 = abs(_485);
    float _515 = precise::max(_511, _513);
    float3 _7946 = float3(_475, _479, _481);
    float4 _517 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7946, float3(0.0), isnan(_7946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7946, float3(0.0), isnan(_7946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _519 = _517.x;
    float _521 = _517.y;
    float _523 = _517.z;
    float _525 = _517.w;
    float3 _7965 = float3(_280, _286, _288);
    float4 _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7965, float3(0.0), isnan(_7965)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7965, float3(0.0), isnan(_7965)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _529 = _527.x;
    float _531 = _527.y;
    float _533 = _527.z;
    float _535 = _527.w;
    float _537 = abs(_483);
    float _539 = precise::max(_537, _505);
    float _541 = _304 * _429;
    float _543 = _310 * _429;
    float _545 = 1.0 / _489;
    float _547 = _318 * _429;
    float _549 = abs(_509);
    float _551 = precise::max(_549, _515);
    float _553 = _332 * _449;
    float _555 = _340 * _449;
    float _557 = _387 * _449;
    float _559 = _375 * _477;
    float _561 = _393 * _477;
    float _563 = 1.0 / _539;
    float3 _8022 = float3(_541, _543, _547);
    float4 _565 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8022, float3(0.0), isnan(_8022)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8022, float3(0.0), isnan(_8022)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _567 = _565.x;
    float _569 = _565.y;
    float _571 = _565.z;
    float _573 = _565.w;
    float _575 = _401 * _477;
    float3 _8044 = float3(_553, _555, _557);
    float4 _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8044, float3(0.0), isnan(_8044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8044, float3(0.0), isnan(_8044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _579 = _577.x;
    float _581 = _577.y;
    float _583 = _577.z;
    float _585 = _577.w;
    float _587 = _190 * _507;
    float _589 = _192 * _507;
    float _591 = _218 * _507;
    float _593 = 1.0 / _551;
    float3 _8074 = float3(_559, _561, _575);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8074, float3(0.0), isnan(_8074)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8074, float3(0.0), isnan(_8074)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = _306 * _545;
    float _607 = _441 * _545;
    float _609 = _455 * _545;
    float3 _8102 = float3(_587, _589, _591);
    float4 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8102, float3(0.0), isnan(_8102)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8102, float3(0.0), isnan(_8102)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _613 = _611.x;
    float _615 = _611.y;
    float _617 = _611.z;
    float _619 = _611.w;
    float _621 = _373 * _563;
    float _623 = _457 * _563;
    float _625 = _483 * _563;
    float3 _8130 = float3(_605, _607, _609);
    float4 _627 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8130, float3(0.0), isnan(_8130)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8130, float3(0.0), isnan(_8130)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _629 = _627.x;
    float _631 = _627.y;
    float _633 = _627.z;
    float _635 = _627.w;
    float _637 = _379 * _593;
    float _639 = _485 * _593;
    float _641 = _509 * _593;
    float3 _8158 = float3(_621, _623, _625);
    float4 _643 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8158, float3(0.0), isnan(_8158)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8158, float3(0.0), isnan(_8158)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _645 = _643.x;
    float _647 = _643.y;
    float _649 = _643.z;
    float _651 = _643.w;
    float3 _8177 = float3(_637, _639, _641);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8177, float3(0.0), isnan(_8177)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8177, float3(0.0), isnan(_8177)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float _663 = _347 + _357;
    float _665 = _345 + _355;
    float _667 = _349 + _359;
    float _669 = _367 + _663;
    float _671 = _365 + _665;
    float _673 = _369 + _667;
    float _675 = _407 + _669;
    float _677 = _405 + _671;
    float _679 = _409 + _673;
    float _681 = _417 + _675;
    float _683 = _415 + _677;
    float _685 = _419 + _679;
    float _687 = _469 + _681;
    float _689 = _467 + _683;
    float _691 = _471 + _685;
    float _693 = _495 + _687;
    float _695 = _493 + _689;
    float _697 = _497 + _691;
    float _699 = _521 + _693;
    float _701 = _519 + _695;
    float _703 = _523 + _697;
    float _705 = _531 + _699;
    float _707 = _529 + _701;
    float _709 = _533 + _703;
    float _711 = _569 + _705;
    float _713 = _567 + _707;
    float _715 = _571 + _709;
    float _717 = _581 + _711;
    float _719 = _579 + _713;
    float _721 = _583 + _715;
    float _723 = _599 + _717;
    float _725 = _597 + _719;
    float _727 = _601 + _721;
    float _729 = _615 + _723;
    float _731 = _613 + _725;
    float _733 = _617 + _727;
    float _735 = _631 + _729;
    float _737 = _629 + _731;
    float _739 = _633 + _733;
    float _741 = _647 + _735;
    float _743 = _645 + _737;
    float _745 = _649 + _739;
    float _747 = _657 + _741;
    float _749 = _655 + _743;
    float _751 = _659 + _745;
    float _753 = fma(_747, -0.0625, _357);
    float _755 = fma(_749, -0.0625, _355);
    float _757 = fma(_751, -0.0625, _359);
    float _759 = fma(_747, -0.0625, _347);
    float _761 = _753 * _753;
    float _763 = _755 * _753;
    float _765 = _753 * _757;
    float _767 = fma(_749, -0.0625, _345);
    float _769 = fma(_751, -0.0625, _349);
    float _771 = _755 * _755;
    float _773 = _755 * _757;
    float _775 = fma(_759, _759, _761);
    float _777 = fma(_767, _759, _763);
    float _779 = fma(_759, _769, _765);
    float _781 = fma(_767, _767, _771);
    float _783 = fma(_767, _769, _773);
    float _785 = _757 * _757;
    float _787 = fma(_747, -0.0625, _367);
    float _789 = fma(_749, -0.0625, _365);
    float _791 = fma(_751, -0.0625, _369);
    float _793 = fma(_769, _769, _785);
    float _795 = fma(_787, _787, _775);
    float _797 = fma(_789, _787, _777);
    float _799 = fma(_787, _791, _779);
    float _801 = fma(_789, _789, _781);
    float _803 = fma(_789, _791, _783);
    float _805 = fma(_747, -0.0625, _407);
    float _807 = fma(_749, -0.0625, _405);
    float _809 = fma(_751, -0.0625, _409);
    float _811 = fma(_791, _791, _793);
    float _813 = fma(_805, _805, _795);
    float _815 = fma(_807, _805, _797);
    float _817 = fma(_805, _809, _799);
    float _819 = fma(_807, _807, _801);
    float _821 = fma(_807, _809, _803);
    float _823 = fma(_747, -0.0625, _417);
    float _825 = fma(_749, -0.0625, _415);
    float _827 = fma(_751, -0.0625, _419);
    float _829 = fma(_809, _809, _811);
    float _831 = fma(_823, _823, _813);
    float _833 = fma(_825, _823, _815);
    float _835 = fma(_823, _827, _817);
    float _837 = fma(_825, _825, _819);
    float _839 = fma(_825, _827, _821);
    float _841 = fma(_747, -0.0625, _469);
    float _843 = fma(_749, -0.0625, _467);
    float _845 = fma(_751, -0.0625, _471);
    float _847 = fma(_827, _827, _829);
    float _849 = fma(_841, _841, _831);
    float _851 = fma(_843, _841, _833);
    float _853 = fma(_841, _845, _835);
    float _855 = fma(_843, _843, _837);
    float _857 = fma(_843, _845, _839);
    float _859 = fma(_747, -0.0625, _495);
    float _861 = fma(_749, -0.0625, _493);
    float _863 = fma(_751, -0.0625, _497);
    float _865 = fma(_845, _845, _847);
    float _867 = fma(_859, _859, _849);
    float _869 = fma(_861, _859, _851);
    float _871 = fma(_859, _863, _853);
    float _873 = fma(_861, _861, _855);
    float _875 = fma(_861, _863, _857);
    float _877 = fma(_747, -0.0625, _521);
    float _879 = fma(_749, -0.0625, _519);
    float _881 = fma(_751, -0.0625, _523);
    float _883 = fma(_863, _863, _865);
    float _885 = fma(_877, _877, _867);
    float _887 = fma(_879, _877, _869);
    float _889 = fma(_877, _881, _871);
    float _891 = fma(_879, _879, _873);
    float _893 = fma(_879, _881, _875);
    float _895 = fma(_747, -0.0625, _531);
    float _897 = fma(_749, -0.0625, _529);
    float _899 = fma(_751, -0.0625, _533);
    float _901 = fma(_881, _881, _883);
    float _903 = fma(_895, _895, _885);
    float _905 = fma(_897, _895, _887);
    float _907 = fma(_895, _899, _889);
    float _909 = fma(_897, _897, _891);
    float _911 = fma(_897, _899, _893);
    float _913 = fma(_747, -0.0625, _569);
    float _915 = fma(_749, -0.0625, _567);
    float _917 = fma(_751, -0.0625, _571);
    float _919 = fma(_899, _899, _901);
    float _921 = fma(_913, _913, _903);
    float _923 = fma(_915, _913, _905);
    float _925 = fma(_913, _917, _907);
    float _927 = fma(_915, _915, _909);
    float _929 = fma(_915, _917, _911);
    float _931 = fma(_747, -0.0625, _581);
    float _933 = fma(_749, -0.0625, _579);
    float _935 = fma(_751, -0.0625, _583);
    float _937 = fma(_917, _917, _919);
    float _939 = fma(_931, _931, _921);
    float _941 = fma(_933, _931, _923);
    float _943 = fma(_931, _935, _925);
    float _945 = fma(_933, _933, _927);
    float _947 = fma(_933, _935, _929);
    float _949 = fma(_747, -0.0625, _599);
    float _951 = fma(_749, -0.0625, _597);
    float _953 = fma(_751, -0.0625, _601);
    float _955 = fma(_935, _935, _937);
    float _957 = fma(_949, _949, _939);
    float _959 = fma(_951, _949, _941);
    float _961 = fma(_949, _953, _943);
    float _963 = fma(_951, _951, _945);
    float _965 = fma(_951, _953, _947);
    float _967 = fma(_747, -0.0625, _615);
    float _969 = fma(_749, -0.0625, _613);
    float _971 = fma(_751, -0.0625, _617);
    float _973 = fma(_953, _953, _955);
    float _975 = fma(_967, _967, _957);
    float _977 = fma(_969, _967, _959);
    float _979 = fma(_967, _971, _961);
    float _981 = fma(_969, _969, _963);
    float _983 = fma(_969, _971, _965);
    float _985 = fma(_747, -0.0625, _631);
    float _987 = fma(_749, -0.0625, _629);
    float _989 = fma(_751, -0.0625, _633);
    float _991 = fma(_971, _971, _973);
    float _993 = fma(_985, _985, _975);
    float _995 = fma(_987, _985, _977);
    float _997 = fma(_985, _989, _979);
    float _999 = fma(_987, _987, _981);
    float _1001 = fma(_987, _989, _983);
    float _1003 = fma(_747, -0.0625, _647);
    float _1005 = fma(_749, -0.0625, _645);
    float _1007 = fma(_751, -0.0625, _649);
    float _1009 = fma(_749, -0.0625, _655);
    float _1011 = fma(_1003, _1003, _993);
    float _1013 = fma(_1005, _1003, _995);
    float _1015 = fma(_1003, _1007, _997);
    float _1017 = fma(_747, -0.0625, _657);
    float _1019 = fma(_989, _989, _991);
    float _1021 = fma(_751, -0.0625, _659);
    float _1023 = fma(_1005, _1005, _999);
    float _1025 = fma(_1017, _1017, _1011);
    float _1027 = fma(_1009, _1017, _1013);
    float _1029 = fma(_1005, _1007, _1001);
    float _1031 = fma(_1017, _1021, _1015);
    float _1033 = fma(_1009, _1009, _1023);
    float _1035 = _1025 + _1027;
    float _1037 = fma(_1007, _1007, _1019);
    float _1039 = fma(_1009, _1021, _1029);
    float _1041 = _1033 + _1027;
    float _1043 = _1031 + _1035;
    float _1045 = fma(_1021, _1021, _1037);
    float _1047 = _1031 + _1039;
    float _1049 = _1039 + _1041;
    float _1051 = _1043 * _1043;
    float _1053 = _1045 + _1047;
    float _1055 = fma(_1049, _1049, _1051);
    float _1057 = fma(_1053, _1053, _1055);
    float _1059 = rsqrt(_1057);
    float _1061 = _1043 * _1059;
    float _1063 = _1049 * _1059;
    float _1065 = _1053 * _1059;
    float _1067 = _1025 * _1061;
    float _1069 = _1027 * _1061;
    float _1071 = fma(_1027, _1063, _1067);
    float _1073 = _1031 * _1061;
    float _1075 = fma(_1033, _1063, _1069);
    float _1077 = fma(_1031, _1065, _1071);
    float _1079 = fma(_1039, _1063, _1073);
    float _1081 = fma(_1039, _1065, _1075);
    float _1083 = _1077 * _1077;
    float _1085 = fma(_1045, _1065, _1079);
    float _1087 = fma(_1081, _1081, _1083);
    float _1089 = fma(_1085, _1085, _1087);
    float _1091 = rsqrt(_1089);
    float _1093 = _1077 * _1091;
    float _1095 = _1081 * _1091;
    float _1097 = _1085 * _1091;
    float _1099 = _1025 * _1093;
    float _1101 = _1027 * _1093;
    float _1103 = _1031 * _1093;
    float _1105 = fma(_1027, _1095, _1099);
    float _1107 = fma(_1033, _1095, _1101);
    float _1109 = fma(_1039, _1095, _1103);
    float _1111 = fma(_1031, _1097, _1105);
    float _1113 = fma(_1039, _1097, _1107);
    float _1115 = fma(_1045, _1097, _1109);
    float _1117 = _1111 * _1111;
    float _1119 = fma(_1113, _1113, _1117);
    float _1121 = fma(_1115, _1115, _1119);
    float _1123 = rsqrt(_1121);
    float _1125 = _1111 * _1123;
    float _1127 = _1113 * _1123;
    float _1129 = _1115 * _1123;
    float _1131 = _1025 * _1125;
    float _1133 = _1027 * _1125;
    float _1135 = _1031 * _1125;
    float _1137 = fma(_1027, _1127, _1131);
    float _1139 = fma(_1033, _1127, _1133);
    float _1141 = fma(_1039, _1127, _1135);
    float _1143 = fma(_1031, _1129, _1137);
    float _1145 = fma(_1039, _1129, _1139);
    float _1147 = fma(_1045, _1129, _1141);
    float _1149 = _1143 * _1143;
    float _1151 = fma(_1145, _1145, _1149);
    float _1153 = fma(_1147, _1147, _1151);
    float _1155 = rsqrt(_1153);
    float _1157 = _1143 * _1155;
    float _1159 = _1145 * _1155;
    float _1161 = _1147 * _1155;
    float _1163 = _1025 * _1157;
    float _1165 = _1027 * _1157;
    float _1167 = _1031 * _1157;
    float _1169 = fma(_1027, _1159, _1163);
    float _1171 = fma(_1033, _1159, _1165);
    float _1173 = fma(_1039, _1159, _1167);
    float _1175 = fma(_1031, _1161, _1169);
    float _1177 = fma(_1039, _1161, _1171);
    float _1179 = fma(_1045, _1161, _1173);
    float _1181 = _1175 * _1175;
    float _1183 = fma(_1177, _1177, _1181);
    float _1185 = fma(_1179, _1179, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = _1175 * _1187;
    float _1191 = _1177 * _1187;
    float _1193 = _1179 * _1187;
    float _1195 = _1025 * _1189;
    float _1197 = _1027 * _1189;
    float _1199 = _1031 * _1189;
    float _1201 = fma(_1027, _1191, _1195);
    float _1203 = fma(_1033, _1191, _1197);
    float _1205 = fma(_1039, _1191, _1199);
    float _1207 = fma(_1031, _1193, _1201);
    float _1209 = fma(_1039, _1193, _1203);
    float _1211 = fma(_1045, _1193, _1205);
    float _1213 = _1207 * _1207;
    float _1215 = fma(_1209, _1209, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1207 * _1219;
    float _1223 = _1209 * _1219;
    float _1225 = _1211 * _1219;
    float _1227 = _1025 * _1221;
    float _1229 = _1027 * _1221;
    float _1231 = _1031 * _1221;
    float _1233 = fma(_1027, _1223, _1227);
    float _1235 = fma(_1033, _1223, _1229);
    float _1237 = fma(_1039, _1223, _1231);
    float _1239 = fma(_1031, _1225, _1233);
    float _1241 = fma(_1039, _1225, _1235);
    float _1243 = fma(_1045, _1225, _1237);
    float _1245 = _1239 * _1239;
    float _1247 = fma(_1241, _1241, _1245);
    float _1249 = fma(_1243, _1243, _1247);
    float _1251 = rsqrt(_1249);
    float _1253 = _1239 * _1251;
    float _1255 = _1241 * _1251;
    float _1257 = _1243 * _1251;
    float _1259 = _1025 * _1253;
    float _1261 = _1027 * _1253;
    float _1263 = fma(_1027, _1255, _1259);
    float _1265 = _1031 * _1253;
    float _1267 = fma(_1033, _1255, _1261);
    float _1269 = fma(_1031, _1257, _1263);
    float _1271 = fma(_1039, _1255, _1265);
    float _1273 = fma(_1039, _1257, _1267);
    float _1275 = _1269 * _1269;
    float _1277 = fma(_1045, _1257, _1271);
    float _1279 = fma(_1273, _1273, _1275);
    float _1281 = fma(_1277, _1277, _1279);
    float _1283 = rsqrt(_1281);
    float _1285 = _1269 * _1283;
    float _1287 = _1273 * _1283;
    float _1289 = _1277 * _1283;
    float _1291 = _347 * _1285;
    float _1293 = _357 * _1285;
    float _1295 = _367 * _1285;
    float _1297 = fma(_345, _1287, _1291);
    float _1299 = fma(_355, _1287, _1293);
    float _1301 = fma(_365, _1287, _1295);
    float _1303 = fma(_349, _1289, _1297);
    float _1305 = fma(_359, _1289, _1299);
    float _1307 = fma(_369, _1289, _1301);
    bool _1311 = _1303 >= _1305;
    bool _1313 = isnan(_1303);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(_1305);
    bool _1319 = _1315 || _1317;
    float _1321 = _252;
    float _1323 = _1301;
    float _1325 = _1033;
    float _1327 = _1297;
    float _1329 = _1283;
    float _1331 = _1255;
    float _1333 = _1243;
    float _1335 = _1253;
    float _1337 = _1303;
    float _1339 = _1227;
    float _1341 = _1307;
    float _1343 = _1307;
    float _1345 = _1285;
    float _1347 = _1287;
    spvUnsafeArray<uint, 4> _24;
    if (!_1319)
    {
        _1321 = _355;
    }
    float _1349 = _1321;
    float _1351 = _1349;
    float _1353 = _1349;
    if (!_1319)
    {
        _1323 = _357;
    }
    float _1355 = _1323;
    float _1357 = _1355;
    float _1359 = _1355;
    if (!_1319)
    {
        _1325 = _359;
    }
    float _1361 = _1325;
    float _1363 = _1361;
    float _1365 = _1361;
    if (!_1319)
    {
        _1327 = _1303;
    }
    float _1367 = _1327;
    float _1369 = _1367;
    float _1371 = _1367;
    if (!_1319)
    {
        _1329 = _1305;
    }
    float _1373 = _1329;
    float _1375 = _1373;
    float _1377 = _1373;
    if (!_1319)
    {
        _1331 = _345;
    }
    float _1379 = _1331;
    float _1381 = _1379;
    float _1383 = _1379;
    if (!_1319)
    {
        _1333 = _347;
    }
    float _1385 = _1333;
    float _1387 = _1385;
    float _1389 = _1385;
    if (!_1319)
    {
        _1335 = _349;
    }
    float _1391 = _1335;
    bool _1393 = !_1319;
    float _1395 = _1391;
    float _1397 = _1391;
    if (!_1393)
    {
        bool _1399 = _1303 > _1305;
        if (!_1399)
        {
            _1369 = _1303;
        }
        float _1401 = _1369;
        float _1403 = _1401;
        if (!_1399)
        {
            _1375 = _1303;
        }
        float _1405 = _1375;
        float _1407 = _1405;
        if (!_1399)
        {
            _1381 = _345;
        }
        float _1409 = _1381;
        float _1411 = _1409;
        if (!_1399)
        {
            _1387 = _347;
        }
        float _1413 = _1387;
        float _1415 = _1413;
        if (!_1399)
        {
            _1395 = _349;
        }
        float _1417 = _1395;
        float _1419 = _1417;
        if (!_1399)
        {
            _1351 = _345;
        }
        float _1421 = _1351;
        float _1423 = _1421;
        if (!_1399)
        {
            _1357 = _347;
        }
        float _1425 = _1357;
        float _1427 = _1425;
        if (!_1399)
        {
            _1363 = _349;
        }
        float _1429 = _1363;
        _1365 = _1429;
        if (_1399)
        {
            _1403 = _1305;
        }
        float _1431 = _1403;
        _1371 = _1431;
        if (_1399)
        {
            _1407 = _1303;
        }
        float _1433 = _1407;
        _1377 = _1433;
        if (_1399)
        {
            _1411 = _355;
        }
        float _1435 = _1411;
        _1383 = _1435;
        if (_1399)
        {
            _1415 = _357;
        }
        float _1437 = _1415;
        _1389 = _1437;
        if (_1399)
        {
            _1419 = _359;
        }
        float _1439 = _1419;
        _1397 = _1439;
        if (_1399)
        {
            _1423 = _345;
        }
        float _1441 = _1423;
        _1353 = _1441;
        if (_1399)
        {
            _1427 = _347;
        }
        float _1443 = _1427;
        _1359 = _1443;
        if (_1399)
        {
            _1365 = _349;
        }
    }
    float _1445 = _1377;
    float _1447 = _1371;
    float _1449 = _1353;
    float _1451 = _1359;
    float _1453 = _1365;
    float _1455 = _1383;
    float _1457 = _1389;
    float _1459 = _1397;
    bool _1461 = _1445 >= _1307;
    bool _1463 = isnan(_1445);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(_1307);
    bool _1469 = _1465 || _1467;
    float _1471 = _407 * _1285;
    float _1473 = fma(_405, _1287, _1471);
    float _1475 = fma(_409, _1289, _1473);
    float _1477 = _1473;
    float _1479 = _1447;
    float _1481 = _1455;
    float _1483 = _1457;
    float _1485 = _1447;
    float _1487 = _1455;
    float _1489 = _1457;
    float _1491 = _1459;
    float _1493 = _1445;
    float _1495 = _1453;
    float _1497 = _1475;
    float _1499 = _1475;
    if (!_1469)
    {
        _1337 = _365;
    }
    float _1501 = _1337;
    float _1503 = _1501;
    float _1505 = _1501;
    if (!_1469)
    {
        _1477 = _367;
    }
    float _1507 = _1477;
    float _1509 = _1507;
    float _1511 = _1507;
    if (!_1469)
    {
        _1339 = _369;
    }
    float _1513 = _1339;
    bool _1515 = !_1469;
    float _1517 = _1513;
    float _1519 = _1513;
    if (!_1515)
    {
        bool _1521 = _1447 > _1307;
        if (_1521)
        {
            _1479 = _1307;
        }
        float _1523 = _1479;
        _1485 = _1523;
        if (!_1521)
        {
            _1503 = _1449;
        }
        float _1525 = _1503;
        float _1527 = _1525;
        if (!_1521)
        {
            _1509 = _1451;
        }
        float _1529 = _1509;
        float _1531 = _1529;
        if (!_1521)
        {
            _1517 = _1453;
        }
        float _1533 = _1517;
        float _1535 = _1533;
        if (!_1521)
        {
            _1341 = _1445;
        }
        float _1537 = _1341;
        float _1539 = _1537;
        if (_1521)
        {
            _1527 = _1449;
        }
        float _1541 = _1527;
        _1505 = _1541;
        if (_1521)
        {
            _1531 = _1451;
        }
        float _1543 = _1531;
        _1511 = _1543;
        if (_1521)
        {
            _1535 = _1453;
        }
        float _1545 = _1535;
        _1519 = _1545;
        if (_1521)
        {
            _1539 = _1445;
        }
        float _1547 = _1539;
        _1343 = _1547;
        if (_1521)
        {
            _1481 = _365;
        }
        float _1549 = _1481;
        _1487 = _1549;
        if (_1521)
        {
            _1483 = _367;
        }
        float _1551 = _1483;
        _1489 = _1551;
        if (_1521)
        {
            _1491 = _369;
        }
    }
    float _1553 = _1343;
    float _1555 = _1485;
    float _1557 = _1505;
    float _1559 = _1511;
    float _1561 = _1519;
    float _1563 = _1487;
    float _1565 = _1489;
    float _1567 = _1491;
    bool _1569 = _1553 >= _1475;
    bool _1571 = isnan(_1553);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(_1475);
    bool _1577 = _1573 || _1575;
    float _1579 = _417 * _1285;
    float _1581 = fma(_415, _1287, _1579);
    float _1583 = fma(_419, _1289, _1581);
    float _1585 = _1581;
    float _1587 = _1555;
    float _1589 = _1563;
    float _1591 = _1565;
    float _1593 = _1555;
    float _1595 = _1563;
    float _1597 = _1565;
    float _1599 = _1567;
    float _1601 = _1557;
    float _1603 = _1561;
    float _1605 = _1583;
    float _1607 = _1583;
    if (!_1577)
    {
        _1493 = _405;
    }
    float _1609 = _1493;
    float _1611 = _1609;
    float _1613 = _1609;
    if (!_1577)
    {
        _1495 = _407;
    }
    float _1615 = _1495;
    float _1617 = _1615;
    float _1619 = _1615;
    if (!_1577)
    {
        _1585 = _409;
    }
    float _1621 = _1585;
    bool _1623 = !_1577;
    float _1625 = _1621;
    float _1627 = _1621;
    if (!_1623)
    {
        bool _1629 = _1555 > _1475;
        if (_1629)
        {
            _1587 = _1475;
        }
        float _1631 = _1587;
        _1593 = _1631;
        if (!_1629)
        {
            _1611 = _1557;
        }
        float _1633 = _1611;
        float _1635 = _1633;
        if (!_1629)
        {
            _1617 = _1559;
        }
        float _1637 = _1617;
        float _1639 = _1637;
        if (!_1629)
        {
            _1625 = _1561;
        }
        float _1641 = _1625;
        float _1643 = _1641;
        if (!_1629)
        {
            _1497 = _1553;
        }
        float _1645 = _1497;
        float _1647 = _1645;
        if (_1629)
        {
            _1635 = _1557;
        }
        float _1649 = _1635;
        _1613 = _1649;
        if (_1629)
        {
            _1639 = _1559;
        }
        float _1651 = _1639;
        _1619 = _1651;
        if (_1629)
        {
            _1643 = _1561;
        }
        float _1653 = _1643;
        _1627 = _1653;
        if (_1629)
        {
            _1647 = _1553;
        }
        float _1655 = _1647;
        _1499 = _1655;
        if (_1629)
        {
            _1589 = _405;
        }
        float _1657 = _1589;
        _1595 = _1657;
        if (_1629)
        {
            _1591 = _407;
        }
        float _1659 = _1591;
        _1597 = _1659;
        if (_1629)
        {
            _1599 = _409;
        }
    }
    float _1661 = _1499;
    float _1663 = _1593;
    float _1665 = _1613;
    float _1667 = _1619;
    float _1669 = _1627;
    float _1671 = _1595;
    float _1673 = _1597;
    float _1675 = _1599;
    bool _1677 = _1661 >= _1583;
    bool _1679 = isnan(_1661);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(_1583);
    bool _1685 = _1681 || _1683;
    float _1687 = _469 * _1285;
    float _1689 = fma(_467, _1287, _1687);
    float _1691 = fma(_471, _1289, _1689);
    float _1693 = _1689;
    float _1695 = _1663;
    float _1697 = _1671;
    float _1699 = _1673;
    float _1701 = _1663;
    float _1703 = _1671;
    float _1705 = _1673;
    float _1707 = _1675;
    float _1709 = _1665;
    float _1711 = _1667;
    float _1713 = _1691;
    float _1715 = _1691;
    float _1717 = _1661;
    if (!_1685)
    {
        _1601 = _415;
    }
    float _1719 = _1601;
    float _1721 = _1719;
    float _1723 = _1719;
    if (!_1685)
    {
        _1693 = _417;
    }
    float _1725 = _1693;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1685)
    {
        _1603 = _419;
    }
    float _1731 = _1603;
    bool _1733 = !_1685;
    float _1735 = _1731;
    float _1737 = _1731;
    if (!_1733)
    {
        bool _1739 = _1663 > _1583;
        if (_1739)
        {
            _1695 = _1583;
        }
        float _1741 = _1695;
        _1701 = _1741;
        if (!_1739)
        {
            _1721 = _1665;
        }
        float _1743 = _1721;
        float _1745 = _1743;
        if (!_1739)
        {
            _1727 = _1667;
        }
        float _1747 = _1727;
        float _1749 = _1747;
        if (!_1739)
        {
            _1735 = _1669;
        }
        float _1751 = _1735;
        float _1753 = _1751;
        if (!_1739)
        {
            _1605 = _1661;
        }
        float _1755 = _1605;
        float _1757 = _1755;
        if (_1739)
        {
            _1745 = _1665;
        }
        float _1759 = _1745;
        _1723 = _1759;
        if (_1739)
        {
            _1749 = _1667;
        }
        float _1761 = _1749;
        _1729 = _1761;
        if (_1739)
        {
            _1753 = _1669;
        }
        float _1763 = _1753;
        _1737 = _1763;
        if (_1739)
        {
            _1757 = _1661;
        }
        float _1765 = _1757;
        _1607 = _1765;
        if (_1739)
        {
            _1697 = _415;
        }
        float _1767 = _1697;
        _1703 = _1767;
        if (_1739)
        {
            _1699 = _417;
        }
        float _1769 = _1699;
        _1705 = _1769;
        if (_1739)
        {
            _1707 = _419;
        }
    }
    float _1771 = _1607;
    float _1773 = _1701;
    float _1775 = _1723;
    float _1777 = _1729;
    float _1779 = _1737;
    float _1781 = _1703;
    float _1783 = _1705;
    float _1785 = _1707;
    bool _1787 = _1771 >= _1691;
    bool _1789 = isnan(_1771);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan(_1691);
    bool _1795 = _1791 || _1793;
    float _1797 = _495 * _1285;
    float _1799 = fma(_493, _1287, _1797);
    float _1801 = fma(_497, _1289, _1799);
    float _1803 = _1799;
    float _1805 = _1773;
    float _1807 = _1781;
    float _1809 = _1783;
    float _1811 = _1773;
    float _1813 = _1781;
    float _1815 = _1783;
    float _1817 = _1785;
    float _1819 = _1779;
    float _1821 = _1771;
    float _1823 = _1801;
    float _1825 = _1801;
    if (!_1795)
    {
        _1709 = _467;
    }
    float _1827 = _1709;
    float _1829 = _1827;
    float _1831 = _1827;
    if (!_1795)
    {
        _1711 = _469;
    }
    float _1833 = _1711;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1795)
    {
        _1803 = _471;
    }
    float _1839 = _1803;
    bool _1841 = !_1795;
    float _1843 = _1839;
    float _1845 = _1839;
    if (!_1841)
    {
        bool _1847 = _1773 > _1691;
        if (_1847)
        {
            _1805 = _1691;
        }
        float _1849 = _1805;
        _1811 = _1849;
        if (!_1847)
        {
            _1829 = _1775;
        }
        float _1851 = _1829;
        float _1853 = _1851;
        if (!_1847)
        {
            _1835 = _1777;
        }
        float _1855 = _1835;
        float _1857 = _1855;
        if (!_1847)
        {
            _1843 = _1779;
        }
        float _1859 = _1843;
        float _1861 = _1859;
        if (!_1847)
        {
            _1713 = _1771;
        }
        float _1863 = _1713;
        float _1865 = _1863;
        if (_1847)
        {
            _1853 = _1775;
        }
        float _1867 = _1853;
        _1831 = _1867;
        if (_1847)
        {
            _1857 = _1777;
        }
        float _1869 = _1857;
        _1837 = _1869;
        if (_1847)
        {
            _1861 = _1779;
        }
        float _1871 = _1861;
        _1845 = _1871;
        if (_1847)
        {
            _1865 = _1771;
        }
        float _1873 = _1865;
        _1715 = _1873;
        if (_1847)
        {
            _1807 = _467;
        }
        float _1875 = _1807;
        _1813 = _1875;
        if (_1847)
        {
            _1809 = _469;
        }
        float _1877 = _1809;
        _1815 = _1877;
        if (_1847)
        {
            _1817 = _471;
        }
    }
    float _1879 = _1715;
    float _1881 = _1811;
    float _1883 = _1831;
    float _1885 = _1837;
    float _1887 = _1845;
    float _1889 = _1813;
    float _1891 = _1815;
    float _1893 = _1817;
    bool _1895 = _1879 >= _1801;
    bool _1897 = isnan(_1879);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(_1801);
    bool _1903 = _1899 || _1901;
    float _1905 = _521 * _1285;
    float _1907 = fma(_519, _1287, _1905);
    float _1909 = fma(_523, _1289, _1907);
    float _1911 = _1881;
    float _1913 = _1889;
    float _1915 = _1891;
    float _1917 = _1881;
    float _1919 = _1889;
    float _1921 = _1891;
    float _1923 = _1893;
    float _1925 = _1883;
    float _1927 = _1885;
    float _1929 = _1909;
    float _1931 = _1909;
    if (!_1903)
    {
        _1819 = _493;
    }
    float _1933 = _1819;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1903)
    {
        _1717 = _495;
    }
    float _1939 = _1717;
    float _1941 = _1939;
    float _1943 = _1939;
    if (!_1903)
    {
        _1821 = _497;
    }
    float _1945 = _1821;
    bool _1947 = !_1903;
    float _1949 = _1945;
    float _1951 = _1945;
    if (!_1947)
    {
        bool _1953 = _1881 > _1801;
        if (_1953)
        {
            _1911 = _1801;
        }
        float _1955 = _1911;
        _1917 = _1955;
        if (!_1953)
        {
            _1935 = _1883;
        }
        float _1957 = _1935;
        float _1959 = _1957;
        if (!_1953)
        {
            _1941 = _1885;
        }
        float _1961 = _1941;
        float _1963 = _1961;
        if (!_1953)
        {
            _1949 = _1887;
        }
        float _1965 = _1949;
        float _1967 = _1965;
        if (!_1953)
        {
            _1823 = _1879;
        }
        float _1969 = _1823;
        float _1971 = _1969;
        if (_1953)
        {
            _1959 = _1883;
        }
        float _1973 = _1959;
        _1937 = _1973;
        if (_1953)
        {
            _1963 = _1885;
        }
        float _1975 = _1963;
        _1943 = _1975;
        if (_1953)
        {
            _1967 = _1887;
        }
        float _1977 = _1967;
        _1951 = _1977;
        if (_1953)
        {
            _1971 = _1879;
        }
        float _1979 = _1971;
        _1825 = _1979;
        if (_1953)
        {
            _1913 = _493;
        }
        float _1981 = _1913;
        _1919 = _1981;
        if (_1953)
        {
            _1915 = _495;
        }
        float _1983 = _1915;
        _1921 = _1983;
        if (_1953)
        {
            _1923 = _497;
        }
    }
    float _1985 = _1825;
    float _1987 = _1917;
    float _1989 = _1937;
    float _1991 = _1943;
    float _1993 = _1951;
    float _1995 = _1919;
    float _1997 = _1921;
    float _1999 = _1923;
    bool _2001 = _1985 >= _1909;
    bool _2003 = isnan(_1985);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(_1909);
    bool _2009 = _2005 || _2007;
    float _2011 = _531 * _1285;
    float _2013 = fma(_529, _1287, _2011);
    float _2015 = fma(_533, _1289, _2013);
    float _2017 = _2013;
    float _2019 = _1987;
    float _2021 = _1995;
    float _2023 = _1997;
    float _2025 = _1987;
    float _2027 = _1995;
    float _2029 = _1997;
    float _2031 = _1999;
    float _2033 = _1993;
    float _2035 = _1989;
    float _2037 = _2015;
    float _2039 = _2015;
    if (!_2009)
    {
        _1925 = _519;
    }
    float _2041 = _1925;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_2009)
    {
        _1927 = _521;
    }
    float _2047 = _1927;
    float _2049 = _2047;
    float _2051 = _2047;
    if (!_2009)
    {
        _2017 = _523;
    }
    float _2053 = _2017;
    bool _2055 = !_2009;
    float _2057 = _2053;
    float _2059 = _2053;
    if (!_2055)
    {
        bool _2061 = _1987 > _1909;
        if (_2061)
        {
            _2019 = _1909;
        }
        float _2063 = _2019;
        _2025 = _2063;
        if (!_2061)
        {
            _2043 = _1989;
        }
        float _2065 = _2043;
        float _2067 = _2065;
        if (!_2061)
        {
            _2049 = _1991;
        }
        float _2069 = _2049;
        float _2071 = _2069;
        if (!_2061)
        {
            _2057 = _1993;
        }
        float _2073 = _2057;
        float _2075 = _2073;
        if (!_2061)
        {
            _1929 = _1985;
        }
        float _2077 = _1929;
        float _2079 = _2077;
        if (_2061)
        {
            _2067 = _1989;
        }
        float _2081 = _2067;
        _2045 = _2081;
        if (_2061)
        {
            _2071 = _1991;
        }
        float _2083 = _2071;
        _2051 = _2083;
        if (_2061)
        {
            _2075 = _1993;
        }
        float _2085 = _2075;
        _2059 = _2085;
        if (_2061)
        {
            _2079 = _1985;
        }
        float _2087 = _2079;
        _1931 = _2087;
        if (_2061)
        {
            _2021 = _519;
        }
        float _2089 = _2021;
        _2027 = _2089;
        if (_2061)
        {
            _2023 = _521;
        }
        float _2091 = _2023;
        _2029 = _2091;
        if (_2061)
        {
            _2031 = _523;
        }
    }
    float _2093 = _1931;
    float _2095 = _2025;
    float _2097 = _2045;
    float _2099 = _2051;
    float _2101 = _2059;
    float _2103 = _2027;
    float _2105 = _2029;
    float _2107 = _2031;
    bool _2109 = _2093 >= _2015;
    bool _2111 = isnan(_2093);
    bool _2113 = _2109 || _2111;
    bool _2115 = isnan(_2015);
    bool _2117 = _2113 || _2115;
    float _2119 = _569 * _1285;
    float _2121 = fma(_567, _1287, _2119);
    float _2123 = fma(_571, _1289, _2121);
    float _2125 = _2121;
    float _2127 = _2095;
    float _2129 = _2103;
    float _2131 = _2105;
    float _2133 = _2095;
    float _2135 = _2103;
    float _2137 = _2105;
    float _2139 = _2107;
    float _2141 = _2099;
    float _2143 = _2097;
    float _2145 = _2123;
    float _2147 = _2123;
    if (!_2117)
    {
        _2033 = _529;
    }
    float _2149 = _2033;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2117)
    {
        _2125 = _531;
    }
    float _2155 = _2125;
    float _2157 = _2155;
    float _2159 = _2155;
    if (!_2117)
    {
        _2035 = _533;
    }
    float _2161 = _2035;
    bool _2163 = !_2117;
    float _2165 = _2161;
    float _2167 = _2161;
    if (!_2163)
    {
        bool _2169 = _2095 > _2015;
        if (_2169)
        {
            _2127 = _2015;
        }
        float _2171 = _2127;
        _2133 = _2171;
        if (!_2169)
        {
            _2151 = _2097;
        }
        float _2173 = _2151;
        float _2175 = _2173;
        if (!_2169)
        {
            _2157 = _2099;
        }
        float _2177 = _2157;
        float _2179 = _2177;
        if (!_2169)
        {
            _2165 = _2101;
        }
        float _2181 = _2165;
        float _2183 = _2181;
        if (!_2169)
        {
            _2037 = _2093;
        }
        float _2185 = _2037;
        float _2187 = _2185;
        if (_2169)
        {
            _2175 = _2097;
        }
        float _2189 = _2175;
        _2153 = _2189;
        if (_2169)
        {
            _2179 = _2099;
        }
        float _2191 = _2179;
        _2159 = _2191;
        if (_2169)
        {
            _2183 = _2101;
        }
        float _2193 = _2183;
        _2167 = _2193;
        if (_2169)
        {
            _2187 = _2093;
        }
        float _2195 = _2187;
        _2039 = _2195;
        if (_2169)
        {
            _2129 = _529;
        }
        float _2197 = _2129;
        _2135 = _2197;
        if (_2169)
        {
            _2131 = _531;
        }
        float _2199 = _2131;
        _2137 = _2199;
        if (_2169)
        {
            _2139 = _533;
        }
    }
    float _2201 = _2039;
    float _2203 = _2133;
    float _2205 = _2153;
    float _2207 = _2159;
    float _2209 = _2167;
    float _2211 = _2135;
    float _2213 = _2137;
    float _2215 = _2139;
    bool _2217 = _2201 >= _2123;
    bool _2219 = isnan(_2201);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(_2123);
    bool _2225 = _2221 || _2223;
    float _2227 = _581 * _1285;
    float _2229 = fma(_579, _1287, _2227);
    float _2231 = fma(_583, _1289, _2229);
    float _2233 = _2229;
    float _2235 = _2203;
    float _2237 = _2211;
    float _2239 = _2213;
    float _2241 = _2203;
    float _2243 = _2211;
    float _2245 = _2213;
    float _2247 = _2215;
    float _2249 = _2209;
    float _2251 = _2201;
    float _2253 = _2231;
    float _2255 = _2231;
    if (!_2225)
    {
        _2233 = _567;
    }
    float _2257 = _2233;
    float _2259 = _2257;
    float _2261 = _2257;
    if (!_2225)
    {
        _2141 = _569;
    }
    float _2263 = _2141;
    float _2265 = _2263;
    float _2267 = _2263;
    if (!_2225)
    {
        _2143 = _571;
    }
    float _2269 = _2143;
    bool _2271 = !_2225;
    float _2273 = _2269;
    float _2275 = _2269;
    if (!_2271)
    {
        bool _2277 = _2203 > _2123;
        if (_2277)
        {
            _2235 = _2123;
        }
        float _2279 = _2235;
        _2241 = _2279;
        if (!_2277)
        {
            _2259 = _2205;
        }
        float _2281 = _2259;
        float _2283 = _2281;
        if (!_2277)
        {
            _2265 = _2207;
        }
        float _2285 = _2265;
        float _2287 = _2285;
        if (!_2277)
        {
            _2273 = _2209;
        }
        float _2289 = _2273;
        float _2291 = _2289;
        if (!_2277)
        {
            _2145 = _2201;
        }
        float _2293 = _2145;
        float _2295 = _2293;
        if (_2277)
        {
            _2283 = _2205;
        }
        float _2297 = _2283;
        _2261 = _2297;
        if (_2277)
        {
            _2287 = _2207;
        }
        float _2299 = _2287;
        _2267 = _2299;
        if (_2277)
        {
            _2291 = _2209;
        }
        float _2301 = _2291;
        _2275 = _2301;
        if (_2277)
        {
            _2295 = _2201;
        }
        float _2303 = _2295;
        _2147 = _2303;
        if (_2277)
        {
            _2237 = _567;
        }
        float _2305 = _2237;
        _2243 = _2305;
        if (_2277)
        {
            _2239 = _569;
        }
        float _2307 = _2239;
        _2245 = _2307;
        if (_2277)
        {
            _2247 = _571;
        }
    }
    float _2309 = _2147;
    float _2311 = _2241;
    float _2313 = _2261;
    float _2315 = _2267;
    float _2317 = _2275;
    float _2319 = _2243;
    float _2321 = _2245;
    float _2323 = _2247;
    bool _2325 = _2309 >= _2231;
    bool _2327 = isnan(_2309);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(_2231);
    bool _2333 = _2329 || _2331;
    float _2335 = _599 * _1285;
    float _2337 = fma(_597, _1287, _2335);
    float _2339 = fma(_601, _1289, _2337);
    float _2341 = _2337;
    float _2343 = _2311;
    float _2345 = _2319;
    float _2347 = _2321;
    float _2349 = _2311;
    float _2351 = _2319;
    float _2353 = _2321;
    float _2355 = _2323;
    float _2357 = _2315;
    float _2359 = _2317;
    float _2361 = _2339;
    float _2363 = _2339;
    if (!_2333)
    {
        _2249 = _579;
    }
    float _2365 = _2249;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2333)
    {
        _2341 = _581;
    }
    float _2371 = _2341;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2333)
    {
        _2251 = _583;
    }
    float _2377 = _2251;
    bool _2379 = !_2333;
    float _2381 = _2377;
    float _2383 = _2377;
    if (!_2379)
    {
        bool _2385 = _2311 > _2231;
        if (_2385)
        {
            _2343 = _2231;
        }
        float _2387 = _2343;
        _2349 = _2387;
        if (!_2385)
        {
            _2367 = _2313;
        }
        float _2389 = _2367;
        float _2391 = _2389;
        if (!_2385)
        {
            _2373 = _2315;
        }
        float _2393 = _2373;
        float _2395 = _2393;
        if (!_2385)
        {
            _2381 = _2317;
        }
        float _2397 = _2381;
        float _2399 = _2397;
        if (!_2385)
        {
            _2253 = _2309;
        }
        float _2401 = _2253;
        float _2403 = _2401;
        if (_2385)
        {
            _2391 = _2313;
        }
        float _2405 = _2391;
        _2369 = _2405;
        if (_2385)
        {
            _2395 = _2315;
        }
        float _2407 = _2395;
        _2375 = _2407;
        if (_2385)
        {
            _2399 = _2317;
        }
        float _2409 = _2399;
        _2383 = _2409;
        if (_2385)
        {
            _2403 = _2309;
        }
        float _2411 = _2403;
        _2255 = _2411;
        if (_2385)
        {
            _2345 = _579;
        }
        float _2413 = _2345;
        _2351 = _2413;
        if (_2385)
        {
            _2347 = _581;
        }
        float _2415 = _2347;
        _2353 = _2415;
        if (_2385)
        {
            _2355 = _583;
        }
    }
    float _2417 = _2255;
    float _2419 = _2349;
    float _2421 = _2369;
    float _2423 = _2375;
    float _2425 = _2383;
    float _2427 = _2351;
    float _2429 = _2353;
    float _2431 = _2355;
    bool _2433 = _2417 >= _2339;
    bool _2435 = isnan(_2417);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan(_2339);
    bool _2441 = _2437 || _2439;
    float _2443 = _615 * _1285;
    float _2445 = fma(_613, _1287, _2443);
    float _2447 = fma(_617, _1289, _2445);
    float _2449 = _2445;
    float _2451 = _2419;
    float _2453 = _2427;
    float _2455 = _2429;
    float _2457 = _2419;
    float _2459 = _2427;
    float _2461 = _2429;
    float _2463 = _2431;
    float _2465 = _2421;
    float _2467 = _2425;
    float _2469 = _2447;
    float _2471 = _2447;
    if (!_2441)
    {
        _2449 = _597;
    }
    float _2473 = _2449;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2441)
    {
        _2357 = _599;
    }
    float _2479 = _2357;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2441)
    {
        _2359 = _601;
    }
    float _2485 = _2359;
    bool _2487 = !_2441;
    float _2489 = _2485;
    float _2491 = _2485;
    if (!_2487)
    {
        bool _2493 = _2419 > _2339;
        if (_2493)
        {
            _2451 = _2339;
        }
        float _2495 = _2451;
        _2457 = _2495;
        if (!_2493)
        {
            _2475 = _2421;
        }
        float _2497 = _2475;
        float _2499 = _2497;
        if (!_2493)
        {
            _2481 = _2423;
        }
        float _2501 = _2481;
        float _2503 = _2501;
        if (!_2493)
        {
            _2489 = _2425;
        }
        float _2505 = _2489;
        float _2507 = _2505;
        if (!_2493)
        {
            _2361 = _2417;
        }
        float _2509 = _2361;
        float _2511 = _2509;
        if (_2493)
        {
            _2499 = _2421;
        }
        float _2513 = _2499;
        _2477 = _2513;
        if (_2493)
        {
            _2503 = _2423;
        }
        float _2515 = _2503;
        _2483 = _2515;
        if (_2493)
        {
            _2507 = _2425;
        }
        float _2517 = _2507;
        _2491 = _2517;
        if (_2493)
        {
            _2511 = _2417;
        }
        float _2519 = _2511;
        _2363 = _2519;
        if (_2493)
        {
            _2453 = _597;
        }
        float _2521 = _2453;
        _2459 = _2521;
        if (_2493)
        {
            _2455 = _599;
        }
        float _2523 = _2455;
        _2461 = _2523;
        if (_2493)
        {
            _2463 = _601;
        }
    }
    float _2525 = _2363;
    float _2527 = _2457;
    float _2529 = _2477;
    float _2531 = _2483;
    float _2533 = _2491;
    float _2535 = _2459;
    float _2537 = _2461;
    float _2539 = _2463;
    bool _2541 = _2525 >= _2447;
    bool _2543 = isnan(_2525);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan(_2447);
    bool _2549 = _2545 || _2547;
    float _2551 = _631 * _1285;
    float _2553 = fma(_629, _1287, _2551);
    float _2555 = fma(_633, _1289, _2553);
    float _2557 = _2553;
    float _2559 = _2527;
    float _2561 = _2535;
    float _2563 = _2537;
    float _2565 = _2527;
    float _2567 = _2535;
    float _2569 = _2537;
    float _2571 = _2539;
    float _2573 = _2531;
    float _2575 = _2533;
    float _2577 = _2555;
    float _2579 = _2555;
    if (!_2549)
    {
        _2465 = _613;
    }
    float _2581 = _2465;
    float _2583 = _2581;
    float _2585 = _2581;
    if (!_2549)
    {
        _2557 = _615;
    }
    float _2587 = _2557;
    float _2589 = _2587;
    float _2591 = _2587;
    if (!_2549)
    {
        _2467 = _617;
    }
    float _2593 = _2467;
    bool _2595 = !_2549;
    float _2597 = _2593;
    float _2599 = _2593;
    if (!_2595)
    {
        bool _2601 = _2527 > _2447;
        if (_2601)
        {
            _2559 = _2447;
        }
        float _2603 = _2559;
        _2565 = _2603;
        if (!_2601)
        {
            _2583 = _2529;
        }
        float _2605 = _2583;
        float _2607 = _2605;
        if (!_2601)
        {
            _2589 = _2531;
        }
        float _2609 = _2589;
        float _2611 = _2609;
        if (!_2601)
        {
            _2597 = _2533;
        }
        float _2613 = _2597;
        float _2615 = _2613;
        if (!_2601)
        {
            _2469 = _2525;
        }
        float _2617 = _2469;
        float _2619 = _2617;
        if (_2601)
        {
            _2607 = _2529;
        }
        float _2621 = _2607;
        _2585 = _2621;
        if (_2601)
        {
            _2611 = _2531;
        }
        float _2623 = _2611;
        _2591 = _2623;
        if (_2601)
        {
            _2615 = _2533;
        }
        float _2625 = _2615;
        _2599 = _2625;
        if (_2601)
        {
            _2619 = _2525;
        }
        float _2627 = _2619;
        _2471 = _2627;
        if (_2601)
        {
            _2561 = _613;
        }
        float _2629 = _2561;
        _2567 = _2629;
        if (_2601)
        {
            _2563 = _615;
        }
        float _2631 = _2563;
        _2569 = _2631;
        if (_2601)
        {
            _2571 = _617;
        }
    }
    float _2633 = _2471;
    float _2635 = _2565;
    float _2637 = _2585;
    float _2639 = _2591;
    float _2641 = _2599;
    float _2643 = _2567;
    float _2645 = _2569;
    float _2647 = _2571;
    bool _2649 = _2633 >= _2555;
    bool _2651 = isnan(_2633);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan(_2555);
    bool _2657 = _2653 || _2655;
    float _2659 = _647 * _1285;
    float _2661 = fma(_645, _1287, _2659);
    float _2663 = fma(_649, _1289, _2661);
    float _2665 = _2661;
    float _2667 = _2635;
    float _2669 = _2643;
    float _2671 = _2645;
    float _2673 = _2643;
    float _2675 = _2645;
    float _2677 = _2635;
    float _2679 = _2647;
    float _2681 = _2641;
    float _2683 = _2637;
    float _2685 = _2663;
    float _2687 = _2663;
    if (!_2657)
    {
        _2665 = _629;
    }
    float _2689 = _2665;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2657)
    {
        _2573 = _631;
    }
    float _2695 = _2573;
    float _2697 = _2695;
    float _2699 = _2695;
    if (!_2657)
    {
        _2575 = _633;
    }
    float _2701 = _2575;
    bool _2703 = !_2657;
    float _2705 = _2701;
    float _2707 = _2701;
    if (!_2703)
    {
        bool _2709 = _2635 > _2555;
        if (_2709)
        {
            _2667 = _2555;
        }
        float _2711 = _2667;
        _2677 = _2711;
        if (!_2709)
        {
            _2691 = _2637;
        }
        float _2713 = _2691;
        float _2715 = _2713;
        if (!_2709)
        {
            _2697 = _2639;
        }
        float _2717 = _2697;
        float _2719 = _2717;
        if (!_2709)
        {
            _2705 = _2641;
        }
        float _2721 = _2705;
        float _2723 = _2721;
        if (!_2709)
        {
            _2577 = _2633;
        }
        float _2725 = _2577;
        float _2727 = _2725;
        if (_2709)
        {
            _2715 = _2637;
        }
        float _2729 = _2715;
        _2693 = _2729;
        if (_2709)
        {
            _2719 = _2639;
        }
        float _2731 = _2719;
        _2699 = _2731;
        if (_2709)
        {
            _2723 = _2641;
        }
        float _2733 = _2723;
        _2707 = _2733;
        if (_2709)
        {
            _2727 = _2633;
        }
        float _2735 = _2727;
        _2579 = _2735;
        if (_2709)
        {
            _2669 = _629;
        }
        float _2737 = _2669;
        _2673 = _2737;
        if (_2709)
        {
            _2671 = _631;
        }
        float _2739 = _2671;
        _2675 = _2739;
        if (_2709)
        {
            _2679 = _633;
        }
    }
    float _2741 = _2579;
    float _2743 = _2673;
    float _2745 = _2675;
    float _2747 = _2677;
    float _2749 = _2693;
    float _2751 = _2699;
    float _2753 = _2707;
    float _2755 = _2679;
    bool _2757 = _2741 >= _2663;
    bool _2759 = isnan(_2741);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan(_2663);
    bool _2765 = _2761 || _2763;
    float _2767 = _657 * _1285;
    float _2769 = fma(_655, _1287, _2767);
    float _2771 = fma(_659, _1289, _2769);
    float _2773 = _2769;
    float _2775 = _2747;
    float _2777 = _2755;
    float _2779 = _2747;
    float _2781 = _2745;
    float _2783 = _2743;
    if (!_2765)
    {
        _1345 = _2743;
    }
    float _2785 = _1345;
    float _2787 = _2785;
    float _2789 = _2785;
    if (!_2765)
    {
        _2773 = _2745;
    }
    float _2791 = _2773;
    float _2793 = _2791;
    float _2795 = _2791;
    if (!_2765)
    {
        _1347 = _645;
    }
    float _2797 = _1347;
    float _2799 = _2797;
    float _2801 = _2797;
    if (!_2765)
    {
        _2681 = _647;
    }
    float _2803 = _2681;
    float _2805 = _2803;
    float _2807 = _2803;
    if (!_2765)
    {
        _2683 = _649;
    }
    float _2809 = _2683;
    bool _2811 = !_2765;
    float _2813 = _2809;
    float _2815 = _2809;
    if (!_2811)
    {
        bool _2817 = _2747 > _2663;
        if (_2817)
        {
            _2775 = _2663;
        }
        float _2819 = _2775;
        _2779 = _2819;
        if (!_2817)
        {
            _2799 = _2749;
        }
        float _2821 = _2799;
        float _2823 = _2821;
        if (!_2817)
        {
            _2805 = _2751;
        }
        float _2825 = _2805;
        float _2827 = _2825;
        if (!_2817)
        {
            _2813 = _2753;
        }
        float _2829 = _2813;
        float _2831 = _2829;
        if (!_2817)
        {
            _2685 = _2741;
        }
        float _2833 = _2685;
        float _2835 = _2833;
        if (!_2817)
        {
            _2787 = _2743;
        }
        float _2837 = _2787;
        float _2839 = _2837;
        if (!_2817)
        {
            _2793 = _2745;
        }
        float _2841 = _2793;
        float _2843 = _2841;
        if (_2817)
        {
            _2823 = _2749;
        }
        float _2845 = _2823;
        _2801 = _2845;
        if (_2817)
        {
            _2827 = _2751;
        }
        float _2847 = _2827;
        _2807 = _2847;
        if (_2817)
        {
            _2831 = _2753;
        }
        float _2849 = _2831;
        _2815 = _2849;
        if (_2817)
        {
            _2835 = _2741;
        }
        float _2851 = _2835;
        _2687 = _2851;
        if (_2817)
        {
            _2839 = _645;
        }
        float _2853 = _2839;
        _2789 = _2853;
        if (_2817)
        {
            _2843 = _647;
        }
        float _2855 = _2843;
        _2795 = _2855;
        if (_2817)
        {
            _2777 = _649;
        }
    }
    float _2857 = _2687;
    float _2859 = _2789;
    float _2861 = _2777;
    float _2863 = _2779;
    float _2865 = _2801;
    float _2867 = _2807;
    float _2869 = _2815;
    float _2871 = _2795;
    bool _2873 = _2857 >= _2771;
    bool _2875 = isnan(_2857);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(_2771);
    bool _2881 = _2877 || _2879;
    float _2883 = _2871;
    float _2885 = _2871;
    if (!_2881)
    {
        _2781 = _2859;
    }
    float _2887 = _2781;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2881)
    {
        _2783 = _2861;
    }
    float _2893 = _2783;
    float _2895 = 0.0;
    float _2897 = _2893;
    float _2899 = _2893;
    if (!_2881)
    {
        _2895 = _655;
    }
    float _2901 = _2895;
    float _2903 = 0.0;
    float _2905 = _2901;
    float _2907 = _2901;
    if (!_2881)
    {
        _2903 = _657;
    }
    float _2909 = _2903;
    float _2911 = 0.0;
    float _2913 = _2909;
    float _2915 = _2909;
    if (!_2881)
    {
        _2911 = _659;
    }
    float _2917 = _2911;
    bool _2919 = !_2881;
    float _2921 = _2917;
    float _2923 = _2917;
    if (!_2919)
    {
        bool _2925 = _2863 > _2771;
        if (!_2925)
        {
            _2905 = _2865;
        }
        float _2927 = _2905;
        float _2929 = _2927;
        if (!_2925)
        {
            _2913 = _2867;
        }
        float _2931 = _2913;
        float _2933 = _2931;
        if (!_2925)
        {
            _2921 = _2869;
        }
        float _2935 = _2921;
        float _2937 = _2935;
        if (!_2925)
        {
            _2889 = _2859;
        }
        float _2939 = _2889;
        float _2941 = _2939;
        if (!_2925)
        {
            _2897 = _2861;
        }
        float _2943 = _2897;
        _2899 = _2943;
        if (_2925)
        {
            _2929 = _2865;
        }
        float _2945 = _2929;
        _2907 = _2945;
        if (_2925)
        {
            _2933 = _2867;
        }
        float _2947 = _2933;
        _2915 = _2947;
        if (_2925)
        {
            _2937 = _2869;
        }
        float _2949 = _2937;
        _2923 = _2949;
        if (_2925)
        {
            _2941 = _655;
        }
        float _2951 = _2941;
        _2891 = _2951;
        if (_2925)
        {
            _2883 = _657;
        }
        float _2953 = _2883;
        _2885 = _2953;
        if (_2925)
        {
            _2899 = _659;
        }
    }
    float _2955 = _2885;
    float _2957 = _2915;
    float _2959 = _2891;
    float _2961 = _2907;
    float _2963 = _2899;
    float _2965 = _2923;
    float _2967 = -_2955;
    float _2969 = _2957 + _2967;
    float _2971 = -_2959;
    float _2973 = _2961 + _2971;
    float _2975 = -_2963;
    float _2977 = _2965 + _2975;
    float _2979 = -_2955;
    float _2981 = _347 + _2979;
    float _2983 = _2969 * _2969;
    float _2985 = _2969 * _2981;
    float _2987 = fma(_2973, _2973, _2983);
    float _2989 = -_2959;
    float _2991 = _345 + _2989;
    float _2993 = -_2963;
    float _2995 = _349 + _2993;
    float _2997 = fma(_2977, _2977, _2987);
    float _2999 = fma(_2973, _2991, _2985);
    float _3001 = fma(_2977, _2995, _2999);
    float _3003 = 1.0 / _2997;
    float _3005 = _3003 * 3.0;
    float _3007 = _3005 * _3001;
    float _3009 = rint(_3007);
    float _3011 = precise::max(0.0, _3009);
    float _3013 = precise::min(_3011, 3.0);
    float _3015 = trunc(_3013);
    int _3018 = int(_3015);
    bool _3020 = _3018 >= 2;
    bool _3022 = !_3020;
    float _3024 = _2973;
    float _3026 = _2969;
    float _3028 = _2977;
    float _3030 = _2959;
    float _3032 = _2961;
    float _3034 = _2955;
    float _3036 = _2957;
    float _3038 = _2963;
    float _3040 = _2965;
    float _3050;
    float _3052;
    float _3054;
    float _3056;
    float _3058;
    float _3060;
    float _3062;
    float _3064;
    float _3066;
    float _3068;
    float _3070;
    float _3072;
    float _3074;
    float _3076;
    float _3078;
    float _3080;
    if (!_3022)
    {
        bool _3042 = _3018 >= 3;
        bool _3044 = !_3042;
        if (!_3044)
        {
            bool _3046 = _3018 != 3;
            _3048 = _3046;
            if (!_3048)
            {
                _3050 = _345;
                _3052 = _347;
                _3054 = _349;
                _3056 = 1.0;
                _3058 = 0.0;
                _3060 = 0.0;
                _3062 = 0.0;
                _3064 = 0.0;
                _3066 = 0.0;
                _3068 = 0.0;
                _3070 = 0.0;
                _3072 = 0.0;
                _3074 = 0.0;
                _3076 = 0.0;
                _3078 = 0.0;
                _3080 = 0.0;
                _3082 = true;
            }
        }
        else
        {
            _3050 = 0.0;
            _3052 = 0.0;
            _3054 = 0.0;
            _3056 = 0.0;
            _3058 = 0.0;
            _3060 = 0.0;
            _3062 = 0.0;
            _3064 = 0.0;
            _3066 = _345;
            _3068 = _347;
            _3070 = _349;
            _3072 = 1.0;
            _3074 = 0.0;
            _3076 = 0.0;
            _3078 = 0.0;
            _3080 = 0.0;
            _3082 = true;
        }
    }
    if ((!_3082) || _3048)
    {
        bool _3084;
        if (!_3048)
        {
            _3084 = _3018 >= 1;
        }
        if ((!_3084) || _3048)
        {
            bool _3086;
            if (!_3048)
            {
                _3086 = _3018 != 0;
            }
            if ((!_3086) && (!_3048))
            {
                _3050 = 0.0;
                _3052 = 0.0;
                _3054 = 0.0;
                _3056 = 0.0;
                _3058 = _345;
                _3060 = _347;
                _3062 = _349;
                _3064 = 1.0;
                _3066 = 0.0;
                _3068 = 0.0;
                _3070 = 0.0;
                _3072 = 0.0;
                _3074 = 0.0;
                _3076 = 0.0;
                _3078 = 0.0;
                _3080 = 0.0;
                _3082 = true;
            }
            else
            {
                _3048 = false;
                _3050 = 0.0;
                _3052 = 0.0;
                _3054 = 0.0;
                _3056 = 0.0;
                _3058 = 0.0;
                _3060 = 0.0;
                _3062 = 0.0;
                _3064 = 0.0;
                _3066 = 0.0;
                _3068 = 0.0;
                _3070 = 0.0;
                _3072 = 0.0;
                _3074 = 0.0;
                _3076 = 0.0;
                _3078 = 0.0;
                _3080 = 0.0;
                _3082 = true;
            }
        }
        else
        {
            _3050 = 0.0;
            _3052 = 0.0;
            _3054 = 0.0;
            _3056 = 0.0;
            _3058 = 0.0;
            _3060 = 0.0;
            _3062 = 0.0;
            _3064 = 0.0;
            _3066 = 0.0;
            _3068 = 0.0;
            _3070 = 0.0;
            _3072 = 0.0;
            _3074 = _345;
            _3076 = _347;
            _3078 = _349;
            _3080 = 1.0;
        }
    }
    _3082 = false;
    float _3088 = _3050;
    float _3090 = _3052;
    float _3092 = _3054;
    float _3094 = _3056;
    float _3096 = _3058;
    float _3098 = _3060;
    float _3100 = _3062;
    float _3102 = _3064;
    float _3104 = _3066;
    float _3106 = _3068;
    float _3108 = _3070;
    float _3110 = _3072;
    float _3112 = _3074;
    float _3114 = _3076;
    float _3116 = _3078;
    float _3118 = _3080;
    float _3120 = -_2955;
    float _3122 = _357 + _3120;
    float _3124 = -_2959;
    float _3126 = _355 + _3124;
    float _3128 = _2969 * _3122;
    float _3130 = -_2963;
    float _3132 = _359 + _3130;
    float _3134 = fma(_2973, _3126, _3128);
    float _3136 = fma(_2977, _3132, _3134);
    float _3138 = _3005 * _3136;
    float _3140 = rint(_3138);
    float _3142 = precise::max(0.0, _3140);
    float _3144 = precise::min(_3142, 3.0);
    float _3146 = trunc(_3144);
    int _3148 = int(_3146);
    bool _3150 = _3148 >= 2;
    bool _3152 = !_3150;
    float _3154 = as_type<float>(_3148);
    float _3156 = _3140;
    float _3158 = _3134;
    float _3160 = _3128;
    float _3162 = _3088;
    float _3164 = _3090;
    float _3166 = _3092;
    float _3168 = _3094;
    float _3170 = _3104;
    float _3172 = _3106;
    float _3174 = _3108;
    float _3176 = _3110;
    float _3178 = _3112;
    float _3180 = _3114;
    float _3182 = _3116;
    float _3184 = _3118;
    float _3202;
    float _3204;
    float _3206;
    float _3208;
    if (!_3152)
    {
        bool _3186 = _3148 >= 3;
        bool _3188 = !_3186;
        if (!_3188)
        {
            bool _3190 = _3148 != 3;
            _3192 = _3190;
            if (!_3192)
            {
                float _3194 = _355 + _3088;
                float _3196 = _357 + _3090;
                float _3198 = _359 + _3092;
                float _3200 = _3094 + 1.0;
                _3162 = _3194;
                _3164 = _3196;
                _3166 = _3198;
                _3168 = _3200;
                _3202 = _3096;
                _3204 = _3098;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = true;
            }
        }
        else
        {
            float _3212 = _355 + _3104;
            float _3214 = _357 + _3106;
            float _3216 = _359 + _3108;
            float _3218 = _3110 + 1.0;
            _3202 = _3096;
            _3204 = _3098;
            _3206 = _3100;
            _3208 = _3102;
            _3170 = _3212;
            _3172 = _3214;
            _3174 = _3216;
            _3176 = _3218;
            _3210 = true;
        }
    }
    if ((!_3210) || _3192)
    {
        bool _3220;
        if (!_3192)
        {
            _3220 = _3148 >= 1;
        }
        if ((!_3220) || _3192)
        {
            if (!_3192)
            {
                bool _3222 = _3148 != 0;
                if (!_3222)
                {
                    float _3224 = _355 + _3096;
                    _3154 = _3224;
                }
                float _3226 = _3154;
                _3202 = _3226;
                if (!_3222)
                {
                    float _3228 = _357 + _3098;
                    _3156 = _3228;
                }
                float _3230 = _3156;
                _3204 = _3230;
                if (!_3222)
                {
                    float _3232 = _359 + _3100;
                    _3158 = _3232;
                }
                float _3234 = _3158;
                _3206 = _3234;
                if (!_3222)
                {
                    float _3236 = _3102 + 1.0;
                    _3160 = _3236;
                }
                float _3238 = _3160;
                bool _3240 = !_3222;
                _3208 = _3238;
                _3210 = _3240;
            }
            if ((!_3210) || _3192)
            {
                _3192 = false;
                _3202 = _3096;
                _3204 = _3098;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = true;
            }
        }
        else
        {
            float _3242 = _355 + _3112;
            float _3244 = _357 + _3114;
            float _3246 = _359 + _3116;
            float _3248 = _3118 + 1.0;
            _3202 = _3096;
            _3204 = _3098;
            _3206 = _3100;
            _3208 = _3102;
            _3178 = _3242;
            _3180 = _3244;
            _3182 = _3246;
            _3184 = _3248;
        }
    }
    _3210 = false;
    float _3250 = _3162;
    float _3252 = _3164;
    float _3254 = _3166;
    float _3256 = _3168;
    float _3258 = _3202;
    float _3260 = _3204;
    float _3262 = _3206;
    float _3264 = _3208;
    float _3266 = _3170;
    float _3268 = _3172;
    float _3270 = _3174;
    float _3272 = _3176;
    float _3274 = _3178;
    float _3276 = _3180;
    float _3278 = _3182;
    float _3280 = _3184;
    float _3282 = -_2955;
    float _3284 = _367 + _3282;
    float _3286 = -_2959;
    float _3288 = _365 + _3286;
    float _3290 = _2969 * _3284;
    float _3292 = -_2963;
    float _3294 = _369 + _3292;
    float _3296 = fma(_2973, _3288, _3290);
    float _3298 = fma(_2977, _3294, _3296);
    float _3300 = _3005 * _3298;
    float _3302 = rint(_3300);
    float _3304 = precise::max(0.0, _3302);
    float _3306 = precise::min(_3304, 3.0);
    float _3308 = trunc(_3306);
    int _3310 = int(_3308);
    bool _3312 = _3310 >= 2;
    bool _3314 = !_3312;
    float _3316 = _3302;
    float _3318 = as_type<float>(_3310);
    float _3320 = _3290;
    float _3322 = _3296;
    float _3324 = _3250;
    float _3326 = _3252;
    float _3328 = _3254;
    float _3330 = _3256;
    float _3332 = _3266;
    float _3334 = _3268;
    float _3336 = _3270;
    float _3338 = _3272;
    float _3340 = _3274;
    float _3342 = _3276;
    float _3344 = _3278;
    float _3346 = _3280;
    float _3364;
    float _3366;
    float _3368;
    float _3370;
    if (!_3314)
    {
        bool _3348 = _3310 >= 3;
        bool _3350 = !_3348;
        if (!_3350)
        {
            bool _3352 = _3310 != 3;
            _3354 = _3352;
            if (!_3354)
            {
                float _3356 = _365 + _3250;
                float _3358 = _367 + _3252;
                float _3360 = _369 + _3254;
                float _3362 = _3256 + 1.0;
                _3324 = _3356;
                _3326 = _3358;
                _3328 = _3360;
                _3330 = _3362;
                _3364 = _3258;
                _3366 = _3260;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = true;
            }
        }
        else
        {
            float _3374 = _365 + _3266;
            float _3376 = _367 + _3268;
            float _3378 = _369 + _3270;
            float _3380 = _3272 + 1.0;
            _3364 = _3258;
            _3366 = _3260;
            _3368 = _3262;
            _3370 = _3264;
            _3332 = _3374;
            _3334 = _3376;
            _3336 = _3378;
            _3338 = _3380;
            _3372 = true;
        }
    }
    if ((!_3372) || _3354)
    {
        bool _3382;
        if (!_3354)
        {
            _3382 = _3310 >= 1;
        }
        if ((!_3382) || _3354)
        {
            if (!_3354)
            {
                bool _3384 = _3310 != 0;
                if (!_3384)
                {
                    float _3386 = _365 + _3258;
                    _3316 = _3386;
                }
                float _3388 = _3316;
                _3364 = _3388;
                if (!_3384)
                {
                    float _3390 = _367 + _3260;
                    _3318 = _3390;
                }
                float _3392 = _3318;
                _3366 = _3392;
                if (!_3384)
                {
                    float _3394 = _369 + _3262;
                    _3320 = _3394;
                }
                float _3396 = _3320;
                _3368 = _3396;
                if (!_3384)
                {
                    float _3398 = _3264 + 1.0;
                    _3322 = _3398;
                }
                float _3400 = _3322;
                bool _3402 = !_3384;
                _3370 = _3400;
                _3372 = _3402;
            }
            if ((!_3372) || _3354)
            {
                _3354 = false;
                _3364 = _3258;
                _3366 = _3260;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = true;
            }
        }
        else
        {
            float _3404 = _365 + _3274;
            float _3406 = _367 + _3276;
            float _3408 = _369 + _3278;
            float _3410 = _3280 + 1.0;
            _3364 = _3258;
            _3366 = _3260;
            _3368 = _3262;
            _3370 = _3264;
            _3340 = _3404;
            _3342 = _3406;
            _3344 = _3408;
            _3346 = _3410;
        }
    }
    _3372 = false;
    float _3412 = _3324;
    float _3414 = _3326;
    float _3416 = _3328;
    float _3418 = _3330;
    float _3420 = _3364;
    float _3422 = _3366;
    float _3424 = _3368;
    float _3426 = _3370;
    float _3428 = _3332;
    float _3430 = _3334;
    float _3432 = _3336;
    float _3434 = _3338;
    float _3436 = _3340;
    float _3438 = _3342;
    float _3440 = _3344;
    float _3442 = _3346;
    float _3444 = -_2955;
    float _3446 = _407 + _3444;
    float _3448 = -_2959;
    float _3450 = _405 + _3448;
    float _3452 = _2969 * _3446;
    float _3454 = -_2963;
    float _3456 = _409 + _3454;
    float _3458 = fma(_2973, _3450, _3452);
    float _3460 = fma(_2977, _3456, _3458);
    float _3462 = _3005 * _3460;
    float _3464 = rint(_3462);
    float _3466 = precise::max(0.0, _3464);
    float _3468 = precise::min(_3466, 3.0);
    float _3470 = trunc(_3468);
    int _3472 = int(_3470);
    bool _3474 = _3472 >= 2;
    bool _3476 = !_3474;
    float _3478 = as_type<float>(_3472);
    float _3480 = _3464;
    float _3482 = _3458;
    float _3484 = _3452;
    float _3486 = _3412;
    float _3488 = _3414;
    float _3490 = _3416;
    float _3492 = _3418;
    float _3494 = _3428;
    float _3496 = _3430;
    float _3498 = _3432;
    float _3500 = _3434;
    float _3502 = _3436;
    float _3504 = _3438;
    float _3506 = _3440;
    float _3508 = _3442;
    float _3526;
    float _3528;
    float _3530;
    float _3532;
    if (!_3476)
    {
        bool _3510 = _3472 >= 3;
        bool _3512 = !_3510;
        if (!_3512)
        {
            bool _3514 = _3472 != 3;
            _3516 = _3514;
            if (!_3516)
            {
                float _3518 = _405 + _3412;
                float _3520 = _407 + _3414;
                float _3522 = _409 + _3416;
                float _3524 = _3418 + 1.0;
                _3486 = _3518;
                _3488 = _3520;
                _3490 = _3522;
                _3492 = _3524;
                _3526 = _3420;
                _3528 = _3422;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = true;
            }
        }
        else
        {
            float _3536 = _405 + _3428;
            float _3538 = _407 + _3430;
            float _3540 = _409 + _3432;
            float _3542 = _3434 + 1.0;
            _3526 = _3420;
            _3528 = _3422;
            _3530 = _3424;
            _3532 = _3426;
            _3494 = _3536;
            _3496 = _3538;
            _3498 = _3540;
            _3500 = _3542;
            _3534 = true;
        }
    }
    if ((!_3534) || _3516)
    {
        bool _3544;
        if (!_3516)
        {
            _3544 = _3472 >= 1;
        }
        if ((!_3544) || _3516)
        {
            if (!_3516)
            {
                bool _3546 = _3472 != 0;
                if (!_3546)
                {
                    float _3548 = _405 + _3420;
                    _3478 = _3548;
                }
                float _3550 = _3478;
                _3526 = _3550;
                if (!_3546)
                {
                    float _3552 = _407 + _3422;
                    _3480 = _3552;
                }
                float _3554 = _3480;
                _3528 = _3554;
                if (!_3546)
                {
                    float _3556 = _409 + _3424;
                    _3482 = _3556;
                }
                float _3558 = _3482;
                _3530 = _3558;
                if (!_3546)
                {
                    float _3560 = _3426 + 1.0;
                    _3484 = _3560;
                }
                float _3562 = _3484;
                bool _3564 = !_3546;
                _3532 = _3562;
                _3534 = _3564;
            }
            if ((!_3534) || _3516)
            {
                _3516 = false;
                _3526 = _3420;
                _3528 = _3422;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = true;
            }
        }
        else
        {
            float _3566 = _405 + _3436;
            float _3568 = _407 + _3438;
            float _3570 = _409 + _3440;
            float _3572 = _3442 + 1.0;
            _3526 = _3420;
            _3528 = _3422;
            _3530 = _3424;
            _3532 = _3426;
            _3502 = _3566;
            _3504 = _3568;
            _3506 = _3570;
            _3508 = _3572;
        }
    }
    _3534 = false;
    float _3574 = _3486;
    float _3576 = _3488;
    float _3578 = _3490;
    float _3580 = _3492;
    float _3582 = _3526;
    float _3584 = _3528;
    float _3586 = _3530;
    float _3588 = _3532;
    float _3590 = _3494;
    float _3592 = _3496;
    float _3594 = _3498;
    float _3596 = _3500;
    float _3598 = _3502;
    float _3600 = _3504;
    float _3602 = _3506;
    float _3604 = _3508;
    float _3606 = -_2955;
    float _3608 = _417 + _3606;
    float _3610 = -_2959;
    float _3612 = _415 + _3610;
    float _3614 = _2969 * _3608;
    float _3616 = -_2963;
    float _3618 = _419 + _3616;
    float _3620 = fma(_2973, _3612, _3614);
    float _3622 = fma(_2977, _3618, _3620);
    float _3624 = _3005 * _3622;
    float _3626 = rint(_3624);
    float _3628 = precise::max(0.0, _3626);
    float _3630 = precise::min(_3628, 3.0);
    float _3632 = trunc(_3630);
    int _3634 = int(_3632);
    bool _3636 = _3634 >= 2;
    bool _3638 = !_3636;
    float _3640 = _3626;
    float _3642 = as_type<float>(_3634);
    float _3644 = _3614;
    float _3646 = _3620;
    float _3648 = _3574;
    float _3650 = _3576;
    float _3652 = _3578;
    float _3654 = _3580;
    float _3656 = _3590;
    float _3658 = _3592;
    float _3660 = _3594;
    float _3662 = _3596;
    float _3664 = _3598;
    float _3666 = _3600;
    float _3668 = _3602;
    float _3670 = _3604;
    float _3688;
    float _3690;
    float _3692;
    float _3694;
    if (!_3638)
    {
        bool _3672 = _3634 >= 3;
        bool _3674 = !_3672;
        if (!_3674)
        {
            bool _3676 = _3634 != 3;
            _3678 = _3676;
            if (!_3678)
            {
                float _3680 = _415 + _3574;
                float _3682 = _417 + _3576;
                float _3684 = _419 + _3578;
                float _3686 = _3580 + 1.0;
                _3648 = _3680;
                _3650 = _3682;
                _3652 = _3684;
                _3654 = _3686;
                _3688 = _3582;
                _3690 = _3584;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = true;
            }
        }
        else
        {
            float _3698 = _415 + _3590;
            float _3700 = _417 + _3592;
            float _3702 = _419 + _3594;
            float _3704 = _3596 + 1.0;
            _3688 = _3582;
            _3690 = _3584;
            _3692 = _3586;
            _3694 = _3588;
            _3656 = _3698;
            _3658 = _3700;
            _3660 = _3702;
            _3662 = _3704;
            _3696 = true;
        }
    }
    if ((!_3696) || _3678)
    {
        bool _3706;
        if (!_3678)
        {
            _3706 = _3634 >= 1;
        }
        if ((!_3706) || _3678)
        {
            if (!_3678)
            {
                bool _3708 = _3634 != 0;
                if (!_3708)
                {
                    float _3710 = _415 + _3582;
                    _3640 = _3710;
                }
                float _3712 = _3640;
                _3688 = _3712;
                if (!_3708)
                {
                    float _3714 = _417 + _3584;
                    _3642 = _3714;
                }
                float _3716 = _3642;
                _3690 = _3716;
                if (!_3708)
                {
                    float _3718 = _419 + _3586;
                    _3644 = _3718;
                }
                float _3720 = _3644;
                _3692 = _3720;
                if (!_3708)
                {
                    float _3722 = _3588 + 1.0;
                    _3646 = _3722;
                }
                float _3724 = _3646;
                bool _3726 = !_3708;
                _3694 = _3724;
                _3696 = _3726;
            }
            if ((!_3696) || _3678)
            {
                _3678 = false;
                _3688 = _3582;
                _3690 = _3584;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = true;
            }
        }
        else
        {
            float _3728 = _415 + _3598;
            float _3730 = _417 + _3600;
            float _3732 = _419 + _3602;
            float _3734 = _3604 + 1.0;
            _3688 = _3582;
            _3690 = _3584;
            _3692 = _3586;
            _3694 = _3588;
            _3664 = _3728;
            _3666 = _3730;
            _3668 = _3732;
            _3670 = _3734;
        }
    }
    _3696 = false;
    float _3736 = _3648;
    float _3738 = _3650;
    float _3740 = _3652;
    float _3742 = _3654;
    float _3744 = _3688;
    float _3746 = _3690;
    float _3748 = _3692;
    float _3750 = _3694;
    float _3752 = _3656;
    float _3754 = _3658;
    float _3756 = _3660;
    float _3758 = _3662;
    float _3760 = _3664;
    float _3762 = _3666;
    float _3764 = _3668;
    float _3766 = _3670;
    float _3768 = -_2955;
    float _3770 = _469 + _3768;
    float _3772 = -_2959;
    float _3774 = _467 + _3772;
    float _3776 = _2969 * _3770;
    float _3778 = -_2963;
    float _3780 = _471 + _3778;
    float _3782 = fma(_2973, _3774, _3776);
    float _3784 = fma(_2977, _3780, _3782);
    float _3786 = _3005 * _3784;
    float _3788 = rint(_3786);
    float _3790 = precise::max(0.0, _3788);
    float _3792 = precise::min(_3790, 3.0);
    float _3794 = trunc(_3792);
    int _3796 = int(_3794);
    bool _3798 = _3796 >= 2;
    bool _3800 = !_3798;
    float _3802 = as_type<float>(_3796);
    float _3804 = _3788;
    float _3806 = _3782;
    float _3808 = _3776;
    float _3810 = _3736;
    float _3812 = _3738;
    float _3814 = _3740;
    float _3816 = _3742;
    float _3818 = _3752;
    float _3820 = _3754;
    float _3822 = _3756;
    float _3824 = _3758;
    float _3826 = _3760;
    float _3828 = _3762;
    float _3830 = _3764;
    float _3832 = _3766;
    float _3850;
    float _3852;
    float _3854;
    float _3856;
    if (!_3800)
    {
        bool _3834 = _3796 >= 3;
        bool _3836 = !_3834;
        if (!_3836)
        {
            bool _3838 = _3796 != 3;
            _3840 = _3838;
            if (!_3840)
            {
                float _3842 = _467 + _3736;
                float _3844 = _469 + _3738;
                float _3846 = _471 + _3740;
                float _3848 = _3742 + 1.0;
                _3810 = _3842;
                _3812 = _3844;
                _3814 = _3846;
                _3816 = _3848;
                _3850 = _3744;
                _3852 = _3746;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = true;
            }
        }
        else
        {
            float _3860 = _467 + _3752;
            float _3862 = _469 + _3754;
            float _3864 = _471 + _3756;
            float _3866 = _3758 + 1.0;
            _3850 = _3744;
            _3852 = _3746;
            _3854 = _3748;
            _3856 = _3750;
            _3818 = _3860;
            _3820 = _3862;
            _3822 = _3864;
            _3824 = _3866;
            _3858 = true;
        }
    }
    if ((!_3858) || _3840)
    {
        bool _3868;
        if (!_3840)
        {
            _3868 = _3796 >= 1;
        }
        if ((!_3868) || _3840)
        {
            if (!_3840)
            {
                bool _3870 = _3796 != 0;
                if (!_3870)
                {
                    float _3872 = _467 + _3744;
                    _3802 = _3872;
                }
                float _3874 = _3802;
                _3850 = _3874;
                if (!_3870)
                {
                    float _3876 = _469 + _3746;
                    _3804 = _3876;
                }
                float _3878 = _3804;
                _3852 = _3878;
                if (!_3870)
                {
                    float _3880 = _471 + _3748;
                    _3806 = _3880;
                }
                float _3882 = _3806;
                _3854 = _3882;
                if (!_3870)
                {
                    float _3884 = _3750 + 1.0;
                    _3808 = _3884;
                }
                float _3886 = _3808;
                bool _3888 = !_3870;
                _3856 = _3886;
                _3858 = _3888;
            }
            if ((!_3858) || _3840)
            {
                _3840 = false;
                _3850 = _3744;
                _3852 = _3746;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = true;
            }
        }
        else
        {
            float _3890 = _467 + _3760;
            float _3892 = _469 + _3762;
            float _3894 = _471 + _3764;
            float _3896 = _3766 + 1.0;
            _3850 = _3744;
            _3852 = _3746;
            _3854 = _3748;
            _3856 = _3750;
            _3826 = _3890;
            _3828 = _3892;
            _3830 = _3894;
            _3832 = _3896;
        }
    }
    _3858 = false;
    float _3898 = _3810;
    float _3900 = _3812;
    float _3902 = _3814;
    float _3904 = _3816;
    float _3906 = _3850;
    float _3908 = _3852;
    float _3910 = _3854;
    float _3912 = _3856;
    float _3914 = _3818;
    float _3916 = _3820;
    float _3918 = _3822;
    float _3920 = _3824;
    float _3922 = _3826;
    float _3924 = _3828;
    float _3926 = _3830;
    float _3928 = _3832;
    float _3930 = -_2955;
    float _3932 = _495 + _3930;
    float _3934 = -_2959;
    float _3936 = _493 + _3934;
    float _3938 = _2969 * _3932;
    float _3940 = -_2963;
    float _3942 = _497 + _3940;
    float _3944 = fma(_2973, _3936, _3938);
    float _3946 = fma(_2977, _3942, _3944);
    float _3948 = _3005 * _3946;
    float _3950 = rint(_3948);
    float _3952 = precise::max(0.0, _3950);
    float _3954 = precise::min(_3952, 3.0);
    float _3956 = trunc(_3954);
    int _3958 = int(_3956);
    bool _3960 = _3958 >= 2;
    bool _3962 = !_3960;
    float _3964 = _3950;
    float _3966 = as_type<float>(_3958);
    float _3968 = _3938;
    float _3970 = _3944;
    float _3972 = _3898;
    float _3974 = _3900;
    float _3976 = _3902;
    float _3978 = _3904;
    float _3980 = _3914;
    float _3982 = _3916;
    float _3984 = _3918;
    float _3986 = _3920;
    float _3988 = _3922;
    float _3990 = _3924;
    float _3992 = _3926;
    float _3994 = _3928;
    float _4012;
    float _4014;
    float _4016;
    float _4018;
    if (!_3962)
    {
        bool _3996 = _3958 >= 3;
        bool _3998 = !_3996;
        if (!_3998)
        {
            bool _4000 = _3958 != 3;
            _4002 = _4000;
            if (!_4002)
            {
                float _4004 = _493 + _3898;
                float _4006 = _495 + _3900;
                float _4008 = _497 + _3902;
                float _4010 = _3904 + 1.0;
                _3972 = _4004;
                _3974 = _4006;
                _3976 = _4008;
                _3978 = _4010;
                _4012 = _3906;
                _4014 = _3908;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = true;
            }
        }
        else
        {
            float _4022 = _493 + _3914;
            float _4024 = _495 + _3916;
            float _4026 = _497 + _3918;
            float _4028 = _3920 + 1.0;
            _4012 = _3906;
            _4014 = _3908;
            _4016 = _3910;
            _4018 = _3912;
            _3980 = _4022;
            _3982 = _4024;
            _3984 = _4026;
            _3986 = _4028;
            _4020 = true;
        }
    }
    if ((!_4020) || _4002)
    {
        bool _4030;
        if (!_4002)
        {
            _4030 = _3958 >= 1;
        }
        if ((!_4030) || _4002)
        {
            if (!_4002)
            {
                bool _4032 = _3958 != 0;
                if (!_4032)
                {
                    float _4034 = _493 + _3906;
                    _3964 = _4034;
                }
                float _4036 = _3964;
                _4012 = _4036;
                if (!_4032)
                {
                    float _4038 = _495 + _3908;
                    _3966 = _4038;
                }
                float _4040 = _3966;
                _4014 = _4040;
                if (!_4032)
                {
                    float _4042 = _497 + _3910;
                    _3968 = _4042;
                }
                float _4044 = _3968;
                _4016 = _4044;
                if (!_4032)
                {
                    float _4046 = _3912 + 1.0;
                    _3970 = _4046;
                }
                float _4048 = _3970;
                bool _4050 = !_4032;
                _4018 = _4048;
                _4020 = _4050;
            }
            if ((!_4020) || _4002)
            {
                _4002 = false;
                _4012 = _3906;
                _4014 = _3908;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = true;
            }
        }
        else
        {
            float _4052 = _493 + _3922;
            float _4054 = _495 + _3924;
            float _4056 = _497 + _3926;
            float _4058 = _3928 + 1.0;
            _4012 = _3906;
            _4014 = _3908;
            _4016 = _3910;
            _4018 = _3912;
            _3988 = _4052;
            _3990 = _4054;
            _3992 = _4056;
            _3994 = _4058;
        }
    }
    _4020 = false;
    float _4060 = _3972;
    float _4062 = _3974;
    float _4064 = _3976;
    float _4066 = _3978;
    float _4068 = _4012;
    float _4070 = _4014;
    float _4072 = _4016;
    float _4074 = _4018;
    float _4076 = _3980;
    float _4078 = _3982;
    float _4080 = _3984;
    float _4082 = _3986;
    float _4084 = _3988;
    float _4086 = _3990;
    float _4088 = _3992;
    float _4090 = _3994;
    float _4092 = -_2955;
    float _4094 = _521 + _4092;
    float _4096 = -_2959;
    float _4098 = _519 + _4096;
    float _4100 = _2969 * _4094;
    float _4102 = -_2963;
    float _4104 = _523 + _4102;
    float _4106 = fma(_2973, _4098, _4100);
    float _4108 = fma(_2977, _4104, _4106);
    float _4110 = _3005 * _4108;
    float _4112 = rint(_4110);
    float _4114 = precise::max(0.0, _4112);
    float _4116 = precise::min(_4114, 3.0);
    float _4118 = trunc(_4116);
    int _4120 = int(_4118);
    bool _4122 = _4120 >= 2;
    bool _4124 = !_4122;
    float _4126 = _4100;
    float _4128 = _4106;
    float _4130 = _4112;
    float _4132 = as_type<float>(_4120);
    float _4134 = _4060;
    float _4136 = _4062;
    float _4138 = _4064;
    float _4140 = _4066;
    float _4142 = _4076;
    float _4144 = _4078;
    float _4146 = _4080;
    float _4148 = _4082;
    float _4150 = _4084;
    float _4152 = _4086;
    float _4154 = _4088;
    float _4156 = _4090;
    float _4174;
    float _4176;
    float _4178;
    float _4180;
    if (!_4124)
    {
        bool _4158 = _4120 >= 3;
        bool _4160 = !_4158;
        if (!_4160)
        {
            bool _4162 = _4120 != 3;
            _4164 = _4162;
            if (!_4164)
            {
                float _4166 = _519 + _4060;
                float _4168 = _521 + _4062;
                float _4170 = _523 + _4064;
                float _4172 = _4066 + 1.0;
                _4134 = _4166;
                _4136 = _4168;
                _4138 = _4170;
                _4140 = _4172;
                _4174 = _4068;
                _4176 = _4070;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = true;
            }
        }
        else
        {
            float _4184 = _519 + _4076;
            float _4186 = _521 + _4078;
            float _4188 = _523 + _4080;
            float _4190 = _4082 + 1.0;
            _4174 = _4068;
            _4176 = _4070;
            _4178 = _4072;
            _4180 = _4074;
            _4142 = _4184;
            _4144 = _4186;
            _4146 = _4188;
            _4148 = _4190;
            _4182 = true;
        }
    }
    if ((!_4182) || _4164)
    {
        bool _4192;
        if (!_4164)
        {
            _4192 = _4120 >= 1;
        }
        if ((!_4192) || _4164)
        {
            if (!_4164)
            {
                bool _4194 = _4120 != 0;
                if (!_4194)
                {
                    float _4196 = _519 + _4068;
                    _4126 = _4196;
                }
                float _4198 = _4126;
                _4174 = _4198;
                if (!_4194)
                {
                    float _4200 = _521 + _4070;
                    _4128 = _4200;
                }
                float _4202 = _4128;
                _4176 = _4202;
                if (!_4194)
                {
                    float _4204 = _523 + _4072;
                    _4130 = _4204;
                }
                float _4206 = _4130;
                _4178 = _4206;
                if (!_4194)
                {
                    float _4208 = _4074 + 1.0;
                    _4132 = _4208;
                }
                float _4210 = _4132;
                bool _4212 = !_4194;
                _4180 = _4210;
                _4182 = _4212;
            }
            if ((!_4182) || _4164)
            {
                _4164 = false;
                _4174 = _4068;
                _4176 = _4070;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = true;
            }
        }
        else
        {
            float _4214 = _519 + _4084;
            float _4216 = _521 + _4086;
            float _4218 = _523 + _4088;
            float _4220 = _4090 + 1.0;
            _4174 = _4068;
            _4176 = _4070;
            _4178 = _4072;
            _4180 = _4074;
            _4150 = _4214;
            _4152 = _4216;
            _4154 = _4218;
            _4156 = _4220;
        }
    }
    _4182 = false;
    float _4222 = _4134;
    float _4224 = _4136;
    float _4226 = _4138;
    float _4228 = _4140;
    float _4230 = _4174;
    float _4232 = _4176;
    float _4234 = _4178;
    float _4236 = _4180;
    float _4238 = _4142;
    float _4240 = _4144;
    float _4242 = _4146;
    float _4244 = _4148;
    float _4246 = _4150;
    float _4248 = _4152;
    float _4250 = _4154;
    float _4252 = _4156;
    float _4254 = -_2955;
    float _4256 = _531 + _4254;
    float _4258 = -_2959;
    float _4260 = _529 + _4258;
    float _4262 = _2969 * _4256;
    float _4264 = -_2963;
    float _4266 = _533 + _4264;
    float _4268 = fma(_2973, _4260, _4262);
    float _4270 = fma(_2977, _4266, _4268);
    float _4272 = _3005 * _4270;
    float _4274 = rint(_4272);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = precise::min(_4276, 3.0);
    float _4280 = trunc(_4278);
    int _4282 = int(_4280);
    bool _4284 = _4282 >= 2;
    bool _4286 = !_4284;
    float _4288 = _4274;
    float _4290 = as_type<float>(_4282);
    float _4292 = _4262;
    float _4294 = _4268;
    float _4296 = _4222;
    float _4298 = _4224;
    float _4300 = _4226;
    float _4302 = _4228;
    float _4304 = _4238;
    float _4306 = _4240;
    float _4308 = _4242;
    float _4310 = _4244;
    float _4312 = _4246;
    float _4314 = _4248;
    float _4316 = _4250;
    float _4318 = _4252;
    float _4336;
    float _4338;
    float _4340;
    float _4342;
    if (!_4286)
    {
        bool _4320 = _4282 >= 3;
        bool _4322 = !_4320;
        if (!_4322)
        {
            bool _4324 = _4282 != 3;
            _4326 = _4324;
            if (!_4326)
            {
                float _4328 = _529 + _4222;
                float _4330 = _531 + _4224;
                float _4332 = _533 + _4226;
                float _4334 = _4228 + 1.0;
                _4296 = _4328;
                _4298 = _4330;
                _4300 = _4332;
                _4302 = _4334;
                _4336 = _4230;
                _4338 = _4232;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = true;
            }
        }
        else
        {
            float _4346 = _529 + _4238;
            float _4348 = _531 + _4240;
            float _4350 = _533 + _4242;
            float _4352 = _4244 + 1.0;
            _4336 = _4230;
            _4338 = _4232;
            _4340 = _4234;
            _4342 = _4236;
            _4304 = _4346;
            _4306 = _4348;
            _4308 = _4350;
            _4310 = _4352;
            _4344 = true;
        }
    }
    if ((!_4344) || _4326)
    {
        bool _4354;
        if (!_4326)
        {
            _4354 = _4282 >= 1;
        }
        if ((!_4354) || _4326)
        {
            if (!_4326)
            {
                bool _4356 = _4282 != 0;
                if (!_4356)
                {
                    float _4358 = _529 + _4230;
                    _4288 = _4358;
                }
                float _4360 = _4288;
                _4336 = _4360;
                if (!_4356)
                {
                    float _4362 = _531 + _4232;
                    _4290 = _4362;
                }
                float _4364 = _4290;
                _4338 = _4364;
                if (!_4356)
                {
                    float _4366 = _533 + _4234;
                    _4292 = _4366;
                }
                float _4368 = _4292;
                _4340 = _4368;
                if (!_4356)
                {
                    float _4370 = _4236 + 1.0;
                    _4294 = _4370;
                }
                float _4372 = _4294;
                bool _4374 = !_4356;
                _4342 = _4372;
                _4344 = _4374;
            }
            if ((!_4344) || _4326)
            {
                _4326 = false;
                _4336 = _4230;
                _4338 = _4232;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = true;
            }
        }
        else
        {
            float _4376 = _529 + _4246;
            float _4378 = _531 + _4248;
            float _4380 = _533 + _4250;
            float _4382 = _4252 + 1.0;
            _4336 = _4230;
            _4338 = _4232;
            _4340 = _4234;
            _4342 = _4236;
            _4312 = _4376;
            _4314 = _4378;
            _4316 = _4380;
            _4318 = _4382;
        }
    }
    _4344 = false;
    float _4384 = _4296;
    float _4386 = _4298;
    float _4388 = _4300;
    float _4390 = _4302;
    float _4392 = _4336;
    float _4394 = _4338;
    float _4396 = _4340;
    float _4398 = _4342;
    float _4400 = _4304;
    float _4402 = _4306;
    float _4404 = _4308;
    float _4406 = _4310;
    float _4408 = _4312;
    float _4410 = _4314;
    float _4412 = _4316;
    float _4414 = _4318;
    float _4416 = -_2955;
    float _4418 = _569 + _4416;
    float _4420 = -_2959;
    float _4422 = _567 + _4420;
    float _4424 = _2969 * _4418;
    float _4426 = -_2963;
    float _4428 = _571 + _4426;
    float _4430 = fma(_2973, _4422, _4424);
    float _4432 = fma(_2977, _4428, _4430);
    float _4434 = _3005 * _4432;
    float _4436 = rint(_4434);
    float _4438 = precise::max(0.0, _4436);
    float _4440 = precise::min(_4438, 3.0);
    float _4442 = trunc(_4440);
    int _4444 = int(_4442);
    bool _4446 = _4444 >= 2;
    bool _4448 = !_4446;
    float _4450 = as_type<float>(_4444);
    float _4452 = _4436;
    float _4454 = _4430;
    float _4456 = _4424;
    float _4458 = _4384;
    float _4460 = _4386;
    float _4462 = _4388;
    float _4464 = _4390;
    float _4466 = _4400;
    float _4468 = _4402;
    float _4470 = _4404;
    float _4472 = _4406;
    float _4474 = _4408;
    float _4476 = _4410;
    float _4478 = _4412;
    float _4480 = _4414;
    float _4498;
    float _4500;
    float _4502;
    float _4504;
    if (!_4448)
    {
        bool _4482 = _4444 >= 3;
        bool _4484 = !_4482;
        if (!_4484)
        {
            bool _4486 = _4444 != 3;
            _4488 = _4486;
            if (!_4488)
            {
                float _4490 = _567 + _4384;
                float _4492 = _569 + _4386;
                float _4494 = _571 + _4388;
                float _4496 = _4390 + 1.0;
                _4458 = _4490;
                _4460 = _4492;
                _4462 = _4494;
                _4464 = _4496;
                _4498 = _4392;
                _4500 = _4394;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = true;
            }
        }
        else
        {
            float _4508 = _567 + _4400;
            float _4510 = _569 + _4402;
            float _4512 = _571 + _4404;
            float _4514 = _4406 + 1.0;
            _4498 = _4392;
            _4500 = _4394;
            _4502 = _4396;
            _4504 = _4398;
            _4466 = _4508;
            _4468 = _4510;
            _4470 = _4512;
            _4472 = _4514;
            _4506 = true;
        }
    }
    if ((!_4506) || _4488)
    {
        bool _4516;
        if (!_4488)
        {
            _4516 = _4444 >= 1;
        }
        if ((!_4516) || _4488)
        {
            if (!_4488)
            {
                bool _4518 = _4444 != 0;
                if (!_4518)
                {
                    float _4520 = _567 + _4392;
                    _4450 = _4520;
                }
                float _4522 = _4450;
                _4498 = _4522;
                if (!_4518)
                {
                    float _4524 = _569 + _4394;
                    _4452 = _4524;
                }
                float _4526 = _4452;
                _4500 = _4526;
                if (!_4518)
                {
                    float _4528 = _571 + _4396;
                    _4454 = _4528;
                }
                float _4530 = _4454;
                _4502 = _4530;
                if (!_4518)
                {
                    float _4532 = _4398 + 1.0;
                    _4456 = _4532;
                }
                float _4534 = _4456;
                bool _4536 = !_4518;
                _4504 = _4534;
                _4506 = _4536;
            }
            if ((!_4506) || _4488)
            {
                _4488 = false;
                _4498 = _4392;
                _4500 = _4394;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = true;
            }
        }
        else
        {
            float _4538 = _567 + _4408;
            float _4540 = _569 + _4410;
            float _4542 = _571 + _4412;
            float _4544 = _4414 + 1.0;
            _4498 = _4392;
            _4500 = _4394;
            _4502 = _4396;
            _4504 = _4398;
            _4474 = _4538;
            _4476 = _4540;
            _4478 = _4542;
            _4480 = _4544;
        }
    }
    _4506 = false;
    float _4546 = _4458;
    float _4548 = _4460;
    float _4550 = _4462;
    float _4552 = _4464;
    float _4554 = _4498;
    float _4556 = _4500;
    float _4558 = _4502;
    float _4560 = _4504;
    float _4562 = _4466;
    float _4564 = _4468;
    float _4566 = _4470;
    float _4568 = _4472;
    float _4570 = _4474;
    float _4572 = _4476;
    float _4574 = _4478;
    float _4576 = _4480;
    float _4578 = -_2955;
    float _4580 = _581 + _4578;
    float _4582 = -_2959;
    float _4584 = _579 + _4582;
    float _4586 = _2969 * _4580;
    float _4588 = -_2963;
    float _4590 = _583 + _4588;
    float _4592 = fma(_2973, _4584, _4586);
    float _4594 = fma(_2977, _4590, _4592);
    float _4596 = _3005 * _4594;
    float _4598 = rint(_4596);
    float _4600 = precise::max(0.0, _4598);
    float _4602 = precise::min(_4600, 3.0);
    float _4604 = trunc(_4602);
    int _4606 = int(_4604);
    bool _4608 = _4606 >= 2;
    bool _4610 = !_4608;
    float _4612 = _4598;
    float _4614 = as_type<float>(_4606);
    float _4616 = _4586;
    float _4618 = _4592;
    float _4620 = _4546;
    float _4622 = _4548;
    float _4624 = _4550;
    float _4626 = _4552;
    float _4628 = _4562;
    float _4630 = _4564;
    float _4632 = _4566;
    float _4634 = _4568;
    float _4636 = _4570;
    float _4638 = _4572;
    float _4640 = _4574;
    float _4642 = _4576;
    float _4660;
    float _4662;
    float _4664;
    float _4666;
    if (!_4610)
    {
        bool _4644 = _4606 >= 3;
        bool _4646 = !_4644;
        if (!_4646)
        {
            bool _4648 = _4606 != 3;
            _4650 = _4648;
            if (!_4650)
            {
                float _4652 = _579 + _4546;
                float _4654 = _581 + _4548;
                float _4656 = _583 + _4550;
                float _4658 = _4552 + 1.0;
                _4620 = _4652;
                _4622 = _4654;
                _4624 = _4656;
                _4626 = _4658;
                _4660 = _4554;
                _4662 = _4556;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = true;
            }
        }
        else
        {
            float _4670 = _579 + _4562;
            float _4672 = _581 + _4564;
            float _4674 = _583 + _4566;
            float _4676 = _4568 + 1.0;
            _4660 = _4554;
            _4662 = _4556;
            _4664 = _4558;
            _4666 = _4560;
            _4628 = _4670;
            _4630 = _4672;
            _4632 = _4674;
            _4634 = _4676;
            _4668 = true;
        }
    }
    if ((!_4668) || _4650)
    {
        bool _4678;
        if (!_4650)
        {
            _4678 = _4606 >= 1;
        }
        if ((!_4678) || _4650)
        {
            if (!_4650)
            {
                bool _4680 = _4606 != 0;
                if (!_4680)
                {
                    float _4682 = _579 + _4554;
                    _4612 = _4682;
                }
                float _4684 = _4612;
                _4660 = _4684;
                if (!_4680)
                {
                    float _4686 = _581 + _4556;
                    _4614 = _4686;
                }
                float _4688 = _4614;
                _4662 = _4688;
                if (!_4680)
                {
                    float _4690 = _583 + _4558;
                    _4616 = _4690;
                }
                float _4692 = _4616;
                _4664 = _4692;
                if (!_4680)
                {
                    float _4694 = _4560 + 1.0;
                    _4618 = _4694;
                }
                float _4696 = _4618;
                bool _4698 = !_4680;
                _4666 = _4696;
                _4668 = _4698;
            }
            if ((!_4668) || _4650)
            {
                _4650 = false;
                _4660 = _4554;
                _4662 = _4556;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = true;
            }
        }
        else
        {
            float _4700 = _579 + _4570;
            float _4702 = _581 + _4572;
            float _4704 = _583 + _4574;
            float _4706 = _4576 + 1.0;
            _4660 = _4554;
            _4662 = _4556;
            _4664 = _4558;
            _4666 = _4560;
            _4636 = _4700;
            _4638 = _4702;
            _4640 = _4704;
            _4642 = _4706;
        }
    }
    _4668 = false;
    float _4708 = _4620;
    float _4710 = _4622;
    float _4712 = _4624;
    float _4714 = _4626;
    float _4716 = _4660;
    float _4718 = _4662;
    float _4720 = _4664;
    float _4722 = _4666;
    float _4724 = _4628;
    float _4726 = _4630;
    float _4728 = _4632;
    float _4730 = _4634;
    float _4732 = _4636;
    float _4734 = _4638;
    float _4736 = _4640;
    float _4738 = _4642;
    float _4740 = -_2955;
    float _4742 = _599 + _4740;
    float _4744 = -_2959;
    float _4746 = _597 + _4744;
    float _4748 = _2969 * _4742;
    float _4750 = -_2963;
    float _4752 = _601 + _4750;
    float _4754 = fma(_2973, _4746, _4748);
    float _4756 = fma(_2977, _4752, _4754);
    float _4758 = _3005 * _4756;
    float _4760 = rint(_4758);
    float _4762 = precise::max(0.0, _4760);
    float _4764 = precise::min(_4762, 3.0);
    float _4766 = trunc(_4764);
    int _4768 = int(_4766);
    bool _4770 = _4768 >= 2;
    bool _4772 = !_4770;
    float _4774 = as_type<float>(_4768);
    float _4776 = _4760;
    float _4778 = _4754;
    float _4780 = _4748;
    float _4782 = _4708;
    float _4784 = _4710;
    float _4786 = _4712;
    float _4788 = _4714;
    float _4790 = _4724;
    float _4792 = _4726;
    float _4794 = _4728;
    float _4796 = _4730;
    float _4798 = _4732;
    float _4800 = _4734;
    float _4802 = _4736;
    float _4804 = _4738;
    float _4822;
    float _4824;
    float _4826;
    float _4828;
    if (!_4772)
    {
        bool _4806 = _4768 >= 3;
        bool _4808 = !_4806;
        if (!_4808)
        {
            bool _4810 = _4768 != 3;
            _4812 = _4810;
            if (!_4812)
            {
                float _4814 = _597 + _4708;
                float _4816 = _599 + _4710;
                float _4818 = _601 + _4712;
                float _4820 = _4714 + 1.0;
                _4782 = _4814;
                _4784 = _4816;
                _4786 = _4818;
                _4788 = _4820;
                _4822 = _4716;
                _4824 = _4718;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = true;
            }
        }
        else
        {
            float _4832 = _597 + _4724;
            float _4834 = _599 + _4726;
            float _4836 = _601 + _4728;
            float _4838 = _4730 + 1.0;
            _4822 = _4716;
            _4824 = _4718;
            _4826 = _4720;
            _4828 = _4722;
            _4790 = _4832;
            _4792 = _4834;
            _4794 = _4836;
            _4796 = _4838;
            _4830 = true;
        }
    }
    if ((!_4830) || _4812)
    {
        bool _4840;
        if (!_4812)
        {
            _4840 = _4768 >= 1;
        }
        if ((!_4840) || _4812)
        {
            if (!_4812)
            {
                bool _4842 = _4768 != 0;
                if (!_4842)
                {
                    float _4844 = _597 + _4716;
                    _4774 = _4844;
                }
                float _4846 = _4774;
                _4822 = _4846;
                if (!_4842)
                {
                    float _4848 = _599 + _4718;
                    _4776 = _4848;
                }
                float _4850 = _4776;
                _4824 = _4850;
                if (!_4842)
                {
                    float _4852 = _601 + _4720;
                    _4778 = _4852;
                }
                float _4854 = _4778;
                _4826 = _4854;
                if (!_4842)
                {
                    float _4856 = _4722 + 1.0;
                    _4780 = _4856;
                }
                float _4858 = _4780;
                bool _4860 = !_4842;
                _4828 = _4858;
                _4830 = _4860;
            }
            if ((!_4830) || _4812)
            {
                _4812 = false;
                _4822 = _4716;
                _4824 = _4718;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = true;
            }
        }
        else
        {
            float _4862 = _597 + _4732;
            float _4864 = _599 + _4734;
            float _4866 = _601 + _4736;
            float _4868 = _4738 + 1.0;
            _4822 = _4716;
            _4824 = _4718;
            _4826 = _4720;
            _4828 = _4722;
            _4798 = _4862;
            _4800 = _4864;
            _4802 = _4866;
            _4804 = _4868;
        }
    }
    _4830 = false;
    float _4870 = _4782;
    float _4872 = _4784;
    float _4874 = _4786;
    float _4876 = _4788;
    float _4878 = _4822;
    float _4880 = _4824;
    float _4882 = _4826;
    float _4884 = _4828;
    float _4886 = _4790;
    float _4888 = _4792;
    float _4890 = _4794;
    float _4892 = _4796;
    float _4894 = _4798;
    float _4896 = _4800;
    float _4898 = _4802;
    float _4900 = _4804;
    float _4902 = -_2955;
    float _4904 = _615 + _4902;
    float _4906 = -_2959;
    float _4908 = _613 + _4906;
    float _4910 = _2969 * _4904;
    float _4912 = -_2963;
    float _4914 = _617 + _4912;
    float _4916 = fma(_2973, _4908, _4910);
    float _4918 = fma(_2977, _4914, _4916);
    float _4920 = _3005 * _4918;
    float _4922 = rint(_4920);
    float _4924 = precise::max(0.0, _4922);
    float _4926 = precise::min(_4924, 3.0);
    float _4928 = trunc(_4926);
    int _4930 = int(_4928);
    bool _4932 = _4930 >= 2;
    bool _4934 = !_4932;
    float _4936 = _4922;
    float _4938 = as_type<float>(_4930);
    float _4940 = _4910;
    float _4942 = _4916;
    float _4944 = _4870;
    float _4946 = _4872;
    float _4948 = _4874;
    float _4950 = _4876;
    float _4952 = _4886;
    float _4954 = _4888;
    float _4956 = _4890;
    float _4958 = _4892;
    float _4960 = _4894;
    float _4962 = _4896;
    float _4964 = _4898;
    float _4966 = _4900;
    float _4984;
    float _4986;
    float _4988;
    float _4990;
    if (!_4934)
    {
        bool _4968 = _4930 >= 3;
        bool _4970 = !_4968;
        if (!_4970)
        {
            bool _4972 = _4930 != 3;
            _4974 = _4972;
            if (!_4974)
            {
                float _4976 = _613 + _4870;
                float _4978 = _615 + _4872;
                float _4980 = _617 + _4874;
                float _4982 = _4876 + 1.0;
                _4944 = _4976;
                _4946 = _4978;
                _4948 = _4980;
                _4950 = _4982;
                _4984 = _4878;
                _4986 = _4880;
                _4988 = _4882;
                _4990 = _4884;
                _4992 = true;
            }
        }
        else
        {
            float _4994 = _613 + _4886;
            float _4996 = _615 + _4888;
            float _4998 = _617 + _4890;
            float _5000 = _4892 + 1.0;
            _4984 = _4878;
            _4986 = _4880;
            _4988 = _4882;
            _4990 = _4884;
            _4952 = _4994;
            _4954 = _4996;
            _4956 = _4998;
            _4958 = _5000;
            _4992 = true;
        }
    }
    if ((!_4992) || _4974)
    {
        bool _5002;
        if (!_4974)
        {
            _5002 = _4930 >= 1;
        }
        if ((!_5002) || _4974)
        {
            if (!_4974)
            {
                bool _5004 = _4930 != 0;
                if (!_5004)
                {
                    float _5006 = _613 + _4878;
                    _4936 = _5006;
                }
                float _5008 = _4936;
                _4984 = _5008;
                if (!_5004)
                {
                    float _5010 = _615 + _4880;
                    _4938 = _5010;
                }
                float _5012 = _4938;
                _4986 = _5012;
                if (!_5004)
                {
                    float _5014 = _617 + _4882;
                    _4940 = _5014;
                }
                float _5016 = _4940;
                _4988 = _5016;
                if (!_5004)
                {
                    float _5018 = _4884 + 1.0;
                    _4942 = _5018;
                }
                float _5020 = _4942;
                bool _5022 = !_5004;
                _4990 = _5020;
                _4992 = _5022;
            }
            if ((!_4992) || _4974)
            {
                _4974 = false;
                _4984 = _4878;
                _4986 = _4880;
                _4988 = _4882;
                _4990 = _4884;
                _4992 = true;
            }
        }
        else
        {
            float _5024 = _613 + _4894;
            float _5026 = _615 + _4896;
            float _5028 = _617 + _4898;
            float _5030 = _4900 + 1.0;
            _4984 = _4878;
            _4986 = _4880;
            _4988 = _4882;
            _4990 = _4884;
            _4960 = _5024;
            _4962 = _5026;
            _4964 = _5028;
            _4966 = _5030;
        }
    }
    _4992 = false;
    float _5032 = _4944;
    float _5034 = _4946;
    float _5036 = _4948;
    float _5038 = _4950;
    float _5040 = _4984;
    float _5042 = _4986;
    float _5044 = _4988;
    float _5046 = _4990;
    float _5048 = _4952;
    float _5050 = _4954;
    float _5052 = _4956;
    float _5054 = _4958;
    float _5056 = _4960;
    float _5058 = _4962;
    float _5060 = _4964;
    float _5062 = _4966;
    float _5064 = -_2955;
    float _5066 = _631 + _5064;
    float _5068 = -_2959;
    float _5070 = _629 + _5068;
    float _5072 = _2969 * _5066;
    float _5074 = -_2963;
    float _5076 = _633 + _5074;
    float _5078 = fma(_2973, _5070, _5072);
    float _5080 = fma(_2977, _5076, _5078);
    float _5082 = _3005 * _5080;
    float _5084 = rint(_5082);
    float _5086 = precise::max(0.0, _5084);
    float _5088 = precise::min(_5086, 3.0);
    float _5090 = trunc(_5088);
    int _5092 = int(_5090);
    bool _5094 = _5092 >= 2;
    bool _5096 = !_5094;
    float _5098 = as_type<float>(_5092);
    float _5100 = _5084;
    float _5102 = _5078;
    float _5104 = _5072;
    float _5106 = _5032;
    float _5108 = _5034;
    float _5110 = _5036;
    float _5112 = _5038;
    float _5114 = _5048;
    float _5116 = _5050;
    float _5118 = _5052;
    float _5120 = _5054;
    float _5122 = _5056;
    float _5124 = _5058;
    float _5126 = _5060;
    float _5128 = _5062;
    float _5146;
    float _5148;
    float _5150;
    float _5152;
    if (!_5096)
    {
        bool _5130 = _5092 >= 3;
        bool _5132 = !_5130;
        if (!_5132)
        {
            bool _5134 = _5092 != 3;
            _5136 = _5134;
            if (!_5136)
            {
                float _5138 = _629 + _5032;
                float _5140 = _631 + _5034;
                float _5142 = _633 + _5036;
                float _5144 = _5038 + 1.0;
                _5106 = _5138;
                _5108 = _5140;
                _5110 = _5142;
                _5112 = _5144;
                _5146 = _5040;
                _5148 = _5042;
                _5150 = _5044;
                _5152 = _5046;
                _5154 = true;
            }
        }
        else
        {
            float _5156 = _629 + _5048;
            float _5158 = _631 + _5050;
            float _5160 = _633 + _5052;
            float _5162 = _5054 + 1.0;
            _5146 = _5040;
            _5148 = _5042;
            _5150 = _5044;
            _5152 = _5046;
            _5114 = _5156;
            _5116 = _5158;
            _5118 = _5160;
            _5120 = _5162;
            _5154 = true;
        }
    }
    if ((!_5154) || _5136)
    {
        bool _5164;
        if (!_5136)
        {
            _5164 = _5092 >= 1;
        }
        if ((!_5164) || _5136)
        {
            if (!_5136)
            {
                bool _5166 = _5092 != 0;
                if (!_5166)
                {
                    float _5168 = _629 + _5040;
                    _5098 = _5168;
                }
                float _5170 = _5098;
                _5146 = _5170;
                if (!_5166)
                {
                    float _5172 = _631 + _5042;
                    _5100 = _5172;
                }
                float _5174 = _5100;
                _5148 = _5174;
                if (!_5166)
                {
                    float _5176 = _633 + _5044;
                    _5102 = _5176;
                }
                float _5178 = _5102;
                _5150 = _5178;
                if (!_5166)
                {
                    float _5180 = _5046 + 1.0;
                    _5104 = _5180;
                }
                float _5182 = _5104;
                bool _5184 = !_5166;
                _5152 = _5182;
                _5154 = _5184;
            }
            if ((!_5154) || _5136)
            {
                _5136 = false;
                _5146 = _5040;
                _5148 = _5042;
                _5150 = _5044;
                _5152 = _5046;
                _5154 = true;
            }
        }
        else
        {
            float _5186 = _629 + _5056;
            float _5188 = _631 + _5058;
            float _5190 = _633 + _5060;
            float _5192 = _5062 + 1.0;
            _5146 = _5040;
            _5148 = _5042;
            _5150 = _5044;
            _5152 = _5046;
            _5122 = _5186;
            _5124 = _5188;
            _5126 = _5190;
            _5128 = _5192;
        }
    }
    _5154 = false;
    float _5194 = _5106;
    float _5196 = _5108;
    float _5198 = _5110;
    float _5200 = _5112;
    float _5202 = _5146;
    float _5204 = _5148;
    float _5206 = _5150;
    float _5208 = _5152;
    float _5210 = _5114;
    float _5212 = _5116;
    float _5214 = _5118;
    float _5216 = _5120;
    float _5218 = _5122;
    float _5220 = _5124;
    float _5222 = _5126;
    float _5224 = _5128;
    float _5226 = -_2955;
    float _5228 = _647 + _5226;
    float _5230 = -_2959;
    float _5232 = _645 + _5230;
    float _5234 = _2969 * _5228;
    float _5236 = -_2963;
    float _5238 = _649 + _5236;
    float _5240 = fma(_2973, _5232, _5234);
    float _5242 = fma(_2977, _5238, _5240);
    float _5244 = _3005 * _5242;
    float _5246 = rint(_5244);
    float _5248 = precise::max(0.0, _5246);
    float _5250 = precise::min(_5248, 3.0);
    float _5252 = trunc(_5250);
    int _5254 = int(_5252);
    bool _5256 = _5254 >= 2;
    bool _5258 = !_5256;
    float _5260 = _5246;
    float _5262 = as_type<float>(_5254);
    float _5264 = _5234;
    float _5266 = _5240;
    float _5268 = _5194;
    float _5270 = _5196;
    float _5272 = _5198;
    float _5274 = _5200;
    float _5276 = _5210;
    float _5278 = _5212;
    float _5280 = _5214;
    float _5282 = _5216;
    float _5284 = _5218;
    float _5286 = _5220;
    float _5288 = _5222;
    float _5290 = _5224;
    float _5308;
    float _5310;
    float _5312;
    float _5314;
    if (!_5258)
    {
        bool _5292 = _5254 >= 3;
        bool _5294 = !_5292;
        if (!_5294)
        {
            bool _5296 = _5254 != 3;
            _5298 = _5296;
            if (!_5298)
            {
                float _5300 = _645 + _5194;
                float _5302 = _647 + _5196;
                float _5304 = _649 + _5198;
                float _5306 = _5200 + 1.0;
                _5268 = _5300;
                _5270 = _5302;
                _5272 = _5304;
                _5274 = _5306;
                _5308 = _5202;
                _5310 = _5204;
                _5312 = _5206;
                _5314 = _5208;
                _5316 = true;
            }
        }
        else
        {
            float _5318 = _645 + _5210;
            float _5320 = _647 + _5212;
            float _5322 = _649 + _5214;
            float _5324 = _5216 + 1.0;
            _5308 = _5202;
            _5310 = _5204;
            _5312 = _5206;
            _5314 = _5208;
            _5276 = _5318;
            _5278 = _5320;
            _5280 = _5322;
            _5282 = _5324;
            _5316 = true;
        }
    }
    if ((!_5316) || _5298)
    {
        bool _5326;
        if (!_5298)
        {
            _5326 = _5254 >= 1;
        }
        if ((!_5326) || _5298)
        {
            if (!_5298)
            {
                bool _5328 = _5254 != 0;
                if (!_5328)
                {
                    float _5330 = _645 + _5202;
                    _5260 = _5330;
                }
                float _5332 = _5260;
                _5308 = _5332;
                if (!_5328)
                {
                    float _5334 = _647 + _5204;
                    _5262 = _5334;
                }
                float _5336 = _5262;
                _5310 = _5336;
                if (!_5328)
                {
                    float _5338 = _649 + _5206;
                    _5264 = _5338;
                }
                float _5340 = _5264;
                _5312 = _5340;
                if (!_5328)
                {
                    float _5342 = _5208 + 1.0;
                    _5266 = _5342;
                }
                float _5344 = _5266;
                bool _5346 = !_5328;
                _5314 = _5344;
                _5316 = _5346;
            }
            if ((!_5316) || _5298)
            {
                _5298 = false;
                _5308 = _5202;
                _5310 = _5204;
                _5312 = _5206;
                _5314 = _5208;
                _5316 = true;
            }
        }
        else
        {
            float _5348 = _645 + _5218;
            float _5350 = _647 + _5220;
            float _5352 = _649 + _5222;
            float _5354 = _5224 + 1.0;
            _5308 = _5202;
            _5310 = _5204;
            _5312 = _5206;
            _5314 = _5208;
            _5284 = _5348;
            _5286 = _5350;
            _5288 = _5352;
            _5290 = _5354;
        }
    }
    _5316 = false;
    float _5356 = _5268;
    float _5358 = _5270;
    float _5360 = _5272;
    float _5362 = _5274;
    float _5364 = _5308;
    float _5366 = _5310;
    float _5368 = _5312;
    float _5370 = _5314;
    float _5372 = _5276;
    float _5374 = _5278;
    float _5376 = _5280;
    float _5378 = _5282;
    float _5380 = _5284;
    float _5382 = _5286;
    float _5384 = _5288;
    float _5386 = _5290;
    float _5388 = -_2955;
    float _5390 = _657 + _5388;
    float _5392 = -_2959;
    float _5394 = _655 + _5392;
    float _5396 = _2969 * _5390;
    float _5398 = -_2963;
    float _5400 = _659 + _5398;
    float _5402 = fma(_2973, _5394, _5396);
    float _5404 = fma(_2977, _5400, _5402);
    float _5406 = _3005 * _5404;
    float _5408 = rint(_5406);
    float _5410 = precise::max(0.0, _5408);
    float _5412 = precise::min(_5410, 3.0);
    float _5414 = trunc(_5412);
    int _5416 = int(_5414);
    bool _5418 = _5416 >= 2;
    bool _5420 = !_5418;
    float _5422 = as_type<float>(_5416);
    float _5424 = _5408;
    float _5426 = _5402;
    float _5428 = _5396;
    float _5430 = _5372;
    float _5432 = _5374;
    float _5434 = _5380;
    float _5436 = _5382;
    float _5438 = _5386;
    float _5440 = _5378;
    float _5442 = _5362;
    float _5444 = _5384;
    float _5446 = _5376;
    float _5448 = _5356;
    float _5450 = _5358;
    float _5452 = _5360;
    float _5470;
    float _5472;
    float _5474;
    float _5476;
    if (!_5420)
    {
        bool _5454 = _5416 >= 3;
        bool _5456 = !_5454;
        if (!_5456)
        {
            bool _5458 = _5416 != 3;
            _5460 = _5458;
            if (!_5460)
            {
                float _5462 = _655 + _5356;
                float _5464 = _657 + _5358;
                float _5466 = _659 + _5360;
                float _5468 = _5362 + 1.0;
                _5470 = _5364;
                _5472 = _5370;
                _5442 = _5468;
                _5474 = _5366;
                _5476 = _5368;
                _5448 = _5462;
                _5450 = _5464;
                _5452 = _5466;
                _5478 = true;
            }
        }
        else
        {
            float _5480 = _655 + _5372;
            float _5482 = _657 + _5374;
            float _5484 = _659 + _5376;
            float _5486 = _5378 + 1.0;
            _5430 = _5480;
            _5432 = _5482;
            _5440 = _5486;
            _5470 = _5364;
            _5472 = _5370;
            _5474 = _5366;
            _5446 = _5484;
            _5476 = _5368;
            _5478 = true;
        }
    }
    if ((!_5478) || _5460)
    {
        bool _5488;
        if (!_5460)
        {
            _5488 = _5416 >= 1;
        }
        if ((!_5488) || _5460)
        {
            if (!_5460)
            {
                bool _5490 = _5416 != 0;
                if (!_5490)
                {
                    float _5492 = _655 + _5364;
                    _5422 = _5492;
                }
                float _5494 = _5422;
                _5470 = _5494;
                if (!_5490)
                {
                    float _5496 = _657 + _5366;
                    _5424 = _5496;
                }
                float _5498 = _5424;
                _5474 = _5498;
                if (!_5490)
                {
                    float _5500 = _659 + _5368;
                    _5426 = _5500;
                }
                float _5502 = _5426;
                _5476 = _5502;
                if (!_5490)
                {
                    float _5504 = _5370 + 1.0;
                    _5428 = _5504;
                }
                float _5506 = _5428;
                bool _5508 = !_5490;
                _5472 = _5506;
                _5478 = _5508;
            }
            if ((!_5478) || _5460)
            {
                _5460 = false;
                _5470 = _5364;
                _5472 = _5370;
                _5474 = _5366;
                _5476 = _5368;
                _5478 = true;
            }
        }
        else
        {
            float _5510 = _655 + _5380;
            float _5512 = _657 + _5382;
            float _5514 = _659 + _5384;
            float _5516 = _5386 + 1.0;
            _5434 = _5510;
            _5436 = _5512;
            _5438 = _5516;
            _5470 = _5364;
            _5472 = _5370;
            _5474 = _5366;
            _5444 = _5514;
            _5476 = _5368;
        }
    }
    _5478 = false;
    float _5518 = _5430;
    float _5520 = _5432;
    float _5522 = _5434;
    float _5524 = _5436;
    float _5526 = _5438;
    float _5528 = _5440;
    float _5530 = _5470;
    float _5532 = _5472;
    float _5534 = _5442;
    float _5536 = _5474;
    float _5538 = _5444;
    float _5540 = _5446;
    float _5542 = _5476;
    float _5544 = _5448;
    float _5546 = _5450;
    float _5548 = _5452;
    float _5550 = _5518 * 6.0;
    float _5552 = _5520 * 6.0;
    float _5554 = _5522 * 6.0;
    float _5556 = _5524 * 6.0;
    float _5558 = fma(_5522, 3.0, _5550);
    float _5560 = fma(_5524, 3.0, _5552);
    float _5562 = _5526 * 4.0;
    float _5564 = fma(_5528, 4.0, _5526);
    _24[1] = as_type<uint>(_655);
    float _5566 = fma(_5530, 9.0, _5554);
    float _5568 = fma(_5532, 9.0, _5562);
    float _5570 = fma(_5534, 9.0, _5564);
    _24[0] = as_type<uint>(_659);
    float _5572 = precise::max(_499, _525);
    float _5574 = fma(_5536, 9.0, _5556);
    float _5576 = precise::max(_585, _603);
    float _5578 = _5538 * 6.0;
    float _5580 = precise::max(_421, _473);
    float _5582 = _5540 * 6.0;
    float _5584 = _5528 + _5526;
    float _5586 = precise::max(_535, _573);
    float _5588 = fma(_5542, 9.0, _5578);
    float _5590 = precise::max(_5580, _5572);
    float _5592 = fma(_5538, 3.0, _5582);
    float _5594 = precise::max(_5586, _5576);
    float _5596 = as_type<float>(_24[1]);
    float _5598 = precise::max(_351, _361);
    float _5600 = _5568 + _5528;
    float _5602 = precise::max(_371, _411);
    float _5604 = as_type<float>(_24[0]);
    float _5606 = precise::max(_619, _635);
    float _5608 = _5600 * _5570;
    float _5610 = precise::max(_5598, _5602);
    float _5612 = _5584 * 2.0;
    float _5614 = precise::max(_651, _661);
    float _5616 = -_5608;
    float _5618 = fma(_5612, _5612, _5616);
    bool _5620 = _5618 != 0.0;
    bool _5622 = isnan(_5618);
    bool _5624 = _5620 || _5622;
    bool _5626 = isnan(0.0);
    bool _5628 = _5624 || _5626;
    float _5630 = precise::max(_5606, _5614);
    float _5632 = precise::max(_5610, _5590);
    float _5634 = precise::max(_5594, _5630);
    float _5636 = fma(_5518, 3.0, _5566);
    float _5638 = fma(_5540, 3.0, _5588);
    float _5640 = fma(_5520, 3.0, _5574);
    float _5642 = fma(_5544, 9.0, _5558);
    float _5644 = fma(_5546, 9.0, _5560);
    float _5646 = fma(_5548, 9.0, _5592);
    float _5648 = precise::max(_5632, _5634);
    bool _5650 = !_5628;
    if (!_5650)
    {
        float _5652 = 1.0 / _5618;
        float _5654 = _5600 * _5642;
        float _5656 = _5636 * _5570;
        float _5658 = -_5654;
        float _5660 = fma(_5636, _5612, _5658);
        float _5662 = -_5656;
        float _5664 = fma(_5642, _5612, _5662);
        float _5666 = _5600 * _5644;
        float _5668 = _5640 * _5570;
        float _5670 = _5600 * _5646;
        float _5672 = _5638 * _5570;
        float _5674 = -_5666;
        float _5676 = fma(_5640, _5612, _5674);
        float _5678 = -_5668;
        float _5680 = fma(_5644, _5612, _5678);
        float _5682 = -_5670;
        float _5684 = fma(_5638, _5612, _5682);
        float _5686 = -_5672;
        float _5688 = fma(_5646, _5612, _5686);
        float _5690 = _5680 * _5652;
        float _5692 = _5660 * _5652;
        float _5694 = _5676 * _5652;
        float _5696 = _5684 * _5652;
        float _5698 = _5664 * _5652;
        float _5700 = _5688 * _5652;
        float _5702 = -_5690;
        float _5704 = _5694 + _5702;
        float _5706 = -_5698;
        float _5708 = _5692 + _5706;
        float _5710 = -_5700;
        float _5712 = _5696 + _5710;
        _3024 = _5708;
        _3026 = _5704;
        _3028 = _5712;
        _3030 = _5698;
        _3032 = _5692;
        _3034 = _5690;
        _3036 = _5694;
        _3038 = _5700;
        _3040 = _5696;
    }
    float _5714 = _3024;
    float _5716 = _3026;
    float _5718 = _3028;
    float _5720 = _3030;
    float _5722 = _3032;
    float _5724 = _3034;
    float _5726 = _3036;
    float _5728 = _3038;
    float _5730 = _3040;
    float _5732 = fma(_5714, 496.0, 0.5);
    float _5734 = precise::clamp(_5732, 0.0, 1.0);
    float _5736 = fma(_5716, 1008.0, 0.5);
    float _5738 = precise::clamp(_5736, 0.0, 1.0);
    float _5740 = fma(_5714, -31.0, 1.0);
    float _5742 = precise::clamp(_5740, 0.0, 1.0);
    float _5744 = fma(_5718, 496.0, 0.5);
    float _5746 = precise::clamp(_5744, 0.0, 1.0);
    float _5748 = _5734 + (-0.5);
    float _5750 = fma(_5716, -63.0, 1.0);
    float _5752 = precise::clamp(_5750, 0.0, 1.0);
    float _5754 = _5738 + (-0.5);
    float _5756 = fma(_5718, -31.0, 1.0);
    float _5758 = precise::clamp(_5756, 0.0, 1.0);
    float _5760 = _5742 * _5748;
    float _5762 = _5746 + (-0.5);
    float _5764 = _5752 * _5754;
    float _5766 = _5764 * 2.0;
    float _5768 = _5648 * 255.0;
    float _5770 = fma(_5760, -0.0322580635547637939453125, _5720);
    float _5772 = precise::clamp(_5770, 0.0, 1.0);
    float _5774 = _5758 * _5762;
    float _5776 = fma(_5760, 0.0322580635547637939453125, _5722);
    float _5778 = precise::clamp(_5776, 0.0, 1.0);
    float _5780 = fma(_5766, -0.01587301678955554962158203125, _5724);
    float _5782 = precise::clamp(_5780, 0.0, 1.0);
    float _5784 = fma(_5766, 0.01587301678955554962158203125, _5726);
    float _5786 = precise::clamp(_5784, 0.0, 1.0);
    float _5788 = fma(_5774, -0.0322580635547637939453125, _5728);
    float _5790 = precise::clamp(_5788, 0.0, 1.0);
    float _5792 = _5778 * 31.0;
    float _5794 = fma(_5774, 0.0322580635547637939453125, _5730);
    float _5796 = precise::clamp(_5794, 0.0, 1.0);
    float _5798 = _5772 * 31.0;
    float _5800 = _5782 * 63.0;
    float _5802 = _5786 * 63.0;
    float _5804 = _5790 * 31.0;
    float _5806 = _5796 * 31.0;
    float _5808 = trunc(_5768);
    float _5810 = precise::max(_5808, 0.0);
    uint _5813 = uint(_5810);
    float _5815 = precise::min(_351, _361);
    float _5817 = precise::min(_421, _473);
    float _5819 = precise::min(_535, _573);
    float _5821 = precise::min(_585, _603);
    float _5823 = rint(_5792);
    float _5825 = precise::min(_619, _635);
    float _5827 = precise::min(_651, _661);
    float _5829 = precise::min(_5819, _5821);
    float _5831 = precise::min(_5825, _5827);
    float _5833 = rint(_5802);
    float _5835 = precise::min(_5829, _5831);
    float _5837 = rint(_5798);
    float _5839 = _5823 + 0.5;
    float _5841 = rint(_5800);
    float _5843 = _5833 + 0.5;
    float _5845 = rint(_5804);
    float _5847 = _5837 + 0.5;
    float _5849 = rint(_5806);
    float _5851 = precise::min(_371, _411);
    float _5853 = precise::min(_5815, _5851);
    float _5855 = precise::min(_499, _525);
    float _5857 = trunc(_5839);
    float _5859 = precise::max(_5857, 0.0);
    uint _5861 = uint(_5859);
    float _5863 = precise::min(_5817, _5855);
    float _5865 = _5841 + 0.5;
    float _5867 = precise::min(_5853, _5863);
    float _5869 = _5849 + 0.5;
    float _5871 = trunc(_5843);
    float _5873 = precise::max(_5871, 0.0);
    uint _5875 = uint(_5873);
    float _5877 = precise::min(_5867, _5835);
    float _5879 = _5845 + 0.5;
    float _5881 = _5877 * 255.0;
    float _5883 = trunc(_5847);
    float _5885 = precise::max(_5883, 0.0);
    uint _5887 = uint(_5885);
    int _5889 = int(_5861) << 11;
    float _5891 = trunc(_5865);
    float _5893 = precise::max(_5891, 0.0);
    uint _5895 = uint(_5893);
    int _5897 = int(_5875) << 5;
    float _5899 = trunc(_5869);
    float _5901 = precise::max(_5899, 0.0);
    uint _5903 = uint(_5901);
    int _5905 = int(_5887) << 11;
    float _5907 = trunc(_5879);
    float _5909 = precise::max(_5907, 0.0);
    uint _5911 = uint(_5909);
    int _5913 = int(_5895) << 5;
    float _5915 = trunc(_5881);
    float _5917 = precise::max(_5915, 0.0);
    uint _5919 = uint(_5917);
    int _5921 = _5889 | _5897;
    int _5923 = int(_5903) | _5921;
    int _5925 = _5905 | _5913;
    int _5927 = int(_5911) | _5925;
    bool _5929 = _5923 != _5927;
    bool _5931 = _5813 > _5919;
    int _5933 = int(_5919) << 8;
    int _5935 = _5933 & 65280;
    int _5937 = int(_5895);
    int _5939 = _5933;
    int _5941 = _5897;
    int _5943 = _5935;
    int _5945 = as_type<int>(_5837);
    int _5947 = _5923;
    int _5949 = _5927;
    if (!_5929)
    {
        _5937 = _5923;
    }
    int _5951 = _5937;
    int _5953 = 255 & int(_5813);
    int _5955 = _5935 | _5953;
    int _5957 = _5951;
    if (!_5931)
    {
        _5939 = 0;
    }
    int _5959 = _5939;
    int _5961 = _5959;
    if (!_5929)
    {
        _5941 = 0;
    }
    int _5963 = _5941;
    int _5965 = _5963;
    if (!_5929)
    {
        _5943 = 0;
    }
    int _5967 = _5943;
    bool _5969 = !_5929;
    int _5971 = _5967;
    if (!_5969)
    {
        float _5973 = _5837 * 0.0322580635547637939453125;
        float _5975 = _5833 * 0.01587301678955554962158203125;
        float _5977 = _5841 * 0.01587301678955554962158203125;
        bool _5979 = uint(_5923) >= uint(_5927);
        float _5981 = _5823 * 0.0322580635547637939453125;
        float _5983 = _5849 * 0.0322580635547637939453125;
        float _5985 = _5845 * 0.0322580635547637939453125;
        bool _5987 = !_5979;
        float _5989 = _5987 ? _5975 : _5977;
        bool _5991 = !_5979;
        float _5993 = _5991 ? _5977 : _5975;
        bool _5995 = !_5979;
        float _5997 = _5995 ? _5981 : _5973;
        float _5999 = -_5989;
        float _6001 = _521 + _5999;
        bool _6003 = !_5979;
        float _6005 = _6003 ? _5973 : _5981;
        float _6007 = -_5989;
        float _6009 = _6007 + _5993;
        bool _6011 = !_5979;
        float _6013 = _6011 ? _5983 : _5985;
        float _6015 = -_5997;
        float _6017 = _519 + _6015;
        bool _6019 = !_5979;
        float _6021 = _6019 ? _5985 : _5983;
        float _6023 = -_5997;
        float _6025 = _6023 + _6005;
        float _6027 = -_5997;
        float _6029 = _493 + _6027;
        float _6031 = -_5997;
        float _6033 = _467 + _6031;
        float _6035 = -_5997;
        float _6037 = _415 + _6035;
        float _6039 = -_5997;
        float _6041 = _405 + _6039;
        float _6043 = -_5997;
        float _6045 = _365 + _6043;
        float _6047 = -_5997;
        float _6049 = _355 + _6047;
        float _6051 = -_5997;
        float _6053 = _345 + _6051;
        float _6055 = -_5997;
        float _6057 = _5596 + _6055;
        float _6059 = -_5997;
        float _6061 = _645 + _6059;
        float _6063 = -_5997;
        float _6065 = _629 + _6063;
        float _6067 = -_5997;
        float _6069 = _613 + _6067;
        float _6071 = -_5997;
        float _6073 = _597 + _6071;
        float _6075 = -_5997;
        float _6077 = _579 + _6075;
        float _6079 = -_5997;
        float _6081 = _567 + _6079;
        float _6083 = -_5997;
        float _6085 = _529 + _6083;
        float _6087 = _6009 * _6009;
        float _6089 = -_6013;
        float _6091 = _6089 + _6021;
        float _6093 = -_5989;
        float _6095 = _495 + _6093;
        float _6097 = -_6013;
        float _6099 = _523 + _6097;
        float _6101 = fma(_6025, _6025, _6087);
        float _6103 = -_6013;
        float _6105 = _497 + _6103;
        float _6107 = -_5989;
        float _6109 = _469 + _6107;
        float _6111 = -_5989;
        float _6113 = _417 + _6111;
        float _6115 = fma(_6091, _6091, _6101);
        float _6117 = -_6013;
        float _6119 = _471 + _6117;
        float _6121 = -_5989;
        float _6123 = _407 + _6121;
        float _6125 = -_5989;
        float _6127 = _367 + _6125;
        float _6129 = 1.0 / _6115;
        float _6131 = -_5989;
        float _6133 = _357 + _6131;
        float _6135 = -_5989;
        float _6137 = _347 + _6135;
        float _6139 = -_5989;
        float _6141 = _657 + _6139;
        float _6143 = -_5989;
        float _6145 = _647 + _6143;
        float _6147 = -_5989;
        float _6149 = _631 + _6147;
        float _6151 = -_5989;
        float _6153 = _615 + _6151;
        float _6155 = -_5989;
        float _6157 = _599 + _6155;
        float _6159 = -_5989;
        float _6161 = _581 + _6159;
        float _6163 = -_5989;
        float _6165 = _569 + _6163;
        float _6167 = -_5989;
        float _6169 = _531 + _6167;
        float _6171 = -_6013;
        float _6173 = _419 + _6171;
        float _6175 = -_6013;
        float _6177 = _409 + _6175;
        float _6179 = -_6013;
        float _6181 = _369 + _6179;
        float _6183 = -_6013;
        float _6185 = _359 + _6183;
        float _6187 = _6009 * _6129;
        float _6189 = _6025 * _6129;
        float _6191 = _6091 * _6129;
        float _6193 = _6187 * _6001;
        float _6195 = _6187 * _6095;
        float _6197 = _6187 * _6109;
        float _6199 = _6187 * _6113;
        float _6201 = fma(_6189, _6017, _6193);
        float _6203 = fma(_6189, _6029, _6195);
        float _6205 = fma(_6189, _6033, _6197);
        float _6207 = fma(_6189, _6037, _6199);
        float _6209 = fma(_6191, _6099, _6201);
        float _6211 = fma(_6191, _6105, _6203);
        float _6213 = fma(_6191, _6119, _6205);
        float _6215 = _6187 * _6123;
        float _6217 = _6187 * _6169;
        bool _6219 = _6209 >= 0.5;
        float _6221 = _6187 * _6127;
        bool _6223 = _6211 >= 0.5;
        float _6225 = _6187 * _6133;
        bool _6227 = _6209 >= 0.833000004291534423828125;
        float _6229 = _6187 * _6137;
        bool _6231 = _6209 >= 0.16599999368190765380859375;
        float _6233 = _6187 * _6141;
        float _6235 = _6187 * _6145;
        float _6237 = _6187 * _6149;
        float _6239 = _6187 * _6153;
        float _6241 = _6187 * _6157;
        float _6243 = _6187 * _6161;
        float _6245 = _6187 * _6165;
        int _6247 = _6227 ? 0 : 32768;
        float _6249 = fma(_6191, _6173, _6207);
        bool _6251 = _6211 >= 0.833000004291534423828125;
        float _6253 = fma(_6189, _6041, _6215);
        int _6255 = _6247;
        if (!_6219)
        {
            int _6257 = _6231 ? 49152 : 16384;
            _6255 = _6257;
        }
        int _6259 = _6255;
        float _6261 = fma(_6189, _6045, _6221);
        bool _6263 = _6211 >= 0.16599999368190765380859375;
        float _6265 = fma(_6189, _6049, _6225);
        float _6267 = fma(_6189, _6053, _6229);
        bool _6269 = _6213 >= 0.5;
        float _6271 = fma(_6189, _6057, _6233);
        float _6273 = fma(_6189, _6061, _6235);
        float _6275 = fma(_6189, _6065, _6237);
        float _6277 = fma(_6189, _6069, _6239);
        float _6279 = fma(_6189, _6073, _6241);
        float _6281 = fma(_6189, _6077, _6243);
        float _6283 = fma(_6189, _6081, _6245);
        float _6285 = fma(_6189, _6085, _6217);
        int _6287 = _6251 ? 0 : 8192;
        float _6289 = fma(_6191, _6177, _6253);
        bool _6291 = _6249 >= 0.5;
        float _6293 = fma(_6191, _6181, _6261);
        int _6295 = _6287;
        if (!_6223)
        {
            int _6297 = _6263 ? 12288 : 4096;
            _6295 = _6297;
        }
        int _6299 = _6295;
        float _6301 = fma(_6191, _6185, _6265);
        bool _6303 = _6249 >= 0.833000004291534423828125;
        float _6305 = -_6013;
        float _6307 = _5604 + _6305;
        bool _6309 = _6213 >= 0.833000004291534423828125;
        float _6311 = -_6013;
        float _6313 = _649 + _6311;
        bool _6315 = _6213 >= 0.16599999368190765380859375;
        float _6317 = fma(_6191, _6307, _6271);
        int _6319 = _6303 ? 0 : 512;
        float _6321 = fma(_6191, _6313, _6273);
        bool _6323 = _6289 >= 0.5;
        float _6325 = -_6013;
        float _6327 = _633 + _6325;
        int _6329 = _6309 ? 0 : 2048;
        float _6331 = -_6013;
        float _6333 = _617 + _6331;
        bool _6335 = _6249 >= 0.16599999368190765380859375;
        float _6337 = fma(_6191, _6327, _6275);
        float _6339 = fma(_6191, _6333, _6277);
        int _6341 = _6329;
        int _6343 = _6319;
        if (!_6269)
        {
            int _6345 = _6315 ? 3072 : 1024;
            _6341 = _6345;
        }
        int _6347 = _6341;
        float _6349 = -_6013;
        float _6351 = _601 + _6349;
        bool _6353 = _6293 >= 0.5;
        float _6355 = -_6013;
        float _6357 = _571 + _6355;
        if (!_6291)
        {
            int _6359 = _6335 ? 768 : 256;
            _6343 = _6359;
        }
        int _6361 = _6343;
        float _6363 = fma(_6191, _6351, _6279);
        bool _6365 = _6289 >= 0.833000004291534423828125;
        float _6367 = -_6013;
        float _6369 = _583 + _6367;
        bool _6371 = _6293 >= 0.833000004291534423828125;
        float _6373 = fma(_6191, _6357, _6283);
        bool _6375 = _6289 >= 0.16599999368190765380859375;
        float _6377 = fma(_6191, _6369, _6281);
        int _6379 = _6365 ? 0 : 128;
        float _6381 = -_6013;
        float _6383 = _349 + _6381;
        int _6385 = _6371 ? 0 : 32;
        float _6387 = -_6013;
        float _6389 = _533 + _6387;
        bool _6391 = _6301 >= 0.5;
        float _6393 = fma(_6191, _6383, _6267);
        bool _6395 = _6293 >= 0.16599999368190765380859375;
        float _6397 = fma(_6191, _6389, _6285);
        int _6399 = _6379;
        int _6401 = _6385;
        if (!_6323)
        {
            int _6403 = _6375 ? 192 : 64;
            _6399 = _6403;
        }
        int _6405 = _6399;
        bool _6407 = _6301 >= 0.833000004291534423828125;
        if (!_6353)
        {
            int _6409 = _6395 ? 48 : 16;
            _6401 = _6409;
        }
        int _6411 = _6401;
        int _6413 = _6407 ? 0 : 8;
        bool _6415 = _6317 >= 0.5;
        bool _6417 = _6301 >= 0.16599999368190765380859375;
        bool _6419 = _6321 >= 0.5;
        bool _6421 = _6317 >= 0.833000004291534423828125;
        int _6423 = _6413;
        if (!_6391)
        {
            int _6425 = _6417 ? 12 : 4;
            _6423 = _6425;
        }
        int _6427 = _6423;
        bool _6429 = _6321 >= 0.833000004291534423828125;
        bool _6431 = _6317 >= 0.16599999368190765380859375;
        int _6433 = _6421 ? 0 : int(0x80000000);
        bool _6435 = _6321 >= 0.16599999368190765380859375;
        int _6437 = _6429 ? 0 : 536870912;
        bool _6439 = _6337 >= 0.5;
        int _6441 = _6433;
        int _6443 = _6437;
        if (!_6415)
        {
            int _6445 = _6431 ? (-1073741824) : 1073741824;
            _6441 = _6445;
        }
        int _6447 = _6441;
        bool _6449 = _6339 >= 0.5;
        if (!_6419)
        {
            int _6451 = _6435 ? 805306368 : 268435456;
            _6443 = _6451;
        }
        int _6453 = _6443;
        bool _6455 = _6337 >= 0.833000004291534423828125;
        bool _6457 = _6339 >= 0.833000004291534423828125;
        int _6459 = _6455 ? 0 : 134217728;
        bool _6461 = _6337 >= 0.16599999368190765380859375;
        bool _6463 = _6363 >= 0.5;
        int _6465 = _6457 ? 0 : 33554432;
        bool _6467 = _6339 >= 0.16599999368190765380859375;
        int _6469 = _6459;
        int _6471 = _6465;
        if (!_6439)
        {
            int _6473 = _6461 ? 201326592 : 67108864;
            _6469 = _6473;
        }
        int _6475 = _6469;
        bool _6477 = _6363 >= 0.833000004291534423828125;
        if (!_6449)
        {
            int _6479 = _6467 ? 50331648 : 16777216;
            _6471 = _6479;
        }
        int _6481 = _6471;
        bool _6483 = _6373 >= 0.5;
        bool _6485 = _6363 >= 0.16599999368190765380859375;
        int _6487 = _6477 ? 0 : 8388608;
        bool _6489 = _6377 >= 0.5;
        bool _6491 = _6377 >= 0.833000004291534423828125;
        int _6493 = _6487;
        if (!_6463)
        {
            int _6495 = _6485 ? 12582912 : 4194304;
            _6493 = _6495;
        }
        int _6497 = _6493;
        bool _6499 = _6373 >= 0.833000004291534423828125;
        int _6501 = _6491 ? 0 : 2097152;
        bool _6503 = _6373 >= 0.16599999368190765380859375;
        int _6505 = _6499 ? 0 : 524288;
        bool _6507 = _6377 >= 0.16599999368190765380859375;
        int _6509 = _6505;
        int _6511 = _6501;
        if (!_6483)
        {
            int _6513 = _6503 ? 786432 : 262144;
            _6509 = _6513;
        }
        int _6515 = _6509;
        bool _6517 = _6393 >= 0.5;
        bool _6519 = _6397 >= 0.5;
        if (!_6489)
        {
            int _6521 = _6507 ? 3145728 : 1048576;
            _6511 = _6521;
        }
        int _6523 = _6511;
        bool _6525 = _6393 >= 0.833000004291534423828125;
        int _6527 = _6475 + _6447;
        int _6529 = _6527 + _6453;
        int _6531 = _6347 + _6259;
        int _6533 = _6531 + _6299;
        bool _6535 = _6397 >= 0.833000004291534423828125;
        int _6537 = _6525 ? 0 : 2;
        bool _6539 = _6393 >= 0.16599999368190765380859375;
        bool _6541 = _6397 >= 0.16599999368190765380859375;
        int _6543 = _6497 + _6529;
        int _6545 = _6543 + _6481;
        int _6547 = _6405 + _6533;
        int _6549 = _6547 + _6361;
        int _6551 = _6535 ? 0 : 131072;
        int _6553 = _6537;
        int _6555 = _6551;
        _5945 = 3;
        if (!_6517)
        {
            int _6557 = _6539 ? 3 : 1;
            _6553 = _6557;
        }
        int _6559 = _6553;
        if (!_6519)
        {
            int _6561 = _6541 ? 196608 : 65536;
            _6555 = _6561;
        }
        int _6563 = _6555;
        int _6565 = _6515 + _6545;
        int _6567 = _6565 + _6523;
        int _6569 = _6427 + _6549;
        int _6571 = _6569 + _6411;
        bool _6573 = !_5979;
        int _6575 = _6573 ? _5927 : _5923;
        bool _6577 = !_5979;
        int _6579 = _6577 ? _5923 : _5927;
        int _6581 = _6567 + _6563;
        int _6583 = _6571 + _6559;
        _5957 = _6575;
        _5971 = _6581;
        _5965 = _6583;
        _5947 = _6579;
    }
    int _6585 = _5957;
    int _6587 = _5945;
    int _6589 = _5971;
    int _6591 = _5965;
    int _6593 = _5947;
    int _6595 = _6587;
    if (!_5931)
    {
        _6595 = 0;
    }
    int _6597 = _6595;
    int _6599 = _6597;
    if (!_5931)
    {
        _5949 = 0;
    }
    int _6601 = _5949;
    bool _6603 = !_5931;
    int _6605 = _6601;
    if (!_6603)
    {
        float _6607 = -_5877;
        float _6609 = _5648 + _6607;
        float _6611 = -_5877;
        float _6613 = _371 + _6611;
        float _6615 = -_5877;
        float _6617 = _351 + _6615;
        float _6619 = -_5877;
        float _6621 = _361 + _6619;
        float _6623 = -_5877;
        float _6625 = _473 + _6623;
        float _6627 = 1.0 / _6609;
        float _6629 = -_5877;
        float _6631 = _499 + _6629;
        float _6633 = -_5877;
        float _6635 = _603 + _6633;
        float _6637 = -_5877;
        float _6639 = _525 + _6637;
        float _6641 = -_5877;
        float _6643 = _535 + _6641;
        float _6645 = -_5877;
        float _6647 = _573 + _6645;
        float _6649 = -_5877;
        float _6651 = _635 + _6649;
        float _6653 = -_5877;
        float _6655 = _651 + _6653;
        float _6657 = -_5877;
        float _6659 = _661 + _6657;
        float _6661 = _6613 * _6627;
        float _6663 = -_5877;
        float _6665 = _411 + _6663;
        float _6667 = _6617 * _6627;
        float _6669 = _6621 * _6627;
        float _6671 = _6665 * _6627;
        float _6673 = -_5877;
        float _6675 = _421 + _6673;
        float _6677 = fma(_6667, -1.99999904632568359375, 1.99999904632568359375);
        float _6679 = fma(_6667, -7.99999904632568359375, 7.99999904632568359375);
        float _6681 = fma(_6669, -1.99999904632568359375, 1.99999904632568359375);
        float _6683 = fma(_6669, -7.99999904632568359375, 7.99999904632568359375);
        float _6685 = fma(_6661, -1.99999904632568359375, 1.99999904632568359375);
        float _6687 = fma(_6661, -7.99999904632568359375, 7.99999904632568359375);
        float _6689 = _6675 * _6627;
        float _6691 = -_6667;
        float _6693 = _6691 + 0.5;
        float _6695 = -_6669;
        float _6697 = _6695 + 0.5;
        float _6699 = trunc(_6677);
        float _6701 = precise::max(_6699, 0.0);
        uint _6703 = uint(_6701);
        float _6705 = fma(_6671, -1.99999904632568359375, 1.99999904632568359375);
        float _6707 = fma(_6671, -7.99999904632568359375, 7.99999904632568359375);
        float _6709 = fma(_6689, -1.99999904632568359375, 1.99999904632568359375);
        float _6711 = fma(_6689, -7.99999904632568359375, 7.99999904632568359375);
        float _6713 = _6625 * _6627;
        float _6715 = _6631 * _6627;
        float _6717 = -_6661;
        float _6719 = _6717 + 0.5;
        float _6721 = trunc(_6679);
        float _6723 = precise::max(_6721, 0.0);
        uint _6725 = uint(_6723);
        float _6727 = _6635 * _6627;
        float _6729 = -_5877;
        float _6731 = _619 + _6729;
        float _6733 = abs(_6693);
        bool _6735 = _6733 >= 0.375;
        float _6737 = fma(_6713, -1.99999904632568359375, 1.99999904632568359375);
        float _6739 = abs(_6697);
        bool _6741 = _6739 >= 0.375;
        float _6743 = fma(_6713, -7.99999904632568359375, 7.99999904632568359375);
        float _6745 = fma(_6715, -1.99999904632568359375, 1.99999904632568359375);
        float _6747 = trunc(_6681);
        float _6749 = precise::max(_6747, 0.0);
        uint _6751 = uint(_6749);
        float _6753 = fma(_6715, -7.99999904632568359375, 7.99999904632568359375);
        float _6755 = _6639 * _6627;
        float _6757 = _6643 * _6627;
        float _6759 = -_6671;
        float _6761 = _6759 + 0.5;
        float _6763 = -_6689;
        float _6765 = _6763 + 0.5;
        float _6767 = _6647 * _6627;
        float _6769 = abs(_6719);
        bool _6771 = _6769 >= 0.375;
        float _6773 = trunc(_6683);
        float _6775 = precise::max(_6773, 0.0);
        uint _6777 = uint(_6775);
        float _6779 = -_5877;
        float _6781 = _585 + _6779;
        float _6783 = _6731 * _6627;
        float _6785 = fma(_6755, -1.99999904632568359375, 1.99999904632568359375);
        float _6787 = fma(_6755, -7.99999904632568359375, 7.99999904632568359375);
        float _6789 = fma(_6757, -1.99999904632568359375, 1.99999904632568359375);
        float _6791 = fma(_6757, -7.99999904632568359375, 7.99999904632568359375);
        float _6793 = -_6713;
        float _6795 = _6793 + 0.5;
        float _6797 = trunc(_6685);
        float _6799 = precise::max(_6797, 0.0);
        uint _6801 = uint(_6799);
        float _6803 = -_6715;
        float _6805 = _6803 + 0.5;
        float _6807 = abs(_6761);
        bool _6809 = _6807 >= 0.375;
        float _6811 = fma(_6767, -1.99999904632568359375, 1.99999904632568359375);
        float _6813 = abs(_6765);
        bool _6815 = _6813 >= 0.375;
        float _6817 = fma(_6767, -7.99999904632568359375, 7.99999904632568359375);
        float _6819 = _6781 * _6627;
        float _6821 = _6651 * _6627;
        float _6823 = trunc(_6687);
        float _6825 = precise::max(_6823, 0.0);
        uint _6827 = uint(_6825);
        float _6829 = _6655 * _6627;
        float _6831 = _6659 * _6627;
        float _6833 = fma(_6783, -7.99999904632568359375, 7.99999904632568359375);
        float _6835 = -_6755;
        float _6837 = _6835 + 0.5;
        float _6839 = -_6757;
        float _6841 = _6839 + 0.5;
        float _6843 = abs(_6795);
        bool _6845 = _6843 >= 0.375;
        float _6847 = fma(_6819, -1.99999904632568359375, 1.99999904632568359375);
        float _6849 = trunc(_6705);
        float _6851 = precise::max(_6849, 0.0);
        uint _6853 = uint(_6851);
        float _6855 = abs(_6805);
        bool _6857 = _6855 >= 0.375;
        float _6859 = fma(_6819, -7.99999904632568359375, 7.99999904632568359375);
        float _6861 = fma(_6727, -1.99999904632568359375, 1.99999904632568359375);
        float _6863 = fma(_6727, -7.99999904632568359375, 7.99999904632568359375);
        float _6865 = -_6767;
        float _6867 = _6865 + 0.5;
        int _6869 = int(_6703);
        int _6871 = int(_6751);
        int _6873 = int(_6801);
        int _6875 = int(_6853);
        if (!_6735)
        {
            int _6877 = int(_6725) + 1;
            _6869 = _6877;
        }
        int _6879 = _6869;
        float _6881 = fma(_6783, -1.99999904632568359375, 1.99999904632568359375);
        float _6883 = trunc(_6707);
        float _6885 = precise::max(_6883, 0.0);
        uint _6887 = uint(_6885);
        if (!_6741)
        {
            int _6889 = int(_6777) + 1;
            _6871 = _6889;
        }
        int _6891 = _6871;
        float _6893 = fma(_6821, -1.99999904632568359375, 1.99999904632568359375);
        float _6895 = abs(_6837);
        bool _6897 = _6895 >= 0.375;
        float _6899 = -_6819;
        float _6901 = _6899 + 0.5;
        float _6903 = abs(_6841);
        bool _6905 = _6903 >= 0.375;
        float _6907 = -_6727;
        float _6909 = _6907 + 0.5;
        if (!_6771)
        {
            int _6911 = int(_6827) + 1;
            _6873 = _6911;
        }
        int _6913 = _6873;
        float _6915 = trunc(_6709);
        float _6917 = precise::max(_6915, 0.0);
        uint _6919 = uint(_6917);
        float _6921 = abs(_6867);
        bool _6923 = _6921 >= 0.375;
        float _6925 = fma(_6829, -1.99999904632568359375, 1.99999904632568359375);
        float _6927 = -_6783;
        float _6929 = _6927 + 0.5;
        float _6931 = fma(_6831, -1.99999904632568359375, 1.99999904632568359375);
        int _6933 = _6891 << 3;
        float _6935 = trunc(_6711);
        float _6937 = precise::max(_6935, 0.0);
        uint _6939 = uint(_6937);
        int _6941 = int(_6919);
        if (!_6809)
        {
            int _6943 = int(_6887) + 1;
            _6875 = _6943;
        }
        int _6945 = _6875;
        float _6947 = abs(_6901);
        bool _6949 = _6947 >= 0.375;
        int _6951 = _6879 | _6933;
        int _6953 = _6945 << 9;
        float _6955 = trunc(_6737);
        float _6957 = precise::max(_6955, 0.0);
        uint _6959 = uint(_6957);
        float _6961 = trunc(_6743);
        float _6963 = precise::max(_6961, 0.0);
        uint _6965 = uint(_6963);
        int _6967 = int(_6959);
        if (!_6815)
        {
            int _6969 = int(_6939) + 1;
            _6941 = _6969;
        }
        int _6971 = _6941;
        float _6973 = abs(_6909);
        bool _6975 = _6973 >= 0.375;
        float _6977 = trunc(_6745);
        float _6979 = precise::max(_6977, 0.0);
        uint _6981 = uint(_6979);
        float _6983 = trunc(_6753);
        float _6985 = precise::max(_6983, 0.0);
        uint _6987 = uint(_6985);
        int _6989 = int(_6981);
        if (!_6845)
        {
            int _6991 = int(_6965) + 1;
            _6967 = _6991;
        }
        int _6993 = _6967;
        float _6995 = abs(_6929);
        bool _6997 = _6995 >= 0.375;
        int _6999 = _6993 << 15;
        float _7001 = trunc(_6785);
        float _7003 = precise::max(_7001, 0.0);
        uint _7005 = uint(_7003);
        float _7007 = trunc(_6787);
        float _7009 = precise::max(_7007, 0.0);
        uint _7011 = uint(_7009);
        int _7013 = int(_7005);
        if (!_6857)
        {
            int _7015 = int(_6987) + 1;
            _6989 = _7015;
        }
        int _7017 = _6989;
        float _7019 = trunc(_6789);
        float _7021 = precise::max(_7019, 0.0);
        uint _7023 = uint(_7021);
        float _7025 = trunc(_6791);
        float _7027 = precise::max(_7025, 0.0);
        uint _7029 = uint(_7027);
        int _7031 = int(_7023);
        if (!_6897)
        {
            int _7033 = int(_7011) + 1;
            _7013 = _7033;
        }
        int _7035 = _7013;
        int _7037 = _7035 << 21;
        float _7039 = trunc(_6833);
        float _7041 = precise::max(_7039, 0.0);
        uint _7043 = uint(_7041);
        float _7045 = trunc(_6811);
        float _7047 = precise::max(_7045, 0.0);
        uint _7049 = uint(_7047);
        float _7051 = fma(_6821, -7.99999904632568359375, 7.99999904632568359375);
        float _7053 = -_6821;
        float _7055 = _7053 + 0.5;
        int _7057 = int(_7049);
        if (!_6905)
        {
            int _7059 = int(_7029) + 1;
            _7031 = _7059;
        }
        int _7061 = _7031;
        float _7063 = abs(_7055);
        bool _7065 = _7063 >= 0.375;
        float _7067 = trunc(_6817);
        float _7069 = precise::max(_7067, 0.0);
        uint _7071 = uint(_7069);
        float _7073 = trunc(_6847);
        float _7075 = precise::max(_7073, 0.0);
        uint _7077 = uint(_7075);
        float _7079 = trunc(_6859);
        float _7081 = precise::max(_7079, 0.0);
        uint _7083 = uint(_7081);
        int _7085 = int(_7077);
        if (!_6923)
        {
            int _7087 = int(_7071) + 1;
            _7057 = _7087;
        }
        int _7089 = _7057;
        float _7091 = trunc(_6861);
        float _7093 = precise::max(_7091, 0.0);
        uint _7095 = uint(_7093);
        float _7097 = trunc(_6863);
        float _7099 = precise::max(_7097, 0.0);
        uint _7101 = uint(_7099);
        int _7103 = int(_7095);
        if (!_6949)
        {
            int _7105 = int(_7083) + 1;
            _7085 = _7105;
        }
        int _7107 = _7085;
        int _7109 = _7107 << 6;
        float _7111 = trunc(_7051);
        float _7113 = precise::max(_7111, 0.0);
        uint _7115 = uint(_7113);
        float _7117 = trunc(_6881);
        float _7119 = precise::max(_7117, 0.0);
        uint _7121 = uint(_7119);
        float _7123 = fma(_6829, -7.99999904632568359375, 7.99999904632568359375);
        float _7125 = fma(_6831, -7.99999904632568359375, 7.99999904632568359375);
        float _7127 = -_6829;
        float _7129 = _7127 + 0.5;
        float _7131 = -_6831;
        float _7133 = _7131 + 0.5;
        if (!_6975)
        {
            int _7135 = int(_7101) + 1;
            _7103 = _7135;
        }
        int _7137 = _7103;
        float _7139 = trunc(_6893);
        float _7141 = precise::max(_7139, 0.0);
        uint _7143 = uint(_7141);
        float _7145 = abs(_7129);
        bool _7147 = _7145 >= 0.375;
        float _7149 = abs(_7133);
        bool _7151 = _7149 >= 0.375;
        int _7153 = _7137 << 9;
        float _7155 = trunc(_6925);
        float _7157 = precise::max(_7155, 0.0);
        uint _7159 = uint(_7157);
        int _7161 = int(_7121);
        int _7163 = int(_7159);
        if (!_6997)
        {
            int _7165 = int(_7043) + 1;
            _7161 = _7165;
        }
        int _7167 = _7161;
        int _7169 = _7167 << 12;
        float _7171 = trunc(_7123);
        float _7173 = precise::max(_7171, 0.0);
        uint _7175 = uint(_7173);
        int _7177 = int(_7143);
        if (!_7065)
        {
            int _7179 = int(_7115) + 1;
            _7177 = _7179;
        }
        int _7181 = _7177;
        int _7183 = _7181 << 15;
        float _7185 = trunc(_6931);
        float _7187 = precise::max(_7185, 0.0);
        uint _7189 = uint(_7187);
        int _7191 = _7089 << 3;
        int _7193 = _7061 | _7191;
        float _7195 = trunc(_7125);
        float _7197 = precise::max(_7195, 0.0);
        uint _7199 = uint(_7197);
        int _7201 = _6913 << 6;
        int _7203 = _7193 | _7109;
        int _7205 = _7153 | _7203;
        int _7207 = _6951 | _7201;
        int _7209 = _6953 | _7207;
        int _7211 = _6971 << 12;
        int _7213 = int(_7189);
        if (!_7147)
        {
            int _7215 = int(_7175) + 1;
            _7163 = _7215;
        }
        int _7217 = _7163;
        int _7219 = _7209 | _7211;
        int _7221 = _6999 | _7219;
        int _7223 = _7205 | _7169;
        int _7225 = _7183 | _7223;
        int _7227 = _7017 << 18;
        if (!_7151)
        {
            int _7229 = int(_7199) + 1;
            _7213 = _7229;
        }
        int _7231 = _7213;
        int _7233 = _7217 << 18;
        int _7235 = _7231 << 21;
        int _7237 = _7221 | _7227;
        int _7239 = _7037 | _7237;
        int _7241 = _7225 | _7233;
        int _7243 = _7235 | _7241;
        uint _7245 = uint(int(uint(_7239) >> uint(16)));
        int _7247 = _7243 << 8;
        uint _7249 = uint(int(uint(_7243) >> uint(8)));
        int _7251 = 65280 & _7247;
        int _7253 = int(_7245) | _7251;
        int _7255 = _7239 << 16;
        int _7257 = int(_7249) << 16;
        _5961 = _7255;
        _6605 = _7257;
        _6599 = _7253;
    }
    int _7259 = _5961;
    int _7261 = _6605;
    int _7263 = _6599;
    int _7265 = _6585 & 65535;
    int _7267 = _7259 | _5955;
    int _7269 = _7261 | _7263;
    int _7271 = _6589 | _6591;
    int _7273 = _6593 << 16;
    int _7275 = _7273 + _7265;
    out.m_41.x = as_type<float>(_7267);
    out.m_41.y = as_type<float>(_7269);
    out.m_41.z = as_type<float>(_7275);
    out.m_41.w = as_type<float>(_7271);
    return out;
}


struct main0_out_u
{
    uint4 m_41 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    bool _5478 = false;
    bool _5460 = false;
    bool _5316 = false;
    bool _5298 = false;
    bool _5154 = false;
    bool _5136 = false;
    bool _4992 = false;
    bool _4974 = false;
    bool _4830 = false;
    bool _4812 = false;
    bool _4668 = false;
    bool _4650 = false;
    bool _4506 = false;
    bool _4488 = false;
    bool _4344 = false;
    bool _4326 = false;
    bool _4182 = false;
    bool _4164 = false;
    bool _4020 = false;
    bool _4002 = false;
    bool _3858 = false;
    bool _3840 = false;
    bool _3696 = false;
    bool _3678 = false;
    bool _3534 = false;
    bool _3516 = false;
    bool _3372 = false;
    bool _3354 = false;
    bool _3210 = false;
    bool _3192 = false;
    bool _3082 = false;
    bool _3048 = false;
    float _48 = gl_FragCoord.w;
    float _50 = in.m_34.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_34.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = in.m_36.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_36.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_34.z;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_36.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = in.m_38.x;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = 1.0 / _48;
    float _106 = _104 * _54;
    float _108 = _104 * _60;
    float _110 = _104 * _66;
    float _112 = _104 * _72;
    float _114 = _104 * _78;
    float _116 = _104 * _84;
    float _118 = abs(_106);
    float _120 = abs(_108);
    float _122 = precise::max(_118, _120);
    float _124 = _106 + _110;
    float _126 = _108 + _112;
    float _128 = _104 * _90;
    float _130 = _104 * _96;
    float _132 = abs(_114);
    float _134 = precise::max(_132, _122);
    float _136 = _114 + _116;
    float _138 = abs(_124);
    float _140 = abs(_126);
    float _142 = precise::max(_138, _140);
    float _144 = fma(_110, 2.0, _106);
    float _146 = fma(_112, 2.0, _108);
    float _148 = _104 * _102;
    float _150 = _106 + _128;
    float _152 = _108 + _130;
    float _154 = 1.0 / _134;
    float _156 = abs(_136);
    float _158 = precise::max(_156, _142);
    float _160 = fma(_116, 2.0, _114);
    float _162 = _114 + _148;
    float _164 = abs(_144);
    float _166 = abs(_146);
    float _168 = precise::max(_164, _166);
    float _170 = fma(_128, 2.0, _106);
    float _172 = fma(_130, 2.0, _108);
    float _174 = fma(_128, 3.0, _106);
    float _176 = abs(_160);
    float _178 = precise::max(_176, _168);
    float _180 = 1.0 / _158;
    float _182 = abs(_150);
    float _184 = abs(_152);
    float _186 = precise::max(_182, _184);
    float _188 = fma(_148, 2.0, _114);
    float _190 = fma(_110, 3.0, _106);
    float _192 = fma(_112, 3.0, _108);
    float _194 = abs(_162);
    float _196 = precise::max(_194, _186);
    float _198 = fma(_130, 3.0, _108);
    float _200 = fma(_148, 3.0, _114);
    float _202 = 1.0 / _178;
    float _204 = abs(_170);
    float _206 = abs(_172);
    float _208 = precise::max(_204, _206);
    float _210 = _114 * _154;
    float _212 = abs(_174);
    float _214 = abs(_198);
    float _216 = precise::max(_212, _214);
    float _218 = fma(_116, 3.0, _114);
    float _220 = abs(_188);
    float _222 = precise::max(_220, _208);
    float _224 = _150 + _110;
    float _226 = abs(_200);
    float _228 = precise::max(_226, _216);
    float _230 = 1.0 / _196;
    float _232 = _152 + _112;
    float _234 = abs(_190);
    float _236 = abs(_192);
    float _238 = precise::max(_234, _236);
    float _240 = _170 + _110;
    float _242 = _172 + _112;
    float _244 = _108 * _154;
    float _246 = abs(_218);
    float _248 = precise::max(_246, _238);
    float _250 = _162 + _116;
    float _252 = 1.0 / _222;
    float _254 = abs(_224);
    float _256 = abs(_232);
    float _258 = precise::max(_254, _256);
    float _260 = _124 * _180;
    float _262 = _126 * _180;
    float _264 = _136 * _180;
    float _266 = _188 + _116;
    float _268 = _174 + _110;
    float _270 = _198 + _112;
    float _272 = 1.0 / _228;
    float _274 = abs(_240);
    float _276 = abs(_242);
    float _278 = precise::max(_274, _276);
    float _280 = _144 * _202;
    float _282 = abs(_250);
    float _284 = precise::max(_282, _258);
    float _286 = _146 * _202;
    float _288 = _160 * _202;
    float _290 = _200 + _116;
    float _292 = abs(_266);
    float _294 = precise::max(_292, _278);
    float _296 = _106 * _154;
    float _298 = abs(_268);
    float _300 = abs(_270);
    float _302 = precise::max(_298, _300);
    float _304 = fma(_110, 2.0, _150);
    float _306 = fma(_110, 3.0, _150);
    float _308 = 1.0 / _284;
    float _310 = fma(_112, 2.0, _152);
    float _312 = _150 * _230;
    float _314 = _152 * _230;
    float _316 = _162 * _230;
    float _318 = fma(_116, 2.0, _162);
    float _320 = _170 * _252;
    float _322 = _172 * _252;
    float _324 = 1.0 / _294;
    float _326 = abs(_290);
    float _328 = precise::max(_326, _302);
    float _330 = _188 * _252;
    float _332 = fma(_110, 2.0, _170);
    float _334 = abs(_304);
    float _336 = abs(_310);
    float _338 = precise::max(_334, _336);
    float _340 = fma(_112, 2.0, _172);
    float3 _7672 = float3(_296, _244, _210);
    float4 _343 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7672, float3(0.0), isnan(_7672)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7672, float3(0.0), isnan(_7672)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _345 = _343.x;
    float _347 = _343.y;
    float _349 = _343.z;
    float _351 = _343.w;
    float3 _7695 = float3(_312, _314, _316);
    float4 _353 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7695, float3(0.0), isnan(_7695)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7695, float3(0.0), isnan(_7695)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _355 = _353.x;
    float _357 = _353.y;
    float _359 = _353.z;
    float _361 = _353.w;
    float3 _7714 = float3(_320, _322, _330);
    float4 _363 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7714, float3(0.0), isnan(_7714)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7714, float3(0.0), isnan(_7714)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _365 = _363.x;
    float _367 = _363.y;
    float _369 = _363.z;
    float _371 = _363.w;
    float _373 = fma(_110, 3.0, _170);
    float _375 = fma(_110, 2.0, _174);
    float _377 = 1.0 / _328;
    float _379 = fma(_110, 3.0, _174);
    float _381 = _174 * _272;
    float _383 = _198 * _272;
    float _385 = _200 * _272;
    float _387 = fma(_116, 2.0, _188);
    float _389 = abs(_318);
    float _391 = precise::max(_389, _338);
    float _393 = fma(_112, 2.0, _198);
    float _395 = abs(_332);
    float _397 = abs(_340);
    float _399 = precise::max(_395, _397);
    float _401 = fma(_116, 2.0, _200);
    float3 _7774 = float3(_381, _383, _385);
    float4 _403 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7774, float3(0.0), isnan(_7774)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7774, float3(0.0), isnan(_7774)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _405 = _403.x;
    float _407 = _403.y;
    float _409 = _403.z;
    float _411 = _403.w;
    float3 _7793 = float3(_260, _262, _264);
    float4 _413 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7793, float3(0.0), isnan(_7793)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7793, float3(0.0), isnan(_7793)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _415 = _413.x;
    float _417 = _413.y;
    float _419 = _413.z;
    float _421 = _413.w;
    float _423 = abs(_375);
    float _425 = abs(_393);
    float _427 = precise::max(_423, _425);
    float _429 = 1.0 / _391;
    float _431 = abs(_387);
    float _433 = precise::max(_431, _399);
    float _435 = _224 * _308;
    float _437 = _232 * _308;
    float _439 = _250 * _308;
    float _441 = fma(_112, 3.0, _152);
    float _443 = abs(_401);
    float _445 = precise::max(_443, _427);
    float _447 = _240 * _324;
    float _449 = 1.0 / _433;
    float _451 = _242 * _324;
    float _453 = _266 * _324;
    float _455 = fma(_116, 3.0, _162);
    float _457 = fma(_112, 3.0, _172);
    float _459 = abs(_306);
    float _461 = abs(_441);
    float _463 = precise::max(_459, _461);
    float3 _7867 = float3(_435, _437, _439);
    float4 _465 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7867, float3(0.0), isnan(_7867)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7867, float3(0.0), isnan(_7867)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _467 = _465.x;
    float _469 = _465.y;
    float _471 = _465.z;
    float _473 = _465.w;
    float _475 = _268 * _377;
    float _477 = 1.0 / _445;
    float _479 = _270 * _377;
    float _481 = _290 * _377;
    float _483 = fma(_116, 3.0, _188);
    float _485 = fma(_112, 3.0, _198);
    float _487 = abs(_455);
    float _489 = precise::max(_487, _463);
    float3 _7908 = float3(_447, _451, _453);
    float4 _491 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7908, float3(0.0), isnan(_7908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7908, float3(0.0), isnan(_7908)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _493 = _491.x;
    float _495 = _491.y;
    float _497 = _491.z;
    float _499 = _491.w;
    float _501 = abs(_373);
    float _503 = abs(_457);
    float _505 = precise::max(_501, _503);
    float _507 = 1.0 / _248;
    float _509 = fma(_116, 3.0, _200);
    float _511 = abs(_379);
    float _513 = abs(_485);
    float _515 = precise::max(_511, _513);
    float3 _7946 = float3(_475, _479, _481);
    float4 _517 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7946, float3(0.0), isnan(_7946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7946, float3(0.0), isnan(_7946)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _519 = _517.x;
    float _521 = _517.y;
    float _523 = _517.z;
    float _525 = _517.w;
    float3 _7965 = float3(_280, _286, _288);
    float4 _527 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_7965, float3(0.0), isnan(_7965)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_7965, float3(0.0), isnan(_7965)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _529 = _527.x;
    float _531 = _527.y;
    float _533 = _527.z;
    float _535 = _527.w;
    float _537 = abs(_483);
    float _539 = precise::max(_537, _505);
    float _541 = _304 * _429;
    float _543 = _310 * _429;
    float _545 = 1.0 / _489;
    float _547 = _318 * _429;
    float _549 = abs(_509);
    float _551 = precise::max(_549, _515);
    float _553 = _332 * _449;
    float _555 = _340 * _449;
    float _557 = _387 * _449;
    float _559 = _375 * _477;
    float _561 = _393 * _477;
    float _563 = 1.0 / _539;
    float3 _8022 = float3(_541, _543, _547);
    float4 _565 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8022, float3(0.0), isnan(_8022)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8022, float3(0.0), isnan(_8022)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _567 = _565.x;
    float _569 = _565.y;
    float _571 = _565.z;
    float _573 = _565.w;
    float _575 = _401 * _477;
    float3 _8044 = float3(_553, _555, _557);
    float4 _577 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8044, float3(0.0), isnan(_8044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8044, float3(0.0), isnan(_8044)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _579 = _577.x;
    float _581 = _577.y;
    float _583 = _577.z;
    float _585 = _577.w;
    float _587 = _190 * _507;
    float _589 = _192 * _507;
    float _591 = _218 * _507;
    float _593 = 1.0 / _551;
    float3 _8074 = float3(_559, _561, _575);
    float4 _595 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8074, float3(0.0), isnan(_8074)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8074, float3(0.0), isnan(_8074)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _597 = _595.x;
    float _599 = _595.y;
    float _601 = _595.z;
    float _603 = _595.w;
    float _605 = _306 * _545;
    float _607 = _441 * _545;
    float _609 = _455 * _545;
    float3 _8102 = float3(_587, _589, _591);
    float4 _611 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8102, float3(0.0), isnan(_8102)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8102, float3(0.0), isnan(_8102)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _613 = _611.x;
    float _615 = _611.y;
    float _617 = _611.z;
    float _619 = _611.w;
    float _621 = _373 * _563;
    float _623 = _457 * _563;
    float _625 = _483 * _563;
    float3 _8130 = float3(_605, _607, _609);
    float4 _627 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8130, float3(0.0), isnan(_8130)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8130, float3(0.0), isnan(_8130)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _629 = _627.x;
    float _631 = _627.y;
    float _633 = _627.z;
    float _635 = _627.w;
    float _637 = _379 * _593;
    float _639 = _485 * _593;
    float _641 = _509 * _593;
    float3 _8158 = float3(_621, _623, _625);
    float4 _643 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8158, float3(0.0), isnan(_8158)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8158, float3(0.0), isnan(_8158)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _645 = _643.x;
    float _647 = _643.y;
    float _649 = _643.z;
    float _651 = _643.w;
    float3 _8177 = float3(_637, _639, _641);
    float4 _653 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_8177, float3(0.0), isnan(_8177)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_8177, float3(0.0), isnan(_8177)), level((*spvDescriptorSet0.fp_c3)._m0[1].x)).xyzw;
    float _655 = _653.x;
    float _657 = _653.y;
    float _659 = _653.z;
    float _661 = _653.w;
    float _663 = _347 + _357;
    float _665 = _345 + _355;
    float _667 = _349 + _359;
    float _669 = _367 + _663;
    float _671 = _365 + _665;
    float _673 = _369 + _667;
    float _675 = _407 + _669;
    float _677 = _405 + _671;
    float _679 = _409 + _673;
    float _681 = _417 + _675;
    float _683 = _415 + _677;
    float _685 = _419 + _679;
    float _687 = _469 + _681;
    float _689 = _467 + _683;
    float _691 = _471 + _685;
    float _693 = _495 + _687;
    float _695 = _493 + _689;
    float _697 = _497 + _691;
    float _699 = _521 + _693;
    float _701 = _519 + _695;
    float _703 = _523 + _697;
    float _705 = _531 + _699;
    float _707 = _529 + _701;
    float _709 = _533 + _703;
    float _711 = _569 + _705;
    float _713 = _567 + _707;
    float _715 = _571 + _709;
    float _717 = _581 + _711;
    float _719 = _579 + _713;
    float _721 = _583 + _715;
    float _723 = _599 + _717;
    float _725 = _597 + _719;
    float _727 = _601 + _721;
    float _729 = _615 + _723;
    float _731 = _613 + _725;
    float _733 = _617 + _727;
    float _735 = _631 + _729;
    float _737 = _629 + _731;
    float _739 = _633 + _733;
    float _741 = _647 + _735;
    float _743 = _645 + _737;
    float _745 = _649 + _739;
    float _747 = _657 + _741;
    float _749 = _655 + _743;
    float _751 = _659 + _745;
    float _753 = fma(_747, -0.0625, _357);
    float _755 = fma(_749, -0.0625, _355);
    float _757 = fma(_751, -0.0625, _359);
    float _759 = fma(_747, -0.0625, _347);
    float _761 = _753 * _753;
    float _763 = _755 * _753;
    float _765 = _753 * _757;
    float _767 = fma(_749, -0.0625, _345);
    float _769 = fma(_751, -0.0625, _349);
    float _771 = _755 * _755;
    float _773 = _755 * _757;
    float _775 = fma(_759, _759, _761);
    float _777 = fma(_767, _759, _763);
    float _779 = fma(_759, _769, _765);
    float _781 = fma(_767, _767, _771);
    float _783 = fma(_767, _769, _773);
    float _785 = _757 * _757;
    float _787 = fma(_747, -0.0625, _367);
    float _789 = fma(_749, -0.0625, _365);
    float _791 = fma(_751, -0.0625, _369);
    float _793 = fma(_769, _769, _785);
    float _795 = fma(_787, _787, _775);
    float _797 = fma(_789, _787, _777);
    float _799 = fma(_787, _791, _779);
    float _801 = fma(_789, _789, _781);
    float _803 = fma(_789, _791, _783);
    float _805 = fma(_747, -0.0625, _407);
    float _807 = fma(_749, -0.0625, _405);
    float _809 = fma(_751, -0.0625, _409);
    float _811 = fma(_791, _791, _793);
    float _813 = fma(_805, _805, _795);
    float _815 = fma(_807, _805, _797);
    float _817 = fma(_805, _809, _799);
    float _819 = fma(_807, _807, _801);
    float _821 = fma(_807, _809, _803);
    float _823 = fma(_747, -0.0625, _417);
    float _825 = fma(_749, -0.0625, _415);
    float _827 = fma(_751, -0.0625, _419);
    float _829 = fma(_809, _809, _811);
    float _831 = fma(_823, _823, _813);
    float _833 = fma(_825, _823, _815);
    float _835 = fma(_823, _827, _817);
    float _837 = fma(_825, _825, _819);
    float _839 = fma(_825, _827, _821);
    float _841 = fma(_747, -0.0625, _469);
    float _843 = fma(_749, -0.0625, _467);
    float _845 = fma(_751, -0.0625, _471);
    float _847 = fma(_827, _827, _829);
    float _849 = fma(_841, _841, _831);
    float _851 = fma(_843, _841, _833);
    float _853 = fma(_841, _845, _835);
    float _855 = fma(_843, _843, _837);
    float _857 = fma(_843, _845, _839);
    float _859 = fma(_747, -0.0625, _495);
    float _861 = fma(_749, -0.0625, _493);
    float _863 = fma(_751, -0.0625, _497);
    float _865 = fma(_845, _845, _847);
    float _867 = fma(_859, _859, _849);
    float _869 = fma(_861, _859, _851);
    float _871 = fma(_859, _863, _853);
    float _873 = fma(_861, _861, _855);
    float _875 = fma(_861, _863, _857);
    float _877 = fma(_747, -0.0625, _521);
    float _879 = fma(_749, -0.0625, _519);
    float _881 = fma(_751, -0.0625, _523);
    float _883 = fma(_863, _863, _865);
    float _885 = fma(_877, _877, _867);
    float _887 = fma(_879, _877, _869);
    float _889 = fma(_877, _881, _871);
    float _891 = fma(_879, _879, _873);
    float _893 = fma(_879, _881, _875);
    float _895 = fma(_747, -0.0625, _531);
    float _897 = fma(_749, -0.0625, _529);
    float _899 = fma(_751, -0.0625, _533);
    float _901 = fma(_881, _881, _883);
    float _903 = fma(_895, _895, _885);
    float _905 = fma(_897, _895, _887);
    float _907 = fma(_895, _899, _889);
    float _909 = fma(_897, _897, _891);
    float _911 = fma(_897, _899, _893);
    float _913 = fma(_747, -0.0625, _569);
    float _915 = fma(_749, -0.0625, _567);
    float _917 = fma(_751, -0.0625, _571);
    float _919 = fma(_899, _899, _901);
    float _921 = fma(_913, _913, _903);
    float _923 = fma(_915, _913, _905);
    float _925 = fma(_913, _917, _907);
    float _927 = fma(_915, _915, _909);
    float _929 = fma(_915, _917, _911);
    float _931 = fma(_747, -0.0625, _581);
    float _933 = fma(_749, -0.0625, _579);
    float _935 = fma(_751, -0.0625, _583);
    float _937 = fma(_917, _917, _919);
    float _939 = fma(_931, _931, _921);
    float _941 = fma(_933, _931, _923);
    float _943 = fma(_931, _935, _925);
    float _945 = fma(_933, _933, _927);
    float _947 = fma(_933, _935, _929);
    float _949 = fma(_747, -0.0625, _599);
    float _951 = fma(_749, -0.0625, _597);
    float _953 = fma(_751, -0.0625, _601);
    float _955 = fma(_935, _935, _937);
    float _957 = fma(_949, _949, _939);
    float _959 = fma(_951, _949, _941);
    float _961 = fma(_949, _953, _943);
    float _963 = fma(_951, _951, _945);
    float _965 = fma(_951, _953, _947);
    float _967 = fma(_747, -0.0625, _615);
    float _969 = fma(_749, -0.0625, _613);
    float _971 = fma(_751, -0.0625, _617);
    float _973 = fma(_953, _953, _955);
    float _975 = fma(_967, _967, _957);
    float _977 = fma(_969, _967, _959);
    float _979 = fma(_967, _971, _961);
    float _981 = fma(_969, _969, _963);
    float _983 = fma(_969, _971, _965);
    float _985 = fma(_747, -0.0625, _631);
    float _987 = fma(_749, -0.0625, _629);
    float _989 = fma(_751, -0.0625, _633);
    float _991 = fma(_971, _971, _973);
    float _993 = fma(_985, _985, _975);
    float _995 = fma(_987, _985, _977);
    float _997 = fma(_985, _989, _979);
    float _999 = fma(_987, _987, _981);
    float _1001 = fma(_987, _989, _983);
    float _1003 = fma(_747, -0.0625, _647);
    float _1005 = fma(_749, -0.0625, _645);
    float _1007 = fma(_751, -0.0625, _649);
    float _1009 = fma(_749, -0.0625, _655);
    float _1011 = fma(_1003, _1003, _993);
    float _1013 = fma(_1005, _1003, _995);
    float _1015 = fma(_1003, _1007, _997);
    float _1017 = fma(_747, -0.0625, _657);
    float _1019 = fma(_989, _989, _991);
    float _1021 = fma(_751, -0.0625, _659);
    float _1023 = fma(_1005, _1005, _999);
    float _1025 = fma(_1017, _1017, _1011);
    float _1027 = fma(_1009, _1017, _1013);
    float _1029 = fma(_1005, _1007, _1001);
    float _1031 = fma(_1017, _1021, _1015);
    float _1033 = fma(_1009, _1009, _1023);
    float _1035 = _1025 + _1027;
    float _1037 = fma(_1007, _1007, _1019);
    float _1039 = fma(_1009, _1021, _1029);
    float _1041 = _1033 + _1027;
    float _1043 = _1031 + _1035;
    float _1045 = fma(_1021, _1021, _1037);
    float _1047 = _1031 + _1039;
    float _1049 = _1039 + _1041;
    float _1051 = _1043 * _1043;
    float _1053 = _1045 + _1047;
    float _1055 = fma(_1049, _1049, _1051);
    float _1057 = fma(_1053, _1053, _1055);
    float _1059 = rsqrt(_1057);
    float _1061 = _1043 * _1059;
    float _1063 = _1049 * _1059;
    float _1065 = _1053 * _1059;
    float _1067 = _1025 * _1061;
    float _1069 = _1027 * _1061;
    float _1071 = fma(_1027, _1063, _1067);
    float _1073 = _1031 * _1061;
    float _1075 = fma(_1033, _1063, _1069);
    float _1077 = fma(_1031, _1065, _1071);
    float _1079 = fma(_1039, _1063, _1073);
    float _1081 = fma(_1039, _1065, _1075);
    float _1083 = _1077 * _1077;
    float _1085 = fma(_1045, _1065, _1079);
    float _1087 = fma(_1081, _1081, _1083);
    float _1089 = fma(_1085, _1085, _1087);
    float _1091 = rsqrt(_1089);
    float _1093 = _1077 * _1091;
    float _1095 = _1081 * _1091;
    float _1097 = _1085 * _1091;
    float _1099 = _1025 * _1093;
    float _1101 = _1027 * _1093;
    float _1103 = _1031 * _1093;
    float _1105 = fma(_1027, _1095, _1099);
    float _1107 = fma(_1033, _1095, _1101);
    float _1109 = fma(_1039, _1095, _1103);
    float _1111 = fma(_1031, _1097, _1105);
    float _1113 = fma(_1039, _1097, _1107);
    float _1115 = fma(_1045, _1097, _1109);
    float _1117 = _1111 * _1111;
    float _1119 = fma(_1113, _1113, _1117);
    float _1121 = fma(_1115, _1115, _1119);
    float _1123 = rsqrt(_1121);
    float _1125 = _1111 * _1123;
    float _1127 = _1113 * _1123;
    float _1129 = _1115 * _1123;
    float _1131 = _1025 * _1125;
    float _1133 = _1027 * _1125;
    float _1135 = _1031 * _1125;
    float _1137 = fma(_1027, _1127, _1131);
    float _1139 = fma(_1033, _1127, _1133);
    float _1141 = fma(_1039, _1127, _1135);
    float _1143 = fma(_1031, _1129, _1137);
    float _1145 = fma(_1039, _1129, _1139);
    float _1147 = fma(_1045, _1129, _1141);
    float _1149 = _1143 * _1143;
    float _1151 = fma(_1145, _1145, _1149);
    float _1153 = fma(_1147, _1147, _1151);
    float _1155 = rsqrt(_1153);
    float _1157 = _1143 * _1155;
    float _1159 = _1145 * _1155;
    float _1161 = _1147 * _1155;
    float _1163 = _1025 * _1157;
    float _1165 = _1027 * _1157;
    float _1167 = _1031 * _1157;
    float _1169 = fma(_1027, _1159, _1163);
    float _1171 = fma(_1033, _1159, _1165);
    float _1173 = fma(_1039, _1159, _1167);
    float _1175 = fma(_1031, _1161, _1169);
    float _1177 = fma(_1039, _1161, _1171);
    float _1179 = fma(_1045, _1161, _1173);
    float _1181 = _1175 * _1175;
    float _1183 = fma(_1177, _1177, _1181);
    float _1185 = fma(_1179, _1179, _1183);
    float _1187 = rsqrt(_1185);
    float _1189 = _1175 * _1187;
    float _1191 = _1177 * _1187;
    float _1193 = _1179 * _1187;
    float _1195 = _1025 * _1189;
    float _1197 = _1027 * _1189;
    float _1199 = _1031 * _1189;
    float _1201 = fma(_1027, _1191, _1195);
    float _1203 = fma(_1033, _1191, _1197);
    float _1205 = fma(_1039, _1191, _1199);
    float _1207 = fma(_1031, _1193, _1201);
    float _1209 = fma(_1039, _1193, _1203);
    float _1211 = fma(_1045, _1193, _1205);
    float _1213 = _1207 * _1207;
    float _1215 = fma(_1209, _1209, _1213);
    float _1217 = fma(_1211, _1211, _1215);
    float _1219 = rsqrt(_1217);
    float _1221 = _1207 * _1219;
    float _1223 = _1209 * _1219;
    float _1225 = _1211 * _1219;
    float _1227 = _1025 * _1221;
    float _1229 = _1027 * _1221;
    float _1231 = _1031 * _1221;
    float _1233 = fma(_1027, _1223, _1227);
    float _1235 = fma(_1033, _1223, _1229);
    float _1237 = fma(_1039, _1223, _1231);
    float _1239 = fma(_1031, _1225, _1233);
    float _1241 = fma(_1039, _1225, _1235);
    float _1243 = fma(_1045, _1225, _1237);
    float _1245 = _1239 * _1239;
    float _1247 = fma(_1241, _1241, _1245);
    float _1249 = fma(_1243, _1243, _1247);
    float _1251 = rsqrt(_1249);
    float _1253 = _1239 * _1251;
    float _1255 = _1241 * _1251;
    float _1257 = _1243 * _1251;
    float _1259 = _1025 * _1253;
    float _1261 = _1027 * _1253;
    float _1263 = fma(_1027, _1255, _1259);
    float _1265 = _1031 * _1253;
    float _1267 = fma(_1033, _1255, _1261);
    float _1269 = fma(_1031, _1257, _1263);
    float _1271 = fma(_1039, _1255, _1265);
    float _1273 = fma(_1039, _1257, _1267);
    float _1275 = _1269 * _1269;
    float _1277 = fma(_1045, _1257, _1271);
    float _1279 = fma(_1273, _1273, _1275);
    float _1281 = fma(_1277, _1277, _1279);
    float _1283 = rsqrt(_1281);
    float _1285 = _1269 * _1283;
    float _1287 = _1273 * _1283;
    float _1289 = _1277 * _1283;
    float _1291 = _347 * _1285;
    float _1293 = _357 * _1285;
    float _1295 = _367 * _1285;
    float _1297 = fma(_345, _1287, _1291);
    float _1299 = fma(_355, _1287, _1293);
    float _1301 = fma(_365, _1287, _1295);
    float _1303 = fma(_349, _1289, _1297);
    float _1305 = fma(_359, _1289, _1299);
    float _1307 = fma(_369, _1289, _1301);
    bool _1311 = _1303 >= _1305;
    bool _1313 = isnan(_1303);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan(_1305);
    bool _1319 = _1315 || _1317;
    float _1321 = _252;
    float _1323 = _1301;
    float _1325 = _1033;
    float _1327 = _1297;
    float _1329 = _1283;
    float _1331 = _1255;
    float _1333 = _1243;
    float _1335 = _1253;
    float _1337 = _1303;
    float _1339 = _1227;
    float _1341 = _1307;
    float _1343 = _1307;
    float _1345 = _1285;
    float _1347 = _1287;
    spvUnsafeArray<uint, 4> _24;
    if (!_1319)
    {
        _1321 = _355;
    }
    float _1349 = _1321;
    float _1351 = _1349;
    float _1353 = _1349;
    if (!_1319)
    {
        _1323 = _357;
    }
    float _1355 = _1323;
    float _1357 = _1355;
    float _1359 = _1355;
    if (!_1319)
    {
        _1325 = _359;
    }
    float _1361 = _1325;
    float _1363 = _1361;
    float _1365 = _1361;
    if (!_1319)
    {
        _1327 = _1303;
    }
    float _1367 = _1327;
    float _1369 = _1367;
    float _1371 = _1367;
    if (!_1319)
    {
        _1329 = _1305;
    }
    float _1373 = _1329;
    float _1375 = _1373;
    float _1377 = _1373;
    if (!_1319)
    {
        _1331 = _345;
    }
    float _1379 = _1331;
    float _1381 = _1379;
    float _1383 = _1379;
    if (!_1319)
    {
        _1333 = _347;
    }
    float _1385 = _1333;
    float _1387 = _1385;
    float _1389 = _1385;
    if (!_1319)
    {
        _1335 = _349;
    }
    float _1391 = _1335;
    bool _1393 = !_1319;
    float _1395 = _1391;
    float _1397 = _1391;
    if (!_1393)
    {
        bool _1399 = _1303 > _1305;
        if (!_1399)
        {
            _1369 = _1303;
        }
        float _1401 = _1369;
        float _1403 = _1401;
        if (!_1399)
        {
            _1375 = _1303;
        }
        float _1405 = _1375;
        float _1407 = _1405;
        if (!_1399)
        {
            _1381 = _345;
        }
        float _1409 = _1381;
        float _1411 = _1409;
        if (!_1399)
        {
            _1387 = _347;
        }
        float _1413 = _1387;
        float _1415 = _1413;
        if (!_1399)
        {
            _1395 = _349;
        }
        float _1417 = _1395;
        float _1419 = _1417;
        if (!_1399)
        {
            _1351 = _345;
        }
        float _1421 = _1351;
        float _1423 = _1421;
        if (!_1399)
        {
            _1357 = _347;
        }
        float _1425 = _1357;
        float _1427 = _1425;
        if (!_1399)
        {
            _1363 = _349;
        }
        float _1429 = _1363;
        _1365 = _1429;
        if (_1399)
        {
            _1403 = _1305;
        }
        float _1431 = _1403;
        _1371 = _1431;
        if (_1399)
        {
            _1407 = _1303;
        }
        float _1433 = _1407;
        _1377 = _1433;
        if (_1399)
        {
            _1411 = _355;
        }
        float _1435 = _1411;
        _1383 = _1435;
        if (_1399)
        {
            _1415 = _357;
        }
        float _1437 = _1415;
        _1389 = _1437;
        if (_1399)
        {
            _1419 = _359;
        }
        float _1439 = _1419;
        _1397 = _1439;
        if (_1399)
        {
            _1423 = _345;
        }
        float _1441 = _1423;
        _1353 = _1441;
        if (_1399)
        {
            _1427 = _347;
        }
        float _1443 = _1427;
        _1359 = _1443;
        if (_1399)
        {
            _1365 = _349;
        }
    }
    float _1445 = _1377;
    float _1447 = _1371;
    float _1449 = _1353;
    float _1451 = _1359;
    float _1453 = _1365;
    float _1455 = _1383;
    float _1457 = _1389;
    float _1459 = _1397;
    bool _1461 = _1445 >= _1307;
    bool _1463 = isnan(_1445);
    bool _1465 = _1461 || _1463;
    bool _1467 = isnan(_1307);
    bool _1469 = _1465 || _1467;
    float _1471 = _407 * _1285;
    float _1473 = fma(_405, _1287, _1471);
    float _1475 = fma(_409, _1289, _1473);
    float _1477 = _1473;
    float _1479 = _1447;
    float _1481 = _1455;
    float _1483 = _1457;
    float _1485 = _1447;
    float _1487 = _1455;
    float _1489 = _1457;
    float _1491 = _1459;
    float _1493 = _1445;
    float _1495 = _1453;
    float _1497 = _1475;
    float _1499 = _1475;
    if (!_1469)
    {
        _1337 = _365;
    }
    float _1501 = _1337;
    float _1503 = _1501;
    float _1505 = _1501;
    if (!_1469)
    {
        _1477 = _367;
    }
    float _1507 = _1477;
    float _1509 = _1507;
    float _1511 = _1507;
    if (!_1469)
    {
        _1339 = _369;
    }
    float _1513 = _1339;
    bool _1515 = !_1469;
    float _1517 = _1513;
    float _1519 = _1513;
    if (!_1515)
    {
        bool _1521 = _1447 > _1307;
        if (_1521)
        {
            _1479 = _1307;
        }
        float _1523 = _1479;
        _1485 = _1523;
        if (!_1521)
        {
            _1503 = _1449;
        }
        float _1525 = _1503;
        float _1527 = _1525;
        if (!_1521)
        {
            _1509 = _1451;
        }
        float _1529 = _1509;
        float _1531 = _1529;
        if (!_1521)
        {
            _1517 = _1453;
        }
        float _1533 = _1517;
        float _1535 = _1533;
        if (!_1521)
        {
            _1341 = _1445;
        }
        float _1537 = _1341;
        float _1539 = _1537;
        if (_1521)
        {
            _1527 = _1449;
        }
        float _1541 = _1527;
        _1505 = _1541;
        if (_1521)
        {
            _1531 = _1451;
        }
        float _1543 = _1531;
        _1511 = _1543;
        if (_1521)
        {
            _1535 = _1453;
        }
        float _1545 = _1535;
        _1519 = _1545;
        if (_1521)
        {
            _1539 = _1445;
        }
        float _1547 = _1539;
        _1343 = _1547;
        if (_1521)
        {
            _1481 = _365;
        }
        float _1549 = _1481;
        _1487 = _1549;
        if (_1521)
        {
            _1483 = _367;
        }
        float _1551 = _1483;
        _1489 = _1551;
        if (_1521)
        {
            _1491 = _369;
        }
    }
    float _1553 = _1343;
    float _1555 = _1485;
    float _1557 = _1505;
    float _1559 = _1511;
    float _1561 = _1519;
    float _1563 = _1487;
    float _1565 = _1489;
    float _1567 = _1491;
    bool _1569 = _1553 >= _1475;
    bool _1571 = isnan(_1553);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan(_1475);
    bool _1577 = _1573 || _1575;
    float _1579 = _417 * _1285;
    float _1581 = fma(_415, _1287, _1579);
    float _1583 = fma(_419, _1289, _1581);
    float _1585 = _1581;
    float _1587 = _1555;
    float _1589 = _1563;
    float _1591 = _1565;
    float _1593 = _1555;
    float _1595 = _1563;
    float _1597 = _1565;
    float _1599 = _1567;
    float _1601 = _1557;
    float _1603 = _1561;
    float _1605 = _1583;
    float _1607 = _1583;
    if (!_1577)
    {
        _1493 = _405;
    }
    float _1609 = _1493;
    float _1611 = _1609;
    float _1613 = _1609;
    if (!_1577)
    {
        _1495 = _407;
    }
    float _1615 = _1495;
    float _1617 = _1615;
    float _1619 = _1615;
    if (!_1577)
    {
        _1585 = _409;
    }
    float _1621 = _1585;
    bool _1623 = !_1577;
    float _1625 = _1621;
    float _1627 = _1621;
    if (!_1623)
    {
        bool _1629 = _1555 > _1475;
        if (_1629)
        {
            _1587 = _1475;
        }
        float _1631 = _1587;
        _1593 = _1631;
        if (!_1629)
        {
            _1611 = _1557;
        }
        float _1633 = _1611;
        float _1635 = _1633;
        if (!_1629)
        {
            _1617 = _1559;
        }
        float _1637 = _1617;
        float _1639 = _1637;
        if (!_1629)
        {
            _1625 = _1561;
        }
        float _1641 = _1625;
        float _1643 = _1641;
        if (!_1629)
        {
            _1497 = _1553;
        }
        float _1645 = _1497;
        float _1647 = _1645;
        if (_1629)
        {
            _1635 = _1557;
        }
        float _1649 = _1635;
        _1613 = _1649;
        if (_1629)
        {
            _1639 = _1559;
        }
        float _1651 = _1639;
        _1619 = _1651;
        if (_1629)
        {
            _1643 = _1561;
        }
        float _1653 = _1643;
        _1627 = _1653;
        if (_1629)
        {
            _1647 = _1553;
        }
        float _1655 = _1647;
        _1499 = _1655;
        if (_1629)
        {
            _1589 = _405;
        }
        float _1657 = _1589;
        _1595 = _1657;
        if (_1629)
        {
            _1591 = _407;
        }
        float _1659 = _1591;
        _1597 = _1659;
        if (_1629)
        {
            _1599 = _409;
        }
    }
    float _1661 = _1499;
    float _1663 = _1593;
    float _1665 = _1613;
    float _1667 = _1619;
    float _1669 = _1627;
    float _1671 = _1595;
    float _1673 = _1597;
    float _1675 = _1599;
    bool _1677 = _1661 >= _1583;
    bool _1679 = isnan(_1661);
    bool _1681 = _1677 || _1679;
    bool _1683 = isnan(_1583);
    bool _1685 = _1681 || _1683;
    float _1687 = _469 * _1285;
    float _1689 = fma(_467, _1287, _1687);
    float _1691 = fma(_471, _1289, _1689);
    float _1693 = _1689;
    float _1695 = _1663;
    float _1697 = _1671;
    float _1699 = _1673;
    float _1701 = _1663;
    float _1703 = _1671;
    float _1705 = _1673;
    float _1707 = _1675;
    float _1709 = _1665;
    float _1711 = _1667;
    float _1713 = _1691;
    float _1715 = _1691;
    float _1717 = _1661;
    if (!_1685)
    {
        _1601 = _415;
    }
    float _1719 = _1601;
    float _1721 = _1719;
    float _1723 = _1719;
    if (!_1685)
    {
        _1693 = _417;
    }
    float _1725 = _1693;
    float _1727 = _1725;
    float _1729 = _1725;
    if (!_1685)
    {
        _1603 = _419;
    }
    float _1731 = _1603;
    bool _1733 = !_1685;
    float _1735 = _1731;
    float _1737 = _1731;
    if (!_1733)
    {
        bool _1739 = _1663 > _1583;
        if (_1739)
        {
            _1695 = _1583;
        }
        float _1741 = _1695;
        _1701 = _1741;
        if (!_1739)
        {
            _1721 = _1665;
        }
        float _1743 = _1721;
        float _1745 = _1743;
        if (!_1739)
        {
            _1727 = _1667;
        }
        float _1747 = _1727;
        float _1749 = _1747;
        if (!_1739)
        {
            _1735 = _1669;
        }
        float _1751 = _1735;
        float _1753 = _1751;
        if (!_1739)
        {
            _1605 = _1661;
        }
        float _1755 = _1605;
        float _1757 = _1755;
        if (_1739)
        {
            _1745 = _1665;
        }
        float _1759 = _1745;
        _1723 = _1759;
        if (_1739)
        {
            _1749 = _1667;
        }
        float _1761 = _1749;
        _1729 = _1761;
        if (_1739)
        {
            _1753 = _1669;
        }
        float _1763 = _1753;
        _1737 = _1763;
        if (_1739)
        {
            _1757 = _1661;
        }
        float _1765 = _1757;
        _1607 = _1765;
        if (_1739)
        {
            _1697 = _415;
        }
        float _1767 = _1697;
        _1703 = _1767;
        if (_1739)
        {
            _1699 = _417;
        }
        float _1769 = _1699;
        _1705 = _1769;
        if (_1739)
        {
            _1707 = _419;
        }
    }
    float _1771 = _1607;
    float _1773 = _1701;
    float _1775 = _1723;
    float _1777 = _1729;
    float _1779 = _1737;
    float _1781 = _1703;
    float _1783 = _1705;
    float _1785 = _1707;
    bool _1787 = _1771 >= _1691;
    bool _1789 = isnan(_1771);
    bool _1791 = _1787 || _1789;
    bool _1793 = isnan(_1691);
    bool _1795 = _1791 || _1793;
    float _1797 = _495 * _1285;
    float _1799 = fma(_493, _1287, _1797);
    float _1801 = fma(_497, _1289, _1799);
    float _1803 = _1799;
    float _1805 = _1773;
    float _1807 = _1781;
    float _1809 = _1783;
    float _1811 = _1773;
    float _1813 = _1781;
    float _1815 = _1783;
    float _1817 = _1785;
    float _1819 = _1779;
    float _1821 = _1771;
    float _1823 = _1801;
    float _1825 = _1801;
    if (!_1795)
    {
        _1709 = _467;
    }
    float _1827 = _1709;
    float _1829 = _1827;
    float _1831 = _1827;
    if (!_1795)
    {
        _1711 = _469;
    }
    float _1833 = _1711;
    float _1835 = _1833;
    float _1837 = _1833;
    if (!_1795)
    {
        _1803 = _471;
    }
    float _1839 = _1803;
    bool _1841 = !_1795;
    float _1843 = _1839;
    float _1845 = _1839;
    if (!_1841)
    {
        bool _1847 = _1773 > _1691;
        if (_1847)
        {
            _1805 = _1691;
        }
        float _1849 = _1805;
        _1811 = _1849;
        if (!_1847)
        {
            _1829 = _1775;
        }
        float _1851 = _1829;
        float _1853 = _1851;
        if (!_1847)
        {
            _1835 = _1777;
        }
        float _1855 = _1835;
        float _1857 = _1855;
        if (!_1847)
        {
            _1843 = _1779;
        }
        float _1859 = _1843;
        float _1861 = _1859;
        if (!_1847)
        {
            _1713 = _1771;
        }
        float _1863 = _1713;
        float _1865 = _1863;
        if (_1847)
        {
            _1853 = _1775;
        }
        float _1867 = _1853;
        _1831 = _1867;
        if (_1847)
        {
            _1857 = _1777;
        }
        float _1869 = _1857;
        _1837 = _1869;
        if (_1847)
        {
            _1861 = _1779;
        }
        float _1871 = _1861;
        _1845 = _1871;
        if (_1847)
        {
            _1865 = _1771;
        }
        float _1873 = _1865;
        _1715 = _1873;
        if (_1847)
        {
            _1807 = _467;
        }
        float _1875 = _1807;
        _1813 = _1875;
        if (_1847)
        {
            _1809 = _469;
        }
        float _1877 = _1809;
        _1815 = _1877;
        if (_1847)
        {
            _1817 = _471;
        }
    }
    float _1879 = _1715;
    float _1881 = _1811;
    float _1883 = _1831;
    float _1885 = _1837;
    float _1887 = _1845;
    float _1889 = _1813;
    float _1891 = _1815;
    float _1893 = _1817;
    bool _1895 = _1879 >= _1801;
    bool _1897 = isnan(_1879);
    bool _1899 = _1895 || _1897;
    bool _1901 = isnan(_1801);
    bool _1903 = _1899 || _1901;
    float _1905 = _521 * _1285;
    float _1907 = fma(_519, _1287, _1905);
    float _1909 = fma(_523, _1289, _1907);
    float _1911 = _1881;
    float _1913 = _1889;
    float _1915 = _1891;
    float _1917 = _1881;
    float _1919 = _1889;
    float _1921 = _1891;
    float _1923 = _1893;
    float _1925 = _1883;
    float _1927 = _1885;
    float _1929 = _1909;
    float _1931 = _1909;
    if (!_1903)
    {
        _1819 = _493;
    }
    float _1933 = _1819;
    float _1935 = _1933;
    float _1937 = _1933;
    if (!_1903)
    {
        _1717 = _495;
    }
    float _1939 = _1717;
    float _1941 = _1939;
    float _1943 = _1939;
    if (!_1903)
    {
        _1821 = _497;
    }
    float _1945 = _1821;
    bool _1947 = !_1903;
    float _1949 = _1945;
    float _1951 = _1945;
    if (!_1947)
    {
        bool _1953 = _1881 > _1801;
        if (_1953)
        {
            _1911 = _1801;
        }
        float _1955 = _1911;
        _1917 = _1955;
        if (!_1953)
        {
            _1935 = _1883;
        }
        float _1957 = _1935;
        float _1959 = _1957;
        if (!_1953)
        {
            _1941 = _1885;
        }
        float _1961 = _1941;
        float _1963 = _1961;
        if (!_1953)
        {
            _1949 = _1887;
        }
        float _1965 = _1949;
        float _1967 = _1965;
        if (!_1953)
        {
            _1823 = _1879;
        }
        float _1969 = _1823;
        float _1971 = _1969;
        if (_1953)
        {
            _1959 = _1883;
        }
        float _1973 = _1959;
        _1937 = _1973;
        if (_1953)
        {
            _1963 = _1885;
        }
        float _1975 = _1963;
        _1943 = _1975;
        if (_1953)
        {
            _1967 = _1887;
        }
        float _1977 = _1967;
        _1951 = _1977;
        if (_1953)
        {
            _1971 = _1879;
        }
        float _1979 = _1971;
        _1825 = _1979;
        if (_1953)
        {
            _1913 = _493;
        }
        float _1981 = _1913;
        _1919 = _1981;
        if (_1953)
        {
            _1915 = _495;
        }
        float _1983 = _1915;
        _1921 = _1983;
        if (_1953)
        {
            _1923 = _497;
        }
    }
    float _1985 = _1825;
    float _1987 = _1917;
    float _1989 = _1937;
    float _1991 = _1943;
    float _1993 = _1951;
    float _1995 = _1919;
    float _1997 = _1921;
    float _1999 = _1923;
    bool _2001 = _1985 >= _1909;
    bool _2003 = isnan(_1985);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan(_1909);
    bool _2009 = _2005 || _2007;
    float _2011 = _531 * _1285;
    float _2013 = fma(_529, _1287, _2011);
    float _2015 = fma(_533, _1289, _2013);
    float _2017 = _2013;
    float _2019 = _1987;
    float _2021 = _1995;
    float _2023 = _1997;
    float _2025 = _1987;
    float _2027 = _1995;
    float _2029 = _1997;
    float _2031 = _1999;
    float _2033 = _1993;
    float _2035 = _1989;
    float _2037 = _2015;
    float _2039 = _2015;
    if (!_2009)
    {
        _1925 = _519;
    }
    float _2041 = _1925;
    float _2043 = _2041;
    float _2045 = _2041;
    if (!_2009)
    {
        _1927 = _521;
    }
    float _2047 = _1927;
    float _2049 = _2047;
    float _2051 = _2047;
    if (!_2009)
    {
        _2017 = _523;
    }
    float _2053 = _2017;
    bool _2055 = !_2009;
    float _2057 = _2053;
    float _2059 = _2053;
    if (!_2055)
    {
        bool _2061 = _1987 > _1909;
        if (_2061)
        {
            _2019 = _1909;
        }
        float _2063 = _2019;
        _2025 = _2063;
        if (!_2061)
        {
            _2043 = _1989;
        }
        float _2065 = _2043;
        float _2067 = _2065;
        if (!_2061)
        {
            _2049 = _1991;
        }
        float _2069 = _2049;
        float _2071 = _2069;
        if (!_2061)
        {
            _2057 = _1993;
        }
        float _2073 = _2057;
        float _2075 = _2073;
        if (!_2061)
        {
            _1929 = _1985;
        }
        float _2077 = _1929;
        float _2079 = _2077;
        if (_2061)
        {
            _2067 = _1989;
        }
        float _2081 = _2067;
        _2045 = _2081;
        if (_2061)
        {
            _2071 = _1991;
        }
        float _2083 = _2071;
        _2051 = _2083;
        if (_2061)
        {
            _2075 = _1993;
        }
        float _2085 = _2075;
        _2059 = _2085;
        if (_2061)
        {
            _2079 = _1985;
        }
        float _2087 = _2079;
        _1931 = _2087;
        if (_2061)
        {
            _2021 = _519;
        }
        float _2089 = _2021;
        _2027 = _2089;
        if (_2061)
        {
            _2023 = _521;
        }
        float _2091 = _2023;
        _2029 = _2091;
        if (_2061)
        {
            _2031 = _523;
        }
    }
    float _2093 = _1931;
    float _2095 = _2025;
    float _2097 = _2045;
    float _2099 = _2051;
    float _2101 = _2059;
    float _2103 = _2027;
    float _2105 = _2029;
    float _2107 = _2031;
    bool _2109 = _2093 >= _2015;
    bool _2111 = isnan(_2093);
    bool _2113 = _2109 || _2111;
    bool _2115 = isnan(_2015);
    bool _2117 = _2113 || _2115;
    float _2119 = _569 * _1285;
    float _2121 = fma(_567, _1287, _2119);
    float _2123 = fma(_571, _1289, _2121);
    float _2125 = _2121;
    float _2127 = _2095;
    float _2129 = _2103;
    float _2131 = _2105;
    float _2133 = _2095;
    float _2135 = _2103;
    float _2137 = _2105;
    float _2139 = _2107;
    float _2141 = _2099;
    float _2143 = _2097;
    float _2145 = _2123;
    float _2147 = _2123;
    if (!_2117)
    {
        _2033 = _529;
    }
    float _2149 = _2033;
    float _2151 = _2149;
    float _2153 = _2149;
    if (!_2117)
    {
        _2125 = _531;
    }
    float _2155 = _2125;
    float _2157 = _2155;
    float _2159 = _2155;
    if (!_2117)
    {
        _2035 = _533;
    }
    float _2161 = _2035;
    bool _2163 = !_2117;
    float _2165 = _2161;
    float _2167 = _2161;
    if (!_2163)
    {
        bool _2169 = _2095 > _2015;
        if (_2169)
        {
            _2127 = _2015;
        }
        float _2171 = _2127;
        _2133 = _2171;
        if (!_2169)
        {
            _2151 = _2097;
        }
        float _2173 = _2151;
        float _2175 = _2173;
        if (!_2169)
        {
            _2157 = _2099;
        }
        float _2177 = _2157;
        float _2179 = _2177;
        if (!_2169)
        {
            _2165 = _2101;
        }
        float _2181 = _2165;
        float _2183 = _2181;
        if (!_2169)
        {
            _2037 = _2093;
        }
        float _2185 = _2037;
        float _2187 = _2185;
        if (_2169)
        {
            _2175 = _2097;
        }
        float _2189 = _2175;
        _2153 = _2189;
        if (_2169)
        {
            _2179 = _2099;
        }
        float _2191 = _2179;
        _2159 = _2191;
        if (_2169)
        {
            _2183 = _2101;
        }
        float _2193 = _2183;
        _2167 = _2193;
        if (_2169)
        {
            _2187 = _2093;
        }
        float _2195 = _2187;
        _2039 = _2195;
        if (_2169)
        {
            _2129 = _529;
        }
        float _2197 = _2129;
        _2135 = _2197;
        if (_2169)
        {
            _2131 = _531;
        }
        float _2199 = _2131;
        _2137 = _2199;
        if (_2169)
        {
            _2139 = _533;
        }
    }
    float _2201 = _2039;
    float _2203 = _2133;
    float _2205 = _2153;
    float _2207 = _2159;
    float _2209 = _2167;
    float _2211 = _2135;
    float _2213 = _2137;
    float _2215 = _2139;
    bool _2217 = _2201 >= _2123;
    bool _2219 = isnan(_2201);
    bool _2221 = _2217 || _2219;
    bool _2223 = isnan(_2123);
    bool _2225 = _2221 || _2223;
    float _2227 = _581 * _1285;
    float _2229 = fma(_579, _1287, _2227);
    float _2231 = fma(_583, _1289, _2229);
    float _2233 = _2229;
    float _2235 = _2203;
    float _2237 = _2211;
    float _2239 = _2213;
    float _2241 = _2203;
    float _2243 = _2211;
    float _2245 = _2213;
    float _2247 = _2215;
    float _2249 = _2209;
    float _2251 = _2201;
    float _2253 = _2231;
    float _2255 = _2231;
    if (!_2225)
    {
        _2233 = _567;
    }
    float _2257 = _2233;
    float _2259 = _2257;
    float _2261 = _2257;
    if (!_2225)
    {
        _2141 = _569;
    }
    float _2263 = _2141;
    float _2265 = _2263;
    float _2267 = _2263;
    if (!_2225)
    {
        _2143 = _571;
    }
    float _2269 = _2143;
    bool _2271 = !_2225;
    float _2273 = _2269;
    float _2275 = _2269;
    if (!_2271)
    {
        bool _2277 = _2203 > _2123;
        if (_2277)
        {
            _2235 = _2123;
        }
        float _2279 = _2235;
        _2241 = _2279;
        if (!_2277)
        {
            _2259 = _2205;
        }
        float _2281 = _2259;
        float _2283 = _2281;
        if (!_2277)
        {
            _2265 = _2207;
        }
        float _2285 = _2265;
        float _2287 = _2285;
        if (!_2277)
        {
            _2273 = _2209;
        }
        float _2289 = _2273;
        float _2291 = _2289;
        if (!_2277)
        {
            _2145 = _2201;
        }
        float _2293 = _2145;
        float _2295 = _2293;
        if (_2277)
        {
            _2283 = _2205;
        }
        float _2297 = _2283;
        _2261 = _2297;
        if (_2277)
        {
            _2287 = _2207;
        }
        float _2299 = _2287;
        _2267 = _2299;
        if (_2277)
        {
            _2291 = _2209;
        }
        float _2301 = _2291;
        _2275 = _2301;
        if (_2277)
        {
            _2295 = _2201;
        }
        float _2303 = _2295;
        _2147 = _2303;
        if (_2277)
        {
            _2237 = _567;
        }
        float _2305 = _2237;
        _2243 = _2305;
        if (_2277)
        {
            _2239 = _569;
        }
        float _2307 = _2239;
        _2245 = _2307;
        if (_2277)
        {
            _2247 = _571;
        }
    }
    float _2309 = _2147;
    float _2311 = _2241;
    float _2313 = _2261;
    float _2315 = _2267;
    float _2317 = _2275;
    float _2319 = _2243;
    float _2321 = _2245;
    float _2323 = _2247;
    bool _2325 = _2309 >= _2231;
    bool _2327 = isnan(_2309);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(_2231);
    bool _2333 = _2329 || _2331;
    float _2335 = _599 * _1285;
    float _2337 = fma(_597, _1287, _2335);
    float _2339 = fma(_601, _1289, _2337);
    float _2341 = _2337;
    float _2343 = _2311;
    float _2345 = _2319;
    float _2347 = _2321;
    float _2349 = _2311;
    float _2351 = _2319;
    float _2353 = _2321;
    float _2355 = _2323;
    float _2357 = _2315;
    float _2359 = _2317;
    float _2361 = _2339;
    float _2363 = _2339;
    if (!_2333)
    {
        _2249 = _579;
    }
    float _2365 = _2249;
    float _2367 = _2365;
    float _2369 = _2365;
    if (!_2333)
    {
        _2341 = _581;
    }
    float _2371 = _2341;
    float _2373 = _2371;
    float _2375 = _2371;
    if (!_2333)
    {
        _2251 = _583;
    }
    float _2377 = _2251;
    bool _2379 = !_2333;
    float _2381 = _2377;
    float _2383 = _2377;
    if (!_2379)
    {
        bool _2385 = _2311 > _2231;
        if (_2385)
        {
            _2343 = _2231;
        }
        float _2387 = _2343;
        _2349 = _2387;
        if (!_2385)
        {
            _2367 = _2313;
        }
        float _2389 = _2367;
        float _2391 = _2389;
        if (!_2385)
        {
            _2373 = _2315;
        }
        float _2393 = _2373;
        float _2395 = _2393;
        if (!_2385)
        {
            _2381 = _2317;
        }
        float _2397 = _2381;
        float _2399 = _2397;
        if (!_2385)
        {
            _2253 = _2309;
        }
        float _2401 = _2253;
        float _2403 = _2401;
        if (_2385)
        {
            _2391 = _2313;
        }
        float _2405 = _2391;
        _2369 = _2405;
        if (_2385)
        {
            _2395 = _2315;
        }
        float _2407 = _2395;
        _2375 = _2407;
        if (_2385)
        {
            _2399 = _2317;
        }
        float _2409 = _2399;
        _2383 = _2409;
        if (_2385)
        {
            _2403 = _2309;
        }
        float _2411 = _2403;
        _2255 = _2411;
        if (_2385)
        {
            _2345 = _579;
        }
        float _2413 = _2345;
        _2351 = _2413;
        if (_2385)
        {
            _2347 = _581;
        }
        float _2415 = _2347;
        _2353 = _2415;
        if (_2385)
        {
            _2355 = _583;
        }
    }
    float _2417 = _2255;
    float _2419 = _2349;
    float _2421 = _2369;
    float _2423 = _2375;
    float _2425 = _2383;
    float _2427 = _2351;
    float _2429 = _2353;
    float _2431 = _2355;
    bool _2433 = _2417 >= _2339;
    bool _2435 = isnan(_2417);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan(_2339);
    bool _2441 = _2437 || _2439;
    float _2443 = _615 * _1285;
    float _2445 = fma(_613, _1287, _2443);
    float _2447 = fma(_617, _1289, _2445);
    float _2449 = _2445;
    float _2451 = _2419;
    float _2453 = _2427;
    float _2455 = _2429;
    float _2457 = _2419;
    float _2459 = _2427;
    float _2461 = _2429;
    float _2463 = _2431;
    float _2465 = _2421;
    float _2467 = _2425;
    float _2469 = _2447;
    float _2471 = _2447;
    if (!_2441)
    {
        _2449 = _597;
    }
    float _2473 = _2449;
    float _2475 = _2473;
    float _2477 = _2473;
    if (!_2441)
    {
        _2357 = _599;
    }
    float _2479 = _2357;
    float _2481 = _2479;
    float _2483 = _2479;
    if (!_2441)
    {
        _2359 = _601;
    }
    float _2485 = _2359;
    bool _2487 = !_2441;
    float _2489 = _2485;
    float _2491 = _2485;
    if (!_2487)
    {
        bool _2493 = _2419 > _2339;
        if (_2493)
        {
            _2451 = _2339;
        }
        float _2495 = _2451;
        _2457 = _2495;
        if (!_2493)
        {
            _2475 = _2421;
        }
        float _2497 = _2475;
        float _2499 = _2497;
        if (!_2493)
        {
            _2481 = _2423;
        }
        float _2501 = _2481;
        float _2503 = _2501;
        if (!_2493)
        {
            _2489 = _2425;
        }
        float _2505 = _2489;
        float _2507 = _2505;
        if (!_2493)
        {
            _2361 = _2417;
        }
        float _2509 = _2361;
        float _2511 = _2509;
        if (_2493)
        {
            _2499 = _2421;
        }
        float _2513 = _2499;
        _2477 = _2513;
        if (_2493)
        {
            _2503 = _2423;
        }
        float _2515 = _2503;
        _2483 = _2515;
        if (_2493)
        {
            _2507 = _2425;
        }
        float _2517 = _2507;
        _2491 = _2517;
        if (_2493)
        {
            _2511 = _2417;
        }
        float _2519 = _2511;
        _2363 = _2519;
        if (_2493)
        {
            _2453 = _597;
        }
        float _2521 = _2453;
        _2459 = _2521;
        if (_2493)
        {
            _2455 = _599;
        }
        float _2523 = _2455;
        _2461 = _2523;
        if (_2493)
        {
            _2463 = _601;
        }
    }
    float _2525 = _2363;
    float _2527 = _2457;
    float _2529 = _2477;
    float _2531 = _2483;
    float _2533 = _2491;
    float _2535 = _2459;
    float _2537 = _2461;
    float _2539 = _2463;
    bool _2541 = _2525 >= _2447;
    bool _2543 = isnan(_2525);
    bool _2545 = _2541 || _2543;
    bool _2547 = isnan(_2447);
    bool _2549 = _2545 || _2547;
    float _2551 = _631 * _1285;
    float _2553 = fma(_629, _1287, _2551);
    float _2555 = fma(_633, _1289, _2553);
    float _2557 = _2553;
    float _2559 = _2527;
    float _2561 = _2535;
    float _2563 = _2537;
    float _2565 = _2527;
    float _2567 = _2535;
    float _2569 = _2537;
    float _2571 = _2539;
    float _2573 = _2531;
    float _2575 = _2533;
    float _2577 = _2555;
    float _2579 = _2555;
    if (!_2549)
    {
        _2465 = _613;
    }
    float _2581 = _2465;
    float _2583 = _2581;
    float _2585 = _2581;
    if (!_2549)
    {
        _2557 = _615;
    }
    float _2587 = _2557;
    float _2589 = _2587;
    float _2591 = _2587;
    if (!_2549)
    {
        _2467 = _617;
    }
    float _2593 = _2467;
    bool _2595 = !_2549;
    float _2597 = _2593;
    float _2599 = _2593;
    if (!_2595)
    {
        bool _2601 = _2527 > _2447;
        if (_2601)
        {
            _2559 = _2447;
        }
        float _2603 = _2559;
        _2565 = _2603;
        if (!_2601)
        {
            _2583 = _2529;
        }
        float _2605 = _2583;
        float _2607 = _2605;
        if (!_2601)
        {
            _2589 = _2531;
        }
        float _2609 = _2589;
        float _2611 = _2609;
        if (!_2601)
        {
            _2597 = _2533;
        }
        float _2613 = _2597;
        float _2615 = _2613;
        if (!_2601)
        {
            _2469 = _2525;
        }
        float _2617 = _2469;
        float _2619 = _2617;
        if (_2601)
        {
            _2607 = _2529;
        }
        float _2621 = _2607;
        _2585 = _2621;
        if (_2601)
        {
            _2611 = _2531;
        }
        float _2623 = _2611;
        _2591 = _2623;
        if (_2601)
        {
            _2615 = _2533;
        }
        float _2625 = _2615;
        _2599 = _2625;
        if (_2601)
        {
            _2619 = _2525;
        }
        float _2627 = _2619;
        _2471 = _2627;
        if (_2601)
        {
            _2561 = _613;
        }
        float _2629 = _2561;
        _2567 = _2629;
        if (_2601)
        {
            _2563 = _615;
        }
        float _2631 = _2563;
        _2569 = _2631;
        if (_2601)
        {
            _2571 = _617;
        }
    }
    float _2633 = _2471;
    float _2635 = _2565;
    float _2637 = _2585;
    float _2639 = _2591;
    float _2641 = _2599;
    float _2643 = _2567;
    float _2645 = _2569;
    float _2647 = _2571;
    bool _2649 = _2633 >= _2555;
    bool _2651 = isnan(_2633);
    bool _2653 = _2649 || _2651;
    bool _2655 = isnan(_2555);
    bool _2657 = _2653 || _2655;
    float _2659 = _647 * _1285;
    float _2661 = fma(_645, _1287, _2659);
    float _2663 = fma(_649, _1289, _2661);
    float _2665 = _2661;
    float _2667 = _2635;
    float _2669 = _2643;
    float _2671 = _2645;
    float _2673 = _2643;
    float _2675 = _2645;
    float _2677 = _2635;
    float _2679 = _2647;
    float _2681 = _2641;
    float _2683 = _2637;
    float _2685 = _2663;
    float _2687 = _2663;
    if (!_2657)
    {
        _2665 = _629;
    }
    float _2689 = _2665;
    float _2691 = _2689;
    float _2693 = _2689;
    if (!_2657)
    {
        _2573 = _631;
    }
    float _2695 = _2573;
    float _2697 = _2695;
    float _2699 = _2695;
    if (!_2657)
    {
        _2575 = _633;
    }
    float _2701 = _2575;
    bool _2703 = !_2657;
    float _2705 = _2701;
    float _2707 = _2701;
    if (!_2703)
    {
        bool _2709 = _2635 > _2555;
        if (_2709)
        {
            _2667 = _2555;
        }
        float _2711 = _2667;
        _2677 = _2711;
        if (!_2709)
        {
            _2691 = _2637;
        }
        float _2713 = _2691;
        float _2715 = _2713;
        if (!_2709)
        {
            _2697 = _2639;
        }
        float _2717 = _2697;
        float _2719 = _2717;
        if (!_2709)
        {
            _2705 = _2641;
        }
        float _2721 = _2705;
        float _2723 = _2721;
        if (!_2709)
        {
            _2577 = _2633;
        }
        float _2725 = _2577;
        float _2727 = _2725;
        if (_2709)
        {
            _2715 = _2637;
        }
        float _2729 = _2715;
        _2693 = _2729;
        if (_2709)
        {
            _2719 = _2639;
        }
        float _2731 = _2719;
        _2699 = _2731;
        if (_2709)
        {
            _2723 = _2641;
        }
        float _2733 = _2723;
        _2707 = _2733;
        if (_2709)
        {
            _2727 = _2633;
        }
        float _2735 = _2727;
        _2579 = _2735;
        if (_2709)
        {
            _2669 = _629;
        }
        float _2737 = _2669;
        _2673 = _2737;
        if (_2709)
        {
            _2671 = _631;
        }
        float _2739 = _2671;
        _2675 = _2739;
        if (_2709)
        {
            _2679 = _633;
        }
    }
    float _2741 = _2579;
    float _2743 = _2673;
    float _2745 = _2675;
    float _2747 = _2677;
    float _2749 = _2693;
    float _2751 = _2699;
    float _2753 = _2707;
    float _2755 = _2679;
    bool _2757 = _2741 >= _2663;
    bool _2759 = isnan(_2741);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan(_2663);
    bool _2765 = _2761 || _2763;
    float _2767 = _657 * _1285;
    float _2769 = fma(_655, _1287, _2767);
    float _2771 = fma(_659, _1289, _2769);
    float _2773 = _2769;
    float _2775 = _2747;
    float _2777 = _2755;
    float _2779 = _2747;
    float _2781 = _2745;
    float _2783 = _2743;
    if (!_2765)
    {
        _1345 = _2743;
    }
    float _2785 = _1345;
    float _2787 = _2785;
    float _2789 = _2785;
    if (!_2765)
    {
        _2773 = _2745;
    }
    float _2791 = _2773;
    float _2793 = _2791;
    float _2795 = _2791;
    if (!_2765)
    {
        _1347 = _645;
    }
    float _2797 = _1347;
    float _2799 = _2797;
    float _2801 = _2797;
    if (!_2765)
    {
        _2681 = _647;
    }
    float _2803 = _2681;
    float _2805 = _2803;
    float _2807 = _2803;
    if (!_2765)
    {
        _2683 = _649;
    }
    float _2809 = _2683;
    bool _2811 = !_2765;
    float _2813 = _2809;
    float _2815 = _2809;
    if (!_2811)
    {
        bool _2817 = _2747 > _2663;
        if (_2817)
        {
            _2775 = _2663;
        }
        float _2819 = _2775;
        _2779 = _2819;
        if (!_2817)
        {
            _2799 = _2749;
        }
        float _2821 = _2799;
        float _2823 = _2821;
        if (!_2817)
        {
            _2805 = _2751;
        }
        float _2825 = _2805;
        float _2827 = _2825;
        if (!_2817)
        {
            _2813 = _2753;
        }
        float _2829 = _2813;
        float _2831 = _2829;
        if (!_2817)
        {
            _2685 = _2741;
        }
        float _2833 = _2685;
        float _2835 = _2833;
        if (!_2817)
        {
            _2787 = _2743;
        }
        float _2837 = _2787;
        float _2839 = _2837;
        if (!_2817)
        {
            _2793 = _2745;
        }
        float _2841 = _2793;
        float _2843 = _2841;
        if (_2817)
        {
            _2823 = _2749;
        }
        float _2845 = _2823;
        _2801 = _2845;
        if (_2817)
        {
            _2827 = _2751;
        }
        float _2847 = _2827;
        _2807 = _2847;
        if (_2817)
        {
            _2831 = _2753;
        }
        float _2849 = _2831;
        _2815 = _2849;
        if (_2817)
        {
            _2835 = _2741;
        }
        float _2851 = _2835;
        _2687 = _2851;
        if (_2817)
        {
            _2839 = _645;
        }
        float _2853 = _2839;
        _2789 = _2853;
        if (_2817)
        {
            _2843 = _647;
        }
        float _2855 = _2843;
        _2795 = _2855;
        if (_2817)
        {
            _2777 = _649;
        }
    }
    float _2857 = _2687;
    float _2859 = _2789;
    float _2861 = _2777;
    float _2863 = _2779;
    float _2865 = _2801;
    float _2867 = _2807;
    float _2869 = _2815;
    float _2871 = _2795;
    bool _2873 = _2857 >= _2771;
    bool _2875 = isnan(_2857);
    bool _2877 = _2873 || _2875;
    bool _2879 = isnan(_2771);
    bool _2881 = _2877 || _2879;
    float _2883 = _2871;
    float _2885 = _2871;
    if (!_2881)
    {
        _2781 = _2859;
    }
    float _2887 = _2781;
    float _2889 = _2887;
    float _2891 = _2887;
    if (!_2881)
    {
        _2783 = _2861;
    }
    float _2893 = _2783;
    float _2895 = 0.0;
    float _2897 = _2893;
    float _2899 = _2893;
    if (!_2881)
    {
        _2895 = _655;
    }
    float _2901 = _2895;
    float _2903 = 0.0;
    float _2905 = _2901;
    float _2907 = _2901;
    if (!_2881)
    {
        _2903 = _657;
    }
    float _2909 = _2903;
    float _2911 = 0.0;
    float _2913 = _2909;
    float _2915 = _2909;
    if (!_2881)
    {
        _2911 = _659;
    }
    float _2917 = _2911;
    bool _2919 = !_2881;
    float _2921 = _2917;
    float _2923 = _2917;
    if (!_2919)
    {
        bool _2925 = _2863 > _2771;
        if (!_2925)
        {
            _2905 = _2865;
        }
        float _2927 = _2905;
        float _2929 = _2927;
        if (!_2925)
        {
            _2913 = _2867;
        }
        float _2931 = _2913;
        float _2933 = _2931;
        if (!_2925)
        {
            _2921 = _2869;
        }
        float _2935 = _2921;
        float _2937 = _2935;
        if (!_2925)
        {
            _2889 = _2859;
        }
        float _2939 = _2889;
        float _2941 = _2939;
        if (!_2925)
        {
            _2897 = _2861;
        }
        float _2943 = _2897;
        _2899 = _2943;
        if (_2925)
        {
            _2929 = _2865;
        }
        float _2945 = _2929;
        _2907 = _2945;
        if (_2925)
        {
            _2933 = _2867;
        }
        float _2947 = _2933;
        _2915 = _2947;
        if (_2925)
        {
            _2937 = _2869;
        }
        float _2949 = _2937;
        _2923 = _2949;
        if (_2925)
        {
            _2941 = _655;
        }
        float _2951 = _2941;
        _2891 = _2951;
        if (_2925)
        {
            _2883 = _657;
        }
        float _2953 = _2883;
        _2885 = _2953;
        if (_2925)
        {
            _2899 = _659;
        }
    }
    float _2955 = _2885;
    float _2957 = _2915;
    float _2959 = _2891;
    float _2961 = _2907;
    float _2963 = _2899;
    float _2965 = _2923;
    float _2967 = -_2955;
    float _2969 = _2957 + _2967;
    float _2971 = -_2959;
    float _2973 = _2961 + _2971;
    float _2975 = -_2963;
    float _2977 = _2965 + _2975;
    float _2979 = -_2955;
    float _2981 = _347 + _2979;
    float _2983 = _2969 * _2969;
    float _2985 = _2969 * _2981;
    float _2987 = fma(_2973, _2973, _2983);
    float _2989 = -_2959;
    float _2991 = _345 + _2989;
    float _2993 = -_2963;
    float _2995 = _349 + _2993;
    float _2997 = fma(_2977, _2977, _2987);
    float _2999 = fma(_2973, _2991, _2985);
    float _3001 = fma(_2977, _2995, _2999);
    float _3003 = 1.0 / _2997;
    float _3005 = _3003 * 3.0;
    float _3007 = _3005 * _3001;
    float _3009 = rint(_3007);
    float _3011 = precise::max(0.0, _3009);
    float _3013 = precise::min(_3011, 3.0);
    float _3015 = trunc(_3013);
    int _3018 = int(_3015);
    bool _3020 = _3018 >= 2;
    bool _3022 = !_3020;
    float _3024 = _2973;
    float _3026 = _2969;
    float _3028 = _2977;
    float _3030 = _2959;
    float _3032 = _2961;
    float _3034 = _2955;
    float _3036 = _2957;
    float _3038 = _2963;
    float _3040 = _2965;
    float _3050;
    float _3052;
    float _3054;
    float _3056;
    float _3058;
    float _3060;
    float _3062;
    float _3064;
    float _3066;
    float _3068;
    float _3070;
    float _3072;
    float _3074;
    float _3076;
    float _3078;
    float _3080;
    if (!_3022)
    {
        bool _3042 = _3018 >= 3;
        bool _3044 = !_3042;
        if (!_3044)
        {
            bool _3046 = _3018 != 3;
            _3048 = _3046;
            if (!_3048)
            {
                _3050 = _345;
                _3052 = _347;
                _3054 = _349;
                _3056 = 1.0;
                _3058 = 0.0;
                _3060 = 0.0;
                _3062 = 0.0;
                _3064 = 0.0;
                _3066 = 0.0;
                _3068 = 0.0;
                _3070 = 0.0;
                _3072 = 0.0;
                _3074 = 0.0;
                _3076 = 0.0;
                _3078 = 0.0;
                _3080 = 0.0;
                _3082 = true;
            }
        }
        else
        {
            _3050 = 0.0;
            _3052 = 0.0;
            _3054 = 0.0;
            _3056 = 0.0;
            _3058 = 0.0;
            _3060 = 0.0;
            _3062 = 0.0;
            _3064 = 0.0;
            _3066 = _345;
            _3068 = _347;
            _3070 = _349;
            _3072 = 1.0;
            _3074 = 0.0;
            _3076 = 0.0;
            _3078 = 0.0;
            _3080 = 0.0;
            _3082 = true;
        }
    }
    if ((!_3082) || _3048)
    {
        bool _3084;
        if (!_3048)
        {
            _3084 = _3018 >= 1;
        }
        if ((!_3084) || _3048)
        {
            bool _3086;
            if (!_3048)
            {
                _3086 = _3018 != 0;
            }
            if ((!_3086) && (!_3048))
            {
                _3050 = 0.0;
                _3052 = 0.0;
                _3054 = 0.0;
                _3056 = 0.0;
                _3058 = _345;
                _3060 = _347;
                _3062 = _349;
                _3064 = 1.0;
                _3066 = 0.0;
                _3068 = 0.0;
                _3070 = 0.0;
                _3072 = 0.0;
                _3074 = 0.0;
                _3076 = 0.0;
                _3078 = 0.0;
                _3080 = 0.0;
                _3082 = true;
            }
            else
            {
                _3048 = false;
                _3050 = 0.0;
                _3052 = 0.0;
                _3054 = 0.0;
                _3056 = 0.0;
                _3058 = 0.0;
                _3060 = 0.0;
                _3062 = 0.0;
                _3064 = 0.0;
                _3066 = 0.0;
                _3068 = 0.0;
                _3070 = 0.0;
                _3072 = 0.0;
                _3074 = 0.0;
                _3076 = 0.0;
                _3078 = 0.0;
                _3080 = 0.0;
                _3082 = true;
            }
        }
        else
        {
            _3050 = 0.0;
            _3052 = 0.0;
            _3054 = 0.0;
            _3056 = 0.0;
            _3058 = 0.0;
            _3060 = 0.0;
            _3062 = 0.0;
            _3064 = 0.0;
            _3066 = 0.0;
            _3068 = 0.0;
            _3070 = 0.0;
            _3072 = 0.0;
            _3074 = _345;
            _3076 = _347;
            _3078 = _349;
            _3080 = 1.0;
        }
    }
    _3082 = false;
    float _3088 = _3050;
    float _3090 = _3052;
    float _3092 = _3054;
    float _3094 = _3056;
    float _3096 = _3058;
    float _3098 = _3060;
    float _3100 = _3062;
    float _3102 = _3064;
    float _3104 = _3066;
    float _3106 = _3068;
    float _3108 = _3070;
    float _3110 = _3072;
    float _3112 = _3074;
    float _3114 = _3076;
    float _3116 = _3078;
    float _3118 = _3080;
    float _3120 = -_2955;
    float _3122 = _357 + _3120;
    float _3124 = -_2959;
    float _3126 = _355 + _3124;
    float _3128 = _2969 * _3122;
    float _3130 = -_2963;
    float _3132 = _359 + _3130;
    float _3134 = fma(_2973, _3126, _3128);
    float _3136 = fma(_2977, _3132, _3134);
    float _3138 = _3005 * _3136;
    float _3140 = rint(_3138);
    float _3142 = precise::max(0.0, _3140);
    float _3144 = precise::min(_3142, 3.0);
    float _3146 = trunc(_3144);
    int _3148 = int(_3146);
    bool _3150 = _3148 >= 2;
    bool _3152 = !_3150;
    float _3154 = as_type<float>(_3148);
    float _3156 = _3140;
    float _3158 = _3134;
    float _3160 = _3128;
    float _3162 = _3088;
    float _3164 = _3090;
    float _3166 = _3092;
    float _3168 = _3094;
    float _3170 = _3104;
    float _3172 = _3106;
    float _3174 = _3108;
    float _3176 = _3110;
    float _3178 = _3112;
    float _3180 = _3114;
    float _3182 = _3116;
    float _3184 = _3118;
    float _3202;
    float _3204;
    float _3206;
    float _3208;
    if (!_3152)
    {
        bool _3186 = _3148 >= 3;
        bool _3188 = !_3186;
        if (!_3188)
        {
            bool _3190 = _3148 != 3;
            _3192 = _3190;
            if (!_3192)
            {
                float _3194 = _355 + _3088;
                float _3196 = _357 + _3090;
                float _3198 = _359 + _3092;
                float _3200 = _3094 + 1.0;
                _3162 = _3194;
                _3164 = _3196;
                _3166 = _3198;
                _3168 = _3200;
                _3202 = _3096;
                _3204 = _3098;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = true;
            }
        }
        else
        {
            float _3212 = _355 + _3104;
            float _3214 = _357 + _3106;
            float _3216 = _359 + _3108;
            float _3218 = _3110 + 1.0;
            _3202 = _3096;
            _3204 = _3098;
            _3206 = _3100;
            _3208 = _3102;
            _3170 = _3212;
            _3172 = _3214;
            _3174 = _3216;
            _3176 = _3218;
            _3210 = true;
        }
    }
    if ((!_3210) || _3192)
    {
        bool _3220;
        if (!_3192)
        {
            _3220 = _3148 >= 1;
        }
        if ((!_3220) || _3192)
        {
            if (!_3192)
            {
                bool _3222 = _3148 != 0;
                if (!_3222)
                {
                    float _3224 = _355 + _3096;
                    _3154 = _3224;
                }
                float _3226 = _3154;
                _3202 = _3226;
                if (!_3222)
                {
                    float _3228 = _357 + _3098;
                    _3156 = _3228;
                }
                float _3230 = _3156;
                _3204 = _3230;
                if (!_3222)
                {
                    float _3232 = _359 + _3100;
                    _3158 = _3232;
                }
                float _3234 = _3158;
                _3206 = _3234;
                if (!_3222)
                {
                    float _3236 = _3102 + 1.0;
                    _3160 = _3236;
                }
                float _3238 = _3160;
                bool _3240 = !_3222;
                _3208 = _3238;
                _3210 = _3240;
            }
            if ((!_3210) || _3192)
            {
                _3192 = false;
                _3202 = _3096;
                _3204 = _3098;
                _3206 = _3100;
                _3208 = _3102;
                _3210 = true;
            }
        }
        else
        {
            float _3242 = _355 + _3112;
            float _3244 = _357 + _3114;
            float _3246 = _359 + _3116;
            float _3248 = _3118 + 1.0;
            _3202 = _3096;
            _3204 = _3098;
            _3206 = _3100;
            _3208 = _3102;
            _3178 = _3242;
            _3180 = _3244;
            _3182 = _3246;
            _3184 = _3248;
        }
    }
    _3210 = false;
    float _3250 = _3162;
    float _3252 = _3164;
    float _3254 = _3166;
    float _3256 = _3168;
    float _3258 = _3202;
    float _3260 = _3204;
    float _3262 = _3206;
    float _3264 = _3208;
    float _3266 = _3170;
    float _3268 = _3172;
    float _3270 = _3174;
    float _3272 = _3176;
    float _3274 = _3178;
    float _3276 = _3180;
    float _3278 = _3182;
    float _3280 = _3184;
    float _3282 = -_2955;
    float _3284 = _367 + _3282;
    float _3286 = -_2959;
    float _3288 = _365 + _3286;
    float _3290 = _2969 * _3284;
    float _3292 = -_2963;
    float _3294 = _369 + _3292;
    float _3296 = fma(_2973, _3288, _3290);
    float _3298 = fma(_2977, _3294, _3296);
    float _3300 = _3005 * _3298;
    float _3302 = rint(_3300);
    float _3304 = precise::max(0.0, _3302);
    float _3306 = precise::min(_3304, 3.0);
    float _3308 = trunc(_3306);
    int _3310 = int(_3308);
    bool _3312 = _3310 >= 2;
    bool _3314 = !_3312;
    float _3316 = _3302;
    float _3318 = as_type<float>(_3310);
    float _3320 = _3290;
    float _3322 = _3296;
    float _3324 = _3250;
    float _3326 = _3252;
    float _3328 = _3254;
    float _3330 = _3256;
    float _3332 = _3266;
    float _3334 = _3268;
    float _3336 = _3270;
    float _3338 = _3272;
    float _3340 = _3274;
    float _3342 = _3276;
    float _3344 = _3278;
    float _3346 = _3280;
    float _3364;
    float _3366;
    float _3368;
    float _3370;
    if (!_3314)
    {
        bool _3348 = _3310 >= 3;
        bool _3350 = !_3348;
        if (!_3350)
        {
            bool _3352 = _3310 != 3;
            _3354 = _3352;
            if (!_3354)
            {
                float _3356 = _365 + _3250;
                float _3358 = _367 + _3252;
                float _3360 = _369 + _3254;
                float _3362 = _3256 + 1.0;
                _3324 = _3356;
                _3326 = _3358;
                _3328 = _3360;
                _3330 = _3362;
                _3364 = _3258;
                _3366 = _3260;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = true;
            }
        }
        else
        {
            float _3374 = _365 + _3266;
            float _3376 = _367 + _3268;
            float _3378 = _369 + _3270;
            float _3380 = _3272 + 1.0;
            _3364 = _3258;
            _3366 = _3260;
            _3368 = _3262;
            _3370 = _3264;
            _3332 = _3374;
            _3334 = _3376;
            _3336 = _3378;
            _3338 = _3380;
            _3372 = true;
        }
    }
    if ((!_3372) || _3354)
    {
        bool _3382;
        if (!_3354)
        {
            _3382 = _3310 >= 1;
        }
        if ((!_3382) || _3354)
        {
            if (!_3354)
            {
                bool _3384 = _3310 != 0;
                if (!_3384)
                {
                    float _3386 = _365 + _3258;
                    _3316 = _3386;
                }
                float _3388 = _3316;
                _3364 = _3388;
                if (!_3384)
                {
                    float _3390 = _367 + _3260;
                    _3318 = _3390;
                }
                float _3392 = _3318;
                _3366 = _3392;
                if (!_3384)
                {
                    float _3394 = _369 + _3262;
                    _3320 = _3394;
                }
                float _3396 = _3320;
                _3368 = _3396;
                if (!_3384)
                {
                    float _3398 = _3264 + 1.0;
                    _3322 = _3398;
                }
                float _3400 = _3322;
                bool _3402 = !_3384;
                _3370 = _3400;
                _3372 = _3402;
            }
            if ((!_3372) || _3354)
            {
                _3354 = false;
                _3364 = _3258;
                _3366 = _3260;
                _3368 = _3262;
                _3370 = _3264;
                _3372 = true;
            }
        }
        else
        {
            float _3404 = _365 + _3274;
            float _3406 = _367 + _3276;
            float _3408 = _369 + _3278;
            float _3410 = _3280 + 1.0;
            _3364 = _3258;
            _3366 = _3260;
            _3368 = _3262;
            _3370 = _3264;
            _3340 = _3404;
            _3342 = _3406;
            _3344 = _3408;
            _3346 = _3410;
        }
    }
    _3372 = false;
    float _3412 = _3324;
    float _3414 = _3326;
    float _3416 = _3328;
    float _3418 = _3330;
    float _3420 = _3364;
    float _3422 = _3366;
    float _3424 = _3368;
    float _3426 = _3370;
    float _3428 = _3332;
    float _3430 = _3334;
    float _3432 = _3336;
    float _3434 = _3338;
    float _3436 = _3340;
    float _3438 = _3342;
    float _3440 = _3344;
    float _3442 = _3346;
    float _3444 = -_2955;
    float _3446 = _407 + _3444;
    float _3448 = -_2959;
    float _3450 = _405 + _3448;
    float _3452 = _2969 * _3446;
    float _3454 = -_2963;
    float _3456 = _409 + _3454;
    float _3458 = fma(_2973, _3450, _3452);
    float _3460 = fma(_2977, _3456, _3458);
    float _3462 = _3005 * _3460;
    float _3464 = rint(_3462);
    float _3466 = precise::max(0.0, _3464);
    float _3468 = precise::min(_3466, 3.0);
    float _3470 = trunc(_3468);
    int _3472 = int(_3470);
    bool _3474 = _3472 >= 2;
    bool _3476 = !_3474;
    float _3478 = as_type<float>(_3472);
    float _3480 = _3464;
    float _3482 = _3458;
    float _3484 = _3452;
    float _3486 = _3412;
    float _3488 = _3414;
    float _3490 = _3416;
    float _3492 = _3418;
    float _3494 = _3428;
    float _3496 = _3430;
    float _3498 = _3432;
    float _3500 = _3434;
    float _3502 = _3436;
    float _3504 = _3438;
    float _3506 = _3440;
    float _3508 = _3442;
    float _3526;
    float _3528;
    float _3530;
    float _3532;
    if (!_3476)
    {
        bool _3510 = _3472 >= 3;
        bool _3512 = !_3510;
        if (!_3512)
        {
            bool _3514 = _3472 != 3;
            _3516 = _3514;
            if (!_3516)
            {
                float _3518 = _405 + _3412;
                float _3520 = _407 + _3414;
                float _3522 = _409 + _3416;
                float _3524 = _3418 + 1.0;
                _3486 = _3518;
                _3488 = _3520;
                _3490 = _3522;
                _3492 = _3524;
                _3526 = _3420;
                _3528 = _3422;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = true;
            }
        }
        else
        {
            float _3536 = _405 + _3428;
            float _3538 = _407 + _3430;
            float _3540 = _409 + _3432;
            float _3542 = _3434 + 1.0;
            _3526 = _3420;
            _3528 = _3422;
            _3530 = _3424;
            _3532 = _3426;
            _3494 = _3536;
            _3496 = _3538;
            _3498 = _3540;
            _3500 = _3542;
            _3534 = true;
        }
    }
    if ((!_3534) || _3516)
    {
        bool _3544;
        if (!_3516)
        {
            _3544 = _3472 >= 1;
        }
        if ((!_3544) || _3516)
        {
            if (!_3516)
            {
                bool _3546 = _3472 != 0;
                if (!_3546)
                {
                    float _3548 = _405 + _3420;
                    _3478 = _3548;
                }
                float _3550 = _3478;
                _3526 = _3550;
                if (!_3546)
                {
                    float _3552 = _407 + _3422;
                    _3480 = _3552;
                }
                float _3554 = _3480;
                _3528 = _3554;
                if (!_3546)
                {
                    float _3556 = _409 + _3424;
                    _3482 = _3556;
                }
                float _3558 = _3482;
                _3530 = _3558;
                if (!_3546)
                {
                    float _3560 = _3426 + 1.0;
                    _3484 = _3560;
                }
                float _3562 = _3484;
                bool _3564 = !_3546;
                _3532 = _3562;
                _3534 = _3564;
            }
            if ((!_3534) || _3516)
            {
                _3516 = false;
                _3526 = _3420;
                _3528 = _3422;
                _3530 = _3424;
                _3532 = _3426;
                _3534 = true;
            }
        }
        else
        {
            float _3566 = _405 + _3436;
            float _3568 = _407 + _3438;
            float _3570 = _409 + _3440;
            float _3572 = _3442 + 1.0;
            _3526 = _3420;
            _3528 = _3422;
            _3530 = _3424;
            _3532 = _3426;
            _3502 = _3566;
            _3504 = _3568;
            _3506 = _3570;
            _3508 = _3572;
        }
    }
    _3534 = false;
    float _3574 = _3486;
    float _3576 = _3488;
    float _3578 = _3490;
    float _3580 = _3492;
    float _3582 = _3526;
    float _3584 = _3528;
    float _3586 = _3530;
    float _3588 = _3532;
    float _3590 = _3494;
    float _3592 = _3496;
    float _3594 = _3498;
    float _3596 = _3500;
    float _3598 = _3502;
    float _3600 = _3504;
    float _3602 = _3506;
    float _3604 = _3508;
    float _3606 = -_2955;
    float _3608 = _417 + _3606;
    float _3610 = -_2959;
    float _3612 = _415 + _3610;
    float _3614 = _2969 * _3608;
    float _3616 = -_2963;
    float _3618 = _419 + _3616;
    float _3620 = fma(_2973, _3612, _3614);
    float _3622 = fma(_2977, _3618, _3620);
    float _3624 = _3005 * _3622;
    float _3626 = rint(_3624);
    float _3628 = precise::max(0.0, _3626);
    float _3630 = precise::min(_3628, 3.0);
    float _3632 = trunc(_3630);
    int _3634 = int(_3632);
    bool _3636 = _3634 >= 2;
    bool _3638 = !_3636;
    float _3640 = _3626;
    float _3642 = as_type<float>(_3634);
    float _3644 = _3614;
    float _3646 = _3620;
    float _3648 = _3574;
    float _3650 = _3576;
    float _3652 = _3578;
    float _3654 = _3580;
    float _3656 = _3590;
    float _3658 = _3592;
    float _3660 = _3594;
    float _3662 = _3596;
    float _3664 = _3598;
    float _3666 = _3600;
    float _3668 = _3602;
    float _3670 = _3604;
    float _3688;
    float _3690;
    float _3692;
    float _3694;
    if (!_3638)
    {
        bool _3672 = _3634 >= 3;
        bool _3674 = !_3672;
        if (!_3674)
        {
            bool _3676 = _3634 != 3;
            _3678 = _3676;
            if (!_3678)
            {
                float _3680 = _415 + _3574;
                float _3682 = _417 + _3576;
                float _3684 = _419 + _3578;
                float _3686 = _3580 + 1.0;
                _3648 = _3680;
                _3650 = _3682;
                _3652 = _3684;
                _3654 = _3686;
                _3688 = _3582;
                _3690 = _3584;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = true;
            }
        }
        else
        {
            float _3698 = _415 + _3590;
            float _3700 = _417 + _3592;
            float _3702 = _419 + _3594;
            float _3704 = _3596 + 1.0;
            _3688 = _3582;
            _3690 = _3584;
            _3692 = _3586;
            _3694 = _3588;
            _3656 = _3698;
            _3658 = _3700;
            _3660 = _3702;
            _3662 = _3704;
            _3696 = true;
        }
    }
    if ((!_3696) || _3678)
    {
        bool _3706;
        if (!_3678)
        {
            _3706 = _3634 >= 1;
        }
        if ((!_3706) || _3678)
        {
            if (!_3678)
            {
                bool _3708 = _3634 != 0;
                if (!_3708)
                {
                    float _3710 = _415 + _3582;
                    _3640 = _3710;
                }
                float _3712 = _3640;
                _3688 = _3712;
                if (!_3708)
                {
                    float _3714 = _417 + _3584;
                    _3642 = _3714;
                }
                float _3716 = _3642;
                _3690 = _3716;
                if (!_3708)
                {
                    float _3718 = _419 + _3586;
                    _3644 = _3718;
                }
                float _3720 = _3644;
                _3692 = _3720;
                if (!_3708)
                {
                    float _3722 = _3588 + 1.0;
                    _3646 = _3722;
                }
                float _3724 = _3646;
                bool _3726 = !_3708;
                _3694 = _3724;
                _3696 = _3726;
            }
            if ((!_3696) || _3678)
            {
                _3678 = false;
                _3688 = _3582;
                _3690 = _3584;
                _3692 = _3586;
                _3694 = _3588;
                _3696 = true;
            }
        }
        else
        {
            float _3728 = _415 + _3598;
            float _3730 = _417 + _3600;
            float _3732 = _419 + _3602;
            float _3734 = _3604 + 1.0;
            _3688 = _3582;
            _3690 = _3584;
            _3692 = _3586;
            _3694 = _3588;
            _3664 = _3728;
            _3666 = _3730;
            _3668 = _3732;
            _3670 = _3734;
        }
    }
    _3696 = false;
    float _3736 = _3648;
    float _3738 = _3650;
    float _3740 = _3652;
    float _3742 = _3654;
    float _3744 = _3688;
    float _3746 = _3690;
    float _3748 = _3692;
    float _3750 = _3694;
    float _3752 = _3656;
    float _3754 = _3658;
    float _3756 = _3660;
    float _3758 = _3662;
    float _3760 = _3664;
    float _3762 = _3666;
    float _3764 = _3668;
    float _3766 = _3670;
    float _3768 = -_2955;
    float _3770 = _469 + _3768;
    float _3772 = -_2959;
    float _3774 = _467 + _3772;
    float _3776 = _2969 * _3770;
    float _3778 = -_2963;
    float _3780 = _471 + _3778;
    float _3782 = fma(_2973, _3774, _3776);
    float _3784 = fma(_2977, _3780, _3782);
    float _3786 = _3005 * _3784;
    float _3788 = rint(_3786);
    float _3790 = precise::max(0.0, _3788);
    float _3792 = precise::min(_3790, 3.0);
    float _3794 = trunc(_3792);
    int _3796 = int(_3794);
    bool _3798 = _3796 >= 2;
    bool _3800 = !_3798;
    float _3802 = as_type<float>(_3796);
    float _3804 = _3788;
    float _3806 = _3782;
    float _3808 = _3776;
    float _3810 = _3736;
    float _3812 = _3738;
    float _3814 = _3740;
    float _3816 = _3742;
    float _3818 = _3752;
    float _3820 = _3754;
    float _3822 = _3756;
    float _3824 = _3758;
    float _3826 = _3760;
    float _3828 = _3762;
    float _3830 = _3764;
    float _3832 = _3766;
    float _3850;
    float _3852;
    float _3854;
    float _3856;
    if (!_3800)
    {
        bool _3834 = _3796 >= 3;
        bool _3836 = !_3834;
        if (!_3836)
        {
            bool _3838 = _3796 != 3;
            _3840 = _3838;
            if (!_3840)
            {
                float _3842 = _467 + _3736;
                float _3844 = _469 + _3738;
                float _3846 = _471 + _3740;
                float _3848 = _3742 + 1.0;
                _3810 = _3842;
                _3812 = _3844;
                _3814 = _3846;
                _3816 = _3848;
                _3850 = _3744;
                _3852 = _3746;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = true;
            }
        }
        else
        {
            float _3860 = _467 + _3752;
            float _3862 = _469 + _3754;
            float _3864 = _471 + _3756;
            float _3866 = _3758 + 1.0;
            _3850 = _3744;
            _3852 = _3746;
            _3854 = _3748;
            _3856 = _3750;
            _3818 = _3860;
            _3820 = _3862;
            _3822 = _3864;
            _3824 = _3866;
            _3858 = true;
        }
    }
    if ((!_3858) || _3840)
    {
        bool _3868;
        if (!_3840)
        {
            _3868 = _3796 >= 1;
        }
        if ((!_3868) || _3840)
        {
            if (!_3840)
            {
                bool _3870 = _3796 != 0;
                if (!_3870)
                {
                    float _3872 = _467 + _3744;
                    _3802 = _3872;
                }
                float _3874 = _3802;
                _3850 = _3874;
                if (!_3870)
                {
                    float _3876 = _469 + _3746;
                    _3804 = _3876;
                }
                float _3878 = _3804;
                _3852 = _3878;
                if (!_3870)
                {
                    float _3880 = _471 + _3748;
                    _3806 = _3880;
                }
                float _3882 = _3806;
                _3854 = _3882;
                if (!_3870)
                {
                    float _3884 = _3750 + 1.0;
                    _3808 = _3884;
                }
                float _3886 = _3808;
                bool _3888 = !_3870;
                _3856 = _3886;
                _3858 = _3888;
            }
            if ((!_3858) || _3840)
            {
                _3840 = false;
                _3850 = _3744;
                _3852 = _3746;
                _3854 = _3748;
                _3856 = _3750;
                _3858 = true;
            }
        }
        else
        {
            float _3890 = _467 + _3760;
            float _3892 = _469 + _3762;
            float _3894 = _471 + _3764;
            float _3896 = _3766 + 1.0;
            _3850 = _3744;
            _3852 = _3746;
            _3854 = _3748;
            _3856 = _3750;
            _3826 = _3890;
            _3828 = _3892;
            _3830 = _3894;
            _3832 = _3896;
        }
    }
    _3858 = false;
    float _3898 = _3810;
    float _3900 = _3812;
    float _3902 = _3814;
    float _3904 = _3816;
    float _3906 = _3850;
    float _3908 = _3852;
    float _3910 = _3854;
    float _3912 = _3856;
    float _3914 = _3818;
    float _3916 = _3820;
    float _3918 = _3822;
    float _3920 = _3824;
    float _3922 = _3826;
    float _3924 = _3828;
    float _3926 = _3830;
    float _3928 = _3832;
    float _3930 = -_2955;
    float _3932 = _495 + _3930;
    float _3934 = -_2959;
    float _3936 = _493 + _3934;
    float _3938 = _2969 * _3932;
    float _3940 = -_2963;
    float _3942 = _497 + _3940;
    float _3944 = fma(_2973, _3936, _3938);
    float _3946 = fma(_2977, _3942, _3944);
    float _3948 = _3005 * _3946;
    float _3950 = rint(_3948);
    float _3952 = precise::max(0.0, _3950);
    float _3954 = precise::min(_3952, 3.0);
    float _3956 = trunc(_3954);
    int _3958 = int(_3956);
    bool _3960 = _3958 >= 2;
    bool _3962 = !_3960;
    float _3964 = _3950;
    float _3966 = as_type<float>(_3958);
    float _3968 = _3938;
    float _3970 = _3944;
    float _3972 = _3898;
    float _3974 = _3900;
    float _3976 = _3902;
    float _3978 = _3904;
    float _3980 = _3914;
    float _3982 = _3916;
    float _3984 = _3918;
    float _3986 = _3920;
    float _3988 = _3922;
    float _3990 = _3924;
    float _3992 = _3926;
    float _3994 = _3928;
    float _4012;
    float _4014;
    float _4016;
    float _4018;
    if (!_3962)
    {
        bool _3996 = _3958 >= 3;
        bool _3998 = !_3996;
        if (!_3998)
        {
            bool _4000 = _3958 != 3;
            _4002 = _4000;
            if (!_4002)
            {
                float _4004 = _493 + _3898;
                float _4006 = _495 + _3900;
                float _4008 = _497 + _3902;
                float _4010 = _3904 + 1.0;
                _3972 = _4004;
                _3974 = _4006;
                _3976 = _4008;
                _3978 = _4010;
                _4012 = _3906;
                _4014 = _3908;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = true;
            }
        }
        else
        {
            float _4022 = _493 + _3914;
            float _4024 = _495 + _3916;
            float _4026 = _497 + _3918;
            float _4028 = _3920 + 1.0;
            _4012 = _3906;
            _4014 = _3908;
            _4016 = _3910;
            _4018 = _3912;
            _3980 = _4022;
            _3982 = _4024;
            _3984 = _4026;
            _3986 = _4028;
            _4020 = true;
        }
    }
    if ((!_4020) || _4002)
    {
        bool _4030;
        if (!_4002)
        {
            _4030 = _3958 >= 1;
        }
        if ((!_4030) || _4002)
        {
            if (!_4002)
            {
                bool _4032 = _3958 != 0;
                if (!_4032)
                {
                    float _4034 = _493 + _3906;
                    _3964 = _4034;
                }
                float _4036 = _3964;
                _4012 = _4036;
                if (!_4032)
                {
                    float _4038 = _495 + _3908;
                    _3966 = _4038;
                }
                float _4040 = _3966;
                _4014 = _4040;
                if (!_4032)
                {
                    float _4042 = _497 + _3910;
                    _3968 = _4042;
                }
                float _4044 = _3968;
                _4016 = _4044;
                if (!_4032)
                {
                    float _4046 = _3912 + 1.0;
                    _3970 = _4046;
                }
                float _4048 = _3970;
                bool _4050 = !_4032;
                _4018 = _4048;
                _4020 = _4050;
            }
            if ((!_4020) || _4002)
            {
                _4002 = false;
                _4012 = _3906;
                _4014 = _3908;
                _4016 = _3910;
                _4018 = _3912;
                _4020 = true;
            }
        }
        else
        {
            float _4052 = _493 + _3922;
            float _4054 = _495 + _3924;
            float _4056 = _497 + _3926;
            float _4058 = _3928 + 1.0;
            _4012 = _3906;
            _4014 = _3908;
            _4016 = _3910;
            _4018 = _3912;
            _3988 = _4052;
            _3990 = _4054;
            _3992 = _4056;
            _3994 = _4058;
        }
    }
    _4020 = false;
    float _4060 = _3972;
    float _4062 = _3974;
    float _4064 = _3976;
    float _4066 = _3978;
    float _4068 = _4012;
    float _4070 = _4014;
    float _4072 = _4016;
    float _4074 = _4018;
    float _4076 = _3980;
    float _4078 = _3982;
    float _4080 = _3984;
    float _4082 = _3986;
    float _4084 = _3988;
    float _4086 = _3990;
    float _4088 = _3992;
    float _4090 = _3994;
    float _4092 = -_2955;
    float _4094 = _521 + _4092;
    float _4096 = -_2959;
    float _4098 = _519 + _4096;
    float _4100 = _2969 * _4094;
    float _4102 = -_2963;
    float _4104 = _523 + _4102;
    float _4106 = fma(_2973, _4098, _4100);
    float _4108 = fma(_2977, _4104, _4106);
    float _4110 = _3005 * _4108;
    float _4112 = rint(_4110);
    float _4114 = precise::max(0.0, _4112);
    float _4116 = precise::min(_4114, 3.0);
    float _4118 = trunc(_4116);
    int _4120 = int(_4118);
    bool _4122 = _4120 >= 2;
    bool _4124 = !_4122;
    float _4126 = _4100;
    float _4128 = _4106;
    float _4130 = _4112;
    float _4132 = as_type<float>(_4120);
    float _4134 = _4060;
    float _4136 = _4062;
    float _4138 = _4064;
    float _4140 = _4066;
    float _4142 = _4076;
    float _4144 = _4078;
    float _4146 = _4080;
    float _4148 = _4082;
    float _4150 = _4084;
    float _4152 = _4086;
    float _4154 = _4088;
    float _4156 = _4090;
    float _4174;
    float _4176;
    float _4178;
    float _4180;
    if (!_4124)
    {
        bool _4158 = _4120 >= 3;
        bool _4160 = !_4158;
        if (!_4160)
        {
            bool _4162 = _4120 != 3;
            _4164 = _4162;
            if (!_4164)
            {
                float _4166 = _519 + _4060;
                float _4168 = _521 + _4062;
                float _4170 = _523 + _4064;
                float _4172 = _4066 + 1.0;
                _4134 = _4166;
                _4136 = _4168;
                _4138 = _4170;
                _4140 = _4172;
                _4174 = _4068;
                _4176 = _4070;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = true;
            }
        }
        else
        {
            float _4184 = _519 + _4076;
            float _4186 = _521 + _4078;
            float _4188 = _523 + _4080;
            float _4190 = _4082 + 1.0;
            _4174 = _4068;
            _4176 = _4070;
            _4178 = _4072;
            _4180 = _4074;
            _4142 = _4184;
            _4144 = _4186;
            _4146 = _4188;
            _4148 = _4190;
            _4182 = true;
        }
    }
    if ((!_4182) || _4164)
    {
        bool _4192;
        if (!_4164)
        {
            _4192 = _4120 >= 1;
        }
        if ((!_4192) || _4164)
        {
            if (!_4164)
            {
                bool _4194 = _4120 != 0;
                if (!_4194)
                {
                    float _4196 = _519 + _4068;
                    _4126 = _4196;
                }
                float _4198 = _4126;
                _4174 = _4198;
                if (!_4194)
                {
                    float _4200 = _521 + _4070;
                    _4128 = _4200;
                }
                float _4202 = _4128;
                _4176 = _4202;
                if (!_4194)
                {
                    float _4204 = _523 + _4072;
                    _4130 = _4204;
                }
                float _4206 = _4130;
                _4178 = _4206;
                if (!_4194)
                {
                    float _4208 = _4074 + 1.0;
                    _4132 = _4208;
                }
                float _4210 = _4132;
                bool _4212 = !_4194;
                _4180 = _4210;
                _4182 = _4212;
            }
            if ((!_4182) || _4164)
            {
                _4164 = false;
                _4174 = _4068;
                _4176 = _4070;
                _4178 = _4072;
                _4180 = _4074;
                _4182 = true;
            }
        }
        else
        {
            float _4214 = _519 + _4084;
            float _4216 = _521 + _4086;
            float _4218 = _523 + _4088;
            float _4220 = _4090 + 1.0;
            _4174 = _4068;
            _4176 = _4070;
            _4178 = _4072;
            _4180 = _4074;
            _4150 = _4214;
            _4152 = _4216;
            _4154 = _4218;
            _4156 = _4220;
        }
    }
    _4182 = false;
    float _4222 = _4134;
    float _4224 = _4136;
    float _4226 = _4138;
    float _4228 = _4140;
    float _4230 = _4174;
    float _4232 = _4176;
    float _4234 = _4178;
    float _4236 = _4180;
    float _4238 = _4142;
    float _4240 = _4144;
    float _4242 = _4146;
    float _4244 = _4148;
    float _4246 = _4150;
    float _4248 = _4152;
    float _4250 = _4154;
    float _4252 = _4156;
    float _4254 = -_2955;
    float _4256 = _531 + _4254;
    float _4258 = -_2959;
    float _4260 = _529 + _4258;
    float _4262 = _2969 * _4256;
    float _4264 = -_2963;
    float _4266 = _533 + _4264;
    float _4268 = fma(_2973, _4260, _4262);
    float _4270 = fma(_2977, _4266, _4268);
    float _4272 = _3005 * _4270;
    float _4274 = rint(_4272);
    float _4276 = precise::max(0.0, _4274);
    float _4278 = precise::min(_4276, 3.0);
    float _4280 = trunc(_4278);
    int _4282 = int(_4280);
    bool _4284 = _4282 >= 2;
    bool _4286 = !_4284;
    float _4288 = _4274;
    float _4290 = as_type<float>(_4282);
    float _4292 = _4262;
    float _4294 = _4268;
    float _4296 = _4222;
    float _4298 = _4224;
    float _4300 = _4226;
    float _4302 = _4228;
    float _4304 = _4238;
    float _4306 = _4240;
    float _4308 = _4242;
    float _4310 = _4244;
    float _4312 = _4246;
    float _4314 = _4248;
    float _4316 = _4250;
    float _4318 = _4252;
    float _4336;
    float _4338;
    float _4340;
    float _4342;
    if (!_4286)
    {
        bool _4320 = _4282 >= 3;
        bool _4322 = !_4320;
        if (!_4322)
        {
            bool _4324 = _4282 != 3;
            _4326 = _4324;
            if (!_4326)
            {
                float _4328 = _529 + _4222;
                float _4330 = _531 + _4224;
                float _4332 = _533 + _4226;
                float _4334 = _4228 + 1.0;
                _4296 = _4328;
                _4298 = _4330;
                _4300 = _4332;
                _4302 = _4334;
                _4336 = _4230;
                _4338 = _4232;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = true;
            }
        }
        else
        {
            float _4346 = _529 + _4238;
            float _4348 = _531 + _4240;
            float _4350 = _533 + _4242;
            float _4352 = _4244 + 1.0;
            _4336 = _4230;
            _4338 = _4232;
            _4340 = _4234;
            _4342 = _4236;
            _4304 = _4346;
            _4306 = _4348;
            _4308 = _4350;
            _4310 = _4352;
            _4344 = true;
        }
    }
    if ((!_4344) || _4326)
    {
        bool _4354;
        if (!_4326)
        {
            _4354 = _4282 >= 1;
        }
        if ((!_4354) || _4326)
        {
            if (!_4326)
            {
                bool _4356 = _4282 != 0;
                if (!_4356)
                {
                    float _4358 = _529 + _4230;
                    _4288 = _4358;
                }
                float _4360 = _4288;
                _4336 = _4360;
                if (!_4356)
                {
                    float _4362 = _531 + _4232;
                    _4290 = _4362;
                }
                float _4364 = _4290;
                _4338 = _4364;
                if (!_4356)
                {
                    float _4366 = _533 + _4234;
                    _4292 = _4366;
                }
                float _4368 = _4292;
                _4340 = _4368;
                if (!_4356)
                {
                    float _4370 = _4236 + 1.0;
                    _4294 = _4370;
                }
                float _4372 = _4294;
                bool _4374 = !_4356;
                _4342 = _4372;
                _4344 = _4374;
            }
            if ((!_4344) || _4326)
            {
                _4326 = false;
                _4336 = _4230;
                _4338 = _4232;
                _4340 = _4234;
                _4342 = _4236;
                _4344 = true;
            }
        }
        else
        {
            float _4376 = _529 + _4246;
            float _4378 = _531 + _4248;
            float _4380 = _533 + _4250;
            float _4382 = _4252 + 1.0;
            _4336 = _4230;
            _4338 = _4232;
            _4340 = _4234;
            _4342 = _4236;
            _4312 = _4376;
            _4314 = _4378;
            _4316 = _4380;
            _4318 = _4382;
        }
    }
    _4344 = false;
    float _4384 = _4296;
    float _4386 = _4298;
    float _4388 = _4300;
    float _4390 = _4302;
    float _4392 = _4336;
    float _4394 = _4338;
    float _4396 = _4340;
    float _4398 = _4342;
    float _4400 = _4304;
    float _4402 = _4306;
    float _4404 = _4308;
    float _4406 = _4310;
    float _4408 = _4312;
    float _4410 = _4314;
    float _4412 = _4316;
    float _4414 = _4318;
    float _4416 = -_2955;
    float _4418 = _569 + _4416;
    float _4420 = -_2959;
    float _4422 = _567 + _4420;
    float _4424 = _2969 * _4418;
    float _4426 = -_2963;
    float _4428 = _571 + _4426;
    float _4430 = fma(_2973, _4422, _4424);
    float _4432 = fma(_2977, _4428, _4430);
    float _4434 = _3005 * _4432;
    float _4436 = rint(_4434);
    float _4438 = precise::max(0.0, _4436);
    float _4440 = precise::min(_4438, 3.0);
    float _4442 = trunc(_4440);
    int _4444 = int(_4442);
    bool _4446 = _4444 >= 2;
    bool _4448 = !_4446;
    float _4450 = as_type<float>(_4444);
    float _4452 = _4436;
    float _4454 = _4430;
    float _4456 = _4424;
    float _4458 = _4384;
    float _4460 = _4386;
    float _4462 = _4388;
    float _4464 = _4390;
    float _4466 = _4400;
    float _4468 = _4402;
    float _4470 = _4404;
    float _4472 = _4406;
    float _4474 = _4408;
    float _4476 = _4410;
    float _4478 = _4412;
    float _4480 = _4414;
    float _4498;
    float _4500;
    float _4502;
    float _4504;
    if (!_4448)
    {
        bool _4482 = _4444 >= 3;
        bool _4484 = !_4482;
        if (!_4484)
        {
            bool _4486 = _4444 != 3;
            _4488 = _4486;
            if (!_4488)
            {
                float _4490 = _567 + _4384;
                float _4492 = _569 + _4386;
                float _4494 = _571 + _4388;
                float _4496 = _4390 + 1.0;
                _4458 = _4490;
                _4460 = _4492;
                _4462 = _4494;
                _4464 = _4496;
                _4498 = _4392;
                _4500 = _4394;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = true;
            }
        }
        else
        {
            float _4508 = _567 + _4400;
            float _4510 = _569 + _4402;
            float _4512 = _571 + _4404;
            float _4514 = _4406 + 1.0;
            _4498 = _4392;
            _4500 = _4394;
            _4502 = _4396;
            _4504 = _4398;
            _4466 = _4508;
            _4468 = _4510;
            _4470 = _4512;
            _4472 = _4514;
            _4506 = true;
        }
    }
    if ((!_4506) || _4488)
    {
        bool _4516;
        if (!_4488)
        {
            _4516 = _4444 >= 1;
        }
        if ((!_4516) || _4488)
        {
            if (!_4488)
            {
                bool _4518 = _4444 != 0;
                if (!_4518)
                {
                    float _4520 = _567 + _4392;
                    _4450 = _4520;
                }
                float _4522 = _4450;
                _4498 = _4522;
                if (!_4518)
                {
                    float _4524 = _569 + _4394;
                    _4452 = _4524;
                }
                float _4526 = _4452;
                _4500 = _4526;
                if (!_4518)
                {
                    float _4528 = _571 + _4396;
                    _4454 = _4528;
                }
                float _4530 = _4454;
                _4502 = _4530;
                if (!_4518)
                {
                    float _4532 = _4398 + 1.0;
                    _4456 = _4532;
                }
                float _4534 = _4456;
                bool _4536 = !_4518;
                _4504 = _4534;
                _4506 = _4536;
            }
            if ((!_4506) || _4488)
            {
                _4488 = false;
                _4498 = _4392;
                _4500 = _4394;
                _4502 = _4396;
                _4504 = _4398;
                _4506 = true;
            }
        }
        else
        {
            float _4538 = _567 + _4408;
            float _4540 = _569 + _4410;
            float _4542 = _571 + _4412;
            float _4544 = _4414 + 1.0;
            _4498 = _4392;
            _4500 = _4394;
            _4502 = _4396;
            _4504 = _4398;
            _4474 = _4538;
            _4476 = _4540;
            _4478 = _4542;
            _4480 = _4544;
        }
    }
    _4506 = false;
    float _4546 = _4458;
    float _4548 = _4460;
    float _4550 = _4462;
    float _4552 = _4464;
    float _4554 = _4498;
    float _4556 = _4500;
    float _4558 = _4502;
    float _4560 = _4504;
    float _4562 = _4466;
    float _4564 = _4468;
    float _4566 = _4470;
    float _4568 = _4472;
    float _4570 = _4474;
    float _4572 = _4476;
    float _4574 = _4478;
    float _4576 = _4480;
    float _4578 = -_2955;
    float _4580 = _581 + _4578;
    float _4582 = -_2959;
    float _4584 = _579 + _4582;
    float _4586 = _2969 * _4580;
    float _4588 = -_2963;
    float _4590 = _583 + _4588;
    float _4592 = fma(_2973, _4584, _4586);
    float _4594 = fma(_2977, _4590, _4592);
    float _4596 = _3005 * _4594;
    float _4598 = rint(_4596);
    float _4600 = precise::max(0.0, _4598);
    float _4602 = precise::min(_4600, 3.0);
    float _4604 = trunc(_4602);
    int _4606 = int(_4604);
    bool _4608 = _4606 >= 2;
    bool _4610 = !_4608;
    float _4612 = _4598;
    float _4614 = as_type<float>(_4606);
    float _4616 = _4586;
    float _4618 = _4592;
    float _4620 = _4546;
    float _4622 = _4548;
    float _4624 = _4550;
    float _4626 = _4552;
    float _4628 = _4562;
    float _4630 = _4564;
    float _4632 = _4566;
    float _4634 = _4568;
    float _4636 = _4570;
    float _4638 = _4572;
    float _4640 = _4574;
    float _4642 = _4576;
    float _4660;
    float _4662;
    float _4664;
    float _4666;
    if (!_4610)
    {
        bool _4644 = _4606 >= 3;
        bool _4646 = !_4644;
        if (!_4646)
        {
            bool _4648 = _4606 != 3;
            _4650 = _4648;
            if (!_4650)
            {
                float _4652 = _579 + _4546;
                float _4654 = _581 + _4548;
                float _4656 = _583 + _4550;
                float _4658 = _4552 + 1.0;
                _4620 = _4652;
                _4622 = _4654;
                _4624 = _4656;
                _4626 = _4658;
                _4660 = _4554;
                _4662 = _4556;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = true;
            }
        }
        else
        {
            float _4670 = _579 + _4562;
            float _4672 = _581 + _4564;
            float _4674 = _583 + _4566;
            float _4676 = _4568 + 1.0;
            _4660 = _4554;
            _4662 = _4556;
            _4664 = _4558;
            _4666 = _4560;
            _4628 = _4670;
            _4630 = _4672;
            _4632 = _4674;
            _4634 = _4676;
            _4668 = true;
        }
    }
    if ((!_4668) || _4650)
    {
        bool _4678;
        if (!_4650)
        {
            _4678 = _4606 >= 1;
        }
        if ((!_4678) || _4650)
        {
            if (!_4650)
            {
                bool _4680 = _4606 != 0;
                if (!_4680)
                {
                    float _4682 = _579 + _4554;
                    _4612 = _4682;
                }
                float _4684 = _4612;
                _4660 = _4684;
                if (!_4680)
                {
                    float _4686 = _581 + _4556;
                    _4614 = _4686;
                }
                float _4688 = _4614;
                _4662 = _4688;
                if (!_4680)
                {
                    float _4690 = _583 + _4558;
                    _4616 = _4690;
                }
                float _4692 = _4616;
                _4664 = _4692;
                if (!_4680)
                {
                    float _4694 = _4560 + 1.0;
                    _4618 = _4694;
                }
                float _4696 = _4618;
                bool _4698 = !_4680;
                _4666 = _4696;
                _4668 = _4698;
            }
            if ((!_4668) || _4650)
            {
                _4650 = false;
                _4660 = _4554;
                _4662 = _4556;
                _4664 = _4558;
                _4666 = _4560;
                _4668 = true;
            }
        }
        else
        {
            float _4700 = _579 + _4570;
            float _4702 = _581 + _4572;
            float _4704 = _583 + _4574;
            float _4706 = _4576 + 1.0;
            _4660 = _4554;
            _4662 = _4556;
            _4664 = _4558;
            _4666 = _4560;
            _4636 = _4700;
            _4638 = _4702;
            _4640 = _4704;
            _4642 = _4706;
        }
    }
    _4668 = false;
    float _4708 = _4620;
    float _4710 = _4622;
    float _4712 = _4624;
    float _4714 = _4626;
    float _4716 = _4660;
    float _4718 = _4662;
    float _4720 = _4664;
    float _4722 = _4666;
    float _4724 = _4628;
    float _4726 = _4630;
    float _4728 = _4632;
    float _4730 = _4634;
    float _4732 = _4636;
    float _4734 = _4638;
    float _4736 = _4640;
    float _4738 = _4642;
    float _4740 = -_2955;
    float _4742 = _599 + _4740;
    float _4744 = -_2959;
    float _4746 = _597 + _4744;
    float _4748 = _2969 * _4742;
    float _4750 = -_2963;
    float _4752 = _601 + _4750;
    float _4754 = fma(_2973, _4746, _4748);
    float _4756 = fma(_2977, _4752, _4754);
    float _4758 = _3005 * _4756;
    float _4760 = rint(_4758);
    float _4762 = precise::max(0.0, _4760);
    float _4764 = precise::min(_4762, 3.0);
    float _4766 = trunc(_4764);
    int _4768 = int(_4766);
    bool _4770 = _4768 >= 2;
    bool _4772 = !_4770;
    float _4774 = as_type<float>(_4768);
    float _4776 = _4760;
    float _4778 = _4754;
    float _4780 = _4748;
    float _4782 = _4708;
    float _4784 = _4710;
    float _4786 = _4712;
    float _4788 = _4714;
    float _4790 = _4724;
    float _4792 = _4726;
    float _4794 = _4728;
    float _4796 = _4730;
    float _4798 = _4732;
    float _4800 = _4734;
    float _4802 = _4736;
    float _4804 = _4738;
    float _4822;
    float _4824;
    float _4826;
    float _4828;
    if (!_4772)
    {
        bool _4806 = _4768 >= 3;
        bool _4808 = !_4806;
        if (!_4808)
        {
            bool _4810 = _4768 != 3;
            _4812 = _4810;
            if (!_4812)
            {
                float _4814 = _597 + _4708;
                float _4816 = _599 + _4710;
                float _4818 = _601 + _4712;
                float _4820 = _4714 + 1.0;
                _4782 = _4814;
                _4784 = _4816;
                _4786 = _4818;
                _4788 = _4820;
                _4822 = _4716;
                _4824 = _4718;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = true;
            }
        }
        else
        {
            float _4832 = _597 + _4724;
            float _4834 = _599 + _4726;
            float _4836 = _601 + _4728;
            float _4838 = _4730 + 1.0;
            _4822 = _4716;
            _4824 = _4718;
            _4826 = _4720;
            _4828 = _4722;
            _4790 = _4832;
            _4792 = _4834;
            _4794 = _4836;
            _4796 = _4838;
            _4830 = true;
        }
    }
    if ((!_4830) || _4812)
    {
        bool _4840;
        if (!_4812)
        {
            _4840 = _4768 >= 1;
        }
        if ((!_4840) || _4812)
        {
            if (!_4812)
            {
                bool _4842 = _4768 != 0;
                if (!_4842)
                {
                    float _4844 = _597 + _4716;
                    _4774 = _4844;
                }
                float _4846 = _4774;
                _4822 = _4846;
                if (!_4842)
                {
                    float _4848 = _599 + _4718;
                    _4776 = _4848;
                }
                float _4850 = _4776;
                _4824 = _4850;
                if (!_4842)
                {
                    float _4852 = _601 + _4720;
                    _4778 = _4852;
                }
                float _4854 = _4778;
                _4826 = _4854;
                if (!_4842)
                {
                    float _4856 = _4722 + 1.0;
                    _4780 = _4856;
                }
                float _4858 = _4780;
                bool _4860 = !_4842;
                _4828 = _4858;
                _4830 = _4860;
            }
            if ((!_4830) || _4812)
            {
                _4812 = false;
                _4822 = _4716;
                _4824 = _4718;
                _4826 = _4720;
                _4828 = _4722;
                _4830 = true;
            }
        }
        else
        {
            float _4862 = _597 + _4732;
            float _4864 = _599 + _4734;
            float _4866 = _601 + _4736;
            float _4868 = _4738 + 1.0;
            _4822 = _4716;
            _4824 = _4718;
            _4826 = _4720;
            _4828 = _4722;
            _4798 = _4862;
            _4800 = _4864;
            _4802 = _4866;
            _4804 = _4868;
        }
    }
    _4830 = false;
    float _4870 = _4782;
    float _4872 = _4784;
    float _4874 = _4786;
    float _4876 = _4788;
    float _4878 = _4822;
    float _4880 = _4824;
    float _4882 = _4826;
    float _4884 = _4828;
    float _4886 = _4790;
    float _4888 = _4792;
    float _4890 = _4794;
    float _4892 = _4796;
    float _4894 = _4798;
    float _4896 = _4800;
    float _4898 = _4802;
    float _4900 = _4804;
    float _4902 = -_2955;
    float _4904 = _615 + _4902;
    float _4906 = -_2959;
    float _4908 = _613 + _4906;
    float _4910 = _2969 * _4904;
    float _4912 = -_2963;
    float _4914 = _617 + _4912;
    float _4916 = fma(_2973, _4908, _4910);
    float _4918 = fma(_2977, _4914, _4916);
    float _4920 = _3005 * _4918;
    float _4922 = rint(_4920);
    float _4924 = precise::max(0.0, _4922);
    float _4926 = precise::min(_4924, 3.0);
    float _4928 = trunc(_4926);
    int _4930 = int(_4928);
    bool _4932 = _4930 >= 2;
    bool _4934 = !_4932;
    float _4936 = _4922;
    float _4938 = as_type<float>(_4930);
    float _4940 = _4910;
    float _4942 = _4916;
    float _4944 = _4870;
    float _4946 = _4872;
    float _4948 = _4874;
    float _4950 = _4876;
    float _4952 = _4886;
    float _4954 = _4888;
    float _4956 = _4890;
    float _4958 = _4892;
    float _4960 = _4894;
    float _4962 = _4896;
    float _4964 = _4898;
    float _4966 = _4900;
    float _4984;
    float _4986;
    float _4988;
    float _4990;
    if (!_4934)
    {
        bool _4968 = _4930 >= 3;
        bool _4970 = !_4968;
        if (!_4970)
        {
            bool _4972 = _4930 != 3;
            _4974 = _4972;
            if (!_4974)
            {
                float _4976 = _613 + _4870;
                float _4978 = _615 + _4872;
                float _4980 = _617 + _4874;
                float _4982 = _4876 + 1.0;
                _4944 = _4976;
                _4946 = _4978;
                _4948 = _4980;
                _4950 = _4982;
                _4984 = _4878;
                _4986 = _4880;
                _4988 = _4882;
                _4990 = _4884;
                _4992 = true;
            }
        }
        else
        {
            float _4994 = _613 + _4886;
            float _4996 = _615 + _4888;
            float _4998 = _617 + _4890;
            float _5000 = _4892 + 1.0;
            _4984 = _4878;
            _4986 = _4880;
            _4988 = _4882;
            _4990 = _4884;
            _4952 = _4994;
            _4954 = _4996;
            _4956 = _4998;
            _4958 = _5000;
            _4992 = true;
        }
    }
    if ((!_4992) || _4974)
    {
        bool _5002;
        if (!_4974)
        {
            _5002 = _4930 >= 1;
        }
        if ((!_5002) || _4974)
        {
            if (!_4974)
            {
                bool _5004 = _4930 != 0;
                if (!_5004)
                {
                    float _5006 = _613 + _4878;
                    _4936 = _5006;
                }
                float _5008 = _4936;
                _4984 = _5008;
                if (!_5004)
                {
                    float _5010 = _615 + _4880;
                    _4938 = _5010;
                }
                float _5012 = _4938;
                _4986 = _5012;
                if (!_5004)
                {
                    float _5014 = _617 + _4882;
                    _4940 = _5014;
                }
                float _5016 = _4940;
                _4988 = _5016;
                if (!_5004)
                {
                    float _5018 = _4884 + 1.0;
                    _4942 = _5018;
                }
                float _5020 = _4942;
                bool _5022 = !_5004;
                _4990 = _5020;
                _4992 = _5022;
            }
            if ((!_4992) || _4974)
            {
                _4974 = false;
                _4984 = _4878;
                _4986 = _4880;
                _4988 = _4882;
                _4990 = _4884;
                _4992 = true;
            }
        }
        else
        {
            float _5024 = _613 + _4894;
            float _5026 = _615 + _4896;
            float _5028 = _617 + _4898;
            float _5030 = _4900 + 1.0;
            _4984 = _4878;
            _4986 = _4880;
            _4988 = _4882;
            _4990 = _4884;
            _4960 = _5024;
            _4962 = _5026;
            _4964 = _5028;
            _4966 = _5030;
        }
    }
    _4992 = false;
    float _5032 = _4944;
    float _5034 = _4946;
    float _5036 = _4948;
    float _5038 = _4950;
    float _5040 = _4984;
    float _5042 = _4986;
    float _5044 = _4988;
    float _5046 = _4990;
    float _5048 = _4952;
    float _5050 = _4954;
    float _5052 = _4956;
    float _5054 = _4958;
    float _5056 = _4960;
    float _5058 = _4962;
    float _5060 = _4964;
    float _5062 = _4966;
    float _5064 = -_2955;
    float _5066 = _631 + _5064;
    float _5068 = -_2959;
    float _5070 = _629 + _5068;
    float _5072 = _2969 * _5066;
    float _5074 = -_2963;
    float _5076 = _633 + _5074;
    float _5078 = fma(_2973, _5070, _5072);
    float _5080 = fma(_2977, _5076, _5078);
    float _5082 = _3005 * _5080;
    float _5084 = rint(_5082);
    float _5086 = precise::max(0.0, _5084);
    float _5088 = precise::min(_5086, 3.0);
    float _5090 = trunc(_5088);
    int _5092 = int(_5090);
    bool _5094 = _5092 >= 2;
    bool _5096 = !_5094;
    float _5098 = as_type<float>(_5092);
    float _5100 = _5084;
    float _5102 = _5078;
    float _5104 = _5072;
    float _5106 = _5032;
    float _5108 = _5034;
    float _5110 = _5036;
    float _5112 = _5038;
    float _5114 = _5048;
    float _5116 = _5050;
    float _5118 = _5052;
    float _5120 = _5054;
    float _5122 = _5056;
    float _5124 = _5058;
    float _5126 = _5060;
    float _5128 = _5062;
    float _5146;
    float _5148;
    float _5150;
    float _5152;
    if (!_5096)
    {
        bool _5130 = _5092 >= 3;
        bool _5132 = !_5130;
        if (!_5132)
        {
            bool _5134 = _5092 != 3;
            _5136 = _5134;
            if (!_5136)
            {
                float _5138 = _629 + _5032;
                float _5140 = _631 + _5034;
                float _5142 = _633 + _5036;
                float _5144 = _5038 + 1.0;
                _5106 = _5138;
                _5108 = _5140;
                _5110 = _5142;
                _5112 = _5144;
                _5146 = _5040;
                _5148 = _5042;
                _5150 = _5044;
                _5152 = _5046;
                _5154 = true;
            }
        }
        else
        {
            float _5156 = _629 + _5048;
            float _5158 = _631 + _5050;
            float _5160 = _633 + _5052;
            float _5162 = _5054 + 1.0;
            _5146 = _5040;
            _5148 = _5042;
            _5150 = _5044;
            _5152 = _5046;
            _5114 = _5156;
            _5116 = _5158;
            _5118 = _5160;
            _5120 = _5162;
            _5154 = true;
        }
    }
    if ((!_5154) || _5136)
    {
        bool _5164;
        if (!_5136)
        {
            _5164 = _5092 >= 1;
        }
        if ((!_5164) || _5136)
        {
            if (!_5136)
            {
                bool _5166 = _5092 != 0;
                if (!_5166)
                {
                    float _5168 = _629 + _5040;
                    _5098 = _5168;
                }
                float _5170 = _5098;
                _5146 = _5170;
                if (!_5166)
                {
                    float _5172 = _631 + _5042;
                    _5100 = _5172;
                }
                float _5174 = _5100;
                _5148 = _5174;
                if (!_5166)
                {
                    float _5176 = _633 + _5044;
                    _5102 = _5176;
                }
                float _5178 = _5102;
                _5150 = _5178;
                if (!_5166)
                {
                    float _5180 = _5046 + 1.0;
                    _5104 = _5180;
                }
                float _5182 = _5104;
                bool _5184 = !_5166;
                _5152 = _5182;
                _5154 = _5184;
            }
            if ((!_5154) || _5136)
            {
                _5136 = false;
                _5146 = _5040;
                _5148 = _5042;
                _5150 = _5044;
                _5152 = _5046;
                _5154 = true;
            }
        }
        else
        {
            float _5186 = _629 + _5056;
            float _5188 = _631 + _5058;
            float _5190 = _633 + _5060;
            float _5192 = _5062 + 1.0;
            _5146 = _5040;
            _5148 = _5042;
            _5150 = _5044;
            _5152 = _5046;
            _5122 = _5186;
            _5124 = _5188;
            _5126 = _5190;
            _5128 = _5192;
        }
    }
    _5154 = false;
    float _5194 = _5106;
    float _5196 = _5108;
    float _5198 = _5110;
    float _5200 = _5112;
    float _5202 = _5146;
    float _5204 = _5148;
    float _5206 = _5150;
    float _5208 = _5152;
    float _5210 = _5114;
    float _5212 = _5116;
    float _5214 = _5118;
    float _5216 = _5120;
    float _5218 = _5122;
    float _5220 = _5124;
    float _5222 = _5126;
    float _5224 = _5128;
    float _5226 = -_2955;
    float _5228 = _647 + _5226;
    float _5230 = -_2959;
    float _5232 = _645 + _5230;
    float _5234 = _2969 * _5228;
    float _5236 = -_2963;
    float _5238 = _649 + _5236;
    float _5240 = fma(_2973, _5232, _5234);
    float _5242 = fma(_2977, _5238, _5240);
    float _5244 = _3005 * _5242;
    float _5246 = rint(_5244);
    float _5248 = precise::max(0.0, _5246);
    float _5250 = precise::min(_5248, 3.0);
    float _5252 = trunc(_5250);
    int _5254 = int(_5252);
    bool _5256 = _5254 >= 2;
    bool _5258 = !_5256;
    float _5260 = _5246;
    float _5262 = as_type<float>(_5254);
    float _5264 = _5234;
    float _5266 = _5240;
    float _5268 = _5194;
    float _5270 = _5196;
    float _5272 = _5198;
    float _5274 = _5200;
    float _5276 = _5210;
    float _5278 = _5212;
    float _5280 = _5214;
    float _5282 = _5216;
    float _5284 = _5218;
    float _5286 = _5220;
    float _5288 = _5222;
    float _5290 = _5224;
    float _5308;
    float _5310;
    float _5312;
    float _5314;
    if (!_5258)
    {
        bool _5292 = _5254 >= 3;
        bool _5294 = !_5292;
        if (!_5294)
        {
            bool _5296 = _5254 != 3;
            _5298 = _5296;
            if (!_5298)
            {
                float _5300 = _645 + _5194;
                float _5302 = _647 + _5196;
                float _5304 = _649 + _5198;
                float _5306 = _5200 + 1.0;
                _5268 = _5300;
                _5270 = _5302;
                _5272 = _5304;
                _5274 = _5306;
                _5308 = _5202;
                _5310 = _5204;
                _5312 = _5206;
                _5314 = _5208;
                _5316 = true;
            }
        }
        else
        {
            float _5318 = _645 + _5210;
            float _5320 = _647 + _5212;
            float _5322 = _649 + _5214;
            float _5324 = _5216 + 1.0;
            _5308 = _5202;
            _5310 = _5204;
            _5312 = _5206;
            _5314 = _5208;
            _5276 = _5318;
            _5278 = _5320;
            _5280 = _5322;
            _5282 = _5324;
            _5316 = true;
        }
    }
    if ((!_5316) || _5298)
    {
        bool _5326;
        if (!_5298)
        {
            _5326 = _5254 >= 1;
        }
        if ((!_5326) || _5298)
        {
            if (!_5298)
            {
                bool _5328 = _5254 != 0;
                if (!_5328)
                {
                    float _5330 = _645 + _5202;
                    _5260 = _5330;
                }
                float _5332 = _5260;
                _5308 = _5332;
                if (!_5328)
                {
                    float _5334 = _647 + _5204;
                    _5262 = _5334;
                }
                float _5336 = _5262;
                _5310 = _5336;
                if (!_5328)
                {
                    float _5338 = _649 + _5206;
                    _5264 = _5338;
                }
                float _5340 = _5264;
                _5312 = _5340;
                if (!_5328)
                {
                    float _5342 = _5208 + 1.0;
                    _5266 = _5342;
                }
                float _5344 = _5266;
                bool _5346 = !_5328;
                _5314 = _5344;
                _5316 = _5346;
            }
            if ((!_5316) || _5298)
            {
                _5298 = false;
                _5308 = _5202;
                _5310 = _5204;
                _5312 = _5206;
                _5314 = _5208;
                _5316 = true;
            }
        }
        else
        {
            float _5348 = _645 + _5218;
            float _5350 = _647 + _5220;
            float _5352 = _649 + _5222;
            float _5354 = _5224 + 1.0;
            _5308 = _5202;
            _5310 = _5204;
            _5312 = _5206;
            _5314 = _5208;
            _5284 = _5348;
            _5286 = _5350;
            _5288 = _5352;
            _5290 = _5354;
        }
    }
    _5316 = false;
    float _5356 = _5268;
    float _5358 = _5270;
    float _5360 = _5272;
    float _5362 = _5274;
    float _5364 = _5308;
    float _5366 = _5310;
    float _5368 = _5312;
    float _5370 = _5314;
    float _5372 = _5276;
    float _5374 = _5278;
    float _5376 = _5280;
    float _5378 = _5282;
    float _5380 = _5284;
    float _5382 = _5286;
    float _5384 = _5288;
    float _5386 = _5290;
    float _5388 = -_2955;
    float _5390 = _657 + _5388;
    float _5392 = -_2959;
    float _5394 = _655 + _5392;
    float _5396 = _2969 * _5390;
    float _5398 = -_2963;
    float _5400 = _659 + _5398;
    float _5402 = fma(_2973, _5394, _5396);
    float _5404 = fma(_2977, _5400, _5402);
    float _5406 = _3005 * _5404;
    float _5408 = rint(_5406);
    float _5410 = precise::max(0.0, _5408);
    float _5412 = precise::min(_5410, 3.0);
    float _5414 = trunc(_5412);
    int _5416 = int(_5414);
    bool _5418 = _5416 >= 2;
    bool _5420 = !_5418;
    float _5422 = as_type<float>(_5416);
    float _5424 = _5408;
    float _5426 = _5402;
    float _5428 = _5396;
    float _5430 = _5372;
    float _5432 = _5374;
    float _5434 = _5380;
    float _5436 = _5382;
    float _5438 = _5386;
    float _5440 = _5378;
    float _5442 = _5362;
    float _5444 = _5384;
    float _5446 = _5376;
    float _5448 = _5356;
    float _5450 = _5358;
    float _5452 = _5360;
    float _5470;
    float _5472;
    float _5474;
    float _5476;
    if (!_5420)
    {
        bool _5454 = _5416 >= 3;
        bool _5456 = !_5454;
        if (!_5456)
        {
            bool _5458 = _5416 != 3;
            _5460 = _5458;
            if (!_5460)
            {
                float _5462 = _655 + _5356;
                float _5464 = _657 + _5358;
                float _5466 = _659 + _5360;
                float _5468 = _5362 + 1.0;
                _5470 = _5364;
                _5472 = _5370;
                _5442 = _5468;
                _5474 = _5366;
                _5476 = _5368;
                _5448 = _5462;
                _5450 = _5464;
                _5452 = _5466;
                _5478 = true;
            }
        }
        else
        {
            float _5480 = _655 + _5372;
            float _5482 = _657 + _5374;
            float _5484 = _659 + _5376;
            float _5486 = _5378 + 1.0;
            _5430 = _5480;
            _5432 = _5482;
            _5440 = _5486;
            _5470 = _5364;
            _5472 = _5370;
            _5474 = _5366;
            _5446 = _5484;
            _5476 = _5368;
            _5478 = true;
        }
    }
    if ((!_5478) || _5460)
    {
        bool _5488;
        if (!_5460)
        {
            _5488 = _5416 >= 1;
        }
        if ((!_5488) || _5460)
        {
            if (!_5460)
            {
                bool _5490 = _5416 != 0;
                if (!_5490)
                {
                    float _5492 = _655 + _5364;
                    _5422 = _5492;
                }
                float _5494 = _5422;
                _5470 = _5494;
                if (!_5490)
                {
                    float _5496 = _657 + _5366;
                    _5424 = _5496;
                }
                float _5498 = _5424;
                _5474 = _5498;
                if (!_5490)
                {
                    float _5500 = _659 + _5368;
                    _5426 = _5500;
                }
                float _5502 = _5426;
                _5476 = _5502;
                if (!_5490)
                {
                    float _5504 = _5370 + 1.0;
                    _5428 = _5504;
                }
                float _5506 = _5428;
                bool _5508 = !_5490;
                _5472 = _5506;
                _5478 = _5508;
            }
            if ((!_5478) || _5460)
            {
                _5460 = false;
                _5470 = _5364;
                _5472 = _5370;
                _5474 = _5366;
                _5476 = _5368;
                _5478 = true;
            }
        }
        else
        {
            float _5510 = _655 + _5380;
            float _5512 = _657 + _5382;
            float _5514 = _659 + _5384;
            float _5516 = _5386 + 1.0;
            _5434 = _5510;
            _5436 = _5512;
            _5438 = _5516;
            _5470 = _5364;
            _5472 = _5370;
            _5474 = _5366;
            _5444 = _5514;
            _5476 = _5368;
        }
    }
    _5478 = false;
    float _5518 = _5430;
    float _5520 = _5432;
    float _5522 = _5434;
    float _5524 = _5436;
    float _5526 = _5438;
    float _5528 = _5440;
    float _5530 = _5470;
    float _5532 = _5472;
    float _5534 = _5442;
    float _5536 = _5474;
    float _5538 = _5444;
    float _5540 = _5446;
    float _5542 = _5476;
    float _5544 = _5448;
    float _5546 = _5450;
    float _5548 = _5452;
    float _5550 = _5518 * 6.0;
    float _5552 = _5520 * 6.0;
    float _5554 = _5522 * 6.0;
    float _5556 = _5524 * 6.0;
    float _5558 = fma(_5522, 3.0, _5550);
    float _5560 = fma(_5524, 3.0, _5552);
    float _5562 = _5526 * 4.0;
    float _5564 = fma(_5528, 4.0, _5526);
    _24[1] = as_type<uint>(_655);
    float _5566 = fma(_5530, 9.0, _5554);
    float _5568 = fma(_5532, 9.0, _5562);
    float _5570 = fma(_5534, 9.0, _5564);
    _24[0] = as_type<uint>(_659);
    float _5572 = precise::max(_499, _525);
    float _5574 = fma(_5536, 9.0, _5556);
    float _5576 = precise::max(_585, _603);
    float _5578 = _5538 * 6.0;
    float _5580 = precise::max(_421, _473);
    float _5582 = _5540 * 6.0;
    float _5584 = _5528 + _5526;
    float _5586 = precise::max(_535, _573);
    float _5588 = fma(_5542, 9.0, _5578);
    float _5590 = precise::max(_5580, _5572);
    float _5592 = fma(_5538, 3.0, _5582);
    float _5594 = precise::max(_5586, _5576);
    float _5596 = as_type<float>(_24[1]);
    float _5598 = precise::max(_351, _361);
    float _5600 = _5568 + _5528;
    float _5602 = precise::max(_371, _411);
    float _5604 = as_type<float>(_24[0]);
    float _5606 = precise::max(_619, _635);
    float _5608 = _5600 * _5570;
    float _5610 = precise::max(_5598, _5602);
    float _5612 = _5584 * 2.0;
    float _5614 = precise::max(_651, _661);
    float _5616 = -_5608;
    float _5618 = fma(_5612, _5612, _5616);
    bool _5620 = _5618 != 0.0;
    bool _5622 = isnan(_5618);
    bool _5624 = _5620 || _5622;
    bool _5626 = isnan(0.0);
    bool _5628 = _5624 || _5626;
    float _5630 = precise::max(_5606, _5614);
    float _5632 = precise::max(_5610, _5590);
    float _5634 = precise::max(_5594, _5630);
    float _5636 = fma(_5518, 3.0, _5566);
    float _5638 = fma(_5540, 3.0, _5588);
    float _5640 = fma(_5520, 3.0, _5574);
    float _5642 = fma(_5544, 9.0, _5558);
    float _5644 = fma(_5546, 9.0, _5560);
    float _5646 = fma(_5548, 9.0, _5592);
    float _5648 = precise::max(_5632, _5634);
    bool _5650 = !_5628;
    if (!_5650)
    {
        float _5652 = 1.0 / _5618;
        float _5654 = _5600 * _5642;
        float _5656 = _5636 * _5570;
        float _5658 = -_5654;
        float _5660 = fma(_5636, _5612, _5658);
        float _5662 = -_5656;
        float _5664 = fma(_5642, _5612, _5662);
        float _5666 = _5600 * _5644;
        float _5668 = _5640 * _5570;
        float _5670 = _5600 * _5646;
        float _5672 = _5638 * _5570;
        float _5674 = -_5666;
        float _5676 = fma(_5640, _5612, _5674);
        float _5678 = -_5668;
        float _5680 = fma(_5644, _5612, _5678);
        float _5682 = -_5670;
        float _5684 = fma(_5638, _5612, _5682);
        float _5686 = -_5672;
        float _5688 = fma(_5646, _5612, _5686);
        float _5690 = _5680 * _5652;
        float _5692 = _5660 * _5652;
        float _5694 = _5676 * _5652;
        float _5696 = _5684 * _5652;
        float _5698 = _5664 * _5652;
        float _5700 = _5688 * _5652;
        float _5702 = -_5690;
        float _5704 = _5694 + _5702;
        float _5706 = -_5698;
        float _5708 = _5692 + _5706;
        float _5710 = -_5700;
        float _5712 = _5696 + _5710;
        _3024 = _5708;
        _3026 = _5704;
        _3028 = _5712;
        _3030 = _5698;
        _3032 = _5692;
        _3034 = _5690;
        _3036 = _5694;
        _3038 = _5700;
        _3040 = _5696;
    }
    float _5714 = _3024;
    float _5716 = _3026;
    float _5718 = _3028;
    float _5720 = _3030;
    float _5722 = _3032;
    float _5724 = _3034;
    float _5726 = _3036;
    float _5728 = _3038;
    float _5730 = _3040;
    float _5732 = fma(_5714, 496.0, 0.5);
    float _5734 = precise::clamp(_5732, 0.0, 1.0);
    float _5736 = fma(_5716, 1008.0, 0.5);
    float _5738 = precise::clamp(_5736, 0.0, 1.0);
    float _5740 = fma(_5714, -31.0, 1.0);
    float _5742 = precise::clamp(_5740, 0.0, 1.0);
    float _5744 = fma(_5718, 496.0, 0.5);
    float _5746 = precise::clamp(_5744, 0.0, 1.0);
    float _5748 = _5734 + (-0.5);
    float _5750 = fma(_5716, -63.0, 1.0);
    float _5752 = precise::clamp(_5750, 0.0, 1.0);
    float _5754 = _5738 + (-0.5);
    float _5756 = fma(_5718, -31.0, 1.0);
    float _5758 = precise::clamp(_5756, 0.0, 1.0);
    float _5760 = _5742 * _5748;
    float _5762 = _5746 + (-0.5);
    float _5764 = _5752 * _5754;
    float _5766 = _5764 * 2.0;
    float _5768 = _5648 * 255.0;
    float _5770 = fma(_5760, -0.0322580635547637939453125, _5720);
    float _5772 = precise::clamp(_5770, 0.0, 1.0);
    float _5774 = _5758 * _5762;
    float _5776 = fma(_5760, 0.0322580635547637939453125, _5722);
    float _5778 = precise::clamp(_5776, 0.0, 1.0);
    float _5780 = fma(_5766, -0.01587301678955554962158203125, _5724);
    float _5782 = precise::clamp(_5780, 0.0, 1.0);
    float _5784 = fma(_5766, 0.01587301678955554962158203125, _5726);
    float _5786 = precise::clamp(_5784, 0.0, 1.0);
    float _5788 = fma(_5774, -0.0322580635547637939453125, _5728);
    float _5790 = precise::clamp(_5788, 0.0, 1.0);
    float _5792 = _5778 * 31.0;
    float _5794 = fma(_5774, 0.0322580635547637939453125, _5730);
    float _5796 = precise::clamp(_5794, 0.0, 1.0);
    float _5798 = _5772 * 31.0;
    float _5800 = _5782 * 63.0;
    float _5802 = _5786 * 63.0;
    float _5804 = _5790 * 31.0;
    float _5806 = _5796 * 31.0;
    float _5808 = trunc(_5768);
    float _5810 = precise::max(_5808, 0.0);
    uint _5813 = uint(_5810);
    float _5815 = precise::min(_351, _361);
    float _5817 = precise::min(_421, _473);
    float _5819 = precise::min(_535, _573);
    float _5821 = precise::min(_585, _603);
    float _5823 = rint(_5792);
    float _5825 = precise::min(_619, _635);
    float _5827 = precise::min(_651, _661);
    float _5829 = precise::min(_5819, _5821);
    float _5831 = precise::min(_5825, _5827);
    float _5833 = rint(_5802);
    float _5835 = precise::min(_5829, _5831);
    float _5837 = rint(_5798);
    float _5839 = _5823 + 0.5;
    float _5841 = rint(_5800);
    float _5843 = _5833 + 0.5;
    float _5845 = rint(_5804);
    float _5847 = _5837 + 0.5;
    float _5849 = rint(_5806);
    float _5851 = precise::min(_371, _411);
    float _5853 = precise::min(_5815, _5851);
    float _5855 = precise::min(_499, _525);
    float _5857 = trunc(_5839);
    float _5859 = precise::max(_5857, 0.0);
    uint _5861 = uint(_5859);
    float _5863 = precise::min(_5817, _5855);
    float _5865 = _5841 + 0.5;
    float _5867 = precise::min(_5853, _5863);
    float _5869 = _5849 + 0.5;
    float _5871 = trunc(_5843);
    float _5873 = precise::max(_5871, 0.0);
    uint _5875 = uint(_5873);
    float _5877 = precise::min(_5867, _5835);
    float _5879 = _5845 + 0.5;
    float _5881 = _5877 * 255.0;
    float _5883 = trunc(_5847);
    float _5885 = precise::max(_5883, 0.0);
    uint _5887 = uint(_5885);
    int _5889 = int(_5861) << 11;
    float _5891 = trunc(_5865);
    float _5893 = precise::max(_5891, 0.0);
    uint _5895 = uint(_5893);
    int _5897 = int(_5875) << 5;
    float _5899 = trunc(_5869);
    float _5901 = precise::max(_5899, 0.0);
    uint _5903 = uint(_5901);
    int _5905 = int(_5887) << 11;
    float _5907 = trunc(_5879);
    float _5909 = precise::max(_5907, 0.0);
    uint _5911 = uint(_5909);
    int _5913 = int(_5895) << 5;
    float _5915 = trunc(_5881);
    float _5917 = precise::max(_5915, 0.0);
    uint _5919 = uint(_5917);
    int _5921 = _5889 | _5897;
    int _5923 = int(_5903) | _5921;
    int _5925 = _5905 | _5913;
    int _5927 = int(_5911) | _5925;
    bool _5929 = _5923 != _5927;
    bool _5931 = _5813 > _5919;
    int _5933 = int(_5919) << 8;
    int _5935 = _5933 & 65280;
    int _5937 = int(_5895);
    int _5939 = _5933;
    int _5941 = _5897;
    int _5943 = _5935;
    int _5945 = as_type<int>(_5837);
    int _5947 = _5923;
    int _5949 = _5927;
    if (!_5929)
    {
        _5937 = _5923;
    }
    int _5951 = _5937;
    int _5953 = 255 & int(_5813);
    int _5955 = _5935 | _5953;
    int _5957 = _5951;
    if (!_5931)
    {
        _5939 = 0;
    }
    int _5959 = _5939;
    int _5961 = _5959;
    if (!_5929)
    {
        _5941 = 0;
    }
    int _5963 = _5941;
    int _5965 = _5963;
    if (!_5929)
    {
        _5943 = 0;
    }
    int _5967 = _5943;
    bool _5969 = !_5929;
    int _5971 = _5967;
    if (!_5969)
    {
        float _5973 = _5837 * 0.0322580635547637939453125;
        float _5975 = _5833 * 0.01587301678955554962158203125;
        float _5977 = _5841 * 0.01587301678955554962158203125;
        bool _5979 = uint(_5923) >= uint(_5927);
        float _5981 = _5823 * 0.0322580635547637939453125;
        float _5983 = _5849 * 0.0322580635547637939453125;
        float _5985 = _5845 * 0.0322580635547637939453125;
        bool _5987 = !_5979;
        float _5989 = _5987 ? _5975 : _5977;
        bool _5991 = !_5979;
        float _5993 = _5991 ? _5977 : _5975;
        bool _5995 = !_5979;
        float _5997 = _5995 ? _5981 : _5973;
        float _5999 = -_5989;
        float _6001 = _521 + _5999;
        bool _6003 = !_5979;
        float _6005 = _6003 ? _5973 : _5981;
        float _6007 = -_5989;
        float _6009 = _6007 + _5993;
        bool _6011 = !_5979;
        float _6013 = _6011 ? _5983 : _5985;
        float _6015 = -_5997;
        float _6017 = _519 + _6015;
        bool _6019 = !_5979;
        float _6021 = _6019 ? _5985 : _5983;
        float _6023 = -_5997;
        float _6025 = _6023 + _6005;
        float _6027 = -_5997;
        float _6029 = _493 + _6027;
        float _6031 = -_5997;
        float _6033 = _467 + _6031;
        float _6035 = -_5997;
        float _6037 = _415 + _6035;
        float _6039 = -_5997;
        float _6041 = _405 + _6039;
        float _6043 = -_5997;
        float _6045 = _365 + _6043;
        float _6047 = -_5997;
        float _6049 = _355 + _6047;
        float _6051 = -_5997;
        float _6053 = _345 + _6051;
        float _6055 = -_5997;
        float _6057 = _5596 + _6055;
        float _6059 = -_5997;
        float _6061 = _645 + _6059;
        float _6063 = -_5997;
        float _6065 = _629 + _6063;
        float _6067 = -_5997;
        float _6069 = _613 + _6067;
        float _6071 = -_5997;
        float _6073 = _597 + _6071;
        float _6075 = -_5997;
        float _6077 = _579 + _6075;
        float _6079 = -_5997;
        float _6081 = _567 + _6079;
        float _6083 = -_5997;
        float _6085 = _529 + _6083;
        float _6087 = _6009 * _6009;
        float _6089 = -_6013;
        float _6091 = _6089 + _6021;
        float _6093 = -_5989;
        float _6095 = _495 + _6093;
        float _6097 = -_6013;
        float _6099 = _523 + _6097;
        float _6101 = fma(_6025, _6025, _6087);
        float _6103 = -_6013;
        float _6105 = _497 + _6103;
        float _6107 = -_5989;
        float _6109 = _469 + _6107;
        float _6111 = -_5989;
        float _6113 = _417 + _6111;
        float _6115 = fma(_6091, _6091, _6101);
        float _6117 = -_6013;
        float _6119 = _471 + _6117;
        float _6121 = -_5989;
        float _6123 = _407 + _6121;
        float _6125 = -_5989;
        float _6127 = _367 + _6125;
        float _6129 = 1.0 / _6115;
        float _6131 = -_5989;
        float _6133 = _357 + _6131;
        float _6135 = -_5989;
        float _6137 = _347 + _6135;
        float _6139 = -_5989;
        float _6141 = _657 + _6139;
        float _6143 = -_5989;
        float _6145 = _647 + _6143;
        float _6147 = -_5989;
        float _6149 = _631 + _6147;
        float _6151 = -_5989;
        float _6153 = _615 + _6151;
        float _6155 = -_5989;
        float _6157 = _599 + _6155;
        float _6159 = -_5989;
        float _6161 = _581 + _6159;
        float _6163 = -_5989;
        float _6165 = _569 + _6163;
        float _6167 = -_5989;
        float _6169 = _531 + _6167;
        float _6171 = -_6013;
        float _6173 = _419 + _6171;
        float _6175 = -_6013;
        float _6177 = _409 + _6175;
        float _6179 = -_6013;
        float _6181 = _369 + _6179;
        float _6183 = -_6013;
        float _6185 = _359 + _6183;
        float _6187 = _6009 * _6129;
        float _6189 = _6025 * _6129;
        float _6191 = _6091 * _6129;
        float _6193 = _6187 * _6001;
        float _6195 = _6187 * _6095;
        float _6197 = _6187 * _6109;
        float _6199 = _6187 * _6113;
        float _6201 = fma(_6189, _6017, _6193);
        float _6203 = fma(_6189, _6029, _6195);
        float _6205 = fma(_6189, _6033, _6197);
        float _6207 = fma(_6189, _6037, _6199);
        float _6209 = fma(_6191, _6099, _6201);
        float _6211 = fma(_6191, _6105, _6203);
        float _6213 = fma(_6191, _6119, _6205);
        float _6215 = _6187 * _6123;
        float _6217 = _6187 * _6169;
        bool _6219 = _6209 >= 0.5;
        float _6221 = _6187 * _6127;
        bool _6223 = _6211 >= 0.5;
        float _6225 = _6187 * _6133;
        bool _6227 = _6209 >= 0.833000004291534423828125;
        float _6229 = _6187 * _6137;
        bool _6231 = _6209 >= 0.16599999368190765380859375;
        float _6233 = _6187 * _6141;
        float _6235 = _6187 * _6145;
        float _6237 = _6187 * _6149;
        float _6239 = _6187 * _6153;
        float _6241 = _6187 * _6157;
        float _6243 = _6187 * _6161;
        float _6245 = _6187 * _6165;
        int _6247 = _6227 ? 0 : 32768;
        float _6249 = fma(_6191, _6173, _6207);
        bool _6251 = _6211 >= 0.833000004291534423828125;
        float _6253 = fma(_6189, _6041, _6215);
        int _6255 = _6247;
        if (!_6219)
        {
            int _6257 = _6231 ? 49152 : 16384;
            _6255 = _6257;
        }
        int _6259 = _6255;
        float _6261 = fma(_6189, _6045, _6221);
        bool _6263 = _6211 >= 0.16599999368190765380859375;
        float _6265 = fma(_6189, _6049, _6225);
        float _6267 = fma(_6189, _6053, _6229);
        bool _6269 = _6213 >= 0.5;
        float _6271 = fma(_6189, _6057, _6233);
        float _6273 = fma(_6189, _6061, _6235);
        float _6275 = fma(_6189, _6065, _6237);
        float _6277 = fma(_6189, _6069, _6239);
        float _6279 = fma(_6189, _6073, _6241);
        float _6281 = fma(_6189, _6077, _6243);
        float _6283 = fma(_6189, _6081, _6245);
        float _6285 = fma(_6189, _6085, _6217);
        int _6287 = _6251 ? 0 : 8192;
        float _6289 = fma(_6191, _6177, _6253);
        bool _6291 = _6249 >= 0.5;
        float _6293 = fma(_6191, _6181, _6261);
        int _6295 = _6287;
        if (!_6223)
        {
            int _6297 = _6263 ? 12288 : 4096;
            _6295 = _6297;
        }
        int _6299 = _6295;
        float _6301 = fma(_6191, _6185, _6265);
        bool _6303 = _6249 >= 0.833000004291534423828125;
        float _6305 = -_6013;
        float _6307 = _5604 + _6305;
        bool _6309 = _6213 >= 0.833000004291534423828125;
        float _6311 = -_6013;
        float _6313 = _649 + _6311;
        bool _6315 = _6213 >= 0.16599999368190765380859375;
        float _6317 = fma(_6191, _6307, _6271);
        int _6319 = _6303 ? 0 : 512;
        float _6321 = fma(_6191, _6313, _6273);
        bool _6323 = _6289 >= 0.5;
        float _6325 = -_6013;
        float _6327 = _633 + _6325;
        int _6329 = _6309 ? 0 : 2048;
        float _6331 = -_6013;
        float _6333 = _617 + _6331;
        bool _6335 = _6249 >= 0.16599999368190765380859375;
        float _6337 = fma(_6191, _6327, _6275);
        float _6339 = fma(_6191, _6333, _6277);
        int _6341 = _6329;
        int _6343 = _6319;
        if (!_6269)
        {
            int _6345 = _6315 ? 3072 : 1024;
            _6341 = _6345;
        }
        int _6347 = _6341;
        float _6349 = -_6013;
        float _6351 = _601 + _6349;
        bool _6353 = _6293 >= 0.5;
        float _6355 = -_6013;
        float _6357 = _571 + _6355;
        if (!_6291)
        {
            int _6359 = _6335 ? 768 : 256;
            _6343 = _6359;
        }
        int _6361 = _6343;
        float _6363 = fma(_6191, _6351, _6279);
        bool _6365 = _6289 >= 0.833000004291534423828125;
        float _6367 = -_6013;
        float _6369 = _583 + _6367;
        bool _6371 = _6293 >= 0.833000004291534423828125;
        float _6373 = fma(_6191, _6357, _6283);
        bool _6375 = _6289 >= 0.16599999368190765380859375;
        float _6377 = fma(_6191, _6369, _6281);
        int _6379 = _6365 ? 0 : 128;
        float _6381 = -_6013;
        float _6383 = _349 + _6381;
        int _6385 = _6371 ? 0 : 32;
        float _6387 = -_6013;
        float _6389 = _533 + _6387;
        bool _6391 = _6301 >= 0.5;
        float _6393 = fma(_6191, _6383, _6267);
        bool _6395 = _6293 >= 0.16599999368190765380859375;
        float _6397 = fma(_6191, _6389, _6285);
        int _6399 = _6379;
        int _6401 = _6385;
        if (!_6323)
        {
            int _6403 = _6375 ? 192 : 64;
            _6399 = _6403;
        }
        int _6405 = _6399;
        bool _6407 = _6301 >= 0.833000004291534423828125;
        if (!_6353)
        {
            int _6409 = _6395 ? 48 : 16;
            _6401 = _6409;
        }
        int _6411 = _6401;
        int _6413 = _6407 ? 0 : 8;
        bool _6415 = _6317 >= 0.5;
        bool _6417 = _6301 >= 0.16599999368190765380859375;
        bool _6419 = _6321 >= 0.5;
        bool _6421 = _6317 >= 0.833000004291534423828125;
        int _6423 = _6413;
        if (!_6391)
        {
            int _6425 = _6417 ? 12 : 4;
            _6423 = _6425;
        }
        int _6427 = _6423;
        bool _6429 = _6321 >= 0.833000004291534423828125;
        bool _6431 = _6317 >= 0.16599999368190765380859375;
        int _6433 = _6421 ? 0 : int(0x80000000);
        bool _6435 = _6321 >= 0.16599999368190765380859375;
        int _6437 = _6429 ? 0 : 536870912;
        bool _6439 = _6337 >= 0.5;
        int _6441 = _6433;
        int _6443 = _6437;
        if (!_6415)
        {
            int _6445 = _6431 ? (-1073741824) : 1073741824;
            _6441 = _6445;
        }
        int _6447 = _6441;
        bool _6449 = _6339 >= 0.5;
        if (!_6419)
        {
            int _6451 = _6435 ? 805306368 : 268435456;
            _6443 = _6451;
        }
        int _6453 = _6443;
        bool _6455 = _6337 >= 0.833000004291534423828125;
        bool _6457 = _6339 >= 0.833000004291534423828125;
        int _6459 = _6455 ? 0 : 134217728;
        bool _6461 = _6337 >= 0.16599999368190765380859375;
        bool _6463 = _6363 >= 0.5;
        int _6465 = _6457 ? 0 : 33554432;
        bool _6467 = _6339 >= 0.16599999368190765380859375;
        int _6469 = _6459;
        int _6471 = _6465;
        if (!_6439)
        {
            int _6473 = _6461 ? 201326592 : 67108864;
            _6469 = _6473;
        }
        int _6475 = _6469;
        bool _6477 = _6363 >= 0.833000004291534423828125;
        if (!_6449)
        {
            int _6479 = _6467 ? 50331648 : 16777216;
            _6471 = _6479;
        }
        int _6481 = _6471;
        bool _6483 = _6373 >= 0.5;
        bool _6485 = _6363 >= 0.16599999368190765380859375;
        int _6487 = _6477 ? 0 : 8388608;
        bool _6489 = _6377 >= 0.5;
        bool _6491 = _6377 >= 0.833000004291534423828125;
        int _6493 = _6487;
        if (!_6463)
        {
            int _6495 = _6485 ? 12582912 : 4194304;
            _6493 = _6495;
        }
        int _6497 = _6493;
        bool _6499 = _6373 >= 0.833000004291534423828125;
        int _6501 = _6491 ? 0 : 2097152;
        bool _6503 = _6373 >= 0.16599999368190765380859375;
        int _6505 = _6499 ? 0 : 524288;
        bool _6507 = _6377 >= 0.16599999368190765380859375;
        int _6509 = _6505;
        int _6511 = _6501;
        if (!_6483)
        {
            int _6513 = _6503 ? 786432 : 262144;
            _6509 = _6513;
        }
        int _6515 = _6509;
        bool _6517 = _6393 >= 0.5;
        bool _6519 = _6397 >= 0.5;
        if (!_6489)
        {
            int _6521 = _6507 ? 3145728 : 1048576;
            _6511 = _6521;
        }
        int _6523 = _6511;
        bool _6525 = _6393 >= 0.833000004291534423828125;
        int _6527 = _6475 + _6447;
        int _6529 = _6527 + _6453;
        int _6531 = _6347 + _6259;
        int _6533 = _6531 + _6299;
        bool _6535 = _6397 >= 0.833000004291534423828125;
        int _6537 = _6525 ? 0 : 2;
        bool _6539 = _6393 >= 0.16599999368190765380859375;
        bool _6541 = _6397 >= 0.16599999368190765380859375;
        int _6543 = _6497 + _6529;
        int _6545 = _6543 + _6481;
        int _6547 = _6405 + _6533;
        int _6549 = _6547 + _6361;
        int _6551 = _6535 ? 0 : 131072;
        int _6553 = _6537;
        int _6555 = _6551;
        _5945 = 3;
        if (!_6517)
        {
            int _6557 = _6539 ? 3 : 1;
            _6553 = _6557;
        }
        int _6559 = _6553;
        if (!_6519)
        {
            int _6561 = _6541 ? 196608 : 65536;
            _6555 = _6561;
        }
        int _6563 = _6555;
        int _6565 = _6515 + _6545;
        int _6567 = _6565 + _6523;
        int _6569 = _6427 + _6549;
        int _6571 = _6569 + _6411;
        bool _6573 = !_5979;
        int _6575 = _6573 ? _5927 : _5923;
        bool _6577 = !_5979;
        int _6579 = _6577 ? _5923 : _5927;
        int _6581 = _6567 + _6563;
        int _6583 = _6571 + _6559;
        _5957 = _6575;
        _5971 = _6581;
        _5965 = _6583;
        _5947 = _6579;
    }
    int _6585 = _5957;
    int _6587 = _5945;
    int _6589 = _5971;
    int _6591 = _5965;
    int _6593 = _5947;
    int _6595 = _6587;
    if (!_5931)
    {
        _6595 = 0;
    }
    int _6597 = _6595;
    int _6599 = _6597;
    if (!_5931)
    {
        _5949 = 0;
    }
    int _6601 = _5949;
    bool _6603 = !_5931;
    int _6605 = _6601;
    if (!_6603)
    {
        float _6607 = -_5877;
        float _6609 = _5648 + _6607;
        float _6611 = -_5877;
        float _6613 = _371 + _6611;
        float _6615 = -_5877;
        float _6617 = _351 + _6615;
        float _6619 = -_5877;
        float _6621 = _361 + _6619;
        float _6623 = -_5877;
        float _6625 = _473 + _6623;
        float _6627 = 1.0 / _6609;
        float _6629 = -_5877;
        float _6631 = _499 + _6629;
        float _6633 = -_5877;
        float _6635 = _603 + _6633;
        float _6637 = -_5877;
        float _6639 = _525 + _6637;
        float _6641 = -_5877;
        float _6643 = _535 + _6641;
        float _6645 = -_5877;
        float _6647 = _573 + _6645;
        float _6649 = -_5877;
        float _6651 = _635 + _6649;
        float _6653 = -_5877;
        float _6655 = _651 + _6653;
        float _6657 = -_5877;
        float _6659 = _661 + _6657;
        float _6661 = _6613 * _6627;
        float _6663 = -_5877;
        float _6665 = _411 + _6663;
        float _6667 = _6617 * _6627;
        float _6669 = _6621 * _6627;
        float _6671 = _6665 * _6627;
        float _6673 = -_5877;
        float _6675 = _421 + _6673;
        float _6677 = fma(_6667, -1.99999904632568359375, 1.99999904632568359375);
        float _6679 = fma(_6667, -7.99999904632568359375, 7.99999904632568359375);
        float _6681 = fma(_6669, -1.99999904632568359375, 1.99999904632568359375);
        float _6683 = fma(_6669, -7.99999904632568359375, 7.99999904632568359375);
        float _6685 = fma(_6661, -1.99999904632568359375, 1.99999904632568359375);
        float _6687 = fma(_6661, -7.99999904632568359375, 7.99999904632568359375);
        float _6689 = _6675 * _6627;
        float _6691 = -_6667;
        float _6693 = _6691 + 0.5;
        float _6695 = -_6669;
        float _6697 = _6695 + 0.5;
        float _6699 = trunc(_6677);
        float _6701 = precise::max(_6699, 0.0);
        uint _6703 = uint(_6701);
        float _6705 = fma(_6671, -1.99999904632568359375, 1.99999904632568359375);
        float _6707 = fma(_6671, -7.99999904632568359375, 7.99999904632568359375);
        float _6709 = fma(_6689, -1.99999904632568359375, 1.99999904632568359375);
        float _6711 = fma(_6689, -7.99999904632568359375, 7.99999904632568359375);
        float _6713 = _6625 * _6627;
        float _6715 = _6631 * _6627;
        float _6717 = -_6661;
        float _6719 = _6717 + 0.5;
        float _6721 = trunc(_6679);
        float _6723 = precise::max(_6721, 0.0);
        uint _6725 = uint(_6723);
        float _6727 = _6635 * _6627;
        float _6729 = -_5877;
        float _6731 = _619 + _6729;
        float _6733 = abs(_6693);
        bool _6735 = _6733 >= 0.375;
        float _6737 = fma(_6713, -1.99999904632568359375, 1.99999904632568359375);
        float _6739 = abs(_6697);
        bool _6741 = _6739 >= 0.375;
        float _6743 = fma(_6713, -7.99999904632568359375, 7.99999904632568359375);
        float _6745 = fma(_6715, -1.99999904632568359375, 1.99999904632568359375);
        float _6747 = trunc(_6681);
        float _6749 = precise::max(_6747, 0.0);
        uint _6751 = uint(_6749);
        float _6753 = fma(_6715, -7.99999904632568359375, 7.99999904632568359375);
        float _6755 = _6639 * _6627;
        float _6757 = _6643 * _6627;
        float _6759 = -_6671;
        float _6761 = _6759 + 0.5;
        float _6763 = -_6689;
        float _6765 = _6763 + 0.5;
        float _6767 = _6647 * _6627;
        float _6769 = abs(_6719);
        bool _6771 = _6769 >= 0.375;
        float _6773 = trunc(_6683);
        float _6775 = precise::max(_6773, 0.0);
        uint _6777 = uint(_6775);
        float _6779 = -_5877;
        float _6781 = _585 + _6779;
        float _6783 = _6731 * _6627;
        float _6785 = fma(_6755, -1.99999904632568359375, 1.99999904632568359375);
        float _6787 = fma(_6755, -7.99999904632568359375, 7.99999904632568359375);
        float _6789 = fma(_6757, -1.99999904632568359375, 1.99999904632568359375);
        float _6791 = fma(_6757, -7.99999904632568359375, 7.99999904632568359375);
        float _6793 = -_6713;
        float _6795 = _6793 + 0.5;
        float _6797 = trunc(_6685);
        float _6799 = precise::max(_6797, 0.0);
        uint _6801 = uint(_6799);
        float _6803 = -_6715;
        float _6805 = _6803 + 0.5;
        float _6807 = abs(_6761);
        bool _6809 = _6807 >= 0.375;
        float _6811 = fma(_6767, -1.99999904632568359375, 1.99999904632568359375);
        float _6813 = abs(_6765);
        bool _6815 = _6813 >= 0.375;
        float _6817 = fma(_6767, -7.99999904632568359375, 7.99999904632568359375);
        float _6819 = _6781 * _6627;
        float _6821 = _6651 * _6627;
        float _6823 = trunc(_6687);
        float _6825 = precise::max(_6823, 0.0);
        uint _6827 = uint(_6825);
        float _6829 = _6655 * _6627;
        float _6831 = _6659 * _6627;
        float _6833 = fma(_6783, -7.99999904632568359375, 7.99999904632568359375);
        float _6835 = -_6755;
        float _6837 = _6835 + 0.5;
        float _6839 = -_6757;
        float _6841 = _6839 + 0.5;
        float _6843 = abs(_6795);
        bool _6845 = _6843 >= 0.375;
        float _6847 = fma(_6819, -1.99999904632568359375, 1.99999904632568359375);
        float _6849 = trunc(_6705);
        float _6851 = precise::max(_6849, 0.0);
        uint _6853 = uint(_6851);
        float _6855 = abs(_6805);
        bool _6857 = _6855 >= 0.375;
        float _6859 = fma(_6819, -7.99999904632568359375, 7.99999904632568359375);
        float _6861 = fma(_6727, -1.99999904632568359375, 1.99999904632568359375);
        float _6863 = fma(_6727, -7.99999904632568359375, 7.99999904632568359375);
        float _6865 = -_6767;
        float _6867 = _6865 + 0.5;
        int _6869 = int(_6703);
        int _6871 = int(_6751);
        int _6873 = int(_6801);
        int _6875 = int(_6853);
        if (!_6735)
        {
            int _6877 = int(_6725) + 1;
            _6869 = _6877;
        }
        int _6879 = _6869;
        float _6881 = fma(_6783, -1.99999904632568359375, 1.99999904632568359375);
        float _6883 = trunc(_6707);
        float _6885 = precise::max(_6883, 0.0);
        uint _6887 = uint(_6885);
        if (!_6741)
        {
            int _6889 = int(_6777) + 1;
            _6871 = _6889;
        }
        int _6891 = _6871;
        float _6893 = fma(_6821, -1.99999904632568359375, 1.99999904632568359375);
        float _6895 = abs(_6837);
        bool _6897 = _6895 >= 0.375;
        float _6899 = -_6819;
        float _6901 = _6899 + 0.5;
        float _6903 = abs(_6841);
        bool _6905 = _6903 >= 0.375;
        float _6907 = -_6727;
        float _6909 = _6907 + 0.5;
        if (!_6771)
        {
            int _6911 = int(_6827) + 1;
            _6873 = _6911;
        }
        int _6913 = _6873;
        float _6915 = trunc(_6709);
        float _6917 = precise::max(_6915, 0.0);
        uint _6919 = uint(_6917);
        float _6921 = abs(_6867);
        bool _6923 = _6921 >= 0.375;
        float _6925 = fma(_6829, -1.99999904632568359375, 1.99999904632568359375);
        float _6927 = -_6783;
        float _6929 = _6927 + 0.5;
        float _6931 = fma(_6831, -1.99999904632568359375, 1.99999904632568359375);
        int _6933 = _6891 << 3;
        float _6935 = trunc(_6711);
        float _6937 = precise::max(_6935, 0.0);
        uint _6939 = uint(_6937);
        int _6941 = int(_6919);
        if (!_6809)
        {
            int _6943 = int(_6887) + 1;
            _6875 = _6943;
        }
        int _6945 = _6875;
        float _6947 = abs(_6901);
        bool _6949 = _6947 >= 0.375;
        int _6951 = _6879 | _6933;
        int _6953 = _6945 << 9;
        float _6955 = trunc(_6737);
        float _6957 = precise::max(_6955, 0.0);
        uint _6959 = uint(_6957);
        float _6961 = trunc(_6743);
        float _6963 = precise::max(_6961, 0.0);
        uint _6965 = uint(_6963);
        int _6967 = int(_6959);
        if (!_6815)
        {
            int _6969 = int(_6939) + 1;
            _6941 = _6969;
        }
        int _6971 = _6941;
        float _6973 = abs(_6909);
        bool _6975 = _6973 >= 0.375;
        float _6977 = trunc(_6745);
        float _6979 = precise::max(_6977, 0.0);
        uint _6981 = uint(_6979);
        float _6983 = trunc(_6753);
        float _6985 = precise::max(_6983, 0.0);
        uint _6987 = uint(_6985);
        int _6989 = int(_6981);
        if (!_6845)
        {
            int _6991 = int(_6965) + 1;
            _6967 = _6991;
        }
        int _6993 = _6967;
        float _6995 = abs(_6929);
        bool _6997 = _6995 >= 0.375;
        int _6999 = _6993 << 15;
        float _7001 = trunc(_6785);
        float _7003 = precise::max(_7001, 0.0);
        uint _7005 = uint(_7003);
        float _7007 = trunc(_6787);
        float _7009 = precise::max(_7007, 0.0);
        uint _7011 = uint(_7009);
        int _7013 = int(_7005);
        if (!_6857)
        {
            int _7015 = int(_6987) + 1;
            _6989 = _7015;
        }
        int _7017 = _6989;
        float _7019 = trunc(_6789);
        float _7021 = precise::max(_7019, 0.0);
        uint _7023 = uint(_7021);
        float _7025 = trunc(_6791);
        float _7027 = precise::max(_7025, 0.0);
        uint _7029 = uint(_7027);
        int _7031 = int(_7023);
        if (!_6897)
        {
            int _7033 = int(_7011) + 1;
            _7013 = _7033;
        }
        int _7035 = _7013;
        int _7037 = _7035 << 21;
        float _7039 = trunc(_6833);
        float _7041 = precise::max(_7039, 0.0);
        uint _7043 = uint(_7041);
        float _7045 = trunc(_6811);
        float _7047 = precise::max(_7045, 0.0);
        uint _7049 = uint(_7047);
        float _7051 = fma(_6821, -7.99999904632568359375, 7.99999904632568359375);
        float _7053 = -_6821;
        float _7055 = _7053 + 0.5;
        int _7057 = int(_7049);
        if (!_6905)
        {
            int _7059 = int(_7029) + 1;
            _7031 = _7059;
        }
        int _7061 = _7031;
        float _7063 = abs(_7055);
        bool _7065 = _7063 >= 0.375;
        float _7067 = trunc(_6817);
        float _7069 = precise::max(_7067, 0.0);
        uint _7071 = uint(_7069);
        float _7073 = trunc(_6847);
        float _7075 = precise::max(_7073, 0.0);
        uint _7077 = uint(_7075);
        float _7079 = trunc(_6859);
        float _7081 = precise::max(_7079, 0.0);
        uint _7083 = uint(_7081);
        int _7085 = int(_7077);
        if (!_6923)
        {
            int _7087 = int(_7071) + 1;
            _7057 = _7087;
        }
        int _7089 = _7057;
        float _7091 = trunc(_6861);
        float _7093 = precise::max(_7091, 0.0);
        uint _7095 = uint(_7093);
        float _7097 = trunc(_6863);
        float _7099 = precise::max(_7097, 0.0);
        uint _7101 = uint(_7099);
        int _7103 = int(_7095);
        if (!_6949)
        {
            int _7105 = int(_7083) + 1;
            _7085 = _7105;
        }
        int _7107 = _7085;
        int _7109 = _7107 << 6;
        float _7111 = trunc(_7051);
        float _7113 = precise::max(_7111, 0.0);
        uint _7115 = uint(_7113);
        float _7117 = trunc(_6881);
        float _7119 = precise::max(_7117, 0.0);
        uint _7121 = uint(_7119);
        float _7123 = fma(_6829, -7.99999904632568359375, 7.99999904632568359375);
        float _7125 = fma(_6831, -7.99999904632568359375, 7.99999904632568359375);
        float _7127 = -_6829;
        float _7129 = _7127 + 0.5;
        float _7131 = -_6831;
        float _7133 = _7131 + 0.5;
        if (!_6975)
        {
            int _7135 = int(_7101) + 1;
            _7103 = _7135;
        }
        int _7137 = _7103;
        float _7139 = trunc(_6893);
        float _7141 = precise::max(_7139, 0.0);
        uint _7143 = uint(_7141);
        float _7145 = abs(_7129);
        bool _7147 = _7145 >= 0.375;
        float _7149 = abs(_7133);
        bool _7151 = _7149 >= 0.375;
        int _7153 = _7137 << 9;
        float _7155 = trunc(_6925);
        float _7157 = precise::max(_7155, 0.0);
        uint _7159 = uint(_7157);
        int _7161 = int(_7121);
        int _7163 = int(_7159);
        if (!_6997)
        {
            int _7165 = int(_7043) + 1;
            _7161 = _7165;
        }
        int _7167 = _7161;
        int _7169 = _7167 << 12;
        float _7171 = trunc(_7123);
        float _7173 = precise::max(_7171, 0.0);
        uint _7175 = uint(_7173);
        int _7177 = int(_7143);
        if (!_7065)
        {
            int _7179 = int(_7115) + 1;
            _7177 = _7179;
        }
        int _7181 = _7177;
        int _7183 = _7181 << 15;
        float _7185 = trunc(_6931);
        float _7187 = precise::max(_7185, 0.0);
        uint _7189 = uint(_7187);
        int _7191 = _7089 << 3;
        int _7193 = _7061 | _7191;
        float _7195 = trunc(_7125);
        float _7197 = precise::max(_7195, 0.0);
        uint _7199 = uint(_7197);
        int _7201 = _6913 << 6;
        int _7203 = _7193 | _7109;
        int _7205 = _7153 | _7203;
        int _7207 = _6951 | _7201;
        int _7209 = _6953 | _7207;
        int _7211 = _6971 << 12;
        int _7213 = int(_7189);
        if (!_7147)
        {
            int _7215 = int(_7175) + 1;
            _7163 = _7215;
        }
        int _7217 = _7163;
        int _7219 = _7209 | _7211;
        int _7221 = _6999 | _7219;
        int _7223 = _7205 | _7169;
        int _7225 = _7183 | _7223;
        int _7227 = _7017 << 18;
        if (!_7151)
        {
            int _7229 = int(_7199) + 1;
            _7213 = _7229;
        }
        int _7231 = _7213;
        int _7233 = _7217 << 18;
        int _7235 = _7231 << 21;
        int _7237 = _7221 | _7227;
        int _7239 = _7037 | _7237;
        int _7241 = _7225 | _7233;
        int _7243 = _7235 | _7241;
        uint _7245 = uint(int(uint(_7239) >> uint(16)));
        int _7247 = _7243 << 8;
        uint _7249 = uint(int(uint(_7243) >> uint(8)));
        int _7251 = 65280 & _7247;
        int _7253 = int(_7245) | _7251;
        int _7255 = _7239 << 16;
        int _7257 = int(_7249) << 16;
        _5961 = _7255;
        _6605 = _7257;
        _6599 = _7253;
    }
    int _7259 = _5961;
    int _7261 = _6605;
    int _7263 = _6599;
    int _7265 = _6585 & 65535;
    int _7267 = _7259 | _5955;
    int _7269 = _7261 | _7263;
    int _7271 = _6589 | _6591;
    int _7273 = _6593 << 16;
    int _7275 = _7273 + _7265;
    out.m_41.x = as_type<float>(_7267);
    out.m_41.y = as_type<float>(_7269);
    out.m_41.z = as_type<float>(_7275);
    out.m_41.w = as_type<float>(_7271);
    return main0_out_u{as_type<uint4>(out.m_41)};
}

