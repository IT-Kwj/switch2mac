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
    float4 m_79 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_69 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_55 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _832 = false;
    bool _684 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2665 = as_type<float>(_122);
        out.gl_Position.z = _2665;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_47.w;
    float _128 = float(_106);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _128;
    float _152 = _132;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_158);
        out.gl_Position.z = _2730;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_53.x;
    float _184 = in.m_53.y;
    float _186 = in.m_53.z;
    float _188 = in.m_47.x;
    float _190 = in.m_47.y;
    float _192 = in.m_47.z;
    float _194 = _160 * _160;
    float _196 = _162 * _162;
    float _198 = _164 * _164;
    float _200 = fma(_166, _166, _194);
    float _202 = fma(_168, _168, _196);
    float _204 = fma(_170, _170, _198);
    float _206 = fma(_182, _182, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    bool _216 = _212 > 0.0;
    float _218 = sqrt(_210);
    bool _220 = _214 > 0.0;
    float _222 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _224 = 0.0;
    float _226 = _222;
    bool _228 = _180;
    float _230 = _162;
    float _232 = _160;
    float _234 = _164;
    if (_216)
    {
        float _236 = rsqrt(_206);
        _224 = _236;
    }
    float _238 = _224;
    bool _240 = _218 > 0.0;
    float _242 = _218;
    if (!_180)
    {
        float _244 = _222 * _222;
        float _246 = _244 * 0.5;
        _242 = _246;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _248;
    if (_220)
    {
        float _254 = rsqrt(_208);
        _250 = _254;
    }
    float _256 = _250;
    if (!_180)
    {
        float _258 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _258;
    }
    float _260 = _252;
    bool _262 = !_180;
    float _264 = _260;
    float _266 = _256;
    if (!_262)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = _222 * _270;
        float _280 = 1.0 / _274;
        float _282 = _276 * 0.693147182464599609375;
        float _284 = exp2(_278);
        float _286 = 1.0 / _282;
        float _288 = _284 + (-1.0);
        float _290 = -_288;
        float _292 = fma(_290, _286, _222);
        float _294 = _292 * _280;
        float _296 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _296;
    }
    float _298 = _264;
    bool _300 = !_180;
    if (!_300)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = 1.0 / _308;
        float _312 = _222 * _304;
        float _314 = exp2(_312);
        float _316 = -_314;
        float _318 = _316 + 1.0;
        float _320 = _318 * _310;
        _226 = _320;
    }
    float _322 = _226;
    float _324 = in.m_55.w;
    float _326 = 0.0;
    float _328 = 0.0;
    if (!_216)
    {
        _326 = 0.0;
        _328 = 0.0;
    }
    float _330 = _326;
    float _332 = _328;
    float _334 = 0.0;
    float _336 = _332;
    float _338 = _330;
    if (!_216)
    {
        _334 = 0.0;
    }
    float _340 = _334;
    float _342 = 1.0 / _128;
    float _344 = in.m_42.x;
    float _346 = in.m_42.y;
    float _348 = in.m_42.z;
    float _350 = _340;
    if (_216)
    {
        float _352 = _238 * _166;
        _350 = _352;
    }
    float _354 = _350;
    if (_216)
    {
        float _356 = _238 * _160;
        _336 = _356;
    }
    float _358 = _336;
    if (_216)
    {
        float _360 = _238 * _182;
        _338 = _360;
    }
    float _362 = _338;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _366 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _370 = _210;
    if (_240)
    {
        float _372 = rsqrt(_210);
        _370 = _372;
    }
    float _374 = _370;
    float _376 = 0.0;
    if (!_220)
    {
        _376 = 0.0;
    }
    float _378 = _376;
    float _380 = fma(_322, _188, _366);
    float _382 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _384 = _378;
    if (!_220)
    {
        _150 = 0.0;
    }
    float _386 = _150;
    float _388 = fma(_322, _190, _368);
    float _390 = 0.0;
    float _392 = _386;
    if (!_220)
    {
        _390 = 0.0;
    }
    float _394 = _390;
    float _396 = fma(_322, _192, _382);
    float _398 = _394;
    if (_220)
    {
        float _400 = _256 * _168;
        _384 = _400;
    }
    float _402 = _384;
    if (_220)
    {
        float _404 = _256 * _162;
        _392 = _404;
    }
    float _406 = _392;
    if (_220)
    {
        float _408 = _256 * _184;
        _398 = _408;
    }
    float _410 = _398;
    float _412 = 0.0;
    if (!_240)
    {
        _412 = 0.0;
    }
    float _414 = _412;
    float _416 = 0.0;
    float _418 = _414;
    if (!_240)
    {
        _416 = 0.0;
        _266 = 0.0;
    }
    float _420 = _416;
    float _422 = _266;
    float _424 = _132 * _342;
    float _426 = _420;
    float _428 = _422;
    if (_240)
    {
        float _430 = _374 * _170;
        _426 = _430;
    }
    float _432 = _426;
    if (_240)
    {
        float _434 = _374 * _164;
        _428 = _434;
    }
    float _436 = _428;
    if (_240)
    {
        float _438 = _374 * _186;
        _418 = _438;
    }
    float _440 = _418;
    float _442 = fma(_380, _324, _344);
    float _444 = fma(_388, _324, _346);
    float _446 = fma(_396, _324, _348);
    bool _448 = !_364;
    float _466;
    if (!_448)
    {
        float _450 = in.m_57.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _424;
    }
    _468 = false;
    float _470 = _466;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _470 + _476;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _470 + _504;
    float _508 = 1.0 / _494;
    bool _510 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _512 = 1.0 / _502;
    float _514 = 1.0 / _498;
    float _516 = _474 * _508;
    bool _518 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_470);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -_528;
    float _532 = _530 + 1.0;
    float _534 = _478 * _512;
    bool _536 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_470);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _548;
    float _552 = _490 * _532;
    bool _554 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_470);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = -_546;
    float _572 = _570 + 1.0;
    float _574 = -_490;
    float _576 = _574 + 1.0;
    float _578 = _506 * _514;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _584;
    float _588 = _564 * _572;
    float _590 = fma(_550, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _592 = fma(_582, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _594 = fma(_586, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _596 = _546 * _576;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _602 = _592 * _588;
    float _604 = _594 * _588;
    float _606 = -_564;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _614 = _590 * _588;
    float _616 = fma(_568, _578, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].x, _604);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _620;
    float _624 = fma(_612, _578, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _626 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _628 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].z, _614);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _630;
    float _634 = fma(_600, _578, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _636;
    float _640 = fma(_616, _596, _618);
    float _642 = fma(_622, _534, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _644 = fma(_632, _534, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _646 = fma(_624, _596, _626);
    float _648 = fma(_638, _534, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _650 = fma(_634, _596, _628);
    float _652 = fma(_642, _552, _640);
    float _654 = fma(_644, _552, _646);
    float _656 = fma(_648, _552, _650);
    float _658 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].x, _652);
    float _660 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].y, _654);
    float _662 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].z, _656);
    bool _664 = !_510;
    float _682;
    if (!_664)
    {
        float _666 = in.m_57.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _424;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _712 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _714 = isnan(_686);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _724;
    bool _728 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _730 = isnan(_686);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = 1.0 / _694;
    float _742 = -_706;
    float _744 = _742 + 1.0;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _748 = _722 * _744;
    float _750 = -_722;
    float _752 = _750 + 1.0;
    float _754 = 1.0 / _710;
    float _756 = _726 * _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = fma(_756, _690, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _764 = _760 * _754;
    float _766 = _762 * _748;
    float _768 = -_738;
    float _770 = _768 + 1.0;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _774 = _686 + _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[115].x, _766);
    float _780 = _706 * _770;
    float _782 = fma(_764, _774, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _784 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = fma(_782, _780, _778);
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _790 = in.m_55.x;
    float _792 = in.m_55.y;
    float _794 = in.m_55.z;
    float _796 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[117].x, _786);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _784;
    out.m_59.y = _800;
    out.m_59.z = _804;
    out.m_59.w = _802;
    float _806 = _662 * _794;
    float _808 = _660 * _792;
    float _810 = _658 * _790;
    bool _812 = !_746;
    float _830;
    if (!_812)
    {
        float _814 = in.m_57.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _830 = _828;
        _832 = true;
    }
    else
    {
        _830 = _424;
    }
    _832 = false;
    float _834 = _830;
    float _836 = in.m_61.z;
    float _838 = in.m_61.x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = in.m_57.z;
    float _844 = in.m_57.x;
    float _846 = in.m_57.y;
    float _848 = _836 * 3.0;
    float _850 = _838 * 3.0;
    float _852 = _842 * 2.0;
    float _854 = abs(_848);
    float _856 = abs(_850);
    float _858 = precise::max(_854, _856);
    float _860 = _844 * 2.0;
    bool _862 = _858 >= 16.0;
    float _864 = floor(_852);
    float _866 = _846 * 2.0;
    float _868 = _846 + _842;
    float _870 = _846 + _844;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _874 = _872 != 0;
    float _876 = _844 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _878 = _868 + (-1.0);
    float _880 = floor(_860);
    float _882 = _870 + (-1.0);
    float _884 = -_840;
    float _886 = fma(_876, 2.0, _884);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _890 = _848;
    float _892 = _850;
    if (_862)
    {
        float _894 = _836 * 0.1875;
        _890 = _894;
    }
    float _896 = _890;
    float _898 = _896;
    if (_862)
    {
        float _900 = _838 * 0.1875;
        _892 = _900;
    }
    float _902 = _892;
    float _904 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _906 = floor(_866);
    float _908 = abs(_896);
    bool _910 = _908 != 0.0;
    bool _912 = isnan(_908);
    bool _914 = _910 || _912;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    float _920 = _876;
    float _922 = _902;
    if (!_874)
    {
        float _924 = in.m_57.z;
        _920 = _924;
    }
    float _926 = _920;
    float _928 = abs(_902);
    bool _930 = _928 == 0.0;
    float _932 = abs(_902);
    bool _934 = _932 == 0.0;
    bool _936 = !_918;
    bool _938 = _934 && _936;
    bool _940 = _864 > 0.0;
    bool _942 = _864 >= 0.0;
    bool _944 = isnan(_864);
    bool _946 = _942 || _944;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _954 = _846 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _956 = fma(_954, -2.0, _952);
    if (_938)
    {
        bool _958 = as_type<int>(_902) >= 0;
        _228 = _958;
    }
    bool _960 = _228;
    int _962 = 0;
    int _964 = _960 ? (-1) : 0;
    if (_938)
    {
        int _966 = _960 ? 0 : 1078530011;
        _962 = _966;
    }
    int _968 = _962;
    int _970 = _968;
    if (_938)
    {
        int _972 = int(0x80000000) & as_type<int>(_896);
        int _974 = _968 | _972;
        _970 = _974;
    }
    int _976 = _970;
    bool _978 = !_918;
    bool _980 = _978 && _930;
    int _982 = _976;
    float _984 = as_type<float>(_976);
    float _986 = _926;
    if (!_980)
    {
        float _988 = abs(_896);
        bool _990 = _988 != as_type<float>(0x7f800000u /* inf */);
        bool _992 = isnan(_988);
        bool _994 = _990 || _992;
        bool _996 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _998 = _994 || _996;
        float _1000 = abs(_902);
        bool _1002 = _1000 == as_type<float>(0x7f800000u /* inf */);
        float _1004 = abs(_902);
        bool _1006 = _1004 == as_type<float>(0x7f800000u /* inf */);
        bool _1008 = !_998;
        bool _1010 = _1006 && _1008;
        if (_1010)
        {
            bool _1012 = as_type<int>(_902) >= 0;
            _964 = _1012 ? (-1) : 0;
        }
        int _1014 = _964;
        if (_1010)
        {
            _982 = 1075235812;
        }
        int _1016 = _982;
        int _1018 = _1016;
        if (_1010)
        {
            int _1020 = ~_1014;
            int _1022 = (_1020 != 0) ? _1016 : 1061752795;
            _1018 = _1022;
        }
        int _1024 = _1018;
        float _1026 = as_type<float>(_1024);
        if (_1010)
        {
            int _1028 = int(0x80000000) & as_type<int>(_896);
            int _1030 = _1024 | _1028;
            _1026 = as_type<float>(_1030);
        }
        float _1032 = _1026;
        bool _1034 = !_998;
        bool _1036 = _1034 && _1002;
        _984 = _1032;
        if (!_1036)
        {
            float _1038 = abs(_896);
            float _1040 = abs(_902);
            float _1042 = precise::max(_1038, _1040);
            float _1044 = abs(_896);
            float _1046 = abs(_902);
            float _1048 = precise::min(_1044, _1046);
            float _1050 = 1.0 / _1042;
            float _1052 = abs(_896);
            float _1054 = abs(_902);
            bool _1056 = _1052 > _1054;
            bool _1058 = as_type<int>(_902) >= 0;
            float _1060 = _1048 * _1050;
            float _1062 = _1060 * _1060;
            float _1064 = _1062 + 11.33538818359375;
            float _1066 = fma(_1062, _1064, 28.84246826171875);
            float _1068 = fma(_1062, _1066, 19.6966705322265625);
            float _1070 = fma(_1062, -0.82336294651031494140625, -5.674867153167724609375);
            float _1072 = abs(_896);
            float _1074 = abs(_902);
            float _1076 = _1072 + _1074;
            int _1078 = as_type<int>(_896) & int(0x80000000);
            float _1080 = fma(_1062, _1070, -6.565555095672607421875);
            float _1082 = 1.0 / _1068;
            bool _1084 = _1076 > as_type<float>(0x7f800000u /* inf */);
            bool _1086 = isnan(_1076);
            bool _1088 = _1084 || _1086;
            bool _1090 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1092 = _1088 || _1090;
            float _1094 = _1062 * _1080;
            float _1096 = _1060 * _1094;
            float _1098 = fma(_1096, _1082, _1060);
            float _1100 = _1098;
            _898 = as_type<float>(_1078);
            _984 = _1076;
            if (_1056)
            {
                float _1102 = -_1098;
                float _1104 = _1102 + 1.57079637050628662109375;
                _1100 = _1104;
            }
            float _1106 = _1100;
            int _1108 = as_type<int>(_1106);
            if (!_1058)
            {
                float _1110 = -_1106;
                float _1112 = _1110 + 3.1415927410125732421875;
                _1108 = as_type<int>(_1112);
            }
            int _1114 = _1108;
            if (!_1092)
            {
                int _1116 = _1078 | _1114;
                _984 = as_type<float>(_1116);
            }
        }
    }
    float _1118 = _898;
    float _1120 = _984;
    float _1122 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1124 = log2(_1122);
    float _1126 = in.m_63.y;
    int _1128 = _950 ? 0 : 1;
    float _1130 = _844 * 6.283185482025146484375;
    bool _1132 = _906 > 0.0;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1136 = _906 >= 0.0;
    bool _1138 = isnan(_906);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = -_132;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[76].x, _886);
    bool _1150 = _880 > 0.0;
    float _1152 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _956);
    bool _1154 = _880 >= 0.0;
    bool _1156 = isnan(_880);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    float _1164 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1166 = _1118;
    float _1168 = _1148;
    if (!_874)
    {
        _1166 = _926;
    }
    float _1170 = _1166;
    float _1172 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1174 = _1170;
    if (_874)
    {
        _986 = _846;
    }
    float _1176 = _986;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_874)
    {
        _1174 = _846;
    }
    float _1180 = _1174;
    int _1182 = ~_1128;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1134);
    int _1190 = _1186;
    if (!_874)
    {
        _922 = _846;
    }
    float _1192 = _922;
    float _1194 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1196 = _1192;
    if (!_940)
    {
        int _1198 = ~_1128;
        int _1200 = _1198 + 1;
        _1190 = _1200;
    }
    int _1202 = _1190;
    float _1204 = fma(_1126, 12.0, _1130);
    if (_874)
    {
        _1196 = _844;
    }
    float _1206 = _1196;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1218 = _1216 != 0;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1222 = float(_1202);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1178);
    float _1226 = _1124 * _132;
    bool _1228 = !_1210;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1234 = abs(_1230);
    float _1236 = -_1232;
    float _1238 = fma(_1220, 2.0, _1236);
    float _1240 = exp2(_1226);
    int _1242 = _1144 ? 0 : 1;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1246 = _1162 ? 0 : 1;
    float _1248 = float(_1234);
    float _1250 = fma(_1194, -2.0, _1244);
    int _1252 = ~_1242;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = _1256;
    bool _1260 = _1144;
    if (!_1132)
    {
        int _1262 = ~_1242;
        int _1264 = _1262 + 1;
        _1258 = _1264;
    }
    int _1266 = _1258;
    float _1268 = _1248 * _1222;
    int _1270 = ~_1246;
    int _1272 = _1270 + 1;
    int _1274 = _1272 + 1;
    float _1276 = -_1240;
    float _1278 = _1276 + 1.0;
    int _1280 = _1274;
    if (!_1150)
    {
        int _1282 = ~_1246;
        int _1284 = _1282 + 1;
        _1280 = _1284;
    }
    int _1286 = _1280;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1290 = in.m_65.x;
    float _1292 = in.m_65.y;
    float _1294 = in.m_65.z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1298 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1300 = isnan(0.0);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1306 = _1302 || _1304;
    float _1308 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1288);
    float _1310 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1296);
    bool _1312 = !_1214;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1308);
    float _1318 = _1306 ? _1278 : 0.0;
    float _1320 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1224);
    int _1322 = abs(_1314);
    float _1324 = -_132;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1330 = 1.0 + _1328;
    float _1332 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1188);
    float _1334 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1250);
    float _1336 = 1.0 / _1330;
    float _1338 = _1268 * (-2.0);
    float _1340 = float(_1322);
    float _1342 = _1204 * 0.15915493667125701904296875;
    bool _1344 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1346 = isnan(1.0);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1352 = _1348 || _1350;
    float _1354 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1310);
    float _1356 = fma(_1338, _1290, _1290);
    float _1358 = float(_1286);
    float _1360 = fma(_904, _1338, _904);
    bool _1362 = !_1218;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = _844 + (-0.5);
    float _1368 = _844 + _842;
    float _1370 = _1340 * _1358;
    int _1372 = abs(_1364);
    float _1374 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1356);
    float _1376 = _1316;
    float _1378 = _1320;
    if (_1352)
    {
        float _1380 = _1318 * _1336;
        _152 = _1380;
    }
    float _1382 = _152;
    float _1384 = _1370 * (-2.0);
    float _1386 = in.m_61.y;
    float _1388 = _1368 + (-1.0);
    float _1390 = fma(_1360, _1382, _1374);
    float _1392 = fma(_888, _1384, _888);
    float _1394 = fma(_1384, _1292, _1292);
    float _1396 = _846 + (-0.5);
    float _1398 = float(_1266);
    float _1400 = _1342 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = float(_1372);
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1394);
    float _1408 = _842 + (-0.5);
    float _1410 = _1390 * 0.15915493667125701904296875;
    float _1412 = _1404 * _1398;
    float _1414 = fma(_1392, _1382, _1406);
    float _1416 = _1410 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1412 * (-2.0);
    float _1422 = _1414 * 0.15915493667125701904296875;
    float _1424 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1426 = fma(_1420, _1294, _1294);
    float _1428 = fma(_1120, 0.1500000059604644775390625, _1386);
    float _1430 = fma(_1424, _1420, _1424);
    float _1432 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1434 = _1422 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = _1402 * 0.4000000059604644775390625;
    float _1440 = fma(_1430, _1382, _1432);
    float _1442 = _444 * _168;
    float _1444 = _424 * _424;
    float _1446 = _444 * _184;
    float _1448 = _1440 * 0.15915493667125701904296875;
    float _1450 = _1422 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = fma(_442, _166, _1442);
    float _1456 = fma(_1438, _1444, _1428);
    float _1458 = fma(_442, _182, _1446);
    float _1460 = fma(_446, _170, _1454);
    float _1462 = _444 * _162;
    bool _1464 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1466 = isnan(0.5);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1472 = _1468 || _1470;
    float _1474 = _1410 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _838);
    float _1482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1456);
    float _1484 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1486 = _1478 * _1164;
    float _1488 = _1418 * _1436;
    float _1490 = in.m_53.w;
    float _1492 = _1448 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = _1418 * _1452;
    float _1498 = _1482 * _1172;
    float _1500 = _1480 * _1484;
    float _1502 = fma(_446, _186, _1458);
    float _1504 = in.m_51.w;
    float _1506 = fma(_442, _160, _1462);
    float _1508 = _1448 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1476 * _1436;
    float _1514 = _1476 * _1452;
    float _1516 = fma(_446, _164, _1506);
    float _1518 = _1418 * _1494;
    float _1520 = _1476 * _1494;
    float _1522 = _1452 * _1494;
    float _1524 = _1436 * _1494;
    float _1526 = _1518 * _1498;
    float _1528 = _1502 + _1490;
    float _1530 = fma(_1510, _1496, _1512);
    float _1532 = -_1498;
    float _1534 = _1510 * _1532;
    float _1536 = -_1514;
    float _1538 = fma(_1510, _1488, _1536);
    float _1540 = -_1488;
    float _1542 = fma(_1510, _1514, _1540);
    float _1544 = fma(_1530, _1500, _1526);
    float _1546 = _1520 * _1498;
    float _1548 = fma(_1522, _1500, _1534);
    float _1550 = fma(_1510, _1512, _1496);
    float _1552 = fma(_1538, _1486, _1544);
    float _1554 = fma(_1542, _1500, _1546);
    float _1556 = fma(_1524, _1486, _1548);
    float _1558 = _1460 + _1504;
    float _1560 = _1552 * _410;
    float _1562 = fma(_1550, _1486, _1554);
    float _1564 = _1552 * _402;
    float _1566 = _1552 * _406;
    float _1568 = fma(_1556, _362, _1560);
    float _1570 = fma(_1556, _354, _1564);
    float _1572 = fma(_1556, _358, _1566);
    float _1574 = fma(_1562, _440, _1568);
    float _1576 = fma(_1562, _432, _1570);
    float _1578 = fma(_1562, _436, _1572);
    float _1580 = _1528 + _1574;
    float _1582 = in.m_49.w;
    float _1584 = _1558 + _1576;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1588 = _1580 + _1586;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1592 = _1584 + _1590;
    float _1594 = _1588 * _1588;
    float _1596 = fma(_1592, _1592, _1594);
    float _1598 = sqrt(_1596);
    float _1600 = _1516 + _1582;
    float _1602 = _1600 + _1578;
    bool _1604 = _1598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1606 = _1578;
    float _1608 = _1592;
    float _1610 = _1588;
    float _1612 = _1596;
    if (!_1604)
    {
        _230 = _1584;
    }
    float _1614 = _230;
    float _1616 = _1614;
    if (!_1604)
    {
        _1606 = _1580;
    }
    float _1618 = _1606;
    float _1620 = _1618;
    if (!_1604)
    {
        _232 = _1602;
    }
    float _1622 = _232;
    bool _1624 = !_1604;
    float _1626 = _1622;
    if (!_1624)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1632 = _1598 + _1630;
        float _1634 = rsqrt(_1596);
        float _1636 = _1632 * _1628;
        float _1638 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = _1636 * 0.15915493667125701904296875;
        float _1642 = _1640 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        float _1646 = _1640 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644 + (-1.0);
        float _1652 = fma(_1648, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1654 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = _1634 * _1652;
        float _1658 = fma(_1602, _1644, _1654);
        float _1660 = fma(_1592, _1656, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1662 = fma(_1588, _1656, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1616 = _1660;
        _1626 = _1658;
        _1620 = _1662;
        _234 = _1650;
    }
    float _1664 = _1616;
    float _1666 = _1626;
    float _1668 = _1620;
    float _1670 = _234;
    float _1672 = _1668;
    float _1674 = _1670;
    float _1676 = _1664;
    if (_1472)
    {
        _1608 = _1664;
    }
    float _1678 = _1608;
    float _1680 = _1678;
    if (_1472)
    {
        _1610 = _1666;
    }
    float _1682 = _1610;
    float _1684 = _1682;
    if (!_1472)
    {
        float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1688 = _1600 + _1686;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1692 = _1558 + _1690;
        float _1694 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1696 = -_1558;
        float _1698 = _1696 + _1664;
        float _1700 = _1688 * _1688;
        float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1704 = _1528 + _1702;
        float _1706 = -_1600;
        float _1708 = _1706 + _1666;
        float _1710 = -_1528;
        float _1712 = _1710 + _1668;
        float _1714 = fma(_1692, _1692, _1700);
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1718 = fma(_1704, _1704, _1714);
        float _1720 = sqrt(_1718);
        float _1722 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1724 = precise::min(_1720, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1726 = _1724 * _1716;
        float _1728 = _1722 * _1726;
        float _1730 = fma(_1698, _1728, _1558);
        float _1732 = fma(_1708, _1728, _1600);
        float _1734 = fma(_1712, _1728, _1528);
        _1684 = _1732;
        _1680 = _1730;
        _1672 = _1734;
        _1674 = _1720;
        _1676 = _1698;
    }
    float _1736 = _1684;
    float _1738 = _1680;
    float _1740 = _1672;
    float _1742 = _1674;
    float _1744 = _1676;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1748 = _1736 + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1752 = _1738 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1740 + _1754;
    float _1758 = _1748 * _1748;
    float _1760 = fma(_1752, _1752, _1758);
    float _1762 = fma(_1756, _1756, _1760);
    float _1764 = rsqrt(_1762);
    float _1766 = sqrt(_1762);
    float _1768 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1770 = _1752 * _1768;
    float _1772 = _1756 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 * _1772;
    float _1778 = _1774 + _1776;
    float _1780 = sqrt(_1778);
    bool _1782 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1780 + _1784;
    float _1788 = _1764;
    float _1790 = _1786;
    float _1792 = _1742;
    float _1794 = _1748;
    if (_1782)
    {
        float _1796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1788 = _1796;
    }
    float _1798 = _1788;
    float _1800 = _1798;
    if (_1782)
    {
        float _1802 = _1786 * _1798;
        _1790 = _1802;
    }
    float _1804 = _1790;
    if (_1782)
    {
        float _1806 = rsqrt(_1778);
        _1800 = _1806;
    }
    float _1808 = _1800;
    float _1810 = _1808;
    if (_1782)
    {
        float _1812 = _1804 * 0.15915493667125701904296875;
        _1792 = _1812;
    }
    float _1814 = _1792;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = _1756;
    float _1820 = _1814;
    if (_1782)
    {
        float _1822 = _1814 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1818 = _1824;
    }
    float _1826 = _1818;
    float _1828 = precise::max(0.0, _1816);
    float _1830 = _1744;
    if (_1782)
    {
        float _1832 = _1814 * 6.283185482025146484375;
        float _1834 = cos(_1832);
        _1830 = _1834;
    }
    float _1836 = _1830;
    float _1838 = -_1768;
    float _1840 = -_1828;
    float _1842 = fma(_1748, _1838, _1840);
    float _1844 = _1842;
    if (_1782)
    {
        float _1846 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1794 = _1846;
    }
    float _1848 = _1794;
    float _1850 = _1826;
    float _1852 = _1848;
    if (_1782)
    {
        float _1854 = fma(_1826, _1848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = _1856;
    if (_1782)
    {
        float _1860 = _1808 * _1856;
        _1612 = _1860;
    }
    float _1862 = _1612;
    if (!_1782)
    {
        _1810 = _1770;
    }
    float _1864 = _1810;
    float _1866 = _1864;
    float _1868 = _1836;
    if (_1782)
    {
        float _1870 = _1836 + (-1.0);
        _1852 = _1870;
    }
    float _1872 = _1852;
    float _1874 = _1872;
    if (_1782)
    {
        float _1876 = _1770 * _1862;
        _1866 = _1876;
    }
    float _1878 = _1866;
    if (!_1782)
    {
        _1858 = _1772;
    }
    float _1880 = _1858;
    float _1882 = _1880;
    if (_1782)
    {
        float _1884 = _1772 * _1862;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (_1782)
    {
        float _1888 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1888;
    }
    float _1890 = _1820;
    if (!_1782)
    {
        _1874 = _1774;
    }
    float _1892 = _1874;
    float _1894 = _1892;
    if (_1782)
    {
        float _1896 = _1878 * _1878;
        _1894 = _1896;
    }
    float _1898 = _1894;
    float _1900 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1782)
    {
        float _1902 = fma(_1842, _1836, _1890);
        _1844 = _1902;
    }
    float _1904 = _1844;
    if (!_1782)
    {
        _1868 = _1776;
    }
    float _1906 = _1868;
    float _1908 = _1906;
    if (_1782)
    {
        float _1910 = _1886 * _1886;
        _1908 = _1910;
    }
    float _1912 = _1908;
    float _1914 = fma(_1904, _1904, _1898);
    float _1916 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1918 = _1914 + _1912;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1900);
    float _1928 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1930 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1932 = -_1924;
    float _1934 = _1932 + 1.0;
    float _1936 = rsqrt(_1918);
    float _1938 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1940 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1928);
    float _1944 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1930);
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1948 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1950 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1942);
    float _1952 = abs(_1934);
    float _1954 = log2(_1952);
    float _1956 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1944);
    float _1958 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1948);
    float _1960 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1962 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1966 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1968 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1970 = _1936 * _1878;
    float _1972 = _1936 * _1904;
    float _1974 = _1936 * _1886;
    float _1976 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1968);
    float _1978 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1980 = -_1962;
    float _1982 = fma(_1980, _1916, 1.0);
    float _1984 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1986 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1976);
    float _1988 = -_1978;
    float _1990 = fma(_1972, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = log2(_1982);
    float _1996 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1986);
    float _1998 = -_1974;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1984);
    float _2006 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2008 = exp2(_1992);
    float _2010 = fma(_2000, -0.5, 0.5);
    float _2012 = fma(_2000, 0.5, 0.5);
    float _2014 = _1972 + 1.0;
    float _2016 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2006);
    float _2018 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2020 = fma(_2012, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2022 = 1.0 / _1996;
    float _2024 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2016);
    float _2026 = _1994 * 0.693147182464599609375;
    float _2028 = fma(_2012, _2020, -0.212114393711090087890625);
    float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2032 = fma(_2012, _2028, 1.570728778839111328125);
    float _2034 = sqrt(_2010);
    float _2036 = -_1972;
    float _2038 = fma(_2008, _2014, _2036);
    float _2040 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2018);
    float _2042 = _2024 * _2022;
    float _2044 = _2040 * _2022;
    float _2046 = fma(_2038, 0.5, 0.5);
    float _2048 = fma(_2042, 0.5, 0.5);
    float _2050 = fma(_2044, -0.5, 0.5);
    float _2052 = _2034 * 0.636619746685028076171875;
    float3 _5633 = float3(_2048, _2050, _2030);
    float _2054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5633, float3(0.0), isnan(_5633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5633, float3(0.0), isnan(_5633)), level(0.0)).x;
    float _2056 = -_2032;
    float _2058 = fma(_2052, _2056, 1.0);
    float3 _5649 = float3(_2048, _2050, _2030);
    float4 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5649, float3(0.0), isnan(_5649)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5649, float3(0.0), isnan(_5649)), level(0.0)).xyzw;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _2061.w;
    float2 _5666 = float2(_2058, _2046);
    float3 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5666, float2(0.0), isnan(_5666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5666, float2(0.0), isnan(_5666)), level(0.0)).xyz;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = in.m_57.w;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2085 = _2083 != 0;
    out.m_45.x = 1.0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2089 = _2087 != 0;
    float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2101 = _2099 != 0;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2105 = _834 + _2103;
    float _2107 = 1.0 / _2093;
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2111 = _2109 != 0;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2115 = _834 + _2113;
    bool _2117 = _846 > 0.5;
    out.m_67.x = _1738;
    out.m_67.y = _1736;
    out.m_67.z = _1740;
    float _2119 = 0.0;
    bool _2121 = _2117;
    if (_2085)
    {
        float _2123 = in.m_57.x;
        _2119 = _2123;
    }
    float _2125 = _2119;
    float _2127 = 1.0 / _2097;
    float _2129 = -_1126;
    float _2131 = _2129 + 1.0;
    float _2133 = _2044;
    if (_2089)
    {
        float _2135 = in.m_57.z;
        _2133 = _2135;
    }
    float _2137 = _2133;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2139;
    bool _2143 = _2081 > 0.5;
    float _2145 = _2115 * _2107;
    int _2147 = _2117 ? as_type<int>(_2131) : as_type<int>(_1126);
    float _2149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2151 = _2143 ? as_type<int>(_2131) : as_type<int>(_1126);
    float _2153 = in.m_63.x;
    float _2155 = _2101 ? as_type<float>(_2147) : _1126;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2157;
    bool _2161 = _1456 != 0.0;
    bool _2163 = isnan(_1456);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    float _2171 = _2105 * _2127;
    float _2173 = _2111 ? as_type<float>(_2151) : _1126;
    float _2175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2177 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2179 = isnan(_834);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2185 = _2181 || _2183;
    float _2187 = float(_2185);
    bool _2189 = _838 == 0.0;
    bool _2191 = !_2169;
    bool _2193 = _2189 && _2191;
    if (_2085)
    {
        bool _2195 = _2125 > 0.5;
        _1260 = _2195;
    }
    bool _2197 = _1260;
    float _2199 = _2149 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2089)
    {
        bool _2201 = _2137 > 0.5;
        _2121 = _2201;
    }
    bool _2203 = _2121;
    float _2205 = fma(_2159, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2207 = fma(_2141, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2217 = fma(_2199, _2155, -0.5);
    float _2219 = -_2187;
    float _2221 = _2219 + 1.0;
    float _2223 = fma(_2211, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2229 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2231 = _2229 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2233 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2235 = -_1152;
    float _2237 = fma(_1354, _2217, _2235);
    float _2239 = fma(_2227, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2241 = fma(_2231, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2243 = fma(_2215, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _2245 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2247 = isnan(_834);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2259 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2261 = isnan(_834);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = _2231;
    float _2273 = _2227;
    int _2275 = as_type<int>(_2217);
    int _2277 = as_type<int>(_2233);
    if (!_2085)
    {
        _2271 = _2153;
    }
    float _2279 = _2271;
    bool _2281 = _836 == 0.0;
    bool _2283 = _2281 && _2193;
    float _2285 = -_2269;
    float _2287 = _2285 + 1.0;
    float _2289 = _2279;
    if (!_2085)
    {
        _2273 = _2279;
    }
    float _2291 = _2273;
    float _2293 = _2269 * _2221;
    float _2295 = _2291;
    if (_2085)
    {
        _2289 = _2153;
    }
    float _2297 = _2289;
    float _2299 = _2255 * _2287;
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2303 = fma(_2233, _2173, -0.5);
    float _2305 = _2205 * _2299;
    float _2307 = _2207 * _2299;
    float _2309 = _2223 * _2299;
    float _2311 = -_2255;
    float _2313 = _2311 + 1.0;
    float _2315 = _2297;
    if (_2085)
    {
        float _2317 = -_2297;
        float _2319 = _2317 + 1.0;
        _2275 = as_type<int>(_2319);
    }
    int _2321 = _2275;
    float _2323 = in.m_69.x;
    float _2325 = in.m_69.y;
    float _2327 = in.m_69.z;
    if (_2089)
    {
        float _2329 = -_2297;
        float _2331 = _2329 + 1.0;
        _2277 = as_type<int>(_2331);
    }
    int _2333 = _2277;
    float _2335 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2305);
    float _2337 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2307);
    if (_2085)
    {
        float _2339 = _2197 ? as_type<float>(_2321) : _2297;
        _2295 = _2339;
    }
    float _2341 = _2295;
    float _2343 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2309);
    float _2345 = fma(_2239, _2293, _2335);
    float _2347 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2349 = fma(_2241, _2293, _2337);
    if (_2089)
    {
        float _2351 = _2203 ? as_type<float>(_2333) : _2297;
        _2315 = _2351;
    }
    float _2353 = _2315;
    float _2355 = in.m_71.x;
    float _2357 = in.m_71.y;
    float _2359 = in.m_71.z;
    float _2361 = in.m_71.w;
    float _2363 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2365 = -_1334;
    float _2367 = fma(_1332, _2303, _2365);
    float _2369 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2345);
    float _2371 = fma(_2347, _2353, -0.5);
    float _2373 = fma(_2363, _2341, -0.5);
    float _2375 = fma(_2243, _2293, _2343);
    float _2377 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2349);
    float _2379 = fma(_1320, _2371, _1326);
    float _2381 = fma(_1316, _2373, _1148);
    float _2383 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2375);
    float _2385 = _2237 + 0.5;
    float _2387 = _2379 + 0.5;
    float _2389 = _2367 + 0.5;
    if (_2283)
    {
        _1168 = _2325;
    }
    float _2391 = _1168;
    float _2393 = _2391;
    if (!_2283)
    {
        float _2395 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2325);
        _2393 = _2395;
    }
    float _2397 = _2393;
    if (_2283)
    {
        _1376 = _2327;
    }
    float _2399 = _1376;
    float _2401 = _2399;
    if (!_2283)
    {
        float _2403 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2327);
        _2401 = _2403;
    }
    float _2405 = _2401;
    float _2407 = _2381 + 0.5;
    if (_2283)
    {
        _1378 = _2323;
    }
    float _2409 = _1378;
    float _2411 = _2409;
    if (!_2283)
    {
        float _2413 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2323);
        _2411 = _2413;
    }
    float _2415 = _2411;
    float _2417 = _2359 * _2323;
    float _2419 = _2357 * _2327;
    float _2421 = _2355 * _2325;
    out.m_73.x = _2407;
    out.m_73.y = _2385;
    out.m_73.z = _2387;
    out.m_73.w = _2389;
    float _2423 = -_2417;
    float _2425 = fma(_2355, _2327, _2423);
    float _2427 = -_2419;
    float _2429 = fma(_2359, _2325, _2427);
    float _2431 = -_2421;
    float _2433 = fma(_2357, _2323, _2431);
    float _2435 = -_2357;
    float _2437 = _1510 * _2435;
    float _2439 = _2425 * _2361;
    float _2441 = _2429 * _2361;
    float _2443 = _2433 * _2361;
    float _2445 = _1518 * _2357;
    float _2447 = _1520 * _2357;
    float _2449 = -_2397;
    float _2451 = _1510 * _2449;
    float _2453 = fma(_1522, _2355, _2437);
    float _2455 = fma(_1530, _2355, _2445);
    float _2457 = fma(_1542, _2355, _2447);
    float _2459 = _1518 * _2397;
    float _2461 = -_2439;
    float _2463 = _1510 * _2461;
    float _2465 = _1520 * _2397;
    float _2467 = _1518 * _2439;
    float _2469 = _1520 * _2439;
    float _2471 = fma(_1530, _2415, _2459);
    float _2473 = fma(_1542, _2415, _2465);
    float _2475 = fma(_1522, _2415, _2451);
    float _2477 = fma(_1542, _2441, _2469);
    float _2479 = fma(_1538, _2405, _2471);
    float _2481 = fma(_1524, _2359, _2453);
    float _2483 = fma(_1524, _2405, _2475);
    float _2485 = fma(_1538, _2359, _2455);
    float _2487 = _2479 * _402;
    float _2489 = _2479 * _406;
    float _2491 = fma(_1522, _2441, _2463);
    float _2493 = fma(_1550, _2359, _2457);
    float _2495 = fma(_1530, _2441, _2467);
    float _2497 = _2479 * _410;
    float _2499 = fma(_1550, _2405, _2473);
    float _2501 = fma(_2483, _354, _2487);
    float _2503 = fma(_2483, _358, _2489);
    float _2505 = fma(_1524, _2443, _2491);
    float _2507 = _2485 * _402;
    float _2509 = _2485 * _406;
    float _2511 = fma(_2483, _362, _2497);
    float _2513 = _2485 * _410;
    float _2515 = fma(_2499, _432, _2501);
    float _2517 = fma(_2499, _436, _2503);
    float _2519 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2521 = fma(_2481, _358, _2509);
    float _2523 = fma(_2481, _362, _2513);
    float _2525 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2527 = exp2(_2519);
    float _2529 = fma(_2481, _354, _2507);
    float _2531 = fma(_1538, _2443, _2495);
    float _2533 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2525);
    float _2535 = fma(_2493, _436, _2521);
    float _2537 = fma(_2493, _432, _2529);
    float _2539 = fma(_2493, _440, _2523);
    float _2541 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2533);
    float _2543 = _2531 * _402;
    float _2545 = _2531 * _406;
    float _2547 = fma(_2499, _440, _2511);
    float _2549 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2541);
    float _2551 = _2531 * _410;
    out.m_75.x = _2537;
    out.m_75.y = _2535;
    out.m_75.z = _2539;
    float _2553 = fma(_1550, _2443, _2477);
    float _2555 = _2549 + _1996;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = fma(_2505, _354, _2543);
    float _2563 = fma(_2505, _358, _2545);
    float _2565 = _2555 * 0.5;
    float _2567 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2569 = fma(_2505, _362, _2551);
    out.m_77.x = _2515;
    out.m_77.y = _2517;
    out.m_77.z = _2547;
    float _2571 = _2369 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2573 = _2377 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2575 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2577 = fma(_2553, _432, _2561);
    float _2579 = fma(_2553, _436, _2563);
    float _2581 = fma(_2553, _440, _2569);
    float _2583 = _2571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2585 = _2573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2587 = _2575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2589 = -_2567;
    float _2591 = _2589 + 1.0;
    float _2593 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = _2583;
    out.m_79.y = _2585;
    out.m_79.z = _2587;
    out.m_81.x = _2577;
    out.m_81.y = _2579;
    out.m_81.z = _2581;
    out.gl_Position.x = _2024;
    out.gl_Position.y = _2040;
    out.gl_Position.z = _2549;
    out.gl_Position.w = _1996;
    out.m_83.z = _2565;
    out.m_83.w = _1996;
    out.m_85.w = _2593;
    float _2595 = _2567 * _2054;
    float _2597 = _2069 * _2595;
    float _2599 = _2069 * _2591;
    float _2601 = _2079 * _2595;
    float _2603 = fma(_2075, _2597, _2063);
    float _2605 = fma(_2077, _2597, _2065);
    float _2607 = fma(_2069, _2601, _2067);
    out.m_87.x = _2603;
    out.m_87.y = _2605;
    out.m_87.z = _2607;
    out.m_87.w = _2599;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _832 = false;
    bool _684 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2665 = as_type<float>(_122);
        out.gl_Position.z = _2665;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_47.w;
    float _128 = float(_106);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _128;
    float _152 = _132;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_158);
        out.gl_Position.z = _2730;
    }
    if (_148)
    {
        return out;
    }
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_53.x;
    float _184 = in.m_53.y;
    float _186 = in.m_53.z;
    float _188 = in.m_47.x;
    float _190 = in.m_47.y;
    float _192 = in.m_47.z;
    float _194 = _160 * _160;
    float _196 = _162 * _162;
    float _198 = _164 * _164;
    float _200 = fma(_166, _166, _194);
    float _202 = fma(_168, _168, _196);
    float _204 = fma(_170, _170, _198);
    float _206 = fma(_182, _182, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    bool _216 = _212 > 0.0;
    float _218 = sqrt(_210);
    bool _220 = _214 > 0.0;
    float _222 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _224 = 0.0;
    float _226 = _222;
    bool _228 = _180;
    float _230 = _162;
    float _232 = _160;
    float _234 = _164;
    if (_216)
    {
        float _236 = rsqrt(_206);
        _224 = _236;
    }
    float _238 = _224;
    bool _240 = _218 > 0.0;
    float _242 = _218;
    if (!_180)
    {
        float _244 = _222 * _222;
        float _246 = _244 * 0.5;
        _242 = _246;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _248;
    if (_220)
    {
        float _254 = rsqrt(_208);
        _250 = _254;
    }
    float _256 = _250;
    if (!_180)
    {
        float _258 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _258;
    }
    float _260 = _252;
    bool _262 = !_180;
    float _264 = _260;
    float _266 = _256;
    if (!_262)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = _222 * _270;
        float _280 = 1.0 / _274;
        float _282 = _276 * 0.693147182464599609375;
        float _284 = exp2(_278);
        float _286 = 1.0 / _282;
        float _288 = _284 + (-1.0);
        float _290 = -_288;
        float _292 = fma(_290, _286, _222);
        float _294 = _292 * _280;
        float _296 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _296;
    }
    float _298 = _264;
    bool _300 = !_180;
    if (!_300)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = 1.0 / _308;
        float _312 = _222 * _304;
        float _314 = exp2(_312);
        float _316 = -_314;
        float _318 = _316 + 1.0;
        float _320 = _318 * _310;
        _226 = _320;
    }
    float _322 = _226;
    float _324 = in.m_55.w;
    float _326 = 0.0;
    float _328 = 0.0;
    if (!_216)
    {
        _326 = 0.0;
        _328 = 0.0;
    }
    float _330 = _326;
    float _332 = _328;
    float _334 = 0.0;
    float _336 = _332;
    float _338 = _330;
    if (!_216)
    {
        _334 = 0.0;
    }
    float _340 = _334;
    float _342 = 1.0 / _128;
    float _344 = in.m_42.x;
    float _346 = in.m_42.y;
    float _348 = in.m_42.z;
    float _350 = _340;
    if (_216)
    {
        float _352 = _238 * _166;
        _350 = _352;
    }
    float _354 = _350;
    if (_216)
    {
        float _356 = _238 * _160;
        _336 = _356;
    }
    float _358 = _336;
    if (_216)
    {
        float _360 = _238 * _182;
        _338 = _360;
    }
    float _362 = _338;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _366 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _370 = _210;
    if (_240)
    {
        float _372 = rsqrt(_210);
        _370 = _372;
    }
    float _374 = _370;
    float _376 = 0.0;
    if (!_220)
    {
        _376 = 0.0;
    }
    float _378 = _376;
    float _380 = fma(_322, _188, _366);
    float _382 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _384 = _378;
    if (!_220)
    {
        _150 = 0.0;
    }
    float _386 = _150;
    float _388 = fma(_322, _190, _368);
    float _390 = 0.0;
    float _392 = _386;
    if (!_220)
    {
        _390 = 0.0;
    }
    float _394 = _390;
    float _396 = fma(_322, _192, _382);
    float _398 = _394;
    if (_220)
    {
        float _400 = _256 * _168;
        _384 = _400;
    }
    float _402 = _384;
    if (_220)
    {
        float _404 = _256 * _162;
        _392 = _404;
    }
    float _406 = _392;
    if (_220)
    {
        float _408 = _256 * _184;
        _398 = _408;
    }
    float _410 = _398;
    float _412 = 0.0;
    if (!_240)
    {
        _412 = 0.0;
    }
    float _414 = _412;
    float _416 = 0.0;
    float _418 = _414;
    if (!_240)
    {
        _416 = 0.0;
        _266 = 0.0;
    }
    float _420 = _416;
    float _422 = _266;
    float _424 = _132 * _342;
    float _426 = _420;
    float _428 = _422;
    if (_240)
    {
        float _430 = _374 * _170;
        _426 = _430;
    }
    float _432 = _426;
    if (_240)
    {
        float _434 = _374 * _164;
        _428 = _434;
    }
    float _436 = _428;
    if (_240)
    {
        float _438 = _374 * _186;
        _418 = _438;
    }
    float _440 = _418;
    float _442 = fma(_380, _324, _344);
    float _444 = fma(_388, _324, _346);
    float _446 = fma(_396, _324, _348);
    bool _448 = !_364;
    float _466;
    if (!_448)
    {
        float _450 = in.m_57.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _424;
    }
    _468 = false;
    float _470 = _466;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _470 + _476;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _470 + _504;
    float _508 = 1.0 / _494;
    bool _510 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _512 = 1.0 / _502;
    float _514 = 1.0 / _498;
    float _516 = _474 * _508;
    bool _518 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_470);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -_528;
    float _532 = _530 + 1.0;
    float _534 = _478 * _512;
    bool _536 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_470);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _548;
    float _552 = _490 * _532;
    bool _554 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_470);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = -_546;
    float _572 = _570 + 1.0;
    float _574 = -_490;
    float _576 = _574 + 1.0;
    float _578 = _506 * _514;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _584;
    float _588 = _564 * _572;
    float _590 = fma(_550, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _592 = fma(_582, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _594 = fma(_586, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _596 = _546 * _576;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _602 = _592 * _588;
    float _604 = _594 * _588;
    float _606 = -_564;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _614 = _590 * _588;
    float _616 = fma(_568, _578, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].x, _604);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _620;
    float _624 = fma(_612, _578, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _626 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _628 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].z, _614);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _630;
    float _634 = fma(_600, _578, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _636;
    float _640 = fma(_616, _596, _618);
    float _642 = fma(_622, _534, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _644 = fma(_632, _534, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _646 = fma(_624, _596, _626);
    float _648 = fma(_638, _534, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _650 = fma(_634, _596, _628);
    float _652 = fma(_642, _552, _640);
    float _654 = fma(_644, _552, _646);
    float _656 = fma(_648, _552, _650);
    float _658 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].x, _652);
    float _660 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].y, _654);
    float _662 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].z, _656);
    bool _664 = !_510;
    float _682;
    if (!_664)
    {
        float _666 = in.m_57.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _424;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _712 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _714 = isnan(_686);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _724;
    bool _728 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _730 = isnan(_686);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = 1.0 / _694;
    float _742 = -_706;
    float _744 = _742 + 1.0;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _748 = _722 * _744;
    float _750 = -_722;
    float _752 = _750 + 1.0;
    float _754 = 1.0 / _710;
    float _756 = _726 * _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = fma(_756, _690, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _764 = _760 * _754;
    float _766 = _762 * _748;
    float _768 = -_738;
    float _770 = _768 + 1.0;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _774 = _686 + _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[115].x, _766);
    float _780 = _706 * _770;
    float _782 = fma(_764, _774, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _784 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = fma(_782, _780, _778);
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _790 = in.m_55.x;
    float _792 = in.m_55.y;
    float _794 = in.m_55.z;
    float _796 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[117].x, _786);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _784;
    out.m_59.y = _800;
    out.m_59.z = _804;
    out.m_59.w = _802;
    float _806 = _662 * _794;
    float _808 = _660 * _792;
    float _810 = _658 * _790;
    bool _812 = !_746;
    float _830;
    if (!_812)
    {
        float _814 = in.m_57.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _830 = _828;
        _832 = true;
    }
    else
    {
        _830 = _424;
    }
    _832 = false;
    float _834 = _830;
    float _836 = in.m_61.z;
    float _838 = in.m_61.x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = in.m_57.z;
    float _844 = in.m_57.x;
    float _846 = in.m_57.y;
    float _848 = _836 * 3.0;
    float _850 = _838 * 3.0;
    float _852 = _842 * 2.0;
    float _854 = abs(_848);
    float _856 = abs(_850);
    float _858 = precise::max(_854, _856);
    float _860 = _844 * 2.0;
    bool _862 = _858 >= 16.0;
    float _864 = floor(_852);
    float _866 = _846 * 2.0;
    float _868 = _846 + _842;
    float _870 = _846 + _844;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _874 = _872 != 0;
    float _876 = _844 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _878 = _868 + (-1.0);
    float _880 = floor(_860);
    float _882 = _870 + (-1.0);
    float _884 = -_840;
    float _886 = fma(_876, 2.0, _884);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _890 = _848;
    float _892 = _850;
    if (_862)
    {
        float _894 = _836 * 0.1875;
        _890 = _894;
    }
    float _896 = _890;
    float _898 = _896;
    if (_862)
    {
        float _900 = _838 * 0.1875;
        _892 = _900;
    }
    float _902 = _892;
    float _904 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _906 = floor(_866);
    float _908 = abs(_896);
    bool _910 = _908 != 0.0;
    bool _912 = isnan(_908);
    bool _914 = _910 || _912;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    float _920 = _876;
    float _922 = _902;
    if (!_874)
    {
        float _924 = in.m_57.z;
        _920 = _924;
    }
    float _926 = _920;
    float _928 = abs(_902);
    bool _930 = _928 == 0.0;
    float _932 = abs(_902);
    bool _934 = _932 == 0.0;
    bool _936 = !_918;
    bool _938 = _934 && _936;
    bool _940 = _864 > 0.0;
    bool _942 = _864 >= 0.0;
    bool _944 = isnan(_864);
    bool _946 = _942 || _944;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _954 = _846 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _956 = fma(_954, -2.0, _952);
    if (_938)
    {
        bool _958 = as_type<int>(_902) >= 0;
        _228 = _958;
    }
    bool _960 = _228;
    int _962 = 0;
    int _964 = _960 ? (-1) : 0;
    if (_938)
    {
        int _966 = _960 ? 0 : 1078530011;
        _962 = _966;
    }
    int _968 = _962;
    int _970 = _968;
    if (_938)
    {
        int _972 = int(0x80000000) & as_type<int>(_896);
        int _974 = _968 | _972;
        _970 = _974;
    }
    int _976 = _970;
    bool _978 = !_918;
    bool _980 = _978 && _930;
    int _982 = _976;
    float _984 = as_type<float>(_976);
    float _986 = _926;
    if (!_980)
    {
        float _988 = abs(_896);
        bool _990 = _988 != as_type<float>(0x7f800000u /* inf */);
        bool _992 = isnan(_988);
        bool _994 = _990 || _992;
        bool _996 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _998 = _994 || _996;
        float _1000 = abs(_902);
        bool _1002 = _1000 == as_type<float>(0x7f800000u /* inf */);
        float _1004 = abs(_902);
        bool _1006 = _1004 == as_type<float>(0x7f800000u /* inf */);
        bool _1008 = !_998;
        bool _1010 = _1006 && _1008;
        if (_1010)
        {
            bool _1012 = as_type<int>(_902) >= 0;
            _964 = _1012 ? (-1) : 0;
        }
        int _1014 = _964;
        if (_1010)
        {
            _982 = 1075235812;
        }
        int _1016 = _982;
        int _1018 = _1016;
        if (_1010)
        {
            int _1020 = ~_1014;
            int _1022 = (_1020 != 0) ? _1016 : 1061752795;
            _1018 = _1022;
        }
        int _1024 = _1018;
        float _1026 = as_type<float>(_1024);
        if (_1010)
        {
            int _1028 = int(0x80000000) & as_type<int>(_896);
            int _1030 = _1024 | _1028;
            _1026 = as_type<float>(_1030);
        }
        float _1032 = _1026;
        bool _1034 = !_998;
        bool _1036 = _1034 && _1002;
        _984 = _1032;
        if (!_1036)
        {
            float _1038 = abs(_896);
            float _1040 = abs(_902);
            float _1042 = precise::max(_1038, _1040);
            float _1044 = abs(_896);
            float _1046 = abs(_902);
            float _1048 = precise::min(_1044, _1046);
            float _1050 = 1.0 / _1042;
            float _1052 = abs(_896);
            float _1054 = abs(_902);
            bool _1056 = _1052 > _1054;
            bool _1058 = as_type<int>(_902) >= 0;
            float _1060 = _1048 * _1050;
            float _1062 = _1060 * _1060;
            float _1064 = _1062 + 11.33538818359375;
            float _1066 = fma(_1062, _1064, 28.84246826171875);
            float _1068 = fma(_1062, _1066, 19.6966705322265625);
            float _1070 = fma(_1062, -0.82336294651031494140625, -5.674867153167724609375);
            float _1072 = abs(_896);
            float _1074 = abs(_902);
            float _1076 = _1072 + _1074;
            int _1078 = as_type<int>(_896) & int(0x80000000);
            float _1080 = fma(_1062, _1070, -6.565555095672607421875);
            float _1082 = 1.0 / _1068;
            bool _1084 = _1076 > as_type<float>(0x7f800000u /* inf */);
            bool _1086 = isnan(_1076);
            bool _1088 = _1084 || _1086;
            bool _1090 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1092 = _1088 || _1090;
            float _1094 = _1062 * _1080;
            float _1096 = _1060 * _1094;
            float _1098 = fma(_1096, _1082, _1060);
            float _1100 = _1098;
            _898 = as_type<float>(_1078);
            _984 = _1076;
            if (_1056)
            {
                float _1102 = -_1098;
                float _1104 = _1102 + 1.57079637050628662109375;
                _1100 = _1104;
            }
            float _1106 = _1100;
            int _1108 = as_type<int>(_1106);
            if (!_1058)
            {
                float _1110 = -_1106;
                float _1112 = _1110 + 3.1415927410125732421875;
                _1108 = as_type<int>(_1112);
            }
            int _1114 = _1108;
            if (!_1092)
            {
                int _1116 = _1078 | _1114;
                _984 = as_type<float>(_1116);
            }
        }
    }
    float _1118 = _898;
    float _1120 = _984;
    float _1122 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1124 = log2(_1122);
    float _1126 = in.m_63.y;
    int _1128 = _950 ? 0 : 1;
    float _1130 = _844 * 6.283185482025146484375;
    bool _1132 = _906 > 0.0;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1136 = _906 >= 0.0;
    bool _1138 = isnan(_906);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = -_132;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[76].x, _886);
    bool _1150 = _880 > 0.0;
    float _1152 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _956);
    bool _1154 = _880 >= 0.0;
    bool _1156 = isnan(_880);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    float _1164 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1166 = _1118;
    float _1168 = _1148;
    if (!_874)
    {
        _1166 = _926;
    }
    float _1170 = _1166;
    float _1172 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1174 = _1170;
    if (_874)
    {
        _986 = _846;
    }
    float _1176 = _986;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_874)
    {
        _1174 = _846;
    }
    float _1180 = _1174;
    int _1182 = ~_1128;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1134);
    int _1190 = _1186;
    if (!_874)
    {
        _922 = _846;
    }
    float _1192 = _922;
    float _1194 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1196 = _1192;
    if (!_940)
    {
        int _1198 = ~_1128;
        int _1200 = _1198 + 1;
        _1190 = _1200;
    }
    int _1202 = _1190;
    float _1204 = fma(_1126, 12.0, _1130);
    if (_874)
    {
        _1196 = _844;
    }
    float _1206 = _1196;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1218 = _1216 != 0;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1222 = float(_1202);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1178);
    float _1226 = _1124 * _132;
    bool _1228 = !_1210;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1234 = abs(_1230);
    float _1236 = -_1232;
    float _1238 = fma(_1220, 2.0, _1236);
    float _1240 = exp2(_1226);
    int _1242 = _1144 ? 0 : 1;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1246 = _1162 ? 0 : 1;
    float _1248 = float(_1234);
    float _1250 = fma(_1194, -2.0, _1244);
    int _1252 = ~_1242;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = _1256;
    bool _1260 = _1144;
    if (!_1132)
    {
        int _1262 = ~_1242;
        int _1264 = _1262 + 1;
        _1258 = _1264;
    }
    int _1266 = _1258;
    float _1268 = _1248 * _1222;
    int _1270 = ~_1246;
    int _1272 = _1270 + 1;
    int _1274 = _1272 + 1;
    float _1276 = -_1240;
    float _1278 = _1276 + 1.0;
    int _1280 = _1274;
    if (!_1150)
    {
        int _1282 = ~_1246;
        int _1284 = _1282 + 1;
        _1280 = _1284;
    }
    int _1286 = _1280;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1290 = in.m_65.x;
    float _1292 = in.m_65.y;
    float _1294 = in.m_65.z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1298 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1300 = isnan(0.0);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1306 = _1302 || _1304;
    float _1308 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1288);
    float _1310 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1296);
    bool _1312 = !_1214;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1308);
    float _1318 = _1306 ? _1278 : 0.0;
    float _1320 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1224);
    int _1322 = abs(_1314);
    float _1324 = -_132;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1330 = 1.0 + _1328;
    float _1332 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1188);
    float _1334 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1250);
    float _1336 = 1.0 / _1330;
    float _1338 = _1268 * (-2.0);
    float _1340 = float(_1322);
    float _1342 = _1204 * 0.15915493667125701904296875;
    bool _1344 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1346 = isnan(1.0);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1352 = _1348 || _1350;
    float _1354 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1310);
    float _1356 = fma(_1338, _1290, _1290);
    float _1358 = float(_1286);
    float _1360 = fma(_904, _1338, _904);
    bool _1362 = !_1218;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = _844 + (-0.5);
    float _1368 = _844 + _842;
    float _1370 = _1340 * _1358;
    int _1372 = abs(_1364);
    float _1374 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1356);
    float _1376 = _1316;
    float _1378 = _1320;
    if (_1352)
    {
        float _1380 = _1318 * _1336;
        _152 = _1380;
    }
    float _1382 = _152;
    float _1384 = _1370 * (-2.0);
    float _1386 = in.m_61.y;
    float _1388 = _1368 + (-1.0);
    float _1390 = fma(_1360, _1382, _1374);
    float _1392 = fma(_888, _1384, _888);
    float _1394 = fma(_1384, _1292, _1292);
    float _1396 = _846 + (-0.5);
    float _1398 = float(_1266);
    float _1400 = _1342 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = float(_1372);
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1394);
    float _1408 = _842 + (-0.5);
    float _1410 = _1390 * 0.15915493667125701904296875;
    float _1412 = _1404 * _1398;
    float _1414 = fma(_1392, _1382, _1406);
    float _1416 = _1410 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1412 * (-2.0);
    float _1422 = _1414 * 0.15915493667125701904296875;
    float _1424 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1426 = fma(_1420, _1294, _1294);
    float _1428 = fma(_1120, 0.1500000059604644775390625, _1386);
    float _1430 = fma(_1424, _1420, _1424);
    float _1432 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1434 = _1422 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = _1402 * 0.4000000059604644775390625;
    float _1440 = fma(_1430, _1382, _1432);
    float _1442 = _444 * _168;
    float _1444 = _424 * _424;
    float _1446 = _444 * _184;
    float _1448 = _1440 * 0.15915493667125701904296875;
    float _1450 = _1422 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = fma(_442, _166, _1442);
    float _1456 = fma(_1438, _1444, _1428);
    float _1458 = fma(_442, _182, _1446);
    float _1460 = fma(_446, _170, _1454);
    float _1462 = _444 * _162;
    bool _1464 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1466 = isnan(0.5);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1472 = _1468 || _1470;
    float _1474 = _1410 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _838);
    float _1482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1456);
    float _1484 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1486 = _1478 * _1164;
    float _1488 = _1418 * _1436;
    float _1490 = in.m_53.w;
    float _1492 = _1448 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = _1418 * _1452;
    float _1498 = _1482 * _1172;
    float _1500 = _1480 * _1484;
    float _1502 = fma(_446, _186, _1458);
    float _1504 = in.m_51.w;
    float _1506 = fma(_442, _160, _1462);
    float _1508 = _1448 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1476 * _1436;
    float _1514 = _1476 * _1452;
    float _1516 = fma(_446, _164, _1506);
    float _1518 = _1418 * _1494;
    float _1520 = _1476 * _1494;
    float _1522 = _1452 * _1494;
    float _1524 = _1436 * _1494;
    float _1526 = _1518 * _1498;
    float _1528 = _1502 + _1490;
    float _1530 = fma(_1510, _1496, _1512);
    float _1532 = -_1498;
    float _1534 = _1510 * _1532;
    float _1536 = -_1514;
    float _1538 = fma(_1510, _1488, _1536);
    float _1540 = -_1488;
    float _1542 = fma(_1510, _1514, _1540);
    float _1544 = fma(_1530, _1500, _1526);
    float _1546 = _1520 * _1498;
    float _1548 = fma(_1522, _1500, _1534);
    float _1550 = fma(_1510, _1512, _1496);
    float _1552 = fma(_1538, _1486, _1544);
    float _1554 = fma(_1542, _1500, _1546);
    float _1556 = fma(_1524, _1486, _1548);
    float _1558 = _1460 + _1504;
    float _1560 = _1552 * _410;
    float _1562 = fma(_1550, _1486, _1554);
    float _1564 = _1552 * _402;
    float _1566 = _1552 * _406;
    float _1568 = fma(_1556, _362, _1560);
    float _1570 = fma(_1556, _354, _1564);
    float _1572 = fma(_1556, _358, _1566);
    float _1574 = fma(_1562, _440, _1568);
    float _1576 = fma(_1562, _432, _1570);
    float _1578 = fma(_1562, _436, _1572);
    float _1580 = _1528 + _1574;
    float _1582 = in.m_49.w;
    float _1584 = _1558 + _1576;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1588 = _1580 + _1586;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1592 = _1584 + _1590;
    float _1594 = _1588 * _1588;
    float _1596 = fma(_1592, _1592, _1594);
    float _1598 = sqrt(_1596);
    float _1600 = _1516 + _1582;
    float _1602 = _1600 + _1578;
    bool _1604 = _1598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1606 = _1578;
    float _1608 = _1592;
    float _1610 = _1588;
    float _1612 = _1596;
    if (!_1604)
    {
        _230 = _1584;
    }
    float _1614 = _230;
    float _1616 = _1614;
    if (!_1604)
    {
        _1606 = _1580;
    }
    float _1618 = _1606;
    float _1620 = _1618;
    if (!_1604)
    {
        _232 = _1602;
    }
    float _1622 = _232;
    bool _1624 = !_1604;
    float _1626 = _1622;
    if (!_1624)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1632 = _1598 + _1630;
        float _1634 = rsqrt(_1596);
        float _1636 = _1632 * _1628;
        float _1638 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = _1636 * 0.15915493667125701904296875;
        float _1642 = _1640 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        float _1646 = _1640 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644 + (-1.0);
        float _1652 = fma(_1648, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1654 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = _1634 * _1652;
        float _1658 = fma(_1602, _1644, _1654);
        float _1660 = fma(_1592, _1656, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1662 = fma(_1588, _1656, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1616 = _1660;
        _1626 = _1658;
        _1620 = _1662;
        _234 = _1650;
    }
    float _1664 = _1616;
    float _1666 = _1626;
    float _1668 = _1620;
    float _1670 = _234;
    float _1672 = _1668;
    float _1674 = _1670;
    float _1676 = _1664;
    if (_1472)
    {
        _1608 = _1664;
    }
    float _1678 = _1608;
    float _1680 = _1678;
    if (_1472)
    {
        _1610 = _1666;
    }
    float _1682 = _1610;
    float _1684 = _1682;
    if (!_1472)
    {
        float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1688 = _1600 + _1686;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1692 = _1558 + _1690;
        float _1694 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1696 = -_1558;
        float _1698 = _1696 + _1664;
        float _1700 = _1688 * _1688;
        float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1704 = _1528 + _1702;
        float _1706 = -_1600;
        float _1708 = _1706 + _1666;
        float _1710 = -_1528;
        float _1712 = _1710 + _1668;
        float _1714 = fma(_1692, _1692, _1700);
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1718 = fma(_1704, _1704, _1714);
        float _1720 = sqrt(_1718);
        float _1722 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1724 = precise::min(_1720, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1726 = _1724 * _1716;
        float _1728 = _1722 * _1726;
        float _1730 = fma(_1698, _1728, _1558);
        float _1732 = fma(_1708, _1728, _1600);
        float _1734 = fma(_1712, _1728, _1528);
        _1684 = _1732;
        _1680 = _1730;
        _1672 = _1734;
        _1674 = _1720;
        _1676 = _1698;
    }
    float _1736 = _1684;
    float _1738 = _1680;
    float _1740 = _1672;
    float _1742 = _1674;
    float _1744 = _1676;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1748 = _1736 + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1752 = _1738 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1740 + _1754;
    float _1758 = _1748 * _1748;
    float _1760 = fma(_1752, _1752, _1758);
    float _1762 = fma(_1756, _1756, _1760);
    float _1764 = rsqrt(_1762);
    float _1766 = sqrt(_1762);
    float _1768 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1770 = _1752 * _1768;
    float _1772 = _1756 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 * _1772;
    float _1778 = _1774 + _1776;
    float _1780 = sqrt(_1778);
    bool _1782 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1780 + _1784;
    float _1788 = _1764;
    float _1790 = _1786;
    float _1792 = _1742;
    float _1794 = _1748;
    if (_1782)
    {
        float _1796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1788 = _1796;
    }
    float _1798 = _1788;
    float _1800 = _1798;
    if (_1782)
    {
        float _1802 = _1786 * _1798;
        _1790 = _1802;
    }
    float _1804 = _1790;
    if (_1782)
    {
        float _1806 = rsqrt(_1778);
        _1800 = _1806;
    }
    float _1808 = _1800;
    float _1810 = _1808;
    if (_1782)
    {
        float _1812 = _1804 * 0.15915493667125701904296875;
        _1792 = _1812;
    }
    float _1814 = _1792;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = _1756;
    float _1820 = _1814;
    if (_1782)
    {
        float _1822 = _1814 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1818 = _1824;
    }
    float _1826 = _1818;
    float _1828 = precise::max(0.0, _1816);
    float _1830 = _1744;
    if (_1782)
    {
        float _1832 = _1814 * 6.283185482025146484375;
        float _1834 = cos(_1832);
        _1830 = _1834;
    }
    float _1836 = _1830;
    float _1838 = -_1768;
    float _1840 = -_1828;
    float _1842 = fma(_1748, _1838, _1840);
    float _1844 = _1842;
    if (_1782)
    {
        float _1846 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1794 = _1846;
    }
    float _1848 = _1794;
    float _1850 = _1826;
    float _1852 = _1848;
    if (_1782)
    {
        float _1854 = fma(_1826, _1848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = _1856;
    if (_1782)
    {
        float _1860 = _1808 * _1856;
        _1612 = _1860;
    }
    float _1862 = _1612;
    if (!_1782)
    {
        _1810 = _1770;
    }
    float _1864 = _1810;
    float _1866 = _1864;
    float _1868 = _1836;
    if (_1782)
    {
        float _1870 = _1836 + (-1.0);
        _1852 = _1870;
    }
    float _1872 = _1852;
    float _1874 = _1872;
    if (_1782)
    {
        float _1876 = _1770 * _1862;
        _1866 = _1876;
    }
    float _1878 = _1866;
    if (!_1782)
    {
        _1858 = _1772;
    }
    float _1880 = _1858;
    float _1882 = _1880;
    if (_1782)
    {
        float _1884 = _1772 * _1862;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (_1782)
    {
        float _1888 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1888;
    }
    float _1890 = _1820;
    if (!_1782)
    {
        _1874 = _1774;
    }
    float _1892 = _1874;
    float _1894 = _1892;
    if (_1782)
    {
        float _1896 = _1878 * _1878;
        _1894 = _1896;
    }
    float _1898 = _1894;
    float _1900 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1782)
    {
        float _1902 = fma(_1842, _1836, _1890);
        _1844 = _1902;
    }
    float _1904 = _1844;
    if (!_1782)
    {
        _1868 = _1776;
    }
    float _1906 = _1868;
    float _1908 = _1906;
    if (_1782)
    {
        float _1910 = _1886 * _1886;
        _1908 = _1910;
    }
    float _1912 = _1908;
    float _1914 = fma(_1904, _1904, _1898);
    float _1916 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1918 = _1914 + _1912;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1900);
    float _1928 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1930 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1932 = -_1924;
    float _1934 = _1932 + 1.0;
    float _1936 = rsqrt(_1918);
    float _1938 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1940 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1928);
    float _1944 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1930);
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1948 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1950 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1942);
    float _1952 = abs(_1934);
    float _1954 = log2(_1952);
    float _1956 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1944);
    float _1958 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1948);
    float _1960 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1962 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1966 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1968 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1970 = _1936 * _1878;
    float _1972 = _1936 * _1904;
    float _1974 = _1936 * _1886;
    float _1976 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1968);
    float _1978 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1980 = -_1962;
    float _1982 = fma(_1980, _1916, 1.0);
    float _1984 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1986 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1976);
    float _1988 = -_1978;
    float _1990 = fma(_1972, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = log2(_1982);
    float _1996 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1986);
    float _1998 = -_1974;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1984);
    float _2006 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2008 = exp2(_1992);
    float _2010 = fma(_2000, -0.5, 0.5);
    float _2012 = fma(_2000, 0.5, 0.5);
    float _2014 = _1972 + 1.0;
    float _2016 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2006);
    float _2018 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2020 = fma(_2012, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2022 = 1.0 / _1996;
    float _2024 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2016);
    float _2026 = _1994 * 0.693147182464599609375;
    float _2028 = fma(_2012, _2020, -0.212114393711090087890625);
    float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2032 = fma(_2012, _2028, 1.570728778839111328125);
    float _2034 = sqrt(_2010);
    float _2036 = -_1972;
    float _2038 = fma(_2008, _2014, _2036);
    float _2040 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2018);
    float _2042 = _2024 * _2022;
    float _2044 = _2040 * _2022;
    float _2046 = fma(_2038, 0.5, 0.5);
    float _2048 = fma(_2042, 0.5, 0.5);
    float _2050 = fma(_2044, -0.5, 0.5);
    float _2052 = _2034 * 0.636619746685028076171875;
    float3 _5633 = float3(_2048, _2050, _2030);
    float _2054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5633, float3(0.0), isnan(_5633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5633, float3(0.0), isnan(_5633)), level(0.0)).x;
    float _2056 = -_2032;
    float _2058 = fma(_2052, _2056, 1.0);
    float3 _5649 = float3(_2048, _2050, _2030);
    float4 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5649, float3(0.0), isnan(_5649)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5649, float3(0.0), isnan(_5649)), level(0.0)).xyzw;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _2061.w;
    float2 _5666 = float2(_2058, _2046);
    float3 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5666, float2(0.0), isnan(_5666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5666, float2(0.0), isnan(_5666)), level(0.0)).xyz;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = in.m_57.w;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2085 = _2083 != 0;
    out.m_45.x = 1.0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2089 = _2087 != 0;
    float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2101 = _2099 != 0;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2105 = _834 + _2103;
    float _2107 = 1.0 / _2093;
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2111 = _2109 != 0;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2115 = _834 + _2113;
    bool _2117 = _846 > 0.5;
    out.m_67.x = _1738;
    out.m_67.y = _1736;
    out.m_67.z = _1740;
    float _2119 = 0.0;
    bool _2121 = _2117;
    if (_2085)
    {
        float _2123 = in.m_57.x;
        _2119 = _2123;
    }
    float _2125 = _2119;
    float _2127 = 1.0 / _2097;
    float _2129 = -_1126;
    float _2131 = _2129 + 1.0;
    float _2133 = _2044;
    if (_2089)
    {
        float _2135 = in.m_57.z;
        _2133 = _2135;
    }
    float _2137 = _2133;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2139;
    bool _2143 = _2081 > 0.5;
    float _2145 = _2115 * _2107;
    int _2147 = _2117 ? as_type<int>(_2131) : as_type<int>(_1126);
    float _2149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2151 = _2143 ? as_type<int>(_2131) : as_type<int>(_1126);
    float _2153 = in.m_63.x;
    float _2155 = _2101 ? as_type<float>(_2147) : _1126;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2157;
    bool _2161 = _1456 != 0.0;
    bool _2163 = isnan(_1456);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    float _2171 = _2105 * _2127;
    float _2173 = _2111 ? as_type<float>(_2151) : _1126;
    float _2175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2177 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2179 = isnan(_834);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2185 = _2181 || _2183;
    float _2187 = float(_2185);
    bool _2189 = _838 == 0.0;
    bool _2191 = !_2169;
    bool _2193 = _2189 && _2191;
    if (_2085)
    {
        bool _2195 = _2125 > 0.5;
        _1260 = _2195;
    }
    bool _2197 = _1260;
    float _2199 = _2149 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2089)
    {
        bool _2201 = _2137 > 0.5;
        _2121 = _2201;
    }
    bool _2203 = _2121;
    float _2205 = fma(_2159, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2207 = fma(_2141, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2217 = fma(_2199, _2155, -0.5);
    float _2219 = -_2187;
    float _2221 = _2219 + 1.0;
    float _2223 = fma(_2211, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2229 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2231 = _2229 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2233 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2235 = -_1152;
    float _2237 = fma(_1354, _2217, _2235);
    float _2239 = fma(_2227, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2241 = fma(_2231, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2243 = fma(_2215, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _2245 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2247 = isnan(_834);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2259 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2261 = isnan(_834);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = _2231;
    float _2273 = _2227;
    int _2275 = as_type<int>(_2217);
    int _2277 = as_type<int>(_2233);
    if (!_2085)
    {
        _2271 = _2153;
    }
    float _2279 = _2271;
    bool _2281 = _836 == 0.0;
    bool _2283 = _2281 && _2193;
    float _2285 = -_2269;
    float _2287 = _2285 + 1.0;
    float _2289 = _2279;
    if (!_2085)
    {
        _2273 = _2279;
    }
    float _2291 = _2273;
    float _2293 = _2269 * _2221;
    float _2295 = _2291;
    if (_2085)
    {
        _2289 = _2153;
    }
    float _2297 = _2289;
    float _2299 = _2255 * _2287;
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2303 = fma(_2233, _2173, -0.5);
    float _2305 = _2205 * _2299;
    float _2307 = _2207 * _2299;
    float _2309 = _2223 * _2299;
    float _2311 = -_2255;
    float _2313 = _2311 + 1.0;
    float _2315 = _2297;
    if (_2085)
    {
        float _2317 = -_2297;
        float _2319 = _2317 + 1.0;
        _2275 = as_type<int>(_2319);
    }
    int _2321 = _2275;
    float _2323 = in.m_69.x;
    float _2325 = in.m_69.y;
    float _2327 = in.m_69.z;
    if (_2089)
    {
        float _2329 = -_2297;
        float _2331 = _2329 + 1.0;
        _2277 = as_type<int>(_2331);
    }
    int _2333 = _2277;
    float _2335 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2305);
    float _2337 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2307);
    if (_2085)
    {
        float _2339 = _2197 ? as_type<float>(_2321) : _2297;
        _2295 = _2339;
    }
    float _2341 = _2295;
    float _2343 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2309);
    float _2345 = fma(_2239, _2293, _2335);
    float _2347 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2349 = fma(_2241, _2293, _2337);
    if (_2089)
    {
        float _2351 = _2203 ? as_type<float>(_2333) : _2297;
        _2315 = _2351;
    }
    float _2353 = _2315;
    float _2355 = in.m_71.x;
    float _2357 = in.m_71.y;
    float _2359 = in.m_71.z;
    float _2361 = in.m_71.w;
    float _2363 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2365 = -_1334;
    float _2367 = fma(_1332, _2303, _2365);
    float _2369 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2345);
    float _2371 = fma(_2347, _2353, -0.5);
    float _2373 = fma(_2363, _2341, -0.5);
    float _2375 = fma(_2243, _2293, _2343);
    float _2377 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2349);
    float _2379 = fma(_1320, _2371, _1326);
    float _2381 = fma(_1316, _2373, _1148);
    float _2383 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2375);
    float _2385 = _2237 + 0.5;
    float _2387 = _2379 + 0.5;
    float _2389 = _2367 + 0.5;
    if (_2283)
    {
        _1168 = _2325;
    }
    float _2391 = _1168;
    float _2393 = _2391;
    if (!_2283)
    {
        float _2395 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2325);
        _2393 = _2395;
    }
    float _2397 = _2393;
    if (_2283)
    {
        _1376 = _2327;
    }
    float _2399 = _1376;
    float _2401 = _2399;
    if (!_2283)
    {
        float _2403 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2327);
        _2401 = _2403;
    }
    float _2405 = _2401;
    float _2407 = _2381 + 0.5;
    if (_2283)
    {
        _1378 = _2323;
    }
    float _2409 = _1378;
    float _2411 = _2409;
    if (!_2283)
    {
        float _2413 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2323);
        _2411 = _2413;
    }
    float _2415 = _2411;
    float _2417 = _2359 * _2323;
    float _2419 = _2357 * _2327;
    float _2421 = _2355 * _2325;
    out.m_73.x = _2407;
    out.m_73.y = _2385;
    out.m_73.z = _2387;
    out.m_73.w = _2389;
    float _2423 = -_2417;
    float _2425 = fma(_2355, _2327, _2423);
    float _2427 = -_2419;
    float _2429 = fma(_2359, _2325, _2427);
    float _2431 = -_2421;
    float _2433 = fma(_2357, _2323, _2431);
    float _2435 = -_2357;
    float _2437 = _1510 * _2435;
    float _2439 = _2425 * _2361;
    float _2441 = _2429 * _2361;
    float _2443 = _2433 * _2361;
    float _2445 = _1518 * _2357;
    float _2447 = _1520 * _2357;
    float _2449 = -_2397;
    float _2451 = _1510 * _2449;
    float _2453 = fma(_1522, _2355, _2437);
    float _2455 = fma(_1530, _2355, _2445);
    float _2457 = fma(_1542, _2355, _2447);
    float _2459 = _1518 * _2397;
    float _2461 = -_2439;
    float _2463 = _1510 * _2461;
    float _2465 = _1520 * _2397;
    float _2467 = _1518 * _2439;
    float _2469 = _1520 * _2439;
    float _2471 = fma(_1530, _2415, _2459);
    float _2473 = fma(_1542, _2415, _2465);
    float _2475 = fma(_1522, _2415, _2451);
    float _2477 = fma(_1542, _2441, _2469);
    float _2479 = fma(_1538, _2405, _2471);
    float _2481 = fma(_1524, _2359, _2453);
    float _2483 = fma(_1524, _2405, _2475);
    float _2485 = fma(_1538, _2359, _2455);
    float _2487 = _2479 * _402;
    float _2489 = _2479 * _406;
    float _2491 = fma(_1522, _2441, _2463);
    float _2493 = fma(_1550, _2359, _2457);
    float _2495 = fma(_1530, _2441, _2467);
    float _2497 = _2479 * _410;
    float _2499 = fma(_1550, _2405, _2473);
    float _2501 = fma(_2483, _354, _2487);
    float _2503 = fma(_2483, _358, _2489);
    float _2505 = fma(_1524, _2443, _2491);
    float _2507 = _2485 * _402;
    float _2509 = _2485 * _406;
    float _2511 = fma(_2483, _362, _2497);
    float _2513 = _2485 * _410;
    float _2515 = fma(_2499, _432, _2501);
    float _2517 = fma(_2499, _436, _2503);
    float _2519 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2521 = fma(_2481, _358, _2509);
    float _2523 = fma(_2481, _362, _2513);
    float _2525 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2527 = exp2(_2519);
    float _2529 = fma(_2481, _354, _2507);
    float _2531 = fma(_1538, _2443, _2495);
    float _2533 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2525);
    float _2535 = fma(_2493, _436, _2521);
    float _2537 = fma(_2493, _432, _2529);
    float _2539 = fma(_2493, _440, _2523);
    float _2541 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2533);
    float _2543 = _2531 * _402;
    float _2545 = _2531 * _406;
    float _2547 = fma(_2499, _440, _2511);
    float _2549 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2541);
    float _2551 = _2531 * _410;
    out.m_75.x = _2537;
    out.m_75.y = _2535;
    out.m_75.z = _2539;
    float _2553 = fma(_1550, _2443, _2477);
    float _2555 = _2549 + _1996;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = fma(_2505, _354, _2543);
    float _2563 = fma(_2505, _358, _2545);
    float _2565 = _2555 * 0.5;
    float _2567 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2569 = fma(_2505, _362, _2551);
    out.m_77.x = _2515;
    out.m_77.y = _2517;
    out.m_77.z = _2547;
    float _2571 = _2369 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2573 = _2377 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2575 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2577 = fma(_2553, _432, _2561);
    float _2579 = fma(_2553, _436, _2563);
    float _2581 = fma(_2553, _440, _2569);
    float _2583 = _2571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2585 = _2573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2587 = _2575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2589 = -_2567;
    float _2591 = _2589 + 1.0;
    float _2593 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = _2583;
    out.m_79.y = _2585;
    out.m_79.z = _2587;
    out.m_81.x = _2577;
    out.m_81.y = _2579;
    out.m_81.z = _2581;
    out.gl_Position.x = _2024;
    out.gl_Position.y = _2040;
    out.gl_Position.z = _2549;
    out.gl_Position.w = _1996;
    out.m_83.z = _2565;
    out.m_83.w = _1996;
    out.m_85.w = _2593;
    float _2595 = _2567 * _2054;
    float _2597 = _2069 * _2595;
    float _2599 = _2069 * _2591;
    float _2601 = _2079 * _2595;
    float _2603 = fma(_2075, _2597, _2063);
    float _2605 = fma(_2077, _2597, _2065);
    float _2607 = fma(_2069, _2601, _2067);
    out.m_87.x = _2603;
    out.m_87.y = _2605;
    out.m_87.z = _2607;
    out.m_87.w = _2599;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _832 = false;
    bool _684 = false;
    bool _468 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_42.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    float _114 = as_type<float>(_106);
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _112;
    if (!_110)
    {
        out.m_45.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _116 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2665 = as_type<float>(_122);
        out.gl_Position.z = _2665;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_47.w;
    float _128 = float(_106);
    float _130 = -_126;
    float _132 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_126);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    bool _144 = _132 >= _128;
    bool _146 = !_142;
    bool _148 = _144 || _146;
    float _150 = _128;
    float _152 = _132;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2730 = as_type<float>(_158);
        out.gl_Position.z = _2730;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_49.x;
    float _162 = in.m_49.y;
    float _164 = in.m_49.z;
    float _166 = in.m_51.x;
    float _168 = in.m_51.y;
    float _170 = in.m_51.z;
    bool _172 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _174 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _176 = _172 || _174;
    bool _178 = isnan(1.0);
    bool _180 = _176 || _178;
    float _182 = in.m_53.x;
    float _184 = in.m_53.y;
    float _186 = in.m_53.z;
    float _188 = in.m_47.x;
    float _190 = in.m_47.y;
    float _192 = in.m_47.z;
    float _194 = _160 * _160;
    float _196 = _162 * _162;
    float _198 = _164 * _164;
    float _200 = fma(_166, _166, _194);
    float _202 = fma(_168, _168, _196);
    float _204 = fma(_170, _170, _198);
    float _206 = fma(_182, _182, _200);
    float _208 = fma(_184, _184, _202);
    float _210 = fma(_186, _186, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    bool _216 = _212 > 0.0;
    float _218 = sqrt(_210);
    bool _220 = _214 > 0.0;
    float _222 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _224 = 0.0;
    float _226 = _222;
    bool _228 = _180;
    float _230 = _162;
    float _232 = _160;
    float _234 = _164;
    if (_216)
    {
        float _236 = rsqrt(_206);
        _224 = _236;
    }
    float _238 = _224;
    bool _240 = _218 > 0.0;
    float _242 = _218;
    if (!_180)
    {
        float _244 = _222 * _222;
        float _246 = _244 * 0.5;
        _242 = _246;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = _248;
    if (_220)
    {
        float _254 = rsqrt(_208);
        _250 = _254;
    }
    float _256 = _250;
    if (!_180)
    {
        float _258 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _252 = _258;
    }
    float _260 = _252;
    bool _262 = !_180;
    float _264 = _260;
    float _266 = _256;
    if (!_262)
    {
        float _268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _270 = log2(_268);
        float _272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _274 = _272 + 1.0;
        float _276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _278 = _222 * _270;
        float _280 = 1.0 / _274;
        float _282 = _276 * 0.693147182464599609375;
        float _284 = exp2(_278);
        float _286 = 1.0 / _282;
        float _288 = _284 + (-1.0);
        float _290 = -_288;
        float _292 = fma(_290, _286, _222);
        float _294 = _292 * _280;
        float _296 = _294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _264 = _296;
    }
    float _298 = _264;
    bool _300 = !_180;
    if (!_300)
    {
        float _302 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _304 = log2(_302);
        float _306 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _308 = _306 + 1.0;
        float _310 = 1.0 / _308;
        float _312 = _222 * _304;
        float _314 = exp2(_312);
        float _316 = -_314;
        float _318 = _316 + 1.0;
        float _320 = _318 * _310;
        _226 = _320;
    }
    float _322 = _226;
    float _324 = in.m_55.w;
    float _326 = 0.0;
    float _328 = 0.0;
    if (!_216)
    {
        _326 = 0.0;
        _328 = 0.0;
    }
    float _330 = _326;
    float _332 = _328;
    float _334 = 0.0;
    float _336 = _332;
    float _338 = _330;
    if (!_216)
    {
        _334 = 0.0;
    }
    float _340 = _334;
    float _342 = 1.0 / _128;
    float _344 = in.m_42.x;
    float _346 = in.m_42.y;
    float _348 = in.m_42.z;
    float _350 = _340;
    if (_216)
    {
        float _352 = _238 * _166;
        _350 = _352;
    }
    float _354 = _350;
    if (_216)
    {
        float _356 = _238 * _160;
        _336 = _356;
    }
    float _358 = _336;
    if (_216)
    {
        float _360 = _238 * _182;
        _338 = _360;
    }
    float _362 = _338;
    bool _364 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _366 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _368 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _370 = _210;
    if (_240)
    {
        float _372 = rsqrt(_210);
        _370 = _372;
    }
    float _374 = _370;
    float _376 = 0.0;
    if (!_220)
    {
        _376 = 0.0;
    }
    float _378 = _376;
    float _380 = fma(_322, _188, _366);
    float _382 = _298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _384 = _378;
    if (!_220)
    {
        _150 = 0.0;
    }
    float _386 = _150;
    float _388 = fma(_322, _190, _368);
    float _390 = 0.0;
    float _392 = _386;
    if (!_220)
    {
        _390 = 0.0;
    }
    float _394 = _390;
    float _396 = fma(_322, _192, _382);
    float _398 = _394;
    if (_220)
    {
        float _400 = _256 * _168;
        _384 = _400;
    }
    float _402 = _384;
    if (_220)
    {
        float _404 = _256 * _162;
        _392 = _404;
    }
    float _406 = _392;
    if (_220)
    {
        float _408 = _256 * _184;
        _398 = _408;
    }
    float _410 = _398;
    float _412 = 0.0;
    if (!_240)
    {
        _412 = 0.0;
    }
    float _414 = _412;
    float _416 = 0.0;
    float _418 = _414;
    if (!_240)
    {
        _416 = 0.0;
        _266 = 0.0;
    }
    float _420 = _416;
    float _422 = _266;
    float _424 = _132 * _342;
    float _426 = _420;
    float _428 = _422;
    if (_240)
    {
        float _430 = _374 * _170;
        _426 = _430;
    }
    float _432 = _426;
    if (_240)
    {
        float _434 = _374 * _164;
        _428 = _434;
    }
    float _436 = _428;
    if (_240)
    {
        float _438 = _374 * _186;
        _418 = _438;
    }
    float _440 = _418;
    float _442 = fma(_380, _324, _344);
    float _444 = fma(_388, _324, _346);
    float _446 = fma(_396, _324, _348);
    bool _448 = !_364;
    float _466;
    if (!_448)
    {
        float _450 = in.m_57.x;
        float _452 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _454 = _450 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _456 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _458 = _456 * _452;
        float _460 = floor(_458);
        float _462 = -_460;
        float _464 = _458 + _462;
        _466 = _464;
        _468 = true;
    }
    else
    {
        _466 = _424;
    }
    _468 = false;
    float _470 = _466;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _474 = _470 + _472;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _478 = _470 + _476;
    bool _480 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_470);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _470 + _504;
    float _508 = 1.0 / _494;
    bool _510 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _512 = 1.0 / _502;
    float _514 = 1.0 / _498;
    float _516 = _474 * _508;
    bool _518 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_470);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -_528;
    float _532 = _530 + 1.0;
    float _534 = _478 * _512;
    bool _536 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_470);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _548;
    float _552 = _490 * _532;
    bool _554 = _470 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_470);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _570 = -_546;
    float _572 = _570 + 1.0;
    float _574 = -_490;
    float _576 = _574 + 1.0;
    float _578 = _506 * _514;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _580;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _584;
    float _588 = _564 * _572;
    float _590 = fma(_550, _516, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _592 = fma(_582, _516, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _594 = fma(_586, _516, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _596 = _546 * _576;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _602 = _592 * _588;
    float _604 = _594 * _588;
    float _606 = -_564;
    float _608 = _606 + 1.0;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _612 = _610 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _614 = _590 * _588;
    float _616 = fma(_568, _578, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _618 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].x, _604);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _620;
    float _624 = fma(_612, _578, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _626 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _628 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[143].z, _614);
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _630;
    float _634 = fma(_600, _578, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _636;
    float _640 = fma(_616, _596, _618);
    float _642 = fma(_622, _534, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _644 = fma(_632, _534, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _646 = fma(_624, _596, _626);
    float _648 = fma(_638, _534, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _650 = fma(_634, _596, _628);
    float _652 = fma(_642, _552, _640);
    float _654 = fma(_644, _552, _646);
    float _656 = fma(_648, _552, _650);
    float _658 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].x, _652);
    float _660 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].y, _654);
    float _662 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[146].z, _656);
    bool _664 = !_510;
    float _682;
    if (!_664)
    {
        float _666 = in.m_57.x;
        float _668 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _670 = _666 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _672 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _674 = _672 * _668;
        float _676 = floor(_674);
        float _678 = -_676;
        float _680 = _674 + _678;
        _682 = _680;
        _684 = true;
    }
    else
    {
        _682 = _424;
    }
    _684 = false;
    float _686 = _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _690 = _686 + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _694 = _692 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _696 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _698 = isnan(_686);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _710 = _708 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _712 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _714 = isnan(_686);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _724;
    bool _728 = _686 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _730 = isnan(_686);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = 1.0 / _694;
    float _742 = -_706;
    float _744 = _742 + 1.0;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _748 = _722 * _744;
    float _750 = -_722;
    float _752 = _750 + 1.0;
    float _754 = 1.0 / _710;
    float _756 = _726 * _740;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _762 = fma(_756, _690, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _764 = _760 * _754;
    float _766 = _762 * _748;
    float _768 = -_738;
    float _770 = _768 + 1.0;
    float _772 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _774 = _686 + _772;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _778 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[115].x, _766);
    float _780 = _706 * _770;
    float _782 = fma(_764, _774, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _784 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _786 = fma(_782, _780, _778);
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _790 = in.m_55.x;
    float _792 = in.m_55.y;
    float _794 = in.m_55.z;
    float _796 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[117].x, _786);
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _800 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _804 = _798 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _784;
    out.m_59.y = _800;
    out.m_59.z = _804;
    out.m_59.w = _802;
    float _806 = _662 * _794;
    float _808 = _660 * _792;
    float _810 = _658 * _790;
    bool _812 = !_746;
    float _830;
    if (!_812)
    {
        float _814 = in.m_57.x;
        float _816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _818 = _814 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _820 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[11].z, _132);
        float _822 = _820 * _816;
        float _824 = floor(_822);
        float _826 = -_824;
        float _828 = _822 + _826;
        _830 = _828;
        _832 = true;
    }
    else
    {
        _830 = _424;
    }
    _832 = false;
    float _834 = _830;
    float _836 = in.m_61.z;
    float _838 = in.m_61.x;
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _842 = in.m_57.z;
    float _844 = in.m_57.x;
    float _846 = in.m_57.y;
    float _848 = _836 * 3.0;
    float _850 = _838 * 3.0;
    float _852 = _842 * 2.0;
    float _854 = abs(_848);
    float _856 = abs(_850);
    float _858 = precise::max(_854, _856);
    float _860 = _844 * 2.0;
    bool _862 = _858 >= 16.0;
    float _864 = floor(_852);
    float _866 = _846 * 2.0;
    float _868 = _846 + _842;
    float _870 = _846 + _844;
    int _872 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _874 = _872 != 0;
    float _876 = _844 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _878 = _868 + (-1.0);
    float _880 = floor(_860);
    float _882 = _870 + (-1.0);
    float _884 = -_840;
    float _886 = fma(_876, 2.0, _884);
    float _888 = fma(_878, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _890 = _848;
    float _892 = _850;
    if (_862)
    {
        float _894 = _836 * 0.1875;
        _890 = _894;
    }
    float _896 = _890;
    float _898 = _896;
    if (_862)
    {
        float _900 = _838 * 0.1875;
        _892 = _900;
    }
    float _902 = _892;
    float _904 = fma(_882, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _906 = floor(_866);
    float _908 = abs(_896);
    bool _910 = _908 != 0.0;
    bool _912 = isnan(_908);
    bool _914 = _910 || _912;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    float _920 = _876;
    float _922 = _902;
    if (!_874)
    {
        float _924 = in.m_57.z;
        _920 = _924;
    }
    float _926 = _920;
    float _928 = abs(_902);
    bool _930 = _928 == 0.0;
    float _932 = abs(_902);
    bool _934 = _932 == 0.0;
    bool _936 = !_918;
    bool _938 = _934 && _936;
    bool _940 = _864 > 0.0;
    bool _942 = _864 >= 0.0;
    bool _944 = isnan(_864);
    bool _946 = _942 || _944;
    bool _948 = isnan(0.0);
    bool _950 = _946 || _948;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _954 = _846 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _956 = fma(_954, -2.0, _952);
    if (_938)
    {
        bool _958 = as_type<int>(_902) >= 0;
        _228 = _958;
    }
    bool _960 = _228;
    int _962 = 0;
    int _964 = _960 ? (-1) : 0;
    if (_938)
    {
        int _966 = _960 ? 0 : 1078530011;
        _962 = _966;
    }
    int _968 = _962;
    int _970 = _968;
    if (_938)
    {
        int _972 = int(0x80000000) & as_type<int>(_896);
        int _974 = _968 | _972;
        _970 = _974;
    }
    int _976 = _970;
    bool _978 = !_918;
    bool _980 = _978 && _930;
    int _982 = _976;
    float _984 = as_type<float>(_976);
    float _986 = _926;
    if (!_980)
    {
        float _988 = abs(_896);
        bool _990 = _988 != as_type<float>(0x7f800000u /* inf */);
        bool _992 = isnan(_988);
        bool _994 = _990 || _992;
        bool _996 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _998 = _994 || _996;
        float _1000 = abs(_902);
        bool _1002 = _1000 == as_type<float>(0x7f800000u /* inf */);
        float _1004 = abs(_902);
        bool _1006 = _1004 == as_type<float>(0x7f800000u /* inf */);
        bool _1008 = !_998;
        bool _1010 = _1006 && _1008;
        if (_1010)
        {
            bool _1012 = as_type<int>(_902) >= 0;
            _964 = _1012 ? (-1) : 0;
        }
        int _1014 = _964;
        if (_1010)
        {
            _982 = 1075235812;
        }
        int _1016 = _982;
        int _1018 = _1016;
        if (_1010)
        {
            int _1020 = ~_1014;
            int _1022 = (_1020 != 0) ? _1016 : 1061752795;
            _1018 = _1022;
        }
        int _1024 = _1018;
        float _1026 = as_type<float>(_1024);
        if (_1010)
        {
            int _1028 = int(0x80000000) & as_type<int>(_896);
            int _1030 = _1024 | _1028;
            _1026 = as_type<float>(_1030);
        }
        float _1032 = _1026;
        bool _1034 = !_998;
        bool _1036 = _1034 && _1002;
        _984 = _1032;
        if (!_1036)
        {
            float _1038 = abs(_896);
            float _1040 = abs(_902);
            float _1042 = precise::max(_1038, _1040);
            float _1044 = abs(_896);
            float _1046 = abs(_902);
            float _1048 = precise::min(_1044, _1046);
            float _1050 = 1.0 / _1042;
            float _1052 = abs(_896);
            float _1054 = abs(_902);
            bool _1056 = _1052 > _1054;
            bool _1058 = as_type<int>(_902) >= 0;
            float _1060 = _1048 * _1050;
            float _1062 = _1060 * _1060;
            float _1064 = _1062 + 11.33538818359375;
            float _1066 = fma(_1062, _1064, 28.84246826171875);
            float _1068 = fma(_1062, _1066, 19.6966705322265625);
            float _1070 = fma(_1062, -0.82336294651031494140625, -5.674867153167724609375);
            float _1072 = abs(_896);
            float _1074 = abs(_902);
            float _1076 = _1072 + _1074;
            int _1078 = as_type<int>(_896) & int(0x80000000);
            float _1080 = fma(_1062, _1070, -6.565555095672607421875);
            float _1082 = 1.0 / _1068;
            bool _1084 = _1076 > as_type<float>(0x7f800000u /* inf */);
            bool _1086 = isnan(_1076);
            bool _1088 = _1084 || _1086;
            bool _1090 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1092 = _1088 || _1090;
            float _1094 = _1062 * _1080;
            float _1096 = _1060 * _1094;
            float _1098 = fma(_1096, _1082, _1060);
            float _1100 = _1098;
            _898 = as_type<float>(_1078);
            _984 = _1076;
            if (_1056)
            {
                float _1102 = -_1098;
                float _1104 = _1102 + 1.57079637050628662109375;
                _1100 = _1104;
            }
            float _1106 = _1100;
            int _1108 = as_type<int>(_1106);
            if (!_1058)
            {
                float _1110 = -_1106;
                float _1112 = _1110 + 3.1415927410125732421875;
                _1108 = as_type<int>(_1112);
            }
            int _1114 = _1108;
            if (!_1092)
            {
                int _1116 = _1078 | _1114;
                _984 = as_type<float>(_1116);
            }
        }
    }
    float _1118 = _898;
    float _1120 = _984;
    float _1122 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1124 = log2(_1122);
    float _1126 = in.m_63.y;
    int _1128 = _950 ? 0 : 1;
    float _1130 = _844 * 6.283185482025146484375;
    bool _1132 = _906 > 0.0;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1136 = _906 >= 0.0;
    bool _1138 = isnan(_906);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = -_132;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[76].x, _886);
    bool _1150 = _880 > 0.0;
    float _1152 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[76].y, _956);
    bool _1154 = _880 >= 0.0;
    bool _1156 = isnan(_880);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan(0.0);
    bool _1162 = _1158 || _1160;
    float _1164 = _806 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1166 = _1118;
    float _1168 = _1148;
    if (!_874)
    {
        _1166 = _926;
    }
    float _1170 = _1166;
    float _1172 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1174 = _1170;
    if (_874)
    {
        _986 = _846;
    }
    float _1176 = _986;
    float _1178 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (_874)
    {
        _1174 = _846;
    }
    float _1180 = _1174;
    int _1182 = ~_1128;
    int _1184 = _1182 + 1;
    int _1186 = _1184 + 1;
    float _1188 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1134);
    int _1190 = _1186;
    if (!_874)
    {
        _922 = _846;
    }
    float _1192 = _922;
    float _1194 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1196 = _1192;
    if (!_940)
    {
        int _1198 = ~_1128;
        int _1200 = _1198 + 1;
        _1190 = _1200;
    }
    int _1202 = _1190;
    float _1204 = fma(_1126, 12.0, _1130);
    if (_874)
    {
        _1196 = _844;
    }
    float _1206 = _1196;
    int _1208 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1210 = _1208 != 0;
    int _1212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1214 = _1212 != 0;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1218 = _1216 != 0;
    float _1220 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1222 = float(_1202);
    float _1224 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1178);
    float _1226 = _1124 * _132;
    bool _1228 = !_1210;
    int _1230 = _1228 ? 0 : 1;
    float _1232 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1234 = abs(_1230);
    float _1236 = -_1232;
    float _1238 = fma(_1220, 2.0, _1236);
    float _1240 = exp2(_1226);
    int _1242 = _1144 ? 0 : 1;
    float _1244 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _1246 = _1162 ? 0 : 1;
    float _1248 = float(_1234);
    float _1250 = fma(_1194, -2.0, _1244);
    int _1252 = ~_1242;
    int _1254 = _1252 + 1;
    int _1256 = _1254 + 1;
    int _1258 = _1256;
    bool _1260 = _1144;
    if (!_1132)
    {
        int _1262 = ~_1242;
        int _1264 = _1262 + 1;
        _1258 = _1264;
    }
    int _1266 = _1258;
    float _1268 = _1248 * _1222;
    int _1270 = ~_1246;
    int _1272 = _1270 + 1;
    int _1274 = _1272 + 1;
    float _1276 = -_1240;
    float _1278 = _1276 + 1.0;
    int _1280 = _1274;
    if (!_1150)
    {
        int _1282 = ~_1246;
        int _1284 = _1282 + 1;
        _1280 = _1284;
    }
    int _1286 = _1280;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1290 = in.m_65.x;
    float _1292 = in.m_65.y;
    float _1294 = in.m_65.z;
    float _1296 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1298 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1300 = isnan(0.0);
    bool _1302 = _1298 || _1300;
    bool _1304 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1306 = _1302 || _1304;
    float _1308 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1288);
    float _1310 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1296);
    bool _1312 = !_1214;
    int _1314 = _1312 ? 0 : 1;
    float _1316 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1308);
    float _1318 = _1306 ? _1278 : 0.0;
    float _1320 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1224);
    int _1322 = abs(_1314);
    float _1324 = -_132;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1238);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1330 = 1.0 + _1328;
    float _1332 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1188);
    float _1334 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1250);
    float _1336 = 1.0 / _1330;
    float _1338 = _1268 * (-2.0);
    float _1340 = float(_1322);
    float _1342 = _1204 * 0.15915493667125701904296875;
    bool _1344 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1346 = isnan(1.0);
    bool _1348 = _1344 || _1346;
    bool _1350 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1352 = _1348 || _1350;
    float _1354 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1310);
    float _1356 = fma(_1338, _1290, _1290);
    float _1358 = float(_1286);
    float _1360 = fma(_904, _1338, _904);
    bool _1362 = !_1218;
    int _1364 = _1362 ? 0 : 1;
    float _1366 = _844 + (-0.5);
    float _1368 = _844 + _842;
    float _1370 = _1340 * _1358;
    int _1372 = abs(_1364);
    float _1374 = fma(_1366, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1356);
    float _1376 = _1316;
    float _1378 = _1320;
    if (_1352)
    {
        float _1380 = _1318 * _1336;
        _152 = _1380;
    }
    float _1382 = _152;
    float _1384 = _1370 * (-2.0);
    float _1386 = in.m_61.y;
    float _1388 = _1368 + (-1.0);
    float _1390 = fma(_1360, _1382, _1374);
    float _1392 = fma(_888, _1384, _888);
    float _1394 = fma(_1384, _1292, _1292);
    float _1396 = _846 + (-0.5);
    float _1398 = float(_1266);
    float _1400 = _1342 * 6.283185482025146484375;
    float _1402 = sin(_1400);
    float _1404 = float(_1372);
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1394);
    float _1408 = _842 + (-0.5);
    float _1410 = _1390 * 0.15915493667125701904296875;
    float _1412 = _1404 * _1398;
    float _1414 = fma(_1392, _1382, _1406);
    float _1416 = _1410 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    float _1420 = _1412 * (-2.0);
    float _1422 = _1414 * 0.15915493667125701904296875;
    float _1424 = fma(_1388, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1426 = fma(_1420, _1294, _1294);
    float _1428 = fma(_1120, 0.1500000059604644775390625, _1386);
    float _1430 = fma(_1424, _1420, _1424);
    float _1432 = fma(_1408, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1426);
    float _1434 = _1422 * 6.283185482025146484375;
    float _1436 = sin(_1434);
    float _1438 = _1402 * 0.4000000059604644775390625;
    float _1440 = fma(_1430, _1382, _1432);
    float _1442 = _444 * _168;
    float _1444 = _424 * _424;
    float _1446 = _444 * _184;
    float _1448 = _1440 * 0.15915493667125701904296875;
    float _1450 = _1422 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = fma(_442, _166, _1442);
    float _1456 = fma(_1438, _1444, _1428);
    float _1458 = fma(_442, _182, _1446);
    float _1460 = fma(_446, _170, _1454);
    float _1462 = _444 * _162;
    bool _1464 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1466 = isnan(0.5);
    bool _1468 = _1464 || _1466;
    bool _1470 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1472 = _1468 || _1470;
    float _1474 = _1410 * 6.283185482025146484375;
    float _1476 = sin(_1474);
    float _1478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _836);
    float _1480 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _838);
    float _1482 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1456);
    float _1484 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1486 = _1478 * _1164;
    float _1488 = _1418 * _1436;
    float _1490 = in.m_53.w;
    float _1492 = _1448 * 6.283185482025146484375;
    float _1494 = cos(_1492);
    float _1496 = _1418 * _1452;
    float _1498 = _1482 * _1172;
    float _1500 = _1480 * _1484;
    float _1502 = fma(_446, _186, _1458);
    float _1504 = in.m_51.w;
    float _1506 = fma(_442, _160, _1462);
    float _1508 = _1448 * 6.283185482025146484375;
    float _1510 = sin(_1508);
    float _1512 = _1476 * _1436;
    float _1514 = _1476 * _1452;
    float _1516 = fma(_446, _164, _1506);
    float _1518 = _1418 * _1494;
    float _1520 = _1476 * _1494;
    float _1522 = _1452 * _1494;
    float _1524 = _1436 * _1494;
    float _1526 = _1518 * _1498;
    float _1528 = _1502 + _1490;
    float _1530 = fma(_1510, _1496, _1512);
    float _1532 = -_1498;
    float _1534 = _1510 * _1532;
    float _1536 = -_1514;
    float _1538 = fma(_1510, _1488, _1536);
    float _1540 = -_1488;
    float _1542 = fma(_1510, _1514, _1540);
    float _1544 = fma(_1530, _1500, _1526);
    float _1546 = _1520 * _1498;
    float _1548 = fma(_1522, _1500, _1534);
    float _1550 = fma(_1510, _1512, _1496);
    float _1552 = fma(_1538, _1486, _1544);
    float _1554 = fma(_1542, _1500, _1546);
    float _1556 = fma(_1524, _1486, _1548);
    float _1558 = _1460 + _1504;
    float _1560 = _1552 * _410;
    float _1562 = fma(_1550, _1486, _1554);
    float _1564 = _1552 * _402;
    float _1566 = _1552 * _406;
    float _1568 = fma(_1556, _362, _1560);
    float _1570 = fma(_1556, _354, _1564);
    float _1572 = fma(_1556, _358, _1566);
    float _1574 = fma(_1562, _440, _1568);
    float _1576 = fma(_1562, _432, _1570);
    float _1578 = fma(_1562, _436, _1572);
    float _1580 = _1528 + _1574;
    float _1582 = in.m_49.w;
    float _1584 = _1558 + _1576;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1588 = _1580 + _1586;
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1592 = _1584 + _1590;
    float _1594 = _1588 * _1588;
    float _1596 = fma(_1592, _1592, _1594);
    float _1598 = sqrt(_1596);
    float _1600 = _1516 + _1582;
    float _1602 = _1600 + _1578;
    bool _1604 = _1598 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1606 = _1578;
    float _1608 = _1592;
    float _1610 = _1588;
    float _1612 = _1596;
    if (!_1604)
    {
        _230 = _1584;
    }
    float _1614 = _230;
    float _1616 = _1614;
    if (!_1604)
    {
        _1606 = _1580;
    }
    float _1618 = _1606;
    float _1620 = _1618;
    if (!_1604)
    {
        _232 = _1602;
    }
    float _1622 = _232;
    bool _1624 = !_1604;
    float _1626 = _1622;
    if (!_1624)
    {
        float _1628 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1632 = _1598 + _1630;
        float _1634 = rsqrt(_1596);
        float _1636 = _1632 * _1628;
        float _1638 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1640 = _1636 * 0.15915493667125701904296875;
        float _1642 = _1640 * 6.283185482025146484375;
        float _1644 = cos(_1642);
        float _1646 = _1640 * 6.283185482025146484375;
        float _1648 = sin(_1646);
        float _1650 = _1644 + (-1.0);
        float _1652 = fma(_1648, _1638, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1654 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = _1634 * _1652;
        float _1658 = fma(_1602, _1644, _1654);
        float _1660 = fma(_1592, _1656, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1662 = fma(_1588, _1656, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1616 = _1660;
        _1626 = _1658;
        _1620 = _1662;
        _234 = _1650;
    }
    float _1664 = _1616;
    float _1666 = _1626;
    float _1668 = _1620;
    float _1670 = _234;
    float _1672 = _1668;
    float _1674 = _1670;
    float _1676 = _1664;
    if (_1472)
    {
        _1608 = _1664;
    }
    float _1678 = _1608;
    float _1680 = _1678;
    if (_1472)
    {
        _1610 = _1666;
    }
    float _1682 = _1610;
    float _1684 = _1682;
    if (!_1472)
    {
        float _1686 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1688 = _1600 + _1686;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1692 = _1558 + _1690;
        float _1694 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1696 = -_1558;
        float _1698 = _1696 + _1664;
        float _1700 = _1688 * _1688;
        float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1704 = _1528 + _1702;
        float _1706 = -_1600;
        float _1708 = _1706 + _1666;
        float _1710 = -_1528;
        float _1712 = _1710 + _1668;
        float _1714 = fma(_1692, _1692, _1700);
        float _1716 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1718 = fma(_1704, _1704, _1714);
        float _1720 = sqrt(_1718);
        float _1722 = _1694 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1724 = precise::min(_1720, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1726 = _1724 * _1716;
        float _1728 = _1722 * _1726;
        float _1730 = fma(_1698, _1728, _1558);
        float _1732 = fma(_1708, _1728, _1600);
        float _1734 = fma(_1712, _1728, _1528);
        _1684 = _1732;
        _1680 = _1730;
        _1672 = _1734;
        _1674 = _1720;
        _1676 = _1698;
    }
    float _1736 = _1684;
    float _1738 = _1680;
    float _1740 = _1672;
    float _1742 = _1674;
    float _1744 = _1676;
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1748 = _1736 + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1752 = _1738 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1740 + _1754;
    float _1758 = _1748 * _1748;
    float _1760 = fma(_1752, _1752, _1758);
    float _1762 = fma(_1756, _1756, _1760);
    float _1764 = rsqrt(_1762);
    float _1766 = sqrt(_1762);
    float _1768 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1770 = _1752 * _1768;
    float _1772 = _1756 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 * _1772;
    float _1778 = _1774 + _1776;
    float _1780 = sqrt(_1778);
    bool _1782 = _1780 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1786 = _1780 + _1784;
    float _1788 = _1764;
    float _1790 = _1786;
    float _1792 = _1742;
    float _1794 = _1748;
    if (_1782)
    {
        float _1796 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1788 = _1796;
    }
    float _1798 = _1788;
    float _1800 = _1798;
    if (_1782)
    {
        float _1802 = _1786 * _1798;
        _1790 = _1802;
    }
    float _1804 = _1790;
    if (_1782)
    {
        float _1806 = rsqrt(_1778);
        _1800 = _1806;
    }
    float _1808 = _1800;
    float _1810 = _1808;
    if (_1782)
    {
        float _1812 = _1804 * 0.15915493667125701904296875;
        _1792 = _1812;
    }
    float _1814 = _1792;
    float _1816 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1818 = _1756;
    float _1820 = _1814;
    if (_1782)
    {
        float _1822 = _1814 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        _1818 = _1824;
    }
    float _1826 = _1818;
    float _1828 = precise::max(0.0, _1816);
    float _1830 = _1744;
    if (_1782)
    {
        float _1832 = _1814 * 6.283185482025146484375;
        float _1834 = cos(_1832);
        _1830 = _1834;
    }
    float _1836 = _1830;
    float _1838 = -_1768;
    float _1840 = -_1828;
    float _1842 = fma(_1748, _1838, _1840);
    float _1844 = _1842;
    if (_1782)
    {
        float _1846 = _1842 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1794 = _1846;
    }
    float _1848 = _1794;
    float _1850 = _1826;
    float _1852 = _1848;
    if (_1782)
    {
        float _1854 = fma(_1826, _1848, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1850 = _1854;
    }
    float _1856 = _1850;
    float _1858 = _1856;
    if (_1782)
    {
        float _1860 = _1808 * _1856;
        _1612 = _1860;
    }
    float _1862 = _1612;
    if (!_1782)
    {
        _1810 = _1770;
    }
    float _1864 = _1810;
    float _1866 = _1864;
    float _1868 = _1836;
    if (_1782)
    {
        float _1870 = _1836 + (-1.0);
        _1852 = _1870;
    }
    float _1872 = _1852;
    float _1874 = _1872;
    if (_1782)
    {
        float _1876 = _1770 * _1862;
        _1866 = _1876;
    }
    float _1878 = _1866;
    if (!_1782)
    {
        _1858 = _1772;
    }
    float _1880 = _1858;
    float _1882 = _1880;
    if (_1782)
    {
        float _1884 = _1772 * _1862;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (_1782)
    {
        float _1888 = _1872 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1888;
    }
    float _1890 = _1820;
    if (!_1782)
    {
        _1874 = _1774;
    }
    float _1892 = _1874;
    float _1894 = _1892;
    if (_1782)
    {
        float _1896 = _1878 * _1878;
        _1894 = _1896;
    }
    float _1898 = _1894;
    float _1900 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1782)
    {
        float _1902 = fma(_1842, _1836, _1890);
        _1844 = _1902;
    }
    float _1904 = _1844;
    if (!_1782)
    {
        _1868 = _1776;
    }
    float _1906 = _1868;
    float _1908 = _1906;
    if (_1782)
    {
        float _1910 = _1886 * _1886;
        _1908 = _1910;
    }
    float _1912 = _1908;
    float _1914 = fma(_1904, _1904, _1898);
    float _1916 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1918 = _1914 + _1912;
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1766, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1900);
    float _1928 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1930 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1932 = -_1924;
    float _1934 = _1932 + 1.0;
    float _1936 = rsqrt(_1918);
    float _1938 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1926);
    float _1940 = _1736 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1942 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1928);
    float _1944 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1930);
    float _1946 = _1938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1948 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1940);
    float _1950 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1942);
    float _1952 = abs(_1934);
    float _1954 = log2(_1952);
    float _1956 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1944);
    float _1958 = fma(_1740, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1948);
    float _1960 = _1950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1962 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1964 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1966 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1968 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1970 = _1936 * _1878;
    float _1972 = _1936 * _1904;
    float _1974 = _1936 * _1886;
    float _1976 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1968);
    float _1978 = _1970 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1980 = -_1962;
    float _1982 = fma(_1980, _1916, 1.0);
    float _1984 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1986 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1976);
    float _1988 = -_1978;
    float _1990 = fma(_1972, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1988);
    float _1992 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1994 = log2(_1982);
    float _1996 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1986);
    float _1998 = -_1974;
    float _2000 = fma(_1998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1990);
    float _2002 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2004 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1984);
    float _2006 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2002);
    float _2008 = exp2(_1992);
    float _2010 = fma(_2000, -0.5, 0.5);
    float _2012 = fma(_2000, 0.5, 0.5);
    float _2014 = _1972 + 1.0;
    float _2016 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2006);
    float _2018 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2004);
    float _2020 = fma(_2012, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2022 = 1.0 / _1996;
    float _2024 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2016);
    float _2026 = _1994 * 0.693147182464599609375;
    float _2028 = fma(_2012, _2020, -0.212114393711090087890625);
    float _2030 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2032 = fma(_2012, _2028, 1.570728778839111328125);
    float _2034 = sqrt(_2010);
    float _2036 = -_1972;
    float _2038 = fma(_2008, _2014, _2036);
    float _2040 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2018);
    float _2042 = _2024 * _2022;
    float _2044 = _2040 * _2022;
    float _2046 = fma(_2038, 0.5, 0.5);
    float _2048 = fma(_2042, 0.5, 0.5);
    float _2050 = fma(_2044, -0.5, 0.5);
    float _2052 = _2034 * 0.636619746685028076171875;
    float3 _5633 = float3(_2048, _2050, _2030);
    float _2054 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5633, float3(0.0), isnan(_5633)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5633, float3(0.0), isnan(_5633)), level(0.0)).x;
    float _2056 = -_2032;
    float _2058 = fma(_2052, _2056, 1.0);
    float3 _5649 = float3(_2048, _2050, _2030);
    float4 _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5649, float3(0.0), isnan(_5649)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5649, float3(0.0), isnan(_5649)), level(0.0)).xyzw;
    float _2063 = _2061.x;
    float _2065 = _2061.y;
    float _2067 = _2061.z;
    float _2069 = _2061.w;
    float2 _5666 = float2(_2058, _2046);
    float3 _2073 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5666, float2(0.0), isnan(_5666)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5666, float2(0.0), isnan(_5666)), level(0.0)).xyz;
    float _2075 = _2073.x;
    float _2077 = _2073.y;
    float _2079 = _2073.z;
    float _2081 = in.m_57.w;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2085 = _2083 != 0;
    out.m_45.x = 1.0;
    int _2087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2089 = _2087 != 0;
    float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2097 = _2095 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _2099 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2101 = _2099 != 0;
    float _2103 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _2105 = _834 + _2103;
    float _2107 = 1.0 / _2093;
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2111 = _2109 != 0;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2115 = _834 + _2113;
    bool _2117 = _846 > 0.5;
    out.m_67.x = _1738;
    out.m_67.y = _1736;
    out.m_67.z = _1740;
    float _2119 = 0.0;
    bool _2121 = _2117;
    if (_2085)
    {
        float _2123 = in.m_57.x;
        _2119 = _2123;
    }
    float _2125 = _2119;
    float _2127 = 1.0 / _2097;
    float _2129 = -_1126;
    float _2131 = _2129 + 1.0;
    float _2133 = _2044;
    if (_2089)
    {
        float _2135 = in.m_57.z;
        _2133 = _2135;
    }
    float _2137 = _2133;
    float _2139 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2139;
    bool _2143 = _2081 > 0.5;
    float _2145 = _2115 * _2107;
    int _2147 = _2117 ? as_type<int>(_2131) : as_type<int>(_1126);
    float _2149 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2151 = _2143 ? as_type<int>(_2131) : as_type<int>(_1126);
    float _2153 = in.m_63.x;
    float _2155 = _2101 ? as_type<float>(_2147) : _1126;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2157;
    bool _2161 = _1456 != 0.0;
    bool _2163 = isnan(_1456);
    bool _2165 = _2161 || _2163;
    bool _2167 = isnan(0.0);
    bool _2169 = _2165 || _2167;
    float _2171 = _2105 * _2127;
    float _2173 = _2111 ? as_type<float>(_2151) : _1126;
    float _2175 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2177 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _2179 = isnan(_834);
    bool _2181 = _2177 || _2179;
    bool _2183 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _2185 = _2181 || _2183;
    float _2187 = float(_2185);
    bool _2189 = _838 == 0.0;
    bool _2191 = !_2169;
    bool _2193 = _2189 && _2191;
    if (_2085)
    {
        bool _2195 = _2125 > 0.5;
        _1260 = _2195;
    }
    bool _2197 = _1260;
    float _2199 = _2149 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_2089)
    {
        bool _2201 = _2137 > 0.5;
        _2121 = _2201;
    }
    bool _2203 = _2121;
    float _2205 = fma(_2159, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _2207 = fma(_2141, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _2215 = _2213 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _2217 = fma(_2199, _2155, -0.5);
    float _2219 = -_2187;
    float _2221 = _2219 + 1.0;
    float _2223 = fma(_2211, _2145, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _2229 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _2231 = _2229 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _2233 = _2175 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2235 = -_1152;
    float _2237 = fma(_1354, _2217, _2235);
    float _2239 = fma(_2227, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2241 = fma(_2231, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2243 = fma(_2215, _2171, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _2245 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2247 = isnan(_834);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2253 = _2249 || _2251;
    float _2255 = float(_2253);
    float _2257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _2259 = _834 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2261 = isnan(_834);
    bool _2263 = _2259 || _2261;
    bool _2265 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2267 = _2263 || _2265;
    float _2269 = float(_2267);
    float _2271 = _2231;
    float _2273 = _2227;
    int _2275 = as_type<int>(_2217);
    int _2277 = as_type<int>(_2233);
    if (!_2085)
    {
        _2271 = _2153;
    }
    float _2279 = _2271;
    bool _2281 = _836 == 0.0;
    bool _2283 = _2281 && _2193;
    float _2285 = -_2269;
    float _2287 = _2285 + 1.0;
    float _2289 = _2279;
    if (!_2085)
    {
        _2273 = _2279;
    }
    float _2291 = _2273;
    float _2293 = _2269 * _2221;
    float _2295 = _2291;
    if (_2085)
    {
        _2289 = _2153;
    }
    float _2297 = _2289;
    float _2299 = _2255 * _2287;
    float _2301 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2303 = fma(_2233, _2173, -0.5);
    float _2305 = _2205 * _2299;
    float _2307 = _2207 * _2299;
    float _2309 = _2223 * _2299;
    float _2311 = -_2255;
    float _2313 = _2311 + 1.0;
    float _2315 = _2297;
    if (_2085)
    {
        float _2317 = -_2297;
        float _2319 = _2317 + 1.0;
        _2275 = as_type<int>(_2319);
    }
    int _2321 = _2275;
    float _2323 = in.m_69.x;
    float _2325 = in.m_69.y;
    float _2327 = in.m_69.z;
    if (_2089)
    {
        float _2329 = -_2297;
        float _2331 = _2329 + 1.0;
        _2277 = as_type<int>(_2331);
    }
    int _2333 = _2277;
    float _2335 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2305);
    float _2337 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2307);
    if (_2085)
    {
        float _2339 = _2197 ? as_type<float>(_2321) : _2297;
        _2295 = _2339;
    }
    float _2341 = _2295;
    float _2343 = fma(_2313, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2309);
    float _2345 = fma(_2239, _2293, _2335);
    float _2347 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2349 = fma(_2241, _2293, _2337);
    if (_2089)
    {
        float _2351 = _2203 ? as_type<float>(_2333) : _2297;
        _2315 = _2351;
    }
    float _2353 = _2315;
    float _2355 = in.m_71.x;
    float _2357 = in.m_71.y;
    float _2359 = in.m_71.z;
    float _2361 = in.m_71.w;
    float _2363 = _2301 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2365 = -_1334;
    float _2367 = fma(_1332, _2303, _2365);
    float _2369 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2345);
    float _2371 = fma(_2347, _2353, -0.5);
    float _2373 = fma(_2363, _2341, -0.5);
    float _2375 = fma(_2243, _2293, _2343);
    float _2377 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2349);
    float _2379 = fma(_1320, _2371, _1326);
    float _2381 = fma(_1316, _2373, _1148);
    float _2383 = fma(_2187, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2375);
    float _2385 = _2237 + 0.5;
    float _2387 = _2379 + 0.5;
    float _2389 = _2367 + 0.5;
    if (_2283)
    {
        _1168 = _2325;
    }
    float _2391 = _1168;
    float _2393 = _2391;
    if (!_2283)
    {
        float _2395 = fma(_1456, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2325);
        _2393 = _2395;
    }
    float _2397 = _2393;
    if (_2283)
    {
        _1376 = _2327;
    }
    float _2399 = _1376;
    float _2401 = _2399;
    if (!_2283)
    {
        float _2403 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2327);
        _2401 = _2403;
    }
    float _2405 = _2401;
    float _2407 = _2381 + 0.5;
    if (_2283)
    {
        _1378 = _2323;
    }
    float _2409 = _1378;
    float _2411 = _2409;
    if (!_2283)
    {
        float _2413 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2323);
        _2411 = _2413;
    }
    float _2415 = _2411;
    float _2417 = _2359 * _2323;
    float _2419 = _2357 * _2327;
    float _2421 = _2355 * _2325;
    out.m_73.x = _2407;
    out.m_73.y = _2385;
    out.m_73.z = _2387;
    out.m_73.w = _2389;
    float _2423 = -_2417;
    float _2425 = fma(_2355, _2327, _2423);
    float _2427 = -_2419;
    float _2429 = fma(_2359, _2325, _2427);
    float _2431 = -_2421;
    float _2433 = fma(_2357, _2323, _2431);
    float _2435 = -_2357;
    float _2437 = _1510 * _2435;
    float _2439 = _2425 * _2361;
    float _2441 = _2429 * _2361;
    float _2443 = _2433 * _2361;
    float _2445 = _1518 * _2357;
    float _2447 = _1520 * _2357;
    float _2449 = -_2397;
    float _2451 = _1510 * _2449;
    float _2453 = fma(_1522, _2355, _2437);
    float _2455 = fma(_1530, _2355, _2445);
    float _2457 = fma(_1542, _2355, _2447);
    float _2459 = _1518 * _2397;
    float _2461 = -_2439;
    float _2463 = _1510 * _2461;
    float _2465 = _1520 * _2397;
    float _2467 = _1518 * _2439;
    float _2469 = _1520 * _2439;
    float _2471 = fma(_1530, _2415, _2459);
    float _2473 = fma(_1542, _2415, _2465);
    float _2475 = fma(_1522, _2415, _2451);
    float _2477 = fma(_1542, _2441, _2469);
    float _2479 = fma(_1538, _2405, _2471);
    float _2481 = fma(_1524, _2359, _2453);
    float _2483 = fma(_1524, _2405, _2475);
    float _2485 = fma(_1538, _2359, _2455);
    float _2487 = _2479 * _402;
    float _2489 = _2479 * _406;
    float _2491 = fma(_1522, _2441, _2463);
    float _2493 = fma(_1550, _2359, _2457);
    float _2495 = fma(_1530, _2441, _2467);
    float _2497 = _2479 * _410;
    float _2499 = fma(_1550, _2405, _2473);
    float _2501 = fma(_2483, _354, _2487);
    float _2503 = fma(_2483, _358, _2489);
    float _2505 = fma(_1524, _2443, _2491);
    float _2507 = _2485 * _402;
    float _2509 = _2485 * _406;
    float _2511 = fma(_2483, _362, _2497);
    float _2513 = _2485 * _410;
    float _2515 = fma(_2499, _432, _2501);
    float _2517 = fma(_2499, _436, _2503);
    float _2519 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2521 = fma(_2481, _358, _2509);
    float _2523 = fma(_2481, _362, _2513);
    float _2525 = _1960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2527 = exp2(_2519);
    float _2529 = fma(_2481, _354, _2507);
    float _2531 = fma(_1538, _2443, _2495);
    float _2533 = fma(_1966, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2525);
    float _2535 = fma(_2493, _436, _2521);
    float _2537 = fma(_2493, _432, _2529);
    float _2539 = fma(_2493, _440, _2523);
    float _2541 = fma(_1946, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2533);
    float _2543 = _2531 * _402;
    float _2545 = _2531 * _406;
    float _2547 = fma(_2499, _440, _2511);
    float _2549 = fma(_1964, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2541);
    float _2551 = _2531 * _410;
    out.m_75.x = _2537;
    out.m_75.y = _2535;
    out.m_75.z = _2539;
    float _2553 = fma(_1550, _2443, _2477);
    float _2555 = _2549 + _1996;
    float _2557 = -_2527;
    float _2559 = _2557 + 1.0;
    float _2561 = fma(_2505, _354, _2543);
    float _2563 = fma(_2505, _358, _2545);
    float _2565 = _2555 * 0.5;
    float _2567 = _2559 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2569 = fma(_2505, _362, _2551);
    out.m_77.x = _2515;
    out.m_77.y = _2517;
    out.m_77.z = _2547;
    float _2571 = _2369 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2573 = _2377 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2575 = _2383 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2577 = fma(_2553, _432, _2561);
    float _2579 = fma(_2553, _436, _2563);
    float _2581 = fma(_2553, _440, _2569);
    float _2583 = _2571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2585 = _2573 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2587 = _2575 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2589 = -_2567;
    float _2591 = _2589 + 1.0;
    float _2593 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.x = _2583;
    out.m_79.y = _2585;
    out.m_79.z = _2587;
    out.m_81.x = _2577;
    out.m_81.y = _2579;
    out.m_81.z = _2581;
    out.gl_Position.x = _2024;
    out.gl_Position.y = _2040;
    out.gl_Position.z = _2549;
    out.gl_Position.w = _1996;
    out.m_83.z = _2565;
    out.m_83.w = _1996;
    out.m_85.w = _2593;
    float _2595 = _2567 * _2054;
    float _2597 = _2069 * _2595;
    float _2599 = _2069 * _2591;
    float _2601 = _2079 * _2595;
    float _2603 = fma(_2075, _2597, _2063);
    float _2605 = fma(_2077, _2597, _2065);
    float _2607 = fma(_2069, _2601, _2067);
    out.m_87.x = _2603;
    out.m_87.y = _2605;
    out.m_87.z = _2607;
    out.m_87.w = _2599;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

