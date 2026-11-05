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
    float2 _754 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_754, float2(0.0), isnan(_754)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _771 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_771, float2(0.0), isnan(_771))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_771, float2(0.0), isnan(_771))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = _118 * _152;
    float _158 = _122 * _152;
    float _160 = _114 * _152;
    float _162 = _142 * _154;
    float _164 = _132 * _154;
    float _166 = _136 * _154;
    float _168 = _156 * _162;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_168;
    float _176 = fma(_158, _166, _174);
    float _178 = -_170;
    float _180 = fma(_160, _162, _178);
    float _182 = -_172;
    float _184 = fma(_156, _164, _182);
    float _186 = _176 * _176;
    float _188 = fma(_180, _180, _186);
    float _190 = fma(_184, _184, _188);
    float _192 = rsqrt(_190);
    float _194 = _176 * _192;
    float _196 = _180 * _192;
    float _198 = _184 * _192;
    float _200 = _194 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _202 = fma(_196, (*spvDescriptorSet0.fp_c3)._m0[35].x, _200);
    float _204 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[35].z, _202);
    float _206 = abs(_204);
    float _208 = -_206;
    float _210 = _208 + 1.0;
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = abs(_212);
    float _216 = log2(_214);
    float _218 = -_68;
    float _220 = fma(_218, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _222 = 1.0 / _220;
    float _224 = _216 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _226 = exp2(_224);
    float _228 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _230 = _222 * _228;
    float _232 = _230 * _70;
    float _234 = _230 * _72;
    float _236 = -_232;
    float _238 = _236 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _240 = -_234;
    float _242 = _240 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _244 = _238 * _238;
    float _246 = -_230;
    float _248 = _246 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _250 = _226 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _252 = fma(_242, _242, _244);
    float _254 = -_234;
    float _256 = _254 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _258 = fma(_194, _250, _232);
    float _260 = fma(_196, _250, _234);
    float _262 = fma(_198, _250, _230);
    float _264 = fma(_248, _248, _252);
    float _266 = _258 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _268 = -_232;
    float _270 = _268 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _272 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[3].x, _266);
    float _274 = _270 * _270;
    float _276 = sqrt(_264);
    float _278 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].z, _272);
    float _280 = fma(_256, _256, _274);
    float _282 = -_230;
    float _284 = _282 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _286 = _278 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _288 = _258 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _290 = fma(_284, _284, _280);
    float _292 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[2].x, _288);
    float _294 = 1.0 / _286;
    float _296 = _258 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _298 = _258 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _300 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].z, _292);
    bool _304 = _276 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _306 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[0].x, _296);
    float _308 = fma(_260, (*spvDescriptorSet0.fp_c3)._m0[1].x, _298);
    float _310 = _300 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _312 = sqrt(_290);
    float _314 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].z, _306);
    float _316 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].z, _308);
    bool _318 = _276 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _320 = _314 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _322 = _316 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _324 = _310 * _294;
    float _326 = precise::clamp(_324, 0.0, 1.0);
    int _329 = 2;
    if (!_304)
    {
        _329 = 1;
    }
    int _331 = _329;
    float _333 = _320 * _294;
    float _335 = _322 * _294;
    float _337 = (*spvDescriptorSet0.fp_c3)._m0[47].x * _326;
    float _339 = _337 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _341 = _337 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    bool _343 = _312 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _345 = _312 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _347 = fma(_339, 0.5, _333);
    float _349 = fma(_341, 0.5, _335);
    float _351 = fma(_339, -0.5, _333);
    bool _353 = !_304;
    int _355 = _353 ? 0 : 1;
    float3 _1244 = float3(_347, _349, float(0));
    float3 _1248 = select(_1244, float3(0.0), isnan(_1244));
    float _357 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1248.xy, uint(rint(_1248.z)), _326);
    float3 _1255 = float3(_351, _349, float(0));
    float3 _1257 = select(_1255, float3(0.0), isnan(_1255));
    float _359 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1257.xy, uint(rint(_1257.z)), _326);
    int _361 = _331;
    int _363 = 2;
    if (!_318)
    {
        _361 = _355;
    }
    int _365 = _361;
    float _367 = _232 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _369 = _232 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    bool _371 = !_343;
    int _373 = _371 ? 0 : 1;
    float _375 = _232 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _377 = float(_365);
    float _379 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[19].x, _367);
    if (!_343)
    {
        _363 = 1;
    }
    int _381 = _363;
    float _383 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[22].x, _369);
    float _385 = precise::min(_377, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _387 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[20].x, _375);
    int _389 = _381;
    if (!_345)
    {
        _389 = _373;
    }
    int _391 = _389;
    float _393 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[19].z, _379);
    bool _395 = _385 != 1.0;
    bool _397 = isnan(_385);
    bool _399 = _395 || _397;
    bool _401 = isnan(1.0);
    bool _403 = _399 || _401;
    float _405 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[22].z, _383);
    float _407 = float(_391);
    float _409 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[20].z, _387);
    float _411 = _393 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _413 = _232 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _415 = _232 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _417 = _385 != 0.0;
    bool _419 = isnan(_385);
    bool _421 = _417 || _419;
    bool _423 = isnan(0.0);
    bool _425 = _421 || _423;
    float _427 = _232 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _429 = _232 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _431 = _232 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _433 = _232 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _435 = _232 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _437 = _411;
    if (_403)
    {
        float _439 = _405 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _437 = _439;
    }
    float _441 = _437;
    float _443 = precise::min(_407, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _445 = _232 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _447 = _232 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _449 = _232 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _451 = _232 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _453 = _232 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _455 = _232 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _457 = _232 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _459 = _443 != 1.0;
    bool _461 = isnan(_443);
    bool _463 = _459 || _461;
    bool _465 = isnan(1.0);
    bool _467 = _463 || _465;
    float _469 = _232 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    bool _471 = _443 != 0.0;
    bool _473 = isnan(_443);
    bool _475 = _471 || _473;
    bool _477 = isnan(0.0);
    bool _479 = _475 || _477;
    float _481 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[21].x, _413);
    float _483 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[24].x, _415);
    float _485 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[18].x, _433);
    float _487 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[30].x, _453);
    float _489 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[28].x, _449);
    float _491 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[31].x, _455);
    float _493 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[33].x, _469);
    float _495 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[27].x, _447);
    float _497 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[29].x, _451);
    float _499 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[21].z, _481);
    float _501 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[24].z, _483);
    float _503 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[23].x, _427);
    float _505 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[16].x, _429);
    float _507 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[17].x, _431);
    float _509 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[25].x, _435);
    float _511 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[26].x, _445);
    float _513 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[32].x, _457);
    float _515 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[30].z, _487);
    float _517 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[18].z, _485);
    float _519 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[28].z, _489);
    float _521 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[31].z, _491);
    float _523 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[33].z, _493);
    float _525 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[29].z, _497);
    float _527 = _499 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _529 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[27].z, _495);
    float _531 = _527;
    float _533 = _441;
    if (_403)
    {
        float _535 = _501 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _531 = _535;
    }
    float _537 = _531;
    float _539 = _515 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _541 = _537;
    float _543 = _539;
    if (!_425)
    {
        float _545 = _517 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _541 = _545;
    }
    float _547 = _541;
    float _549 = _519 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _551 = _549;
    if (_467)
    {
        float _553 = _523 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _543 = _553;
    }
    float _555 = _543;
    float _557 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[23].z, _503);
    float _559 = _525 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _561 = _555;
    float _563 = _559;
    if (_467)
    {
        float _565 = _521 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _551 = _565;
    }
    float _567 = _551;
    float _569 = _567;
    if (!_479)
    {
        float _571 = _529 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _561 = _571;
    }
    float _573 = _561;
    float _575 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[17].z, _507);
    float _577 = rint(_385);
    float _579 = precise::max(_577, 0.0);
    uint _582 = uint(_579);
    uint _584 = clamp(_582, 0u, 65535u);
    float _586 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _588 = 0.0 + _547;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _594 = _409 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _596 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[25].z, _509);
    float _598 = _594;
    if (_403)
    {
        float _600 = _557 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _598 = _600;
    }
    float _602 = _598;
    float _604 = 0.0 + _573;
    float _606 = precise::clamp(_604, 0.0, 1.0);
    float _608 = _602;
    if (!_425)
    {
        float _610 = _575 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _608 = _610;
    }
    float _612 = _608;
    float _614 = rint(_443);
    float _616 = precise::max(_614, 0.0);
    uint _618 = uint(_616);
    uint _620 = clamp(_618, 0u, 65535u);
    float _622 = _590 * _592;
    if (!_479)
    {
        float _624 = _596 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _569 = _624;
    }
    float _626 = _569;
    float _628 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[32].z, _513);
    float _630 = _586 * _606;
    float _632 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[26].z, _511);
    float _634 = _592 * _606;
    float _636 = fma(_230, (*spvDescriptorSet0.fp_c3)._m0[16].z, _505);
    float _638 = fma(_622, 0.5, _612);
    float _640 = fma(_622, -0.5, _612);
    if (_467)
    {
        float _642 = _628 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _563 = _642;
    }
    float _644 = _563;
    float _646 = fma(_630, 0.5, _626);
    float _648 = fma(_630, -0.5, _626);
    float _650 = _644;
    if (!_479)
    {
        float _652 = _632 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _650 = _652;
    }
    float _654 = _650;
    float _656 = fma(_341, -0.5, _335);
    if (!_425)
    {
        float _658 = _636 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _533 = _658;
    }
    float _660 = _533;
    float _662 = _590 * _586;
    float _664 = fma(_662, 0.5, _660);
    float _666 = fma(_662, -0.5, _660);
    float _668 = fma(_634, 0.5, _654);
    float3 _1835 = float3(_347, _656, float(0));
    float3 _1837 = select(_1835, float3(0.0), isnan(_1835));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1837.xy, uint(rint(_1837.z)), _326);
    float3 _1844 = float3(_351, _656, float(0));
    float3 _1846 = select(_1844, float3(0.0), isnan(_1844));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1846.xy, uint(rint(_1846.z)), _326);
    float3 _1855 = float3(_666, _638, float(int(_584)));
    float3 _1857 = select(_1855, float3(0.0), isnan(_1855));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1857.xy, uint(rint(_1857.z)), _590);
    float3 _1866 = float3(_664, _638, float(int(_584)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1868.xy, uint(rint(_1868.z)), _590);
    float3 _1877 = float3(_664, _640, float(int(_584)));
    float3 _1879 = select(_1877, float3(0.0), isnan(_1877));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1879.xy, uint(rint(_1879.z)), _590);
    float _680 = fma(_634, -0.5, _654);
    float3 _1891 = float3(_648, _668, float(int(_620)));
    float3 _1893 = select(_1891, float3(0.0), isnan(_1891));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1893.xy, uint(rint(_1893.z)), _606);
    float3 _1902 = float3(_646, _668, float(int(_620)));
    float3 _1904 = select(_1902, float3(0.0), isnan(_1902));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1904.xy, uint(rint(_1904.z)), _606);
    float3 _1913 = float3(_646, _680, float(int(_620)));
    float3 _1915 = select(_1913, float3(0.0), isnan(_1913));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1915.xy, uint(rint(_1915.z)), _606);
    float3 _1924 = float3(_666, _640, float(int(_584)));
    float3 _1926 = select(_1924, float3(0.0), isnan(_1924));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1926.xy, uint(rint(_1926.z)), _590);
    float3 _1935 = float3(_648, _680, float(int(_620)));
    float3 _1937 = select(_1935, float3(0.0), isnan(_1935));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1937.xy, uint(rint(_1937.z)), _606);
    float2 _1943 = float2(_54, _56);
    float _692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1943, float2(0.0), isnan(_1943))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1943, float2(0.0), isnan(_1943))).x;
    float _694 = -_230;
    float _696 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _698 = _694 + _696;
    float _700 = _698 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _702 = precise::clamp(_700, 0.0, 1.0);
    float _704 = _357 + _359;
    float _706 = -_230;
    float _708 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _710 = _706 + _708;
    float _712 = _710 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _714 = precise::clamp(_712, 0.0, 1.0);
    float _716 = _704 + _670;
    float _718 = _676 + _674;
    float _720 = _716 + _672;
    float _722 = _718 + _678;
    float _724 = fma(_720, 0.25, _714);
    float _726 = _684 + _682;
    float _728 = _726 + _686;
    float _730 = _722 + _688;
    float _732 = _728 + _690;
    float _734 = _730 * 0.25;
    float _736 = _732 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _738 = _736 * 0.25;
    float _740 = fma(_734, (*spvDescriptorSet0.fp_c3)._m0[49].z, _738);
    float _742 = _702 + _740;
    out.m_47.x = _692;
    out.m_47.y = _724;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _742;
    return out;
}

