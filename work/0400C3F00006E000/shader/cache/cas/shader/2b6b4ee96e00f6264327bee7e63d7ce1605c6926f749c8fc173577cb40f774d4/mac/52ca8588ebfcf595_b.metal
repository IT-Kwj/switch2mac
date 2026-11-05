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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_63 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1028 = false;
    bool _886 = false;
    bool _772 = false;
    bool _630 = false;
    bool _462 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_116);
        out.gl_Position.z = _2376;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2445 = as_type<float>(_152);
        out.gl_Position.z = _2445;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _154 * _154;
    float _192 = _156 * _156;
    float _194 = _158 * _158;
    float _196 = fma(_162, _162, _190);
    float _198 = fma(_164, _164, _192);
    float _200 = fma(_166, _166, _194);
    float _202 = fma(_178, _178, _196);
    float _204 = fma(_180, _180, _198);
    float _206 = sqrt(_202);
    float _208 = sqrt(_204);
    bool _210 = _206 > 0.0;
    float _212 = fma(_182, _182, _200);
    float _214 = sqrt(_212);
    bool _216 = _208 > 0.0;
    float _218 = 0.0;
    float _220 = _160;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _224 = _212;
    if (_210)
    {
        float _226 = rsqrt(_202);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = 0.0;
    if (_216)
    {
        float _232 = rsqrt(_204);
        _230 = _232;
    }
    float _234 = _230;
    bool _236 = _214 > 0.0;
    float _238 = _214;
    if (!_176)
    {
        float _240 = _160 * _160;
        float _242 = _240 * 0.5;
        _238 = _242;
    }
    float _244 = _238;
    float _246 = _244;
    if (!_176)
    {
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _248;
    }
    float _250 = _246;
    bool _252 = !_176;
    float _254 = _250;
    if (!_252)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = _160 * _258;
        float _268 = 1.0 / _262;
        float _270 = _264 * 0.693147182464599609375;
        float _272 = exp2(_266);
        float _274 = 1.0 / _270;
        float _276 = _272 + (-1.0);
        float _278 = -_276;
        float _280 = fma(_278, _274, _160);
        float _282 = _280 * _268;
        float _284 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _284;
    }
    float _286 = _254;
    bool _288 = !_176;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = _160 * _294;
        float _304 = exp2(_302);
        float _306 = -_304;
        float _308 = _306 + 1.0;
        float _310 = _308 * _300;
        _220 = _310;
        _222 = _300;
    }
    float _312 = _220;
    float _314 = _222;
    float _316 = in.m_55.w;
    float _318 = 0.0;
    float _320 = _314;
    if (!_210)
    {
        _318 = 0.0;
    }
    float _322 = _318;
    float _324 = _322;
    if (_210)
    {
        float _326 = _228 * _162;
        _324 = _326;
    }
    float _328 = _324;
    float _330 = 0.0;
    if (!_210)
    {
        _330 = 0.0;
    }
    float _332 = _330;
    float _334 = in.m_42.x;
    float _336 = in.m_42.y;
    float _338 = in.m_42.z;
    float _340 = 0.0;
    float _342 = _332;
    if (!_210)
    {
        _340 = 0.0;
    }
    float _344 = _340;
    float _346 = _344;
    if (_210)
    {
        float _348 = _228 * _154;
        _342 = _348;
    }
    float _350 = _342;
    if (_210)
    {
        float _352 = _228 * _178;
        _346 = _352;
    }
    float _354 = _346;
    float _356 = 0.0;
    if (_236)
    {
        float _358 = rsqrt(_212);
        _356 = _358;
    }
    float _360 = _356;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_216)
    {
        _320 = 0.0;
    }
    float _368 = _320;
    float _370 = _368;
    if (_216)
    {
        float _372 = _234 * _164;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = fma(_312, _184, _364);
    float _378 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_312, _186, _366);
    float _382 = 0.0;
    float _384 = _374;
    if (!_216)
    {
        _382 = 0.0;
    }
    float _386 = _382;
    float _388 = _386;
    if (_216)
    {
        float _390 = _234 * _156;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_312, _188, _378);
    float _396 = 0.0;
    int _398 = as_type<int>(_392);
    if (!_216)
    {
        _396 = 0.0;
    }
    float _400 = _396;
    float _402 = _400;
    if (_216)
    {
        float _404 = _234 * _180;
        _402 = _404;
    }
    float _406 = _402;
    float _408 = 0.0;
    if (!_236)
    {
        _408 = 0.0;
    }
    float _410 = _408;
    float _412 = _410;
    if (!_236)
    {
        _224 = 0.0;
    }
    float _414 = _224;
    float _416 = _414;
    if (_236)
    {
        float _418 = _360 * _166;
        _412 = _418;
    }
    float _420 = _412;
    if (!_236)
    {
        _290 = 0.0;
    }
    float _422 = _290;
    float _424 = _422;
    if (_236)
    {
        float _426 = _360 * _158;
        _416 = _426;
    }
    float _428 = _416;
    if (_236)
    {
        float _430 = _360 * _182;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = fma(_376, _316, _334);
    float _436 = fma(_380, _316, _336);
    float _438 = fma(_394, _316, _338);
    bool _440 = !_362;
    float _442 = _438;
    float _460;
    if (!_440)
    {
        float _444 = in.m_57.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_100);
        float _466 = 1.0 / _464;
        float _468 = _134 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = _470 + _472;
    bool _476 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _478 = isnan(_470);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _490 = _470 + _488;
    bool _492 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _494 = isnan(_470);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _512 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _514 = isnan(_470);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -_486;
    float _526 = _524 + 1.0;
    float _528 = 1.0 / _506;
    float _530 = _522 * _526;
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _536;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _542 = 1.0 / _510;
    float _544 = _502 * _534;
    float _546 = -_502;
    float _548 = _546 + 1.0;
    float _550 = _474 * _528;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _556;
    float _560 = fma(_538, _550, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _562 = fma(_554, _550, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _564 = fma(_558, _550, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _566 = _490 * _542;
    float _568 = _560 * _544;
    float _570 = _562 * _544;
    float _572 = _564 * _544;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _586 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].x, _568);
    float _588 = fma(_576, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _590 = fma(_580, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _592 = fma(_584, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _594 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].y, _570);
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].z, _572);
    float _598 = fma(_588, _530, _586);
    float _600 = fma(_590, _530, _594);
    float _602 = fma(_592, _530, _596);
    float _604 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].x, _598);
    float _606 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].y, _600);
    float _608 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].z, _602);
    bool _610 = !_540;
    float _628;
    if (!_610)
    {
        float _612 = in.m_57.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_100);
        float _634 = 1.0 / _632;
        float _636 = _134 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _638 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _648 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _650 = isnan(_638);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _664 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _666 = isnan(_638);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _676;
    bool _680 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _682 = isnan(_638);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _646;
    float _694 = -_658;
    float _696 = _694 + 1.0;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _700 = 1.0 / _662;
    float _702 = _678 * _692;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = -_690;
    float _710 = _708 + 1.0;
    float _712 = fma(_702, _642, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _714 = _674 * _696;
    float _716 = -_674;
    float _718 = _716 + 1.0;
    float _720 = _658 * _710;
    float _722 = _706 * _700;
    float _724 = _712 * _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _638 + _726;
    float _730 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _732 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[115].x, _724);
    float _734 = fma(_722, _728, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _736 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = fma(_734, _720, _732);
    float _742 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[117].x, _740);
    float _748 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _746 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _738;
    out.m_59.y = _744;
    out.m_59.z = _748;
    out.m_59.w = _750;
    bool _752 = !_698;
    float _770;
    if (!_752)
    {
        float _754 = in.m_57.x;
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _758 = _754 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _762 = _760 * _756;
        float _764 = floor(_762);
        float _766 = -_764;
        float _768 = _762 + _766;
        _770 = _768;
        _772 = true;
    }
    else
    {
        float _774 = float(_100);
        float _776 = 1.0 / _774;
        float _778 = _134 * _776;
        _770 = _778;
    }
    _772 = false;
    float _780 = _770;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _784 = _780 + _782;
    bool _786 = _780 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _788 = isnan(_780);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _798;
    bool _802 = _780 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _804 = isnan(_780);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -_796;
    float _816 = _814 + 1.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _818;
    float _822 = 1.0 / _800;
    bool _824 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _826 = _812 * _816;
    float _828 = -_812;
    float _830 = _828 + 1.0;
    float _832 = _784 * _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _834;
    float _838 = fma(_820, _832, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _840;
    float _844 = fma(_836, _832, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _846 = fma(_842, _832, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _848 = _838 * _826;
    float _850 = _846 * _826;
    float _852 = _844 * _826;
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].x, _848);
    float _856 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].y, _850);
    float _858 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].z, _852);
    float _860 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].x, _854);
    float _862 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].y, _856);
    float _864 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].z, _858);
    bool _866 = !_824;
    float _884;
    if (!_866)
    {
        float _868 = in.m_57.x;
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _884 = _882;
        _886 = true;
    }
    else
    {
        float _888 = float(_100);
        float _890 = 1.0 / _888;
        float _892 = _134 * _890;
        _884 = _892;
    }
    _886 = false;
    float _894 = _884;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _898 = _894 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _904 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _906 = isnan(_894);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _920 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _922 = isnan(_894);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _932;
    bool _936 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _938 = isnan(_894);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _902;
    float _950 = -_914;
    float _952 = _950 + 1.0;
    bool _954 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _956 = 1.0 / _918;
    float _958 = _934 * _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _964 = -_946;
    float _966 = _964 + 1.0;
    float _968 = fma(_958, _898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _970 = _930 * _952;
    float _972 = -_930;
    float _974 = _972 + 1.0;
    float _976 = _914 * _966;
    float _978 = _962 * _956;
    float _980 = _968 * _970;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _984 = _894 + _982;
    float _986 = _860 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[131].x, _980);
    float _990 = fma(_978, _984, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _992 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _996 = fma(_990, _976, _988);
    float _998 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[133].x, _996);
    float _1004 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _994;
    out.m_61.y = _1000;
    out.m_61.z = _1004;
    out.m_61.w = _1006;
    bool _1008 = !_954;
    float _1026;
    if (!_1008)
    {
        float _1010 = in.m_57.x;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[14].y, _134);
        float _1018 = _1016 * _1012;
        float _1020 = floor(_1018);
        float _1022 = -_1020;
        float _1024 = _1018 + _1022;
        _1026 = _1024;
        _1028 = true;
    }
    else
    {
        float _1030 = float(_100);
        float _1032 = 1.0 / _1030;
        float _1034 = _134 * _1032;
        _1026 = _1034;
    }
    _1028 = false;
    float _1036 = _1026;
    float _1038 = in.m_55.x;
    float _1040 = in.m_55.y;
    float _1042 = in.m_55.z;
    float _1044 = _436 * _164;
    float _1046 = _436 * _156;
    float _1048 = _436 * _180;
    float _1050 = in.m_63.x;
    float _1052 = in.m_63.y;
    float _1054 = in.m_63.z;
    float _1056 = fma(_434, _162, _1044);
    float _1058 = fma(_434, _178, _1048);
    float _1060 = in.m_53.w;
    float _1062 = fma(_434, _154, _1046);
    float _1064 = fma(_438, _166, _1056);
    float _1066 = fma(_438, _182, _1058);
    float _1068 = in.m_51.w;
    float _1070 = fma(_438, _158, _1062);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1080 = _1076 || _1078;
    float _1082 = in.m_49.w;
    float _1084 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1086 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1088 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1052);
    float _1092 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1094 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1050);
    float _1096 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1054);
    float _1100 = _1092 * _1090;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1104 = _1096 * _1094;
    float _1106 = _1066 + _1060;
    float _1108 = _1100 * _406;
    float _1110 = _1102 * _1098;
    float _1112 = _1100 * _374;
    float _1114 = _1064 + _1068;
    float _1116 = fma(_1104, _354, _1108);
    float _1118 = _1070 + _1082;
    float _1120 = fma(_1104, _328, _1112);
    float _1122 = _1100 * _392;
    float _1124 = fma(_1110, _432, _1116);
    float _1126 = _1064;
    if (_1080)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = fma(_1110, _420, _1120);
    float _1132 = fma(_1104, _350, _1122);
    float _1134 = _1106 + _1124;
    float _1136 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1138 = _1114 + _1130;
    float _1140 = fma(_1110, _428, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1144 = _1134 + _1142;
    float _1146 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1138 + _1148;
    float _1152 = _1118 + _1140;
    float _1154 = _1144 * _1144;
    float _1156 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1146);
    float _1158 = fma(_1150, _1150, _1154);
    float _1160 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1162 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = sqrt(_1158);
    float _1166 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1160);
    float _1168 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1170 = 1.0 / _1162;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = _1172 + _1162;
    bool _1176 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1178 = _1174 * _1170;
    float _1180 = _1178 * 0.5;
    float _1182 = _1174;
    float _1184 = _1138;
    float _1186 = _1162;
    float _1188 = _1150;
    float _1190 = _1144;
    float _1192 = _1128;
    if (!_1176)
    {
        _1182 = _1138;
    }
    float _1194 = _1182;
    float _1196 = _1194;
    if (!_1176)
    {
        _1184 = _1134;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (!_1176)
    {
        _1186 = _1152;
    }
    float _1202 = _1186;
    bool _1204 = !_1176;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1164 + _1210;
        float _1214 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1158);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = sin(_1226);
        float _1230 = _1224 + (-1.0);
        float _1232 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = fma(_1228, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1236 = fma(_1152, _1224, _1232);
        float _1238 = _1216 * _1234;
        float _1240 = fma(_1150, _1238, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1242 = fma(_1144, _1238, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1206 = _1236;
        _1196 = _1240;
        _1200 = _1242;
    }
    float _1244 = _1206;
    float _1246 = _1196;
    float _1248 = _1200;
    if (!_1080)
    {
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1258 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1254 * 0.15915493667125701904296875;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1262;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1258;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1288 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1286;
        float _1290 = 1.0 / _1282;
        float _1292 = 1.0 / _1288;
        float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1296 = _1284 * _1294;
        float _1298 = _1280 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1302 = fma(_1298, _1296, _1300);
        float _1304 = _1302 * _1292;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1188 = _1292;
        _1190 = _1264;
        _1192 = _1306;
    }
    float _1308 = _1188;
    float _1310 = _1190;
    float _1312 = _1192;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1316 = _1244 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1320 = _1246 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1248 + _1322;
    float _1326 = _1316 * _1316;
    float _1328 = fma(_1320, _1320, _1326);
    float _1330 = fma(_1324, _1324, _1328);
    float _1332 = rsqrt(_1330);
    float _1334 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1336 = _1320 * _1334;
    float _1338 = _1324 * _1334;
    float _1340 = _1336 * _1336;
    float _1342 = _1338 * _1338;
    float _1344 = _1340 + _1342;
    float _1346 = sqrt(_1344);
    bool _1348 = _1346 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = _1346 + _1350;
    float _1354 = _1332;
    float _1356 = _1344;
    float _1358 = _1352;
    float _1360 = _1308;
    float _1362 = _1316;
    float _1364 = _1310;
    if (_1348)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1354 = _1366;
    }
    float _1368 = _1354;
    if (_1348)
    {
        float _1370 = rsqrt(_1344);
        _1356 = _1370;
    }
    float _1372 = _1356;
    float _1374 = _1372;
    if (_1348)
    {
        float _1376 = _1352 * _1368;
        _1358 = _1376;
    }
    float _1378 = _1358;
    if (_1348)
    {
        float _1380 = _1378 * 0.15915493667125701904296875;
        _1360 = _1380;
    }
    float _1382 = _1360;
    float _1384 = _1324;
    if (_1348)
    {
        float _1386 = _1382 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        _1384 = _1388;
    }
    float _1390 = _1384;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1394 = precise::max(0.0, _1392);
    float _1396 = _1368;
    float _1398 = _1394;
    if (_1348)
    {
        float _1400 = _1382 * 6.283185482025146484375;
        float _1402 = cos(_1400);
        _1396 = _1402;
    }
    float _1404 = _1396;
    float _1406 = -_1334;
    float _1408 = -_1394;
    float _1410 = fma(_1316, _1406, _1408);
    if (_1348)
    {
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1412;
    }
    float _1414 = _1362;
    float _1416 = sqrt(_1330);
    float _1418 = _1414;
    float _1420 = _1390;
    if (_1348)
    {
        float _1422 = fma(_1390, _1414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = _1424;
    if (!_1348)
    {
        _1420 = _1336;
    }
    float _1428 = _1420;
    float _1430 = _1428;
    float _1432 = _1404;
    if (_1348)
    {
        float _1434 = _1404 + (-1.0);
        _1398 = _1434;
    }
    float _1436 = _1398;
    float _1438 = _1436;
    if (_1348)
    {
        float _1440 = _1372 * _1424;
        _442 = _1440;
    }
    float _1442 = _442;
    if (!_1348)
    {
        _1426 = _1410;
    }
    float _1444 = _1426;
    float _1446 = _1444;
    if (_1348)
    {
        float _1448 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1448;
    }
    float _1450 = _1364;
    if (_1348)
    {
        float _1452 = _1336 * _1442;
        _1430 = _1452;
    }
    float _1454 = _1430;
    if (!_1348)
    {
        _1438 = _1338;
    }
    float _1456 = _1438;
    float _1458 = _1456;
    if (_1348)
    {
        float _1460 = _1338 * _1442;
        _1458 = _1460;
    }
    float _1462 = _1458;
    if (!_1348)
    {
        _1374 = _1340;
    }
    float _1464 = _1374;
    float _1466 = _1464;
    if (_1348)
    {
        float _1468 = fma(_1410, _1404, _1450);
        _1446 = _1468;
    }
    float _1470 = _1446;
    if (_1348)
    {
        float _1472 = _1454 * _1454;
        _1466 = _1472;
    }
    float _1474 = _1466;
    if (!_1348)
    {
        _1432 = _1342;
    }
    float _1476 = _1432;
    float _1478 = _1476;
    if (_1348)
    {
        float _1480 = _1462 * _1462;
        _1478 = _1480;
    }
    float _1482 = _1478;
    float _1484 = fma(_1470, _1470, _1474);
    float _1486 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1488 = _1484 + _1482;
    float _1490 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1494 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1492);
    float _1496 = precise::clamp(_1494, 0.0, 1.0);
    float _1498 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = rsqrt(_1488);
    float _1502 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1490);
    float _1504 = -_1496;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    float _1510 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1486);
    float _1512 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1502);
    float _1514 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1508);
    float _1518 = abs(_1506);
    float _1520 = log2(_1518);
    float _1522 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1524 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1526 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1528 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1510);
    float _1530 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1532 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1524);
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1536 = _1500 * _1454;
    float _1538 = _1500 * _1470;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1546 = _1500 * _1462;
    float _1548 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1550 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1552 = -_1544;
    float _1554 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1552);
    float _1556 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1558 = -_1534;
    float _1560 = fma(_1558, _1530, 1.0);
    float _1562 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1550);
    float _1564 = -_1546;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1554);
    float _1568 = exp2(_1556);
    float _1570 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1562);
    float _1574 = fma(_1566, -0.5, 0.5);
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1566, 0.5, 0.5);
    float _1580 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1582 = log2(_1560);
    float _1584 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1586 = _1538 + 1.0;
    float _1588 = fma(_1578, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1590 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1592 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1584);
    float _1594 = fma(_1578, _1588, -0.212114393711090087890625);
    float _1596 = 1.0 / _1572;
    float _1598 = -_1538;
    float _1600 = fma(_1568, _1586, _1598);
    float _1602 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1590);
    float _1604 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1592);
    float _1606 = fma(_1578, _1594, 1.570728778839111328125);
    float _1608 = sqrt(_1574);
    float _1610 = _1582 * 0.693147182464599609375;
    float _1612 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1614 = _1602 * _1596;
    float _1616 = _1604 * _1596;
    float _1618 = fma(_1614, 0.5, 0.5);
    float _1620 = fma(_1616, -0.5, 0.5);
    float _1622 = fma(_1600, 0.5, 0.5);
    float _1624 = _1608 * 0.636619746685028076171875;
    float3 _4766 = float3(_1618, _1620, _1612);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4766, float3(0.0), isnan(_4766)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4766, float3(0.0), isnan(_4766)), level(0.0)).x;
    float _1628 = -_1606;
    float _1630 = fma(_1624, _1628, 1.0);
    float3 _4782 = float3(_1618, _1620, _1612);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4782, float3(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4782, float3(0.0), isnan(_4782)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float2 _4799 = float2(_1630, _1622);
    float3 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4799, float2(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4799, float2(0.0), isnan(_4799)), level(0.0)).xyz;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = in.m_65.y;
    float _1655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1657 = in.m_57.y;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1661 = _1659 != 0;
    float _1663 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1667 = _1665 != 0;
    float _1669 = in.m_57.z;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1673 = _1671 != 0;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1679 = in.m_57.w;
    float _1681 = exp2(_1663);
    float _1683 = in.m_57.x;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1687 = _1685 != 0;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1705 = 1.0 / _1677;
    float _1707 = -_1653;
    float _1709 = _1707 + 1.0;
    float _1711 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1717 = _1657 > 0.5;
    float _1719 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1721 = 1.0 / _1691;
    bool _1723 = _1669 > 0.5;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1727 = _1717 ? as_type<int>(_1709) : as_type<int>(_1653);
    float _1729 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1731 = _1723 ? as_type<int>(_1709) : as_type<int>(_1653);
    float _1733 = fma(_1719, -2.0, _1725);
    float _1735 = _1667 ? as_type<float>(_1727) : _1653;
    float _1737 = 1.0 / _1699;
    float _1739 = _1673 ? as_type<float>(_1731) : _1653;
    float _1741 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1745 = _1743 != 0;
    float _1747 = fma(_1711, _1735, -0.5);
    bool _1749 = _1679 > 0.5;
    float _1751 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1733);
    float _1753 = 1.0 / _1703;
    float _1755 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1729);
    float _1757 = _1653;
    bool _1759 = _1749;
    float _1761 = _1669;
    if (_1661)
    {
        float _1763 = _1749 ? _1709 : _1653;
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = -_1681;
    float _1769 = _1767 + 1.0;
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1773 = _1771 != 0;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1777 = 1.0 / _1715;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1779;
    float _1783 = -_1775;
    float _1785 = fma(_1741, 2.0, _1783);
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1791 = _1781 * _1721;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1793;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1801 = 1.0 / _1789;
    float _1803 = _1795 * _1737;
    float _1805 = _1799 * _1705;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    if (!_1773)
    {
        _1819 = _1657;
    }
    float _1821 = _1819;
    float _1823 = _1809 * _1753;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1827 = _1813 * _1777;
    float _1829 = _1821;
    if (_1687)
    {
        bool _1831 = _1683 > 0.5;
        _1759 = _1831;
    }
    bool _1833 = _1759;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1837 = _1036 + _1835;
    float _1839 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1825);
    if (_1773)
    {
        _1829 = _1683;
    }
    float _1841 = _1829;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1845 = 0.0;
    if (!_1773)
    {
        _1845 = _1669;
    }
    float _1847 = _1845;
    float _1849 = fma(_1803, _1837, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1851 = _1847;
    if (_1773)
    {
        _1761 = _1657;
    }
    float _1853 = _1761;
    float _1855 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1843);
    if (_1773)
    {
        _1851 = _1657;
    }
    float _1857 = _1851;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1861 = _1036 + _1859;
    float _1863 = in.m_67.x;
    float _1865 = in.m_67.y;
    float _1867 = in.m_67.z;
    bool _1869 = _1052 != 0.0;
    bool _1871 = isnan(_1052);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan(0.0);
    bool _1877 = _1873 || _1875;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1883 = fma(_1805, _1861, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1887 = _1036 + _1885;
    bool _1889 = _1050 == 0.0;
    bool _1891 = !_1877;
    bool _1893 = _1889 && _1891;
    float _1895 = _1881 * _1801;
    float _1897 = fma(_1823, _1887, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1901 = _1036 + _1899;
    bool _1903 = _1054 == 0.0;
    bool _1905 = _1903 && _1893;
    float _1907 = 1.0 / _1817;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1911 = fma(_1895, _1901, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1913 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1915 = isnan(_1036);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = in.m_65.x;
    float _1927 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1909);
    bool _1929 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1931 = isnan(_1036);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1937 = _1933 || _1935;
    float _1939 = float(_1937);
    float _1941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1855);
    float _1943 = -_1923;
    float _1945 = _1943 + 1.0;
    bool _1947 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1949 = isnan(_1036);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1955 = _1951 || _1953;
    float _1957 = float(_1955);
    float _1959 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1961 = -_1751;
    float _1963 = fma(_1941, _1747, _1961);
    float _1965 = _1863;
    float _1967 = _1865;
    float _1969 = _1867;
    if (!_1905)
    {
        float _1971 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1863);
        _1965 = _1971;
    }
    float _1973 = _1965;
    if (!_1905)
    {
        float _1975 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1865);
        _1967 = _1975;
    }
    float _1977 = _1967;
    float _1979 = _1939 * _1945;
    float _1981 = -_1939;
    float _1983 = _1981 + 1.0;
    bool _1985 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1987 = isnan(_1036);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    if (!_1905)
    {
        float _1997 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1867);
        _1969 = _1997;
    }
    float _1999 = _1969;
    bool _2001 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2003 = isnan(_1036);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1957;
    float _2015 = _2013 + 1.0;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2017;
    float _2021 = -_1995;
    float _2023 = _2021 + 1.0;
    float _2025 = _1957 * _1983;
    float _2027 = _1995 * _2015;
    float _2029 = _2019 * _1907;
    float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2033 = _1036 + _2031;
    float _2035 = _2011 * _2023;
    bool _2037 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2039 = isnan(_1036);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2051 = _1036 + _2049;
    float _2053 = fma(_2029, _2033, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2055 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2057 = isnan(_1036);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    float _2067 = -_2011;
    float _2069 = _2067 + 1.0;
    bool _2071 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2073 = isnan(_1036);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2079 = _2075 || _2077;
    float _2081 = float(_2079);
    float _2083 = -_2047;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1791, _2051, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2091 = _1036 + _2089;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2095 = _2065 * _2069;
    float _2097 = _2081 * _2085;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2101 = -_2065;
    float _2103 = _2101 + 1.0;
    float _2105 = -_2081;
    float _2107 = _2105 + 1.0;
    float _2109 = _1849 * _2097;
    float _2111 = fma(_1959, -2.0, _2099);
    float _2113 = _392 * _1977;
    float _2115 = _2091;
    int _2117 = as_type<int>(_2107);
    float _2119 = _1925;
    if (_1687)
    {
        float _2121 = -_1925;
        float _2123 = _2121 + 1.0;
        _398 = as_type<int>(_2123);
    }
    int _2125 = _398;
    float _2127 = fma(_1827, _2091, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2129 = _2047 * _2103;
    if (!_1687)
    {
        _2115 = _1925;
    }
    float _2131 = _2115;
    float _2133 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2109);
    float _2135 = _406 * _1977;
    float _2137 = _2131;
    if (_1687)
    {
        float _2139 = _1833 ? as_type<float>(_2125) : _1925;
        _2137 = _2139;
    }
    float _2141 = _2137;
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2145 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2149 = fma(_1883, _2129, _2133);
    float _2151 = fma(_2145, _1765, -0.5);
    float _2153 = _374 * _1977;
    float _2155 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2147);
    float _2157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2159 = fma(_2087, _2095, _2149);
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2163 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1695)
    {
        float _2165 = -_1925;
        float _2167 = _2165 + 1.0;
        _2117 = as_type<int>(_2167);
    }
    int _2169 = _2117;
    float _2171 = fma(_328, _1973, _2153);
    float _2173 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1927);
    float _2175 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2111);
    float _2177 = fma(_1897, _2035, _2159);
    float _2179 = -_2161;
    float _2181 = fma(_2163, 2.0, _2179);
    float _2183 = fma(_350, _1973, _2113);
    float _2185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2187 = 0;
    if (_1745)
    {
        float _2189 = -_1925;
        float _2191 = _2189 + 1.0;
        _2187 = as_type<int>(_2191);
    }
    int _2193 = _2187;
    if (!_1695)
    {
        _384 = _1925;
    }
    float _2195 = _384;
    float _2197 = fma(_354, _1973, _2135);
    float _2199 = -_2175;
    float _2201 = fma(_2173, _2151, _2199);
    float _2203 = fma(_2127, _2027, _2177);
    float _2205 = _2195;
    if (_1695)
    {
        float _2207 = _1723 ? as_type<float>(_2169) : _1925;
        _2205 = _2207;
    }
    float _2209 = _2205;
    float _2211 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1839);
    float _2213 = -_134;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1785);
    float _2217 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2155);
    float _2219 = -_134;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2181);
    float _2223 = fma(_428, _1999, _2183);
    float _2225 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2227 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1745)
    {
        float _2229 = _1717 ? as_type<float>(_2193) : _1925;
        _2119 = _2229;
    }
    float _2231 = _2119;
    float _2233 = fma(_1911, _2025, _2203);
    float _2235 = fma(_420, _1999, _2171);
    float _2237 = fma(_2225, _2141, -0.5);
    float _2239 = fma(_2227, _2209, -0.5);
    float _2241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2243 = fma(_2053, _1979, _2233);
    float _2245 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2247 = fma(_2211, _2237, _2215);
    float _2249 = fma(_2217, _2239, _2221);
    float _2251 = fma(_432, _1999, _2197);
    float _2253 = _2245 * _2185;
    float _2255 = _1963 + 0.5;
    float _2257 = _2201 + 0.5;
    float _2259 = _2247 + 0.5;
    float _2261 = _2249 + 0.5;
    float _2263 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2265 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1755);
    bool _2267 = _1312 > 0.0;
    bool _2269 = isnan(_1312);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.0);
    bool _2275 = _2271 || _2273;
    float _2277 = _1572 * 0.5;
    out.m_69.x = _2259;
    out.m_69.y = _2255;
    out.m_69.z = _2261;
    out.m_69.w = _2257;
    float _2279 = _2263 * _2241;
    float _2281 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2283 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2285 = _1602 + _1572;
    float _2287 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2243);
    float _2289 = _2281 + _1572;
    out.m_71.x = _2253;
    out.m_71.y = _2279;
    float _2291 = _2289 * 0.5;
    out.m_73.x = _2235;
    out.m_73.y = _2223;
    out.m_73.z = _2251;
    float _2293 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2295 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2287;
    float _2297 = fma(_1604, -0.5, _2277);
    float _2299 = -_2293;
    float _2301 = _2299 + 1.0;
    float _2303 = _2285 * 0.5;
    out.m_77.x = _1246;
    out.m_77.y = _1244;
    out.m_77.z = _1248;
    out.gl_Position.x = _1602;
    out.gl_Position.y = _1604;
    out.gl_Position.z = _2281;
    out.gl_Position.w = _1572;
    out.m_79.x = _2303;
    out.m_79.y = _2297;
    out.m_79.z = _2291;
    out.m_79.w = _1572;
    out.m_45.x = _2295;
    float _2305 = _2293 * _1626;
    float _2307 = _1641 * _2305;
    float _2309 = _1641 * _2301;
    float _2311 = _1651 * _2305;
    float _2313 = fma(_1647, _2307, _1635);
    float _2315 = fma(_1649, _2307, _1637);
    float _2317 = fma(_1641, _2311, _1639);
    out.m_81.x = _2313;
    out.m_81.y = _2315;
    out.m_81.z = _2317;
    out.m_81.w = _2309;
    if (_2275)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2319 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2319;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1028 = false;
    bool _886 = false;
    bool _772 = false;
    bool _630 = false;
    bool _462 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_116);
        out.gl_Position.z = _2376;
    }
    if (!_104)
    {
        return out;
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2445 = as_type<float>(_152);
        out.gl_Position.z = _2445;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _154 * _154;
    float _192 = _156 * _156;
    float _194 = _158 * _158;
    float _196 = fma(_162, _162, _190);
    float _198 = fma(_164, _164, _192);
    float _200 = fma(_166, _166, _194);
    float _202 = fma(_178, _178, _196);
    float _204 = fma(_180, _180, _198);
    float _206 = sqrt(_202);
    float _208 = sqrt(_204);
    bool _210 = _206 > 0.0;
    float _212 = fma(_182, _182, _200);
    float _214 = sqrt(_212);
    bool _216 = _208 > 0.0;
    float _218 = 0.0;
    float _220 = _160;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _224 = _212;
    if (_210)
    {
        float _226 = rsqrt(_202);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = 0.0;
    if (_216)
    {
        float _232 = rsqrt(_204);
        _230 = _232;
    }
    float _234 = _230;
    bool _236 = _214 > 0.0;
    float _238 = _214;
    if (!_176)
    {
        float _240 = _160 * _160;
        float _242 = _240 * 0.5;
        _238 = _242;
    }
    float _244 = _238;
    float _246 = _244;
    if (!_176)
    {
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _248;
    }
    float _250 = _246;
    bool _252 = !_176;
    float _254 = _250;
    if (!_252)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = _160 * _258;
        float _268 = 1.0 / _262;
        float _270 = _264 * 0.693147182464599609375;
        float _272 = exp2(_266);
        float _274 = 1.0 / _270;
        float _276 = _272 + (-1.0);
        float _278 = -_276;
        float _280 = fma(_278, _274, _160);
        float _282 = _280 * _268;
        float _284 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _284;
    }
    float _286 = _254;
    bool _288 = !_176;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = _160 * _294;
        float _304 = exp2(_302);
        float _306 = -_304;
        float _308 = _306 + 1.0;
        float _310 = _308 * _300;
        _220 = _310;
        _222 = _300;
    }
    float _312 = _220;
    float _314 = _222;
    float _316 = in.m_55.w;
    float _318 = 0.0;
    float _320 = _314;
    if (!_210)
    {
        _318 = 0.0;
    }
    float _322 = _318;
    float _324 = _322;
    if (_210)
    {
        float _326 = _228 * _162;
        _324 = _326;
    }
    float _328 = _324;
    float _330 = 0.0;
    if (!_210)
    {
        _330 = 0.0;
    }
    float _332 = _330;
    float _334 = in.m_42.x;
    float _336 = in.m_42.y;
    float _338 = in.m_42.z;
    float _340 = 0.0;
    float _342 = _332;
    if (!_210)
    {
        _340 = 0.0;
    }
    float _344 = _340;
    float _346 = _344;
    if (_210)
    {
        float _348 = _228 * _154;
        _342 = _348;
    }
    float _350 = _342;
    if (_210)
    {
        float _352 = _228 * _178;
        _346 = _352;
    }
    float _354 = _346;
    float _356 = 0.0;
    if (_236)
    {
        float _358 = rsqrt(_212);
        _356 = _358;
    }
    float _360 = _356;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_216)
    {
        _320 = 0.0;
    }
    float _368 = _320;
    float _370 = _368;
    if (_216)
    {
        float _372 = _234 * _164;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = fma(_312, _184, _364);
    float _378 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_312, _186, _366);
    float _382 = 0.0;
    float _384 = _374;
    if (!_216)
    {
        _382 = 0.0;
    }
    float _386 = _382;
    float _388 = _386;
    if (_216)
    {
        float _390 = _234 * _156;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_312, _188, _378);
    float _396 = 0.0;
    int _398 = as_type<int>(_392);
    if (!_216)
    {
        _396 = 0.0;
    }
    float _400 = _396;
    float _402 = _400;
    if (_216)
    {
        float _404 = _234 * _180;
        _402 = _404;
    }
    float _406 = _402;
    float _408 = 0.0;
    if (!_236)
    {
        _408 = 0.0;
    }
    float _410 = _408;
    float _412 = _410;
    if (!_236)
    {
        _224 = 0.0;
    }
    float _414 = _224;
    float _416 = _414;
    if (_236)
    {
        float _418 = _360 * _166;
        _412 = _418;
    }
    float _420 = _412;
    if (!_236)
    {
        _290 = 0.0;
    }
    float _422 = _290;
    float _424 = _422;
    if (_236)
    {
        float _426 = _360 * _158;
        _416 = _426;
    }
    float _428 = _416;
    if (_236)
    {
        float _430 = _360 * _182;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = fma(_376, _316, _334);
    float _436 = fma(_380, _316, _336);
    float _438 = fma(_394, _316, _338);
    bool _440 = !_362;
    float _442 = _438;
    float _460;
    if (!_440)
    {
        float _444 = in.m_57.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_100);
        float _466 = 1.0 / _464;
        float _468 = _134 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = _470 + _472;
    bool _476 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _478 = isnan(_470);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _490 = _470 + _488;
    bool _492 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _494 = isnan(_470);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _512 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _514 = isnan(_470);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -_486;
    float _526 = _524 + 1.0;
    float _528 = 1.0 / _506;
    float _530 = _522 * _526;
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _536;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _542 = 1.0 / _510;
    float _544 = _502 * _534;
    float _546 = -_502;
    float _548 = _546 + 1.0;
    float _550 = _474 * _528;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _556;
    float _560 = fma(_538, _550, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _562 = fma(_554, _550, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _564 = fma(_558, _550, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _566 = _490 * _542;
    float _568 = _560 * _544;
    float _570 = _562 * _544;
    float _572 = _564 * _544;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _586 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].x, _568);
    float _588 = fma(_576, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _590 = fma(_580, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _592 = fma(_584, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _594 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].y, _570);
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].z, _572);
    float _598 = fma(_588, _530, _586);
    float _600 = fma(_590, _530, _594);
    float _602 = fma(_592, _530, _596);
    float _604 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].x, _598);
    float _606 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].y, _600);
    float _608 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].z, _602);
    bool _610 = !_540;
    float _628;
    if (!_610)
    {
        float _612 = in.m_57.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_100);
        float _634 = 1.0 / _632;
        float _636 = _134 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _638 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _648 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _650 = isnan(_638);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _664 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _666 = isnan(_638);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _676;
    bool _680 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _682 = isnan(_638);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _646;
    float _694 = -_658;
    float _696 = _694 + 1.0;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _700 = 1.0 / _662;
    float _702 = _678 * _692;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = -_690;
    float _710 = _708 + 1.0;
    float _712 = fma(_702, _642, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _714 = _674 * _696;
    float _716 = -_674;
    float _718 = _716 + 1.0;
    float _720 = _658 * _710;
    float _722 = _706 * _700;
    float _724 = _712 * _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _638 + _726;
    float _730 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _732 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[115].x, _724);
    float _734 = fma(_722, _728, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _736 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = fma(_734, _720, _732);
    float _742 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[117].x, _740);
    float _748 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _746 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _738;
    out.m_59.y = _744;
    out.m_59.z = _748;
    out.m_59.w = _750;
    bool _752 = !_698;
    float _770;
    if (!_752)
    {
        float _754 = in.m_57.x;
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _758 = _754 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _762 = _760 * _756;
        float _764 = floor(_762);
        float _766 = -_764;
        float _768 = _762 + _766;
        _770 = _768;
        _772 = true;
    }
    else
    {
        float _774 = float(_100);
        float _776 = 1.0 / _774;
        float _778 = _134 * _776;
        _770 = _778;
    }
    _772 = false;
    float _780 = _770;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _784 = _780 + _782;
    bool _786 = _780 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _788 = isnan(_780);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _798;
    bool _802 = _780 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _804 = isnan(_780);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -_796;
    float _816 = _814 + 1.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _818;
    float _822 = 1.0 / _800;
    bool _824 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _826 = _812 * _816;
    float _828 = -_812;
    float _830 = _828 + 1.0;
    float _832 = _784 * _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _834;
    float _838 = fma(_820, _832, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _840;
    float _844 = fma(_836, _832, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _846 = fma(_842, _832, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _848 = _838 * _826;
    float _850 = _846 * _826;
    float _852 = _844 * _826;
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].x, _848);
    float _856 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].y, _850);
    float _858 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].z, _852);
    float _860 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].x, _854);
    float _862 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].y, _856);
    float _864 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].z, _858);
    bool _866 = !_824;
    float _884;
    if (!_866)
    {
        float _868 = in.m_57.x;
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _884 = _882;
        _886 = true;
    }
    else
    {
        float _888 = float(_100);
        float _890 = 1.0 / _888;
        float _892 = _134 * _890;
        _884 = _892;
    }
    _886 = false;
    float _894 = _884;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _898 = _894 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _904 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _906 = isnan(_894);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _920 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _922 = isnan(_894);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _932;
    bool _936 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _938 = isnan(_894);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _902;
    float _950 = -_914;
    float _952 = _950 + 1.0;
    bool _954 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _956 = 1.0 / _918;
    float _958 = _934 * _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _964 = -_946;
    float _966 = _964 + 1.0;
    float _968 = fma(_958, _898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _970 = _930 * _952;
    float _972 = -_930;
    float _974 = _972 + 1.0;
    float _976 = _914 * _966;
    float _978 = _962 * _956;
    float _980 = _968 * _970;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _984 = _894 + _982;
    float _986 = _860 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[131].x, _980);
    float _990 = fma(_978, _984, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _992 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _996 = fma(_990, _976, _988);
    float _998 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[133].x, _996);
    float _1004 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _994;
    out.m_61.y = _1000;
    out.m_61.z = _1004;
    out.m_61.w = _1006;
    bool _1008 = !_954;
    float _1026;
    if (!_1008)
    {
        float _1010 = in.m_57.x;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[14].y, _134);
        float _1018 = _1016 * _1012;
        float _1020 = floor(_1018);
        float _1022 = -_1020;
        float _1024 = _1018 + _1022;
        _1026 = _1024;
        _1028 = true;
    }
    else
    {
        float _1030 = float(_100);
        float _1032 = 1.0 / _1030;
        float _1034 = _134 * _1032;
        _1026 = _1034;
    }
    _1028 = false;
    float _1036 = _1026;
    float _1038 = in.m_55.x;
    float _1040 = in.m_55.y;
    float _1042 = in.m_55.z;
    float _1044 = _436 * _164;
    float _1046 = _436 * _156;
    float _1048 = _436 * _180;
    float _1050 = in.m_63.x;
    float _1052 = in.m_63.y;
    float _1054 = in.m_63.z;
    float _1056 = fma(_434, _162, _1044);
    float _1058 = fma(_434, _178, _1048);
    float _1060 = in.m_53.w;
    float _1062 = fma(_434, _154, _1046);
    float _1064 = fma(_438, _166, _1056);
    float _1066 = fma(_438, _182, _1058);
    float _1068 = in.m_51.w;
    float _1070 = fma(_438, _158, _1062);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1080 = _1076 || _1078;
    float _1082 = in.m_49.w;
    float _1084 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1086 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1088 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1052);
    float _1092 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1094 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1050);
    float _1096 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1054);
    float _1100 = _1092 * _1090;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1104 = _1096 * _1094;
    float _1106 = _1066 + _1060;
    float _1108 = _1100 * _406;
    float _1110 = _1102 * _1098;
    float _1112 = _1100 * _374;
    float _1114 = _1064 + _1068;
    float _1116 = fma(_1104, _354, _1108);
    float _1118 = _1070 + _1082;
    float _1120 = fma(_1104, _328, _1112);
    float _1122 = _1100 * _392;
    float _1124 = fma(_1110, _432, _1116);
    float _1126 = _1064;
    if (_1080)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = fma(_1110, _420, _1120);
    float _1132 = fma(_1104, _350, _1122);
    float _1134 = _1106 + _1124;
    float _1136 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1138 = _1114 + _1130;
    float _1140 = fma(_1110, _428, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1144 = _1134 + _1142;
    float _1146 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1138 + _1148;
    float _1152 = _1118 + _1140;
    float _1154 = _1144 * _1144;
    float _1156 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1146);
    float _1158 = fma(_1150, _1150, _1154);
    float _1160 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1162 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = sqrt(_1158);
    float _1166 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1160);
    float _1168 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1170 = 1.0 / _1162;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = _1172 + _1162;
    bool _1176 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1178 = _1174 * _1170;
    float _1180 = _1178 * 0.5;
    float _1182 = _1174;
    float _1184 = _1138;
    float _1186 = _1162;
    float _1188 = _1150;
    float _1190 = _1144;
    float _1192 = _1128;
    if (!_1176)
    {
        _1182 = _1138;
    }
    float _1194 = _1182;
    float _1196 = _1194;
    if (!_1176)
    {
        _1184 = _1134;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (!_1176)
    {
        _1186 = _1152;
    }
    float _1202 = _1186;
    bool _1204 = !_1176;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1164 + _1210;
        float _1214 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1158);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = sin(_1226);
        float _1230 = _1224 + (-1.0);
        float _1232 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = fma(_1228, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1236 = fma(_1152, _1224, _1232);
        float _1238 = _1216 * _1234;
        float _1240 = fma(_1150, _1238, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1242 = fma(_1144, _1238, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1206 = _1236;
        _1196 = _1240;
        _1200 = _1242;
    }
    float _1244 = _1206;
    float _1246 = _1196;
    float _1248 = _1200;
    if (!_1080)
    {
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1258 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1254 * 0.15915493667125701904296875;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1262;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1258;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1288 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1286;
        float _1290 = 1.0 / _1282;
        float _1292 = 1.0 / _1288;
        float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1296 = _1284 * _1294;
        float _1298 = _1280 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1302 = fma(_1298, _1296, _1300);
        float _1304 = _1302 * _1292;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1188 = _1292;
        _1190 = _1264;
        _1192 = _1306;
    }
    float _1308 = _1188;
    float _1310 = _1190;
    float _1312 = _1192;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1316 = _1244 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1320 = _1246 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1248 + _1322;
    float _1326 = _1316 * _1316;
    float _1328 = fma(_1320, _1320, _1326);
    float _1330 = fma(_1324, _1324, _1328);
    float _1332 = rsqrt(_1330);
    float _1334 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1336 = _1320 * _1334;
    float _1338 = _1324 * _1334;
    float _1340 = _1336 * _1336;
    float _1342 = _1338 * _1338;
    float _1344 = _1340 + _1342;
    float _1346 = sqrt(_1344);
    bool _1348 = _1346 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = _1346 + _1350;
    float _1354 = _1332;
    float _1356 = _1344;
    float _1358 = _1352;
    float _1360 = _1308;
    float _1362 = _1316;
    float _1364 = _1310;
    if (_1348)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1354 = _1366;
    }
    float _1368 = _1354;
    if (_1348)
    {
        float _1370 = rsqrt(_1344);
        _1356 = _1370;
    }
    float _1372 = _1356;
    float _1374 = _1372;
    if (_1348)
    {
        float _1376 = _1352 * _1368;
        _1358 = _1376;
    }
    float _1378 = _1358;
    if (_1348)
    {
        float _1380 = _1378 * 0.15915493667125701904296875;
        _1360 = _1380;
    }
    float _1382 = _1360;
    float _1384 = _1324;
    if (_1348)
    {
        float _1386 = _1382 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        _1384 = _1388;
    }
    float _1390 = _1384;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1394 = precise::max(0.0, _1392);
    float _1396 = _1368;
    float _1398 = _1394;
    if (_1348)
    {
        float _1400 = _1382 * 6.283185482025146484375;
        float _1402 = cos(_1400);
        _1396 = _1402;
    }
    float _1404 = _1396;
    float _1406 = -_1334;
    float _1408 = -_1394;
    float _1410 = fma(_1316, _1406, _1408);
    if (_1348)
    {
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1412;
    }
    float _1414 = _1362;
    float _1416 = sqrt(_1330);
    float _1418 = _1414;
    float _1420 = _1390;
    if (_1348)
    {
        float _1422 = fma(_1390, _1414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = _1424;
    if (!_1348)
    {
        _1420 = _1336;
    }
    float _1428 = _1420;
    float _1430 = _1428;
    float _1432 = _1404;
    if (_1348)
    {
        float _1434 = _1404 + (-1.0);
        _1398 = _1434;
    }
    float _1436 = _1398;
    float _1438 = _1436;
    if (_1348)
    {
        float _1440 = _1372 * _1424;
        _442 = _1440;
    }
    float _1442 = _442;
    if (!_1348)
    {
        _1426 = _1410;
    }
    float _1444 = _1426;
    float _1446 = _1444;
    if (_1348)
    {
        float _1448 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1448;
    }
    float _1450 = _1364;
    if (_1348)
    {
        float _1452 = _1336 * _1442;
        _1430 = _1452;
    }
    float _1454 = _1430;
    if (!_1348)
    {
        _1438 = _1338;
    }
    float _1456 = _1438;
    float _1458 = _1456;
    if (_1348)
    {
        float _1460 = _1338 * _1442;
        _1458 = _1460;
    }
    float _1462 = _1458;
    if (!_1348)
    {
        _1374 = _1340;
    }
    float _1464 = _1374;
    float _1466 = _1464;
    if (_1348)
    {
        float _1468 = fma(_1410, _1404, _1450);
        _1446 = _1468;
    }
    float _1470 = _1446;
    if (_1348)
    {
        float _1472 = _1454 * _1454;
        _1466 = _1472;
    }
    float _1474 = _1466;
    if (!_1348)
    {
        _1432 = _1342;
    }
    float _1476 = _1432;
    float _1478 = _1476;
    if (_1348)
    {
        float _1480 = _1462 * _1462;
        _1478 = _1480;
    }
    float _1482 = _1478;
    float _1484 = fma(_1470, _1470, _1474);
    float _1486 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1488 = _1484 + _1482;
    float _1490 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1494 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1492);
    float _1496 = precise::clamp(_1494, 0.0, 1.0);
    float _1498 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = rsqrt(_1488);
    float _1502 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1490);
    float _1504 = -_1496;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    float _1510 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1486);
    float _1512 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1502);
    float _1514 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1508);
    float _1518 = abs(_1506);
    float _1520 = log2(_1518);
    float _1522 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1524 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1526 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1528 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1510);
    float _1530 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1532 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1524);
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1536 = _1500 * _1454;
    float _1538 = _1500 * _1470;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1546 = _1500 * _1462;
    float _1548 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1550 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1552 = -_1544;
    float _1554 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1552);
    float _1556 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1558 = -_1534;
    float _1560 = fma(_1558, _1530, 1.0);
    float _1562 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1550);
    float _1564 = -_1546;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1554);
    float _1568 = exp2(_1556);
    float _1570 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1562);
    float _1574 = fma(_1566, -0.5, 0.5);
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1566, 0.5, 0.5);
    float _1580 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1582 = log2(_1560);
    float _1584 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1586 = _1538 + 1.0;
    float _1588 = fma(_1578, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1590 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1592 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1584);
    float _1594 = fma(_1578, _1588, -0.212114393711090087890625);
    float _1596 = 1.0 / _1572;
    float _1598 = -_1538;
    float _1600 = fma(_1568, _1586, _1598);
    float _1602 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1590);
    float _1604 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1592);
    float _1606 = fma(_1578, _1594, 1.570728778839111328125);
    float _1608 = sqrt(_1574);
    float _1610 = _1582 * 0.693147182464599609375;
    float _1612 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1614 = _1602 * _1596;
    float _1616 = _1604 * _1596;
    float _1618 = fma(_1614, 0.5, 0.5);
    float _1620 = fma(_1616, -0.5, 0.5);
    float _1622 = fma(_1600, 0.5, 0.5);
    float _1624 = _1608 * 0.636619746685028076171875;
    float3 _4766 = float3(_1618, _1620, _1612);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4766, float3(0.0), isnan(_4766)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4766, float3(0.0), isnan(_4766)), level(0.0)).x;
    float _1628 = -_1606;
    float _1630 = fma(_1624, _1628, 1.0);
    float3 _4782 = float3(_1618, _1620, _1612);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4782, float3(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4782, float3(0.0), isnan(_4782)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float2 _4799 = float2(_1630, _1622);
    float3 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4799, float2(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4799, float2(0.0), isnan(_4799)), level(0.0)).xyz;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = in.m_65.y;
    float _1655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1657 = in.m_57.y;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1661 = _1659 != 0;
    float _1663 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1667 = _1665 != 0;
    float _1669 = in.m_57.z;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1673 = _1671 != 0;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1679 = in.m_57.w;
    float _1681 = exp2(_1663);
    float _1683 = in.m_57.x;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1687 = _1685 != 0;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1705 = 1.0 / _1677;
    float _1707 = -_1653;
    float _1709 = _1707 + 1.0;
    float _1711 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1717 = _1657 > 0.5;
    float _1719 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1721 = 1.0 / _1691;
    bool _1723 = _1669 > 0.5;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1727 = _1717 ? as_type<int>(_1709) : as_type<int>(_1653);
    float _1729 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1731 = _1723 ? as_type<int>(_1709) : as_type<int>(_1653);
    float _1733 = fma(_1719, -2.0, _1725);
    float _1735 = _1667 ? as_type<float>(_1727) : _1653;
    float _1737 = 1.0 / _1699;
    float _1739 = _1673 ? as_type<float>(_1731) : _1653;
    float _1741 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1745 = _1743 != 0;
    float _1747 = fma(_1711, _1735, -0.5);
    bool _1749 = _1679 > 0.5;
    float _1751 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1733);
    float _1753 = 1.0 / _1703;
    float _1755 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1729);
    float _1757 = _1653;
    bool _1759 = _1749;
    float _1761 = _1669;
    if (_1661)
    {
        float _1763 = _1749 ? _1709 : _1653;
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = -_1681;
    float _1769 = _1767 + 1.0;
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1773 = _1771 != 0;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1777 = 1.0 / _1715;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1779;
    float _1783 = -_1775;
    float _1785 = fma(_1741, 2.0, _1783);
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1791 = _1781 * _1721;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1793;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1801 = 1.0 / _1789;
    float _1803 = _1795 * _1737;
    float _1805 = _1799 * _1705;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    if (!_1773)
    {
        _1819 = _1657;
    }
    float _1821 = _1819;
    float _1823 = _1809 * _1753;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1827 = _1813 * _1777;
    float _1829 = _1821;
    if (_1687)
    {
        bool _1831 = _1683 > 0.5;
        _1759 = _1831;
    }
    bool _1833 = _1759;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1837 = _1036 + _1835;
    float _1839 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1825);
    if (_1773)
    {
        _1829 = _1683;
    }
    float _1841 = _1829;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1845 = 0.0;
    if (!_1773)
    {
        _1845 = _1669;
    }
    float _1847 = _1845;
    float _1849 = fma(_1803, _1837, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1851 = _1847;
    if (_1773)
    {
        _1761 = _1657;
    }
    float _1853 = _1761;
    float _1855 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1843);
    if (_1773)
    {
        _1851 = _1657;
    }
    float _1857 = _1851;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1861 = _1036 + _1859;
    float _1863 = in.m_67.x;
    float _1865 = in.m_67.y;
    float _1867 = in.m_67.z;
    bool _1869 = _1052 != 0.0;
    bool _1871 = isnan(_1052);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan(0.0);
    bool _1877 = _1873 || _1875;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1883 = fma(_1805, _1861, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1887 = _1036 + _1885;
    bool _1889 = _1050 == 0.0;
    bool _1891 = !_1877;
    bool _1893 = _1889 && _1891;
    float _1895 = _1881 * _1801;
    float _1897 = fma(_1823, _1887, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1901 = _1036 + _1899;
    bool _1903 = _1054 == 0.0;
    bool _1905 = _1903 && _1893;
    float _1907 = 1.0 / _1817;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1911 = fma(_1895, _1901, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1913 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1915 = isnan(_1036);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = in.m_65.x;
    float _1927 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1909);
    bool _1929 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1931 = isnan(_1036);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1937 = _1933 || _1935;
    float _1939 = float(_1937);
    float _1941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1855);
    float _1943 = -_1923;
    float _1945 = _1943 + 1.0;
    bool _1947 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1949 = isnan(_1036);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1955 = _1951 || _1953;
    float _1957 = float(_1955);
    float _1959 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1961 = -_1751;
    float _1963 = fma(_1941, _1747, _1961);
    float _1965 = _1863;
    float _1967 = _1865;
    float _1969 = _1867;
    if (!_1905)
    {
        float _1971 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1863);
        _1965 = _1971;
    }
    float _1973 = _1965;
    if (!_1905)
    {
        float _1975 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1865);
        _1967 = _1975;
    }
    float _1977 = _1967;
    float _1979 = _1939 * _1945;
    float _1981 = -_1939;
    float _1983 = _1981 + 1.0;
    bool _1985 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1987 = isnan(_1036);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    if (!_1905)
    {
        float _1997 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1867);
        _1969 = _1997;
    }
    float _1999 = _1969;
    bool _2001 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2003 = isnan(_1036);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1957;
    float _2015 = _2013 + 1.0;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2017;
    float _2021 = -_1995;
    float _2023 = _2021 + 1.0;
    float _2025 = _1957 * _1983;
    float _2027 = _1995 * _2015;
    float _2029 = _2019 * _1907;
    float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2033 = _1036 + _2031;
    float _2035 = _2011 * _2023;
    bool _2037 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2039 = isnan(_1036);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2051 = _1036 + _2049;
    float _2053 = fma(_2029, _2033, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2055 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2057 = isnan(_1036);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    float _2067 = -_2011;
    float _2069 = _2067 + 1.0;
    bool _2071 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2073 = isnan(_1036);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2079 = _2075 || _2077;
    float _2081 = float(_2079);
    float _2083 = -_2047;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1791, _2051, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2091 = _1036 + _2089;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2095 = _2065 * _2069;
    float _2097 = _2081 * _2085;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2101 = -_2065;
    float _2103 = _2101 + 1.0;
    float _2105 = -_2081;
    float _2107 = _2105 + 1.0;
    float _2109 = _1849 * _2097;
    float _2111 = fma(_1959, -2.0, _2099);
    float _2113 = _392 * _1977;
    float _2115 = _2091;
    int _2117 = as_type<int>(_2107);
    float _2119 = _1925;
    if (_1687)
    {
        float _2121 = -_1925;
        float _2123 = _2121 + 1.0;
        _398 = as_type<int>(_2123);
    }
    int _2125 = _398;
    float _2127 = fma(_1827, _2091, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2129 = _2047 * _2103;
    if (!_1687)
    {
        _2115 = _1925;
    }
    float _2131 = _2115;
    float _2133 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2109);
    float _2135 = _406 * _1977;
    float _2137 = _2131;
    if (_1687)
    {
        float _2139 = _1833 ? as_type<float>(_2125) : _1925;
        _2137 = _2139;
    }
    float _2141 = _2137;
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2145 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2149 = fma(_1883, _2129, _2133);
    float _2151 = fma(_2145, _1765, -0.5);
    float _2153 = _374 * _1977;
    float _2155 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2147);
    float _2157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2159 = fma(_2087, _2095, _2149);
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2163 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1695)
    {
        float _2165 = -_1925;
        float _2167 = _2165 + 1.0;
        _2117 = as_type<int>(_2167);
    }
    int _2169 = _2117;
    float _2171 = fma(_328, _1973, _2153);
    float _2173 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1927);
    float _2175 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2111);
    float _2177 = fma(_1897, _2035, _2159);
    float _2179 = -_2161;
    float _2181 = fma(_2163, 2.0, _2179);
    float _2183 = fma(_350, _1973, _2113);
    float _2185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2187 = 0;
    if (_1745)
    {
        float _2189 = -_1925;
        float _2191 = _2189 + 1.0;
        _2187 = as_type<int>(_2191);
    }
    int _2193 = _2187;
    if (!_1695)
    {
        _384 = _1925;
    }
    float _2195 = _384;
    float _2197 = fma(_354, _1973, _2135);
    float _2199 = -_2175;
    float _2201 = fma(_2173, _2151, _2199);
    float _2203 = fma(_2127, _2027, _2177);
    float _2205 = _2195;
    if (_1695)
    {
        float _2207 = _1723 ? as_type<float>(_2169) : _1925;
        _2205 = _2207;
    }
    float _2209 = _2205;
    float _2211 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1839);
    float _2213 = -_134;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1785);
    float _2217 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2155);
    float _2219 = -_134;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2181);
    float _2223 = fma(_428, _1999, _2183);
    float _2225 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2227 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1745)
    {
        float _2229 = _1717 ? as_type<float>(_2193) : _1925;
        _2119 = _2229;
    }
    float _2231 = _2119;
    float _2233 = fma(_1911, _2025, _2203);
    float _2235 = fma(_420, _1999, _2171);
    float _2237 = fma(_2225, _2141, -0.5);
    float _2239 = fma(_2227, _2209, -0.5);
    float _2241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2243 = fma(_2053, _1979, _2233);
    float _2245 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2247 = fma(_2211, _2237, _2215);
    float _2249 = fma(_2217, _2239, _2221);
    float _2251 = fma(_432, _1999, _2197);
    float _2253 = _2245 * _2185;
    float _2255 = _1963 + 0.5;
    float _2257 = _2201 + 0.5;
    float _2259 = _2247 + 0.5;
    float _2261 = _2249 + 0.5;
    float _2263 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2265 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1755);
    bool _2267 = _1312 > 0.0;
    bool _2269 = isnan(_1312);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.0);
    bool _2275 = _2271 || _2273;
    float _2277 = _1572 * 0.5;
    out.m_69.x = _2259;
    out.m_69.y = _2255;
    out.m_69.z = _2261;
    out.m_69.w = _2257;
    float _2279 = _2263 * _2241;
    float _2281 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2283 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2285 = _1602 + _1572;
    float _2287 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2243);
    float _2289 = _2281 + _1572;
    out.m_71.x = _2253;
    out.m_71.y = _2279;
    float _2291 = _2289 * 0.5;
    out.m_73.x = _2235;
    out.m_73.y = _2223;
    out.m_73.z = _2251;
    float _2293 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2295 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2287;
    float _2297 = fma(_1604, -0.5, _2277);
    float _2299 = -_2293;
    float _2301 = _2299 + 1.0;
    float _2303 = _2285 * 0.5;
    out.m_77.x = _1246;
    out.m_77.y = _1244;
    out.m_77.z = _1248;
    out.gl_Position.x = _1602;
    out.gl_Position.y = _1604;
    out.gl_Position.z = _2281;
    out.gl_Position.w = _1572;
    out.m_79.x = _2303;
    out.m_79.y = _2297;
    out.m_79.z = _2291;
    out.m_79.w = _1572;
    out.m_45.x = _2295;
    float _2305 = _2293 * _1626;
    float _2307 = _1641 * _2305;
    float _2309 = _1641 * _2301;
    float _2311 = _1651 * _2305;
    float _2313 = fma(_1647, _2307, _1635);
    float _2315 = fma(_1649, _2307, _1637);
    float _2317 = fma(_1641, _2311, _1639);
    out.m_81.x = _2313;
    out.m_81.y = _2315;
    out.m_81.z = _2317;
    out.m_81.w = _2309;
    if (_2275)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2319 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2319;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1028 = false;
    bool _886 = false;
    bool _772 = false;
    bool _630 = false;
    bool _462 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_42.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    float _110 = _108;
    if (!_104)
    {
        out.m_45.x = 0.0;
    }
    int _112 = 0;
    if (!_104)
    {
        float _114 = _108 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2376 = as_type<float>(_116);
        out.gl_Position.z = _2376;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_47.w;
    bool _122 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_120);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_120;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_130)
    {
        float _136 = float(_100);
        _110 = _136;
    }
    float _138 = _110;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_45.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _118 = as_type<int>(_150);
    }
    int _152 = _118;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2445 = as_type<float>(_152);
        out.gl_Position.z = _2445;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_49.x;
    float _156 = in.m_49.y;
    float _158 = in.m_49.z;
    float _160 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _162 = in.m_51.x;
    float _164 = in.m_51.y;
    float _166 = in.m_51.z;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    float _184 = in.m_47.x;
    float _186 = in.m_47.y;
    float _188 = in.m_47.z;
    float _190 = _154 * _154;
    float _192 = _156 * _156;
    float _194 = _158 * _158;
    float _196 = fma(_162, _162, _190);
    float _198 = fma(_164, _164, _192);
    float _200 = fma(_166, _166, _194);
    float _202 = fma(_178, _178, _196);
    float _204 = fma(_180, _180, _198);
    float _206 = sqrt(_202);
    float _208 = sqrt(_204);
    bool _210 = _206 > 0.0;
    float _212 = fma(_182, _182, _200);
    float _214 = sqrt(_212);
    bool _216 = _208 > 0.0;
    float _218 = 0.0;
    float _220 = _160;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[17].x;
    float _224 = _212;
    if (_210)
    {
        float _226 = rsqrt(_202);
        _218 = _226;
    }
    float _228 = _218;
    float _230 = 0.0;
    if (_216)
    {
        float _232 = rsqrt(_204);
        _230 = _232;
    }
    float _234 = _230;
    bool _236 = _214 > 0.0;
    float _238 = _214;
    if (!_176)
    {
        float _240 = _160 * _160;
        float _242 = _240 * 0.5;
        _238 = _242;
    }
    float _244 = _238;
    float _246 = _244;
    if (!_176)
    {
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _246 = _248;
    }
    float _250 = _246;
    bool _252 = !_176;
    float _254 = _250;
    if (!_252)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _266 = _160 * _258;
        float _268 = 1.0 / _262;
        float _270 = _264 * 0.693147182464599609375;
        float _272 = exp2(_266);
        float _274 = 1.0 / _270;
        float _276 = _272 + (-1.0);
        float _278 = -_276;
        float _280 = fma(_278, _274, _160);
        float _282 = _280 * _268;
        float _284 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _254 = _284;
    }
    float _286 = _254;
    bool _288 = !_176;
    float _290 = _286;
    if (!_288)
    {
        float _292 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = log2(_292);
        float _296 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _298 = _296 + 1.0;
        float _300 = 1.0 / _298;
        float _302 = _160 * _294;
        float _304 = exp2(_302);
        float _306 = -_304;
        float _308 = _306 + 1.0;
        float _310 = _308 * _300;
        _220 = _310;
        _222 = _300;
    }
    float _312 = _220;
    float _314 = _222;
    float _316 = in.m_55.w;
    float _318 = 0.0;
    float _320 = _314;
    if (!_210)
    {
        _318 = 0.0;
    }
    float _322 = _318;
    float _324 = _322;
    if (_210)
    {
        float _326 = _228 * _162;
        _324 = _326;
    }
    float _328 = _324;
    float _330 = 0.0;
    if (!_210)
    {
        _330 = 0.0;
    }
    float _332 = _330;
    float _334 = in.m_42.x;
    float _336 = in.m_42.y;
    float _338 = in.m_42.z;
    float _340 = 0.0;
    float _342 = _332;
    if (!_210)
    {
        _340 = 0.0;
    }
    float _344 = _340;
    float _346 = _344;
    if (_210)
    {
        float _348 = _228 * _154;
        _342 = _348;
    }
    float _350 = _342;
    if (_210)
    {
        float _352 = _228 * _178;
        _346 = _352;
    }
    float _354 = _346;
    float _356 = 0.0;
    if (_236)
    {
        float _358 = rsqrt(_212);
        _356 = _358;
    }
    float _360 = _356;
    bool _362 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _364 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    if (!_216)
    {
        _320 = 0.0;
    }
    float _368 = _320;
    float _370 = _368;
    if (_216)
    {
        float _372 = _234 * _164;
        _370 = _372;
    }
    float _374 = _370;
    float _376 = fma(_312, _184, _364);
    float _378 = _286 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _380 = fma(_312, _186, _366);
    float _382 = 0.0;
    float _384 = _374;
    if (!_216)
    {
        _382 = 0.0;
    }
    float _386 = _382;
    float _388 = _386;
    if (_216)
    {
        float _390 = _234 * _156;
        _388 = _390;
    }
    float _392 = _388;
    float _394 = fma(_312, _188, _378);
    float _396 = 0.0;
    int _398 = as_type<int>(_392);
    if (!_216)
    {
        _396 = 0.0;
    }
    float _400 = _396;
    float _402 = _400;
    if (_216)
    {
        float _404 = _234 * _180;
        _402 = _404;
    }
    float _406 = _402;
    float _408 = 0.0;
    if (!_236)
    {
        _408 = 0.0;
    }
    float _410 = _408;
    float _412 = _410;
    if (!_236)
    {
        _224 = 0.0;
    }
    float _414 = _224;
    float _416 = _414;
    if (_236)
    {
        float _418 = _360 * _166;
        _412 = _418;
    }
    float _420 = _412;
    if (!_236)
    {
        _290 = 0.0;
    }
    float _422 = _290;
    float _424 = _422;
    if (_236)
    {
        float _426 = _360 * _158;
        _416 = _426;
    }
    float _428 = _416;
    if (_236)
    {
        float _430 = _360 * _182;
        _424 = _430;
    }
    float _432 = _424;
    float _434 = fma(_376, _316, _334);
    float _436 = fma(_380, _316, _336);
    float _438 = fma(_394, _316, _338);
    bool _440 = !_362;
    float _442 = _438;
    float _460;
    if (!_440)
    {
        float _444 = in.m_57.x;
        float _446 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _448 = _444 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _450 = fma(_448, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _452 = _450 * _446;
        float _454 = floor(_452);
        float _456 = -_454;
        float _458 = _452 + _456;
        _460 = _458;
        _462 = true;
    }
    else
    {
        float _464 = float(_100);
        float _466 = 1.0 / _464;
        float _468 = _134 * _466;
        _460 = _468;
    }
    _462 = false;
    float _470 = _460;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _474 = _470 + _472;
    bool _476 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _478 = isnan(_470);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _490 = _470 + _488;
    bool _492 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _494 = isnan(_470);
    bool _496 = _492 || _494;
    bool _498 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _500 = _496 || _498;
    float _502 = float(_500);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _512 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _514 = isnan(_470);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -_486;
    float _526 = _524 + 1.0;
    float _528 = 1.0 / _506;
    float _530 = _522 * _526;
    float _532 = -_522;
    float _534 = _532 + 1.0;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _536;
    bool _540 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _542 = 1.0 / _510;
    float _544 = _502 * _534;
    float _546 = -_502;
    float _548 = _546 + 1.0;
    float _550 = _474 * _528;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _556;
    float _560 = fma(_538, _550, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _562 = fma(_554, _550, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _564 = fma(_558, _550, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _566 = _490 * _542;
    float _568 = _560 * _544;
    float _570 = _562 * _544;
    float _572 = _564 * _544;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _586 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].x, _568);
    float _588 = fma(_576, _566, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _590 = fma(_580, _566, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _592 = fma(_584, _566, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _594 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].y, _570);
    float _596 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[107].z, _572);
    float _598 = fma(_588, _530, _586);
    float _600 = fma(_590, _530, _594);
    float _602 = fma(_592, _530, _596);
    float _604 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].x, _598);
    float _606 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].y, _600);
    float _608 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[109].z, _602);
    bool _610 = !_540;
    float _628;
    if (!_610)
    {
        float _612 = in.m_57.x;
        float _614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _616 = _612 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _620 = _618 * _614;
        float _622 = floor(_620);
        float _624 = -_622;
        float _626 = _620 + _624;
        _628 = _626;
        _630 = true;
    }
    else
    {
        float _632 = float(_100);
        float _634 = 1.0 / _632;
        float _636 = _134 * _634;
        _628 = _636;
    }
    _630 = false;
    float _638 = _628;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _642 = _638 + _640;
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _646 = _644 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _648 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _650 = isnan(_638);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _664 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _666 = isnan(_638);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _676;
    bool _680 = _638 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _682 = isnan(_638);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = 1.0 / _646;
    float _694 = -_658;
    float _696 = _694 + 1.0;
    bool _698 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _700 = 1.0 / _662;
    float _702 = _678 * _692;
    float _704 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _706 = _704 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _708 = -_690;
    float _710 = _708 + 1.0;
    float _712 = fma(_702, _642, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _714 = _674 * _696;
    float _716 = -_674;
    float _718 = _716 + 1.0;
    float _720 = _658 * _710;
    float _722 = _706 * _700;
    float _724 = _712 * _714;
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _728 = _638 + _726;
    float _730 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _732 = fma(_718, (*spvDescriptorSet0.vp_c9)._m0[115].x, _724);
    float _734 = fma(_722, _728, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _736 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _738 = _730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _740 = fma(_734, _720, _732);
    float _742 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _746 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[117].x, _740);
    float _748 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _746 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _738;
    out.m_59.y = _744;
    out.m_59.z = _748;
    out.m_59.w = _750;
    bool _752 = !_698;
    float _770;
    if (!_752)
    {
        float _754 = in.m_57.x;
        float _756 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _758 = _754 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _760 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _762 = _760 * _756;
        float _764 = floor(_762);
        float _766 = -_764;
        float _768 = _762 + _766;
        _770 = _768;
        _772 = true;
    }
    else
    {
        float _774 = float(_100);
        float _776 = 1.0 / _774;
        float _778 = _134 * _776;
        _770 = _778;
    }
    _772 = false;
    float _780 = _770;
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _784 = _780 + _782;
    bool _786 = _780 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _788 = isnan(_780);
    bool _790 = _786 || _788;
    bool _792 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _794 = _790 || _792;
    float _796 = float(_794);
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _798;
    bool _802 = _780 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _804 = isnan(_780);
    bool _806 = _802 || _804;
    bool _808 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _810 = _806 || _808;
    float _812 = float(_810);
    float _814 = -_796;
    float _816 = _814 + 1.0;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _818;
    float _822 = 1.0 / _800;
    bool _824 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _826 = _812 * _816;
    float _828 = -_812;
    float _830 = _828 + 1.0;
    float _832 = _784 * _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _836 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _834;
    float _838 = fma(_820, _832, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _840;
    float _844 = fma(_836, _832, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _846 = fma(_842, _832, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _848 = _838 * _826;
    float _850 = _846 * _826;
    float _852 = _844 * _826;
    float _854 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].x, _848);
    float _856 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].y, _850);
    float _858 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[123].z, _852);
    float _860 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].x, _854);
    float _862 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].y, _856);
    float _864 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[124].z, _858);
    bool _866 = !_824;
    float _884;
    if (!_866)
    {
        float _868 = in.m_57.x;
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _884 = _882;
        _886 = true;
    }
    else
    {
        float _888 = float(_100);
        float _890 = 1.0 / _888;
        float _892 = _134 * _890;
        _884 = _892;
    }
    _886 = false;
    float _894 = _884;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _898 = _894 + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _904 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _906 = isnan(_894);
    bool _908 = _904 || _906;
    bool _910 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _912 = _908 || _910;
    float _914 = float(_912);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _916 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _920 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _922 = isnan(_894);
    bool _924 = _920 || _922;
    bool _926 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _928 = _924 || _926;
    float _930 = float(_928);
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _932;
    bool _936 = _894 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _938 = isnan(_894);
    bool _940 = _936 || _938;
    bool _942 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _944 = _940 || _942;
    float _946 = float(_944);
    float _948 = 1.0 / _902;
    float _950 = -_914;
    float _952 = _950 + 1.0;
    bool _954 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _956 = 1.0 / _918;
    float _958 = _934 * _948;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _962 = _960 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _964 = -_946;
    float _966 = _964 + 1.0;
    float _968 = fma(_958, _898, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _970 = _930 * _952;
    float _972 = -_930;
    float _974 = _972 + 1.0;
    float _976 = _914 * _966;
    float _978 = _962 * _956;
    float _980 = _968 * _970;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _984 = _894 + _982;
    float _986 = _860 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _988 = fma(_974, (*spvDescriptorSet0.vp_c9)._m0[131].x, _980);
    float _990 = fma(_978, _984, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _992 = _862 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _996 = fma(_990, _976, _988);
    float _998 = _864 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1002 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[133].x, _996);
    float _1004 = _998 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1006 = _1002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _994;
    out.m_61.y = _1000;
    out.m_61.z = _1004;
    out.m_61.w = _1006;
    bool _1008 = !_954;
    float _1026;
    if (!_1008)
    {
        float _1010 = in.m_57.x;
        float _1012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1014 = _1010 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1016 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[14].y, _134);
        float _1018 = _1016 * _1012;
        float _1020 = floor(_1018);
        float _1022 = -_1020;
        float _1024 = _1018 + _1022;
        _1026 = _1024;
        _1028 = true;
    }
    else
    {
        float _1030 = float(_100);
        float _1032 = 1.0 / _1030;
        float _1034 = _134 * _1032;
        _1026 = _1034;
    }
    _1028 = false;
    float _1036 = _1026;
    float _1038 = in.m_55.x;
    float _1040 = in.m_55.y;
    float _1042 = in.m_55.z;
    float _1044 = _436 * _164;
    float _1046 = _436 * _156;
    float _1048 = _436 * _180;
    float _1050 = in.m_63.x;
    float _1052 = in.m_63.y;
    float _1054 = in.m_63.z;
    float _1056 = fma(_434, _162, _1044);
    float _1058 = fma(_434, _178, _1048);
    float _1060 = in.m_53.w;
    float _1062 = fma(_434, _154, _1046);
    float _1064 = fma(_438, _166, _1056);
    float _1066 = fma(_438, _182, _1058);
    float _1068 = in.m_51.w;
    float _1070 = fma(_438, _158, _1062);
    bool _1072 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1074 = isnan(0.5);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1080 = _1076 || _1078;
    float _1082 = in.m_49.w;
    float _1084 = _1040 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1086 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1088 = _1042 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1090 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1052);
    float _1092 = _1084 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1094 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1050);
    float _1096 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1098 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1054);
    float _1100 = _1092 * _1090;
    float _1102 = _1088 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1104 = _1096 * _1094;
    float _1106 = _1066 + _1060;
    float _1108 = _1100 * _406;
    float _1110 = _1102 * _1098;
    float _1112 = _1100 * _374;
    float _1114 = _1064 + _1068;
    float _1116 = fma(_1104, _354, _1108);
    float _1118 = _1070 + _1082;
    float _1120 = fma(_1104, _328, _1112);
    float _1122 = _1100 * _392;
    float _1124 = fma(_1110, _432, _1116);
    float _1126 = _1064;
    if (_1080)
    {
        _1126 = 1.0;
    }
    float _1128 = _1126;
    float _1130 = fma(_1110, _420, _1120);
    float _1132 = fma(_1104, _350, _1122);
    float _1134 = _1106 + _1124;
    float _1136 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1138 = _1114 + _1130;
    float _1140 = fma(_1110, _428, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1144 = _1134 + _1142;
    float _1146 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1150 = _1138 + _1148;
    float _1152 = _1118 + _1140;
    float _1154 = _1144 * _1144;
    float _1156 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1146);
    float _1158 = fma(_1150, _1150, _1154);
    float _1160 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1162 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1164 = sqrt(_1158);
    float _1166 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1160);
    float _1168 = fma(_1106, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1166);
    float _1170 = 1.0 / _1162;
    float _1172 = _1168 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1174 = _1172 + _1162;
    bool _1176 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1178 = _1174 * _1170;
    float _1180 = _1178 * 0.5;
    float _1182 = _1174;
    float _1184 = _1138;
    float _1186 = _1162;
    float _1188 = _1150;
    float _1190 = _1144;
    float _1192 = _1128;
    if (!_1176)
    {
        _1182 = _1138;
    }
    float _1194 = _1182;
    float _1196 = _1194;
    if (!_1176)
    {
        _1184 = _1134;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (!_1176)
    {
        _1186 = _1152;
    }
    float _1202 = _1186;
    bool _1204 = !_1176;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1164 + _1210;
        float _1214 = _1152 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1158);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = cos(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = sin(_1226);
        float _1230 = _1224 + (-1.0);
        float _1232 = _1230 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1234 = fma(_1228, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1236 = fma(_1152, _1224, _1232);
        float _1238 = _1216 * _1234;
        float _1240 = fma(_1150, _1238, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1242 = fma(_1144, _1238, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1206 = _1236;
        _1196 = _1240;
        _1200 = _1242;
    }
    float _1244 = _1206;
    float _1246 = _1196;
    float _1248 = _1200;
    if (!_1080)
    {
        float _1250 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1252 = _1250 * 0.15915493667125701904296875;
        float _1254 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1258 = fma(_1180, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1256);
        float _1260 = _1252 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        float _1264 = _1254 * 0.15915493667125701904296875;
        float _1266 = _1252 * 6.283185482025146484375;
        float _1268 = sin(_1266);
        float _1270 = 1.0 / _1262;
        float _1272 = _1264 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = _1268 * _1270;
        float _1278 = _1264 * 6.283185482025146484375;
        float _1280 = sin(_1278);
        float _1282 = _1274 * _1276;
        float _1284 = 1.0 / _1258;
        float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1288 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1286;
        float _1290 = 1.0 / _1282;
        float _1292 = 1.0 / _1288;
        float _1294 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1296 = _1284 * _1294;
        float _1298 = _1280 * _1290;
        float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1302 = fma(_1298, _1296, _1300);
        float _1304 = _1302 * _1292;
        float _1306 = precise::clamp(_1304, 0.0, 1.0);
        _1188 = _1292;
        _1190 = _1264;
        _1192 = _1306;
    }
    float _1308 = _1188;
    float _1310 = _1190;
    float _1312 = _1192;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1316 = _1244 + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1320 = _1246 + _1318;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1324 = _1248 + _1322;
    float _1326 = _1316 * _1316;
    float _1328 = fma(_1320, _1320, _1326);
    float _1330 = fma(_1324, _1324, _1328);
    float _1332 = rsqrt(_1330);
    float _1334 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1336 = _1320 * _1334;
    float _1338 = _1324 * _1334;
    float _1340 = _1336 * _1336;
    float _1342 = _1338 * _1338;
    float _1344 = _1340 + _1342;
    float _1346 = sqrt(_1344);
    bool _1348 = _1346 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1350 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = _1346 + _1350;
    float _1354 = _1332;
    float _1356 = _1344;
    float _1358 = _1352;
    float _1360 = _1308;
    float _1362 = _1316;
    float _1364 = _1310;
    if (_1348)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1354 = _1366;
    }
    float _1368 = _1354;
    if (_1348)
    {
        float _1370 = rsqrt(_1344);
        _1356 = _1370;
    }
    float _1372 = _1356;
    float _1374 = _1372;
    if (_1348)
    {
        float _1376 = _1352 * _1368;
        _1358 = _1376;
    }
    float _1378 = _1358;
    if (_1348)
    {
        float _1380 = _1378 * 0.15915493667125701904296875;
        _1360 = _1380;
    }
    float _1382 = _1360;
    float _1384 = _1324;
    if (_1348)
    {
        float _1386 = _1382 * 6.283185482025146484375;
        float _1388 = sin(_1386);
        _1384 = _1388;
    }
    float _1390 = _1384;
    float _1392 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1394 = precise::max(0.0, _1392);
    float _1396 = _1368;
    float _1398 = _1394;
    if (_1348)
    {
        float _1400 = _1382 * 6.283185482025146484375;
        float _1402 = cos(_1400);
        _1396 = _1402;
    }
    float _1404 = _1396;
    float _1406 = -_1334;
    float _1408 = -_1394;
    float _1410 = fma(_1316, _1406, _1408);
    if (_1348)
    {
        float _1412 = _1410 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1362 = _1412;
    }
    float _1414 = _1362;
    float _1416 = sqrt(_1330);
    float _1418 = _1414;
    float _1420 = _1390;
    if (_1348)
    {
        float _1422 = fma(_1390, _1414, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = _1424;
    if (!_1348)
    {
        _1420 = _1336;
    }
    float _1428 = _1420;
    float _1430 = _1428;
    float _1432 = _1404;
    if (_1348)
    {
        float _1434 = _1404 + (-1.0);
        _1398 = _1434;
    }
    float _1436 = _1398;
    float _1438 = _1436;
    if (_1348)
    {
        float _1440 = _1372 * _1424;
        _442 = _1440;
    }
    float _1442 = _442;
    if (!_1348)
    {
        _1426 = _1410;
    }
    float _1444 = _1426;
    float _1446 = _1444;
    if (_1348)
    {
        float _1448 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1448;
    }
    float _1450 = _1364;
    if (_1348)
    {
        float _1452 = _1336 * _1442;
        _1430 = _1452;
    }
    float _1454 = _1430;
    if (!_1348)
    {
        _1438 = _1338;
    }
    float _1456 = _1438;
    float _1458 = _1456;
    if (_1348)
    {
        float _1460 = _1338 * _1442;
        _1458 = _1460;
    }
    float _1462 = _1458;
    if (!_1348)
    {
        _1374 = _1340;
    }
    float _1464 = _1374;
    float _1466 = _1464;
    if (_1348)
    {
        float _1468 = fma(_1410, _1404, _1450);
        _1446 = _1468;
    }
    float _1470 = _1446;
    if (_1348)
    {
        float _1472 = _1454 * _1454;
        _1466 = _1472;
    }
    float _1474 = _1466;
    if (!_1348)
    {
        _1432 = _1342;
    }
    float _1476 = _1432;
    float _1478 = _1476;
    if (_1348)
    {
        float _1480 = _1462 * _1462;
        _1478 = _1480;
    }
    float _1482 = _1478;
    float _1484 = fma(_1470, _1470, _1474);
    float _1486 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1488 = _1484 + _1482;
    float _1490 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1494 = fma(_1416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1492);
    float _1496 = precise::clamp(_1494, 0.0, 1.0);
    float _1498 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1500 = rsqrt(_1488);
    float _1502 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1490);
    float _1504 = -_1496;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1498);
    float _1510 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1486);
    float _1512 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1502);
    float _1514 = _1244 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1516 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1508);
    float _1518 = abs(_1506);
    float _1520 = log2(_1518);
    float _1522 = _1512 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1524 = fma(_1246, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1514);
    float _1526 = _1516 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1528 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1510);
    float _1530 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1532 = fma(_1248, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1524);
    float _1534 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1536 = _1500 * _1454;
    float _1538 = _1500 * _1470;
    float _1540 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1546 = _1500 * _1462;
    float _1548 = _1528 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1550 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1552 = -_1544;
    float _1554 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1552);
    float _1556 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1558 = -_1534;
    float _1560 = fma(_1558, _1530, 1.0);
    float _1562 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1550);
    float _1564 = -_1546;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1554);
    float _1568 = exp2(_1556);
    float _1570 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1572 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1562);
    float _1574 = fma(_1566, -0.5, 0.5);
    float _1576 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1566, 0.5, 0.5);
    float _1580 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1570);
    float _1582 = log2(_1560);
    float _1584 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1586 = _1538 + 1.0;
    float _1588 = fma(_1578, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1590 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1592 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1584);
    float _1594 = fma(_1578, _1588, -0.212114393711090087890625);
    float _1596 = 1.0 / _1572;
    float _1598 = -_1538;
    float _1600 = fma(_1568, _1586, _1598);
    float _1602 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1590);
    float _1604 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1592);
    float _1606 = fma(_1578, _1594, 1.570728778839111328125);
    float _1608 = sqrt(_1574);
    float _1610 = _1582 * 0.693147182464599609375;
    float _1612 = _1610 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1614 = _1602 * _1596;
    float _1616 = _1604 * _1596;
    float _1618 = fma(_1614, 0.5, 0.5);
    float _1620 = fma(_1616, -0.5, 0.5);
    float _1622 = fma(_1600, 0.5, 0.5);
    float _1624 = _1608 * 0.636619746685028076171875;
    float3 _4766 = float3(_1618, _1620, _1612);
    float _1626 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4766, float3(0.0), isnan(_4766)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4766, float3(0.0), isnan(_4766)), level(0.0)).x;
    float _1628 = -_1606;
    float _1630 = fma(_1624, _1628, 1.0);
    float3 _4782 = float3(_1618, _1620, _1612);
    float4 _1633 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4782, float3(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4782, float3(0.0), isnan(_4782)), level(0.0)).xyzw;
    float _1635 = _1633.x;
    float _1637 = _1633.y;
    float _1639 = _1633.z;
    float _1641 = _1633.w;
    float2 _4799 = float2(_1630, _1622);
    float3 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4799, float2(0.0), isnan(_4799)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4799, float2(0.0), isnan(_4799)), level(0.0)).xyz;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = in.m_65.y;
    float _1655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1657 = in.m_57.y;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1661 = _1659 != 0;
    float _1663 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1667 = _1665 != 0;
    float _1669 = in.m_57.z;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1673 = _1671 != 0;
    float _1675 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1677 = _1675 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1679 = in.m_57.w;
    float _1681 = exp2(_1663);
    float _1683 = in.m_57.x;
    int _1685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1687 = _1685 != 0;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1695 = _1693 != 0;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1699 = _1697 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1701 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1703 = _1701 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1705 = 1.0 / _1677;
    float _1707 = -_1653;
    float _1709 = _1707 + 1.0;
    float _1711 = _1655 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1717 = _1657 > 0.5;
    float _1719 = _1657 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1721 = 1.0 / _1691;
    bool _1723 = _1669 > 0.5;
    float _1725 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1727 = _1717 ? as_type<int>(_1709) : as_type<int>(_1653);
    float _1729 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1731 = _1723 ? as_type<int>(_1709) : as_type<int>(_1653);
    float _1733 = fma(_1719, -2.0, _1725);
    float _1735 = _1667 ? as_type<float>(_1727) : _1653;
    float _1737 = 1.0 / _1699;
    float _1739 = _1673 ? as_type<float>(_1731) : _1653;
    float _1741 = _1683 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1745 = _1743 != 0;
    float _1747 = fma(_1711, _1735, -0.5);
    bool _1749 = _1679 > 0.5;
    float _1751 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1733);
    float _1753 = 1.0 / _1703;
    float _1755 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1729);
    float _1757 = _1653;
    bool _1759 = _1749;
    float _1761 = _1669;
    if (_1661)
    {
        float _1763 = _1749 ? _1709 : _1653;
        _1757 = _1763;
    }
    float _1765 = _1757;
    float _1767 = -_1681;
    float _1769 = _1767 + 1.0;
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1773 = _1771 != 0;
    float _1775 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1777 = 1.0 / _1715;
    float _1779 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1781 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1779;
    float _1783 = -_1775;
    float _1785 = fma(_1741, 2.0, _1783);
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1791 = _1781 * _1721;
    float _1793 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1795 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1793;
    float _1797 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1799 = _1797 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1801 = 1.0 / _1789;
    float _1803 = _1795 * _1737;
    float _1805 = _1799 * _1705;
    float _1807 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1809 = _1807 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1811 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1813 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1811;
    float _1815 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1817 = _1815 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1819 = (*spvDescriptorSet0.vp_c9)._m0[173].w;
    if (!_1773)
    {
        _1819 = _1657;
    }
    float _1821 = _1819;
    float _1823 = _1809 * _1753;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1827 = _1813 * _1777;
    float _1829 = _1821;
    if (_1687)
    {
        bool _1831 = _1683 > 0.5;
        _1759 = _1831;
    }
    bool _1833 = _1759;
    float _1835 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1837 = _1036 + _1835;
    float _1839 = fma(_1683, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1825);
    if (_1773)
    {
        _1829 = _1683;
    }
    float _1841 = _1829;
    float _1843 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1845 = 0.0;
    if (!_1773)
    {
        _1845 = _1669;
    }
    float _1847 = _1845;
    float _1849 = fma(_1803, _1837, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1851 = _1847;
    if (_1773)
    {
        _1761 = _1657;
    }
    float _1853 = _1761;
    float _1855 = fma(_1657, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1843);
    if (_1773)
    {
        _1851 = _1657;
    }
    float _1857 = _1851;
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1861 = _1036 + _1859;
    float _1863 = in.m_67.x;
    float _1865 = in.m_67.y;
    float _1867 = in.m_67.z;
    bool _1869 = _1052 != 0.0;
    bool _1871 = isnan(_1052);
    bool _1873 = _1869 || _1871;
    bool _1875 = isnan(0.0);
    bool _1877 = _1873 || _1875;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1883 = fma(_1805, _1861, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1887 = _1036 + _1885;
    bool _1889 = _1050 == 0.0;
    bool _1891 = !_1877;
    bool _1893 = _1889 && _1891;
    float _1895 = _1881 * _1801;
    float _1897 = fma(_1823, _1887, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1901 = _1036 + _1899;
    bool _1903 = _1054 == 0.0;
    bool _1905 = _1903 && _1893;
    float _1907 = 1.0 / _1817;
    float _1909 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1911 = fma(_1895, _1901, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    bool _1913 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1915 = isnan(_1036);
    bool _1917 = _1913 || _1915;
    bool _1919 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1921 = _1917 || _1919;
    float _1923 = float(_1921);
    float _1925 = in.m_65.x;
    float _1927 = fma(_1857, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1909);
    bool _1929 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1931 = isnan(_1036);
    bool _1933 = _1929 || _1931;
    bool _1935 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1937 = _1933 || _1935;
    float _1939 = float(_1937);
    float _1941 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1855);
    float _1943 = -_1923;
    float _1945 = _1943 + 1.0;
    bool _1947 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1949 = isnan(_1036);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1955 = _1951 || _1953;
    float _1957 = float(_1955);
    float _1959 = _1853 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1961 = -_1751;
    float _1963 = fma(_1941, _1747, _1961);
    float _1965 = _1863;
    float _1967 = _1865;
    float _1969 = _1867;
    if (!_1905)
    {
        float _1971 = fma(_1050, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1863);
        _1965 = _1971;
    }
    float _1973 = _1965;
    if (!_1905)
    {
        float _1975 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1865);
        _1967 = _1975;
    }
    float _1977 = _1967;
    float _1979 = _1939 * _1945;
    float _1981 = -_1939;
    float _1983 = _1981 + 1.0;
    bool _1985 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1987 = isnan(_1036);
    bool _1989 = _1985 || _1987;
    bool _1991 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1993 = _1989 || _1991;
    float _1995 = float(_1993);
    if (!_1905)
    {
        float _1997 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1867);
        _1969 = _1997;
    }
    float _1999 = _1969;
    bool _2001 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2003 = isnan(_1036);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    float _2013 = -_1957;
    float _2015 = _2013 + 1.0;
    float _2017 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2019 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2017;
    float _2021 = -_1995;
    float _2023 = _2021 + 1.0;
    float _2025 = _1957 * _1983;
    float _2027 = _1995 * _2015;
    float _2029 = _2019 * _1907;
    float _2031 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2033 = _1036 + _2031;
    float _2035 = _2011 * _2023;
    bool _2037 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2039 = isnan(_1036);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2045 = _2041 || _2043;
    float _2047 = float(_2045);
    float _2049 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2051 = _1036 + _2049;
    float _2053 = fma(_2029, _2033, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    bool _2055 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2057 = isnan(_1036);
    bool _2059 = _2055 || _2057;
    bool _2061 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2063 = _2059 || _2061;
    float _2065 = float(_2063);
    float _2067 = -_2011;
    float _2069 = _2067 + 1.0;
    bool _2071 = _1036 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2073 = isnan(_1036);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2079 = _2075 || _2077;
    float _2081 = float(_2079);
    float _2083 = -_2047;
    float _2085 = _2083 + 1.0;
    float _2087 = fma(_1791, _2051, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2089 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2091 = _1036 + _2089;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2095 = _2065 * _2069;
    float _2097 = _2081 * _2085;
    float _2099 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2101 = -_2065;
    float _2103 = _2101 + 1.0;
    float _2105 = -_2081;
    float _2107 = _2105 + 1.0;
    float _2109 = _1849 * _2097;
    float _2111 = fma(_1959, -2.0, _2099);
    float _2113 = _392 * _1977;
    float _2115 = _2091;
    int _2117 = as_type<int>(_2107);
    float _2119 = _1925;
    if (_1687)
    {
        float _2121 = -_1925;
        float _2123 = _2121 + 1.0;
        _398 = as_type<int>(_2123);
    }
    int _2125 = _398;
    float _2127 = fma(_1827, _2091, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2129 = _2047 * _2103;
    if (!_1687)
    {
        _2115 = _1925;
    }
    float _2131 = _2115;
    float _2133 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2109);
    float _2135 = _406 * _1977;
    float _2137 = _2131;
    if (_1687)
    {
        float _2139 = _1833 ? as_type<float>(_2125) : _1925;
        _2137 = _2139;
    }
    float _2141 = _2137;
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2145 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2147 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2149 = fma(_1883, _2129, _2133);
    float _2151 = fma(_2145, _1765, -0.5);
    float _2153 = _374 * _1977;
    float _2155 = fma(_1841, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2147);
    float _2157 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2159 = fma(_2087, _2095, _2149);
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2163 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1695)
    {
        float _2165 = -_1925;
        float _2167 = _2165 + 1.0;
        _2117 = as_type<int>(_2167);
    }
    int _2169 = _2117;
    float _2171 = fma(_328, _1973, _2153);
    float _2173 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1927);
    float _2175 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2111);
    float _2177 = fma(_1897, _2035, _2159);
    float _2179 = -_2161;
    float _2181 = fma(_2163, 2.0, _2179);
    float _2183 = fma(_350, _1973, _2113);
    float _2185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2187 = 0;
    if (_1745)
    {
        float _2189 = -_1925;
        float _2191 = _2189 + 1.0;
        _2187 = as_type<int>(_2191);
    }
    int _2193 = _2187;
    if (!_1695)
    {
        _384 = _1925;
    }
    float _2195 = _384;
    float _2197 = fma(_354, _1973, _2135);
    float _2199 = -_2175;
    float _2201 = fma(_2173, _2151, _2199);
    float _2203 = fma(_2127, _2027, _2177);
    float _2205 = _2195;
    if (_1695)
    {
        float _2207 = _1723 ? as_type<float>(_2169) : _1925;
        _2205 = _2207;
    }
    float _2209 = _2205;
    float _2211 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1839);
    float _2213 = -_134;
    float _2215 = fma(_2213, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1785);
    float _2217 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2155);
    float _2219 = -_134;
    float _2221 = fma(_2219, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2181);
    float _2223 = fma(_428, _1999, _2183);
    float _2225 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2227 = _2157 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (_1745)
    {
        float _2229 = _1717 ? as_type<float>(_2193) : _1925;
        _2119 = _2229;
    }
    float _2231 = _2119;
    float _2233 = fma(_1911, _2025, _2203);
    float _2235 = fma(_420, _1999, _2171);
    float _2237 = fma(_2225, _2141, -0.5);
    float _2239 = fma(_2227, _2209, -0.5);
    float _2241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2243 = fma(_2053, _1979, _2233);
    float _2245 = _2231 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2247 = fma(_2211, _2237, _2215);
    float _2249 = fma(_2217, _2239, _2221);
    float _2251 = fma(_432, _1999, _2197);
    float _2253 = _2245 * _2185;
    float _2255 = _1963 + 0.5;
    float _2257 = _2201 + 0.5;
    float _2259 = _2247 + 0.5;
    float _2261 = _2249 + 0.5;
    float _2263 = _1739 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2265 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1755);
    bool _2267 = _1312 > 0.0;
    bool _2269 = isnan(_1312);
    bool _2271 = _2267 || _2269;
    bool _2273 = isnan(0.0);
    bool _2275 = _2271 || _2273;
    float _2277 = _1572 * 0.5;
    out.m_69.x = _2259;
    out.m_69.y = _2255;
    out.m_69.z = _2261;
    out.m_69.w = _2257;
    float _2279 = _2263 * _2241;
    float _2281 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2265);
    float _2283 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2285 = _1602 + _1572;
    float _2287 = fma(_1923, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2243);
    float _2289 = _2281 + _1572;
    out.m_71.x = _2253;
    out.m_71.y = _2279;
    float _2291 = _2289 * 0.5;
    out.m_73.x = _2235;
    out.m_73.y = _2223;
    out.m_73.z = _2251;
    float _2293 = _1769 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2295 = _2283 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _2287;
    float _2297 = fma(_1604, -0.5, _2277);
    float _2299 = -_2293;
    float _2301 = _2299 + 1.0;
    float _2303 = _2285 * 0.5;
    out.m_77.x = _1246;
    out.m_77.y = _1244;
    out.m_77.z = _1248;
    out.gl_Position.x = _1602;
    out.gl_Position.y = _1604;
    out.gl_Position.z = _2281;
    out.gl_Position.w = _1572;
    out.m_79.x = _2303;
    out.m_79.y = _2297;
    out.m_79.z = _2291;
    out.m_79.w = _1572;
    out.m_45.x = _2295;
    float _2305 = _2293 * _1626;
    float _2307 = _1641 * _2305;
    float _2309 = _1641 * _2301;
    float _2311 = _1651 * _2305;
    float _2313 = fma(_1647, _2307, _1635);
    float _2315 = fma(_1649, _2307, _1637);
    float _2317 = fma(_1641, _2311, _1639);
    out.m_81.x = _2313;
    out.m_81.y = _2315;
    out.m_81.z = _2317;
    out.m_81.w = _2309;
    if (_2275)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2319 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2319;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

