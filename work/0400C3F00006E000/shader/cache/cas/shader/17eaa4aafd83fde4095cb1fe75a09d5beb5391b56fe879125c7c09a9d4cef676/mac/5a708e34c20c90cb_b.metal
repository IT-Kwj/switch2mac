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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_E [[id(7)]];
    sampler fp_t_tcb_ESmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_38 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_40 [[user(locn2), center_no_perspective]];
    float4 m_36 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _52 = in.m_36.x;
    float _54 = in.m_36.y;
    float2 _734 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_734, float2(0.0), isnan(_734)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _751 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_751, float2(0.0), isnan(_751))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_751, float2(0.0), isnan(_751))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = -_62;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_64;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = _68 * _84;
    float _100 = _70 * _84;
    float _102 = -_66;
    float _104 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _106 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[46].z, _104);
    float _108 = -_98;
    float _110 = fma(_90, _72, _108);
    float _112 = -_98;
    float _114 = fma(_96, _74, _112);
    float _116 = -_100;
    float _118 = fma(_90, _76, _116);
    float _120 = -_100;
    float _122 = fma(_96, _78, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_84;
    float _130 = _128 + _90;
    float _132 = -_84;
    float _134 = _132 + _96;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = _106 * _68;
    float _142 = fma(_130, _130, _136);
    float _144 = fma(_134, _134, _138);
    float _146 = -_140;
    float _148 = _146 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _150 = rsqrt(_142);
    float _152 = rsqrt(_144);
    float _154 = _118 * _150;
    float _156 = _130 * _150;
    float _158 = _110 * _150;
    float _160 = _134 * _152;
    float _162 = _114 * _152;
    float _164 = _122 * _152;
    float _166 = _154 * _160;
    float _168 = _156 * _162;
    float _170 = -_166;
    float _172 = fma(_156, _164, _170);
    float _174 = _158 * _164;
    float _176 = -_168;
    float _178 = fma(_158, _160, _176);
    float _180 = _148 * _148;
    float _182 = _172 * _172;
    float _184 = -_174;
    float _186 = fma(_154, _162, _184);
    float _188 = fma(_178, _178, _182);
    float _190 = fma(_186, _186, _188);
    float _192 = rsqrt(_190);
    float _194 = -_140;
    float _196 = _194 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _198 = _172 * _192;
    float _200 = _178 * _192;
    float _202 = _186 * _192;
    float _204 = _106 * _70;
    float _206 = _198 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _208 = -_204;
    float _210 = _208 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _212 = fma(_200, (*spvDescriptorSet0.fp_c3)._m0[35].x, _206);
    float _214 = -_204;
    float _216 = _214 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _218 = fma(_210, _210, _180);
    float _220 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[35].z, _212);
    float _222 = -_106;
    float _224 = _222 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _226 = abs(_220);
    float _228 = -_226;
    float _230 = _228 + 1.0;
    float _232 = precise::clamp(_230, 0.0, 1.0);
    float _234 = fma(_224, _224, _218);
    float _236 = -_106;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _240 = abs(_232);
    float _242 = log2(_240);
    float _244 = sqrt(_234);
    float _246 = _242 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _248 = _196 * _196;
    float _250 = fma(_216, _216, _248);
    float _252 = exp2(_246);
    bool _256 = _244 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _258 = fma(_238, _238, _250);
    bool _260 = _244 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _262 = sqrt(_258);
    int _265 = 2;
    if (!_256)
    {
        _265 = 1;
    }
    int _267 = _265;
    float _269 = _252 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _271 = fma(_198, _269, _140);
    float _273 = fma(_200, _269, _204);
    float _275 = fma(_202, _269, _106);
    float _277 = _271 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _279 = _271 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    bool _281 = _262 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _283 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[3].x, _277);
    float _285 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[2].x, _279);
    bool _287 = _262 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _289 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[3].z, _283);
    float _291 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[2].z, _285);
    bool _293 = !_256;
    int _295 = _293 ? 0 : 1;
    float _297 = _289 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _299 = _271 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _301 = _271 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    bool _303 = !_281;
    int _305 = _303 ? 0 : 1;
    float _307 = 1.0 / _297;
    float _309 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[0].x, _299);
    float _311 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[1].x, _301);
    float _313 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[0].z, _309);
    float _315 = fma(_275, (*spvDescriptorSet0.fp_c3)._m0[1].z, _311);
    float _317 = _291 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _319 = _313 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _321 = _315 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    int _323 = 2;
    int _325 = _267;
    if (!_281)
    {
        _323 = 1;
    }
    int _327 = _323;
    float _329 = _317 * _307;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _319 * _307;
    float _335 = _321 * _307;
    float _337 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _331;
    float _339 = _337 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _341 = _337 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _343 = fma(_339, 0.5, _333);
    float _345 = fma(_341, 0.5, _335);
    float3 _1214 = float3(_343, _345, float(0));
    float3 _1218 = select(_1214, float3(0.0), isnan(_1214));
    float _347 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1218.xy, uint(rint(_1218.z)), _331);
    int _349 = _327;
    if (!_260)
    {
        _325 = _295;
    }
    int _351 = _325;
    float _353 = _140 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    if (!_287)
    {
        _349 = _305;
    }
    int _355 = _349;
    float _357 = _140 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _359 = _140 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _361 = _140 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _363 = _140 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _365 = _140 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _367 = _140 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _369 = _140 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _371 = _140 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _373 = _140 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _375 = _140 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _377 = _140 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _379 = _140 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _381 = _140 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _383 = _140 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _385 = _140 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _387 = _140 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _389 = _140 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _391 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[24].x, _365);
    float _393 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[20].x, _359);
    float _395 = float(_351);
    float _397 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[26].x, _375);
    float _399 = float(_355);
    float _401 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[23].x, _361);
    float _403 = precise::min(_395, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _405 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[28].x, _379);
    float _407 = precise::min(_399, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _409 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[31].x, _385);
    bool _411 = _403 != 1.0;
    bool _413 = isnan(_403);
    bool _415 = _411 || _413;
    bool _417 = isnan(1.0);
    bool _419 = _415 || _417;
    float _421 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].z, _393);
    bool _423 = _407 != 1.0;
    bool _425 = isnan(_407);
    bool _427 = _423 || _425;
    bool _429 = isnan(1.0);
    bool _431 = _427 || _429;
    float _433 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].z, _401);
    bool _435 = _407 != 0.0;
    bool _437 = isnan(_407);
    bool _439 = _435 || _437;
    bool _441 = isnan(0.0);
    bool _443 = _439 || _441;
    float _445 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[30].x, _383);
    bool _447 = _403 != 0.0;
    bool _449 = isnan(_403);
    bool _451 = _447 || _449;
    bool _453 = isnan(0.0);
    bool _455 = _451 || _453;
    float _457 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[19].x, _353);
    float _459 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[22].x, _357);
    float _461 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[21].x, _363);
    float _463 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[16].x, _367);
    float _465 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[17].x, _369);
    float _467 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[18].x, _371);
    float _469 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[25].x, _373);
    float _471 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[27].x, _377);
    float _473 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[29].x, _381);
    float _475 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[32].x, _387);
    float _477 = fma(_204, (*spvDescriptorSet0.fp_c3)._m0[33].x, _389);
    float _479 = _421 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _481 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].z, _405);
    float _483 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].z, _409);
    float _485 = _479;
    if (_419)
    {
        float _487 = _433 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _485 = _487;
    }
    float _489 = _485;
    float _491 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].z, _445);
    float _493 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].z, _477);
    float _495 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].z, _461);
    float _497 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].z, _473);
    float _499 = _481 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _501 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].z, _471);
    float _503 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].z, _391);
    float _505 = _499;
    float _507 = _489;
    if (_431)
    {
        float _509 = _483 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _505 = _509;
    }
    float _511 = _505;
    float _513 = _491 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _515 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].z, _467);
    float _517 = rint(_403);
    float _519 = precise::max(_517, 0.0);
    uint _522 = uint(_519);
    uint _524 = clamp(_522, 0u, 65535u);
    float _526 = _513;
    float _528 = _511;
    if (_431)
    {
        float _530 = _493 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _526 = _530;
    }
    float _532 = _526;
    float _534 = _495 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _536 = _497 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _538 = _532;
    float _540 = _534;
    float _542 = _536;
    if (!_443)
    {
        float _544 = _501 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _538 = _544;
    }
    float _546 = _538;
    if (_419)
    {
        float _548 = _503 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _540 = _548;
    }
    float _550 = _540;
    float _552 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _554 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _556 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _465);
    float _558 = _550;
    if (!_455)
    {
        float _560 = _515 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _558 = _560;
    }
    float _562 = _558;
    float _564 = rint(_407);
    float _566 = precise::max(_564, 0.0);
    uint _568 = uint(_566);
    uint _570 = clamp(_568, 0u, 65535u);
    float _572 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].z, _457);
    float _574 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].z, _459);
    if (!_455)
    {
        float _576 = _556 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _507 = _576;
    }
    float _578 = _507;
    float _580 = 0.0 + _562;
    float _582 = precise::clamp(_580, 0.0, 1.0);
    float _584 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _463);
    float _586 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].z, _469);
    float _588 = 0.0 + _546;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].z, _475);
    float _594 = _572 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _596 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].z, _397);
    float _598 = _594;
    if (_419)
    {
        float _600 = _574 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _598 = _600;
    }
    float _602 = _598;
    float _604 = _582 * _552;
    float _606 = fma(_339, -0.5, _333);
    float _608 = fma(_341, -0.5, _335);
    float _610 = _602;
    if (!_455)
    {
        float _612 = _584 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _610 = _612;
    }
    float _614 = _610;
    if (!_443)
    {
        float _616 = _586 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _528 = _616;
    }
    float _618 = _528;
    float _620 = _552 * _590;
    if (_431)
    {
        float _622 = _592 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _542 = _622;
    }
    float _624 = _542;
    float _626 = _582 * _554;
    float _628 = _624;
    if (!_443)
    {
        float _630 = _596 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _628 = _630;
    }
    float _632 = _628;
    float _634 = _554 * _590;
    float _636 = fma(_604, 0.5, _614);
    float _638 = fma(_620, 0.5, _618);
    float _640 = fma(_604, -0.5, _614);
    float _642 = fma(_626, 0.5, _578);
    float _644 = fma(_620, -0.5, _618);
    float _646 = fma(_634, 0.5, _632);
    float3 _1787 = float3(_606, _345, float(0));
    float3 _1789 = select(_1787, float3(0.0), isnan(_1787));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1789.xy, uint(rint(_1789.z)), _331);
    float3 _1796 = float3(_343, _608, float(0));
    float3 _1798 = select(_1796, float3(0.0), isnan(_1796));
    float _650 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1798.xy, uint(rint(_1798.z)), _331);
    float3 _1805 = float3(_606, _608, float(0));
    float3 _1807 = select(_1805, float3(0.0), isnan(_1805));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1807.xy, uint(rint(_1807.z)), _331);
    float3 _1816 = float3(_640, _642, float(int(_524)));
    float3 _1818 = select(_1816, float3(0.0), isnan(_1816));
    float _654 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1818.xy, uint(rint(_1818.z)), _582);
    float _656 = fma(_626, -0.5, _578);
    float _658 = fma(_634, -0.5, _632);
    float3 _1833 = float3(_636, _642, float(int(_524)));
    float3 _1835 = select(_1833, float3(0.0), isnan(_1833));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1835.xy, uint(rint(_1835.z)), _582);
    float3 _1844 = float3(_644, _646, float(int(_570)));
    float3 _1846 = select(_1844, float3(0.0), isnan(_1844));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1846.xy, uint(rint(_1846.z)), _590);
    float3 _1855 = float3(_638, _646, float(int(_570)));
    float3 _1857 = select(_1855, float3(0.0), isnan(_1855));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1857.xy, uint(rint(_1857.z)), _590);
    float3 _1866 = float3(_636, _656, float(int(_524)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1868.xy, uint(rint(_1868.z)), _582);
    float3 _1877 = float3(_638, _658, float(int(_570)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1879.xy, uint(rint(_1879.z)), _590);
    float3 _1888 = float3(_640, _656, float(int(_524)));
    float3 _1890 = select(_1888, float3(0.0), isnan(_1888));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1890.xy, uint(rint(_1890.z)), _582);
    float3 _1899 = float3(_644, _658, float(int(_570)));
    float3 _1901 = select(_1899, float3(0.0), isnan(_1899));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1901.xy, uint(rint(_1901.z)), _590);
    float _674 = -_106;
    float _676 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _678 = _674 + _676;
    float _680 = _678 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _682 = precise::clamp(_680, 0.0, 1.0);
    float _684 = -_106;
    float _686 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _688 = _684 + _686;
    float _690 = _688 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _692 = precise::clamp(_690, 0.0, 1.0);
    float _694 = _347 + _648;
    float _696 = _694 + _650;
    float _698 = _696 + _652;
    float _700 = _660 + _654;
    float _702 = fma(_698, 0.25, _682);
    float _704 = _664 + _662;
    float _706 = _700 + _666;
    float _708 = _704 + _668;
    float _710 = _706 + _670;
    float _712 = _708 + _672;
    float _714 = _710 * 0.25;
    float _716 = _712 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _718 = _716 * 0.25;
    float _720 = fma(_714, (*spvDescriptorSet0.fp_c3)._m0[49].z, _718);
    float _722 = _692 + _720;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _702;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _722;
    return out;
}

