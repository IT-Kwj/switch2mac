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
    texture2d_array<float> fp_t_tcb_E [[id(3)]];
    sampler fp_t_tcb_ESmplr [[id(4)]];
    texture2d_array<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d_array<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
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
    float2 _660 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_660, float2(0.0), isnan(_660)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _677 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_677, float2(0.0), isnan(_677))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_677, float2(0.0), isnan(_677))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_40.x;
    float _76 = in.m_42.y;
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
    float _98 = -_66;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = _68 * _84;
    float _106 = _70 * _84;
    float _108 = -_84;
    float _110 = _108 + _90;
    float _112 = -_84;
    float _114 = _112 + _96;
    float _116 = -_104;
    float _118 = fma(_90, _72, _116);
    float _120 = -_106;
    float _122 = fma(_90, _74, _120);
    float _124 = -_104;
    float _126 = fma(_96, _76, _124);
    float _128 = -_106;
    float _130 = fma(_96, _78, _128);
    float _132 = _118 * _118;
    float _134 = _102 * _68;
    float _136 = _126 * _126;
    float _138 = _102 * _70;
    float _140 = fma(_122, _122, _132);
    float _142 = -_134;
    float _144 = _142 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _146 = fma(_130, _130, _136);
    float _148 = -_138;
    float _150 = _148 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _152 = fma(_110, _110, _140);
    float _154 = _144 * _144;
    float _156 = fma(_114, _114, _146);
    float _158 = -_134;
    float _160 = _158 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _162 = -_138;
    float _164 = _162 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _166 = fma(_150, _150, _154);
    float _168 = rsqrt(_152);
    float _170 = -_102;
    float _172 = _170 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _174 = _160 * _160;
    float _176 = _134 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _178 = _134 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _180 = fma(_172, _172, _166);
    float _182 = fma(_164, _164, _174);
    float _184 = -_102;
    float _186 = _184 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _188 = rsqrt(_156);
    float _190 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[33].x, _176);
    float _192 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[27].x, _178);
    float _194 = fma(_186, _186, _182);
    float _196 = _134 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _198 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[33].z, _190);
    float _200 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[27].z, _192);
    float _202 = _134 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _204 = _122 * _168;
    float _206 = _110 * _168;
    float _208 = _118 * _168;
    float _210 = sqrt(_180);
    float _212 = _134 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _214 = _134 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _216 = _134 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _218 = _134 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _220 = _114 * _188;
    float _222 = _126 * _188;
    float _224 = _130 * _188;
    float _226 = sqrt(_194);
    float _228 = _204 * _220;
    float _230 = _206 * _222;
    float _232 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[30].x, _212);
    float _234 = _134 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _236 = -_228;
    float _238 = fma(_206, _224, _236);
    float _240 = -_230;
    float _242 = fma(_208, _220, _240);
    float _244 = _208 * _224;
    bool _248 = _210 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _250 = _238 * _238;
    bool _252 = _210 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _254 = -_244;
    float _256 = fma(_204, _222, _254);
    bool _258 = !_248;
    int _261 = _258 ? 0 : 1;
    float _263 = fma(_242, _242, _250);
    float _265 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[30].z, _232);
    bool _267 = _226 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _269 = fma(_256, _256, _263);
    bool _271 = _226 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _273 = _134 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    bool _275 = !_267;
    int _277 = _275 ? 0 : 1;
    float _279 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[22].x, _202);
    int _281 = 2;
    if (!_248)
    {
        _281 = 1;
    }
    int _283 = _281;
    float _285 = rsqrt(_269);
    float _287 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[23].x, _214);
    int _289 = _283;
    int _291 = 2;
    if (!_252)
    {
        _289 = _261;
    }
    int _293 = _289;
    float _295 = _134 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _297 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[28].x, _218);
    if (!_267)
    {
        _291 = 1;
    }
    int _299 = _291;
    float _301 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[32].x, _273);
    int _303 = _299;
    if (!_271)
    {
        _303 = _277;
    }
    int _305 = _303;
    float _307 = _134 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _309 = float(_293);
    float _311 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[18].x, _295);
    float _313 = float(_305);
    float _315 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[21].x, _307);
    float _317 = precise::min(_309, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _319 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[18].z, _311);
    float _321 = _238 * _285;
    float _323 = _242 * _285;
    float _325 = _256 * _285;
    float _327 = precise::min(_313, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _329 = _321 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    bool _331 = _317 != 1.0;
    bool _333 = isnan(_317);
    bool _335 = _331 || _333;
    bool _337 = isnan(1.0);
    bool _339 = _335 || _337;
    float _341 = _134 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _343 = _317 != 0.0;
    bool _345 = isnan(_317);
    bool _347 = _343 || _345;
    bool _349 = isnan(0.0);
    bool _351 = _347 || _349;
    float _353 = fma(_323, (*spvDescriptorSet0.fp_c3)._m0[35].x, _329);
    bool _355 = _327 != 1.0;
    bool _357 = isnan(_327);
    bool _359 = _355 || _357;
    bool _361 = isnan(1.0);
    bool _363 = _359 || _361;
    float _365 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[24].x, _341);
    bool _367 = _327 != 0.0;
    bool _369 = isnan(_327);
    bool _371 = _367 || _369;
    bool _373 = isnan(0.0);
    bool _375 = _371 || _373;
    float _377 = fma(_325, (*spvDescriptorSet0.fp_c3)._m0[35].z, _353);
    float _379 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[21].z, _315);
    float _381 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[24].z, _365);
    float _383 = _265 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _385 = abs(_377);
    float _387 = -_385;
    float _389 = _387 + 1.0;
    float _391 = precise::clamp(_389, 0.0, 1.0);
    float _393 = _379 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _395 = _393;
    float _397 = _383;
    if (_339)
    {
        float _399 = _381 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _395 = _399;
    }
    float _401 = _395;
    float _403 = _134 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _405 = _401;
    if (!_351)
    {
        float _407 = _319 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _405 = _407;
    }
    float _409 = _405;
    float _411 = _134 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _413 = abs(_391);
    float _415 = log2(_413);
    if (_363)
    {
        float _417 = _198 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _397 = _417;
    }
    float _419 = _397;
    float _421 = _419;
    if (!_375)
    {
        float _423 = _200 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _421 = _423;
    }
    float _425 = _421;
    float _427 = _134 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _429 = _134 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _431 = _134 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _433 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[19].x, _411);
    float _435 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[26].x, _196);
    float _437 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[20].x, _427);
    float _439 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[31].x, _403);
    float _441 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[25].x, _216);
    float _443 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[16].x, _429);
    float _445 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[17].x, _431);
    float _447 = fma(_138, (*spvDescriptorSet0.fp_c3)._m0[29].x, _234);
    float _449 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[20].z, _437);
    float _451 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[23].z, _287);
    float _453 = _415 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _455 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[17].z, _445);
    float _457 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[22].z, _279);
    float _459 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[16].z, _443);
    float _461 = rint(_327);
    float _463 = precise::max(_461, 0.0);
    uint _466 = uint(_463);
    uint _468 = clamp(_466, 0u, 65535u);
    float _470 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[29].z, _447);
    float _472 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[32].z, _301);
    float _474 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[28].z, _297);
    float _476 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[31].z, _439);
    float _478 = 0.0 + _425;
    float _480 = precise::clamp(_478, 0.0, 1.0);
    float _482 = 0.0 + _409;
    float _484 = precise::clamp(_482, 0.0, 1.0);
    float _486 = exp2(_453);
    float _488 = rint(_317);
    float _490 = precise::max(_488, 0.0);
    uint _492 = uint(_490);
    uint _494 = clamp(_492, 0u, 65535u);
    float _496 = _486 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _498 = fma(_321, _496, _134);
    float _500 = fma(_323, _496, _138);
    float _502 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[19].z, _433);
    float _504 = fma(_325, _496, _102);
    float _506 = _498 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _508 = _449 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _510 = _508;
    if (_339)
    {
        float _512 = _451 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _510 = _512;
    }
    float _514 = _510;
    float _516 = _514;
    if (!_351)
    {
        float _518 = _455 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _516 = _518;
    }
    float _520 = _516;
    float _522 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[3].x, _506);
    float _524 = _498 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _526 = _502 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _528 = _526;
    if (_339)
    {
        float _530 = _457 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _528 = _530;
    }
    float _532 = _528;
    float _534 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[3].z, _522);
    float _536 = _532;
    if (!_351)
    {
        float _538 = _459 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _536 = _538;
    }
    float _540 = _536;
    float _542 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[2].x, _524);
    float _544 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[25].z, _441);
    float _546 = _534 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _548 = _498 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _550 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[2].z, _542);
    float _552 = _498 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _554 = _470 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _556 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[0].x, _548);
    float _558 = 1.0 / _546;
    float _560 = fma(_102, (*spvDescriptorSet0.fp_c3)._m0[26].z, _435);
    float _562 = _550 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _564 = fma(_500, (*spvDescriptorSet0.fp_c3)._m0[1].x, _552);
    float _566 = _554;
    if (_363)
    {
        float _568 = _472 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _566 = _568;
    }
    float _570 = _566;
    float _572 = _474 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _574 = _570;
    float _576 = _572;
    if (!_375)
    {
        float _578 = _560 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _574 = _578;
    }
    float _580 = _574;
    if (_363)
    {
        float _582 = _476 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _576 = _582;
    }
    float _584 = _576;
    float _586 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[1].z, _564);
    float _588 = _584;
    if (!_375)
    {
        float _590 = _544 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _588 = _590;
    }
    float _592 = _588;
    float _594 = fma(_504, (*spvDescriptorSet0.fp_c3)._m0[0].z, _556);
    float _596 = _586 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _598 = _562 * _558;
    float _600 = precise::clamp(_598, 0.0, 1.0);
    float3 _1626 = float3(_592, _580, float(int(_468)));
    float3 _1630 = select(_1626, float3(0.0), isnan(_1626));
    float _602 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1630.xy, uint(rint(_1630.z)), _480);
    float3 _1639 = float3(_540, _520, float(int(_494)));
    float3 _1641 = select(_1639, float3(0.0), isnan(_1639));
    float _604 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1641.xy, uint(rint(_1641.z)), _484);
    float _606 = _594 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _608 = _596 * _558;
    float _610 = rint(_600);
    float _612 = precise::max(_610, 0.0);
    uint _614 = uint(_612);
    uint _616 = clamp(_614, 0u, 65535u);
    float _618 = _606 * _558;
    float3 _1668 = float3(_618, _608, float(int(_616)));
    float3 _1670 = select(_1668, float3(0.0), isnan(_1668));
    float _620 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1670.xy, uint(rint(_1670.z)), 1.0);
    float _622 = -_102;
    float _624 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _626 = _622 + _624;
    float _628 = -_102;
    float _630 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _632 = _628 + _630;
    float _634 = _626 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _636 = precise::clamp(_634, 0.0, 1.0);
    float _638 = _632 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _640 = precise::clamp(_638, 0.0, 1.0);
    float _642 = _602 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _644 = fma(_604, (*spvDescriptorSet0.fp_c3)._m0[49].z, _642);
    float _646 = _636 + _644;
    float _648 = _640 + _620;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _648;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _646;
    return out;
}

