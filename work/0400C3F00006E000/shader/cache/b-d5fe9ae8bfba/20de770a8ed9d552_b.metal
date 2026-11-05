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
    float2 _904 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_904, float2(0.0), isnan(_904)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _921 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_921, float2(0.0), isnan(_921))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_921, float2(0.0), isnan(_921))).x;
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
    float _140 = _106 * _70;
    float _142 = fma(_130, _130, _136);
    float _144 = fma(_134, _134, _138);
    float _146 = rsqrt(_142);
    float _148 = rsqrt(_144);
    float _150 = _118 * _146;
    float _152 = _130 * _146;
    float _154 = _110 * _146;
    float _156 = _134 * _148;
    float _158 = _114 * _148;
    float _160 = _122 * _148;
    float _162 = _150 * _156;
    float _164 = _152 * _158;
    float _166 = -_162;
    float _168 = fma(_152, _160, _166);
    float _170 = _154 * _160;
    float _172 = -_164;
    float _174 = fma(_154, _156, _172);
    float _176 = _168 * _168;
    float _178 = -_170;
    float _180 = fma(_150, _158, _178);
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
    float _224 = fma(_192, _220, _140);
    float _226 = fma(_194, _220, _106);
    float _228 = _222 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _230 = _222 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _232 = _222 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _234 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[3].x, _228);
    float _236 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[0].x, _230);
    float _238 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[1].x, _232);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[3].z, _234);
    float _242 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[0].z, _236);
    float _244 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[1].z, _238);
    float _246 = _240 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _248 = _222 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _250 = _242 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _252 = 1.0 / _246;
    float _254 = fma(_224, (*spvDescriptorSet0.fp_c3)._m0[2].x, _248);
    float _256 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[2].z, _254);
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _260 = _244 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _262 = _258 * _252;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _250 * _252;
    float _268 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _270 = _260 * _252;
    float _272 = _264 * _182;
    float _274 = _264 * _268;
    float _276 = fma(_272, 1.5, _266);
    float _278 = fma(_272, 0.5, _266);
    float _280 = fma(_272, -0.5, _266);
    float _282 = fma(_272, -1.5, _266);
    float _284 = fma(_274, 1.5, _270);
    float _286 = fma(_274, 0.5, _270);
    float3 _1302 = float3(_276, _284, float(0));
    float3 _1306 = select(_1302, float3(0.0), isnan(_1302));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1306.xy, uint(rint(_1306.z)), _264);
    float3 _1313 = float3(_278, _284, float(0));
    float3 _1315 = select(_1313, float3(0.0), isnan(_1313));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1315.xy, uint(rint(_1315.z)), _264);
    float3 _1322 = float3(_280, _284, float(0));
    float3 _1324 = select(_1322, float3(0.0), isnan(_1322));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1324.xy, uint(rint(_1324.z)), _264);
    float3 _1331 = float3(_282, _284, float(0));
    float3 _1333 = select(_1331, float3(0.0), isnan(_1331));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1333.xy, uint(rint(_1333.z)), _264);
    float3 _1340 = float3(_276, _286, float(0));
    float3 _1342 = select(_1340, float3(0.0), isnan(_1340));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1342.xy, uint(rint(_1342.z)), _264);
    float3 _1349 = float3(_278, _286, float(0));
    float3 _1351 = select(_1349, float3(0.0), isnan(_1349));
    float _298 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1351.xy, uint(rint(_1351.z)), _264);
    float _300 = fma(_274, -0.5, _270);
    float _302 = _288 + _290;
    float _304 = _302 + _292;
    float _306 = _304 + _294;
    float3 _1370 = float3(_280, _286, float(0));
    float3 _1372 = select(_1370, float3(0.0), isnan(_1370));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1372.xy, uint(rint(_1372.z)), _264);
    float _310 = _306 + _296;
    float3 _1382 = float3(_282, _286, float(0));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1384.xy, uint(rint(_1384.z)), _264);
    float _314 = _310 + _298;
    float3 _1394 = float3(_276, _300, float(0));
    float3 _1396 = select(_1394, float3(0.0), isnan(_1394));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1396.xy, uint(rint(_1396.z)), _264);
    float3 _1403 = float3(_278, _300, float(0));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1405.xy, uint(rint(_1405.z)), _264);
    float3 _1412 = float3(_280, _300, float(0));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _320 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1414.xy, uint(rint(_1414.z)), _264);
    float3 _1421 = float3(_282, _300, float(0));
    float3 _1423 = select(_1421, float3(0.0), isnan(_1421));
    float _322 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1423.xy, uint(rint(_1423.z)), _264);
    float _324 = -_196;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _328 = -_140;
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _332 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _334 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _336 = _326 * _326;
    float _338 = _196 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _340 = fma(_330, _330, _336);
    float _342 = -_106;
    float _344 = _342 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _346 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[19].x, _338);
    float _348 = fma(_344, _344, _340);
    float _350 = _196 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _352 = _196 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _354 = _196 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _356 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].z, _346);
    float _358 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[20].x, _350);
    float _360 = sqrt(_348);
    float _362 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[23].x, _352);
    float _364 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[22].x, _354);
    float _366 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].z, _358);
    float _368 = fma(_274, -1.5, _270);
    float _370 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].z, _362);
    float _372 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].z, _364);
    float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _376 = _196 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _378 = _196 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _380 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[18].x, _376);
    float _382 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[17].x, _378);
    bool _386 = _360 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _388 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].z, _380);
    bool _390 = _360 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _392 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].z, _382);
    bool _394 = !_386;
    int _397 = _394 ? 0 : 1;
    int _399 = 2;
    float _401 = _374;
    if (!_386)
    {
        _399 = 1;
    }
    int _403 = _399;
    int _405 = _403;
    if (!_390)
    {
        _405 = _397;
    }
    int _407 = _405;
    float _409 = _356 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _411 = _196 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _413 = float(_407);
    float _415 = precise::min(_413, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _417 = _415 != 1.0;
    bool _419 = isnan(_415);
    bool _421 = _417 || _419;
    bool _423 = isnan(1.0);
    bool _425 = _421 || _423;
    bool _427 = _415 != 0.0;
    bool _429 = isnan(_415);
    bool _431 = _427 || _429;
    bool _433 = isnan(0.0);
    bool _435 = _431 || _433;
    float _437 = _409;
    if (_425)
    {
        float _439 = _370 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _401 = _439;
    }
    float _441 = _401;
    float _443 = _196 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _445 = _441;
    if (_425)
    {
        float _447 = _372 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _437 = _447;
    }
    float _449 = _437;
    float _451 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[21].x, _411);
    float _453 = _196 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _455 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[24].x, _443);
    float _457 = _449;
    if (!_435)
    {
        float _459 = _392 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _445 = _459;
    }
    float _461 = _445;
    float _463 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].z, _451);
    float _465 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[16].x, _453);
    float _467 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].z, _455);
    float _469 = _463 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _471 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].z, _465);
    float _473 = _469;
    if (_425)
    {
        float _475 = _467 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _473 = _475;
    }
    float _477 = _473;
    float _479 = _477;
    if (!_435)
    {
        float _481 = _388 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _479 = _481;
    }
    float _483 = _479;
    if (!_435)
    {
        float _485 = _471 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _457 = _485;
    }
    float _487 = _457;
    float _489 = _314 + _308;
    float _491 = _489 + _312;
    float _493 = _491 + _316;
    float _495 = rint(_415);
    float _497 = precise::max(_495, 0.0);
    uint _500 = uint(_497);
    uint _502 = clamp(_500, 0u, 65535u);
    float _504 = _493 + _318;
    float _506 = _504 + _320;
    float _508 = 0.0 + _483;
    float _510 = precise::clamp(_508, 0.0, 1.0);
    float _512 = _506 + _322;
    float _514 = _510 * _332;
    float _516 = _510 * _334;
    float3 _1777 = float3(_276, _368, float(0));
    float3 _1779 = select(_1777, float3(0.0), isnan(_1777));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1779.xy, uint(rint(_1779.z)), _264);
    float _520 = fma(_514, 1.5, _461);
    float _522 = fma(_516, 0.5, _487);
    float _524 = fma(_516, -0.5, _487);
    float3 _1795 = float3(_278, _368, float(0));
    float3 _1797 = select(_1795, float3(0.0), isnan(_1795));
    float _526 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1797.xy, uint(rint(_1797.z)), _264);
    float3 _1804 = float3(_280, _368, float(0));
    float3 _1806 = select(_1804, float3(0.0), isnan(_1804));
    float _528 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1806.xy, uint(rint(_1806.z)), _264);
    float3 _1813 = float3(_282, _368, float(0));
    float3 _1815 = select(_1813, float3(0.0), isnan(_1813));
    float _530 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1815.xy, uint(rint(_1815.z)), _264);
    float3 _1824 = float3(_522, _520, float(int(_502)));
    float3 _1826 = select(_1824, float3(0.0), isnan(_1824));
    float _532 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1826.xy, uint(rint(_1826.z)), _510);
    float3 _1835 = float3(_524, _520, float(int(_502)));
    float3 _1837 = select(_1835, float3(0.0), isnan(_1835));
    float _534 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1837.xy, uint(rint(_1837.z)), _510);
    float _536 = fma(_516, 1.5, _487);
    float _538 = fma(_516, -1.5, _487);
    float _540 = fma(_514, 0.5, _461);
    float3 _1855 = float3(_538, _520, float(int(_502)));
    float3 _1857 = select(_1855, float3(0.0), isnan(_1855));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1857.xy, uint(rint(_1857.z)), _510);
    float3 _1866 = float3(_536, _520, float(int(_502)));
    float3 _1868 = select(_1866, float3(0.0), isnan(_1866));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1868.xy, uint(rint(_1868.z)), _510);
    float _546 = _512 + _518;
    float _548 = _546 + _526;
    float3 _1883 = float3(_536, _540, float(int(_502)));
    float3 _1885 = select(_1883, float3(0.0), isnan(_1883));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1885.xy, uint(rint(_1885.z)), _510);
    float3 _1894 = float3(_522, _540, float(int(_502)));
    float3 _1896 = select(_1894, float3(0.0), isnan(_1894));
    float _552 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1896.xy, uint(rint(_1896.z)), _510);
    float3 _1905 = float3(_524, _540, float(int(_502)));
    float3 _1907 = select(_1905, float3(0.0), isnan(_1905));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1907.xy, uint(rint(_1907.z)), _510);
    float3 _1916 = float3(_538, _540, float(int(_502)));
    float3 _1918 = select(_1916, float3(0.0), isnan(_1916));
    float _556 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1918.xy, uint(rint(_1918.z)), _510);
    float _558 = _548 + _528;
    float _560 = _558 + _530;
    float _562 = fma(_514, -0.5, _461);
    float _564 = _544 + _532;
    float _566 = fma(_514, -1.5, _461);
    float _568 = _564 + _534;
    float _570 = _568 + _542;
    float3 _1948 = float3(_522, _562, float(int(_502)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1950.xy, uint(rint(_1950.z)), _510);
    float3 _1959 = float3(_536, _562, float(int(_502)));
    float3 _1961 = select(_1959, float3(0.0), isnan(_1959));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1961.xy, uint(rint(_1961.z)), _510);
    float3 _1970 = float3(_524, _562, float(int(_502)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1972.xy, uint(rint(_1972.z)), _510);
    float3 _1981 = float3(_538, _562, float(int(_502)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1983.xy, uint(rint(_1983.z)), _510);
    float3 _1992 = float3(_536, _566, float(int(_502)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1994.xy, uint(rint(_1994.z)), _510);
    float3 _2003 = float3(_522, _566, float(int(_502)));
    float3 _2005 = select(_2003, float3(0.0), isnan(_2003));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2005.xy, uint(rint(_2005.z)), _510);
    float _584 = -_196;
    float _586 = _584 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _588 = -_140;
    float _590 = _588 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _592 = _586 * _586;
    float _594 = fma(_590, _590, _592);
    float _596 = -_106;
    float _598 = _596 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _600 = fma(_598, _598, _594);
    float _602 = sqrt(_600);
    float _604 = _196 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _606 = _196 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _608 = _196 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _610 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[28].x, _604);
    float _612 = _196 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _614 = _196 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _616 = _196 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _618 = _196 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _620 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[29].x, _606);
    float _622 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].z, _610);
    float _624 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[25].x, _608);
    float _626 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[30].x, _612);
    float _628 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[31].x, _614);
    float _630 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[32].x, _616);
    bool _632 = _602 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _634 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[33].x, _618);
    bool _636 = _602 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _638 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].z, _620);
    float _640 = _622 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _642 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].z, _626);
    float _644 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].z, _634);
    float _646 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].z, _628);
    float _648 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].z, _630);
    float _650 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].z, _624);
    float _652 = _638 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    int _654 = 2;
    float _656 = _640;
    float _658 = _652;
    if (!_632)
    {
        _654 = 1;
    }
    int _660 = _654;
    float _662 = _570 + _550;
    float _664 = _662 + _552;
    bool _666 = !_632;
    int _668 = _666 ? 0 : 1;
    float _670 = _664 + _554;
    int _672 = _660;
    if (!_636)
    {
        _672 = _668;
    }
    int _674 = _672;
    float _676 = _196 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _678 = _642 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _680 = _670 + _556;
    float _682 = _196 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _684 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[27].x, _676);
    float _686 = float(_674);
    float _688 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[26].x, _682);
    float _690 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].z, _684);
    float _692 = precise::min(_686, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _694 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].z, _688);
    bool _696 = _692 != 1.0;
    bool _698 = isnan(_692);
    bool _700 = _696 || _698;
    bool _702 = isnan(1.0);
    bool _704 = _700 || _702;
    bool _706 = _692 != 0.0;
    bool _708 = isnan(_692);
    bool _710 = _706 || _708;
    bool _712 = isnan(0.0);
    bool _714 = _710 || _712;
    float _716 = rint(_692);
    float _718 = precise::max(_716, 0.0);
    uint _720 = uint(_718);
    uint _722 = clamp(_720, 0u, 65535u);
    float _724 = _680 + _574;
    float _726 = _678;
    if (_704)
    {
        float _728 = _644 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _726 = _728;
    }
    float _730 = _726;
    float _732 = _724 + _572;
    float _734 = _730;
    if (!_714)
    {
        float _736 = _690 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _734 = _736;
    }
    float _738 = _734;
    if (_704)
    {
        float _740 = _646 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _656 = _740;
    }
    float _742 = _656;
    float _744 = _742;
    if (_704)
    {
        float _746 = _648 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _658 = _746;
    }
    float _748 = _658;
    float _750 = _732 + _576;
    float _752 = 0.0 + _738;
    float _754 = precise::clamp(_752, 0.0, 1.0);
    float _756 = _748;
    if (!_714)
    {
        float _758 = _650 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _744 = _758;
    }
    float _760 = _744;
    if (!_714)
    {
        float _762 = _694 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _756 = _762;
    }
    float _764 = _756;
    float _766 = _750 + _578;
    float _768 = _332 * _754;
    float _770 = -_106;
    float _772 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _774 = _770 + _772;
    float _776 = _766 + _580;
    float _778 = fma(_768, 0.5, _764);
    float _780 = fma(_768, 1.5, _764);
    float _782 = _776 + _582;
    float _784 = _334 * _754;
    float _786 = _774 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _788 = precise::clamp(_786, 0.0, 1.0);
    float _790 = fma(_784, 0.5, _760);
    float3 _2379 = float3(_524, _566, float(int(_502)));
    float3 _2381 = select(_2379, float3(0.0), isnan(_2379));
    float _792 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2381.xy, uint(rint(_2381.z)), _510);
    float3 _2390 = float3(_538, _566, float(int(_502)));
    float3 _2392 = select(_2390, float3(0.0), isnan(_2390));
    float _794 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2392.xy, uint(rint(_2392.z)), _510);
    float _796 = fma(_784, 1.5, _760);
    float _798 = fma(_784, -0.5, _760);
    float3 _2407 = float3(_790, _780, float(int(_722)));
    float3 _2409 = select(_2407, float3(0.0), isnan(_2407));
    float _800 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2409.xy, uint(rint(_2409.z)), _754);
    float3 _2418 = float3(_796, _780, float(int(_722)));
    float3 _2420 = select(_2418, float3(0.0), isnan(_2418));
    float _802 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2420.xy, uint(rint(_2420.z)), _754);
    float3 _2429 = float3(_798, _780, float(int(_722)));
    float3 _2431 = select(_2429, float3(0.0), isnan(_2429));
    float _804 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2431.xy, uint(rint(_2431.z)), _754);
    float3 _2440 = float3(_790, _778, float(int(_722)));
    float3 _2442 = select(_2440, float3(0.0), isnan(_2440));
    float _806 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2442.xy, uint(rint(_2442.z)), _754);
    float _808 = fma(_784, -1.5, _760);
    float _810 = fma(_560, 0.0625, _788);
    float3 _2458 = float3(_808, _780, float(int(_722)));
    float3 _2460 = select(_2458, float3(0.0), isnan(_2458));
    float _812 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2460.xy, uint(rint(_2460.z)), _754);
    float3 _2469 = float3(_796, _778, float(int(_722)));
    float3 _2471 = select(_2469, float3(0.0), isnan(_2469));
    float _814 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2471.xy, uint(rint(_2471.z)), _754);
    float3 _2480 = float3(_798, _778, float(int(_722)));
    float3 _2482 = select(_2480, float3(0.0), isnan(_2480));
    float _816 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2482.xy, uint(rint(_2482.z)), _754);
    float _818 = fma(_768, -0.5, _764);
    float _820 = _782 + _792;
    float3 _2497 = float3(_808, _778, float(int(_722)));
    float3 _2499 = select(_2497, float3(0.0), isnan(_2497));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2499.xy, uint(rint(_2499.z)), _754);
    float3 _2508 = float3(_796, _818, float(int(_722)));
    float3 _2510 = select(_2508, float3(0.0), isnan(_2508));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2510.xy, uint(rint(_2510.z)), _754);
    float3 _2519 = float3(_790, _818, float(int(_722)));
    float3 _2521 = select(_2519, float3(0.0), isnan(_2519));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2521.xy, uint(rint(_2521.z)), _754);
    float _828 = fma(_768, -1.5, _764);
    float3 _2533 = float3(_798, _818, float(int(_722)));
    float3 _2535 = select(_2533, float3(0.0), isnan(_2533));
    float _830 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2535.xy, uint(rint(_2535.z)), _754);
    float3 _2544 = float3(_808, _818, float(int(_722)));
    float3 _2546 = select(_2544, float3(0.0), isnan(_2544));
    float _832 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2546.xy, uint(rint(_2546.z)), _754);
    float _834 = _820 + _794;
    float3 _2558 = float3(_796, _828, float(int(_722)));
    float3 _2560 = select(_2558, float3(0.0), isnan(_2558));
    float _836 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2560.xy, uint(rint(_2560.z)), _754);
    float3 _2569 = float3(_790, _828, float(int(_722)));
    float3 _2571 = select(_2569, float3(0.0), isnan(_2569));
    float _838 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2571.xy, uint(rint(_2571.z)), _754);
    float3 _2580 = float3(_798, _828, float(int(_722)));
    float3 _2582 = select(_2580, float3(0.0), isnan(_2580));
    float _840 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2582.xy, uint(rint(_2582.z)), _754);
    float3 _2591 = float3(_808, _828, float(int(_722)));
    float3 _2593 = select(_2591, float3(0.0), isnan(_2591));
    float _842 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2593.xy, uint(rint(_2593.z)), _754);
    float _844 = _802 + _800;
    float _846 = _844 + _804;
    float _848 = _846 + _812;
    float _850 = _848 + _814;
    float _852 = _850 + _806;
    float _854 = _852 + _816;
    float _856 = -_106;
    float _858 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _860 = _856 + _858;
    float _862 = _834 * 0.0625;
    float _864 = _860 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _866 = precise::clamp(_864, 0.0, 1.0);
    float _868 = _854 + _822;
    float _870 = _868 + _824;
    float _872 = _870 + _826;
    float _874 = _872 + _830;
    float _876 = _874 + _832;
    float _878 = _876 + _836;
    float _880 = _878 + _838;
    float _882 = _880 + _840;
    float _884 = _882 + _842;
    float _886 = _884 * 0.0625;
    float _888 = _886 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _890 = fma(_862, (*spvDescriptorSet0.fp_c3)._m0[49].z, _888);
    float _892 = _866 + _890;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _810;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _892;
    return out;
}

