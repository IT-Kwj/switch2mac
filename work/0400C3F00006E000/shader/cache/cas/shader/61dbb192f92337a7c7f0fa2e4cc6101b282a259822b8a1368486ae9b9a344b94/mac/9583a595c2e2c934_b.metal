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
    float2 _812 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_812, float2(0.0), isnan(_812)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _829 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_829, float2(0.0), isnan(_829))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_829, float2(0.0), isnan(_829))).x;
    float _68 = in.m_38.y;
    float _70 = in.m_38.x;
    float _72 = in.m_40.y;
    float _74 = in.m_42.y;
    float _76 = in.m_40.x;
    float _78 = in.m_42.x;
    float _80 = -_60;
    float _82 = fma(_80, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_62;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = 1.0 / _82;
    float _94 = 1.0 / _90;
    float _96 = -_66;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _100 = 1.0 / _86;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _92 * _102;
    float _106 = _68 * _104;
    float _108 = _70 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _94 * _110;
    float _114 = 1.0 / _98;
    float _116 = -_106;
    float _118 = fma(_112, _72, _116);
    float _120 = -_108;
    float _122 = fma(_112, _76, _120);
    float _124 = -_104;
    float _126 = _124 + _112;
    float _128 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _130 = _100 * _128;
    float _132 = _118 * _118;
    float _134 = -_106;
    float _136 = fma(_130, _74, _134);
    float _138 = -_108;
    float _140 = fma(_130, _78, _138);
    float _142 = fma(_122, _122, _132);
    float _144 = -_104;
    float _146 = _144 + _130;
    float _148 = _136 * _136;
    float _150 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _152 = _114 * _150;
    float _154 = fma(_126, _126, _142);
    float _156 = fma(_140, _140, _148);
    float _158 = fma(_146, _146, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = _122 * _160;
    float _166 = _126 * _160;
    float _168 = _118 * _160;
    float _170 = _146 * _162;
    float _172 = _136 * _162;
    float _174 = _140 * _162;
    float _176 = _164 * _170;
    float _178 = _166 * _172;
    float _180 = -_176;
    float _182 = fma(_166, _174, _180);
    float _184 = -_178;
    float _186 = fma(_168, _170, _184);
    float _188 = _168 * _174;
    float _190 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _192 = _182 * _182;
    float _194 = -_188;
    float _196 = fma(_164, _172, _194);
    float _198 = _152 * _70;
    float _200 = fma(_186, _186, _192);
    float _202 = fma(_196, _196, _200);
    float _204 = rsqrt(_202);
    float _206 = _182 * _204;
    float _208 = _186 * _204;
    float _210 = _196 * _204;
    float _212 = _152 * _68;
    float _214 = _206 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = abs(_226);
    float _230 = log2(_228);
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = exp2(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = fma(_206, _236, _212);
    float _240 = fma(_208, _236, _198);
    float _242 = fma(_210, _236, _152);
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _248 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _244);
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _246);
    float _252 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].z, _248);
    float _254 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _250);
    float _256 = _252 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _258 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _260 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _262 = _254 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _264 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _258);
    float _266 = 1.0 / _256;
    float _268 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _260);
    float _270 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].z, _264);
    float _272 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].z, _268);
    float _274 = _270 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _276 = _272 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _278 = _262 * _266;
    float _280 = _274 * _266;
    float _282 = _276 * _266;
    float _284 = precise::clamp(_282, 0.0, 1.0);
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _288 = fma(_284, _190, _278);
    float _290 = fma(_284, _286, _280);
    float _292 = -_190;
    float _294 = fma(_284, _292, _278);
    float3 _1212 = float3(_288, _290, float(0));
    float3 _1216 = select(_1212, float3(0.0), isnan(_1212));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1216.xy, uint(rint(_1216.z)), _284);
    float3 _1223 = float3(_278, _290, float(0));
    float3 _1225 = select(_1223, float3(0.0), isnan(_1223));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1225.xy, uint(rint(_1225.z)), _284);
    float3 _1232 = float3(_294, _290, float(0));
    float3 _1234 = select(_1232, float3(0.0), isnan(_1232));
    float _300 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1234.xy, uint(rint(_1234.z)), _284);
    float _302 = -_212;
    float _304 = _302 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _306 = -_198;
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _310 = -_212;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _314 = _212 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _316 = _304 * _304;
    float _318 = _212 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _320 = _312 * _312;
    float _322 = fma(_308, _308, _316);
    float _324 = -_152;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _328 = _212 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _330 = _212 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _332 = _212 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _334 = fma(_326, _326, _322);
    float _336 = -_198;
    float _338 = _336 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _340 = -_152;
    float _342 = _340 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _344 = _212 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _346 = _212 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _348 = fma(_338, _338, _320);
    float _350 = sqrt(_334);
    float _352 = _212 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _354 = _212 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _356 = fma(_342, _342, _348);
    float _358 = _212 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _360 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[31].x, _352);
    float _362 = _212 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _364 = _212 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _366 = _212 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _368 = sqrt(_356);
    float _370 = _212 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _372 = _212 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _374 = _212 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _376 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[22].x, _318);
    float _378 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[20].x, _328);
    float _380 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[23].x, _330);
    bool _384 = _350 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _386 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[21].x, _332);
    bool _388 = _350 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _390 = _212 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    bool _392 = !_384;
    int _395 = _392 ? 0 : 1;
    float _397 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[24].x, _344);
    float _399 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[16].x, _346);
    float _401 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[19].x, _390);
    float _403 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[17].x, _354);
    bool _405 = _368 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _407 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[18].x, _358);
    float _409 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[25].x, _362);
    float _411 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[28].x, _364);
    int _413 = 2;
    if (!_384)
    {
        _413 = 1;
    }
    int _415 = _413;
    float _417 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[29].x, _366);
    bool _419 = _368 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _421 = _212 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    int _423 = _415;
    if (!_388)
    {
        _423 = _395;
    }
    int _425 = _423;
    float _427 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[27].x, _314);
    float _429 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[26].x, _421);
    float _431 = float(_425);
    float _433 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[30].x, _370);
    int _435 = 2;
    if (!_405)
    {
        _435 = 1;
    }
    int _437 = _435;
    float _439 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[32].x, _372);
    float _441 = precise::min(_431, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _443 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[33].x, _374);
    bool _445 = !_405;
    int _447 = _445 ? 0 : 1;
    float _449 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[22].z, _376);
    bool _451 = _441 != 1.0;
    bool _453 = isnan(_441);
    bool _455 = _451 || _453;
    bool _457 = isnan(1.0);
    bool _459 = _455 || _457;
    float _461 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[16].z, _399);
    int _463 = _437;
    if (!_419)
    {
        _463 = _447;
    }
    int _465 = _463;
    float _467 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[19].z, _401);
    bool _469 = _441 != 0.0;
    bool _471 = isnan(_441);
    bool _473 = _469 || _471;
    bool _475 = isnan(0.0);
    bool _477 = _473 || _475;
    float _479 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[30].z, _433);
    float _481 = float(_465);
    float _483 = _467 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _485 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[20].z, _378);
    float _487 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[33].z, _443);
    float _489 = precise::min(_481, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _491 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[29].z, _417);
    float _493 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[23].z, _380);
    float _495 = _483;
    if (_459)
    {
        float _497 = _449 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _495 = _497;
    }
    float _499 = _495;
    bool _501 = _489 != 1.0;
    bool _503 = isnan(_489);
    bool _505 = _501 || _503;
    bool _507 = isnan(1.0);
    bool _509 = _505 || _507;
    float _511 = _485 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _513 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[17].z, _403);
    float _515 = _499;
    float _517 = _511;
    if (!_477)
    {
        float _519 = _461 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _515 = _519;
    }
    float _521 = _515;
    float _523 = _479 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _525 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[31].z, _360);
    float _527 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[21].z, _386);
    float _529 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[28].z, _411);
    float _531 = _491 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _533 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[24].z, _397);
    float _535 = _523;
    float _537 = _531;
    if (_509)
    {
        float _539 = _487 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _535 = _539;
    }
    float _541 = _535;
    float _543 = _541;
    if (_459)
    {
        float _545 = _493 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _517 = _545;
    }
    float _547 = _517;
    float _549 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[18].z, _407);
    float _551 = _547;
    if (!_477)
    {
        float _553 = _513 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _551 = _553;
    }
    float _555 = _551;
    float _557 = _527 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _559 = _529 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _561 = _557;
    float _563 = _559;
    if (_459)
    {
        float _565 = _533 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _561 = _565;
    }
    float _567 = _561;
    float _569 = _567;
    if (!_477)
    {
        float _571 = _549 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _569 = _571;
    }
    float _573 = _569;
    float _575 = -_286;
    float _577 = fma(_284, _575, _280);
    if (_509)
    {
        float _579 = _525 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _563 = _579;
    }
    float _581 = _563;
    float _583 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[32].z, _439);
    float _585 = _581;
    if (_509)
    {
        float _587 = _583 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _537 = _587;
    }
    float _589 = _537;
    bool _591 = _489 != 0.0;
    bool _593 = isnan(_489);
    bool _595 = _591 || _593;
    bool _597 = isnan(0.0);
    bool _599 = _595 || _597;
    float _601 = _296 + _298;
    float _603 = _601 + _300;
    float3 _1797 = float3(_288, _280, float(0));
    float3 _1799 = select(_1797, float3(0.0), isnan(_1797));
    float _605 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1799.xy, uint(rint(_1799.z)), _284);
    float3 _1806 = float3(_278, _280, float(0));
    float3 _1808 = select(_1806, float3(0.0), isnan(_1806));
    float _607 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1808.xy, uint(rint(_1808.z)), _284);
    float3 _1815 = float3(_294, _280, float(0));
    float3 _1817 = select(_1815, float3(0.0), isnan(_1815));
    float _609 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1817.xy, uint(rint(_1817.z)), _284);
    float3 _1824 = float3(_288, _577, float(0));
    float3 _1826 = select(_1824, float3(0.0), isnan(_1824));
    float _611 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1826.xy, uint(rint(_1826.z)), _284);
    float3 _1833 = float3(_278, _577, float(0));
    float3 _1835 = select(_1833, float3(0.0), isnan(_1833));
    float _613 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1835.xy, uint(rint(_1835.z)), _284);
    float3 _1842 = float3(_294, _577, float(0));
    float3 _1844 = select(_1842, float3(0.0), isnan(_1842));
    float _615 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1844.xy, uint(rint(_1844.z)), _284);
    float _617 = rint(_441);
    float _619 = precise::max(_617, 0.0);
    uint _622 = uint(_619);
    uint _624 = clamp(_622, 0u, 65535u);
    float _626 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _628 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[27].z, _427);
    float _630 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _632 = 0.0 + _573;
    float _634 = precise::clamp(_632, 0.0, 1.0);
    float _636 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[26].z, _429);
    float _638 = _589;
    if (!_599)
    {
        float _640 = _628 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _543 = _640;
    }
    float _642 = _543;
    float _644 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[25].z, _409);
    float _646 = rint(_489);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    uint _652 = clamp(_650, 0u, 65535u);
    float _654 = fma(_634, _626, _521);
    if (!_599)
    {
        float _656 = _636 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _638 = _656;
    }
    float _658 = _638;
    if (!_599)
    {
        float _660 = _644 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _585 = _660;
    }
    float _662 = _585;
    float _664 = _603 + _605;
    float _666 = -_626;
    float _668 = fma(_634, _666, _521);
    float _670 = _664 + _607;
    float _672 = _670 + _609;
    float _674 = _672 + _611;
    float _676 = fma(_634, _630, _555);
    float3 _1957 = float3(_521, _676, float(int(_624)));
    float3 _1959 = select(_1957, float3(0.0), isnan(_1957));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1959.xy, uint(rint(_1959.z)), _634);
    float3 _1968 = float3(_654, _676, float(int(_624)));
    float3 _1970 = select(_1968, float3(0.0), isnan(_1968));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1970.xy, uint(rint(_1970.z)), _634);
    float3 _1979 = float3(_668, _676, float(int(_624)));
    float3 _1981 = select(_1979, float3(0.0), isnan(_1979));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1981.xy, uint(rint(_1981.z)), _634);
    float3 _1990 = float3(_654, _555, float(int(_624)));
    float3 _1992 = select(_1990, float3(0.0), isnan(_1990));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1992.xy, uint(rint(_1992.z)), _634);
    float3 _2001 = float3(_521, _555, float(int(_624)));
    float3 _2003 = select(_2001, float3(0.0), isnan(_2001));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2003.xy, uint(rint(_2003.z)), _634);
    float3 _2012 = float3(_668, _555, float(int(_624)));
    float3 _2014 = select(_2012, float3(0.0), isnan(_2012));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2014.xy, uint(rint(_2014.z)), _634);
    float _690 = -_630;
    float _692 = fma(_634, _690, _555);
    float _694 = 0.0 + _642;
    float _696 = precise::clamp(_694, 0.0, 1.0);
    float _698 = fma(_630, _696, _658);
    float _700 = fma(_626, _696, _662);
    float3 _2041 = float3(_654, _692, float(int(_624)));
    float3 _2043 = select(_2041, float3(0.0), isnan(_2041));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2043.xy, uint(rint(_2043.z)), _634);
    float _704 = -_626;
    float _706 = fma(_704, _696, _662);
    float3 _2058 = float3(_521, _692, float(int(_624)));
    float3 _2060 = select(_2058, float3(0.0), isnan(_2058));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2060.xy, uint(rint(_2060.z)), _634);
    float3 _2069 = float3(_668, _692, float(int(_624)));
    float3 _2071 = select(_2069, float3(0.0), isnan(_2069));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2071.xy, uint(rint(_2071.z)), _634);
    float3 _2080 = float3(_662, _698, float(int(_652)));
    float3 _2082 = select(_2080, float3(0.0), isnan(_2080));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2082.xy, uint(rint(_2082.z)), _696);
    float3 _2091 = float3(_700, _698, float(int(_652)));
    float3 _2093 = select(_2091, float3(0.0), isnan(_2091));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2093.xy, uint(rint(_2093.z)), _696);
    float3 _2102 = float3(_706, _698, float(int(_652)));
    float3 _2104 = select(_2102, float3(0.0), isnan(_2102));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2104.xy, uint(rint(_2104.z)), _696);
    float _718 = -_630;
    float _720 = fma(_718, _696, _658);
    float3 _2119 = float3(_700, _658, float(int(_652)));
    float3 _2121 = select(_2119, float3(0.0), isnan(_2119));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2121.xy, uint(rint(_2121.z)), _696);
    float3 _2130 = float3(_662, _658, float(int(_652)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2132.xy, uint(rint(_2132.z)), _696);
    float3 _2141 = float3(_706, _658, float(int(_652)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2143.xy, uint(rint(_2143.z)), _696);
    float3 _2152 = float3(_700, _720, float(int(_652)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2154.xy, uint(rint(_2154.z)), _696);
    float3 _2163 = float3(_662, _720, float(int(_652)));
    float3 _2165 = select(_2163, float3(0.0), isnan(_2163));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2165.xy, uint(rint(_2165.z)), _696);
    float3 _2174 = float3(_706, _720, float(int(_652)));
    float3 _2176 = select(_2174, float3(0.0), isnan(_2174));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2176.xy, uint(rint(_2176.z)), _696);
    float _734 = _674 + _613;
    float _736 = _734 + _615;
    float _738 = -_152;
    float _740 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _742 = _738 + _740;
    float _744 = _742 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = fma(_736, 0.111111111938953399658203125, _746);
    float _750 = _680 + _678;
    float _752 = -_152;
    float _754 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _756 = _752 + _754;
    float _758 = _750 + _682;
    float _760 = _756 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = _758 + _684;
    float _766 = _764 + _686;
    float _768 = _766 + _688;
    float _770 = _768 + _702;
    float _772 = _770 + _708;
    float _774 = _714 + _712;
    float _776 = _772 + _710;
    float _778 = _774 + _716;
    float _780 = _776 * 0.111111111938953399658203125;
    float _782 = _778 + _722;
    float _784 = _782 + _724;
    float _786 = _784 + _726;
    float _788 = _786 + _728;
    float _790 = _788 + _730;
    float _792 = _790 + _732;
    float _794 = _792 * 0.111111111938953399658203125;
    float _796 = _794 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _798 = fma(_780, (*spvDescriptorSet0.fp_c3)._m0[49].z, _796);
    float _800 = _762 + _798;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _748;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _800;
    return out;
}

