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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_53 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_59 [[attribute(9)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _800 = false;
    bool _582 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2080 = as_type<float>(_106);
        out.gl_Position.z = _2080;
    }
    if (!_94)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2150 = as_type<float>(_144);
        out.gl_Position.z = _2150;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
        float _270 = in.m_51.x;
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
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _368 = _364 * _342;
    float _370 = _360 * _342;
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
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
    float _412 = in.m_49.x;
    float _414 = in.m_49.y;
    float _416 = in.m_49.z;
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
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _442 = 1.0 / _436;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _446 = 1.0 / _440;
    float _448 = _380 * _416;
    float _450 = _378 * _414;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _454 = _410 + _452;
    bool _456 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _420 * _442;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _376 * _412;
    float _492 = _480 * _484;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _468, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = _466 * _496;
    float _510 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_504, _468, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _454 * _446;
    float _516 = _506 * _508;
    float _518 = _510 * _508;
    float _520 = _512 * _508;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_466;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_524, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _516);
    float _544 = fma(_532, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_536, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _520);
    float _550 = fma(_538, _492, _542);
    float _552 = fma(_544, _492, _540);
    float _554 = fma(_546, _492, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_444;
    float _580;
    if (!_562)
    {
        float _564 = in.m_51.x;
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
    float _596 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = isnan(_590);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = 1.0 / _600;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _628 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _630 = isnan(_590);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _644 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = 1.0 / _608;
    float _650 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = _604 * _622;
    bool _656 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = isnan(_590);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _626;
    float _670 = -_620;
    float _672 = _670 + 1.0;
    float _674 = fma(_654, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _680 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _682 = isnan(_590);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_666;
    float _694 = _692 + 1.0;
    float _696 = _666 * _672;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _702 = 1.0 / _678;
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = _638 * _694;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _710;
    float _714 = _700 * _648;
    float _716 = _620 * _706;
    float _718 = _674 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _590 + _720;
    float _724 = -_638;
    float _726 = _724 + 1.0;
    bool _728 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _730 = isnan(_590);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = _712 * _668;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _748 = _590 + _746;
    float _750 = fma(_714, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _752 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _754 = -_738;
    float _756 = _754 + 1.0;
    float _758 = _744 * _702;
    float _760 = fma(_740, _748, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _764 = _590 + _762;
    float _766 = fma(_750, _696, _752);
    float _768 = _690 * _756;
    float _770 = fma(_758, _764, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _772 = fma(_760, _716, _766);
    float _774 = fma(_770, _768, _772);
    float _776 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[119].x, _774);
    float _778 = _776 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _644;
    out.m_53.y = _646;
    out.m_53.z = _650;
    out.m_53.w = _778;
    bool _780 = !_652;
    float _798;
    if (!_780)
    {
        float _782 = in.m_51.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_90);
        float _804 = 1.0 / _802;
        float _806 = _124 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = in.m_51.z;
    float _812 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _814 = log2(_812);
    float _816 = in.m_51.x;
    float _818 = in.m_51.y;
    float _820 = _814 * _124;
    float _822 = exp2(_820);
    float _824 = _810 * 2.0;
    float _826 = _816 * 2.0;
    float _828 = floor(_824);
    float _830 = _816 + _818;
    float _832 = _818 * 2.0;
    float _834 = _830 + (-1.0);
    float _836 = -_822;
    float _838 = _836 + 1.0;
    float _840 = floor(_826);
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _844 = _828 > 0.0;
    float _846 = floor(_832);
    bool _848 = _828 >= 0.0;
    bool _850 = isnan(_828);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    int _858 = _856 ? 0 : 1;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _870 = _868 != 0;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _874 = 1.0 + _872;
    int _876 = ~_858;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    bool _882 = _840 > 0.0;
    float _884 = 1.0 / _874;
    bool _886 = _840 >= 0.0;
    bool _888 = isnan(_840);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    int _896 = _880;
    if (!_844)
    {
        int _898 = ~_858;
        int _900 = _898 + 1;
        _896 = _900;
    }
    int _902 = _896;
    float _904 = in.m_55.x;
    float _906 = in.m_55.y;
    float _908 = in.m_55.z;
    bool _910 = !_862;
    int _912 = _910 ? 0 : 1;
    bool _914 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(1.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    int _924 = abs(_912);
    bool _926 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _934 = _930 || _932;
    float _936 = float(_924);
    float _938 = float(_902);
    int _940 = _894 ? 0 : 1;
    bool _942 = !_866;
    int _944 = _942 ? 0 : 1;
    float _946 = _936 * _938;
    bool _948 = _846 > 0.0;
    float _950 = _934 ? _838 : 0.0;
    int _952 = ~_940;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    bool _958 = _846 >= 0.0;
    bool _960 = isnan(_846);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = _946 * (-2.0);
    int _970 = _956;
    if (!_882)
    {
        int _972 = ~_940;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    if (_922)
    {
        float _978 = _950 * _884;
        _126 = _978;
    }
    float _980 = _126;
    int _982 = abs(_944);
    float _984 = _816 + (-0.5);
    bool _986 = !_870;
    int _988 = _986 ? 0 : 1;
    float _990 = fma(_968, _904, _904);
    int _992 = _966 ? 0 : 1;
    float _994 = _818 + _810;
    int _996 = abs(_988);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _1000 = float(_982);
    float _1002 = fma(_842, _968, _842);
    float _1004 = float(_976);
    float _1006 = _994 + (-1.0);
    int _1008 = ~_992;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    float _1014 = fma(_1002, _980, _998);
    int _1016 = _1012;
    if (!_948)
    {
        int _1018 = ~_992;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = _1000 * _1004;
    float _1026 = float(_996);
    float _1028 = float(_1022);
    float _1030 = _1024 * (-2.0);
    float _1032 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1034 = _1014 * 0.15915493667125701904296875;
    float _1036 = _816 + _810;
    float _1038 = _1026 * _1028;
    float _1040 = _818 + (-0.5);
    float _1042 = fma(_1030, _906, _906);
    float _1044 = fma(_1032, _1030, _1032);
    float _1046 = _1036 + (-1.0);
    float _1048 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1042);
    float _1050 = _1038 * (-2.0);
    float _1052 = _810 + (-0.5);
    float _1054 = _1034 * 6.283185482025146484375;
    float _1056 = sin(_1054);
    float _1058 = fma(_1044, _980, _1048);
    float _1060 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = fma(_1050, _908, _908);
    float _1064 = in.m_57.x;
    float _1066 = in.m_57.y;
    float _1068 = in.m_57.z;
    float _1070 = _1058 * 0.15915493667125701904296875;
    float _1072 = fma(_1060, _1050, _1060);
    float _1074 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1076 = _1034 * 6.283185482025146484375;
    float _1078 = cos(_1076);
    float _1080 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1082 = fma(_1072, _980, _1074);
    float _1084 = _1082 * 0.15915493667125701904296875;
    float _1086 = _1070 * 6.283185482025146484375;
    float _1088 = sin(_1086);
    float _1090 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1092 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1094 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1096 = isnan(0.5);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1102 = _1098 || _1100;
    float _1104 = _1070 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    float _1114 = _1084 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1108 * _1090;
    float _1120 = _1056 * _1088;
    float _1122 = _1110 * _1092;
    float _1124 = _1112 * _1080;
    float _1126 = _1084 * 6.283185482025146484375;
    float _1128 = sin(_1126);
    float _1130 = _1078 * _1106;
    float _1132 = _1056 * _1106;
    float _1134 = _1116 * _1118;
    float _1136 = _1078 * _1134;
    float _1138 = _1056 * _1134;
    float _1140 = fma(_1128, _1130, _1120);
    float _1142 = fma(_1128, _1120, _1130);
    float _1144 = _1078 * _1088;
    float _1146 = _1088 * _1116;
    float _1148 = _1106 * _1116;
    float _1150 = -_1118;
    float _1152 = _1128 * _1150;
    float _1154 = -_1144;
    float _1156 = fma(_1128, _1132, _1154);
    float _1158 = -_1132;
    float _1160 = fma(_1128, _1144, _1158);
    float _1162 = fma(_1140, _1124, _1136);
    float _1164 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1166 = fma(_1156, _1124, _1138);
    float _1168 = fma(_1148, _1124, _1152);
    float _1170 = -_1122;
    float _1172 = fma(_1160, _1170, _1162);
    float _1174 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1164);
    float _1176 = -_1122;
    float _1178 = fma(_1142, _1176, _1166);
    float _1180 = -_1122;
    float _1182 = fma(_1146, _1180, _1168);
    float _1184 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1186 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1174);
    float _1190 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1192 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1184);
    float _1194 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1190);
    float _1200 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1202 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1204 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = _1196 + _1202;
    float _1212 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1216 = _1208 + _1206;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1220 = _1210 + _1218;
    float _1222 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1212);
    float _1224 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1214);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1216 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1234 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1224);
    float _1236 = fma(_1228, _1228, _1230);
    float _1238 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1240 = _1232 + _1234;
    float _1242 = sqrt(_1236);
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1238);
    float _1246 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1244);
    float _1248 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1250 = _1232;
    float _1252 = _1200;
    float _1254 = _1240;
    float _1256 = _1214;
    float _1258 = _1162;
    if (_1102)
    {
        _1250 = 1.0;
    }
    float _1260 = _1250;
    float _1262 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1264 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1248);
    float _1266 = 1.0 / _1262;
    float _1268 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1264);
    bool _1270 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1274 = _1272 + _1262;
    float _1276 = _1274 * _1266;
    float _1278 = _1276 * 0.5;
    float _1280 = _1262;
    float _1282 = _1274;
    float _1284 = _1260;
    if (!_1270)
    {
        _1280 = _1216;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (!_1270)
    {
        _1282 = _1210;
    }
    float _1290 = _1282;
    float _1292 = _1290;
    if (!_1270)
    {
        _1252 = _1240;
    }
    float _1294 = _1252;
    bool _1296 = !_1270;
    float _1298 = _1294;
    if (!_1296)
    {
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1304 = _1242 + _1302;
        float _1306 = rsqrt(_1236);
        float _1308 = _1304 * _1300;
        float _1310 = _1240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = _1308 * 0.15915493667125701904296875;
        float _1314 = _1312 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1312 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1316 + (-1.0);
        float _1324 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = fma(_1320, _1310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1328 = fma(_1240, _1316, _1324);
        float _1330 = _1306 * _1326;
        float _1332 = fma(_1228, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1334 = fma(_1220, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1328;
        _1288 = _1332;
        _1292 = _1334;
    }
    float _1336 = _1298;
    float _1338 = _1288;
    float _1340 = _1292;
    if (!_1102)
    {
        float _1342 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1344 = _1342 * 0.15915493667125701904296875;
        float _1346 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1350 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1348);
        float _1352 = _1344 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1346 * 0.15915493667125701904296875;
        float _1358 = _1344 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = 1.0 / _1354;
        float _1364 = _1356 * 6.283185482025146484375;
        float _1366 = cos(_1364);
        float _1368 = _1360 * _1362;
        float _1370 = _1356 * 6.283185482025146484375;
        float _1372 = sin(_1370);
        float _1374 = _1366 * _1368;
        float _1376 = 1.0 / _1350;
        float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1380 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1378;
        float _1382 = 1.0 / _1374;
        float _1384 = 1.0 / _1380;
        float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1388 = _1376 * _1386;
        float _1390 = _1372 * _1382;
        float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1394 = fma(_1390, _1388, _1392);
        float _1396 = _1394 * _1384;
        float _1398 = precise::clamp(_1396, 0.0, 1.0);
        float _1400 = -_1398;
        float _1402 = _1400 + 1.0;
        _1254 = _1384;
        _1256 = _1376;
        _1284 = _1402;
    }
    float _1404 = _1254;
    float _1406 = _1256;
    float _1408 = _1284;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1336 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1338 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1340 + _1418;
    float _1422 = _1412 * _1412;
    float _1424 = fma(_1416, _1416, _1422);
    float _1426 = fma(_1420, _1420, _1424);
    float _1428 = rsqrt(_1426);
    float _1430 = sqrt(_1426);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1416 * _1432;
    float _1436 = _1420 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1420;
    float _1454 = _1422;
    float _1456 = _1450;
    float _1458 = _1404;
    float _1460 = _1412;
    if (_1446)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1446)
    {
        float _1466 = rsqrt(_1442);
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1468;
    if (_1446)
    {
        float _1472 = _1450 * _1464;
        _1456 = _1472;
    }
    float _1474 = _1456;
    if (_1446)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1458 = _1476;
    }
    float _1478 = _1458;
    float _1480 = _1428;
    if (_1446)
    {
        float _1482 = _1478 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1480 = _1484;
    }
    float _1486 = _1480;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1406;
    float _1494 = _1490;
    float _1496 = _1488;
    if (_1446)
    {
        float _1498 = _1478 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1492 = _1500;
    }
    float _1502 = _1492;
    float _1504 = -_1432;
    float _1506 = -_1490;
    float _1508 = fma(_1412, _1504, _1506);
    if (!_1446)
    {
        _1460 = _1436;
    }
    float _1510 = _1460;
    float _1512 = _1510;
    if (_1446)
    {
        float _1514 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1514;
    }
    float _1516 = _1494;
    float _1518 = _1486;
    float _1520 = _1516;
    if (_1446)
    {
        float _1522 = fma(_1486, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1518 = _1522;
    }
    float _1524 = _1518;
    float _1526 = _1524;
    if (!_1446)
    {
        _1520 = _1508;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    float _1532 = _1502;
    if (_1446)
    {
        float _1534 = _1502 + (-1.0);
        _1496 = _1534;
    }
    float _1536 = _1496;
    float _1538 = _1536;
    if (_1446)
    {
        float _1540 = _1468 * _1524;
        _1258 = _1540;
    }
    float _1542 = _1258;
    if (!_1446)
    {
        _1526 = _1434;
    }
    float _1544 = _1526;
    float _1546 = _1544;
    if (_1446)
    {
        float _1548 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1470 = _1548;
    }
    float _1550 = _1470;
    if (_1446)
    {
        float _1552 = _1434 * _1542;
        _1546 = _1552;
    }
    float _1554 = _1546;
    if (!_1446)
    {
        _1538 = _1438;
    }
    float _1556 = _1538;
    float _1558 = _1556;
    if (_1446)
    {
        float _1560 = _1436 * _1542;
        _1512 = _1560;
    }
    float _1562 = _1512;
    if (_1446)
    {
        float _1564 = fma(_1508, _1502, _1550);
        _1530 = _1564;
    }
    float _1566 = _1530;
    if (_1446)
    {
        float _1568 = _1554 * _1554;
        _1558 = _1568;
    }
    float _1570 = _1558;
    if (!_1446)
    {
        _1532 = _1440;
    }
    float _1572 = _1532;
    float _1574 = _1572;
    if (_1446)
    {
        float _1576 = _1562 * _1562;
        _1574 = _1576;
    }
    float _1578 = _1574;
    float _1580 = fma(_1566, _1566, _1570);
    float _1582 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1586 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1588 = _1580 + _1578;
    float _1590 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1582);
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1594 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1592);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1600 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1586);
    float _1602 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1604 = rsqrt(_1588);
    float _1606 = -_1596;
    float _1608 = _1606 + 1.0;
    float _1610 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1598);
    float _1612 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1600);
    float _1614 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1602);
    float _1616 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1590);
    float _1618 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1622 = abs(_1608);
    float _1624 = log2(_1622);
    float _1626 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1614);
    float _1628 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1630 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1632 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1636 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = _1604 * _1554;
    float _1640 = _1604 * _1562;
    float _1642 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1634);
    float _1644 = _1604 * _1566;
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = -_1636;
    float _1650 = fma(_1648, _1584, 1.0);
    float _1652 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1654 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = -_1646;
    float _1658 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1656);
    float _1660 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1662 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1652);
    float _1664 = log2(_1650);
    float _1666 = -_1640;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1658);
    float _1670 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1672 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1674 = fma(_1668, -0.5, 0.5);
    float _1676 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1670);
    float _1678 = fma(_1668, 0.5, 0.5);
    float _1680 = exp2(_1660);
    float _1682 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1672);
    float _1684 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1676);
    float _1686 = fma(_1678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1688 = _1644 + 1.0;
    float _1690 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1684);
    float _1692 = fma(_1678, _1686, -0.212114393711090087890625);
    float _1694 = 1.0 / _1662;
    float _1696 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1682);
    float _1698 = _1664 * 0.693147182464599609375;
    float _1700 = fma(_1678, _1692, 1.570728778839111328125);
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = sqrt(_1674);
    float _1706 = -_1644;
    float _1708 = fma(_1680, _1688, _1706);
    float _1710 = fma(_1708, 0.5, 0.5);
    float _1712 = _1690 * _1694;
    float _1714 = _1696 * _1694;
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = fma(_1714, -0.5, 0.5);
    float _1720 = _1704 * 0.636619746685028076171875;
    float _1722 = -_1700;
    float _1724 = fma(_1720, _1722, 1.0);
    float3 _4611 = float3(_1716, _1718, _1702);
    float _1726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4611, float3(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4611, float3(0.0), isnan(_4611)), level(0.0)).x;
    float3 _4622 = float3(_1716, _1718, _1702);
    float4 _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4622, float3(0.0), isnan(_4622)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4622, float3(0.0), isnan(_4622)), level(0.0)).xyzw;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1729.w;
    float2 _4639 = float2(_1724, _1710);
    float3 _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4639, float2(0.0), isnan(_4639)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4639, float2(0.0), isnan(_4639)), level(0.0)).xyz;
    float _1743 = _1741.x;
    float _1745 = _1741.y;
    float _1747 = _1741.z;
    float _1749 = in.m_59.y;
    float _1751 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1753 = _818 > 0.5;
    float _1755 = in.m_61.x;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1759 = _808 + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1761;
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1767 = _1765 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1769 = in.m_61.z;
    float _1771 = 1.0 / _1763;
    float _1773 = in.m_61.y;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1777 = _1775 != 0;
    float _1779 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1783 = _1781 != 0;
    float _1785 = in.m_61.w;
    float _1787 = 1.0 / _1767;
    bool _1789 = _816 > 0.5;
    bool _1791 = _1789 && _1783;
    float _1793 = in.m_59.x;
    bool _1795 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1797 = isnan(_808);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1809 = _808 + _1807;
    float _1811 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1779);
    float _1813 = -_1749;
    float _1815 = _1813 + 1.0;
    float _1817 = _1759 * _1771;
    float _1819 = -_1805;
    float _1821 = _1819 + 1.0;
    out.m_63.x = _1755;
    float _1823 = _1749;
    if (_1777)
    {
        float _1825 = _1753 ? _1815 : _1749;
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1831 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1833 = isnan(_808);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    out.m_63.z = _1769;
    float _1843 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1811);
    float _1845 = _1809 * _1787;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1847;
    out.m_63.y = _1773;
    float _1851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1853 = fma(_1849, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1855;
    out.m_63.w = _1785;
    float _1859 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1843);
    bool _1861 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1863 = isnan(_808);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1869 = _1865 || _1867;
    float _1871 = float(_1869);
    float _1873 = -_1841;
    float _1875 = _1873 + 1.0;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1877;
    float _1881 = fma(_1857, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1883 = 0.0;
    float _1885 = _1875;
    if (_1783)
    {
        _1883 = _1793;
    }
    float _1887 = _1883;
    float _1889 = _1841 * _1821;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1895 = _1871 * _1875;
    float _1897 = -_1871;
    float _1899 = _1897 + 1.0;
    float _1901 = _1887;
    if (!_1783)
    {
        _1885 = _1793;
    }
    float _1903 = _1885;
    float _1905 = fma(_1879, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1907 = _1881 * _1895;
    float _1909 = _1853 * _1895;
    float _1911 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1917 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1907);
    float _1919 = _1905 * _1895;
    float _1921 = exp2(_1751);
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1927 = _1903;
    if (_1791)
    {
        float _1929 = -_1887;
        float _1931 = _1929 + 1.0;
        _1901 = _1931;
    }
    float _1933 = _1901;
    float _1935 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1919);
    float _1937 = fma(_1915, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1939 = fma(_1893, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1941 = fma(_1925, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1943 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1909);
    if (_1783)
    {
        _1927 = _1933;
    }
    float _1945 = _1927;
    float _1947 = fma(_1937, _1889, _1917);
    float _1949 = fma(_1939, _1889, _1935);
    float _1951 = fma(_1941, _1889, _1943);
    float _1953 = _1911 * _1851;
    float _1955 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1957 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1947);
    float _1959 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1949);
    float _1961 = -_1921;
    float _1963 = _1961 + 1.0;
    float _1965 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1951);
    float _1967 = _1955 * _1829;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1971 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1979 = _1859 + _1977;
    bool _1981 = _1408 > 0.0;
    bool _1983 = isnan(_1408);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1999 = _1662 + _1979;
    out.gl_Position.x = _1690;
    out.gl_Position.y = _1696;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1662;
    float _2001 = _1997 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2003 = _1999 * 0.5;
    out.m_65.x = _1991;
    out.m_65.y = _1993;
    out.m_65.z = _1995;
    out.m_67.x = _1967;
    out.m_67.y = _1953;
    out.m_69.z = _2003;
    out.m_69.w = _1662;
    out.m_45.x = _2001;
    float _2005 = _1971 * _1726;
    float _2007 = -_1971;
    float _2009 = _2007 + 1.0;
    float _2011 = _1737 * _2005;
    float _2013 = _1747 * _2005;
    float _2015 = _1737 * _2009;
    float _2017 = fma(_1743, _2011, _1731);
    float _2019 = fma(_1745, _2011, _1733);
    float _2021 = fma(_1737, _2013, _1735);
    out.m_71.x = _2017;
    out.m_71.y = _2019;
    out.m_71.z = _2021;
    out.m_71.w = _2015;
    if (_1989)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2023 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2023;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _800 = false;
    bool _582 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2080 = as_type<float>(_106);
        out.gl_Position.z = _2080;
    }
    if (!_94)
    {
        return out;
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2150 = as_type<float>(_144);
        out.gl_Position.z = _2150;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
        float _270 = in.m_51.x;
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
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _368 = _364 * _342;
    float _370 = _360 * _342;
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
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
    float _412 = in.m_49.x;
    float _414 = in.m_49.y;
    float _416 = in.m_49.z;
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
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _442 = 1.0 / _436;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _446 = 1.0 / _440;
    float _448 = _380 * _416;
    float _450 = _378 * _414;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _454 = _410 + _452;
    bool _456 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _420 * _442;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _376 * _412;
    float _492 = _480 * _484;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _468, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = _466 * _496;
    float _510 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_504, _468, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _454 * _446;
    float _516 = _506 * _508;
    float _518 = _510 * _508;
    float _520 = _512 * _508;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_466;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_524, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _516);
    float _544 = fma(_532, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_536, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _520);
    float _550 = fma(_538, _492, _542);
    float _552 = fma(_544, _492, _540);
    float _554 = fma(_546, _492, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_444;
    float _580;
    if (!_562)
    {
        float _564 = in.m_51.x;
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
    float _596 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = isnan(_590);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = 1.0 / _600;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _628 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _630 = isnan(_590);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _644 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = 1.0 / _608;
    float _650 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = _604 * _622;
    bool _656 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = isnan(_590);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _626;
    float _670 = -_620;
    float _672 = _670 + 1.0;
    float _674 = fma(_654, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _680 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _682 = isnan(_590);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_666;
    float _694 = _692 + 1.0;
    float _696 = _666 * _672;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _702 = 1.0 / _678;
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = _638 * _694;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _710;
    float _714 = _700 * _648;
    float _716 = _620 * _706;
    float _718 = _674 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _590 + _720;
    float _724 = -_638;
    float _726 = _724 + 1.0;
    bool _728 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _730 = isnan(_590);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = _712 * _668;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _748 = _590 + _746;
    float _750 = fma(_714, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _752 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _754 = -_738;
    float _756 = _754 + 1.0;
    float _758 = _744 * _702;
    float _760 = fma(_740, _748, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _764 = _590 + _762;
    float _766 = fma(_750, _696, _752);
    float _768 = _690 * _756;
    float _770 = fma(_758, _764, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _772 = fma(_760, _716, _766);
    float _774 = fma(_770, _768, _772);
    float _776 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[119].x, _774);
    float _778 = _776 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _644;
    out.m_53.y = _646;
    out.m_53.z = _650;
    out.m_53.w = _778;
    bool _780 = !_652;
    float _798;
    if (!_780)
    {
        float _782 = in.m_51.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_90);
        float _804 = 1.0 / _802;
        float _806 = _124 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = in.m_51.z;
    float _812 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _814 = log2(_812);
    float _816 = in.m_51.x;
    float _818 = in.m_51.y;
    float _820 = _814 * _124;
    float _822 = exp2(_820);
    float _824 = _810 * 2.0;
    float _826 = _816 * 2.0;
    float _828 = floor(_824);
    float _830 = _816 + _818;
    float _832 = _818 * 2.0;
    float _834 = _830 + (-1.0);
    float _836 = -_822;
    float _838 = _836 + 1.0;
    float _840 = floor(_826);
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _844 = _828 > 0.0;
    float _846 = floor(_832);
    bool _848 = _828 >= 0.0;
    bool _850 = isnan(_828);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    int _858 = _856 ? 0 : 1;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _870 = _868 != 0;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _874 = 1.0 + _872;
    int _876 = ~_858;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    bool _882 = _840 > 0.0;
    float _884 = 1.0 / _874;
    bool _886 = _840 >= 0.0;
    bool _888 = isnan(_840);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    int _896 = _880;
    if (!_844)
    {
        int _898 = ~_858;
        int _900 = _898 + 1;
        _896 = _900;
    }
    int _902 = _896;
    float _904 = in.m_55.x;
    float _906 = in.m_55.y;
    float _908 = in.m_55.z;
    bool _910 = !_862;
    int _912 = _910 ? 0 : 1;
    bool _914 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(1.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    int _924 = abs(_912);
    bool _926 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _934 = _930 || _932;
    float _936 = float(_924);
    float _938 = float(_902);
    int _940 = _894 ? 0 : 1;
    bool _942 = !_866;
    int _944 = _942 ? 0 : 1;
    float _946 = _936 * _938;
    bool _948 = _846 > 0.0;
    float _950 = _934 ? _838 : 0.0;
    int _952 = ~_940;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    bool _958 = _846 >= 0.0;
    bool _960 = isnan(_846);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = _946 * (-2.0);
    int _970 = _956;
    if (!_882)
    {
        int _972 = ~_940;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    if (_922)
    {
        float _978 = _950 * _884;
        _126 = _978;
    }
    float _980 = _126;
    int _982 = abs(_944);
    float _984 = _816 + (-0.5);
    bool _986 = !_870;
    int _988 = _986 ? 0 : 1;
    float _990 = fma(_968, _904, _904);
    int _992 = _966 ? 0 : 1;
    float _994 = _818 + _810;
    int _996 = abs(_988);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _1000 = float(_982);
    float _1002 = fma(_842, _968, _842);
    float _1004 = float(_976);
    float _1006 = _994 + (-1.0);
    int _1008 = ~_992;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    float _1014 = fma(_1002, _980, _998);
    int _1016 = _1012;
    if (!_948)
    {
        int _1018 = ~_992;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = _1000 * _1004;
    float _1026 = float(_996);
    float _1028 = float(_1022);
    float _1030 = _1024 * (-2.0);
    float _1032 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1034 = _1014 * 0.15915493667125701904296875;
    float _1036 = _816 + _810;
    float _1038 = _1026 * _1028;
    float _1040 = _818 + (-0.5);
    float _1042 = fma(_1030, _906, _906);
    float _1044 = fma(_1032, _1030, _1032);
    float _1046 = _1036 + (-1.0);
    float _1048 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1042);
    float _1050 = _1038 * (-2.0);
    float _1052 = _810 + (-0.5);
    float _1054 = _1034 * 6.283185482025146484375;
    float _1056 = sin(_1054);
    float _1058 = fma(_1044, _980, _1048);
    float _1060 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = fma(_1050, _908, _908);
    float _1064 = in.m_57.x;
    float _1066 = in.m_57.y;
    float _1068 = in.m_57.z;
    float _1070 = _1058 * 0.15915493667125701904296875;
    float _1072 = fma(_1060, _1050, _1060);
    float _1074 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1076 = _1034 * 6.283185482025146484375;
    float _1078 = cos(_1076);
    float _1080 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1082 = fma(_1072, _980, _1074);
    float _1084 = _1082 * 0.15915493667125701904296875;
    float _1086 = _1070 * 6.283185482025146484375;
    float _1088 = sin(_1086);
    float _1090 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1092 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1094 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1096 = isnan(0.5);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1102 = _1098 || _1100;
    float _1104 = _1070 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    float _1114 = _1084 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1108 * _1090;
    float _1120 = _1056 * _1088;
    float _1122 = _1110 * _1092;
    float _1124 = _1112 * _1080;
    float _1126 = _1084 * 6.283185482025146484375;
    float _1128 = sin(_1126);
    float _1130 = _1078 * _1106;
    float _1132 = _1056 * _1106;
    float _1134 = _1116 * _1118;
    float _1136 = _1078 * _1134;
    float _1138 = _1056 * _1134;
    float _1140 = fma(_1128, _1130, _1120);
    float _1142 = fma(_1128, _1120, _1130);
    float _1144 = _1078 * _1088;
    float _1146 = _1088 * _1116;
    float _1148 = _1106 * _1116;
    float _1150 = -_1118;
    float _1152 = _1128 * _1150;
    float _1154 = -_1144;
    float _1156 = fma(_1128, _1132, _1154);
    float _1158 = -_1132;
    float _1160 = fma(_1128, _1144, _1158);
    float _1162 = fma(_1140, _1124, _1136);
    float _1164 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1166 = fma(_1156, _1124, _1138);
    float _1168 = fma(_1148, _1124, _1152);
    float _1170 = -_1122;
    float _1172 = fma(_1160, _1170, _1162);
    float _1174 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1164);
    float _1176 = -_1122;
    float _1178 = fma(_1142, _1176, _1166);
    float _1180 = -_1122;
    float _1182 = fma(_1146, _1180, _1168);
    float _1184 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1186 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1174);
    float _1190 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1192 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1184);
    float _1194 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1190);
    float _1200 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1202 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1204 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = _1196 + _1202;
    float _1212 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1216 = _1208 + _1206;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1220 = _1210 + _1218;
    float _1222 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1212);
    float _1224 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1214);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1216 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1234 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1224);
    float _1236 = fma(_1228, _1228, _1230);
    float _1238 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1240 = _1232 + _1234;
    float _1242 = sqrt(_1236);
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1238);
    float _1246 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1244);
    float _1248 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1250 = _1232;
    float _1252 = _1200;
    float _1254 = _1240;
    float _1256 = _1214;
    float _1258 = _1162;
    if (_1102)
    {
        _1250 = 1.0;
    }
    float _1260 = _1250;
    float _1262 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1264 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1248);
    float _1266 = 1.0 / _1262;
    float _1268 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1264);
    bool _1270 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1274 = _1272 + _1262;
    float _1276 = _1274 * _1266;
    float _1278 = _1276 * 0.5;
    float _1280 = _1262;
    float _1282 = _1274;
    float _1284 = _1260;
    if (!_1270)
    {
        _1280 = _1216;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (!_1270)
    {
        _1282 = _1210;
    }
    float _1290 = _1282;
    float _1292 = _1290;
    if (!_1270)
    {
        _1252 = _1240;
    }
    float _1294 = _1252;
    bool _1296 = !_1270;
    float _1298 = _1294;
    if (!_1296)
    {
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1304 = _1242 + _1302;
        float _1306 = rsqrt(_1236);
        float _1308 = _1304 * _1300;
        float _1310 = _1240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = _1308 * 0.15915493667125701904296875;
        float _1314 = _1312 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1312 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1316 + (-1.0);
        float _1324 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = fma(_1320, _1310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1328 = fma(_1240, _1316, _1324);
        float _1330 = _1306 * _1326;
        float _1332 = fma(_1228, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1334 = fma(_1220, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1328;
        _1288 = _1332;
        _1292 = _1334;
    }
    float _1336 = _1298;
    float _1338 = _1288;
    float _1340 = _1292;
    if (!_1102)
    {
        float _1342 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1344 = _1342 * 0.15915493667125701904296875;
        float _1346 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1350 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1348);
        float _1352 = _1344 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1346 * 0.15915493667125701904296875;
        float _1358 = _1344 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = 1.0 / _1354;
        float _1364 = _1356 * 6.283185482025146484375;
        float _1366 = cos(_1364);
        float _1368 = _1360 * _1362;
        float _1370 = _1356 * 6.283185482025146484375;
        float _1372 = sin(_1370);
        float _1374 = _1366 * _1368;
        float _1376 = 1.0 / _1350;
        float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1380 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1378;
        float _1382 = 1.0 / _1374;
        float _1384 = 1.0 / _1380;
        float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1388 = _1376 * _1386;
        float _1390 = _1372 * _1382;
        float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1394 = fma(_1390, _1388, _1392);
        float _1396 = _1394 * _1384;
        float _1398 = precise::clamp(_1396, 0.0, 1.0);
        float _1400 = -_1398;
        float _1402 = _1400 + 1.0;
        _1254 = _1384;
        _1256 = _1376;
        _1284 = _1402;
    }
    float _1404 = _1254;
    float _1406 = _1256;
    float _1408 = _1284;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1336 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1338 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1340 + _1418;
    float _1422 = _1412 * _1412;
    float _1424 = fma(_1416, _1416, _1422);
    float _1426 = fma(_1420, _1420, _1424);
    float _1428 = rsqrt(_1426);
    float _1430 = sqrt(_1426);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1416 * _1432;
    float _1436 = _1420 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1420;
    float _1454 = _1422;
    float _1456 = _1450;
    float _1458 = _1404;
    float _1460 = _1412;
    if (_1446)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1446)
    {
        float _1466 = rsqrt(_1442);
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1468;
    if (_1446)
    {
        float _1472 = _1450 * _1464;
        _1456 = _1472;
    }
    float _1474 = _1456;
    if (_1446)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1458 = _1476;
    }
    float _1478 = _1458;
    float _1480 = _1428;
    if (_1446)
    {
        float _1482 = _1478 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1480 = _1484;
    }
    float _1486 = _1480;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1406;
    float _1494 = _1490;
    float _1496 = _1488;
    if (_1446)
    {
        float _1498 = _1478 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1492 = _1500;
    }
    float _1502 = _1492;
    float _1504 = -_1432;
    float _1506 = -_1490;
    float _1508 = fma(_1412, _1504, _1506);
    if (!_1446)
    {
        _1460 = _1436;
    }
    float _1510 = _1460;
    float _1512 = _1510;
    if (_1446)
    {
        float _1514 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1514;
    }
    float _1516 = _1494;
    float _1518 = _1486;
    float _1520 = _1516;
    if (_1446)
    {
        float _1522 = fma(_1486, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1518 = _1522;
    }
    float _1524 = _1518;
    float _1526 = _1524;
    if (!_1446)
    {
        _1520 = _1508;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    float _1532 = _1502;
    if (_1446)
    {
        float _1534 = _1502 + (-1.0);
        _1496 = _1534;
    }
    float _1536 = _1496;
    float _1538 = _1536;
    if (_1446)
    {
        float _1540 = _1468 * _1524;
        _1258 = _1540;
    }
    float _1542 = _1258;
    if (!_1446)
    {
        _1526 = _1434;
    }
    float _1544 = _1526;
    float _1546 = _1544;
    if (_1446)
    {
        float _1548 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1470 = _1548;
    }
    float _1550 = _1470;
    if (_1446)
    {
        float _1552 = _1434 * _1542;
        _1546 = _1552;
    }
    float _1554 = _1546;
    if (!_1446)
    {
        _1538 = _1438;
    }
    float _1556 = _1538;
    float _1558 = _1556;
    if (_1446)
    {
        float _1560 = _1436 * _1542;
        _1512 = _1560;
    }
    float _1562 = _1512;
    if (_1446)
    {
        float _1564 = fma(_1508, _1502, _1550);
        _1530 = _1564;
    }
    float _1566 = _1530;
    if (_1446)
    {
        float _1568 = _1554 * _1554;
        _1558 = _1568;
    }
    float _1570 = _1558;
    if (!_1446)
    {
        _1532 = _1440;
    }
    float _1572 = _1532;
    float _1574 = _1572;
    if (_1446)
    {
        float _1576 = _1562 * _1562;
        _1574 = _1576;
    }
    float _1578 = _1574;
    float _1580 = fma(_1566, _1566, _1570);
    float _1582 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1586 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1588 = _1580 + _1578;
    float _1590 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1582);
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1594 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1592);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1600 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1586);
    float _1602 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1604 = rsqrt(_1588);
    float _1606 = -_1596;
    float _1608 = _1606 + 1.0;
    float _1610 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1598);
    float _1612 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1600);
    float _1614 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1602);
    float _1616 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1590);
    float _1618 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1622 = abs(_1608);
    float _1624 = log2(_1622);
    float _1626 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1614);
    float _1628 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1630 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1632 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1636 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = _1604 * _1554;
    float _1640 = _1604 * _1562;
    float _1642 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1634);
    float _1644 = _1604 * _1566;
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = -_1636;
    float _1650 = fma(_1648, _1584, 1.0);
    float _1652 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1654 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = -_1646;
    float _1658 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1656);
    float _1660 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1662 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1652);
    float _1664 = log2(_1650);
    float _1666 = -_1640;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1658);
    float _1670 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1672 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1674 = fma(_1668, -0.5, 0.5);
    float _1676 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1670);
    float _1678 = fma(_1668, 0.5, 0.5);
    float _1680 = exp2(_1660);
    float _1682 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1672);
    float _1684 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1676);
    float _1686 = fma(_1678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1688 = _1644 + 1.0;
    float _1690 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1684);
    float _1692 = fma(_1678, _1686, -0.212114393711090087890625);
    float _1694 = 1.0 / _1662;
    float _1696 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1682);
    float _1698 = _1664 * 0.693147182464599609375;
    float _1700 = fma(_1678, _1692, 1.570728778839111328125);
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = sqrt(_1674);
    float _1706 = -_1644;
    float _1708 = fma(_1680, _1688, _1706);
    float _1710 = fma(_1708, 0.5, 0.5);
    float _1712 = _1690 * _1694;
    float _1714 = _1696 * _1694;
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = fma(_1714, -0.5, 0.5);
    float _1720 = _1704 * 0.636619746685028076171875;
    float _1722 = -_1700;
    float _1724 = fma(_1720, _1722, 1.0);
    float3 _4611 = float3(_1716, _1718, _1702);
    float _1726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4611, float3(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4611, float3(0.0), isnan(_4611)), level(0.0)).x;
    float3 _4622 = float3(_1716, _1718, _1702);
    float4 _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4622, float3(0.0), isnan(_4622)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4622, float3(0.0), isnan(_4622)), level(0.0)).xyzw;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1729.w;
    float2 _4639 = float2(_1724, _1710);
    float3 _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4639, float2(0.0), isnan(_4639)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4639, float2(0.0), isnan(_4639)), level(0.0)).xyz;
    float _1743 = _1741.x;
    float _1745 = _1741.y;
    float _1747 = _1741.z;
    float _1749 = in.m_59.y;
    float _1751 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1753 = _818 > 0.5;
    float _1755 = in.m_61.x;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1759 = _808 + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1761;
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1767 = _1765 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1769 = in.m_61.z;
    float _1771 = 1.0 / _1763;
    float _1773 = in.m_61.y;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1777 = _1775 != 0;
    float _1779 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1783 = _1781 != 0;
    float _1785 = in.m_61.w;
    float _1787 = 1.0 / _1767;
    bool _1789 = _816 > 0.5;
    bool _1791 = _1789 && _1783;
    float _1793 = in.m_59.x;
    bool _1795 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1797 = isnan(_808);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1809 = _808 + _1807;
    float _1811 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1779);
    float _1813 = -_1749;
    float _1815 = _1813 + 1.0;
    float _1817 = _1759 * _1771;
    float _1819 = -_1805;
    float _1821 = _1819 + 1.0;
    out.m_63.x = _1755;
    float _1823 = _1749;
    if (_1777)
    {
        float _1825 = _1753 ? _1815 : _1749;
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1831 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1833 = isnan(_808);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    out.m_63.z = _1769;
    float _1843 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1811);
    float _1845 = _1809 * _1787;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1847;
    out.m_63.y = _1773;
    float _1851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1853 = fma(_1849, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1855;
    out.m_63.w = _1785;
    float _1859 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1843);
    bool _1861 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1863 = isnan(_808);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1869 = _1865 || _1867;
    float _1871 = float(_1869);
    float _1873 = -_1841;
    float _1875 = _1873 + 1.0;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1877;
    float _1881 = fma(_1857, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1883 = 0.0;
    float _1885 = _1875;
    if (_1783)
    {
        _1883 = _1793;
    }
    float _1887 = _1883;
    float _1889 = _1841 * _1821;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1895 = _1871 * _1875;
    float _1897 = -_1871;
    float _1899 = _1897 + 1.0;
    float _1901 = _1887;
    if (!_1783)
    {
        _1885 = _1793;
    }
    float _1903 = _1885;
    float _1905 = fma(_1879, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1907 = _1881 * _1895;
    float _1909 = _1853 * _1895;
    float _1911 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1917 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1907);
    float _1919 = _1905 * _1895;
    float _1921 = exp2(_1751);
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1927 = _1903;
    if (_1791)
    {
        float _1929 = -_1887;
        float _1931 = _1929 + 1.0;
        _1901 = _1931;
    }
    float _1933 = _1901;
    float _1935 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1919);
    float _1937 = fma(_1915, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1939 = fma(_1893, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1941 = fma(_1925, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1943 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1909);
    if (_1783)
    {
        _1927 = _1933;
    }
    float _1945 = _1927;
    float _1947 = fma(_1937, _1889, _1917);
    float _1949 = fma(_1939, _1889, _1935);
    float _1951 = fma(_1941, _1889, _1943);
    float _1953 = _1911 * _1851;
    float _1955 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1957 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1947);
    float _1959 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1949);
    float _1961 = -_1921;
    float _1963 = _1961 + 1.0;
    float _1965 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1951);
    float _1967 = _1955 * _1829;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1971 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1979 = _1859 + _1977;
    bool _1981 = _1408 > 0.0;
    bool _1983 = isnan(_1408);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1999 = _1662 + _1979;
    out.gl_Position.x = _1690;
    out.gl_Position.y = _1696;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1662;
    float _2001 = _1997 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2003 = _1999 * 0.5;
    out.m_65.x = _1991;
    out.m_65.y = _1993;
    out.m_65.z = _1995;
    out.m_67.x = _1967;
    out.m_67.y = _1953;
    out.m_69.z = _2003;
    out.m_69.w = _1662;
    out.m_45.x = _2001;
    float _2005 = _1971 * _1726;
    float _2007 = -_1971;
    float _2009 = _2007 + 1.0;
    float _2011 = _1737 * _2005;
    float _2013 = _1747 * _2005;
    float _2015 = _1737 * _2009;
    float _2017 = fma(_1743, _2011, _1731);
    float _2019 = fma(_1745, _2011, _1733);
    float _2021 = fma(_1737, _2013, _1735);
    out.m_71.x = _2017;
    out.m_71.y = _2019;
    out.m_71.z = _2021;
    out.m_71.w = _2015;
    if (_1989)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2023 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2023;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _800 = false;
    bool _582 = false;
    bool _402 = false;
    bool _288 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2080 = as_type<float>(_106);
        out.gl_Position.z = _2080;
    }
    if (!_94)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _110 = in.m_47.w;
    bool _112 = _110 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _114 = isnan(_110);
    bool _116 = _112 || _114;
    bool _118 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _120 = _116 || _118;
    float _122 = -_110;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _126 = _124;
    if (_120)
    {
        float _128 = float(_90);
        _100 = _128;
    }
    float _130 = _100;
    bool _132 = _124 >= _130;
    bool _134 = !_120;
    bool _136 = _132 || _134;
    float _138 = _130;
    if (_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    if (_136)
    {
        out.m_45.x = 0.0;
    }
    if (_136)
    {
        float _142 = _140 * 5.0;
        _108 = as_type<int>(_142);
    }
    int _144 = _108;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2150 = as_type<float>(_144);
        out.gl_Position.z = _2150;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_49.w;
    float _148 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_47.x;
    float _162 = in.m_47.y;
    float _164 = in.m_47.z;
    float _166 = in.m_42.x;
    float _168 = in.m_42.y;
    float _170 = in.m_42.z;
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
        float _270 = in.m_51.x;
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
    float _366 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _362);
    float _368 = _364 * _342;
    float _370 = _360 * _342;
    float _372 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _374 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _376 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].x, _366);
    float _378 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].y, _372);
    float _380 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[144].z, _374);
    bool _382 = !_340;
    float _400;
    if (!_382)
    {
        float _384 = in.m_51.x;
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
    float _412 = in.m_49.x;
    float _414 = in.m_49.y;
    float _416 = in.m_49.z;
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
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _442 = 1.0 / _436;
    bool _444 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _446 = 1.0 / _440;
    float _448 = _380 * _416;
    float _450 = _378 * _414;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _454 = _410 + _452;
    bool _456 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _458 = isnan(_410);
    bool _460 = _456 || _458;
    bool _462 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _464 = _460 || _462;
    float _466 = float(_464);
    float _468 = _420 * _442;
    bool _470 = _410 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _472 = isnan(_410);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_432;
    float _484 = _482 + 1.0;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _486;
    float _490 = _376 * _412;
    float _492 = _480 * _484;
    float _494 = -_480;
    float _496 = _494 + 1.0;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _498;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _504 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _502;
    float _506 = fma(_488, _468, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _508 = _466 * _496;
    float _510 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _512 = fma(_504, _468, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _514 = _454 * _446;
    float _516 = _506 * _508;
    float _518 = _510 * _508;
    float _520 = _512 * _508;
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _526 = -_466;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _538 = fma(_524, _514, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _540 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].x, _518);
    float _542 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].y, _516);
    float _544 = fma(_532, _514, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _546 = fma(_536, _514, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _548 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[107].z, _520);
    float _550 = fma(_538, _492, _542);
    float _552 = fma(_544, _492, _540);
    float _554 = fma(_546, _492, _548);
    float _556 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].y, _550);
    float _558 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].x, _552);
    float _560 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[109].z, _554);
    bool _562 = !_444;
    float _580;
    if (!_562)
    {
        float _564 = in.m_51.x;
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
    float _596 = _558 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _602;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _608 = _606 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _610 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _612 = isnan(_590);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _618 = _614 || _616;
    float _620 = float(_618);
    float _622 = 1.0 / _600;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _626 = _624 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _628 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _630 = isnan(_590);
    bool _632 = _628 || _630;
    bool _634 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _636 = _632 || _634;
    float _638 = float(_636);
    float _640 = _556 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = _560 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _644 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _646 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _648 = 1.0 / _608;
    float _650 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _654 = _604 * _622;
    bool _656 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _658 = isnan(_590);
    bool _660 = _656 || _658;
    bool _662 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _664 = _660 || _662;
    float _666 = float(_664);
    float _668 = 1.0 / _626;
    float _670 = -_620;
    float _672 = _670 + 1.0;
    float _674 = fma(_654, _594, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _680 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _682 = isnan(_590);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = -_666;
    float _694 = _692 + 1.0;
    float _696 = _666 * _672;
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _700 = _698 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _702 = 1.0 / _678;
    float _704 = -_690;
    float _706 = _704 + 1.0;
    float _708 = _638 * _694;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _710;
    float _714 = _700 * _648;
    float _716 = _620 * _706;
    float _718 = _674 * _708;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _722 = _590 + _720;
    float _724 = -_638;
    float _726 = _724 + 1.0;
    bool _728 = _590 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _730 = isnan(_590);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = _712 * _668;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _744 = _742 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _748 = _590 + _746;
    float _750 = fma(_714, _722, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _752 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[115].x, _718);
    float _754 = -_738;
    float _756 = _754 + 1.0;
    float _758 = _744 * _702;
    float _760 = fma(_740, _748, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _764 = _590 + _762;
    float _766 = fma(_750, _696, _752);
    float _768 = _690 * _756;
    float _770 = fma(_758, _764, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _772 = fma(_760, _716, _766);
    float _774 = fma(_770, _768, _772);
    float _776 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[119].x, _774);
    float _778 = _776 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _644;
    out.m_53.y = _646;
    out.m_53.z = _650;
    out.m_53.w = _778;
    bool _780 = !_652;
    float _798;
    if (!_780)
    {
        float _782 = in.m_51.x;
        float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _786 = _782 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[11].z, _124);
        float _790 = _788 * _784;
        float _792 = floor(_790);
        float _794 = -_792;
        float _796 = _790 + _794;
        _798 = _796;
        _800 = true;
    }
    else
    {
        float _802 = float(_90);
        float _804 = 1.0 / _802;
        float _806 = _124 * _804;
        _798 = _806;
    }
    _800 = false;
    float _808 = _798;
    float _810 = in.m_51.z;
    float _812 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _814 = log2(_812);
    float _816 = in.m_51.x;
    float _818 = in.m_51.y;
    float _820 = _814 * _124;
    float _822 = exp2(_820);
    float _824 = _810 * 2.0;
    float _826 = _816 * 2.0;
    float _828 = floor(_824);
    float _830 = _816 + _818;
    float _832 = _818 * 2.0;
    float _834 = _830 + (-1.0);
    float _836 = -_822;
    float _838 = _836 + 1.0;
    float _840 = floor(_826);
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _844 = _828 > 0.0;
    float _846 = floor(_832);
    bool _848 = _828 >= 0.0;
    bool _850 = isnan(_828);
    bool _852 = _848 || _850;
    bool _854 = isnan(0.0);
    bool _856 = _852 || _854;
    int _858 = _856 ? 0 : 1;
    int _860 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _862 = _860 != 0;
    int _864 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _866 = _864 != 0;
    int _868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _870 = _868 != 0;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _874 = 1.0 + _872;
    int _876 = ~_858;
    int _878 = _876 + 1;
    int _880 = _878 + 1;
    bool _882 = _840 > 0.0;
    float _884 = 1.0 / _874;
    bool _886 = _840 >= 0.0;
    bool _888 = isnan(_840);
    bool _890 = _886 || _888;
    bool _892 = isnan(0.0);
    bool _894 = _890 || _892;
    int _896 = _880;
    if (!_844)
    {
        int _898 = ~_858;
        int _900 = _898 + 1;
        _896 = _900;
    }
    int _902 = _896;
    float _904 = in.m_55.x;
    float _906 = in.m_55.y;
    float _908 = in.m_55.z;
    bool _910 = !_862;
    int _912 = _910 ? 0 : 1;
    bool _914 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(1.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    int _924 = abs(_912);
    bool _926 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _928 = isnan(0.0);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _934 = _930 || _932;
    float _936 = float(_924);
    float _938 = float(_902);
    int _940 = _894 ? 0 : 1;
    bool _942 = !_866;
    int _944 = _942 ? 0 : 1;
    float _946 = _936 * _938;
    bool _948 = _846 > 0.0;
    float _950 = _934 ? _838 : 0.0;
    int _952 = ~_940;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    bool _958 = _846 >= 0.0;
    bool _960 = isnan(_846);
    bool _962 = _958 || _960;
    bool _964 = isnan(0.0);
    bool _966 = _962 || _964;
    float _968 = _946 * (-2.0);
    int _970 = _956;
    if (!_882)
    {
        int _972 = ~_940;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    if (_922)
    {
        float _978 = _950 * _884;
        _126 = _978;
    }
    float _980 = _126;
    int _982 = abs(_944);
    float _984 = _816 + (-0.5);
    bool _986 = !_870;
    int _988 = _986 ? 0 : 1;
    float _990 = fma(_968, _904, _904);
    int _992 = _966 ? 0 : 1;
    float _994 = _818 + _810;
    int _996 = abs(_988);
    float _998 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[196].x, _990);
    float _1000 = float(_982);
    float _1002 = fma(_842, _968, _842);
    float _1004 = float(_976);
    float _1006 = _994 + (-1.0);
    int _1008 = ~_992;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    float _1014 = fma(_1002, _980, _998);
    int _1016 = _1012;
    if (!_948)
    {
        int _1018 = ~_992;
        int _1020 = _1018 + 1;
        _1016 = _1020;
    }
    int _1022 = _1016;
    float _1024 = _1000 * _1004;
    float _1026 = float(_996);
    float _1028 = float(_1022);
    float _1030 = _1024 * (-2.0);
    float _1032 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1034 = _1014 * 0.15915493667125701904296875;
    float _1036 = _816 + _810;
    float _1038 = _1026 * _1028;
    float _1040 = _818 + (-0.5);
    float _1042 = fma(_1030, _906, _906);
    float _1044 = fma(_1032, _1030, _1032);
    float _1046 = _1036 + (-1.0);
    float _1048 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1042);
    float _1050 = _1038 * (-2.0);
    float _1052 = _810 + (-0.5);
    float _1054 = _1034 * 6.283185482025146484375;
    float _1056 = sin(_1054);
    float _1058 = fma(_1044, _980, _1048);
    float _1060 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1062 = fma(_1050, _908, _908);
    float _1064 = in.m_57.x;
    float _1066 = in.m_57.y;
    float _1068 = in.m_57.z;
    float _1070 = _1058 * 0.15915493667125701904296875;
    float _1072 = fma(_1060, _1050, _1060);
    float _1074 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1062);
    float _1076 = _1034 * 6.283185482025146484375;
    float _1078 = cos(_1076);
    float _1080 = _490 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1082 = fma(_1072, _980, _1074);
    float _1084 = _1082 * 0.15915493667125701904296875;
    float _1086 = _1070 * 6.283185482025146484375;
    float _1088 = sin(_1086);
    float _1090 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1092 = _450 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1094 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1096 = isnan(0.5);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1102 = _1098 || _1100;
    float _1104 = _1070 * 6.283185482025146484375;
    float _1106 = cos(_1104);
    float _1108 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1068);
    float _1110 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1066);
    float _1112 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1064);
    float _1114 = _1084 * 6.283185482025146484375;
    float _1116 = cos(_1114);
    float _1118 = _1108 * _1090;
    float _1120 = _1056 * _1088;
    float _1122 = _1110 * _1092;
    float _1124 = _1112 * _1080;
    float _1126 = _1084 * 6.283185482025146484375;
    float _1128 = sin(_1126);
    float _1130 = _1078 * _1106;
    float _1132 = _1056 * _1106;
    float _1134 = _1116 * _1118;
    float _1136 = _1078 * _1134;
    float _1138 = _1056 * _1134;
    float _1140 = fma(_1128, _1130, _1120);
    float _1142 = fma(_1128, _1120, _1130);
    float _1144 = _1078 * _1088;
    float _1146 = _1088 * _1116;
    float _1148 = _1106 * _1116;
    float _1150 = -_1118;
    float _1152 = _1128 * _1150;
    float _1154 = -_1144;
    float _1156 = fma(_1128, _1132, _1154);
    float _1158 = -_1132;
    float _1160 = fma(_1128, _1144, _1158);
    float _1162 = fma(_1140, _1124, _1136);
    float _1164 = _264 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1166 = fma(_1156, _1124, _1138);
    float _1168 = fma(_1148, _1124, _1152);
    float _1170 = -_1122;
    float _1172 = fma(_1160, _1170, _1162);
    float _1174 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1164);
    float _1176 = -_1122;
    float _1178 = fma(_1142, _1176, _1166);
    float _1180 = -_1122;
    float _1182 = fma(_1146, _1180, _1168);
    float _1184 = _264 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1186 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1188 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1174);
    float _1190 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1192 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1184);
    float _1194 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1186);
    float _1196 = _1188 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1198 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1190);
    float _1200 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1192);
    float _1202 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1204 = _264 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1206 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1198);
    float _1208 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1210 = _1196 + _1202;
    float _1212 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1204);
    float _1214 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1216 = _1208 + _1206;
    float _1218 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1220 = _1210 + _1218;
    float _1222 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1212);
    float _1224 = fma(_1182, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1214);
    float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1228 = _1216 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = _1222 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1234 = fma(_1178, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1224);
    float _1236 = fma(_1228, _1228, _1230);
    float _1238 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1240 = _1232 + _1234;
    float _1242 = sqrt(_1236);
    float _1244 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1238);
    float _1246 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1244);
    float _1248 = _1232 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1250 = _1232;
    float _1252 = _1200;
    float _1254 = _1240;
    float _1256 = _1214;
    float _1258 = _1162;
    if (_1102)
    {
        _1250 = 1.0;
    }
    float _1260 = _1250;
    float _1262 = _1246 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1264 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1248);
    float _1266 = 1.0 / _1262;
    float _1268 = fma(_1196, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1264);
    bool _1270 = _1242 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1272 = _1268 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1274 = _1272 + _1262;
    float _1276 = _1274 * _1266;
    float _1278 = _1276 * 0.5;
    float _1280 = _1262;
    float _1282 = _1274;
    float _1284 = _1260;
    if (!_1270)
    {
        _1280 = _1216;
    }
    float _1286 = _1280;
    float _1288 = _1286;
    if (!_1270)
    {
        _1282 = _1210;
    }
    float _1290 = _1282;
    float _1292 = _1290;
    if (!_1270)
    {
        _1252 = _1240;
    }
    float _1294 = _1252;
    bool _1296 = !_1270;
    float _1298 = _1294;
    if (!_1296)
    {
        float _1300 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1302 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1304 = _1242 + _1302;
        float _1306 = rsqrt(_1236);
        float _1308 = _1304 * _1300;
        float _1310 = _1240 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1312 = _1308 * 0.15915493667125701904296875;
        float _1314 = _1312 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        float _1318 = _1312 * 6.283185482025146484375;
        float _1320 = sin(_1318);
        float _1322 = _1316 + (-1.0);
        float _1324 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1326 = fma(_1320, _1310, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1328 = fma(_1240, _1316, _1324);
        float _1330 = _1306 * _1326;
        float _1332 = fma(_1228, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1334 = fma(_1220, _1330, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1298 = _1328;
        _1288 = _1332;
        _1292 = _1334;
    }
    float _1336 = _1298;
    float _1338 = _1288;
    float _1340 = _1292;
    if (!_1102)
    {
        float _1342 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1344 = _1342 * 0.15915493667125701904296875;
        float _1346 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1348 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1350 = fma(_1278, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1348);
        float _1352 = _1344 * 6.283185482025146484375;
        float _1354 = cos(_1352);
        float _1356 = _1346 * 0.15915493667125701904296875;
        float _1358 = _1344 * 6.283185482025146484375;
        float _1360 = sin(_1358);
        float _1362 = 1.0 / _1354;
        float _1364 = _1356 * 6.283185482025146484375;
        float _1366 = cos(_1364);
        float _1368 = _1360 * _1362;
        float _1370 = _1356 * 6.283185482025146484375;
        float _1372 = sin(_1370);
        float _1374 = _1366 * _1368;
        float _1376 = 1.0 / _1350;
        float _1378 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1380 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1378;
        float _1382 = 1.0 / _1374;
        float _1384 = 1.0 / _1380;
        float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1388 = _1376 * _1386;
        float _1390 = _1372 * _1382;
        float _1392 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1394 = fma(_1390, _1388, _1392);
        float _1396 = _1394 * _1384;
        float _1398 = precise::clamp(_1396, 0.0, 1.0);
        float _1400 = -_1398;
        float _1402 = _1400 + 1.0;
        _1254 = _1384;
        _1256 = _1376;
        _1284 = _1402;
    }
    float _1404 = _1254;
    float _1406 = _1256;
    float _1408 = _1284;
    float _1410 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1412 = _1336 + _1410;
    float _1414 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1416 = _1338 + _1414;
    float _1418 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1420 = _1340 + _1418;
    float _1422 = _1412 * _1412;
    float _1424 = fma(_1416, _1416, _1422);
    float _1426 = fma(_1420, _1420, _1424);
    float _1428 = rsqrt(_1426);
    float _1430 = sqrt(_1426);
    float _1432 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1434 = _1416 * _1432;
    float _1436 = _1420 * _1432;
    float _1438 = _1434 * _1434;
    float _1440 = _1436 * _1436;
    float _1442 = _1438 + _1440;
    float _1444 = sqrt(_1442);
    bool _1446 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1450 = _1444 + _1448;
    float _1452 = _1420;
    float _1454 = _1422;
    float _1456 = _1450;
    float _1458 = _1404;
    float _1460 = _1412;
    if (_1446)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1452 = _1462;
    }
    float _1464 = _1452;
    if (_1446)
    {
        float _1466 = rsqrt(_1442);
        _1454 = _1466;
    }
    float _1468 = _1454;
    float _1470 = _1468;
    if (_1446)
    {
        float _1472 = _1450 * _1464;
        _1456 = _1472;
    }
    float _1474 = _1456;
    if (_1446)
    {
        float _1476 = _1474 * 0.15915493667125701904296875;
        _1458 = _1476;
    }
    float _1478 = _1458;
    float _1480 = _1428;
    if (_1446)
    {
        float _1482 = _1478 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1480 = _1484;
    }
    float _1486 = _1480;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1406;
    float _1494 = _1490;
    float _1496 = _1488;
    if (_1446)
    {
        float _1498 = _1478 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1492 = _1500;
    }
    float _1502 = _1492;
    float _1504 = -_1432;
    float _1506 = -_1490;
    float _1508 = fma(_1412, _1504, _1506);
    if (!_1446)
    {
        _1460 = _1436;
    }
    float _1510 = _1460;
    float _1512 = _1510;
    if (_1446)
    {
        float _1514 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1514;
    }
    float _1516 = _1494;
    float _1518 = _1486;
    float _1520 = _1516;
    if (_1446)
    {
        float _1522 = fma(_1486, _1516, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1518 = _1522;
    }
    float _1524 = _1518;
    float _1526 = _1524;
    if (!_1446)
    {
        _1520 = _1508;
    }
    float _1528 = _1520;
    float _1530 = _1528;
    float _1532 = _1502;
    if (_1446)
    {
        float _1534 = _1502 + (-1.0);
        _1496 = _1534;
    }
    float _1536 = _1496;
    float _1538 = _1536;
    if (_1446)
    {
        float _1540 = _1468 * _1524;
        _1258 = _1540;
    }
    float _1542 = _1258;
    if (!_1446)
    {
        _1526 = _1434;
    }
    float _1544 = _1526;
    float _1546 = _1544;
    if (_1446)
    {
        float _1548 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1470 = _1548;
    }
    float _1550 = _1470;
    if (_1446)
    {
        float _1552 = _1434 * _1542;
        _1546 = _1552;
    }
    float _1554 = _1546;
    if (!_1446)
    {
        _1538 = _1438;
    }
    float _1556 = _1538;
    float _1558 = _1556;
    if (_1446)
    {
        float _1560 = _1436 * _1542;
        _1512 = _1560;
    }
    float _1562 = _1512;
    if (_1446)
    {
        float _1564 = fma(_1508, _1502, _1550);
        _1530 = _1564;
    }
    float _1566 = _1530;
    if (_1446)
    {
        float _1568 = _1554 * _1554;
        _1558 = _1568;
    }
    float _1570 = _1558;
    if (!_1446)
    {
        _1532 = _1440;
    }
    float _1572 = _1532;
    float _1574 = _1572;
    if (_1446)
    {
        float _1576 = _1562 * _1562;
        _1574 = _1576;
    }
    float _1578 = _1574;
    float _1580 = fma(_1566, _1566, _1570);
    float _1582 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1584 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1586 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1588 = _1580 + _1578;
    float _1590 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1582);
    float _1592 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1594 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1592);
    float _1596 = precise::clamp(_1594, 0.0, 1.0);
    float _1598 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1600 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1586);
    float _1602 = _1336 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1604 = rsqrt(_1588);
    float _1606 = -_1596;
    float _1608 = _1606 + 1.0;
    float _1610 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1598);
    float _1612 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1600);
    float _1614 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1602);
    float _1616 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1590);
    float _1618 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1610);
    float _1620 = _1612 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1622 = abs(_1608);
    float _1624 = log2(_1622);
    float _1626 = fma(_1340, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1614);
    float _1628 = _1618 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1630 = _1616 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1632 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1634 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1636 = _1630 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1638 = _1604 * _1554;
    float _1640 = _1604 * _1562;
    float _1642 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1634);
    float _1644 = _1604 * _1566;
    float _1646 = _1638 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1648 = -_1636;
    float _1650 = fma(_1648, _1584, 1.0);
    float _1652 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1642);
    float _1654 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1656 = -_1646;
    float _1658 = fma(_1644, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1656);
    float _1660 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1662 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1652);
    float _1664 = log2(_1650);
    float _1666 = -_1640;
    float _1668 = fma(_1666, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1658);
    float _1670 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1672 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1654);
    float _1674 = fma(_1668, -0.5, 0.5);
    float _1676 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1670);
    float _1678 = fma(_1668, 0.5, 0.5);
    float _1680 = exp2(_1660);
    float _1682 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1672);
    float _1684 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1676);
    float _1686 = fma(_1678, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1688 = _1644 + 1.0;
    float _1690 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1684);
    float _1692 = fma(_1678, _1686, -0.212114393711090087890625);
    float _1694 = 1.0 / _1662;
    float _1696 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1682);
    float _1698 = _1664 * 0.693147182464599609375;
    float _1700 = fma(_1678, _1692, 1.570728778839111328125);
    float _1702 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1704 = sqrt(_1674);
    float _1706 = -_1644;
    float _1708 = fma(_1680, _1688, _1706);
    float _1710 = fma(_1708, 0.5, 0.5);
    float _1712 = _1690 * _1694;
    float _1714 = _1696 * _1694;
    float _1716 = fma(_1712, 0.5, 0.5);
    float _1718 = fma(_1714, -0.5, 0.5);
    float _1720 = _1704 * 0.636619746685028076171875;
    float _1722 = -_1700;
    float _1724 = fma(_1720, _1722, 1.0);
    float3 _4611 = float3(_1716, _1718, _1702);
    float _1726 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4611, float3(0.0), isnan(_4611)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4611, float3(0.0), isnan(_4611)), level(0.0)).x;
    float3 _4622 = float3(_1716, _1718, _1702);
    float4 _1729 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4622, float3(0.0), isnan(_4622)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4622, float3(0.0), isnan(_4622)), level(0.0)).xyzw;
    float _1731 = _1729.x;
    float _1733 = _1729.y;
    float _1735 = _1729.z;
    float _1737 = _1729.w;
    float2 _4639 = float2(_1724, _1710);
    float3 _1741 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4639, float2(0.0), isnan(_4639)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4639, float2(0.0), isnan(_4639)), level(0.0)).xyz;
    float _1743 = _1741.x;
    float _1745 = _1741.y;
    float _1747 = _1741.z;
    float _1749 = in.m_59.y;
    float _1751 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1753 = _818 > 0.5;
    float _1755 = in.m_61.x;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1759 = _808 + _1757;
    float _1761 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1763 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1761;
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1767 = _1765 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1769 = in.m_61.z;
    float _1771 = 1.0 / _1763;
    float _1773 = in.m_61.y;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1777 = _1775 != 0;
    float _1779 = _1628 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1783 = _1781 != 0;
    float _1785 = in.m_61.w;
    float _1787 = 1.0 / _1767;
    bool _1789 = _816 > 0.5;
    bool _1791 = _1789 && _1783;
    float _1793 = in.m_59.x;
    bool _1795 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1797 = isnan(_808);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1809 = _808 + _1807;
    float _1811 = fma(_1620, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1779);
    float _1813 = -_1749;
    float _1815 = _1813 + 1.0;
    float _1817 = _1759 * _1771;
    float _1819 = -_1805;
    float _1821 = _1819 + 1.0;
    out.m_63.x = _1755;
    float _1823 = _1749;
    if (_1777)
    {
        float _1825 = _1753 ? _1815 : _1749;
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1831 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1833 = isnan(_808);
    bool _1835 = _1831 || _1833;
    bool _1837 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1839 = _1835 || _1837;
    float _1841 = float(_1839);
    out.m_63.z = _1769;
    float _1843 = fma(_1630, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1811);
    float _1845 = _1809 * _1787;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1847;
    out.m_63.y = _1773;
    float _1851 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1853 = fma(_1849, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1855 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1855;
    out.m_63.w = _1785;
    float _1859 = fma(_1632, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1843);
    bool _1861 = _808 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1863 = isnan(_808);
    bool _1865 = _1861 || _1863;
    bool _1867 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1869 = _1865 || _1867;
    float _1871 = float(_1869);
    float _1873 = -_1841;
    float _1875 = _1873 + 1.0;
    float _1877 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1879 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1877;
    float _1881 = fma(_1857, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1883 = 0.0;
    float _1885 = _1875;
    if (_1783)
    {
        _1883 = _1793;
    }
    float _1887 = _1883;
    float _1889 = _1841 * _1821;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1895 = _1871 * _1875;
    float _1897 = -_1871;
    float _1899 = _1897 + 1.0;
    float _1901 = _1887;
    if (!_1783)
    {
        _1885 = _1793;
    }
    float _1903 = _1885;
    float _1905 = fma(_1879, _1817, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1907 = _1881 * _1895;
    float _1909 = _1853 * _1895;
    float _1911 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1915 = _1913 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1917 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1907);
    float _1919 = _1905 * _1895;
    float _1921 = exp2(_1751);
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1927 = _1903;
    if (_1791)
    {
        float _1929 = -_1887;
        float _1931 = _1929 + 1.0;
        _1901 = _1931;
    }
    float _1933 = _1901;
    float _1935 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1919);
    float _1937 = fma(_1915, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1939 = fma(_1893, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1941 = fma(_1925, _1845, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1943 = fma(_1899, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1909);
    if (_1783)
    {
        _1927 = _1933;
    }
    float _1945 = _1927;
    float _1947 = fma(_1937, _1889, _1917);
    float _1949 = fma(_1939, _1889, _1935);
    float _1951 = fma(_1941, _1889, _1943);
    float _1953 = _1911 * _1851;
    float _1955 = _1945 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1957 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1947);
    float _1959 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1949);
    float _1961 = -_1921;
    float _1963 = _1961 + 1.0;
    float _1965 = fma(_1805, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1951);
    float _1967 = _1955 * _1829;
    float _1969 = _1957 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1971 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1973 = _1959 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1975 = _1965 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1977 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1979 = _1859 + _1977;
    bool _1981 = _1408 > 0.0;
    bool _1983 = isnan(_1408);
    bool _1985 = _1981 || _1983;
    bool _1987 = isnan(0.0);
    bool _1989 = _1985 || _1987;
    float _1991 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1993 = _1973 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1995 = _1975 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1997 = _1408 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1999 = _1662 + _1979;
    out.gl_Position.x = _1690;
    out.gl_Position.y = _1696;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1662;
    float _2001 = _1997 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2003 = _1999 * 0.5;
    out.m_65.x = _1991;
    out.m_65.y = _1993;
    out.m_65.z = _1995;
    out.m_67.x = _1967;
    out.m_67.y = _1953;
    out.m_69.z = _2003;
    out.m_69.w = _1662;
    out.m_45.x = _2001;
    float _2005 = _1971 * _1726;
    float _2007 = -_1971;
    float _2009 = _2007 + 1.0;
    float _2011 = _1737 * _2005;
    float _2013 = _1747 * _2005;
    float _2015 = _1737 * _2009;
    float _2017 = fma(_1743, _2011, _1731);
    float _2019 = fma(_1745, _2011, _1733);
    float _2021 = fma(_1737, _2013, _1735);
    out.m_71.x = _2017;
    out.m_71.y = _2019;
    out.m_71.z = _2021;
    out.m_71.w = _2015;
    if (_1989)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2023 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2023;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

