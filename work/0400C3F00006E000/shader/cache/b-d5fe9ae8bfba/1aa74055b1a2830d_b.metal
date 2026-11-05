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
    float2 _920 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_920, float2(0.0), isnan(_920)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _937 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_937, float2(0.0), isnan(_937))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_937, float2(0.0), isnan(_937))).x;
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
    float _158 = _152 * _70;
    float _160 = fma(_146, _146, _156);
    float _162 = rsqrt(_154);
    float _164 = rsqrt(_160);
    float _166 = _122 * _162;
    float _168 = _126 * _162;
    float _170 = _118 * _162;
    float _172 = _146 * _164;
    float _174 = _136 * _164;
    float _176 = _140 * _164;
    float _178 = _166 * _172;
    float _180 = _168 * _174;
    float _182 = -_178;
    float _184 = fma(_168, _176, _182);
    float _186 = -_180;
    float _188 = fma(_170, _172, _186);
    float _190 = _170 * _176;
    float _192 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _194 = _184 * _184;
    float _196 = -_190;
    float _198 = fma(_166, _174, _196);
    float _200 = fma(_188, _188, _194);
    float _202 = fma(_198, _198, _200);
    float _204 = rsqrt(_202);
    float _206 = _184 * _204;
    float _208 = _188 * _204;
    float _210 = _198 * _204;
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
    float _240 = fma(_208, _236, _158);
    float _242 = fma(_210, _236, _152);
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _246 = _238 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _248 = _238 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _250 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[3].x, _244);
    float _252 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[2].x, _246);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[0].x, _248);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[3].z, _250);
    float _258 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[2].z, _252);
    float _260 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[0].z, _254);
    float _262 = _256 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _264 = _238 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _266 = _258 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _270 = 1.0 / _262;
    float _272 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[1].x, _264);
    float _274 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[1].z, _272);
    float _276 = _274 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _278 = _266 * _270;
    float _280 = precise::clamp(_278, 0.0, 1.0);
    float _282 = _268 * _270;
    float _284 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _286 = _276 * _270;
    float _288 = _280 * _192;
    float _290 = _280 * _284;
    float _292 = fma(_288, 1.5, _282);
    float _294 = fma(_288, 0.5, _282);
    float _296 = fma(_288, -0.5, _282);
    float _298 = fma(_288, -1.5, _282);
    float _300 = fma(_290, 1.5, _286);
    float _302 = fma(_290, 0.5, _286);
    float3 _1334 = float3(_292, _300, float(0));
    float3 _1338 = select(_1334, float3(0.0), isnan(_1334));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1338.xy, uint(rint(_1338.z)), _280);
    float3 _1345 = float3(_294, _300, float(0));
    float3 _1347 = select(_1345, float3(0.0), isnan(_1345));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1347.xy, uint(rint(_1347.z)), _280);
    float3 _1354 = float3(_296, _300, float(0));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1356.xy, uint(rint(_1356.z)), _280);
    float3 _1363 = float3(_298, _300, float(0));
    float3 _1365 = select(_1363, float3(0.0), isnan(_1363));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1365.xy, uint(rint(_1365.z)), _280);
    float3 _1372 = float3(_292, _302, float(0));
    float3 _1374 = select(_1372, float3(0.0), isnan(_1372));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1374.xy, uint(rint(_1374.z)), _280);
    float3 _1381 = float3(_294, _302, float(0));
    float3 _1383 = select(_1381, float3(0.0), isnan(_1381));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1383.xy, uint(rint(_1383.z)), _280);
    float _316 = fma(_290, -0.5, _286);
    float _318 = _304 + _306;
    float _320 = _318 + _308;
    float _322 = _320 + _310;
    float3 _1402 = float3(_296, _302, float(0));
    float3 _1404 = select(_1402, float3(0.0), isnan(_1402));
    float _324 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1404.xy, uint(rint(_1404.z)), _280);
    float _326 = _322 + _312;
    float3 _1414 = float3(_298, _302, float(0));
    float3 _1416 = select(_1414, float3(0.0), isnan(_1414));
    float _328 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1416.xy, uint(rint(_1416.z)), _280);
    float _330 = _326 + _314;
    float3 _1426 = float3(_292, _316, float(0));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _332 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1428.xy, uint(rint(_1428.z)), _280);
    float3 _1435 = float3(_294, _316, float(0));
    float3 _1437 = select(_1435, float3(0.0), isnan(_1435));
    float _334 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1437.xy, uint(rint(_1437.z)), _280);
    float3 _1444 = float3(_296, _316, float(0));
    float3 _1446 = select(_1444, float3(0.0), isnan(_1444));
    float _336 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1446.xy, uint(rint(_1446.z)), _280);
    float3 _1453 = float3(_298, _316, float(0));
    float3 _1455 = select(_1453, float3(0.0), isnan(_1453));
    float _338 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1455.xy, uint(rint(_1455.z)), _280);
    float _340 = -_212;
    float _342 = _340 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _344 = -_158;
    float _346 = _344 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _348 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _350 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _352 = _342 * _342;
    float _354 = _212 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _356 = fma(_346, _346, _352);
    float _358 = -_152;
    float _360 = _358 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _362 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[19].x, _354);
    float _364 = fma(_360, _360, _356);
    float _366 = _212 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _368 = _212 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _370 = _212 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _372 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[19].z, _362);
    float _374 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[20].x, _366);
    float _376 = sqrt(_364);
    float _378 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[23].x, _368);
    float _380 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[22].x, _370);
    float _382 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[20].z, _374);
    float _384 = fma(_290, -1.5, _286);
    float _386 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[23].z, _378);
    float _388 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[22].z, _380);
    float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _392 = _212 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _394 = _212 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _396 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[18].x, _392);
    float _398 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[17].x, _394);
    bool _402 = _376 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _404 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[18].z, _396);
    bool _406 = _376 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _408 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[17].z, _398);
    bool _410 = !_402;
    int _413 = _410 ? 0 : 1;
    int _415 = 2;
    float _417 = _390;
    if (!_402)
    {
        _415 = 1;
    }
    int _419 = _415;
    int _421 = _419;
    if (!_406)
    {
        _421 = _413;
    }
    int _423 = _421;
    float _425 = _372 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _427 = _212 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _429 = float(_423);
    float _431 = precise::min(_429, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _433 = _431 != 1.0;
    bool _435 = isnan(_431);
    bool _437 = _433 || _435;
    bool _439 = isnan(1.0);
    bool _441 = _437 || _439;
    bool _443 = _431 != 0.0;
    bool _445 = isnan(_431);
    bool _447 = _443 || _445;
    bool _449 = isnan(0.0);
    bool _451 = _447 || _449;
    float _453 = _425;
    if (_441)
    {
        float _455 = _386 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _417 = _455;
    }
    float _457 = _417;
    float _459 = _212 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _461 = _457;
    if (_441)
    {
        float _463 = _388 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _453 = _463;
    }
    float _465 = _453;
    float _467 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[21].x, _427);
    float _469 = _212 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _471 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[24].x, _459);
    float _473 = _465;
    if (!_451)
    {
        float _475 = _408 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _461 = _475;
    }
    float _477 = _461;
    float _479 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[21].z, _467);
    float _481 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[16].x, _469);
    float _483 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[24].z, _471);
    float _485 = _479 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _487 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[16].z, _481);
    float _489 = _485;
    if (_441)
    {
        float _491 = _483 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _489 = _491;
    }
    float _493 = _489;
    float _495 = _493;
    if (!_451)
    {
        float _497 = _404 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _495 = _497;
    }
    float _499 = _495;
    if (!_451)
    {
        float _501 = _487 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _473 = _501;
    }
    float _503 = _473;
    float _505 = _330 + _324;
    float _507 = _505 + _328;
    float _509 = _507 + _332;
    float _511 = rint(_431);
    float _513 = precise::max(_511, 0.0);
    uint _516 = uint(_513);
    uint _518 = clamp(_516, 0u, 65535u);
    float _520 = _509 + _334;
    float _522 = _520 + _336;
    float _524 = 0.0 + _499;
    float _526 = precise::clamp(_524, 0.0, 1.0);
    float _528 = _522 + _338;
    float _530 = _526 * _348;
    float _532 = _526 * _350;
    float3 _1809 = float3(_292, _384, float(0));
    float3 _1811 = select(_1809, float3(0.0), isnan(_1809));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1811.xy, uint(rint(_1811.z)), _280);
    float _536 = fma(_530, 1.5, _477);
    float _538 = fma(_532, 0.5, _503);
    float _540 = fma(_532, -0.5, _503);
    float3 _1827 = float3(_294, _384, float(0));
    float3 _1829 = select(_1827, float3(0.0), isnan(_1827));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1829.xy, uint(rint(_1829.z)), _280);
    float3 _1836 = float3(_296, _384, float(0));
    float3 _1838 = select(_1836, float3(0.0), isnan(_1836));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1838.xy, uint(rint(_1838.z)), _280);
    float3 _1845 = float3(_298, _384, float(0));
    float3 _1847 = select(_1845, float3(0.0), isnan(_1845));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1847.xy, uint(rint(_1847.z)), _280);
    float3 _1856 = float3(_538, _536, float(int(_518)));
    float3 _1858 = select(_1856, float3(0.0), isnan(_1856));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1858.xy, uint(rint(_1858.z)), _526);
    float3 _1867 = float3(_540, _536, float(int(_518)));
    float3 _1869 = select(_1867, float3(0.0), isnan(_1867));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1869.xy, uint(rint(_1869.z)), _526);
    float _552 = fma(_532, 1.5, _503);
    float _554 = fma(_532, -1.5, _503);
    float _556 = fma(_530, 0.5, _477);
    float3 _1887 = float3(_554, _536, float(int(_518)));
    float3 _1889 = select(_1887, float3(0.0), isnan(_1887));
    float _558 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1889.xy, uint(rint(_1889.z)), _526);
    float3 _1898 = float3(_552, _536, float(int(_518)));
    float3 _1900 = select(_1898, float3(0.0), isnan(_1898));
    float _560 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1900.xy, uint(rint(_1900.z)), _526);
    float _562 = _528 + _534;
    float _564 = _562 + _542;
    float3 _1915 = float3(_552, _556, float(int(_518)));
    float3 _1917 = select(_1915, float3(0.0), isnan(_1915));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1917.xy, uint(rint(_1917.z)), _526);
    float3 _1926 = float3(_538, _556, float(int(_518)));
    float3 _1928 = select(_1926, float3(0.0), isnan(_1926));
    float _568 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1928.xy, uint(rint(_1928.z)), _526);
    float3 _1937 = float3(_540, _556, float(int(_518)));
    float3 _1939 = select(_1937, float3(0.0), isnan(_1937));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1939.xy, uint(rint(_1939.z)), _526);
    float3 _1948 = float3(_554, _556, float(int(_518)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1950.xy, uint(rint(_1950.z)), _526);
    float _574 = _564 + _544;
    float _576 = _574 + _546;
    float _578 = fma(_530, -0.5, _477);
    float _580 = _560 + _548;
    float _582 = fma(_530, -1.5, _477);
    float _584 = _580 + _550;
    float _586 = _584 + _558;
    float3 _1980 = float3(_538, _578, float(int(_518)));
    float3 _1982 = select(_1980, float3(0.0), isnan(_1980));
    float _588 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1982.xy, uint(rint(_1982.z)), _526);
    float3 _1991 = float3(_552, _578, float(int(_518)));
    float3 _1993 = select(_1991, float3(0.0), isnan(_1991));
    float _590 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1993.xy, uint(rint(_1993.z)), _526);
    float3 _2002 = float3(_540, _578, float(int(_518)));
    float3 _2004 = select(_2002, float3(0.0), isnan(_2002));
    float _592 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2004.xy, uint(rint(_2004.z)), _526);
    float3 _2013 = float3(_554, _578, float(int(_518)));
    float3 _2015 = select(_2013, float3(0.0), isnan(_2013));
    float _594 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2015.xy, uint(rint(_2015.z)), _526);
    float3 _2024 = float3(_552, _582, float(int(_518)));
    float3 _2026 = select(_2024, float3(0.0), isnan(_2024));
    float _596 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2026.xy, uint(rint(_2026.z)), _526);
    float3 _2035 = float3(_538, _582, float(int(_518)));
    float3 _2037 = select(_2035, float3(0.0), isnan(_2035));
    float _598 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2037.xy, uint(rint(_2037.z)), _526);
    float _600 = -_212;
    float _602 = _600 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _604 = -_158;
    float _606 = _604 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _608 = _602 * _602;
    float _610 = fma(_606, _606, _608);
    float _612 = -_152;
    float _614 = _612 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _616 = fma(_614, _614, _610);
    float _618 = sqrt(_616);
    float _620 = _212 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _622 = _212 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _624 = _212 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _626 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[28].x, _620);
    float _628 = _212 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _630 = _212 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _632 = _212 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _634 = _212 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _636 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[29].x, _622);
    float _638 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[28].z, _626);
    float _640 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[25].x, _624);
    float _642 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[30].x, _628);
    float _644 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[31].x, _630);
    float _646 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[32].x, _632);
    bool _648 = _618 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _650 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[33].x, _634);
    bool _652 = _618 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _654 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[29].z, _636);
    float _656 = _638 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _658 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[30].z, _642);
    float _660 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[33].z, _650);
    float _662 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[31].z, _644);
    float _664 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[32].z, _646);
    float _666 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[25].z, _640);
    float _668 = _654 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _670 = 2;
    float _672 = _656;
    float _674 = _668;
    if (!_648)
    {
        _670 = 1;
    }
    int _676 = _670;
    float _678 = _586 + _566;
    float _680 = _678 + _568;
    bool _682 = !_648;
    int _684 = _682 ? 0 : 1;
    float _686 = _680 + _570;
    int _688 = _676;
    if (!_652)
    {
        _688 = _684;
    }
    int _690 = _688;
    float _692 = _212 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _694 = _658 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _696 = _686 + _572;
    float _698 = _212 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _700 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[27].x, _692);
    float _702 = float(_690);
    float _704 = fma(_158, (*spvDescriptorSet0.fp_c3)._m0[26].x, _698);
    float _706 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[27].z, _700);
    float _708 = precise::min(_702, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _710 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[26].z, _704);
    bool _712 = _708 != 1.0;
    bool _714 = isnan(_708);
    bool _716 = _712 || _714;
    bool _718 = isnan(1.0);
    bool _720 = _716 || _718;
    bool _722 = _708 != 0.0;
    bool _724 = isnan(_708);
    bool _726 = _722 || _724;
    bool _728 = isnan(0.0);
    bool _730 = _726 || _728;
    float _732 = rint(_708);
    float _734 = precise::max(_732, 0.0);
    uint _736 = uint(_734);
    uint _738 = clamp(_736, 0u, 65535u);
    float _740 = _696 + _590;
    float _742 = _694;
    if (_720)
    {
        float _744 = _660 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = _740 + _588;
    float _750 = _746;
    if (!_730)
    {
        float _752 = _706 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _750 = _752;
    }
    float _754 = _750;
    if (_720)
    {
        float _756 = _662 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _672 = _756;
    }
    float _758 = _672;
    float _760 = _758;
    if (_720)
    {
        float _762 = _664 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _674 = _762;
    }
    float _764 = _674;
    float _766 = _748 + _592;
    float _768 = 0.0 + _754;
    float _770 = precise::clamp(_768, 0.0, 1.0);
    float _772 = _764;
    if (!_730)
    {
        float _774 = _666 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _760 = _774;
    }
    float _776 = _760;
    if (!_730)
    {
        float _778 = _710 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _772 = _778;
    }
    float _780 = _772;
    float _782 = _766 + _594;
    float _784 = _348 * _770;
    float _786 = -_152;
    float _788 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _790 = _786 + _788;
    float _792 = _782 + _596;
    float _794 = fma(_784, 0.5, _780);
    float _796 = fma(_784, 1.5, _780);
    float _798 = _792 + _598;
    float _800 = _350 * _770;
    float _802 = _790 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _804 = precise::clamp(_802, 0.0, 1.0);
    float _806 = fma(_800, 0.5, _776);
    float3 _2411 = float3(_540, _582, float(int(_518)));
    float3 _2413 = select(_2411, float3(0.0), isnan(_2411));
    float _808 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2413.xy, uint(rint(_2413.z)), _526);
    float3 _2422 = float3(_554, _582, float(int(_518)));
    float3 _2424 = select(_2422, float3(0.0), isnan(_2422));
    float _810 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2424.xy, uint(rint(_2424.z)), _526);
    float _812 = fma(_800, 1.5, _776);
    float _814 = fma(_800, -0.5, _776);
    float3 _2439 = float3(_806, _796, float(int(_738)));
    float3 _2441 = select(_2439, float3(0.0), isnan(_2439));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2441.xy, uint(rint(_2441.z)), _770);
    float3 _2450 = float3(_812, _796, float(int(_738)));
    float3 _2452 = select(_2450, float3(0.0), isnan(_2450));
    float _818 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2452.xy, uint(rint(_2452.z)), _770);
    float3 _2461 = float3(_814, _796, float(int(_738)));
    float3 _2463 = select(_2461, float3(0.0), isnan(_2461));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2463.xy, uint(rint(_2463.z)), _770);
    float3 _2472 = float3(_806, _794, float(int(_738)));
    float3 _2474 = select(_2472, float3(0.0), isnan(_2472));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2474.xy, uint(rint(_2474.z)), _770);
    float _824 = fma(_800, -1.5, _776);
    float _826 = fma(_576, 0.0625, _804);
    float3 _2490 = float3(_824, _796, float(int(_738)));
    float3 _2492 = select(_2490, float3(0.0), isnan(_2490));
    float _828 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2492.xy, uint(rint(_2492.z)), _770);
    float3 _2501 = float3(_812, _794, float(int(_738)));
    float3 _2503 = select(_2501, float3(0.0), isnan(_2501));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2503.xy, uint(rint(_2503.z)), _770);
    float3 _2512 = float3(_814, _794, float(int(_738)));
    float3 _2514 = select(_2512, float3(0.0), isnan(_2512));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2514.xy, uint(rint(_2514.z)), _770);
    float _834 = fma(_784, -0.5, _780);
    float _836 = _798 + _808;
    float3 _2529 = float3(_824, _794, float(int(_738)));
    float3 _2531 = select(_2529, float3(0.0), isnan(_2529));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2531.xy, uint(rint(_2531.z)), _770);
    float3 _2540 = float3(_812, _834, float(int(_738)));
    float3 _2542 = select(_2540, float3(0.0), isnan(_2540));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2542.xy, uint(rint(_2542.z)), _770);
    float3 _2551 = float3(_806, _834, float(int(_738)));
    float3 _2553 = select(_2551, float3(0.0), isnan(_2551));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2553.xy, uint(rint(_2553.z)), _770);
    float _844 = fma(_784, -1.5, _780);
    float3 _2565 = float3(_814, _834, float(int(_738)));
    float3 _2567 = select(_2565, float3(0.0), isnan(_2565));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2567.xy, uint(rint(_2567.z)), _770);
    float3 _2576 = float3(_824, _834, float(int(_738)));
    float3 _2578 = select(_2576, float3(0.0), isnan(_2576));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2578.xy, uint(rint(_2578.z)), _770);
    float _850 = _836 + _810;
    float3 _2590 = float3(_812, _844, float(int(_738)));
    float3 _2592 = select(_2590, float3(0.0), isnan(_2590));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2592.xy, uint(rint(_2592.z)), _770);
    float3 _2601 = float3(_806, _844, float(int(_738)));
    float3 _2603 = select(_2601, float3(0.0), isnan(_2601));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2603.xy, uint(rint(_2603.z)), _770);
    float3 _2612 = float3(_814, _844, float(int(_738)));
    float3 _2614 = select(_2612, float3(0.0), isnan(_2612));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2614.xy, uint(rint(_2614.z)), _770);
    float3 _2623 = float3(_824, _844, float(int(_738)));
    float3 _2625 = select(_2623, float3(0.0), isnan(_2623));
    float _858 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2625.xy, uint(rint(_2625.z)), _770);
    float _860 = _818 + _816;
    float _862 = _860 + _820;
    float _864 = _862 + _828;
    float _866 = _864 + _830;
    float _868 = _866 + _822;
    float _870 = _868 + _832;
    float _872 = -_152;
    float _874 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _876 = _872 + _874;
    float _878 = _850 * 0.0625;
    float _880 = _876 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _882 = precise::clamp(_880, 0.0, 1.0);
    float _884 = _870 + _838;
    float _886 = _884 + _840;
    float _888 = _886 + _842;
    float _890 = _888 + _846;
    float _892 = _890 + _848;
    float _894 = _892 + _852;
    float _896 = _894 + _854;
    float _898 = _896 + _856;
    float _900 = _898 + _858;
    float _902 = _900 * 0.0625;
    float _904 = _902 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _906 = fma(_878, (*spvDescriptorSet0.fp_c3)._m0[49].z, _904);
    float _908 = _882 + _906;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _826;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _908;
    return out;
}

