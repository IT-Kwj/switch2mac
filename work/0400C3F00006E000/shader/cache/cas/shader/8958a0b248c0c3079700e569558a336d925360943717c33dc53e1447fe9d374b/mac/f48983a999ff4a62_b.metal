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
    float2 _816 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_816, float2(0.0), isnan(_816)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _833 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_833, float2(0.0), isnan(_833))).x;
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
    float _106 = _74 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _72, _112);
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
    float _172 = -_168;
    float _174 = fma(_158, _166, _172);
    float _176 = _160 * _166;
    float _178 = -_170;
    float _180 = fma(_160, _162, _178);
    float _182 = _174 * _174;
    float _184 = -_176;
    float _186 = fma(_156, _164, _184);
    float _188 = -_68;
    float _190 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _192 = fma(_180, _180, _182);
    float _194 = fma(_186, _186, _192);
    float _196 = 1.0 / _190;
    float _198 = rsqrt(_194);
    float _200 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _202 = _196 * _200;
    float _204 = _202 * _70;
    float _206 = _202 * _74;
    float _208 = _174 * _198;
    float _210 = _180 * _198;
    float _212 = _186 * _198;
    float _214 = _208 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _216 = fma(_210, (*spvDescriptorSet0.fp_c3)._m0[35].x, _214);
    float _218 = fma(_212, (*spvDescriptorSet0.fp_c3)._m0[35].z, _216);
    float _220 = abs(_218);
    float _222 = -_220;
    float _224 = _222 + 1.0;
    float _226 = precise::clamp(_224, 0.0, 1.0);
    float _228 = abs(_226);
    float _230 = log2(_228);
    float _232 = _230 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _234 = exp2(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _238 = fma(_208, _236, _204);
    float _240 = fma(_210, _236, _206);
    float _242 = fma(_212, _236, _202);
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
    float _286 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _288 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _290 = fma(_284, _286, _278);
    float _292 = -_286;
    float _294 = fma(_284, _292, _278);
    float _296 = fma(_284, _288, _280);
    float _298 = -_288;
    float _300 = fma(_284, _298, _280);
    float3 _1222 = float3(_290, _296, float(0));
    float3 _1226 = select(_1222, float3(0.0), isnan(_1222));
    float _302 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1226.xy, uint(rint(_1226.z)), _284);
    float3 _1233 = float3(_278, _296, float(0));
    float3 _1235 = select(_1233, float3(0.0), isnan(_1233));
    float _304 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1235.xy, uint(rint(_1235.z)), _284);
    float3 _1242 = float3(_294, _296, float(0));
    float3 _1244 = select(_1242, float3(0.0), isnan(_1242));
    float _306 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1244.xy, uint(rint(_1244.z)), _284);
    float3 _1251 = float3(_290, _280, float(0));
    float3 _1253 = select(_1251, float3(0.0), isnan(_1251));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1253.xy, uint(rint(_1253.z)), _284);
    float3 _1260 = float3(_278, _280, float(0));
    float3 _1262 = select(_1260, float3(0.0), isnan(_1260));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1262.xy, uint(rint(_1262.z)), _284);
    float3 _1269 = float3(_294, _280, float(0));
    float3 _1271 = select(_1269, float3(0.0), isnan(_1269));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1271.xy, uint(rint(_1271.z)), _284);
    float3 _1278 = float3(_290, _300, float(0));
    float3 _1280 = select(_1278, float3(0.0), isnan(_1278));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1280.xy, uint(rint(_1280.z)), _284);
    float3 _1287 = float3(_278, _300, float(0));
    float3 _1289 = select(_1287, float3(0.0), isnan(_1287));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1289.xy, uint(rint(_1289.z)), _284);
    float3 _1296 = float3(_294, _300, float(0));
    float3 _1298 = select(_1296, float3(0.0), isnan(_1296));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1298.xy, uint(rint(_1298.z)), _284);
    float _320 = -_204;
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _324 = -_204;
    float _326 = _324 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _328 = -_206;
    float _330 = _328 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _332 = -_206;
    float _334 = _332 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _336 = _322 * _322;
    float _338 = _326 * _326;
    float _340 = -_202;
    float _342 = _340 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _344 = fma(_330, _330, _336);
    float _346 = fma(_334, _334, _338);
    float _348 = _204 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _350 = _204 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _352 = fma(_342, _342, _344);
    float _354 = -_202;
    float _356 = _354 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _358 = _204 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _360 = _204 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _362 = _204 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _364 = fma(_356, _356, _346);
    float _366 = sqrt(_352);
    float _368 = _204 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _370 = _204 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _372 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[19].x, _360);
    float _374 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[20].x, _348);
    float _376 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[21].x, _350);
    float _378 = _204 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _380 = sqrt(_364);
    float _382 = _204 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _384 = _204 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _386 = _204 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _388 = _204 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _390 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[22].x, _362);
    float _392 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[24].x, _368);
    float _394 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[16].x, _370);
    bool _398 = _366 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _400 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[21].z, _376);
    bool _402 = _366 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _404 = _204 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    bool _406 = !_398;
    int _409 = _406 ? 0 : 1;
    float _411 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[19].z, _372);
    float _413 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[20].z, _374);
    float _415 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[24].z, _392);
    bool _417 = _380 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _419 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[22].z, _390);
    bool _421 = _380 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _423 = _204 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    bool _425 = !_417;
    int _427 = _425 ? 0 : 1;
    float _429 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[16].z, _394);
    int _431 = 2;
    int _433 = 2;
    if (!_398)
    {
        _431 = 1;
    }
    int _435 = _431;
    float _437 = _413 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    int _439 = _435;
    float _441 = _437;
    if (!_402)
    {
        _439 = _409;
    }
    int _443 = _439;
    float _445 = _204 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _447 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[28].x, _382);
    float _449 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[29].x, _384);
    float _451 = float(_443);
    float _453 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[26].x, _423);
    if (!_417)
    {
        _433 = 1;
    }
    int _455 = _433;
    float _457 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[33].x, _388);
    float _459 = precise::min(_451, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _461 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[27].x, _378);
    int _463 = _455;
    if (!_421)
    {
        _463 = _427;
    }
    int _465 = _463;
    float _467 = _204 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    bool _469 = _459 != 1.0;
    bool _471 = isnan(_459);
    bool _473 = _469 || _471;
    bool _475 = isnan(1.0);
    bool _477 = _473 || _475;
    float _479 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[31].x, _404);
    bool _481 = _459 != 0.0;
    bool _483 = isnan(_459);
    bool _485 = _481 || _483;
    bool _487 = isnan(0.0);
    bool _489 = _485 || _487;
    float _491 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[18].x, _467);
    float _493 = float(_465);
    float _495 = rint(_459);
    float _497 = precise::max(_495, 0.0);
    uint _500 = uint(_497);
    uint _502 = clamp(_500, 0u, 65535u);
    float _504 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[28].z, _447);
    float _506 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[29].z, _449);
    float _508 = precise::min(_493, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _510 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[33].z, _457);
    float _512 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[31].z, _479);
    float _514 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[27].z, _461);
    bool _516 = _508 != 1.0;
    bool _518 = isnan(_508);
    bool _520 = _516 || _518;
    bool _522 = isnan(1.0);
    bool _524 = _520 || _522;
    float _526 = _506 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _528 = _504 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _530 = _528;
    float _532 = _526;
    if (_524)
    {
        float _534 = _512 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _530 = _534;
    }
    float _536 = _530;
    float _538 = _302 + _304;
    float _540 = _204 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _542 = _538 + _306;
    float _544 = _204 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _546 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[25].x, _540);
    float _548 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[30].x, _358);
    float _550 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[17].x, _445);
    float _552 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[23].x, _544);
    float _554 = _542 + _308;
    float _556 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[30].z, _548);
    float _558 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[17].z, _550);
    float _560 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[23].z, _552);
    float _562 = fma(_206, (*spvDescriptorSet0.fp_c3)._m0[32].x, _386);
    float _564 = _556 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _566 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[18].z, _491);
    float _568 = _400 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _570 = _411 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _572 = _554 + _310;
    float _574 = _568;
    float _576 = _570;
    float _578 = _564;
    float _580 = _536;
    if (_477)
    {
        float _582 = _415 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _574 = _582;
    }
    float _584 = _574;
    float _586 = _584;
    if (_477)
    {
        float _588 = _419 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _576 = _588;
    }
    float _590 = _576;
    float _592 = _590;
    if (_477)
    {
        float _594 = _560 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _441 = _594;
    }
    float _596 = _441;
    float _598 = _596;
    if (!_489)
    {
        float _600 = _566 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _586 = _600;
    }
    float _602 = _586;
    if (!_489)
    {
        float _604 = _429 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _592 = _604;
    }
    float _606 = _592;
    if (!_489)
    {
        float _608 = _558 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _598 = _608;
    }
    float _610 = _598;
    bool _612 = _508 != 0.0;
    bool _614 = isnan(_508);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = _572 + _312;
    float _624 = 0.0 + _602;
    float _626 = precise::clamp(_624, 0.0, 1.0);
    float _628 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _630 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _632 = _622 + _314;
    float _634 = rint(_508);
    float _636 = precise::max(_634, 0.0);
    uint _638 = uint(_636);
    uint _640 = clamp(_638, 0u, 65535u);
    float _642 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[32].z, _562);
    float _644 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[26].z, _453);
    float _646 = _632 + _316;
    float _648 = fma(_626, _628, _606);
    float _650 = -_628;
    float _652 = fma(_626, _650, _606);
    float _654 = fma(_202, (*spvDescriptorSet0.fp_c3)._m0[25].z, _546);
    float _656 = fma(_626, _630, _610);
    if (_524)
    {
        float _658 = _510 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _578 = _658;
    }
    float _660 = _578;
    float _662 = _660;
    if (_524)
    {
        float _664 = _642 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _532 = _664;
    }
    float _666 = _532;
    float _668 = _666;
    if (!_620)
    {
        float _670 = _514 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _662 = _670;
    }
    float _672 = _662;
    float3 _1944 = float3(_648, _610, float(int(_502)));
    float3 _1946 = select(_1944, float3(0.0), isnan(_1944));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1946.xy, uint(rint(_1946.z)), _626);
    float3 _1955 = float3(_606, _656, float(int(_502)));
    float3 _1957 = select(_1955, float3(0.0), isnan(_1955));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1957.xy, uint(rint(_1957.z)), _626);
    float3 _1966 = float3(_652, _656, float(int(_502)));
    float3 _1968 = select(_1966, float3(0.0), isnan(_1966));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1968.xy, uint(rint(_1968.z)), _626);
    float3 _1977 = float3(_648, _656, float(int(_502)));
    float3 _1979 = select(_1977, float3(0.0), isnan(_1977));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1979.xy, uint(rint(_1979.z)), _626);
    if (!_620)
    {
        float _682 = _654 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _580 = _682;
    }
    float _684 = _580;
    float _686 = -_630;
    float _688 = fma(_626, _686, _610);
    float3 _2004 = float3(_606, _610, float(int(_502)));
    float3 _2006 = select(_2004, float3(0.0), isnan(_2004));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2006.xy, uint(rint(_2006.z)), _626);
    float3 _2015 = float3(_652, _610, float(int(_502)));
    float3 _2017 = select(_2015, float3(0.0), isnan(_2015));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2017.xy, uint(rint(_2017.z)), _626);
    float3 _2026 = float3(_648, _688, float(int(_502)));
    float3 _2028 = select(_2026, float3(0.0), isnan(_2026));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2028.xy, uint(rint(_2028.z)), _626);
    if (!_620)
    {
        float _696 = _644 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _668 = _696;
    }
    float _698 = _668;
    float _700 = _646 + _318;
    float _702 = 0.0 + _672;
    float _704 = precise::clamp(_702, 0.0, 1.0);
    float _706 = fma(_630, _704, _698);
    float _708 = fma(_628, _704, _684);
    float3 _2062 = float3(_606, _688, float(int(_502)));
    float3 _2064 = select(_2062, float3(0.0), isnan(_2062));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2064.xy, uint(rint(_2064.z)), _626);
    float _712 = -_628;
    float _714 = fma(_712, _704, _684);
    float3 _2079 = float3(_652, _688, float(int(_502)));
    float3 _2081 = select(_2079, float3(0.0), isnan(_2079));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2081.xy, uint(rint(_2081.z)), _626);
    float3 _2090 = float3(_684, _706, float(int(_640)));
    float3 _2092 = select(_2090, float3(0.0), isnan(_2090));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2092.xy, uint(rint(_2092.z)), _704);
    float3 _2101 = float3(_708, _706, float(int(_640)));
    float3 _2103 = select(_2101, float3(0.0), isnan(_2101));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2103.xy, uint(rint(_2103.z)), _704);
    float3 _2112 = float3(_714, _706, float(int(_640)));
    float3 _2114 = select(_2112, float3(0.0), isnan(_2112));
    float _722 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2114.xy, uint(rint(_2114.z)), _704);
    float3 _2123 = float3(_708, _698, float(int(_640)));
    float3 _2125 = select(_2123, float3(0.0), isnan(_2123));
    float _724 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2125.xy, uint(rint(_2125.z)), _704);
    float _726 = -_630;
    float _728 = fma(_726, _704, _698);
    float3 _2140 = float3(_684, _698, float(int(_640)));
    float3 _2142 = select(_2140, float3(0.0), isnan(_2140));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2142.xy, uint(rint(_2142.z)), _704);
    float3 _2151 = float3(_714, _698, float(int(_640)));
    float3 _2153 = select(_2151, float3(0.0), isnan(_2151));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2153.xy, uint(rint(_2153.z)), _704);
    float3 _2162 = float3(_708, _728, float(int(_640)));
    float3 _2164 = select(_2162, float3(0.0), isnan(_2162));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2164.xy, uint(rint(_2164.z)), _704);
    float3 _2173 = float3(_684, _728, float(int(_640)));
    float3 _2175 = select(_2173, float3(0.0), isnan(_2173));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2175.xy, uint(rint(_2175.z)), _704);
    float3 _2184 = float3(_714, _728, float(int(_640)));
    float3 _2186 = select(_2184, float3(0.0), isnan(_2184));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2186.xy, uint(rint(_2186.z)), _704);
    float2 _2192 = float2(_54, _56);
    float _740 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2192, float2(0.0), isnan(_2192))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2192, float2(0.0), isnan(_2192))).x;
    float _742 = -_202;
    float _744 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _746 = _742 + _744;
    float _748 = _746 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = -_202;
    float _754 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _756 = _752 + _754;
    float _758 = fma(_700, 0.111111111938953399658203125, _750);
    float _760 = _756 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = _680 + _676;
    float _766 = _764 + _678;
    float _768 = _766 + _674;
    float _770 = _768 + _690;
    float _772 = _770 + _692;
    float _774 = _772 + _694;
    float _776 = _774 + _710;
    float _778 = _776 + _716;
    float _780 = _720 + _718;
    float _782 = _778 * 0.111111111938953399658203125;
    float _784 = _780 + _722;
    float _786 = _784 + _724;
    float _788 = _786 + _730;
    float _790 = _788 + _732;
    float _792 = _790 + _734;
    float _794 = _792 + _736;
    float _796 = _794 + _738;
    float _798 = _796 * 0.111111111938953399658203125;
    float _800 = _798 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _802 = fma(_782, (*spvDescriptorSet0.fp_c3)._m0[49].z, _800);
    float _804 = _762 + _802;
    out.m_47.x = _740;
    out.m_47.y = _758;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _804;
    return out;
}

