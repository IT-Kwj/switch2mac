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
    float2 _760 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_760, float2(0.0), isnan(_760)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _777 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_777, float2(0.0), isnan(_777))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_777, float2(0.0), isnan(_777))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
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
    float _106 = -_68;
    float _108 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _110 = _74 * _102;
    float _112 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _114 = _96 * _112;
    float _116 = -_104;
    float _118 = fma(_114, _72, _116);
    float _120 = 1.0 / _108;
    float _122 = -_110;
    float _124 = fma(_114, _78, _122);
    float _126 = -_102;
    float _128 = _126 + _114;
    float _130 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _132 = _98 * _130;
    float _134 = _118 * _118;
    float _136 = -_104;
    float _138 = fma(_132, _76, _136);
    float _140 = -_110;
    float _142 = fma(_132, _80, _140);
    float _144 = fma(_124, _124, _134);
    float _146 = -_102;
    float _148 = _146 + _132;
    float _150 = _138 * _138;
    float _152 = fma(_128, _128, _144);
    float _154 = fma(_142, _142, _150);
    float _156 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _158 = _120 * _156;
    float _160 = fma(_148, _148, _154);
    float _162 = rsqrt(_152);
    float _164 = _158 * _70;
    float _166 = _158 * _74;
    float _168 = -_164;
    float _170 = _168 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _172 = -_166;
    float _174 = _172 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _176 = _164 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _178 = rsqrt(_160);
    float _180 = _170 * _170;
    float _182 = _164 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _184 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[20].x, _176);
    float _186 = _164 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _188 = fma(_174, _174, _180);
    float _190 = -_158;
    float _192 = _190 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _194 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[20].z, _184);
    float _196 = _124 * _162;
    float _198 = _128 * _162;
    float _200 = _118 * _162;
    float _202 = _194 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _204 = _164 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _206 = _164 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _208 = _164 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _210 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[28].x, _182);
    float _212 = _148 * _178;
    float _214 = _142 * _178;
    float _216 = _138 * _178;
    float _218 = fma(_192, _192, _188);
    float _220 = _196 * _212;
    float _222 = _164 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _224 = _198 * _216;
    float _226 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[21].x, _204);
    float _228 = -_220;
    float _230 = fma(_198, _214, _228);
    float _232 = sqrt(_218);
    float _234 = _200 * _214;
    float _236 = -_224;
    float _238 = fma(_200, _212, _236);
    float _240 = _230 * _230;
    float _242 = -_164;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _246 = -_234;
    float _248 = fma(_196, _216, _246);
    float _250 = -_166;
    float _252 = _250 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _254 = fma(_238, _238, _240);
    float _256 = _244 * _244;
    float _258 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[23].x, _222);
    float _260 = _164 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _262 = fma(_248, _248, _254);
    float _264 = fma(_252, _252, _256);
    float _266 = -_158;
    float _268 = _266 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _270 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[22].x, _260);
    bool _274 = _232 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _276 = fma(_268, _268, _264);
    float _278 = rsqrt(_262);
    bool _280 = _232 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _282 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[22].z, _270);
    bool _284 = !_274;
    int _287 = _284 ? 0 : 1;
    float _289 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[29].x, _186);
    float _291 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[30].x, _206);
    float _293 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[31].x, _208);
    float _295 = _164 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _297 = sqrt(_276);
    float _299 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[21].z, _226);
    float _301 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[28].z, _210);
    int _303 = 2;
    float _305 = _202;
    if (!_274)
    {
        _303 = 1;
    }
    int _307 = _303;
    float _309 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[29].z, _289);
    float _311 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[30].z, _291);
    int _313 = _307;
    if (!_280)
    {
        _313 = _287;
    }
    int _315 = _313;
    float _317 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[31].z, _293);
    float _319 = _230 * _278;
    float _321 = _238 * _278;
    float _323 = _248 * _278;
    float _325 = float(_315);
    float _327 = _319 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _329 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[23].z, _258);
    float _331 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[32].x, _295);
    bool _333 = _297 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _335 = fma(_321, (*spvDescriptorSet0.fp_c3)._m0[35].x, _327);
    bool _337 = _297 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _339 = _164 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _341 = precise::min(_325, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _343 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[35].z, _335);
    bool _345 = !_337;
    int _347 = _345 ? 0 : 1;
    float _349 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[19].x, _339);
    bool _351 = _341 != 1.0;
    bool _353 = isnan(_341);
    bool _355 = _351 || _353;
    bool _357 = isnan(1.0);
    bool _359 = _355 || _357;
    float _361 = abs(_343);
    float _363 = -_361;
    float _365 = _363 + 1.0;
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = _301 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _371 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[19].z, _349);
    float _373 = _309 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _375 = _164 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _377 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[32].z, _331);
    float _379 = _371 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    int _381 = 2;
    float _383 = _379;
    float _385 = _369;
    float _387 = _373;
    if (!_337)
    {
        _381 = 1;
    }
    int _389 = _381;
    float _391 = abs(_367);
    float _393 = log2(_391);
    int _395 = _389;
    if (!_333)
    {
        _395 = _347;
    }
    int _397 = _395;
    float _399 = _164 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _401 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[33].x, _375);
    if (_359)
    {
        float _403 = _329 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _305 = _403;
    }
    float _405 = _305;
    float _407 = float(_397);
    float _409 = _405;
    if (_359)
    {
        float _411 = _282 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _383 = _411;
    }
    float _413 = _383;
    float _415 = _164 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _417 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[18].x, _399);
    float _419 = precise::min(_407, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _421 = _299 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _423 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[24].x, _415);
    float _425 = _164 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    bool _427 = _419 != 1.0;
    bool _429 = isnan(_419);
    bool _431 = _427 || _429;
    bool _433 = isnan(1.0);
    bool _435 = _431 || _433;
    float _437 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[33].z, _401);
    float _439 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[24].z, _423);
    float _441 = _393 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _443 = _311 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _445 = _164 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _447 = _421;
    float _449 = _443;
    float _451 = _413;
    if (_359)
    {
        float _453 = _439 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _447 = _453;
    }
    float _455 = _447;
    float _457 = _164 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _459 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[16].x, _425);
    float _461 = exp2(_441);
    float _463 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[25].x, _445);
    float _465 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[17].x, _457);
    bool _467 = _341 != 0.0;
    bool _469 = isnan(_341);
    bool _471 = _467 || _469;
    bool _473 = isnan(0.0);
    bool _475 = _471 || _473;
    float _477 = _455;
    if (_435)
    {
        float _479 = _317 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _385 = _479;
    }
    float _481 = _385;
    float _483 = _164 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _485 = _481;
    if (_435)
    {
        float _487 = _377 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _387 = _487;
    }
    float _489 = _387;
    float _491 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[17].z, _465);
    float _493 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[16].z, _459);
    float _495 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[26].x, _483);
    float _497 = _489;
    if (_435)
    {
        float _499 = _437 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _449 = _499;
    }
    float _501 = _449;
    bool _503 = _419 != 0.0;
    bool _505 = isnan(_419);
    bool _507 = _503 || _505;
    bool _509 = isnan(0.0);
    bool _511 = _507 || _509;
    float _513 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[18].z, _417);
    float _515 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[25].z, _463);
    float _517 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[26].z, _495);
    float _519 = rint(_419);
    float _521 = precise::max(_519, 0.0);
    uint _524 = uint(_521);
    uint _526 = clamp(_524, 0u, 65535u);
    float _528 = _461 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _530 = _501;
    if (!_475)
    {
        float _532 = _491 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _409 = _532;
    }
    float _534 = _409;
    if (!_475)
    {
        float _536 = _493 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _451 = _536;
    }
    float _538 = _451;
    if (!_475)
    {
        float _540 = _513 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _477 = _540;
    }
    float _542 = _477;
    float _544 = fma(_319, _528, _164);
    float _546 = _164 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _548 = fma(_323, _528, _158);
    float _550 = 0.0 + _542;
    float _552 = precise::clamp(_550, 0.0, 1.0);
    float _554 = _544 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _556 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[27].x, _546);
    float _558 = fma(_321, _528, _166);
    float _560 = _544 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _562 = _544 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _564 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[27].z, _556);
    if (!_511)
    {
        float _566 = _515 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _485 = _566;
    }
    float _568 = _485;
    float _570 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[3].x, _560);
    float _572 = _544 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    if (!_511)
    {
        float _574 = _564 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _530 = _574;
    }
    float _576 = _530;
    if (!_511)
    {
        float _578 = _517 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _497 = _578;
    }
    float _580 = _497;
    float _582 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[3].z, _570);
    float _584 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[0].x, _572);
    float _586 = 0.0 + _576;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = _582 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _592 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[1].x, _562);
    float _594 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[2].x, _554);
    float _596 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[0].z, _584);
    float _598 = 1.0 / _590;
    float _600 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[1].z, _592);
    float _602 = fma(_548, (*spvDescriptorSet0.fp_c3)._m0[2].z, _594);
    float _604 = _596 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _606 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _608 = _600 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _610 = _602 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _612 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _614 = _552 * _612;
    float _616 = _612 * _588;
    float _618 = _608 * _598;
    float _620 = _610 * _598;
    float _622 = precise::clamp(_620, 0.0, 1.0);
    float _624 = _604 * _598;
    float _626 = _552 * _606;
    float _628 = rint(_341);
    float _630 = precise::max(_628, 0.0);
    uint _632 = uint(_630);
    uint _634 = clamp(_632, 0u, 65535u);
    float _636 = _606 * _588;
    float _638 = fma(_626, 0.5, _538);
    float _640 = fma(_626, -0.5, _538);
    float _642 = fma(_614, 0.5, _534);
    float _644 = fma(_614, -0.5, _534);
    float _646 = fma(_636, 0.5, _568);
    float _648 = rint(_622);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    uint _654 = clamp(_652, 0u, 65535u);
    float _656 = fma(_636, -0.5, _568);
    float _658 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _660 = fma(_616, 0.5, _580);
    float _662 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _664 = fma(_616, -0.5, _580);
    float _666 = fma(_658, 0.5, _624);
    float _668 = fma(_658, -0.5, _624);
    float _670 = fma(_662, 0.5, _618);
    float _672 = fma(_662, -0.5, _618);
    float3 _1832 = float3(_668, _670, float(int(_654)));
    float3 _1836 = select(_1832, float3(0.0), isnan(_1832));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1836.xy, uint(rint(_1836.z)), 1.0);
    float3 _1844 = float3(_666, _670, float(int(_654)));
    float3 _1846 = select(_1844, float3(0.0), isnan(_1844));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1846.xy, uint(rint(_1846.z)), 1.0);
    float3 _1854 = float3(_666, _672, float(int(_654)));
    float3 _1856 = select(_1854, float3(0.0), isnan(_1854));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1856.xy, uint(rint(_1856.z)), 1.0);
    float3 _1864 = float3(_668, _672, float(int(_654)));
    float3 _1866 = select(_1864, float3(0.0), isnan(_1864));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1866.xy, uint(rint(_1866.z)), 1.0);
    float3 _1874 = float3(_640, _642, float(int(_634)));
    float3 _1876 = select(_1874, float3(0.0), isnan(_1874));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1876.xy, uint(rint(_1876.z)), _552);
    float3 _1885 = float3(_638, _642, float(int(_634)));
    float3 _1887 = select(_1885, float3(0.0), isnan(_1885));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1887.xy, uint(rint(_1887.z)), _552);
    float3 _1896 = float3(_638, _644, float(int(_634)));
    float3 _1898 = select(_1896, float3(0.0), isnan(_1896));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1898.xy, uint(rint(_1898.z)), _552);
    float3 _1907 = float3(_656, _660, float(int(_526)));
    float3 _1909 = select(_1907, float3(0.0), isnan(_1907));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1909.xy, uint(rint(_1909.z)), _588);
    float3 _1918 = float3(_646, _660, float(int(_526)));
    float3 _1920 = select(_1918, float3(0.0), isnan(_1918));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1920.xy, uint(rint(_1920.z)), _588);
    float3 _1929 = float3(_646, _664, float(int(_526)));
    float3 _1931 = select(_1929, float3(0.0), isnan(_1929));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1931.xy, uint(rint(_1931.z)), _588);
    float3 _1940 = float3(_640, _644, float(int(_634)));
    float3 _1942 = select(_1940, float3(0.0), isnan(_1940));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1942.xy, uint(rint(_1942.z)), _552);
    float3 _1951 = float3(_656, _664, float(int(_526)));
    float3 _1953 = select(_1951, float3(0.0), isnan(_1951));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1953.xy, uint(rint(_1953.z)), _588);
    float2 _1959 = float2(_54, _56);
    float _698 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1959, float2(0.0), isnan(_1959))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1959, float2(0.0), isnan(_1959))).x;
    float _700 = -_158;
    float _702 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _704 = _700 + _702;
    float _706 = _704 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _708 = precise::clamp(_706, 0.0, 1.0);
    float _710 = _676 + _674;
    float _712 = -_158;
    float _714 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _716 = _712 + _714;
    float _718 = _710 + _678;
    float _720 = _684 + _682;
    float _722 = _716 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _724 = precise::clamp(_722, 0.0, 1.0);
    float _726 = _690 + _688;
    float _728 = _720 + _686;
    float _730 = _718 + _680;
    float _732 = _726 + _692;
    float _734 = fma(_730, 0.25, _724);
    float _736 = _728 + _694;
    float _738 = _732 + _696;
    float _740 = _736 * 0.25;
    float _742 = _738 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _744 = _742 * 0.25;
    float _746 = fma(_740, (*spvDescriptorSet0.fp_c3)._m0[49].z, _744);
    float _748 = _708 + _746;
    out.m_47.x = _698;
    out.m_47.y = _734;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _748;
    return out;
}

