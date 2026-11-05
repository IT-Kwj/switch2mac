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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_55 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_57 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_61 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_63 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1868 = false;
    bool _896 = false;
    bool _724 = false;
    bool _582 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2484 = as_type<float>(_106);
        out.gl_Position.z = _2484;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2553 = as_type<float>(_144);
        out.gl_Position.z = _2553;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _370 = _364 * _342;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = in.m_51.y;
    float _416 = in.m_51.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _436;
    float _442 = _380 * _416;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _378 * _414;
    float _462 = _420 * _440;
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _410 + _466;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = _372 * _412;
    float _488 = _480 * _484;
    float _490 = -_480;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = _458 * _492;
    float _508 = fma(_496, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _510 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _512 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _468 * _464;
    float _516 = _508 * _506;
    float _518 = _510 * _506;
    float _520 = _512 * _506;
    float _522 = -_458;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].x, _516);
    float _540 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].y, _518);
    float _542 = fma(_528, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _544 = fma(_532, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _546 = fma(_536, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].z, _520);
    float _550 = fma(_542, _488, _538);
    float _552 = fma(_544, _488, _540);
    float _554 = fma(_546, _488, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_438;
    float _580;
    if (!_562)
    {
        float _564 = in.m_53.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _124 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _590 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _600 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_590);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _598;
    float _646 = -_610;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _590 + _650;
    bool _654 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _656 = _626 * _648;
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = 1.0 / _614;
    float _664 = _630 * _644;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _670 = fma(_664, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = _668 * _662;
    float _674 = -_642;
    float _676 = _674 + 1.0;
    float _678 = _670 * _656;
    float _680 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_672, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _684 = _610 * _676;
    float _686 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _688 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = fma(_682, _684, _686);
    float _694 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _690;
    out.m_55.y = _696;
    out.m_55.z = _700;
    out.m_55.w = _702;
    bool _704 = !_654;
    float _722;
    if (!_704)
    {
        float _706 = in.m_53.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _722 = _720;
        _724 = true;
    }
    else
    {
        float _726 = float(_90);
        float _728 = 1.0 / _726;
        float _730 = _124 * _728;
        _722 = _730;
    }
    _724 = false;
    float _732 = _722;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _736 = _732 + _734;
    bool _738 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _740 = isnan(_732);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _752 = _732 + _750;
    bool _754 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _756 = isnan(_732);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _774 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _776 = isnan(_732);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _768;
    float _788 = -_784;
    float _790 = _788 + 1.0;
    bool _792 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _794 = _764 * _790;
    float _796 = -_764;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _772;
    float _802 = _736 * _786;
    float _804 = -_748;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _808;
    float _812 = _784 * _806;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _818;
    float _822 = fma(_810, _802, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _824 = _752 * _800;
    float _826 = fma(_816, _802, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _828 = fma(_820, _802, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _830 = _822 * _794;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _836 = _826 * _794;
    float _838 = _828 * _794;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _848 = fma(_834, _824, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _836);
    float _852 = fma(_842, _824, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _854 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _830);
    float _856 = fma(_846, _824, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _858 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _838);
    float _860 = fma(_852, _812, _850);
    float _862 = fma(_848, _812, _854);
    float _864 = fma(_856, _812, _858);
    float _866 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].x, _860);
    float _868 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].y, _862);
    float _870 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].z, _864);
    bool _872 = !_792;
    float _874 = _866;
    float _892;
    float _894;
    if (!_872)
    {
        float _876 = in.m_53.x;
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _880 = _876 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _884 = _882 * _878;
        float _886 = floor(_884);
        float _888 = -_886;
        float _890 = _884 + _888;
        _892 = _884;
        _894 = _890;
        _896 = true;
    }
    else
    {
        float _898 = float(_90);
        float _900 = 1.0 / _898;
        float _902 = _124 * _900;
        _892 = _900;
        _894 = _902;
    }
    _896 = false;
    float _904 = _892;
    float _906 = _894;
    float _908 = in.m_53.z;
    float _910 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _914 = _912 != 0;
    float _916 = in.m_53.x;
    float _918 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _920 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _922 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _924 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _928 = 1.0 + _926;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _930 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _920);
    float _932 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _922);
    float _934 = _904;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_914)
    {
        float _938 = in.m_53.y;
        _934 = _938;
    }
    float _940 = _934;
    float _942 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _948 = 1.0 / _928;
    float _950 = _908 * 2.0;
    float _952 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = _916 * 2.0;
    float _956 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _958 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _960 = floor(_950);
    float _962 = in.m_59.x;
    float _964 = floor(_954);
    if (!_914)
    {
        _936 = _940;
    }
    float _966 = _936;
    float _968 = _966;
    float _970 = _940;
    if (_914)
    {
        float _972 = in.m_53.x;
        float _974 = in.m_53.y;
        _968 = _972;
        _970 = _974;
    }
    float _976 = _968;
    float _978 = _970;
    bool _980 = _960 > 0.0;
    float _982 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _984 = log2(_982);
    bool _986 = _960 >= 0.0;
    bool _988 = isnan(_960);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    float _996 = _994 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1008 = _1006 != 0;
    float _1010 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _924);
    float _1012 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    bool _1014 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1016 = isnan(1.0);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1022 = _1018 || _1020;
    float _1024 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1026 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1028 = ~as_type<int>(_996);
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1036 = _1032;
    float _1038 = _996;
    if (!_980)
    {
        int _1040 = ~as_type<int>(_996);
        int _1042 = _1040 + 1;
        _1036 = _1042;
    }
    int _1044 = _1036;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_914)
    {
        _1038 = _908;
    }
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1052 = _1024 + _1050;
    bool _1054 = _964 > 0.0;
    float _1056 = _978 * 2.0;
    float _1058 = _1048;
    if (_914)
    {
        _1058 = _978;
    }
    float _1060 = _1058;
    float _1062 = _976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1064 = _964 >= 0.0;
    bool _1066 = isnan(_964);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    float _1074 = floor(_1056);
    float _1076 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1034);
    float _1078 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1046);
    float _1080 = _1060;
    if (!_914)
    {
        _1080 = _908;
    }
    float _1082 = _1080;
    float _1084 = _916 + _978;
    float _1086 = -_944;
    float _1088 = fma(_1062, 2.0, _1086);
    float _1090 = _1082;
    if (_914)
    {
        _1090 = _978;
    }
    float _1092 = _1090;
    float _1094 = _984 * _124;
    int _1096 = _1072 ? 0 : 1;
    float _1098 = _908 + _978;
    float _1100 = _1084 + (-1.0);
    float _1102 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = _1098 + (-1.0);
    int _1112 = _1108;
    if (!_1054)
    {
        int _1114 = ~_1096;
        int _1116 = _1114 + 1;
        _1112 = _1116;
    }
    int _1118 = _1112;
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1122 = !_1000;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1102, -2.0, _946);
    float _1128 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1130 = !_1004;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = exp2(_1094);
    int _1136 = abs(_1124);
    float _1138 = -_124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1088);
    bool _1142 = _1074 > 0.0;
    float _1144 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1126);
    bool _1146 = _1074 >= 0.0;
    bool _1148 = isnan(_1074);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1158 = _942 + _1156;
    int _1160 = abs(_1132);
    float _1162 = _1052 * _1052;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1166 = _1026 + _1164;
    float _1168 = float(_1044);
    float _1170 = fma(_1158, _1158, _1162);
    float _1172 = float(_1136);
    float _1174 = in.m_61.x;
    float _1176 = in.m_61.y;
    float _1178 = in.m_61.z;
    float _1180 = fma(_1166, _1166, _1170);
    float _1182 = float(_1118);
    float _1184 = _1172 * _1168;
    float _1186 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1078);
    float _1188 = rsqrt(_1180);
    float _1190 = -_1134;
    float _1192 = _1190 + 1.0;
    float _1194 = _1184 * (-2.0);
    bool _1196 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1160);
    float _1208 = fma(_1120, _1194, _1120);
    float _1210 = _1204 ? _1192 : 0.0;
    float _1212 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1076);
    float _1214 = _1206 * _1182;
    int _1216 = _1154 ? 0 : 1;
    if (_1022)
    {
        float _1218 = _1210 * _948;
        _128 = _1218;
    }
    float _1220 = _128;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1226 = _1214 * (-2.0);
    float _1228 = _1052 * _1188;
    int _1230 = ~_1216;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = fma(_1194, _1174, _1174);
    float _1238 = -_1228;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1052);
    float _1242 = _1158 * _1188;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1248 = !_1008;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _1240 * _1240;
    float _1254 = -_1242;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    int _1258 = _1234;
    if (!_1142)
    {
        int _1260 = ~_1216;
        int _1262 = _1260 + 1;
        _1258 = _1262;
    }
    int _1264 = _1258;
    float _1266 = fma(_1128, _1226, _1128);
    int _1268 = abs(_1250);
    float _1270 = fma(_1256, _1256, _1252);
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1276 = in.m_53.w;
    float _1278 = _1166 * _1188;
    float _1280 = _916 + (-0.5);
    float _1282 = float(_1268);
    float _1284 = fma(_1226, _1176, _1176);
    float _1286 = -_1278;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1290 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1236);
    float _1292 = float(_1264);
    float _1294 = _916 + _908;
    float _1296 = fma(_1288, _1288, _1270);
    float _1298 = fma(_1208, _1220, _1290);
    float _1300 = 1.0 / _1224;
    float _1302 = _1282 * _1292;
    float _1304 = _1294 + (-1.0);
    float _1306 = in.m_63.x;
    float _1308 = in.m_63.y;
    float _1310 = in.m_63.z;
    float _1312 = _1298 * 0.15915493667125701904296875;
    float _1314 = _978 + (-0.5);
    float _1316 = _1302 * (-2.0);
    float _1318 = 1.0 / _1246;
    float _1320 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1284);
    float _1322 = in.m_59.w;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1326 = _1324 != 0;
    bool _1328 = _1276 > 0.5;
    float _1330 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1332 = fma(_1266, _1220, _1320);
    float _1334 = fma(_1316, _1178, _1178);
    float _1336 = _908 + (-0.5);
    float _1338 = fma(_1330, _1316, _1330);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1342 = _1340 != 0;
    float _1344 = sqrt(_1296);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1334);
    float _1348 = _1332 * 0.15915493667125701904296875;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1352 = _1350 != 0;
    float _1354 = fma(_1338, _1220, _1346);
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1310);
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1360 = _1358 != 0;
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1308);
    bool _1364 = _908 > 0.5;
    bool _1366 = _1364 && _1342;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1376 = _1354 * 0.15915493667125701904296875;
    float _1378 = _1312 * 6.283185482025146484375;
    float _1380 = sin(_1378);
    float _1382 = _1370 * _1300;
    float _1384 = _1374 * _1318;
    float _1386 = _1188 * _1344;
    float _1388 = -_1322;
    float _1390 = _1388 + 1.0;
    float _1392 = in.m_59.z;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1394;
    float _1398 = _1312 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _952 * _1386;
    float _1404 = _956 * _1386;
    float _1406 = _958 * _1386;
    float _1408 = _1322;
    if (_1326)
    {
        float _1410 = _1328 ? _1390 : _1322;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = _1402 * _1362;
    bool _1416 = _916 > 0.5;
    bool _1418 = _1416 && _1352;
    float _1420 = _1406 * _1356;
    float _1422 = 1.0 / _1274;
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1426 = 0.0;
    if (_1352)
    {
        _1426 = _962;
    }
    float _1428 = _1426;
    float _1430 = _1404 * _1424;
    float _1432 = _1348 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1428;
    if (_1418)
    {
        float _1438 = -_1428;
        float _1440 = _1438 + 1.0;
        _1436 = _1440;
    }
    float _1442 = _1436;
    bool _1444 = _978 > 0.5;
    float _1446 = _1348 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = _1396 * _1422;
    float _1452 = _1376 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1400 * _1434;
    float _1458 = _1380 * _1434;
    float _1460 = _1376 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1380 * _1448;
    float _1466 = _1400 * _1448;
    float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1470 = _1454 * _1414;
    float _1472 = _1448 * _1454;
    float _1474 = _1400 * _1470;
    float _1476 = _1380 * _1470;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1480 = _906 + _1478;
    float _1482 = -_1456;
    float _1484 = fma(_1462, _1464, _1482);
    float _1486 = -_1464;
    float _1488 = fma(_1462, _1456, _1486);
    float _1490 = fma(_1462, _1466, _1458);
    float _1492 = -_1414;
    float _1494 = _1462 * _1492;
    float _1496 = fma(_1462, _1458, _1466);
    float _1498 = _1434 * _1454;
    float _1500 = fma(_1490, _1430, _1474);
    float _1502 = fma(_1472, _1430, _1494);
    float _1504 = fma(_1484, _1430, _1476);
    float _1506 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1508 = fma(_1488, _1420, _1500);
    float _1510 = fma(_1498, _1420, _1502);
    float _1512 = fma(_1496, _1420, _1504);
    float _1514 = fma(_1506, _1412, -0.5);
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1518 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1522 = _906 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1526 = _906 + _1524;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1516);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1518);
    float _1532 = fma(_1382, _1522, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1534 = fma(_1384, _1526, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1536 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1528);
    float _1538 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1530);
    bool _1540 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1542 = isnan(_906);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1554 = _942 + _1536;
    float _1556 = _1026 + _1538;
    bool _1558 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1560 = isnan(_906);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = -_1550;
    float _1572 = _1570 + 1.0;
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1576 = _1554 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1580 = _1556 + _1578;
    bool _1582 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1584 = isnan(_906);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = -_1568;
    float _1596 = _1594 + 1.0;
    float _1598 = _1576 * _1576;
    float _1600 = _1580 * _1580;
    bool _1602 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1604 = isnan(_906);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1610 = _1606 || _1608;
    float _1612 = float(_1610);
    float _1614 = _1550 * _1596;
    float _1616 = in.m_59.y;
    float _1618 = _1598 + _1600;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1622 = -_1612;
    float _1624 = _1622 + 1.0;
    float _1626 = _1612 * _1572;
    float _1628 = _1572;
    float _1630 = _1612;
    float _1632 = _1554;
    float _1634 = _1598;
    float _1636 = _1600;
    if (!_1352)
    {
        _1628 = _962;
    }
    float _1638 = _1628;
    float _1640 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1642 = _1392;
    float _1644 = _1638;
    if (!_1342)
    {
        _1630 = _1392;
    }
    float _1646 = _1630;
    float _1648 = _1592 * _1624;
    float _1650 = _1646;
    if (_1366)
    {
        float _1652 = -_1392;
        float _1654 = _1652 + 1.0;
        _1642 = _1654;
    }
    float _1656 = _1642;
    float _1658 = sqrt(_1618);
    if (_1352)
    {
        _1644 = _1442;
    }
    float _1660 = _1644;
    float _1662 = _1532 * _1648;
    float _1664 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1640);
    float _1666 = fma(_1450, _1480, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (_1342)
    {
        _1650 = _1656;
    }
    float _1668 = _1650;
    float _1670 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1672 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1664);
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1676 = -_1592;
    float _1678 = _1676 + 1.0;
    float _1680 = fma(_1670, _1668, -0.5);
    float _1682 = _1024 + _1672;
    float _1684 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1686 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1662);
    float _1688 = -_1616;
    float _1690 = _1688 + 1.0;
    bool _1692 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1694 = fma(_1534, _1626, _1686);
    float _1696 = _1616;
    float _1698 = _1672;
    float _1700 = _1690;
    if (_1360)
    {
        float _1702 = _1444 ? _1690 : _1616;
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (!_1692)
    {
        _1698 = _1554;
    }
    float _1706 = _1698;
    float _1708 = _1706;
    if (!_1692)
    {
        _1700 = _1556;
    }
    float _1710 = _1700;
    float _1712 = _1710;
    if (!_1692)
    {
        _1632 = _1682;
    }
    float _1714 = _1632;
    bool _1716 = !_1692;
    float _1718 = _1714;
    if (!_1716)
    {
        float _1720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1724 = _1658 + _1722;
        float _1726 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = rsqrt(_1618);
        float _1730 = _1724 * _1720;
        float _1732 = _1730 * 0.15915493667125701904296875;
        float _1734 = _1732 * 6.283185482025146484375;
        float _1736 = sin(_1734);
        float _1738 = _1732 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = fma(_1736, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1744 = _1728 * _1742;
        float _1746 = fma(_1576, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = _1740 + (-1.0);
        float _1750 = fma(_1580, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1754 = _1746 + _1752;
        float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1760 = _1750 + _1758;
        float _1762 = _1754 * _1754;
        float _1764 = fma(_1682, _1740, _1756);
        float _1766 = _1760 * _1760;
        _1718 = _1764;
        _1634 = _1762;
        _1636 = _1766;
        _1708 = _1746;
        _1712 = _1750;
    }
    float _1768 = _1718;
    float _1770 = _1634;
    float _1772 = _1636;
    float _1774 = _1708;
    float _1776 = _1712;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1780 = _1768 + _1778;
    float _1782 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1784 = fma(_1666, _1614, _1694);
    float _1786 = -_1144;
    float _1788 = fma(_1186, _1514, _1786);
    float _1790 = fma(_1780, _1780, _1770);
    float _1792 = _1782 * _1620;
    float _1794 = fma(_1212, _1680, _1140);
    float _1796 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1798 = _1790 + _1772;
    float _1800 = _868 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1802 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1804 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1784);
    float _1806 = _1684 * _1674;
    float _1808 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1810 = sqrt(_1798);
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = _1794 + 0.5;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1820 = _1788 + 0.5;
    out.m_65.x = _1806;
    out.m_65.y = _1792;
    out.m_65.z = _1816;
    bool _1822 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1824 = isnan(_1810);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1830 = _1826 || _1828;
    out.m_67.x = _1808;
    out.m_67.y = _1812;
    out.m_67.z = _1814;
    out.m_67.w = _1818;
    out.m_65.w = _1820;
    float _1832 = _1820;
    if (!_1830)
    {
        _874 = 1.0;
    }
    float _1834 = _874;
    bool _1836 = !_1830;
    float _1838 = _1834;
    if (!_1836)
    {
        bool _1840 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1842 = isnan(_1810);
        bool _1844 = _1840 || _1842;
        bool _1846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1848 = _1844 || _1846;
        if (!_1848)
        {
            float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1852 = _1810 + _1850;
            float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1856 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1860 = _1858 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1862 = 1.0 / _1856;
            float _1864 = _1852 * _1862;
            float _1866 = fma(_1864, _1860, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1838 = _1866;
            _1868 = true;
        }
        else
        {
            bool _1870 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1872 = isnan(_1810);
            bool _1874 = _1870 || _1872;
            bool _1876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1878 = _1874 || _1876;
            if (!_1878)
            {
                float _1880 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1882 = _1810 + _1880;
                float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1886 = _1884 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1890 = _1888 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1892 = 1.0 / _1886;
                float _1894 = _1882 * _1892;
                float _1896 = fma(_1894, _1890, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1838 = _1896;
                _1868 = true;
            }
            else
            {
                _1838 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1868 = false;
    float _1898 = _1838;
    float _1900 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1902 = _1768 + _1900;
    float _1904 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1906 = _1774 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1910 = _1776 + _1908;
    float _1912 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1914 = fma(_1906, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1916 = fma(_1910, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1918 = -_1228;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    float _1922 = -_1242;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1914);
    float _1926 = -_1278;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1916);
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1932 = _1920 + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1936 = _1924 + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1940 = _1928 + _1938;
    float _1942 = _1932 * _1932;
    float _1944 = fma(_1936, _1936, _1942);
    float _1946 = fma(_1940, _1940, _1944);
    float _1948 = rsqrt(_1946);
    float _1950 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1952 = _1936 * _1950;
    float _1954 = _1940 * _1950;
    float _1956 = _1952 * _1952;
    float _1958 = _1954 * _1954;
    float _1960 = _1956 + _1958;
    float _1962 = sqrt(_1960);
    bool _1964 = _1962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1968 = _1962 + _1966;
    float _1970 = _1144;
    float _1972 = _1960;
    float _1974 = _1968;
    float _1976 = _1932;
    float _1978 = _1950;
    float _1980 = _1952;
    float _1982 = _1956;
    if (_1964)
    {
        float _1984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1984;
    }
    float _1986 = _1970;
    if (_1964)
    {
        float _1988 = rsqrt(_1960);
        _1972 = _1988;
    }
    float _1990 = _1972;
    float _1992 = _1986;
    if (_1964)
    {
        float _1994 = _1968 * _1986;
        _1974 = _1994;
    }
    float _1996 = _1974;
    if (_1964)
    {
        float _1998 = _1996 * 0.15915493667125701904296875;
        _1832 = _1998;
    }
    float _2000 = _1832;
    float _2002 = _1948;
    if (_1964)
    {
        float _2004 = _2000 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        _2002 = _2006;
    }
    float _2008 = _2002;
    float _2010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2012 = precise::max(0.0, _2010);
    float _2014 = _1940;
    float _2016 = _2012;
    if (_1964)
    {
        float _2018 = _2000 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = -_1950;
    float _2026 = -_2012;
    float _2028 = fma(_1932, _2024, _2026);
    if (_1964)
    {
        float _2030 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1976 = _2030;
    }
    float _2032 = _1976;
    float _2034 = _2032;
    float _2036 = _2008;
    if (_1964)
    {
        float _2038 = fma(_2008, _2032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2034 = _2038;
    }
    float _2040 = _2034;
    float _2042 = _2040;
    if (!_1964)
    {
        _2036 = _2028;
    }
    float _2044 = _2036;
    float _2046 = _2044;
    if (_1964)
    {
        float _2048 = _2022 + (-1.0);
        _2016 = _2048;
    }
    float _2050 = _2016;
    float _2052 = _2050;
    if (_1964)
    {
        float _2054 = _1990 * _2040;
        _1978 = _2054;
    }
    float _2056 = _1978;
    if (!_1964)
    {
        _2042 = _1954;
    }
    float _2058 = _2042;
    float _2060 = sqrt(_1946);
    float _2062 = _2058;
    if (_1964)
    {
        float _2064 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2064;
    }
    float _2066 = _1992;
    if (_1964)
    {
        float _2068 = _1952 * _2056;
        _1980 = _2068;
    }
    float _2070 = _1980;
    if (_1964)
    {
        float _2072 = _1954 * _2056;
        _2062 = _2072;
    }
    float _2074 = _2062;
    if (!_1964)
    {
        _2052 = _1958;
    }
    float _2076 = _2052;
    float _2078 = _2076;
    if (_1964)
    {
        float _2080 = fma(_2028, _2022, _2066);
        _2046 = _2080;
    }
    float _2082 = _2046;
    if (_1964)
    {
        float _2084 = _2070 * _2070;
        _1982 = _2084;
    }
    float _2086 = _1982;
    if (_1964)
    {
        float _2088 = _2074 * _2074;
        _2078 = _2088;
    }
    float _2090 = _2078;
    float _2092 = fma(_2082, _2082, _2086);
    float _2094 = _2092 + _2090;
    float _2096 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2100 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2098);
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2106 = rsqrt(_2094);
    float _2108 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2096);
    float _2110 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2112 = -_2102;
    float _2114 = _2112 + 1.0;
    float _2116 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2118 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2108);
    float _2120 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2110);
    float _2122 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2124 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2116);
    float _2126 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2120);
    float _2130 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2122);
    float _2132 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2124);
    float _2134 = abs(_2114);
    float _2136 = log2(_2134);
    float _2138 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2140 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2142 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2144 = _2106 * _2070;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2148 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2130);
    float _2150 = -_2140;
    float _2152 = fma(_2150, _2104, 1.0);
    float _2154 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2156 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2146);
    float _2158 = _2106 * _2082;
    float _2160 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2162 = _2106 * _2074;
    float _2164 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2156);
    float _2166 = -_2154;
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = log2(_2152);
    float _2172 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2174 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2164);
    float _2176 = -_2162;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2182 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = fma(_2178, -0.5, 0.5);
    float _2186 = exp2(_2172);
    float _2188 = fma(_2178, 0.5, 0.5);
    float _2190 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2180);
    float _2192 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2194 = _2158 + 1.0;
    float _2196 = fma(_2188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2198 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2190);
    float _2200 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2192);
    float _2202 = 1.0 / _2174;
    float _2204 = fma(_2188, _2196, -0.212114393711090087890625);
    float _2206 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2198);
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2210 = _2170 * 0.693147182464599609375;
    float _2212 = fma(_2188, _2204, 1.570728778839111328125);
    float _2214 = sqrt(_2184);
    float _2216 = -_2158;
    float _2218 = fma(_2186, _2194, _2216);
    float _2220 = fma(_2218, 0.5, 0.5);
    float _2222 = _2206 * _2202;
    float _2224 = _2208 * _2202;
    float _2226 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2228 = fma(_2222, 0.5, 0.5);
    float _2230 = fma(_2224, -0.5, 0.5);
    float _2232 = _2214 * 0.636619746685028076171875;
    float _2234 = -_2212;
    float _2236 = fma(_2232, _2234, 1.0);
    float3 _5880 = float3(_2228, _2230, _2226);
    float _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5880, float3(0.0), isnan(_5880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5880, float3(0.0), isnan(_5880)), level(0.0)).x;
    float3 _5891 = float3(_2228, _2230, _2226);
    float4 _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5891, float3(0.0), isnan(_5891)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5891, float3(0.0), isnan(_5891)), level(0.0)).xyzw;
    float _2243 = _2241.x;
    float _2245 = _2241.y;
    float _2247 = _2241.z;
    float _2249 = _2241.w;
    float2 _5908 = float2(_2236, _2220);
    float3 _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    float _2261 = -_1228;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _2265 = -_1242;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2269 = -_1278;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _2273 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2275 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2277 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2273);
    float _2279 = fma(_2267, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2275);
    float _2281 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2277);
    float _2283 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2279);
    float _2285 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2287 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2289 = fma(_2267, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2285);
    float _2291 = 1.0 / _2287;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2289);
    float _2295 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2297 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(0.5);
    bool _2305 = _2301 || _2303;
    float _2307 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2281);
    float _2309 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2311 = exp2(_2295);
    float _2313 = _2309 + _2287;
    float _2315 = _2313 * _2291;
    float _2317 = _2315 * 0.5;
    float _2319 = _2291;
    if (_2305)
    {
        _2319 = 1.0;
    }
    float _2321 = _2319;
    float _2323 = _2321;
    if (!_2305)
    {
        float _2325 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2329 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2327);
        float _2331 = _2325 * 0.15915493667125701904296875;
        float _2333 = _2331 * 6.283185482025146484375;
        float _2335 = cos(_2333);
        float _2337 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2339 = _2337 * 0.15915493667125701904296875;
        float _2341 = _2331 * 6.283185482025146484375;
        float _2343 = sin(_2341);
        float _2345 = 1.0 / _2335;
        float _2347 = _2339 * 6.283185482025146484375;
        float _2349 = cos(_2347);
        float _2351 = _2343 * _2345;
        float _2353 = 1.0 / _2329;
        float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2357 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2355;
        float _2359 = _2349 * _2351;
        float _2361 = _2339 * 6.283185482025146484375;
        float _2363 = sin(_2361);
        float _2365 = 1.0 / _2359;
        float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2369 = _2353 * _2367;
        float _2371 = 1.0 / _2357;
        float _2373 = _2363 * _2365;
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2377 = fma(_2373, _2369, _2375);
        float _2379 = _2377 * _2371;
        float _2381 = precise::clamp(_2379, 0.0, 1.0);
        _2323 = _2381;
    }
    float _2383 = _2323;
    float _2385 = -_2311;
    float _2387 = _2385 + 1.0;
    bool _2389 = _2383 > 0.0;
    bool _2391 = isnan(_2383);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2403 = _2307 + _2174;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2407 = _2401 * _2238;
    float _2409 = -_2401;
    float _2411 = _2409 + 1.0;
    out.gl_Position.x = _2206;
    out.gl_Position.y = _2208;
    out.gl_Position.z = _2307;
    out.gl_Position.w = _2174;
    float _2413 = _2403 * 0.5;
    float _2415 = _2249 * _2407;
    float _2417 = _2259 * _2407;
    float _2419 = _2249 * _2411;
    out.m_47.x = _2405;
    float _2421 = fma(_2255, _2415, _2243);
    float _2423 = fma(_2257, _2415, _2245);
    float _2425 = fma(_2249, _2417, _2247);
    out.m_69.z = _2413;
    out.m_69.w = _2174;
    out.m_71.x = _2421;
    out.m_71.y = _2423;
    out.m_71.z = _2425;
    out.m_71.w = _2419;
    if (_2397)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2427 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2427;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1868 = false;
    bool _896 = false;
    bool _724 = false;
    bool _582 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2484 = as_type<float>(_106);
        out.gl_Position.z = _2484;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2553 = as_type<float>(_144);
        out.gl_Position.z = _2553;
    }
    if (_138)
    {
        return out;
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _370 = _364 * _342;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = in.m_51.y;
    float _416 = in.m_51.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _436;
    float _442 = _380 * _416;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _378 * _414;
    float _462 = _420 * _440;
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _410 + _466;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = _372 * _412;
    float _488 = _480 * _484;
    float _490 = -_480;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = _458 * _492;
    float _508 = fma(_496, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _510 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _512 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _468 * _464;
    float _516 = _508 * _506;
    float _518 = _510 * _506;
    float _520 = _512 * _506;
    float _522 = -_458;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].x, _516);
    float _540 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].y, _518);
    float _542 = fma(_528, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _544 = fma(_532, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _546 = fma(_536, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].z, _520);
    float _550 = fma(_542, _488, _538);
    float _552 = fma(_544, _488, _540);
    float _554 = fma(_546, _488, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_438;
    float _580;
    if (!_562)
    {
        float _564 = in.m_53.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _124 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _590 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _600 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_590);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _598;
    float _646 = -_610;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _590 + _650;
    bool _654 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _656 = _626 * _648;
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = 1.0 / _614;
    float _664 = _630 * _644;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _670 = fma(_664, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = _668 * _662;
    float _674 = -_642;
    float _676 = _674 + 1.0;
    float _678 = _670 * _656;
    float _680 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_672, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _684 = _610 * _676;
    float _686 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _688 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = fma(_682, _684, _686);
    float _694 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _690;
    out.m_55.y = _696;
    out.m_55.z = _700;
    out.m_55.w = _702;
    bool _704 = !_654;
    float _722;
    if (!_704)
    {
        float _706 = in.m_53.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _722 = _720;
        _724 = true;
    }
    else
    {
        float _726 = float(_90);
        float _728 = 1.0 / _726;
        float _730 = _124 * _728;
        _722 = _730;
    }
    _724 = false;
    float _732 = _722;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _736 = _732 + _734;
    bool _738 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _740 = isnan(_732);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _752 = _732 + _750;
    bool _754 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _756 = isnan(_732);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _774 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _776 = isnan(_732);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _768;
    float _788 = -_784;
    float _790 = _788 + 1.0;
    bool _792 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _794 = _764 * _790;
    float _796 = -_764;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _772;
    float _802 = _736 * _786;
    float _804 = -_748;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _808;
    float _812 = _784 * _806;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _818;
    float _822 = fma(_810, _802, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _824 = _752 * _800;
    float _826 = fma(_816, _802, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _828 = fma(_820, _802, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _830 = _822 * _794;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _836 = _826 * _794;
    float _838 = _828 * _794;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _848 = fma(_834, _824, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _836);
    float _852 = fma(_842, _824, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _854 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _830);
    float _856 = fma(_846, _824, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _858 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _838);
    float _860 = fma(_852, _812, _850);
    float _862 = fma(_848, _812, _854);
    float _864 = fma(_856, _812, _858);
    float _866 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].x, _860);
    float _868 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].y, _862);
    float _870 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].z, _864);
    bool _872 = !_792;
    float _874 = _866;
    float _892;
    float _894;
    if (!_872)
    {
        float _876 = in.m_53.x;
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _880 = _876 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _884 = _882 * _878;
        float _886 = floor(_884);
        float _888 = -_886;
        float _890 = _884 + _888;
        _892 = _884;
        _894 = _890;
        _896 = true;
    }
    else
    {
        float _898 = float(_90);
        float _900 = 1.0 / _898;
        float _902 = _124 * _900;
        _892 = _900;
        _894 = _902;
    }
    _896 = false;
    float _904 = _892;
    float _906 = _894;
    float _908 = in.m_53.z;
    float _910 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _914 = _912 != 0;
    float _916 = in.m_53.x;
    float _918 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _920 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _922 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _924 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _928 = 1.0 + _926;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _930 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _920);
    float _932 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _922);
    float _934 = _904;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_914)
    {
        float _938 = in.m_53.y;
        _934 = _938;
    }
    float _940 = _934;
    float _942 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _948 = 1.0 / _928;
    float _950 = _908 * 2.0;
    float _952 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = _916 * 2.0;
    float _956 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _958 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _960 = floor(_950);
    float _962 = in.m_59.x;
    float _964 = floor(_954);
    if (!_914)
    {
        _936 = _940;
    }
    float _966 = _936;
    float _968 = _966;
    float _970 = _940;
    if (_914)
    {
        float _972 = in.m_53.x;
        float _974 = in.m_53.y;
        _968 = _972;
        _970 = _974;
    }
    float _976 = _968;
    float _978 = _970;
    bool _980 = _960 > 0.0;
    float _982 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _984 = log2(_982);
    bool _986 = _960 >= 0.0;
    bool _988 = isnan(_960);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    float _996 = _994 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1008 = _1006 != 0;
    float _1010 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _924);
    float _1012 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    bool _1014 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1016 = isnan(1.0);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1022 = _1018 || _1020;
    float _1024 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1026 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1028 = ~as_type<int>(_996);
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1036 = _1032;
    float _1038 = _996;
    if (!_980)
    {
        int _1040 = ~as_type<int>(_996);
        int _1042 = _1040 + 1;
        _1036 = _1042;
    }
    int _1044 = _1036;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_914)
    {
        _1038 = _908;
    }
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1052 = _1024 + _1050;
    bool _1054 = _964 > 0.0;
    float _1056 = _978 * 2.0;
    float _1058 = _1048;
    if (_914)
    {
        _1058 = _978;
    }
    float _1060 = _1058;
    float _1062 = _976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1064 = _964 >= 0.0;
    bool _1066 = isnan(_964);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    float _1074 = floor(_1056);
    float _1076 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1034);
    float _1078 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1046);
    float _1080 = _1060;
    if (!_914)
    {
        _1080 = _908;
    }
    float _1082 = _1080;
    float _1084 = _916 + _978;
    float _1086 = -_944;
    float _1088 = fma(_1062, 2.0, _1086);
    float _1090 = _1082;
    if (_914)
    {
        _1090 = _978;
    }
    float _1092 = _1090;
    float _1094 = _984 * _124;
    int _1096 = _1072 ? 0 : 1;
    float _1098 = _908 + _978;
    float _1100 = _1084 + (-1.0);
    float _1102 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = _1098 + (-1.0);
    int _1112 = _1108;
    if (!_1054)
    {
        int _1114 = ~_1096;
        int _1116 = _1114 + 1;
        _1112 = _1116;
    }
    int _1118 = _1112;
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1122 = !_1000;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1102, -2.0, _946);
    float _1128 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1130 = !_1004;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = exp2(_1094);
    int _1136 = abs(_1124);
    float _1138 = -_124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1088);
    bool _1142 = _1074 > 0.0;
    float _1144 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1126);
    bool _1146 = _1074 >= 0.0;
    bool _1148 = isnan(_1074);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1158 = _942 + _1156;
    int _1160 = abs(_1132);
    float _1162 = _1052 * _1052;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1166 = _1026 + _1164;
    float _1168 = float(_1044);
    float _1170 = fma(_1158, _1158, _1162);
    float _1172 = float(_1136);
    float _1174 = in.m_61.x;
    float _1176 = in.m_61.y;
    float _1178 = in.m_61.z;
    float _1180 = fma(_1166, _1166, _1170);
    float _1182 = float(_1118);
    float _1184 = _1172 * _1168;
    float _1186 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1078);
    float _1188 = rsqrt(_1180);
    float _1190 = -_1134;
    float _1192 = _1190 + 1.0;
    float _1194 = _1184 * (-2.0);
    bool _1196 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1160);
    float _1208 = fma(_1120, _1194, _1120);
    float _1210 = _1204 ? _1192 : 0.0;
    float _1212 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1076);
    float _1214 = _1206 * _1182;
    int _1216 = _1154 ? 0 : 1;
    if (_1022)
    {
        float _1218 = _1210 * _948;
        _128 = _1218;
    }
    float _1220 = _128;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1226 = _1214 * (-2.0);
    float _1228 = _1052 * _1188;
    int _1230 = ~_1216;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = fma(_1194, _1174, _1174);
    float _1238 = -_1228;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1052);
    float _1242 = _1158 * _1188;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1248 = !_1008;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _1240 * _1240;
    float _1254 = -_1242;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    int _1258 = _1234;
    if (!_1142)
    {
        int _1260 = ~_1216;
        int _1262 = _1260 + 1;
        _1258 = _1262;
    }
    int _1264 = _1258;
    float _1266 = fma(_1128, _1226, _1128);
    int _1268 = abs(_1250);
    float _1270 = fma(_1256, _1256, _1252);
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1276 = in.m_53.w;
    float _1278 = _1166 * _1188;
    float _1280 = _916 + (-0.5);
    float _1282 = float(_1268);
    float _1284 = fma(_1226, _1176, _1176);
    float _1286 = -_1278;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1290 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1236);
    float _1292 = float(_1264);
    float _1294 = _916 + _908;
    float _1296 = fma(_1288, _1288, _1270);
    float _1298 = fma(_1208, _1220, _1290);
    float _1300 = 1.0 / _1224;
    float _1302 = _1282 * _1292;
    float _1304 = _1294 + (-1.0);
    float _1306 = in.m_63.x;
    float _1308 = in.m_63.y;
    float _1310 = in.m_63.z;
    float _1312 = _1298 * 0.15915493667125701904296875;
    float _1314 = _978 + (-0.5);
    float _1316 = _1302 * (-2.0);
    float _1318 = 1.0 / _1246;
    float _1320 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1284);
    float _1322 = in.m_59.w;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1326 = _1324 != 0;
    bool _1328 = _1276 > 0.5;
    float _1330 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1332 = fma(_1266, _1220, _1320);
    float _1334 = fma(_1316, _1178, _1178);
    float _1336 = _908 + (-0.5);
    float _1338 = fma(_1330, _1316, _1330);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1342 = _1340 != 0;
    float _1344 = sqrt(_1296);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1334);
    float _1348 = _1332 * 0.15915493667125701904296875;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1352 = _1350 != 0;
    float _1354 = fma(_1338, _1220, _1346);
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1310);
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1360 = _1358 != 0;
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1308);
    bool _1364 = _908 > 0.5;
    bool _1366 = _1364 && _1342;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1376 = _1354 * 0.15915493667125701904296875;
    float _1378 = _1312 * 6.283185482025146484375;
    float _1380 = sin(_1378);
    float _1382 = _1370 * _1300;
    float _1384 = _1374 * _1318;
    float _1386 = _1188 * _1344;
    float _1388 = -_1322;
    float _1390 = _1388 + 1.0;
    float _1392 = in.m_59.z;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1394;
    float _1398 = _1312 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _952 * _1386;
    float _1404 = _956 * _1386;
    float _1406 = _958 * _1386;
    float _1408 = _1322;
    if (_1326)
    {
        float _1410 = _1328 ? _1390 : _1322;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = _1402 * _1362;
    bool _1416 = _916 > 0.5;
    bool _1418 = _1416 && _1352;
    float _1420 = _1406 * _1356;
    float _1422 = 1.0 / _1274;
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1426 = 0.0;
    if (_1352)
    {
        _1426 = _962;
    }
    float _1428 = _1426;
    float _1430 = _1404 * _1424;
    float _1432 = _1348 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1428;
    if (_1418)
    {
        float _1438 = -_1428;
        float _1440 = _1438 + 1.0;
        _1436 = _1440;
    }
    float _1442 = _1436;
    bool _1444 = _978 > 0.5;
    float _1446 = _1348 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = _1396 * _1422;
    float _1452 = _1376 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1400 * _1434;
    float _1458 = _1380 * _1434;
    float _1460 = _1376 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1380 * _1448;
    float _1466 = _1400 * _1448;
    float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1470 = _1454 * _1414;
    float _1472 = _1448 * _1454;
    float _1474 = _1400 * _1470;
    float _1476 = _1380 * _1470;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1480 = _906 + _1478;
    float _1482 = -_1456;
    float _1484 = fma(_1462, _1464, _1482);
    float _1486 = -_1464;
    float _1488 = fma(_1462, _1456, _1486);
    float _1490 = fma(_1462, _1466, _1458);
    float _1492 = -_1414;
    float _1494 = _1462 * _1492;
    float _1496 = fma(_1462, _1458, _1466);
    float _1498 = _1434 * _1454;
    float _1500 = fma(_1490, _1430, _1474);
    float _1502 = fma(_1472, _1430, _1494);
    float _1504 = fma(_1484, _1430, _1476);
    float _1506 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1508 = fma(_1488, _1420, _1500);
    float _1510 = fma(_1498, _1420, _1502);
    float _1512 = fma(_1496, _1420, _1504);
    float _1514 = fma(_1506, _1412, -0.5);
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1518 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1522 = _906 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1526 = _906 + _1524;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1516);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1518);
    float _1532 = fma(_1382, _1522, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1534 = fma(_1384, _1526, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1536 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1528);
    float _1538 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1530);
    bool _1540 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1542 = isnan(_906);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1554 = _942 + _1536;
    float _1556 = _1026 + _1538;
    bool _1558 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1560 = isnan(_906);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = -_1550;
    float _1572 = _1570 + 1.0;
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1576 = _1554 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1580 = _1556 + _1578;
    bool _1582 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1584 = isnan(_906);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = -_1568;
    float _1596 = _1594 + 1.0;
    float _1598 = _1576 * _1576;
    float _1600 = _1580 * _1580;
    bool _1602 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1604 = isnan(_906);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1610 = _1606 || _1608;
    float _1612 = float(_1610);
    float _1614 = _1550 * _1596;
    float _1616 = in.m_59.y;
    float _1618 = _1598 + _1600;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1622 = -_1612;
    float _1624 = _1622 + 1.0;
    float _1626 = _1612 * _1572;
    float _1628 = _1572;
    float _1630 = _1612;
    float _1632 = _1554;
    float _1634 = _1598;
    float _1636 = _1600;
    if (!_1352)
    {
        _1628 = _962;
    }
    float _1638 = _1628;
    float _1640 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1642 = _1392;
    float _1644 = _1638;
    if (!_1342)
    {
        _1630 = _1392;
    }
    float _1646 = _1630;
    float _1648 = _1592 * _1624;
    float _1650 = _1646;
    if (_1366)
    {
        float _1652 = -_1392;
        float _1654 = _1652 + 1.0;
        _1642 = _1654;
    }
    float _1656 = _1642;
    float _1658 = sqrt(_1618);
    if (_1352)
    {
        _1644 = _1442;
    }
    float _1660 = _1644;
    float _1662 = _1532 * _1648;
    float _1664 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1640);
    float _1666 = fma(_1450, _1480, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (_1342)
    {
        _1650 = _1656;
    }
    float _1668 = _1650;
    float _1670 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1672 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1664);
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1676 = -_1592;
    float _1678 = _1676 + 1.0;
    float _1680 = fma(_1670, _1668, -0.5);
    float _1682 = _1024 + _1672;
    float _1684 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1686 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1662);
    float _1688 = -_1616;
    float _1690 = _1688 + 1.0;
    bool _1692 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1694 = fma(_1534, _1626, _1686);
    float _1696 = _1616;
    float _1698 = _1672;
    float _1700 = _1690;
    if (_1360)
    {
        float _1702 = _1444 ? _1690 : _1616;
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (!_1692)
    {
        _1698 = _1554;
    }
    float _1706 = _1698;
    float _1708 = _1706;
    if (!_1692)
    {
        _1700 = _1556;
    }
    float _1710 = _1700;
    float _1712 = _1710;
    if (!_1692)
    {
        _1632 = _1682;
    }
    float _1714 = _1632;
    bool _1716 = !_1692;
    float _1718 = _1714;
    if (!_1716)
    {
        float _1720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1724 = _1658 + _1722;
        float _1726 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = rsqrt(_1618);
        float _1730 = _1724 * _1720;
        float _1732 = _1730 * 0.15915493667125701904296875;
        float _1734 = _1732 * 6.283185482025146484375;
        float _1736 = sin(_1734);
        float _1738 = _1732 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = fma(_1736, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1744 = _1728 * _1742;
        float _1746 = fma(_1576, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = _1740 + (-1.0);
        float _1750 = fma(_1580, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1754 = _1746 + _1752;
        float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1760 = _1750 + _1758;
        float _1762 = _1754 * _1754;
        float _1764 = fma(_1682, _1740, _1756);
        float _1766 = _1760 * _1760;
        _1718 = _1764;
        _1634 = _1762;
        _1636 = _1766;
        _1708 = _1746;
        _1712 = _1750;
    }
    float _1768 = _1718;
    float _1770 = _1634;
    float _1772 = _1636;
    float _1774 = _1708;
    float _1776 = _1712;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1780 = _1768 + _1778;
    float _1782 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1784 = fma(_1666, _1614, _1694);
    float _1786 = -_1144;
    float _1788 = fma(_1186, _1514, _1786);
    float _1790 = fma(_1780, _1780, _1770);
    float _1792 = _1782 * _1620;
    float _1794 = fma(_1212, _1680, _1140);
    float _1796 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1798 = _1790 + _1772;
    float _1800 = _868 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1802 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1804 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1784);
    float _1806 = _1684 * _1674;
    float _1808 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1810 = sqrt(_1798);
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = _1794 + 0.5;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1820 = _1788 + 0.5;
    out.m_65.x = _1806;
    out.m_65.y = _1792;
    out.m_65.z = _1816;
    bool _1822 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1824 = isnan(_1810);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1830 = _1826 || _1828;
    out.m_67.x = _1808;
    out.m_67.y = _1812;
    out.m_67.z = _1814;
    out.m_67.w = _1818;
    out.m_65.w = _1820;
    float _1832 = _1820;
    if (!_1830)
    {
        _874 = 1.0;
    }
    float _1834 = _874;
    bool _1836 = !_1830;
    float _1838 = _1834;
    if (!_1836)
    {
        bool _1840 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1842 = isnan(_1810);
        bool _1844 = _1840 || _1842;
        bool _1846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1848 = _1844 || _1846;
        if (!_1848)
        {
            float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1852 = _1810 + _1850;
            float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1856 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1860 = _1858 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1862 = 1.0 / _1856;
            float _1864 = _1852 * _1862;
            float _1866 = fma(_1864, _1860, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1838 = _1866;
            _1868 = true;
        }
        else
        {
            bool _1870 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1872 = isnan(_1810);
            bool _1874 = _1870 || _1872;
            bool _1876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1878 = _1874 || _1876;
            if (!_1878)
            {
                float _1880 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1882 = _1810 + _1880;
                float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1886 = _1884 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1890 = _1888 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1892 = 1.0 / _1886;
                float _1894 = _1882 * _1892;
                float _1896 = fma(_1894, _1890, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1838 = _1896;
                _1868 = true;
            }
            else
            {
                _1838 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1868 = false;
    float _1898 = _1838;
    float _1900 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1902 = _1768 + _1900;
    float _1904 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1906 = _1774 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1910 = _1776 + _1908;
    float _1912 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1914 = fma(_1906, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1916 = fma(_1910, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1918 = -_1228;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    float _1922 = -_1242;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1914);
    float _1926 = -_1278;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1916);
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1932 = _1920 + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1936 = _1924 + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1940 = _1928 + _1938;
    float _1942 = _1932 * _1932;
    float _1944 = fma(_1936, _1936, _1942);
    float _1946 = fma(_1940, _1940, _1944);
    float _1948 = rsqrt(_1946);
    float _1950 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1952 = _1936 * _1950;
    float _1954 = _1940 * _1950;
    float _1956 = _1952 * _1952;
    float _1958 = _1954 * _1954;
    float _1960 = _1956 + _1958;
    float _1962 = sqrt(_1960);
    bool _1964 = _1962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1968 = _1962 + _1966;
    float _1970 = _1144;
    float _1972 = _1960;
    float _1974 = _1968;
    float _1976 = _1932;
    float _1978 = _1950;
    float _1980 = _1952;
    float _1982 = _1956;
    if (_1964)
    {
        float _1984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1984;
    }
    float _1986 = _1970;
    if (_1964)
    {
        float _1988 = rsqrt(_1960);
        _1972 = _1988;
    }
    float _1990 = _1972;
    float _1992 = _1986;
    if (_1964)
    {
        float _1994 = _1968 * _1986;
        _1974 = _1994;
    }
    float _1996 = _1974;
    if (_1964)
    {
        float _1998 = _1996 * 0.15915493667125701904296875;
        _1832 = _1998;
    }
    float _2000 = _1832;
    float _2002 = _1948;
    if (_1964)
    {
        float _2004 = _2000 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        _2002 = _2006;
    }
    float _2008 = _2002;
    float _2010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2012 = precise::max(0.0, _2010);
    float _2014 = _1940;
    float _2016 = _2012;
    if (_1964)
    {
        float _2018 = _2000 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = -_1950;
    float _2026 = -_2012;
    float _2028 = fma(_1932, _2024, _2026);
    if (_1964)
    {
        float _2030 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1976 = _2030;
    }
    float _2032 = _1976;
    float _2034 = _2032;
    float _2036 = _2008;
    if (_1964)
    {
        float _2038 = fma(_2008, _2032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2034 = _2038;
    }
    float _2040 = _2034;
    float _2042 = _2040;
    if (!_1964)
    {
        _2036 = _2028;
    }
    float _2044 = _2036;
    float _2046 = _2044;
    if (_1964)
    {
        float _2048 = _2022 + (-1.0);
        _2016 = _2048;
    }
    float _2050 = _2016;
    float _2052 = _2050;
    if (_1964)
    {
        float _2054 = _1990 * _2040;
        _1978 = _2054;
    }
    float _2056 = _1978;
    if (!_1964)
    {
        _2042 = _1954;
    }
    float _2058 = _2042;
    float _2060 = sqrt(_1946);
    float _2062 = _2058;
    if (_1964)
    {
        float _2064 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2064;
    }
    float _2066 = _1992;
    if (_1964)
    {
        float _2068 = _1952 * _2056;
        _1980 = _2068;
    }
    float _2070 = _1980;
    if (_1964)
    {
        float _2072 = _1954 * _2056;
        _2062 = _2072;
    }
    float _2074 = _2062;
    if (!_1964)
    {
        _2052 = _1958;
    }
    float _2076 = _2052;
    float _2078 = _2076;
    if (_1964)
    {
        float _2080 = fma(_2028, _2022, _2066);
        _2046 = _2080;
    }
    float _2082 = _2046;
    if (_1964)
    {
        float _2084 = _2070 * _2070;
        _1982 = _2084;
    }
    float _2086 = _1982;
    if (_1964)
    {
        float _2088 = _2074 * _2074;
        _2078 = _2088;
    }
    float _2090 = _2078;
    float _2092 = fma(_2082, _2082, _2086);
    float _2094 = _2092 + _2090;
    float _2096 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2100 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2098);
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2106 = rsqrt(_2094);
    float _2108 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2096);
    float _2110 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2112 = -_2102;
    float _2114 = _2112 + 1.0;
    float _2116 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2118 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2108);
    float _2120 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2110);
    float _2122 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2124 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2116);
    float _2126 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2120);
    float _2130 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2122);
    float _2132 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2124);
    float _2134 = abs(_2114);
    float _2136 = log2(_2134);
    float _2138 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2140 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2142 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2144 = _2106 * _2070;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2148 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2130);
    float _2150 = -_2140;
    float _2152 = fma(_2150, _2104, 1.0);
    float _2154 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2156 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2146);
    float _2158 = _2106 * _2082;
    float _2160 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2162 = _2106 * _2074;
    float _2164 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2156);
    float _2166 = -_2154;
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = log2(_2152);
    float _2172 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2174 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2164);
    float _2176 = -_2162;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2182 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = fma(_2178, -0.5, 0.5);
    float _2186 = exp2(_2172);
    float _2188 = fma(_2178, 0.5, 0.5);
    float _2190 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2180);
    float _2192 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2194 = _2158 + 1.0;
    float _2196 = fma(_2188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2198 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2190);
    float _2200 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2192);
    float _2202 = 1.0 / _2174;
    float _2204 = fma(_2188, _2196, -0.212114393711090087890625);
    float _2206 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2198);
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2210 = _2170 * 0.693147182464599609375;
    float _2212 = fma(_2188, _2204, 1.570728778839111328125);
    float _2214 = sqrt(_2184);
    float _2216 = -_2158;
    float _2218 = fma(_2186, _2194, _2216);
    float _2220 = fma(_2218, 0.5, 0.5);
    float _2222 = _2206 * _2202;
    float _2224 = _2208 * _2202;
    float _2226 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2228 = fma(_2222, 0.5, 0.5);
    float _2230 = fma(_2224, -0.5, 0.5);
    float _2232 = _2214 * 0.636619746685028076171875;
    float _2234 = -_2212;
    float _2236 = fma(_2232, _2234, 1.0);
    float3 _5880 = float3(_2228, _2230, _2226);
    float _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5880, float3(0.0), isnan(_5880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5880, float3(0.0), isnan(_5880)), level(0.0)).x;
    float3 _5891 = float3(_2228, _2230, _2226);
    float4 _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5891, float3(0.0), isnan(_5891)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5891, float3(0.0), isnan(_5891)), level(0.0)).xyzw;
    float _2243 = _2241.x;
    float _2245 = _2241.y;
    float _2247 = _2241.z;
    float _2249 = _2241.w;
    float2 _5908 = float2(_2236, _2220);
    float3 _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    float _2261 = -_1228;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _2265 = -_1242;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2269 = -_1278;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _2273 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2275 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2277 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2273);
    float _2279 = fma(_2267, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2275);
    float _2281 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2277);
    float _2283 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2279);
    float _2285 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2287 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2289 = fma(_2267, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2285);
    float _2291 = 1.0 / _2287;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2289);
    float _2295 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2297 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(0.5);
    bool _2305 = _2301 || _2303;
    float _2307 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2281);
    float _2309 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2311 = exp2(_2295);
    float _2313 = _2309 + _2287;
    float _2315 = _2313 * _2291;
    float _2317 = _2315 * 0.5;
    float _2319 = _2291;
    if (_2305)
    {
        _2319 = 1.0;
    }
    float _2321 = _2319;
    float _2323 = _2321;
    if (!_2305)
    {
        float _2325 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2329 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2327);
        float _2331 = _2325 * 0.15915493667125701904296875;
        float _2333 = _2331 * 6.283185482025146484375;
        float _2335 = cos(_2333);
        float _2337 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2339 = _2337 * 0.15915493667125701904296875;
        float _2341 = _2331 * 6.283185482025146484375;
        float _2343 = sin(_2341);
        float _2345 = 1.0 / _2335;
        float _2347 = _2339 * 6.283185482025146484375;
        float _2349 = cos(_2347);
        float _2351 = _2343 * _2345;
        float _2353 = 1.0 / _2329;
        float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2357 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2355;
        float _2359 = _2349 * _2351;
        float _2361 = _2339 * 6.283185482025146484375;
        float _2363 = sin(_2361);
        float _2365 = 1.0 / _2359;
        float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2369 = _2353 * _2367;
        float _2371 = 1.0 / _2357;
        float _2373 = _2363 * _2365;
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2377 = fma(_2373, _2369, _2375);
        float _2379 = _2377 * _2371;
        float _2381 = precise::clamp(_2379, 0.0, 1.0);
        _2323 = _2381;
    }
    float _2383 = _2323;
    float _2385 = -_2311;
    float _2387 = _2385 + 1.0;
    bool _2389 = _2383 > 0.0;
    bool _2391 = isnan(_2383);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2403 = _2307 + _2174;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2407 = _2401 * _2238;
    float _2409 = -_2401;
    float _2411 = _2409 + 1.0;
    out.gl_Position.x = _2206;
    out.gl_Position.y = _2208;
    out.gl_Position.z = _2307;
    out.gl_Position.w = _2174;
    float _2413 = _2403 * 0.5;
    float _2415 = _2249 * _2407;
    float _2417 = _2259 * _2407;
    float _2419 = _2249 * _2411;
    out.m_47.x = _2405;
    float _2421 = fma(_2255, _2415, _2243);
    float _2423 = fma(_2257, _2415, _2245);
    float _2425 = fma(_2249, _2417, _2247);
    out.m_69.z = _2413;
    out.m_69.w = _2174;
    out.m_71.x = _2421;
    out.m_71.y = _2423;
    out.m_71.z = _2425;
    out.m_71.w = _2419;
    if (_2397)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2427 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2427;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1868 = false;
    bool _896 = false;
    bool _724 = false;
    bool _582 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _90 = int(_87);
    bool _94 = _90 >= 1;
    float _96 = 0.0;
    if (!_94)
    {
        _96 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _98 = _96;
    float _100 = _98;
    if (!_94)
    {
        out.m_47.x = 0.0;
    }
    int _102 = 0;
    if (!_94)
    {
        float _104 = _98 * 5.0;
        _102 = as_type<int>(_104);
    }
    int _106 = _102;
    int _108 = _106;
    if (!_94)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2484 = as_type<float>(_106);
        out.gl_Position.z = _2484;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_49.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = 0.0;
    float _128 = _124;
    if (_120)
    {
        float _130 = float(_90);
        _126 = _130;
    }
    float _132 = _126;
    bool _134 = _124 >= _132;
    bool _136 = !_120;
    bool _138 = _134 || _136;
    if (_138)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _100;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    if (_138)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2553 = as_type<float>(_144);
        out.gl_Position.z = _2553;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_44.x;
    float _168 = in.m_44.y;
    float _170 = in.m_44.z;
    float _172 = 0.0;
    float _174 = _148;
    if (!_158)
    {
        float _176 = _148 * _148;
        float _178 = _176 * 0.5;
        _172 = _178;
    }
    float _180 = _172;
    float _182 = _180;
    if (!_158)
    {
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _182 = _184;
    }
    float _186 = _182;
    bool _188 = !_158;
    float _190 = _186;
    if (!_188)
    {
        float _192 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _194 = log2(_192);
        float _196 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _198 = _196 + 1.0;
        float _200 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = _148 * _194;
        float _204 = 1.0 / _198;
        float _206 = _200 * 0.693147182464599609375;
        float _208 = exp2(_202);
        float _210 = 1.0 / _206;
        float _212 = _208 + (-1.0);
        float _214 = -_212;
        float _216 = fma(_214, _210, _148);
        float _218 = _216 * _204;
        float _220 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _220;
    }
    float _222 = _190;
    bool _224 = !_158;
    if (!_224)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = 1.0 / _232;
        float _236 = _148 * _228;
        float _238 = exp2(_236);
        float _240 = -_238;
        float _242 = _240 + 1.0;
        float _244 = _242 * _234;
        _174 = _244;
    }
    float _246 = _174;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _250 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _252 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _254 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _256 = fma(_246, _160, _250);
    float _258 = fma(_246, _162, _252);
    float _260 = fma(_246, _164, _254);
    float _262 = fma(_256, _146, _166);
    float _264 = fma(_258, _146, _168);
    float _266 = fma(_260, _146, _170);
    bool _268 = !_248;
    float _286;
    if (!_268)
    {
        float _270 = in.m_53.x;
        float _272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _274 = _270 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _276 = fma(_274, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _278 = _276 * _272;
        float _280 = floor(_278);
        float _282 = -_280;
        float _284 = _278 + _282;
        _286 = _284;
        _288 = true;
    }
    else
    {
        float _290 = float(_90);
        float _292 = 1.0 / _290;
        float _294 = _124 * _292;
        _286 = _294;
    }
    _288 = false;
    float _296 = _286;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -_312;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = 1.0 / _316;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _342 = _328 * _332;
    float _344 = -_328;
    float _346 = _344 + 1.0;
    float _348 = _300 * _338;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _350;
    float _354 = fma(_336, _348, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _356;
    float _360 = fma(_352, _348, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = _354 * _342;
    float _364 = fma(_358, _348, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _366 = _360 * _342;
    float _368 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _370 = _364 * _342;
    float _372 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _370);
    float _376 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _366);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_53.x;
        float _386 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _388 = _384 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _390 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[11].x, _124);
        float _392 = _390 * _386;
        float _394 = floor(_392);
        float _396 = -_394;
        float _398 = _392 + _396;
        _400 = _398;
        _402 = true;
    }
    else
    {
        float _404 = float(_90);
        float _406 = 1.0 / _404;
        float _408 = _124 * _406;
        _400 = _408;
    }
    _402 = false;
    float _410 = _400;
    float _412 = in.m_51.x;
    float _414 = in.m_51.y;
    float _416 = in.m_51.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _420 = _410 + _418;
    bool _422 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _424 = isnan(_410);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _434;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _436;
    float _442 = _380 * _416;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _448 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _450 = isnan(_410);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    float _460 = _378 * _414;
    float _462 = _420 * _440;
    float _464 = 1.0 / _446;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _468 = _410 + _466;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = _372 * _412;
    float _488 = _480 * _484;
    float _490 = -_480;
    float _492 = _490 + 1.0;
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _494;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = _458 * _492;
    float _508 = fma(_496, _462, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _510 = fma(_500, _462, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _512 = fma(_504, _462, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _468 * _464;
    float _516 = _508 * _506;
    float _518 = _510 * _506;
    float _520 = _512 * _506;
    float _522 = -_458;
    float _524 = _522 + 1.0;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].x, _516);
    float _540 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].y, _518);
    float _542 = fma(_528, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _544 = fma(_532, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _546 = fma(_536, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[107].z, _520);
    float _550 = fma(_542, _488, _538);
    float _552 = fma(_544, _488, _540);
    float _554 = fma(_546, _488, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_438;
    float _580;
    if (!_562)
    {
        float _564 = in.m_53.x;
        float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _568 = _564 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _570 = fma(_568, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _572 = _570 * _566;
        float _574 = floor(_572);
        float _576 = -_574;
        float _578 = _572 + _576;
        _580 = _578;
        _582 = true;
    }
    else
    {
        float _584 = float(_90);
        float _586 = 1.0 / _584;
        float _588 = _124 * _586;
        _580 = _588;
    }
    _582 = false;
    float _590 = _580;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _594 = _590 + _592;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _600 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _602 = isnan(_590);
    bool _604 = _600 || _602;
    bool _606 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _608 = _604 || _606;
    float _610 = float(_608);
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _616 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _618 = isnan(_590);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _628;
    bool _632 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _634 = isnan(_590);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = 1.0 / _598;
    float _646 = -_610;
    float _648 = _646 + 1.0;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _652 = _590 + _650;
    bool _654 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _656 = _626 * _648;
    float _658 = -_626;
    float _660 = _658 + 1.0;
    float _662 = 1.0 / _614;
    float _664 = _630 * _644;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _670 = fma(_664, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _672 = _668 * _662;
    float _674 = -_642;
    float _676 = _674 + 1.0;
    float _678 = _670 * _656;
    float _680 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = fma(_672, _652, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _684 = _610 * _676;
    float _686 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[115].x, _678);
    float _688 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _690 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = fma(_682, _684, _686);
    float _694 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _696 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _698 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _700 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _690;
    out.m_55.y = _696;
    out.m_55.z = _700;
    out.m_55.w = _702;
    bool _704 = !_654;
    float _722;
    if (!_704)
    {
        float _706 = in.m_53.x;
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _710 = _706 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _712 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _714 = _712 * _708;
        float _716 = floor(_714);
        float _718 = -_716;
        float _720 = _714 + _718;
        _722 = _720;
        _724 = true;
    }
    else
    {
        float _726 = float(_90);
        float _728 = 1.0 / _726;
        float _730 = _124 * _728;
        _722 = _730;
    }
    _724 = false;
    float _732 = _722;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _736 = _732 + _734;
    bool _738 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _740 = isnan(_732);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _752 = _732 + _750;
    bool _754 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _756 = isnan(_732);
    bool _758 = _754 || _756;
    bool _760 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _762 = _758 || _760;
    float _764 = float(_762);
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _774 = _732 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _776 = isnan(_732);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = 1.0 / _768;
    float _788 = -_784;
    float _790 = _788 + 1.0;
    bool _792 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _794 = _764 * _790;
    float _796 = -_764;
    float _798 = _796 + 1.0;
    float _800 = 1.0 / _772;
    float _802 = _736 * _786;
    float _804 = -_748;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _808;
    float _812 = _784 * _806;
    float _814 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _814;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _818;
    float _822 = fma(_810, _802, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _824 = _752 * _800;
    float _826 = fma(_816, _802, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _828 = fma(_820, _802, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _830 = _822 * _794;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _834 = _832 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _836 = _826 * _794;
    float _838 = _828 * _794;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _842 = _840 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _848 = fma(_834, _824, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _850 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].x, _836);
    float _852 = fma(_842, _824, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _854 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].y, _830);
    float _856 = fma(_846, _824, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _858 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[123].z, _838);
    float _860 = fma(_852, _812, _850);
    float _862 = fma(_848, _812, _854);
    float _864 = fma(_856, _812, _858);
    float _866 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].x, _860);
    float _868 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].y, _862);
    float _870 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[125].z, _864);
    bool _872 = !_792;
    float _874 = _866;
    float _892;
    float _894;
    if (!_872)
    {
        float _876 = in.m_53.x;
        float _878 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _880 = _876 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _882 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _884 = _882 * _878;
        float _886 = floor(_884);
        float _888 = -_886;
        float _890 = _884 + _888;
        _892 = _884;
        _894 = _890;
        _896 = true;
    }
    else
    {
        float _898 = float(_90);
        float _900 = 1.0 / _898;
        float _902 = _124 * _900;
        _892 = _900;
        _894 = _902;
    }
    _896 = false;
    float _904 = _892;
    float _906 = _894;
    float _908 = in.m_53.z;
    float _910 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _914 = _912 != 0;
    float _916 = in.m_53.x;
    float _918 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _920 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _922 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _910);
    float _924 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _918);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _928 = 1.0 + _926;
    out.m_57.x = 1.0;
    out.m_57.y = 1.0;
    out.m_57.z = 1.0;
    float _930 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _920);
    float _932 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _922);
    float _934 = _904;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (!_914)
    {
        float _938 = in.m_53.y;
        _934 = _938;
    }
    float _940 = _934;
    float _942 = _932 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _948 = 1.0 / _928;
    float _950 = _908 * 2.0;
    float _952 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _954 = _916 * 2.0;
    float _956 = _486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _958 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _960 = floor(_950);
    float _962 = in.m_59.x;
    float _964 = floor(_954);
    if (!_914)
    {
        _936 = _940;
    }
    float _966 = _936;
    float _968 = _966;
    float _970 = _940;
    if (_914)
    {
        float _972 = in.m_53.x;
        float _974 = in.m_53.y;
        _968 = _972;
        _970 = _974;
    }
    float _976 = _968;
    float _978 = _970;
    bool _980 = _960 > 0.0;
    float _982 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _984 = log2(_982);
    bool _986 = _960 >= 0.0;
    bool _988 = isnan(_960);
    bool _990 = _986 || _988;
    bool _992 = isnan(0.0);
    bool _994 = _990 || _992;
    float _996 = _994 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1004 = _1002 != 0;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1008 = _1006 != 0;
    float _1010 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _924);
    float _1012 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _930);
    bool _1014 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1016 = isnan(1.0);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1022 = _1018 || _1020;
    float _1024 = _1010 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1026 = _1012 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1028 = ~as_type<int>(_996);
    int _1030 = _1028 + 1;
    int _1032 = _1030 + 1;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _1036 = _1032;
    float _1038 = _996;
    if (!_980)
    {
        int _1040 = ~as_type<int>(_996);
        int _1042 = _1040 + 1;
        _1036 = _1042;
    }
    int _1044 = _1036;
    float _1046 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_914)
    {
        _1038 = _908;
    }
    float _1048 = _1038;
    float _1050 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1052 = _1024 + _1050;
    bool _1054 = _964 > 0.0;
    float _1056 = _978 * 2.0;
    float _1058 = _1048;
    if (_914)
    {
        _1058 = _978;
    }
    float _1060 = _1058;
    float _1062 = _976 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1064 = _964 >= 0.0;
    bool _1066 = isnan(_964);
    bool _1068 = _1064 || _1066;
    bool _1070 = isnan(0.0);
    bool _1072 = _1068 || _1070;
    float _1074 = floor(_1056);
    float _1076 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1034);
    float _1078 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1046);
    float _1080 = _1060;
    if (!_914)
    {
        _1080 = _908;
    }
    float _1082 = _1080;
    float _1084 = _916 + _978;
    float _1086 = -_944;
    float _1088 = fma(_1062, 2.0, _1086);
    float _1090 = _1082;
    if (_914)
    {
        _1090 = _978;
    }
    float _1092 = _1090;
    float _1094 = _984 * _124;
    int _1096 = _1072 ? 0 : 1;
    float _1098 = _908 + _978;
    float _1100 = _1084 + (-1.0);
    float _1102 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1104 = ~_1096;
    int _1106 = _1104 + 1;
    int _1108 = _1106 + 1;
    float _1110 = _1098 + (-1.0);
    int _1112 = _1108;
    if (!_1054)
    {
        int _1114 = ~_1096;
        int _1116 = _1114 + 1;
        _1112 = _1116;
    }
    int _1118 = _1112;
    float _1120 = fma(_1100, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1122 = !_1000;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1102, -2.0, _946);
    float _1128 = fma(_1110, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1130 = !_1004;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = exp2(_1094);
    int _1136 = abs(_1124);
    float _1138 = -_124;
    float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1088);
    bool _1142 = _1074 > 0.0;
    float _1144 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1126);
    bool _1146 = _1074 >= 0.0;
    bool _1148 = isnan(_1074);
    bool _1150 = _1146 || _1148;
    bool _1152 = isnan(0.0);
    bool _1154 = _1150 || _1152;
    float _1156 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1158 = _942 + _1156;
    int _1160 = abs(_1132);
    float _1162 = _1052 * _1052;
    float _1164 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1166 = _1026 + _1164;
    float _1168 = float(_1044);
    float _1170 = fma(_1158, _1158, _1162);
    float _1172 = float(_1136);
    float _1174 = in.m_61.x;
    float _1176 = in.m_61.y;
    float _1178 = in.m_61.z;
    float _1180 = fma(_1166, _1166, _1170);
    float _1182 = float(_1118);
    float _1184 = _1172 * _1168;
    float _1186 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1078);
    float _1188 = rsqrt(_1180);
    float _1190 = -_1134;
    float _1192 = _1190 + 1.0;
    float _1194 = _1184 * (-2.0);
    bool _1196 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1198 = isnan(0.0);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1160);
    float _1208 = fma(_1120, _1194, _1120);
    float _1210 = _1204 ? _1192 : 0.0;
    float _1212 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1076);
    float _1214 = _1206 * _1182;
    int _1216 = _1154 ? 0 : 1;
    if (_1022)
    {
        float _1218 = _1210 * _948;
        _128 = _1218;
    }
    float _1220 = _128;
    float _1222 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1224 = _1222 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1226 = _1214 * (-2.0);
    float _1228 = _1052 * _1188;
    int _1230 = ~_1216;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = fma(_1194, _1174, _1174);
    float _1238 = -_1228;
    float _1240 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1052);
    float _1242 = _1158 * _1188;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1248 = !_1008;
    int _1250 = _1248 ? 0 : 1;
    float _1252 = _1240 * _1240;
    float _1254 = -_1242;
    float _1256 = fma(_1254, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1158);
    int _1258 = _1234;
    if (!_1142)
    {
        int _1260 = ~_1216;
        int _1262 = _1260 + 1;
        _1258 = _1262;
    }
    int _1264 = _1258;
    float _1266 = fma(_1128, _1226, _1128);
    int _1268 = abs(_1250);
    float _1270 = fma(_1256, _1256, _1252);
    float _1272 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1274 = _1272 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1276 = in.m_53.w;
    float _1278 = _1166 * _1188;
    float _1280 = _916 + (-0.5);
    float _1282 = float(_1268);
    float _1284 = fma(_1226, _1176, _1176);
    float _1286 = -_1278;
    float _1288 = fma(_1286, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1166);
    float _1290 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1236);
    float _1292 = float(_1264);
    float _1294 = _916 + _908;
    float _1296 = fma(_1288, _1288, _1270);
    float _1298 = fma(_1208, _1220, _1290);
    float _1300 = 1.0 / _1224;
    float _1302 = _1282 * _1292;
    float _1304 = _1294 + (-1.0);
    float _1306 = in.m_63.x;
    float _1308 = in.m_63.y;
    float _1310 = in.m_63.z;
    float _1312 = _1298 * 0.15915493667125701904296875;
    float _1314 = _978 + (-0.5);
    float _1316 = _1302 * (-2.0);
    float _1318 = 1.0 / _1246;
    float _1320 = fma(_1314, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1284);
    float _1322 = in.m_59.w;
    int _1324 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1326 = _1324 != 0;
    bool _1328 = _1276 > 0.5;
    float _1330 = fma(_1304, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1332 = fma(_1266, _1220, _1320);
    float _1334 = fma(_1316, _1178, _1178);
    float _1336 = _908 + (-0.5);
    float _1338 = fma(_1330, _1316, _1330);
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1342 = _1340 != 0;
    float _1344 = sqrt(_1296);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1334);
    float _1348 = _1332 * 0.15915493667125701904296875;
    int _1350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1352 = _1350 != 0;
    float _1354 = fma(_1338, _1220, _1346);
    float _1356 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1310);
    int _1358 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1360 = _1358 != 0;
    float _1362 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1308);
    bool _1364 = _908 > 0.5;
    bool _1366 = _1364 && _1342;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1368;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1376 = _1354 * 0.15915493667125701904296875;
    float _1378 = _1312 * 6.283185482025146484375;
    float _1380 = sin(_1378);
    float _1382 = _1370 * _1300;
    float _1384 = _1374 * _1318;
    float _1386 = _1188 * _1344;
    float _1388 = -_1322;
    float _1390 = _1388 + 1.0;
    float _1392 = in.m_59.z;
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1396 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1394;
    float _1398 = _1312 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _952 * _1386;
    float _1404 = _956 * _1386;
    float _1406 = _958 * _1386;
    float _1408 = _1322;
    if (_1326)
    {
        float _1410 = _1328 ? _1390 : _1322;
        _1408 = _1410;
    }
    float _1412 = _1408;
    float _1414 = _1402 * _1362;
    bool _1416 = _916 > 0.5;
    bool _1418 = _1416 && _1352;
    float _1420 = _1406 * _1356;
    float _1422 = 1.0 / _1274;
    float _1424 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1306);
    float _1426 = 0.0;
    if (_1352)
    {
        _1426 = _962;
    }
    float _1428 = _1426;
    float _1430 = _1404 * _1424;
    float _1432 = _1348 * 6.283185482025146484375;
    float _1434 = sin(_1432);
    float _1436 = _1428;
    if (_1418)
    {
        float _1438 = -_1428;
        float _1440 = _1438 + 1.0;
        _1436 = _1440;
    }
    float _1442 = _1436;
    bool _1444 = _978 > 0.5;
    float _1446 = _1348 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = _1396 * _1422;
    float _1452 = _1376 * 6.283185482025146484375;
    float _1454 = cos(_1452);
    float _1456 = _1400 * _1434;
    float _1458 = _1380 * _1434;
    float _1460 = _1376 * 6.283185482025146484375;
    float _1462 = sin(_1460);
    float _1464 = _1380 * _1448;
    float _1466 = _1400 * _1448;
    float _1468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1470 = _1454 * _1414;
    float _1472 = _1448 * _1454;
    float _1474 = _1400 * _1470;
    float _1476 = _1380 * _1470;
    float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1480 = _906 + _1478;
    float _1482 = -_1456;
    float _1484 = fma(_1462, _1464, _1482);
    float _1486 = -_1464;
    float _1488 = fma(_1462, _1456, _1486);
    float _1490 = fma(_1462, _1466, _1458);
    float _1492 = -_1414;
    float _1494 = _1462 * _1492;
    float _1496 = fma(_1462, _1458, _1466);
    float _1498 = _1434 * _1454;
    float _1500 = fma(_1490, _1430, _1474);
    float _1502 = fma(_1472, _1430, _1494);
    float _1504 = fma(_1484, _1430, _1476);
    float _1506 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1508 = fma(_1488, _1420, _1500);
    float _1510 = fma(_1498, _1420, _1502);
    float _1512 = fma(_1496, _1420, _1504);
    float _1514 = fma(_1506, _1412, -0.5);
    float _1516 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1518 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1520 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1522 = _906 + _1520;
    float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1526 = _906 + _1524;
    float _1528 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1516);
    float _1530 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1518);
    float _1532 = fma(_1382, _1522, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1534 = fma(_1384, _1526, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1536 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1528);
    float _1538 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1530);
    bool _1540 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1542 = isnan(_906);
    bool _1544 = _1540 || _1542;
    bool _1546 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1548 = _1544 || _1546;
    float _1550 = float(_1548);
    float _1552 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1554 = _942 + _1536;
    float _1556 = _1026 + _1538;
    bool _1558 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1560 = isnan(_906);
    bool _1562 = _1558 || _1560;
    bool _1564 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1566 = _1562 || _1564;
    float _1568 = float(_1566);
    float _1570 = -_1550;
    float _1572 = _1570 + 1.0;
    float _1574 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1576 = _1554 + _1574;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1580 = _1556 + _1578;
    bool _1582 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1584 = isnan(_906);
    bool _1586 = _1582 || _1584;
    bool _1588 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1590 = _1586 || _1588;
    float _1592 = float(_1590);
    float _1594 = -_1568;
    float _1596 = _1594 + 1.0;
    float _1598 = _1576 * _1576;
    float _1600 = _1580 * _1580;
    bool _1602 = _906 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1604 = isnan(_906);
    bool _1606 = _1602 || _1604;
    bool _1608 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1610 = _1606 || _1608;
    float _1612 = float(_1610);
    float _1614 = _1550 * _1596;
    float _1616 = in.m_59.y;
    float _1618 = _1598 + _1600;
    float _1620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1622 = -_1612;
    float _1624 = _1622 + 1.0;
    float _1626 = _1612 * _1572;
    float _1628 = _1572;
    float _1630 = _1612;
    float _1632 = _1554;
    float _1634 = _1598;
    float _1636 = _1600;
    if (!_1352)
    {
        _1628 = _962;
    }
    float _1638 = _1628;
    float _1640 = _1508 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1642 = _1392;
    float _1644 = _1638;
    if (!_1342)
    {
        _1630 = _1392;
    }
    float _1646 = _1630;
    float _1648 = _1592 * _1624;
    float _1650 = _1646;
    if (_1366)
    {
        float _1652 = -_1392;
        float _1654 = _1652 + 1.0;
        _1642 = _1654;
    }
    float _1656 = _1642;
    float _1658 = sqrt(_1618);
    if (_1352)
    {
        _1644 = _1442;
    }
    float _1660 = _1644;
    float _1662 = _1532 * _1648;
    float _1664 = fma(_1510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1640);
    float _1666 = fma(_1450, _1480, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    if (_1342)
    {
        _1650 = _1656;
    }
    float _1668 = _1650;
    float _1670 = _1552 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1672 = fma(_1512, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1664);
    float _1674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1676 = -_1592;
    float _1678 = _1676 + 1.0;
    float _1680 = fma(_1670, _1668, -0.5);
    float _1682 = _1024 + _1672;
    float _1684 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1686 = fma(_1678, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1662);
    float _1688 = -_1616;
    float _1690 = _1688 + 1.0;
    bool _1692 = _1658 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1694 = fma(_1534, _1626, _1686);
    float _1696 = _1616;
    float _1698 = _1672;
    float _1700 = _1690;
    if (_1360)
    {
        float _1702 = _1444 ? _1690 : _1616;
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (!_1692)
    {
        _1698 = _1554;
    }
    float _1706 = _1698;
    float _1708 = _1706;
    if (!_1692)
    {
        _1700 = _1556;
    }
    float _1710 = _1700;
    float _1712 = _1710;
    if (!_1692)
    {
        _1632 = _1682;
    }
    float _1714 = _1632;
    bool _1716 = !_1692;
    float _1718 = _1714;
    if (!_1716)
    {
        float _1720 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1722 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1724 = _1658 + _1722;
        float _1726 = _1682 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1728 = rsqrt(_1618);
        float _1730 = _1724 * _1720;
        float _1732 = _1730 * 0.15915493667125701904296875;
        float _1734 = _1732 * 6.283185482025146484375;
        float _1736 = sin(_1734);
        float _1738 = _1732 * 6.283185482025146484375;
        float _1740 = cos(_1738);
        float _1742 = fma(_1736, _1726, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1744 = _1728 * _1742;
        float _1746 = fma(_1576, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1748 = _1740 + (-1.0);
        float _1750 = fma(_1580, _1744, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1754 = _1746 + _1752;
        float _1756 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1758 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1760 = _1750 + _1758;
        float _1762 = _1754 * _1754;
        float _1764 = fma(_1682, _1740, _1756);
        float _1766 = _1760 * _1760;
        _1718 = _1764;
        _1634 = _1762;
        _1636 = _1766;
        _1708 = _1746;
        _1712 = _1750;
    }
    float _1768 = _1718;
    float _1770 = _1634;
    float _1772 = _1636;
    float _1774 = _1708;
    float _1776 = _1712;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1780 = _1768 + _1778;
    float _1782 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1784 = fma(_1666, _1614, _1694);
    float _1786 = -_1144;
    float _1788 = fma(_1186, _1514, _1786);
    float _1790 = fma(_1780, _1780, _1770);
    float _1792 = _1782 * _1620;
    float _1794 = fma(_1212, _1680, _1140);
    float _1796 = _866 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1798 = _1790 + _1772;
    float _1800 = _868 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1802 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1804 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1784);
    float _1806 = _1684 * _1674;
    float _1808 = _1796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1810 = sqrt(_1798);
    float _1812 = _1800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1816 = _1794 + 0.5;
    float _1818 = _1804 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1820 = _1788 + 0.5;
    out.m_65.x = _1806;
    out.m_65.y = _1792;
    out.m_65.z = _1816;
    bool _1822 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1824 = isnan(_1810);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1830 = _1826 || _1828;
    out.m_67.x = _1808;
    out.m_67.y = _1812;
    out.m_67.z = _1814;
    out.m_67.w = _1818;
    out.m_65.w = _1820;
    float _1832 = _1820;
    if (!_1830)
    {
        _874 = 1.0;
    }
    float _1834 = _874;
    bool _1836 = !_1830;
    float _1838 = _1834;
    if (!_1836)
    {
        bool _1840 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1842 = isnan(_1810);
        bool _1844 = _1840 || _1842;
        bool _1846 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1848 = _1844 || _1846;
        if (!_1848)
        {
            float _1850 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1852 = _1810 + _1850;
            float _1854 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1856 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1854;
            float _1858 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1860 = _1858 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1862 = 1.0 / _1856;
            float _1864 = _1852 * _1862;
            float _1866 = fma(_1864, _1860, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1838 = _1866;
            _1868 = true;
        }
        else
        {
            bool _1870 = _1810 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1872 = isnan(_1810);
            bool _1874 = _1870 || _1872;
            bool _1876 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1878 = _1874 || _1876;
            if (!_1878)
            {
                float _1880 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1882 = _1810 + _1880;
                float _1884 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1886 = _1884 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1888 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1890 = _1888 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1892 = 1.0 / _1886;
                float _1894 = _1882 * _1892;
                float _1896 = fma(_1894, _1890, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1838 = _1896;
                _1868 = true;
            }
            else
            {
                _1838 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1868 = false;
    float _1898 = _1838;
    float _1900 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1902 = _1768 + _1900;
    float _1904 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1906 = _1774 + _1904;
    float _1908 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1910 = _1776 + _1908;
    float _1912 = fma(_1902, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1914 = fma(_1906, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1916 = fma(_1910, _1898, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1918 = -_1228;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1912);
    float _1922 = -_1242;
    float _1924 = fma(_1922, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1914);
    float _1926 = -_1278;
    float _1928 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1916);
    float _1930 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1932 = _1920 + _1930;
    float _1934 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1936 = _1924 + _1934;
    float _1938 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1940 = _1928 + _1938;
    float _1942 = _1932 * _1932;
    float _1944 = fma(_1936, _1936, _1942);
    float _1946 = fma(_1940, _1940, _1944);
    float _1948 = rsqrt(_1946);
    float _1950 = _1948 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1952 = _1936 * _1950;
    float _1954 = _1940 * _1950;
    float _1956 = _1952 * _1952;
    float _1958 = _1954 * _1954;
    float _1960 = _1956 + _1958;
    float _1962 = sqrt(_1960);
    bool _1964 = _1962 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1968 = _1962 + _1966;
    float _1970 = _1144;
    float _1972 = _1960;
    float _1974 = _1968;
    float _1976 = _1932;
    float _1978 = _1950;
    float _1980 = _1952;
    float _1982 = _1956;
    if (_1964)
    {
        float _1984 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1970 = _1984;
    }
    float _1986 = _1970;
    if (_1964)
    {
        float _1988 = rsqrt(_1960);
        _1972 = _1988;
    }
    float _1990 = _1972;
    float _1992 = _1986;
    if (_1964)
    {
        float _1994 = _1968 * _1986;
        _1974 = _1994;
    }
    float _1996 = _1974;
    if (_1964)
    {
        float _1998 = _1996 * 0.15915493667125701904296875;
        _1832 = _1998;
    }
    float _2000 = _1832;
    float _2002 = _1948;
    if (_1964)
    {
        float _2004 = _2000 * 6.283185482025146484375;
        float _2006 = sin(_2004);
        _2002 = _2006;
    }
    float _2008 = _2002;
    float _2010 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2012 = precise::max(0.0, _2010);
    float _2014 = _1940;
    float _2016 = _2012;
    if (_1964)
    {
        float _2018 = _2000 * 6.283185482025146484375;
        float _2020 = cos(_2018);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = -_1950;
    float _2026 = -_2012;
    float _2028 = fma(_1932, _2024, _2026);
    if (_1964)
    {
        float _2030 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1976 = _2030;
    }
    float _2032 = _1976;
    float _2034 = _2032;
    float _2036 = _2008;
    if (_1964)
    {
        float _2038 = fma(_2008, _2032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2034 = _2038;
    }
    float _2040 = _2034;
    float _2042 = _2040;
    if (!_1964)
    {
        _2036 = _2028;
    }
    float _2044 = _2036;
    float _2046 = _2044;
    if (_1964)
    {
        float _2048 = _2022 + (-1.0);
        _2016 = _2048;
    }
    float _2050 = _2016;
    float _2052 = _2050;
    if (_1964)
    {
        float _2054 = _1990 * _2040;
        _1978 = _2054;
    }
    float _2056 = _1978;
    if (!_1964)
    {
        _2042 = _1954;
    }
    float _2058 = _2042;
    float _2060 = sqrt(_1946);
    float _2062 = _2058;
    if (_1964)
    {
        float _2064 = _2050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2064;
    }
    float _2066 = _1992;
    if (_1964)
    {
        float _2068 = _1952 * _2056;
        _1980 = _2068;
    }
    float _2070 = _1980;
    if (_1964)
    {
        float _2072 = _1954 * _2056;
        _2062 = _2072;
    }
    float _2074 = _2062;
    if (!_1964)
    {
        _2052 = _1958;
    }
    float _2076 = _2052;
    float _2078 = _2076;
    if (_1964)
    {
        float _2080 = fma(_2028, _2022, _2066);
        _2046 = _2080;
    }
    float _2082 = _2046;
    if (_1964)
    {
        float _2084 = _2070 * _2070;
        _1982 = _2084;
    }
    float _2086 = _1982;
    if (_1964)
    {
        float _2088 = _2074 * _2074;
        _2078 = _2088;
    }
    float _2090 = _2078;
    float _2092 = fma(_2082, _2082, _2086);
    float _2094 = _2092 + _2090;
    float _2096 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2100 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2098);
    float _2102 = precise::clamp(_2100, 0.0, 1.0);
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2106 = rsqrt(_2094);
    float _2108 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2096);
    float _2110 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2112 = -_2102;
    float _2114 = _2112 + 1.0;
    float _2116 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2118 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2108);
    float _2120 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2110);
    float _2122 = _1920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2124 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2116);
    float _2126 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2128 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2120);
    float _2130 = fma(_1924, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2122);
    float _2132 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2124);
    float _2134 = abs(_2114);
    float _2136 = log2(_2134);
    float _2138 = _2128 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2140 = _2126 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2142 = _2132 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2144 = _2106 * _2070;
    float _2146 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2148 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2130);
    float _2150 = -_2140;
    float _2152 = fma(_2150, _2104, 1.0);
    float _2154 = _2144 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2156 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2146);
    float _2158 = _2106 * _2082;
    float _2160 = _2148 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2162 = _2106 * _2074;
    float _2164 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2156);
    float _2166 = -_2154;
    float _2168 = fma(_2158, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2166);
    float _2170 = log2(_2152);
    float _2172 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2174 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2164);
    float _2176 = -_2162;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2168);
    float _2180 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2182 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2184 = fma(_2178, -0.5, 0.5);
    float _2186 = exp2(_2172);
    float _2188 = fma(_2178, 0.5, 0.5);
    float _2190 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2180);
    float _2192 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2182);
    float _2194 = _2158 + 1.0;
    float _2196 = fma(_2188, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2198 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2190);
    float _2200 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2192);
    float _2202 = 1.0 / _2174;
    float _2204 = fma(_2188, _2196, -0.212114393711090087890625);
    float _2206 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2198);
    float _2208 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2200);
    float _2210 = _2170 * 0.693147182464599609375;
    float _2212 = fma(_2188, _2204, 1.570728778839111328125);
    float _2214 = sqrt(_2184);
    float _2216 = -_2158;
    float _2218 = fma(_2186, _2194, _2216);
    float _2220 = fma(_2218, 0.5, 0.5);
    float _2222 = _2206 * _2202;
    float _2224 = _2208 * _2202;
    float _2226 = _2210 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2228 = fma(_2222, 0.5, 0.5);
    float _2230 = fma(_2224, -0.5, 0.5);
    float _2232 = _2214 * 0.636619746685028076171875;
    float _2234 = -_2212;
    float _2236 = fma(_2232, _2234, 1.0);
    float3 _5880 = float3(_2228, _2230, _2226);
    float _2238 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5880, float3(0.0), isnan(_5880)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5880, float3(0.0), isnan(_5880)), level(0.0)).x;
    float3 _5891 = float3(_2228, _2230, _2226);
    float4 _2241 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5891, float3(0.0), isnan(_5891)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5891, float3(0.0), isnan(_5891)), level(0.0)).xyzw;
    float _2243 = _2241.x;
    float _2245 = _2241.y;
    float _2247 = _2241.z;
    float _2249 = _2241.w;
    float2 _5908 = float2(_2236, _2220);
    float3 _2253 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5908, float2(0.0), isnan(_5908)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5908, float2(0.0), isnan(_5908)), level(0.0)).xyz;
    float _2255 = _2253.x;
    float _2257 = _2253.y;
    float _2259 = _2253.z;
    float _2261 = -_1228;
    float _2263 = fma(_2261, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _2265 = -_1242;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c9)._m0[18].w, _942);
    float _2269 = -_1278;
    float _2271 = fma(_2269, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1026);
    float _2273 = _2138 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2275 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2277 = fma(_2142, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2273);
    float _2279 = fma(_2267, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2275);
    float _2281 = fma(_2126, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2277);
    float _2283 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2279);
    float _2285 = _2263 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2287 = _2283 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2289 = fma(_2267, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2285);
    float _2291 = 1.0 / _2287;
    float _2293 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2289);
    float _2295 = _2136 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2297 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2301 = _2297 || _2299;
    bool _2303 = isnan(0.5);
    bool _2305 = _2301 || _2303;
    float _2307 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2281);
    float _2309 = _2293 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2311 = exp2(_2295);
    float _2313 = _2309 + _2287;
    float _2315 = _2313 * _2291;
    float _2317 = _2315 * 0.5;
    float _2319 = _2291;
    if (_2305)
    {
        _2319 = 1.0;
    }
    float _2321 = _2319;
    float _2323 = _2321;
    if (!_2305)
    {
        float _2325 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2327 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2329 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2327);
        float _2331 = _2325 * 0.15915493667125701904296875;
        float _2333 = _2331 * 6.283185482025146484375;
        float _2335 = cos(_2333);
        float _2337 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2339 = _2337 * 0.15915493667125701904296875;
        float _2341 = _2331 * 6.283185482025146484375;
        float _2343 = sin(_2341);
        float _2345 = 1.0 / _2335;
        float _2347 = _2339 * 6.283185482025146484375;
        float _2349 = cos(_2347);
        float _2351 = _2343 * _2345;
        float _2353 = 1.0 / _2329;
        float _2355 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2357 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2355;
        float _2359 = _2349 * _2351;
        float _2361 = _2339 * 6.283185482025146484375;
        float _2363 = sin(_2361);
        float _2365 = 1.0 / _2359;
        float _2367 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2369 = _2353 * _2367;
        float _2371 = 1.0 / _2357;
        float _2373 = _2363 * _2365;
        float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2377 = fma(_2373, _2369, _2375);
        float _2379 = _2377 * _2371;
        float _2381 = precise::clamp(_2379, 0.0, 1.0);
        _2323 = _2381;
    }
    float _2383 = _2323;
    float _2385 = -_2311;
    float _2387 = _2385 + 1.0;
    bool _2389 = _2383 > 0.0;
    bool _2391 = isnan(_2383);
    bool _2393 = _2389 || _2391;
    bool _2395 = isnan(0.0);
    bool _2397 = _2393 || _2395;
    float _2399 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2401 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2403 = _2307 + _2174;
    float _2405 = _2399 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2407 = _2401 * _2238;
    float _2409 = -_2401;
    float _2411 = _2409 + 1.0;
    out.gl_Position.x = _2206;
    out.gl_Position.y = _2208;
    out.gl_Position.z = _2307;
    out.gl_Position.w = _2174;
    float _2413 = _2403 * 0.5;
    float _2415 = _2249 * _2407;
    float _2417 = _2259 * _2407;
    float _2419 = _2249 * _2411;
    out.m_47.x = _2405;
    float _2421 = fma(_2255, _2415, _2243);
    float _2423 = fma(_2257, _2415, _2245);
    float _2425 = fma(_2249, _2417, _2247);
    out.m_69.z = _2413;
    out.m_69.w = _2174;
    out.m_71.x = _2421;
    out.m_71.y = _2423;
    out.m_71.z = _2425;
    out.m_71.w = _2419;
    if (_2397)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2427 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2427;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

