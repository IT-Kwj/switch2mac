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
    float2 _740 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_740, float2(0.0), isnan(_740))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_740, float2(0.0), isnan(_740))).x;
    float2 _751 = float2(_52, _54);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_751, float2(0.0), isnan(_751)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_56;
    float _82 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _84 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].z, _82);
    float _86 = _84 * _68;
    float _88 = _84 * _70;
    float _90 = -_86;
    float _92 = _90 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _94 = -_88;
    float _96 = _94 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _98 = -_86;
    float _100 = _98 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _102 = -_88;
    float _104 = _102 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _106 = _92 * _92;
    float _108 = -_62;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = fma(_108, (*spvDescriptorSet0.fp_c3)._m0[46].z, _110);
    float _114 = _100 * _100;
    float _116 = -_64;
    float _118 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _120 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[46].z, _118);
    float _122 = fma(_96, _96, _106);
    float _124 = -_84;
    float _126 = _124 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _128 = fma(_104, _104, _114);
    float _130 = _68 * _112;
    float _132 = -_84;
    float _134 = _132 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _136 = fma(_126, _126, _122);
    float _138 = -_66;
    float _140 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _142 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[46].z, _140);
    float _144 = _70 * _112;
    float _146 = -_130;
    float _148 = fma(_120, _72, _146);
    float _150 = fma(_134, _134, _128);
    float _152 = -_130;
    float _154 = fma(_142, _74, _152);
    float _156 = sqrt(_136);
    float _158 = -_144;
    float _160 = fma(_120, _76, _158);
    float _162 = _148 * _148;
    float _164 = -_144;
    float _166 = fma(_142, _78, _164);
    float _168 = _154 * _154;
    float _170 = -_112;
    float _172 = _170 + _120;
    float _174 = fma(_160, _160, _162);
    float _176 = -_112;
    float _178 = _176 + _142;
    float _180 = fma(_166, _166, _168);
    float _182 = sqrt(_150);
    float _184 = fma(_172, _172, _174);
    float _186 = fma(_178, _178, _180);
    float _188 = _86 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    bool _192 = _156 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _194 = rsqrt(_184);
    bool _196 = _156 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _198 = _86 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    bool _200 = !_192;
    int _203 = _200 ? 0 : 1;
    float _205 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[27].x, _188);
    float _207 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[23].x, _198);
    float _209 = rsqrt(_186);
    bool _211 = _182 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _213 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[23].z, _207);
    float _215 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[27].z, _205);
    int _217 = 2;
    if (!_192)
    {
        _217 = 1;
    }
    int _219 = _217;
    bool _221 = _182 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _223 = _160 * _194;
    bool _225 = !_211;
    int _227 = _225 ? 0 : 1;
    float _229 = _148 * _194;
    int _231 = _219;
    if (!_196)
    {
        _231 = _203;
    }
    int _233 = _231;
    float _235 = _172 * _194;
    int _237 = 2;
    if (!_211)
    {
        _237 = 1;
    }
    int _239 = _237;
    float _241 = _178 * _209;
    float _243 = _154 * _209;
    float _245 = _166 * _209;
    int _247 = _239;
    if (!_221)
    {
        _247 = _227;
    }
    int _249 = _247;
    float _251 = _223 * _241;
    float _253 = _235 * _243;
    float _255 = _229 * _245;
    float _257 = -_251;
    float _259 = fma(_235, _245, _257);
    float _261 = _86 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _263 = -_253;
    float _265 = fma(_229, _241, _263);
    float _267 = -_255;
    float _269 = fma(_223, _243, _267);
    float _271 = _259 * _259;
    float _273 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[19].x, _261);
    float _275 = float(_233);
    float _277 = _86 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _279 = fma(_265, _265, _271);
    float _281 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[19].z, _273);
    float _283 = precise::min(_275, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _285 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[20].x, _277);
    float _287 = _86 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _289 = _281 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _291 = fma(_269, _269, _279);
    bool _293 = _283 != 1.0;
    bool _295 = isnan(_283);
    bool _297 = _293 || _295;
    bool _299 = isnan(1.0);
    bool _301 = _297 || _299;
    float _303 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[20].z, _285);
    float _305 = float(_249);
    float _307 = rsqrt(_291);
    float _309 = _86 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _311 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[22].x, _287);
    float _313 = _303 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _315 = _86 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _317 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[21].x, _309);
    float _319 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[22].z, _311);
    float _321 = precise::min(_305, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _323 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[24].x, _315);
    float _325 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[21].z, _317);
    float _327 = _289;
    float _329 = _313;
    if (_301)
    {
        float _331 = _319 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _327 = _331;
    }
    float _333 = _327;
    float _335 = _333;
    if (_301)
    {
        float _337 = _213 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _329 = _337;
    }
    float _339 = _329;
    float _341 = _86 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _343 = _325 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    bool _345 = _321 != 1.0;
    bool _347 = isnan(_321);
    bool _349 = _345 || _347;
    bool _351 = isnan(1.0);
    bool _353 = _349 || _351;
    float _355 = _86 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _357 = _259 * _307;
    float _359 = _265 * _307;
    float _361 = _269 * _307;
    float _363 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[24].z, _323);
    float _365 = _357 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _367 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[28].x, _341);
    float _369 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[31].x, _355);
    float _371 = _343;
    float _373 = _339;
    if (_301)
    {
        float _375 = _363 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _371 = _375;
    }
    float _377 = _371;
    float _379 = fma(_359, (*spvDescriptorSet0.fp_c3)._m0[35].x, _365);
    float _381 = _86 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    bool _383 = _283 != 0.0;
    bool _385 = isnan(_283);
    bool _387 = _383 || _385;
    bool _389 = isnan(0.0);
    bool _391 = _387 || _389;
    float _393 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[28].z, _367);
    float _395 = fma(_361, (*spvDescriptorSet0.fp_c3)._m0[35].z, _379);
    float _397 = _86 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _399 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[31].z, _369);
    float _401 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[29].x, _381);
    float _403 = abs(_395);
    float _405 = -_403;
    float _407 = _405 + 1.0;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    float _411 = _393 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _413 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[16].x, _397);
    float _415 = _411;
    float _417 = _377;
    if (_353)
    {
        float _419 = _399 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _415 = _419;
    }
    float _421 = _415;
    float _423 = _86 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _425 = _86 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _427 = abs(_409);
    float _429 = log2(_427);
    float _431 = _86 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _433 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[29].z, _401);
    float _435 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[16].z, _413);
    float _437 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[30].x, _423);
    float _439 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[32].x, _425);
    float _441 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[33].x, _431);
    float _443 = _433 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _445 = _86 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _447 = _443;
    float _449 = _421;
    if (!_391)
    {
        float _451 = _435 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _335 = _451;
    }
    float _453 = _335;
    float _455 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[30].z, _437);
    float _457 = _86 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _459 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[32].z, _439);
    float _461 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[33].z, _441);
    float _463 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[17].x, _445);
    float _465 = _455 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _467 = _429 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _469 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[18].x, _457);
    float _471 = _465;
    if (_353)
    {
        float _473 = _459 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _447 = _473;
    }
    float _475 = _447;
    float _477 = _475;
    if (_353)
    {
        float _479 = _461 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _471 = _479;
    }
    float _481 = _471;
    bool _483 = _321 != 0.0;
    bool _485 = isnan(_321);
    bool _487 = _483 || _485;
    bool _489 = isnan(0.0);
    bool _491 = _487 || _489;
    float _493 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[17].z, _463);
    float _495 = exp2(_467);
    float _497 = _86 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _499 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[18].z, _469);
    float _501 = _481;
    if (!_391)
    {
        float _503 = _493 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _373 = _503;
    }
    float _505 = _373;
    float _507 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[25].x, _497);
    if (!_391)
    {
        float _509 = _499 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _417 = _509;
    }
    float _511 = _417;
    float _513 = _86 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _515 = rint(_283);
    float _517 = precise::max(_515, 0.0);
    uint _520 = uint(_517);
    uint _522 = clamp(_520, 0u, 65535u);
    float _524 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[25].z, _507);
    float _526 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _528 = 0.0 + _511;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[26].x, _513);
    if (!_491)
    {
        float _534 = _524 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _449 = _534;
    }
    float _536 = _449;
    if (!_491)
    {
        float _538 = _215 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _501 = _538;
    }
    float _540 = _501;
    float _542 = _530 * _526;
    float _544 = _495 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _546 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[26].z, _532);
    float _548 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _550 = fma(_542, 0.5, _453);
    float _552 = fma(_357, _544, _86);
    float _554 = fma(_542, -0.5, _453);
    float _556 = fma(_359, _544, _88);
    float _558 = fma(_361, _544, _84);
    float _560 = _552 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _562 = 0.0 + _540;
    float _564 = precise::clamp(_562, 0.0, 1.0);
    if (!_491)
    {
        float _566 = _546 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _477 = _566;
    }
    float _568 = _477;
    float _570 = _552 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _572 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[3].x, _560);
    float _574 = _530 * _548;
    float _576 = rint(_321);
    float _578 = precise::max(_576, 0.0);
    uint _580 = uint(_578);
    uint _582 = clamp(_580, 0u, 65535u);
    float _584 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[2].x, _570);
    float _586 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[3].z, _572);
    float _588 = fma(_574, 0.5, _505);
    float _590 = fma(_574, -0.5, _505);
    float _592 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[2].z, _584);
    float _594 = _586 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _596 = _552 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _598 = _552 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _600 = _592 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _602 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _604 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[0].x, _596);
    float _606 = 1.0 / _594;
    float _608 = fma(_556, (*spvDescriptorSet0.fp_c3)._m0[1].x, _598);
    float _610 = _526 * _564;
    float _612 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[0].z, _604);
    float _614 = _548 * _564;
    float _616 = fma(_558, (*spvDescriptorSet0.fp_c3)._m0[1].z, _608);
    float _618 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _620 = _612 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _622 = fma(_610, 0.5, _536);
    float _624 = _616 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _626 = fma(_610, -0.5, _536);
    float _628 = fma(_614, 0.5, _568);
    float _630 = fma(_614, -0.5, _568);
    float _632 = _600 * _606;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = _620 * _606;
    float _638 = _624 * _606;
    float _640 = rint(_634);
    float _642 = precise::max(_640, 0.0);
    uint _644 = uint(_642);
    uint _646 = clamp(_644, 0u, 65535u);
    float _648 = fma(_618, -0.5, _636);
    float _650 = fma(_602, 0.5, _638);
    float _652 = fma(_618, 0.5, _636);
    float _654 = fma(_602, -0.5, _638);
    float3 _1796 = float3(_648, _650, float(int(_646)));
    float3 _1800 = select(_1796, float3(0.0), isnan(_1796));
    float _656 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1800.xy, uint(rint(_1800.z)), 1.0);
    float3 _1808 = float3(_652, _650, float(int(_646)));
    float3 _1810 = select(_1808, float3(0.0), isnan(_1808));
    float _658 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1810.xy, uint(rint(_1810.z)), 1.0);
    float3 _1818 = float3(_652, _654, float(int(_646)));
    float3 _1820 = select(_1818, float3(0.0), isnan(_1818));
    float _660 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1820.xy, uint(rint(_1820.z)), 1.0);
    float3 _1828 = float3(_648, _654, float(int(_646)));
    float3 _1830 = select(_1828, float3(0.0), isnan(_1828));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1830.xy, uint(rint(_1830.z)), 1.0);
    float3 _1838 = float3(_554, _588, float(int(_522)));
    float3 _1840 = select(_1838, float3(0.0), isnan(_1838));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1840.xy, uint(rint(_1840.z)), _530);
    float3 _1849 = float3(_550, _588, float(int(_522)));
    float3 _1851 = select(_1849, float3(0.0), isnan(_1849));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1851.xy, uint(rint(_1851.z)), _530);
    float3 _1860 = float3(_626, _628, float(int(_582)));
    float3 _1862 = select(_1860, float3(0.0), isnan(_1860));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1862.xy, uint(rint(_1862.z)), _564);
    float3 _1871 = float3(_622, _628, float(int(_582)));
    float3 _1873 = select(_1871, float3(0.0), isnan(_1871));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1873.xy, uint(rint(_1873.z)), _564);
    float3 _1882 = float3(_550, _590, float(int(_522)));
    float3 _1884 = select(_1882, float3(0.0), isnan(_1882));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1884.xy, uint(rint(_1884.z)), _530);
    float3 _1893 = float3(_622, _630, float(int(_582)));
    float3 _1895 = select(_1893, float3(0.0), isnan(_1893));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1895.xy, uint(rint(_1895.z)), _564);
    float3 _1904 = float3(_554, _590, float(int(_522)));
    float3 _1906 = select(_1904, float3(0.0), isnan(_1904));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1906.xy, uint(rint(_1906.z)), _530);
    float3 _1915 = float3(_626, _630, float(int(_582)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1917.xy, uint(rint(_1917.z)), _564);
    float _680 = -_84;
    float _682 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _684 = _680 + _682;
    float _686 = _684 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _688 = precise::clamp(_686, 0.0, 1.0);
    float _690 = _658 + _656;
    float _692 = -_84;
    float _694 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _696 = _692 + _694;
    float _698 = _666 + _664;
    float _700 = _690 + _660;
    float _702 = _670 + _668;
    float _704 = _696 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _706 = precise::clamp(_704, 0.0, 1.0);
    float _708 = _698 + _672;
    float _710 = _700 + _662;
    float _712 = _702 + _674;
    float _714 = fma(_710, 0.25, _706);
    float _716 = _708 + _676;
    float _718 = _712 + _678;
    float _720 = _716 * 0.25;
    float _722 = _718 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _724 = _722 * 0.25;
    float _726 = fma(_720, (*spvDescriptorSet0.fp_c3)._m0[49].z, _724);
    float _728 = _688 + _726;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _714;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _728;
    return out;
}

