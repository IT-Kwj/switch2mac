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
    texture2d_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_E [[id(5)]];
    sampler fp_t_tcb_ESmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_10 [[id(7)]];
    sampler fp_t_tcb_10Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_A [[id(9)]];
    sampler fp_t_tcb_ASmplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _738 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_738, float2(0.0), isnan(_738)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _755 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_755, float2(0.0), isnan(_755))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_755, float2(0.0), isnan(_755))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _86 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].z, _84);
    float _88 = -_64;
    float _90 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _92 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].z, _90);
    float _94 = -_66;
    float _96 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _98 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].z, _96);
    float _100 = _70 * _86;
    float _102 = _72 * _86;
    float _104 = -_100;
    float _106 = fma(_92, _74, _104);
    float _108 = -_100;
    float _110 = fma(_98, _76, _108);
    float _112 = -_102;
    float _114 = fma(_92, _78, _112);
    float _116 = -_102;
    float _118 = fma(_98, _80, _116);
    float _120 = _106 * _106;
    float _122 = _110 * _110;
    float _124 = -_86;
    float _126 = _124 + _92;
    float _128 = -_86;
    float _130 = _128 + _98;
    float _132 = fma(_114, _114, _120);
    float _134 = fma(_118, _118, _122);
    float _136 = fma(_126, _126, _132);
    float _138 = fma(_130, _130, _134);
    float _140 = rsqrt(_136);
    float _142 = rsqrt(_138);
    float _144 = _114 * _140;
    float _146 = _126 * _140;
    float _148 = _106 * _140;
    float _150 = _130 * _142;
    float _152 = _110 * _142;
    float _154 = _118 * _142;
    float _156 = _144 * _150;
    float _158 = _146 * _152;
    float _160 = -_156;
    float _162 = fma(_146, _154, _160);
    float _164 = _148 * _154;
    float _166 = -_158;
    float _168 = fma(_148, _150, _166);
    float _170 = _162 * _162;
    float _172 = -_164;
    float _174 = fma(_144, _152, _172);
    float _176 = fma(_168, _168, _170);
    float _178 = fma(_174, _174, _176);
    float _180 = rsqrt(_178);
    float _182 = _162 * _180;
    float _184 = _168 * _180;
    float _186 = _174 * _180;
    float _188 = _182 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _190 = fma(_184, (*spvDescriptorSet0.fp_c3)._m0[35].x, _188);
    float _192 = fma(_186, (*spvDescriptorSet0.fp_c3)._m0[35].z, _190);
    float _194 = abs(_192);
    float _196 = -_194;
    float _198 = _196 + 1.0;
    float _200 = precise::clamp(_198, 0.0, 1.0);
    float _202 = abs(_200);
    float _204 = log2(_202);
    float _206 = _204 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _208 = exp2(_206);
    float _210 = -_68;
    float _212 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _214 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[46].z, _212);
    float _216 = _214 * _70;
    float _218 = _214 * _72;
    float _220 = -_216;
    float _222 = _220 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _224 = -_218;
    float _226 = _224 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _228 = _222 * _222;
    float _230 = -_214;
    float _232 = _230 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _234 = _208 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _236 = fma(_226, _226, _228);
    float _238 = -_218;
    float _240 = _238 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _242 = fma(_182, _234, _216);
    float _244 = fma(_184, _234, _218);
    float _246 = fma(_186, _234, _214);
    float _248 = fma(_232, _232, _236);
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _252 = -_216;
    float _254 = _252 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _256 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[3].x, _250);
    float _258 = _254 * _254;
    float _260 = sqrt(_248);
    float _262 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[3].z, _256);
    float _264 = fma(_240, _240, _258);
    float _266 = -_214;
    float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _270 = _262 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _272 = _242 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _274 = fma(_268, _268, _264);
    float _276 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
    float _278 = 1.0 / _270;
    float _280 = _242 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _282 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[2].z, _276);
    float _284 = _242 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _286 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
    float _288 = _282 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _290 = sqrt(_274);
    float _292 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[1].x, _284);
    float _294 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[0].z, _286);
    bool _298 = _260 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _300 = fma(_246, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
    float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    bool _304 = _260 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _306 = _288 * _278;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = _300 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _312 = _302 * _278;
    float _314 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _308;
    float _316 = _310 * _278;
    float _318 = _314 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _320 = _314 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    bool _322 = _290 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _324 = _290 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _326 = fma(_318, 0.5, _312);
    float _328 = fma(_320, 0.5, _316);
    float _330 = fma(_318, -0.5, _312);
    bool _332 = !_298;
    int _335 = _332 ? 0 : 1;
    int _337 = 2;
    int _339 = 2;
    if (!_298)
    {
        _337 = 1;
    }
    int _341 = _337;
    float3 _1212 = float3(_326, _328, float(0));
    float3 _1216 = select(_1212, float3(0.0), isnan(_1212));
    float _343 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1216.xy, uint(rint(_1216.z)), _308);
    float3 _1223 = float3(_330, _328, float(0));
    float3 _1225 = select(_1223, float3(0.0), isnan(_1223));
    float _345 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1225.xy, uint(rint(_1225.z)), _308);
    int _347 = _341;
    if (!_304)
    {
        _347 = _335;
    }
    int _349 = _347;
    float _351 = _216 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _353 = _216 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _355 = !_322;
    int _357 = _355 ? 0 : 1;
    float _359 = _216 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _361 = float(_349);
    float _363 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[19].x, _351);
    if (!_322)
    {
        _339 = 1;
    }
    int _365 = _339;
    float _367 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[22].x, _353);
    float _369 = precise::min(_361, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _371 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[20].x, _359);
    int _373 = _365;
    if (!_324)
    {
        _373 = _357;
    }
    int _375 = _373;
    float _377 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[19].z, _363);
    bool _379 = _369 != 1.0;
    bool _381 = isnan(_369);
    bool _383 = _379 || _381;
    bool _385 = isnan(1.0);
    bool _387 = _383 || _385;
    float _389 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[22].z, _367);
    float _391 = float(_375);
    float _393 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[20].z, _371);
    float _395 = _377 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _397 = _216 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _399 = _216 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _401 = _369 != 0.0;
    bool _403 = isnan(_369);
    bool _405 = _401 || _403;
    bool _407 = isnan(0.0);
    bool _409 = _405 || _407;
    float _411 = _216 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _413 = _216 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _415 = _216 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _417 = _216 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _419 = _216 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _421 = _395;
    if (_387)
    {
        float _423 = _389 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _421 = _423;
    }
    float _425 = _421;
    float _427 = precise::min(_391, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _429 = _216 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _431 = _216 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _433 = _216 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _435 = _216 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _437 = _216 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _439 = _216 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _441 = _216 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _443 = _427 != 1.0;
    bool _445 = isnan(_427);
    bool _447 = _443 || _445;
    bool _449 = isnan(1.0);
    bool _451 = _447 || _449;
    float _453 = _216 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _455 = _427 != 0.0;
    bool _457 = isnan(_427);
    bool _459 = _455 || _457;
    bool _461 = isnan(0.0);
    bool _463 = _459 || _461;
    float _465 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[21].x, _397);
    float _467 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[24].x, _399);
    float _469 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[18].x, _417);
    float _471 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[30].x, _437);
    float _473 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[28].x, _433);
    float _475 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[31].x, _439);
    float _477 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[33].x, _453);
    float _479 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[27].x, _431);
    float _481 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[29].x, _435);
    float _483 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[21].z, _465);
    float _485 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[24].z, _467);
    float _487 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[23].x, _411);
    float _489 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[16].x, _413);
    float _491 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[17].x, _415);
    float _493 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[25].x, _419);
    float _495 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[26].x, _429);
    float _497 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[32].x, _441);
    float _499 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[30].z, _471);
    float _501 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[18].z, _469);
    float _503 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[28].z, _473);
    float _505 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[31].z, _475);
    float _507 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[33].z, _477);
    float _509 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[29].z, _481);
    float _511 = _483 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _513 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[27].z, _479);
    float _515 = _511;
    float _517 = _425;
    if (_387)
    {
        float _519 = _485 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _515 = _519;
    }
    float _521 = _515;
    float _523 = _499 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _525 = _521;
    float _527 = _523;
    if (!_409)
    {
        float _529 = _501 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _525 = _529;
    }
    float _531 = _525;
    float _533 = _503 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _535 = _533;
    if (_451)
    {
        float _537 = _507 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _527 = _537;
    }
    float _539 = _527;
    float _541 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[23].z, _487);
    float _543 = _509 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _545 = _539;
    float _547 = _543;
    if (_451)
    {
        float _549 = _505 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _535 = _549;
    }
    float _551 = _535;
    float _553 = _551;
    if (!_463)
    {
        float _555 = _513 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _545 = _555;
    }
    float _557 = _545;
    float _559 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[17].z, _491);
    float _561 = rint(_369);
    float _563 = precise::max(_561, 0.0);
    uint _566 = uint(_563);
    uint _568 = clamp(_566, 0u, 65535u);
    float _570 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _572 = 0.0 + _531;
    float _574 = precise::clamp(_572, 0.0, 1.0);
    float _576 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _578 = _393 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _580 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[25].z, _493);
    float _582 = _578;
    if (_387)
    {
        float _584 = _541 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _582 = _584;
    }
    float _586 = _582;
    float _588 = 0.0 + _557;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = _586;
    if (!_409)
    {
        float _594 = _559 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _592 = _594;
    }
    float _596 = _592;
    float _598 = rint(_427);
    float _600 = precise::max(_598, 0.0);
    uint _602 = uint(_600);
    uint _604 = clamp(_602, 0u, 65535u);
    float _606 = _574 * _576;
    if (!_463)
    {
        float _608 = _580 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _553 = _608;
    }
    float _610 = _553;
    float _612 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[32].z, _497);
    float _614 = _570 * _590;
    float _616 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[26].z, _495);
    float _618 = _576 * _590;
    float _620 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[16].z, _489);
    float _622 = fma(_606, 0.5, _596);
    float _624 = fma(_606, -0.5, _596);
    if (_451)
    {
        float _626 = _612 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _547 = _626;
    }
    float _628 = _547;
    float _630 = fma(_614, 0.5, _610);
    float _632 = fma(_614, -0.5, _610);
    float _634 = _628;
    if (!_463)
    {
        float _636 = _616 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _634 = _636;
    }
    float _638 = _634;
    float _640 = fma(_320, -0.5, _316);
    if (!_409)
    {
        float _642 = _620 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _517 = _642;
    }
    float _644 = _517;
    float _646 = _574 * _570;
    float _648 = fma(_646, 0.5, _644);
    float _650 = fma(_646, -0.5, _644);
    float _652 = fma(_618, 0.5, _638);
    float3 _1803 = float3(_326, _640, float(0));
    float3 _1805 = select(_1803, float3(0.0), isnan(_1803));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1805.xy, uint(rint(_1805.z)), _308);
    float3 _1812 = float3(_330, _640, float(0));
    float3 _1814 = select(_1812, float3(0.0), isnan(_1812));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1814.xy, uint(rint(_1814.z)), _308);
    float3 _1823 = float3(_650, _622, float(int(_568)));
    float3 _1825 = select(_1823, float3(0.0), isnan(_1823));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1825.xy, uint(rint(_1825.z)), _574);
    float3 _1834 = float3(_648, _622, float(int(_568)));
    float3 _1836 = select(_1834, float3(0.0), isnan(_1834));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1836.xy, uint(rint(_1836.z)), _574);
    float3 _1845 = float3(_648, _624, float(int(_568)));
    float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1847.xy, uint(rint(_1847.z)), _574);
    float _664 = fma(_618, -0.5, _638);
    float3 _1859 = float3(_632, _652, float(int(_604)));
    float3 _1861 = select(_1859, float3(0.0), isnan(_1859));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1861.xy, uint(rint(_1861.z)), _590);
    float3 _1870 = float3(_630, _652, float(int(_604)));
    float3 _1872 = select(_1870, float3(0.0), isnan(_1870));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1872.xy, uint(rint(_1872.z)), _590);
    float3 _1881 = float3(_630, _664, float(int(_604)));
    float3 _1883 = select(_1881, float3(0.0), isnan(_1881));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1883.xy, uint(rint(_1883.z)), _590);
    float3 _1892 = float3(_650, _624, float(int(_568)));
    float3 _1894 = select(_1892, float3(0.0), isnan(_1892));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1894.xy, uint(rint(_1894.z)), _574);
    float3 _1903 = float3(_632, _664, float(int(_604)));
    float3 _1905 = select(_1903, float3(0.0), isnan(_1903));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1905.xy, uint(rint(_1905.z)), _590);
    float2 _1911 = float2(_54, _56);
    float _676 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1911, float2(0.0), isnan(_1911))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1911, float2(0.0), isnan(_1911))).x;
    float _678 = -_214;
    float _680 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _682 = _678 + _680;
    float _684 = _682 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _686 = precise::clamp(_684, 0.0, 1.0);
    float _688 = _343 + _345;
    float _690 = -_214;
    float _692 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _694 = _690 + _692;
    float _696 = _694 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = _688 + _654;
    float _702 = _660 + _658;
    float _704 = _700 + _656;
    float _706 = _702 + _662;
    float _708 = fma(_704, 0.25, _698);
    float _710 = _668 + _666;
    float _712 = _710 + _670;
    float _714 = _706 + _672;
    float _716 = _712 + _674;
    float _718 = _714 * 0.25;
    float _720 = _716 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _722 = _720 * 0.25;
    float _724 = fma(_718, (*spvDescriptorSet0.fp_c3)._m0[49].z, _722);
    float _726 = _686 + _724;
    out.m_47.x = _676;
    out.m_47.y = _708;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _726;
    return out;
}

