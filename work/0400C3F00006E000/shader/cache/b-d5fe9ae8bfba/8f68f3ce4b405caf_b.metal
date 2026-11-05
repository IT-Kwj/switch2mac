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
    float2 _816 = float2(_52, _54);
    float3 _58 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_816, float2(0.0), isnan(_816)), int2(0), component::x).xyw;
    float _60 = _58.x;
    float _62 = _58.y;
    float _64 = _58.z;
    float2 _833 = float2(_52, _54);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_833, float2(0.0), isnan(_833))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_833, float2(0.0), isnan(_833))).x;
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
    float _158 = _152 * _68;
    float _160 = _152 * _70;
    float _162 = fma(_146, _146, _156);
    float _164 = rsqrt(_154);
    float _166 = -_158;
    float _168 = _166 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _170 = rsqrt(_162);
    float _172 = _122 * _164;
    float _174 = _126 * _164;
    float _176 = _118 * _164;
    float _178 = _146 * _170;
    float _180 = _136 * _170;
    float _182 = _140 * _170;
    float _184 = _172 * _178;
    float _186 = _174 * _180;
    float _188 = -_184;
    float _190 = fma(_174, _182, _188);
    float _192 = -_186;
    float _194 = fma(_176, _178, _192);
    float _196 = _176 * _182;
    float _198 = _168 * _168;
    float _200 = _190 * _190;
    float _202 = -_196;
    float _204 = fma(_172, _180, _202);
    float _206 = fma(_194, _194, _200);
    float _208 = fma(_204, _204, _206);
    float _210 = rsqrt(_208);
    float _212 = _190 * _210;
    float _214 = _194 * _210;
    float _216 = _204 * _210;
    float _218 = _212 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _220 = fma(_214, (*spvDescriptorSet0.fp_c3)._m0[35].x, _218);
    float _222 = fma(_216, (*spvDescriptorSet0.fp_c3)._m0[35].z, _220);
    float _224 = abs(_222);
    float _226 = -_224;
    float _228 = _226 + 1.0;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = abs(_230);
    float _234 = log2(_232);
    float _236 = _234 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _238 = exp2(_236);
    float _240 = _238 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _242 = -_152;
    float _244 = _242 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _246 = fma(_212, _240, _158);
    float _248 = fma(_214, _240, _160);
    float _250 = fma(_216, _240, _152);
    float _252 = _246 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _254 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[3].x, _252);
    float _256 = -_160;
    float _258 = _256 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _260 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[3].z, _254);
    float _262 = fma(_258, _258, _198);
    float _264 = -_158;
    float _266 = _264 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _268 = _260 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _270 = fma(_244, _244, _262);
    float _272 = _246 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _274 = _266 * _266;
    float _276 = 1.0 / _268;
    float _278 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[2].x, _272);
    float _280 = _246 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _282 = _246 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _284 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[2].z, _278);
    float _286 = sqrt(_270);
    float _288 = _284 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _290 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[0].x, _280);
    float _292 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[1].x, _282);
    float _294 = -_160;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _298 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[0].z, _290);
    float _300 = _288 * _276;
    float _302 = precise::clamp(_300, 0.0, 1.0);
    float _304 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[1].z, _292);
    float _306 = fma(_296, _296, _274);
    float _308 = _298 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _310 = rint(_302);
    float _312 = precise::max(_310, 0.0);
    uint _315 = uint(_312);
    uint _317 = clamp(_315, 0u, 65535u);
    float _319 = _304 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
    bool _323 = _286 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _325 = _319 * _276;
    bool _327 = _286 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _329 = _308 * _276;
    float _331 = -_152;
    float _333 = _331 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _335 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].y, _325);
    bool _337 = !_323;
    int _340 = _337 ? 0 : 1;
    float _342 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, (*spvDescriptorSet0.fp_c3)._m0[37].x, _329);
    float _344 = -(*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _346 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _344, _329);
    float3 _1296 = float3(_342, _335, float(int(_317)));
    float3 _1300 = select(_1296, float3(0.0), isnan(_1296));
    float _348 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1300.xy, uint(rint(_1300.z)), 1.0);
    float3 _1308 = float3(_329, _335, float(int(_317)));
    float3 _1310 = select(_1308, float3(0.0), isnan(_1308));
    float _350 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1310.xy, uint(rint(_1310.z)), 1.0);
    int _352 = 2;
    if (!_323)
    {
        _352 = 1;
    }
    int _354 = _352;
    float3 _1323 = float3(_346, _335, float(int(_317)));
    float3 _1325 = select(_1323, float3(0.0), isnan(_1323));
    float _356 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1325.xy, uint(rint(_1325.z)), 1.0);
    int _358 = _354;
    if (!_327)
    {
        _358 = _340;
    }
    int _360 = _358;
    float _362 = _158 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _364 = fma(_333, _333, _306);
    float _366 = _158 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _368 = _158 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _370 = _158 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _372 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[20].x, _362);
    float _374 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[19].x, _366);
    float _376 = _158 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _378 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[22].x, _368);
    float _380 = _158 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _382 = _158 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _384 = _158 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _386 = _158 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _388 = float(_360);
    float _390 = sqrt(_364);
    float _392 = _158 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _394 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[21].x, _370);
    float _396 = precise::min(_388, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _398 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[20].z, _372);
    float _400 = _158 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _402 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[19].z, _374);
    bool _404 = _396 != 1.0;
    bool _406 = isnan(_396);
    bool _408 = _404 || _406;
    bool _410 = isnan(1.0);
    bool _412 = _408 || _410;
    float _414 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[24].x, _376);
    bool _416 = _396 != 0.0;
    bool _418 = isnan(_396);
    bool _420 = _416 || _418;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    float _426 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[22].z, _378);
    float _428 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[18].x, _380);
    float _430 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[30].x, _392);
    float _432 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[31].x, _382);
    float _434 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[21].z, _394);
    float _436 = _398 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _438 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[32].x, _400);
    float _440 = _402 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _442 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[28].x, _384);
    float _444 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[24].z, _414);
    float _446 = _440;
    float _448 = _436;
    if (_412)
    {
        float _450 = _426 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _446 = _450;
    }
    float _452 = _446;
    float _454 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[18].z, _428);
    float _456 = _434 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _458 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[30].z, _430);
    float _460 = _456;
    float _462 = _452;
    if (_412)
    {
        float _464 = _444 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _460 = _464;
    }
    float _466 = _460;
    float _468 = _466;
    if (!_424)
    {
        float _470 = _454 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _468 = _470;
    }
    float _472 = _468;
    float _474 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[31].z, _432);
    float3 _1564 = float3(_329, _325, float(int(_317)));
    float3 _1566 = select(_1564, float3(0.0), isnan(_1564));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1566.xy, uint(rint(_1566.z)), 1.0);
    float3 _1574 = float3(_342, _325, float(int(_317)));
    float3 _1576 = select(_1574, float3(0.0), isnan(_1574));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1576.xy, uint(rint(_1576.z)), 1.0);
    float _480 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[28].z, _442);
    bool _482 = _390 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _484 = _458 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _486 = _390 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _488 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[25].x, _386);
    float _490 = _158 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _492 = _158 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _494 = _158 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _496 = _158 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _498 = _158 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _500 = _158 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _502 = _158 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float3 _1641 = float3(_346, _325, float(int(_317)));
    float3 _1643 = select(_1641, float3(0.0), isnan(_1641));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1643.xy, uint(rint(_1643.z)), 1.0);
    float _506 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[23].x, _490);
    float _508 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[16].x, _492);
    float _510 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[17].x, _494);
    float _512 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[26].x, _496);
    float _514 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[27].x, _498);
    float _516 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[29].x, _500);
    bool _518 = !_482;
    int _520 = _518 ? 0 : 1;
    float _522 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[33].x, _502);
    float _524 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[23].z, _506);
    int _526 = 2;
    float _528 = _484;
    if (!_482)
    {
        _526 = 1;
    }
    int _530 = _526;
    float _532 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[29].z, _516);
    int _534 = _530;
    if (!_486)
    {
        _534 = _520;
    }
    int _536 = _534;
    if (_412)
    {
        float _538 = _524 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _448 = _538;
    }
    float _540 = _448;
    float _542 = _532 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _544 = float(_536);
    float _546 = -(*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _548 = fma((*spvDescriptorSet0.fp_c3)._m0[47].x, _546, _325);
    float _550 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[32].z, _438);
    float _552 = precise::min(_544, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float3 _1745 = float3(_342, _548, float(int(_317)));
    float3 _1747 = select(_1745, float3(0.0), isnan(_1745));
    float _554 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1747.xy, uint(rint(_1747.z)), 1.0);
    float _556 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[33].z, _522);
    bool _558 = _552 != 1.0;
    bool _560 = isnan(_552);
    bool _562 = _558 || _560;
    bool _564 = isnan(1.0);
    bool _566 = _562 || _564;
    float _568 = _480 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float3 _1775 = float3(_329, _548, float(int(_317)));
    float3 _1777 = select(_1775, float3(0.0), isnan(_1775));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1777.xy, uint(rint(_1777.z)), 1.0);
    float3 _1785 = float3(_346, _548, float(int(_317)));
    float3 _1787 = select(_1785, float3(0.0), isnan(_1785));
    float _572 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1787.xy, uint(rint(_1787.z)), 1.0);
    float _574 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[16].z, _508);
    float _576 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[17].z, _510);
    float _578 = 0.0 + _472;
    float _580 = precise::clamp(_578, 0.0, 1.0);
    float _582 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[25].z, _488);
    float _584 = _542;
    float _586 = _568;
    float _588 = _540;
    if (_566)
    {
        float _590 = _550 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _584 = _590;
    }
    float _592 = _584;
    float _594 = _592;
    if (_566)
    {
        float _596 = _556 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _528 = _596;
    }
    float _598 = _528;
    float _600 = _598;
    if (_566)
    {
        float _602 = _474 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _586 = _602;
    }
    float _604 = _586;
    bool _606 = _552 != 0.0;
    bool _608 = isnan(_552);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _618 = _604;
    if (!_424)
    {
        float _620 = _574 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _462 = _620;
    }
    float _622 = _462;
    if (!_424)
    {
        float _624 = _576 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _588 = _624;
    }
    float _626 = _588;
    float _628 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _630 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[27].z, _514);
    float _632 = rint(_552);
    float _634 = precise::max(_632, 0.0);
    uint _636 = uint(_634);
    uint _638 = clamp(_636, 0u, 65535u);
    float _640 = fma(_580, _628, _626);
    float _642 = rint(_396);
    float _644 = precise::max(_642, 0.0);
    uint _646 = uint(_644);
    uint _648 = clamp(_646, 0u, 65535u);
    if (!_614)
    {
        float _650 = _582 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _618 = _650;
    }
    float _652 = _618;
    if (!_614)
    {
        float _654 = _630 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _600 = _654;
    }
    float _656 = _600;
    float _658 = fma(_580, _616, _622);
    float _660 = _348 + _350;
    float _662 = _660 + _356;
    float _664 = fma(_152, (*spvDescriptorSet0.fp_c3)._m0[26].z, _512);
    float3 _1948 = float3(_622, _640, float(int(_648)));
    float3 _1950 = select(_1948, float3(0.0), isnan(_1948));
    float _666 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1950.xy, uint(rint(_1950.z)), _580);
    float _668 = _662 + _478;
    float _670 = _668 + _476;
    float _672 = _670 + _504;
    float _674 = -_616;
    float _676 = fma(_580, _674, _622);
    float3 _1974 = float3(_676, _640, float(int(_648)));
    float3 _1976 = select(_1974, float3(0.0), isnan(_1974));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1976.xy, uint(rint(_1976.z)), _580);
    float3 _1985 = float3(_658, _640, float(int(_648)));
    float3 _1987 = select(_1985, float3(0.0), isnan(_1985));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1987.xy, uint(rint(_1987.z)), _580);
    float3 _1996 = float3(_658, _626, float(int(_648)));
    float3 _1998 = select(_1996, float3(0.0), isnan(_1996));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1998.xy, uint(rint(_1998.z)), _580);
    float3 _2007 = float3(_622, _626, float(int(_648)));
    float3 _2009 = select(_2007, float3(0.0), isnan(_2007));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2009.xy, uint(rint(_2009.z)), _580);
    float3 _2018 = float3(_676, _626, float(int(_648)));
    float3 _2020 = select(_2018, float3(0.0), isnan(_2018));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2020.xy, uint(rint(_2020.z)), _580);
    if (!_614)
    {
        float _688 = _664 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _594 = _688;
    }
    float _690 = _594;
    float _692 = -_628;
    float _694 = fma(_580, _692, _626);
    float _696 = 0.0 + _656;
    float _698 = precise::clamp(_696, 0.0, 1.0);
    float _700 = _672 + _554;
    float _702 = fma(_616, _698, _652);
    float _704 = -_616;
    float _706 = fma(_704, _698, _652);
    float _708 = fma(_628, _698, _690);
    float3 _2066 = float3(_658, _694, float(int(_648)));
    float3 _2068 = select(_2066, float3(0.0), isnan(_2066));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2068.xy, uint(rint(_2068.z)), _580);
    float3 _2077 = float3(_622, _694, float(int(_648)));
    float3 _2079 = select(_2077, float3(0.0), isnan(_2077));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2079.xy, uint(rint(_2079.z)), _580);
    float3 _2088 = float3(_676, _694, float(int(_648)));
    float3 _2090 = select(_2088, float3(0.0), isnan(_2088));
    float _714 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2090.xy, uint(rint(_2090.z)), _580);
    float3 _2099 = float3(_652, _708, float(int(_638)));
    float3 _2101 = select(_2099, float3(0.0), isnan(_2099));
    float _716 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2101.xy, uint(rint(_2101.z)), _698);
    float3 _2110 = float3(_702, _708, float(int(_638)));
    float3 _2112 = select(_2110, float3(0.0), isnan(_2110));
    float _718 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2112.xy, uint(rint(_2112.z)), _698);
    float3 _2121 = float3(_706, _708, float(int(_638)));
    float3 _2123 = select(_2121, float3(0.0), isnan(_2121));
    float _720 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2123.xy, uint(rint(_2123.z)), _698);
    float _722 = -_628;
    float _724 = fma(_722, _698, _690);
    float3 _2138 = float3(_702, _690, float(int(_638)));
    float3 _2140 = select(_2138, float3(0.0), isnan(_2138));
    float _726 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2140.xy, uint(rint(_2140.z)), _698);
    float3 _2149 = float3(_652, _690, float(int(_638)));
    float3 _2151 = select(_2149, float3(0.0), isnan(_2149));
    float _728 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2151.xy, uint(rint(_2151.z)), _698);
    float3 _2160 = float3(_706, _690, float(int(_638)));
    float3 _2162 = select(_2160, float3(0.0), isnan(_2160));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2162.xy, uint(rint(_2162.z)), _698);
    float3 _2171 = float3(_702, _724, float(int(_638)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2173.xy, uint(rint(_2173.z)), _698);
    float3 _2182 = float3(_652, _724, float(int(_638)));
    float3 _2184 = select(_2182, float3(0.0), isnan(_2182));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2184.xy, uint(rint(_2184.z)), _698);
    float3 _2193 = float3(_706, _724, float(int(_638)));
    float3 _2195 = select(_2193, float3(0.0), isnan(_2193));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2195.xy, uint(rint(_2195.z)), _698);
    float _738 = _700 + _570;
    float _740 = _738 + _572;
    float _742 = -_152;
    float _744 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _746 = _742 + _744;
    float _748 = _746 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = fma(_740, 0.111111111938953399658203125, _750);
    float _754 = -_152;
    float _756 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _758 = _754 + _756;
    float _760 = _758 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _762 = precise::clamp(_760, 0.0, 1.0);
    float _764 = _680 + _666;
    float _766 = _764 + _678;
    float _768 = _766 + _682;
    float _770 = _768 + _684;
    float _772 = _770 + _686;
    float _774 = _772 + _710;
    float _776 = _774 + _712;
    float _778 = _718 + _716;
    float _780 = _776 + _714;
    float _782 = _778 + _720;
    float _784 = _780 * 0.111111111938953399658203125;
    float _786 = _782 + _726;
    float _788 = _786 + _728;
    float _790 = _788 + _730;
    float _792 = _790 + _732;
    float _794 = _792 + _734;
    float _796 = _794 + _736;
    float _798 = _796 * 0.111111111938953399658203125;
    float _800 = _798 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _802 = fma(_784, (*spvDescriptorSet0.fp_c3)._m0[49].z, _800);
    float _804 = _762 + _802;
    out.m_45.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_45.y = _752;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _804;
    return out;
}

