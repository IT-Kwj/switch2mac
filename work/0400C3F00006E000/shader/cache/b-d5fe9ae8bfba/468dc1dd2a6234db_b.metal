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
    float2 _796 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_796, float2(0.0), isnan(_796)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _813 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_813, float2(0.0), isnan(_813))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_813, float2(0.0), isnan(_813))).x;
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
    float _140 = fma(_130, _130, _136);
    float _142 = fma(_134, _134, _138);
    float _144 = rsqrt(_140);
    float _146 = rsqrt(_142);
    float _148 = _118 * _144;
    float _150 = _130 * _144;
    float _152 = _110 * _144;
    float _154 = _106 * _70;
    float _156 = _134 * _146;
    float _158 = _114 * _146;
    float _160 = _122 * _146;
    float _162 = _148 * _156;
    float _164 = _150 * _158;
    float _166 = -_162;
    float _168 = fma(_150, _160, _166);
    float _170 = _152 * _160;
    float _172 = -_164;
    float _174 = fma(_152, _156, _172);
    float _176 = _168 * _168;
    float _178 = -_170;
    float _180 = fma(_148, _158, _178);
    float _182 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _184 = fma(_174, _174, _176);
    float _186 = fma(_180, _180, _184);
    float _188 = rsqrt(_186);
    float _190 = _168 * _188;
    float _192 = _174 * _188;
    float _194 = _180 * _188;
    float _196 = _106 * _68;
    float _198 = _190 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _200 = fma(_192, (*spvDescriptorSet0.fp_c3)._m0[35].x, _198);
    float _202 = fma(_194, (*spvDescriptorSet0.fp_c3)._m0[35].z, _200);
    float _204 = abs(_202);
    float _206 = -_204;
    float _208 = _206 + 1.0;
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = abs(_210);
    float _214 = log2(_212);
    float _216 = _214 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _218 = exp2(_216);
    float _220 = _218 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _222 = fma(_190, _220, _196);
    float _224 = fma(_192, _220, _154);
    float _226 = fma(_194, _220, _106);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _232 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _230);
    float _236 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _232);
    float _238 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _234);
    float _240 = _236 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _242 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _244 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _246 = _238 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _248 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _242);
    float _250 = 1.0 / _240;
    float _252 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _244);
    float _254 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _248);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _258 = _254 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _260 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _262 = _246 * _250;
    float _264 = _258 * _250;
    float _266 = _260 * _250;
    float _268 = precise::clamp(_266, 0.0, 1.0);
    float _270 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _272 = fma(_268, _182, _262);
    float _274 = fma(_268, _270, _264);
    float _276 = -_182;
    float _278 = fma(_268, _276, _262);
    float3 _1180 = float3(_272, _274, float(0));
    float3 _1184 = select(_1180, float3(0.0), isnan(_1180));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1184.xy, uint(rint(_1184.z)), _268);
    float3 _1191 = float3(_262, _274, float(0));
    float3 _1193 = select(_1191, float3(0.0), isnan(_1191));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1193.xy, uint(rint(_1193.z)), _268);
    float3 _1200 = float3(_278, _274, float(0));
    float3 _1202 = select(_1200, float3(0.0), isnan(_1200));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1202.xy, uint(rint(_1202.z)), _268);
    float _286 = -_196;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _290 = -_154;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _294 = -_196;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _298 = _196 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _300 = _288 * _288;
    float _302 = _196 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _304 = _296 * _296;
    float _306 = fma(_292, _292, _300);
    float _308 = -_106;
    float _310 = _308 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _312 = _196 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _314 = _196 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _316 = _196 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _318 = fma(_310, _310, _306);
    float _320 = -_154;
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _324 = -_106;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _328 = _196 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _330 = _196 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _332 = fma(_322, _322, _304);
    float _334 = sqrt(_318);
    float _336 = _196 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _338 = _196 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _340 = fma(_326, _326, _332);
    float _342 = _196 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _344 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[31].x, _336);
    float _346 = _196 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _348 = _196 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _350 = _196 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _352 = sqrt(_340);
    float _354 = _196 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _356 = _196 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _358 = _196 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _360 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[22].x, _302);
    float _362 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[20].x, _312);
    float _364 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[23].x, _314);
    bool _368 = _334 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _370 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[21].x, _316);
    bool _372 = _334 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _374 = _196 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _376 = !_368;
    int _379 = _376 ? 0 : 1;
    float _381 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[24].x, _328);
    float _383 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[16].x, _330);
    float _385 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[19].x, _374);
    float _387 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[17].x, _338);
    bool _389 = _352 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _391 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[18].x, _342);
    float _393 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[25].x, _346);
    float _395 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[28].x, _348);
    int _397 = 2;
    if (!_368)
    {
        _397 = 1;
    }
    int _399 = _397;
    float _401 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[29].x, _350);
    bool _403 = _352 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _405 = _196 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    int _407 = _399;
    if (!_372)
    {
        _407 = _379;
    }
    int _409 = _407;
    float _411 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[27].x, _298);
    float _413 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[26].x, _405);
    float _415 = float(_409);
    float _417 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[30].x, _354);
    int _419 = 2;
    if (!_389)
    {
        _419 = 1;
    }
    int _421 = _419;
    float _423 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[32].x, _356);
    float _425 = precise::min(_415, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _427 = fma(_154, (*spvDescriptorSet0.fp_c3)._m0[33].x, _358);
    bool _429 = !_389;
    int _431 = _429 ? 0 : 1;
    float _433 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].z, _360);
    bool _435 = _425 != 1.0;
    bool _437 = isnan(_425);
    bool _439 = _435 || _437;
    bool _441 = isnan(1.0);
    bool _443 = _439 || _441;
    float _445 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _383);
    int _447 = _421;
    if (!_403)
    {
        _447 = _431;
    }
    int _449 = _447;
    float _451 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].z, _385);
    bool _453 = _425 != 0.0;
    bool _455 = isnan(_425);
    bool _457 = _453 || _455;
    bool _459 = isnan(0.0);
    bool _461 = _457 || _459;
    float _463 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].z, _417);
    float _465 = float(_449);
    float _467 = _451 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _469 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].z, _362);
    float _471 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].z, _427);
    float _473 = precise::min(_465, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _475 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].z, _401);
    float _477 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].z, _364);
    float _479 = _467;
    if (_443)
    {
        float _481 = _433 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _479 = _481;
    }
    float _483 = _479;
    bool _485 = _473 != 1.0;
    bool _487 = isnan(_473);
    bool _489 = _485 || _487;
    bool _491 = isnan(1.0);
    bool _493 = _489 || _491;
    float _495 = _469 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _497 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _387);
    float _499 = _483;
    float _501 = _495;
    if (!_461)
    {
        float _503 = _445 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _499 = _503;
    }
    float _505 = _499;
    float _507 = _463 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _509 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].z, _344);
    float _511 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].z, _370);
    float _513 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].z, _395);
    float _515 = _475 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _517 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].z, _381);
    float _519 = _507;
    float _521 = _515;
    if (_493)
    {
        float _523 = _471 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _519 = _523;
    }
    float _525 = _519;
    float _527 = _525;
    if (_443)
    {
        float _529 = _477 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _501 = _529;
    }
    float _531 = _501;
    float _533 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].z, _391);
    float _535 = _531;
    if (!_461)
    {
        float _537 = _497 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _535 = _537;
    }
    float _539 = _535;
    float _541 = _511 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _543 = _513 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _545 = _541;
    float _547 = _543;
    if (_443)
    {
        float _549 = _517 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _545 = _549;
    }
    float _551 = _545;
    float _553 = _551;
    if (!_461)
    {
        float _555 = _533 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _553 = _555;
    }
    float _557 = _553;
    float _559 = -_270;
    float _561 = fma(_268, _559, _264);
    if (_493)
    {
        float _563 = _509 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _547 = _563;
    }
    float _565 = _547;
    float _567 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].z, _423);
    float _569 = _565;
    if (_493)
    {
        float _571 = _567 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _521 = _571;
    }
    float _573 = _521;
    bool _575 = _473 != 0.0;
    bool _577 = isnan(_473);
    bool _579 = _575 || _577;
    bool _581 = isnan(0.0);
    bool _583 = _579 || _581;
    float _585 = _280 + _282;
    float _587 = _585 + _284;
    float3 _1765 = float3(_272, _264, float(0));
    float3 _1767 = select(_1765, float3(0.0), isnan(_1765));
    float _589 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1767.xy, uint(rint(_1767.z)), _268);
    float3 _1774 = float3(_262, _264, float(0));
    float3 _1776 = select(_1774, float3(0.0), isnan(_1774));
    float _591 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1776.xy, uint(rint(_1776.z)), _268);
    float3 _1783 = float3(_278, _264, float(0));
    float3 _1785 = select(_1783, float3(0.0), isnan(_1783));
    float _593 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1785.xy, uint(rint(_1785.z)), _268);
    float3 _1792 = float3(_272, _561, float(0));
    float3 _1794 = select(_1792, float3(0.0), isnan(_1792));
    float _595 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1794.xy, uint(rint(_1794.z)), _268);
    float3 _1801 = float3(_262, _561, float(0));
    float3 _1803 = select(_1801, float3(0.0), isnan(_1801));
    float _597 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1803.xy, uint(rint(_1803.z)), _268);
    float3 _1810 = float3(_278, _561, float(0));
    float3 _1812 = select(_1810, float3(0.0), isnan(_1810));
    float _599 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1812.xy, uint(rint(_1812.z)), _268);
    float _601 = rint(_425);
    float _603 = precise::max(_601, 0.0);
    uint _606 = uint(_603);
    uint _608 = clamp(_606, 0u, 65535u);
    float _610 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _612 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].z, _411);
    float _614 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _616 = 0.0 + _557;
    float _618 = precise::clamp(_616, 0.0, 1.0);
    float _620 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].z, _413);
    float _622 = _573;
    if (!_583)
    {
        float _624 = _612 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _527 = _624;
    }
    float _626 = _527;
    float _628 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].z, _393);
    float _630 = rint(_473);
    float _632 = precise::max(_630, 0.0);
    uint _634 = uint(_632);
    uint _636 = clamp(_634, 0u, 65535u);
    float _638 = fma(_618, _610, _505);
    if (!_583)
    {
        float _640 = _620 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _622 = _640;
    }
    float _642 = _622;
    if (!_583)
    {
        float _644 = _628 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _569 = _644;
    }
    float _646 = _569;
    float _648 = _587 + _589;
    float _650 = -_610;
    float _652 = fma(_618, _650, _505);
    float _654 = _648 + _591;
    float _656 = _654 + _593;
    float _658 = _656 + _595;
    float _660 = fma(_618, _614, _539);
    float3 _1925 = float3(_505, _660, float(int(_608)));
    float3 _1927 = select(_1925, float3(0.0), isnan(_1925));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1927.xy, uint(rint(_1927.z)), _618);
    float3 _1936 = float3(_638, _660, float(int(_608)));
    float3 _1938 = select(_1936, float3(0.0), isnan(_1936));
    float _664 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1938.xy, uint(rint(_1938.z)), _618);
    float3 _1947 = float3(_652, _660, float(int(_608)));
    float3 _1949 = select(_1947, float3(0.0), isnan(_1947));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1949.xy, uint(rint(_1949.z)), _618);
    float3 _1958 = float3(_638, _539, float(int(_608)));
    float3 _1960 = select(_1958, float3(0.0), isnan(_1958));
    float _668 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1960.xy, uint(rint(_1960.z)), _618);
    float3 _1969 = float3(_505, _539, float(int(_608)));
    float3 _1971 = select(_1969, float3(0.0), isnan(_1969));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1971.xy, uint(rint(_1971.z)), _618);
    float3 _1980 = float3(_652, _539, float(int(_608)));
    float3 _1982 = select(_1980, float3(0.0), isnan(_1980));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1982.xy, uint(rint(_1982.z)), _618);
    float _674 = -_614;
    float _676 = fma(_618, _674, _539);
    float _678 = 0.0 + _626;
    float _680 = precise::clamp(_678, 0.0, 1.0);
    float _682 = fma(_614, _680, _642);
    float _684 = fma(_610, _680, _646);
    float3 _2009 = float3(_638, _676, float(int(_608)));
    float3 _2011 = select(_2009, float3(0.0), isnan(_2009));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2011.xy, uint(rint(_2011.z)), _618);
    float _688 = -_610;
    float _690 = fma(_688, _680, _646);
    float3 _2026 = float3(_505, _676, float(int(_608)));
    float3 _2028 = select(_2026, float3(0.0), isnan(_2026));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2028.xy, uint(rint(_2028.z)), _618);
    float3 _2037 = float3(_652, _676, float(int(_608)));
    float3 _2039 = select(_2037, float3(0.0), isnan(_2037));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2039.xy, uint(rint(_2039.z)), _618);
    float3 _2048 = float3(_646, _682, float(int(_636)));
    float3 _2050 = select(_2048, float3(0.0), isnan(_2048));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2050.xy, uint(rint(_2050.z)), _680);
    float3 _2059 = float3(_684, _682, float(int(_636)));
    float3 _2061 = select(_2059, float3(0.0), isnan(_2059));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2061.xy, uint(rint(_2061.z)), _680);
    float3 _2070 = float3(_690, _682, float(int(_636)));
    float3 _2072 = select(_2070, float3(0.0), isnan(_2070));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2072.xy, uint(rint(_2072.z)), _680);
    float _702 = -_614;
    float _704 = fma(_702, _680, _642);
    float3 _2087 = float3(_684, _642, float(int(_636)));
    float3 _2089 = select(_2087, float3(0.0), isnan(_2087));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2089.xy, uint(rint(_2089.z)), _680);
    float3 _2098 = float3(_646, _642, float(int(_636)));
    float3 _2100 = select(_2098, float3(0.0), isnan(_2098));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2100.xy, uint(rint(_2100.z)), _680);
    float3 _2109 = float3(_690, _642, float(int(_636)));
    float3 _2111 = select(_2109, float3(0.0), isnan(_2109));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2111.xy, uint(rint(_2111.z)), _680);
    float3 _2120 = float3(_684, _704, float(int(_636)));
    float3 _2122 = select(_2120, float3(0.0), isnan(_2120));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2122.xy, uint(rint(_2122.z)), _680);
    float3 _2131 = float3(_646, _704, float(int(_636)));
    float3 _2133 = select(_2131, float3(0.0), isnan(_2131));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2133.xy, uint(rint(_2133.z)), _680);
    float3 _2142 = float3(_690, _704, float(int(_636)));
    float3 _2144 = select(_2142, float3(0.0), isnan(_2142));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2144.xy, uint(rint(_2144.z)), _680);
    float _718 = _658 + _597;
    float _720 = _718 + _599;
    float _722 = -_106;
    float _724 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _726 = _722 + _724;
    float _728 = _726 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _730 = precise::clamp(_728, 0.0, 1.0);
    float _732 = fma(_720, 0.111111111938953399658203125, _730);
    float _734 = _664 + _662;
    float _736 = -_106;
    float _738 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _740 = _736 + _738;
    float _742 = _734 + _666;
    float _744 = _740 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = _742 + _668;
    float _750 = _748 + _670;
    float _752 = _750 + _672;
    float _754 = _752 + _686;
    float _756 = _754 + _692;
    float _758 = _698 + _696;
    float _760 = _756 + _694;
    float _762 = _758 + _700;
    float _764 = _760 * 0.111111111938953399658203125;
    float _766 = _762 + _706;
    float _768 = _766 + _708;
    float _770 = _768 + _710;
    float _772 = _770 + _712;
    float _774 = _772 + _714;
    float _776 = _774 + _716;
    float _778 = _776 * 0.111111111938953399658203125;
    float _780 = _778 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _782 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[49].z, _780);
    float _784 = _746 + _782;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _732;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _784;
    return out;
}

