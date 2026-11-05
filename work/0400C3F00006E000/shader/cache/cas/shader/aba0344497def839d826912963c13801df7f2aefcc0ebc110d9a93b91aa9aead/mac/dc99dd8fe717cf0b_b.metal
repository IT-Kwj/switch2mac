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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_75 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_87 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_81 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_83 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3810 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4095 = as_type<float>(_136);
        out.gl_Position.z = _4095;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_53.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4165 = as_type<float>(_174);
        out.gl_Position.z = _4165;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _212 > 0.0;
    bool _220 = _214 > 0.0;
    float _222 = 0.0;
    float _224 = _214;
    int _226 = as_type<int>(_188);
    if (_218)
    {
        float _228 = rsqrt(_206);
        _222 = _228;
    }
    float _230 = _222;
    float _232 = 0.0;
    float _234 = 0.0;
    if (!_218)
    {
        _232 = 0.0;
        _234 = 0.0;
    }
    float _236 = _232;
    float _238 = _234;
    bool _240 = _216 > 0.0;
    float _242 = 0.0;
    float _244 = _238;
    float _246 = _236;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = _248;
    if (!_220)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _256 = _250;
    float _258 = _252;
    float _260 = _212;
    float _262 = _258;
    float _264 = _256;
    if (_220)
    {
        float _266 = rsqrt(_208);
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (!_220)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = _272;
    if (!_240)
    {
        _274 = 0.0;
        _276 = 0.0;
    }
    float _280 = _274;
    float _282 = _276;
    float _284 = _216;
    float _286 = _282;
    float _288 = _280;
    if (_240)
    {
        float _290 = rsqrt(_210);
        _284 = _290;
    }
    float _292 = _284;
    if (_218)
    {
        float _294 = _230 * _176;
        _244 = _294;
    }
    float _296 = _244;
    if (_218)
    {
        float _298 = _230 * _182;
        _254 = _298;
    }
    float _300 = _254;
    if (_218)
    {
        float _302 = _230 * _188;
        _246 = _302;
    }
    float _304 = _246;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _224 = 0.0;
    }
    float _308 = _224;
    float _310 = _308;
    if (_220)
    {
        float _312 = _268 * _178;
        _262 = _312;
    }
    float _314 = _262;
    if (_220)
    {
        float _316 = _268 * _184;
        _264 = _316;
    }
    float _318 = _264;
    if (_220)
    {
        float _320 = _268 * _190;
        _278 = _320;
    }
    float _322 = _278;
    if (_240)
    {
        float _324 = _292 * _180;
        _286 = _324;
    }
    float _326 = _286;
    if (_240)
    {
        float _328 = _292 * _186;
        _288 = _328;
    }
    float _330 = _288;
    if (_240)
    {
        float _332 = _292 * _192;
        _310 = _332;
    }
    float _334 = _310;
    bool _336 = !_306;
    float _354;
    if (!_336)
    {
        float _338 = in.m_61.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_120);
        float _360 = 1.0 / _358;
        float _362 = _154 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _374 = int(_372);
    float _376 = in.m_61.x;
    float _378 = in.m_61.y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _382 = _380 != 0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _386 = _364 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _388;
    float _392 = in.m_63.y;
    float _394 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _396 = int(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _364 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = _364 + _412;
    float _416 = float(_374);
    float _418 = 1.0 / _390;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _424 = _364 + _422;
    float _426 = in.m_59.w;
    float _428 = _190 * _368;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _434 = 1.0 / _404;
    float _436 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _438 = fma(_188, _366, _428);
    if (_382)
    {
        _226 = 0;
    }
    int _440 = _226;
    float _442 = _184 * _368;
    float _444 = fma(_436, -2.0, _406);
    int _446 = _440;
    if (!_382)
    {
        _446 = 1;
    }
    int _448 = _446;
    float _450 = in.m_61.z;
    float _452 = 1.0 / _400;
    float _454 = fma(_182, _366, _442);
    bool _456 = _448 != 1;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _460 = _364 + _458;
    float _462 = fma(_192, _370, _438);
    float _464 = fma(_186, _370, _454);
    float _466 = _368 + _392;
    float _468 = 1.0 / _432;
    float _470 = _460 * _434;
    float _472 = _376 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _474 = float(_396);
    float _476 = _424 * _418;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _478;
    float _482 = _460;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_456)
    {
        _482 = _378;
    }
    float _486 = _482;
    float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _490 = log2(_488);
    float _492 = _376 * 2.0;
    float _494 = _486;
    if (_456)
    {
        _494 = _376;
    }
    float _496 = _494;
    float _498 = -_420;
    float _500 = fma(_472, 2.0, _498);
    float _502 = _414 * _452;
    float _504 = -_154;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[76].x, _500);
    float _508 = floor(_492);
    float _510 = _386 * _468;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _514 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _444);
    float _516 = in.m_57.w;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _520 = 1.0 + _518;
    float _522 = 1.0 / _480;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _526 = _524;
    float _528 = _496;
    if (!_456)
    {
        _484 = _378;
    }
    float _530 = _484;
    float _532 = _490 * _154;
    float _534 = _530;
    if (_456)
    {
        _534 = _376;
    }
    float _536 = _534;
    float _538 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[83].z, _524);
    if (!_456)
    {
        _526 = _450;
    }
    float _540 = _526;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _542;
    bool _546 = _508 > 0.0;
    float _548 = _536 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _550 = 1.0 / _416;
    bool _552 = _508 >= 0.0;
    bool _554 = isnan(_508);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _538);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _566 = _540;
    if (_456)
    {
        _566 = _378;
    }
    float _568 = _566;
    float _570 = _410 * _522;
    if (!_456)
    {
        _528 = _450;
    }
    float _572 = _528;
    float _574 = exp2(_532);
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _578 = _572;
    if (_456)
    {
        _578 = _378;
    }
    float _580 = _578;
    float _582 = _568 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _584 = -_564;
    float _586 = fma(_548, 2.0, _584);
    float _588 = _450 * 2.0;
    float _590 = fma(_582, -2.0, _576);
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _594 = int(_592);
    float _596 = _550 * _154;
    bool _598 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _600 = isnan(1.0);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _606 = _602 || _604;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _618 = _614 || _616;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _622 = -_154;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _586);
    float _626 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _628 = int(_626);
    float _630 = -_574;
    float _632 = _630 + 1.0;
    float _634 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _608);
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _646 = _644 != 0;
    float _648 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _590);
    float _650 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _634);
    float _652 = _618 ? _632 : 0.0;
    float _654 = 1.0 / _474;
    float _656 = float(_594);
    float _658 = _462 + _426;
    bool _660 = !_642;
    int _662 = _660 ? 0 : 1;
    float _664 = _464 + _516;
    bool _666 = !_638;
    int _668 = _666 ? 0 : 1;
    float _670 = _656 * _154;
    bool _672 = !_646;
    int _674 = _672 ? 0 : 1;
    float _676 = floor(_588);
    float _678 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[83].w, _512);
    float _680 = _378 * 2.0;
    float _682 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _684 = float(_628);
    float _686 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _678);
    float _688 = _376 + _450;
    float _690 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _682);
    float _692 = 1.0 / _520;
    int _694 = _560 ? 0 : 1;
    float _696 = _654 * _154;
    float _698 = _688 + (-1.0);
    int _700 = ~_694;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    int _706 = _704;
    if (!_546)
    {
        int _708 = ~_694;
        int _710 = _708 + 1;
        _706 = _710;
    }
    int _712 = _706;
    float _714 = floor(_680);
    bool _716 = _676 >= 0.0;
    bool _718 = isnan(_676);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = _684 * _154;
    float _728 = _376 + _378;
    bool _730 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _732 = isnan(_364);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _748 = _746 != 0;
    float _750 = _728 + (-1.0);
    if (_606)
    {
        float _752 = _652 * _692;
        _156 = _752;
    }
    float _754 = _156;
    float _756 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _758 = _724 ? 0 : 1;
    float _760 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _762 = !_748;
    int _764 = _762 ? 0 : 1;
    float _766 = _378 + _450;
    bool _768 = !_744;
    int _770 = _768 ? 0 : 1;
    bool _772 = _714 >= 0.0;
    bool _774 = isnan(_714);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _766 + (-1.0);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _794 = _792 != 0;
    int _796 = _780 ? 0 : 1;
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _802 = _800 != 0;
    bool _804 = !_786;
    int _806 = _804 ? 0 : 1;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _814 = _812 != 0;
    bool _816 = _676 > 0.0;
    int _818 = ~_758;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _828;
    float _832 = fma(_826, _502, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _838 = _822;
    if (!_816)
    {
        int _840 = ~_758;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _862 = fma(_848, _502, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _864 = fma(_830, _502, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _874 = fma(_836, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _876 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _878 = isnan(_364);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_868, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _890 = fma(_872, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _892 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _894 = isnan(_364);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _904;
    bool _908 = _714 > 0.0;
    float _910 = fma(_852, _476, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _912 = fma(_856, _510, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _914 = -_902;
    float _916 = _914 + 1.0;
    bool _918 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _920 = isnan(_364);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = fma(_906, _476, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _932 = fma(_544, _476, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _934 = _886 * _916;
    float _936 = -_886;
    float _938 = _936 + 1.0;
    bool _940 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _942 = isnan(_364);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _956 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _958 = isnan(_364);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = _928 * _938;
    float _970 = -_928;
    float _972 = _970 + 1.0;
    float _974 = fma(_954, _510, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _976 = -_966;
    float _978 = _976 + 1.0;
    float _980 = -_950;
    float _982 = _980 + 1.0;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _984;
    float _988 = fma(_860, _510, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _990 = _966 * _972;
    float _992 = _950 * _978;
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _996 = in.m_65.x;
    float _998 = in.m_65.y;
    float _1000 = in.m_65.z;
    float _1002 = fma(_986, _570, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1004 = _740 * _982;
    int _1006 = abs(_806);
    float _1008 = -_740;
    float _1010 = _1008 + 1.0;
    float _1012 = _832 * _1004;
    float _1014 = float(_1006);
    float _1016 = _864 * _1004;
    float _1018 = float(_844);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1020;
    float _1024 = _862 * _1004;
    float _1026 = _754 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1028 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1012);
    float _1030 = _1014 * _1018;
    float _1032 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1024);
    float _1034 = _1026 * _994;
    float _1036 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1016);
    float _1038 = _1030 * (-2.0);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1042 = _466 + _1040;
    float _1044 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1034);
    int _1046 = ~_796;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    float _1052 = fma(_760, _1038, _760);
    float _1054 = _1042 * _1042;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _664 + _1056;
    int _1060 = _1050;
    if (!_908)
    {
        int _1062 = ~_796;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_1038, _996, _996);
    bool _1070 = !_790;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = _1044 + 0.25;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = _658 + _1076;
    float _1080 = fma(_1058, _1058, _1054);
    float _1082 = fma(_1022, _570, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1084 = floor(_1074);
    int _1086 = abs(_1072);
    float _1088 = fma(_1078, _1078, _1080);
    float _1090 = fma(_874, _992, _1028);
    bool _1092 = !_794;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = fma(_890, _992, _1036);
    float _1098 = float(_1066);
    float _1100 = floor(_1044);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _1102;
    float _1106 = float(_712);
    float _1108 = fma(_910, _990, _1090);
    float _1110 = float(_1086);
    float _1112 = fma(_1104, _570, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _1114 = abs(_1094);
    float _1116 = _376 + (-0.5);
    float _1118 = rsqrt(_1088);
    float _1120 = -_1084;
    float _1122 = _1074 + _1120;
    float _1124 = _1044 * 6.283185482025146484375;
    float _1126 = float(_1114);
    float _1128 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1068);
    bool _1130 = !_810;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = _1124 * 0.15915493667125701904296875;
    float _1136 = _1110 * _1106;
    float _1138 = -_1100;
    float _1140 = _1044 + _1138;
    int _1142 = abs(_1132);
    float _1144 = _1126 * _1098;
    bool _1146 = _1122 > 0.5;
    float _1148 = _1134 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    bool _1152 = _1140 >= 0.5;
    bool _1154 = isnan(_1140);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    float _1162 = fma(_1052, _754, _1128);
    float _1164 = _1042 * _1118;
    float _1166 = _1058 * _1118;
    bool _1168 = !_802;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = fma(_888, _992, _1032);
    float _1174 = -_1164;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1178 = -_1166;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    bool _1182 = !_1160;
    float _1184 = _1182 ? 0.5 : (-0.5);
    float _1186 = fma(_932, _990, _1096);
    float _1188 = _1176 * _1176;
    int _1190 = abs(_1170);
    float _1192 = _1122;
    if (_1146)
    {
        float _1194 = -_1122;
        float _1196 = _1194 + 1.0;
        _1192 = _1196;
    }
    float _1198 = _1192;
    bool _1200 = !_814;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = fma(_1180, _1180, _1188);
    float _1206 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1208 = _1206 * 2.0;
    float _1210 = float(_1142);
    float _1212 = _1078 * _1118;
    int _1214 = abs(_1202);
    float _1216 = fma(_912, _968, _1108);
    float _1218 = fma(_930, _990, _1172);
    float _1220 = -_1212;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1224 = _1210 * _1208;
    float _1226 = float(_1190);
    float _1228 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1230 = fma(_1222, _1222, _1204);
    float _1232 = fma(_1198, 4.0, -1.0);
    float _1234 = fma(_1226, _1228, _1224);
    float _1236 = float(_1214);
    float _1238 = _1144 * (-2.0);
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1242 = _450 + (-0.5);
    float _1244 = _1136 * (-2.0);
    float _1246 = fma(_1238, _1000, _1000);
    float _1248 = fma(_1236, _1240, _1234);
    float _1250 = fma(_756, _1238, _756);
    float _1252 = _378 + (-0.5);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1246);
    float _1256 = fma(_1248, 3.1415927410125732421875, _998);
    float _1258 = fma(_798, _1244, _798);
    float _1260 = sqrt(_1230);
    float _1262 = fma(_1250, _754, _1254);
    float _1264 = fma(_1256, _1244, _1256);
    float _1266 = fma(_988, _968, _1186);
    float _1268 = in.m_67.x;
    float _1270 = in.m_67.y;
    float _1272 = in.m_67.z;
    float _1274 = fma(_1002, _934, _1216);
    float _1276 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1264);
    float _1278 = fma(_974, _968, _1218);
    float _1280 = in.m_69.x;
    float _1282 = in.m_69.y;
    float _1284 = in.m_69.z;
    float _1286 = _1162 * 0.15915493667125701904296875;
    float _1288 = fma(_1258, _754, _1276);
    float _1290 = _1262 * 0.15915493667125701904296875;
    float _1292 = fma(_1112, _934, _1266);
    float _1294 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1274);
    float _1296 = _1288 * 0.15915493667125701904296875;
    float _1298 = fma(_1082, _934, _1278);
    float _1300 = _1286 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1292);
    float _1306 = _1118 * _1260;
    float _1308 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1298);
    float _1310 = _1286 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1294 * _1268;
    float _1316 = _1304 * _1272;
    float _1318 = _1308 * _1270;
    float _1320 = _1290 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1332 = _1306 * _1324;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1280);
    float _1336 = _1306 * _1326;
    float _1338 = _1296 * 6.283185482025146484375;
    float _1340 = sin(_1338);
    float _1342 = _1306 * _1328;
    float _1344 = _1334 * _1332;
    float _1346 = _1330 * _1336;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1282);
    float _1350 = _1296 * 6.283185482025146484375;
    float _1352 = cos(_1350);
    float _1354 = _1312 * _1322;
    float _1356 = _1302 * _1322;
    float _1358 = _1348 * _1342;
    float _1360 = _1354 * _1346;
    float _1362 = _1290 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = _1302 * _1340;
    float _1368 = _1312 * _1340;
    float _1370 = _1312 * _1352;
    float _1372 = _1302 * _1352;
    float _1374 = _1340 * _1322;
    float _1376 = _1352 * _1322;
    float _1378 = fma(_1364, _1370, _1366);
    float _1380 = -_1346;
    float _1382 = _1364 * _1380;
    float _1384 = -_1372;
    float _1386 = fma(_1364, _1368, _1384);
    float _1388 = -_1368;
    float _1390 = fma(_1364, _1372, _1388);
    float _1392 = fma(_1378, _1344, _1360);
    float _1394 = _1356 * _1346;
    float _1396 = fma(_1376, _1344, _1382);
    float _1398 = fma(_1364, _1366, _1370);
    float _1400 = -_1358;
    float _1402 = fma(_1386, _1400, _1392);
    float _1404 = fma(_1390, _1344, _1394);
    float _1406 = -_1358;
    float _1408 = fma(_1374, _1406, _1396);
    float _1410 = _1402 * _322;
    float _1412 = -_1358;
    float _1414 = fma(_1398, _1412, _1404);
    float _1416 = _1402 * _318;
    float _1418 = fma(_1408, _304, _1410);
    float _1420 = fma(_1408, _300, _1416);
    float _1422 = fma(_1414, _334, _1418);
    float _1424 = fma(_1414, _330, _1420);
    float _1426 = _658 + _1422;
    float _1428 = _664 + _1424;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1426 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1428 + _1434;
    float _1438 = _1432 * _1432;
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = _1402 * _314;
    float _1444 = sqrt(_1440);
    float _1446 = fma(_1408, _296, _1442);
    float _1448 = fma(_1414, _326, _1446);
    float _1450 = _466 + _1448;
    bool _1452 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1460 = _1458 != 0;
    bool _1462 = !_1456;
    int _1464 = _1462 ? 0 : 1;
    bool _1466 = !_1460;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1446;
    float _1472 = _1428;
    float _1474 = _1426;
    if (!_1452)
    {
        _1470 = _1450;
    }
    float _1476 = _1470;
    bool _1478 = !_1452;
    float _1480 = _1476;
    if (!_1478)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1486 = _1444 + _1484;
        float _1488 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = rsqrt(_1440);
        float _1492 = _1486 * _1482;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = _1494 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        float _1500 = _1494 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1498 + (-1.0);
        float _1506 = fma(_1502, _1488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1508 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = _1490 * _1506;
        float _1512 = fma(_1450, _1498, _1508);
        float _1514 = fma(_1436, _1510, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = fma(_1432, _1510, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1472 = _1514;
        _1474 = _1516;
        _1480 = _1512;
    }
    float _1518 = _1472;
    float _1520 = _1474;
    float _1522 = _1480;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1526 = _1518 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1530 = _1520 + _1528;
    float _1532 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1534 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6223 = float2(_1532, _1534);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6223, float2(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6223, float2(0.0), isnan(_6223)), level(0.0)).x;
    float _1538 = float(uint(_594));
    float _1540 = trunc(_596);
    int _1542 = int(_1540);
    int _1544 = ~_594;
    int _1546 = _1544 + 1;
    float _1548 = -_1212;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1554 = _1552 != 0;
    float _1556 = -_1166;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _1560 = float(uint(_628));
    float _1562 = -_1212;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _658);
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1568 = _1566 != 0;
    float _1570 = 1.0 / _1538;
    float _1572 = in.m_71.y;
    int _1574 = abs(_662);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1578 = _1576 != 0;
    int _1580 = abs(_1464);
    float _1582 = 1.0 / _1560;
    float _1584 = float(uint(_1542));
    float _1586 = _1538;
    float _1588 = _1572;
    if (_1554)
    {
        _1586 = 1.0;
    }
    float _1590 = _1586;
    float _1592 = _1590;
    if (!_1554)
    {
        _1592 = 7.345489978790283203125;
    }
    float _1594 = _1592;
    int _1596 = ~_594;
    int _1598 = _1596 + 1;
    float _1600 = trunc(_696);
    int _1602 = int(_1600);
    int _1604 = as_type<int>(_1570) + (-2);
    float _1606 = as_type<float>(_1604) * _1584;
    float _1608 = trunc(_1606);
    float _1610 = precise::max(_1608, 0.0);
    uint _1613 = uint(_1610);
    float _1615 = float(uint(_1602));
    float _1617 = _1594 * _376;
    float _1619 = float(_120);
    int _1621 = ~_594;
    int _1623 = _1621 + 1;
    int _1625 = _1546 * int(_1613);
    int _1627 = _1625 + _1542;
    int _1629 = as_type<int>(_1582) + (-2);
    float _1631 = floor(_1617);
    float _1633 = float(uint(_1627));
    float _1635 = as_type<float>(_1629) * _1615;
    float _1637 = as_type<float>(_1604) * _1633;
    float _1639 = 1.0 / _1619;
    float _1641 = _1633;
    if (_1554)
    {
        float _1643 = in.m_61.x;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = _1645;
    if (!_1554)
    {
        float _1649 = in.m_61.y;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = -_1631;
    float _1655 = _1617 + _1653;
    float _1657 = trunc(_1637);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    int _1663 = ~_628;
    int _1665 = _1663 + 1;
    float _1667 = trunc(_1635);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = _670 * _1639;
    float _1675 = _726 * _1639;
    int _1677 = _628 + (-1);
    int _1679 = int(_1613) + int(_1661);
    float _1681 = trunc(_1673);
    int _1683 = int(_1681);
    float _1685 = float(_1542);
    int _1687 = _1623 * _1679;
    int _1689 = _1687 + _1542;
    bool _1691 = _1685 >= _656;
    bool _1693 = isnan(_1685);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(_656);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = _1655 * _656;
    float _1705 = trunc(_1675);
    int _1707 = int(_1705);
    bool _1709 = uint(_1689) >= uint(_594);
    float _1711 = as_type<float>(_1665);
    if (_1554)
    {
        _1711 = 1.0;
    }
    float _1713 = _1711;
    int _1715 = _1665 * int(_1671);
    int _1717 = _1715 + _1602;
    bool _1719 = !_1709;
    int _1721 = _1719 ? 0 : (-1);
    bool _1723 = _594 == 0;
    float _1725 = trunc(_1701);
    int _1727 = int(_1725);
    int _1729 = ~_1679;
    int _1731 = _1729 + _1721;
    int _1733 = _1731 + 1;
    float _1735 = float(uint(_1717));
    float _1737 = _1713;
    if (!_1554)
    {
        _1737 = 1.2345600128173828125;
    }
    float _1739 = _1737;
    int _1741 = _594 * _1733;
    int _1743 = _1741 + _1542;
    bool _1745 = !_1578;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = as_type<float>(_1629) * _1735;
    float _1751 = trunc(_1703);
    int _1753 = int(_1751);
    float _1755 = _1651 * _1739;
    bool _1757 = !_1723;
    int _1759 = _1757 ? _1743 : (-1);
    int _1761 = _594 + (-1);
    int _1763 = abs(_1747);
    int _1765 = ~_1727;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    float _1771 = trunc(_1749);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    int _1777 = abs(_668);
    int _1779 = _1759 * _1769;
    bool _1781 = !_1568;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = _1753 * _1763;
    int _1787 = _1785 + _1542;
    bool _1789 = _628 == 0;
    int _1791 = _1727 * _1761;
    int _1793 = _1791 + _1779;
    int _1795 = abs(_674);
    int _1797 = _1793 * _1574;
    int _1799 = abs(_1783);
    int _1801 = _1683 * _1777;
    int _1803 = _1801 + _1797;
    int _1805 = ~_628;
    int _1807 = _1805 + 1;
    int _1809 = int(_1671) + int(_1775);
    int _1811 = _1787 * _1795;
    int _1813 = _1811 + _1803;
    float _1815 = float(_1602);
    float _1817 = floor(_1755);
    int _1819 = _1753 * _1799;
    int _1821 = _1819 + _1813;
    int _1823 = _1807 * _1809;
    int _1825 = _1823 + _1602;
    bool _1827 = _1815 >= _684;
    bool _1829 = isnan(_1815);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(_684);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = float(uint(_1821));
    bool _1841 = uint(_1825) >= uint(_628);
    float _1843 = trunc(_1837);
    int _1845 = int(_1843);
    float _1847 = as_type<float>(_1604) * _1839;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : (-1);
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1855 = _1853 != 0;
    float _1857 = -_1817;
    float _1859 = _1755 + _1857;
    int _1861 = ~_1809;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = trunc(_1847);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = ~_594;
    int _1875 = _1873 + 1;
    float _1877 = _684 * _1859;
    int _1879 = _628 * _1865;
    int _1881 = _1879 + _1602;
    int _1883 = ~_1845;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1877);
    int _1891 = int(_1889);
    bool _1893 = !_1789;
    int _1895 = _1893 ? _1881 : (-1);
    int _1897 = _1887 * _1895;
    bool _1899 = !_1855;
    int _1901 = _1899 ? 0 : 1;
    int _1903 = _1875 * int(_1871);
    int _1905 = _1903 + _1821;
    int _1907 = _1845 * _1677;
    int _1909 = _1907 + _1897;
    int _1911 = abs(_764);
    int _1913 = abs(_1901);
    int _1915 = abs(_770);
    int _1917 = _1909 * _1911;
    int _1919 = abs(_1468);
    int _1921 = _1891 * _1913;
    int _1923 = _1921 + _1602;
    float _1925 = float(uint(_1905));
    int _1927 = _1707 * _1915;
    int _1929 = _1927 + _1917;
    int _1931 = _1923 * _1580;
    int _1933 = _1931 + _1929;
    float _1935 = as_type<float>(_1604) * _1925;
    int _1937 = _1891 * _1919;
    int _1939 = _1937 + _1933;
    float _1941 = trunc(_1935);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    float _1947 = float(uint(_1939));
    int _1949 = int(_1871) + int(_1945);
    int _1951 = _1598 * _1949;
    int _1953 = _1951 + _1821;
    float _1955 = fma(_1536, 100.0, _1522);
    float _1957 = -_1166;
    float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    float _1961 = -_1164;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1955);
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1967 = _1959 + _1965;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1971 = _1550 + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1975 = _1963 + _1973;
    float _1977 = _1975 * _1975;
    float _1979 = fma(_1967, _1967, _1977);
    float _1981 = fma(_1971, _1971, _1979);
    float _1983 = rsqrt(_1981);
    float _1985 = sqrt(_1981);
    float _1987 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1989 = _1967 * _1987;
    float _1991 = _1971 * _1987;
    float _1993 = _1989 * _1989;
    float _1995 = _1991 * _1991;
    float _1997 = _1993 + _1995;
    float _1999 = sqrt(_1997);
    bool _2001 = _1999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2005 = _1999 + _2003;
    float _2007 = _1971;
    float _2009 = _2005;
    float _2011 = _1977;
    float _2013 = _1975;
    float _2015 = as_type<float>(_1871);
    if (_2001)
    {
        float _2017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2007 = _2017;
    }
    float _2019 = _2007;
    if (_2001)
    {
        float _2021 = _2005 * _2019;
        _2009 = _2021;
    }
    float _2023 = _2009;
    if (_2001)
    {
        float _2025 = _2023 * 0.15915493667125701904296875;
        _2011 = _2025;
    }
    float _2027 = _2011;
    float _2029 = as_type<float>(_764);
    float _2031 = _2027;
    if (_2001)
    {
        float _2033 = _2027 * 6.283185482025146484375;
        float _2035 = sin(_2033);
        _2029 = _2035;
    }
    float _2037 = _2029;
    float _2039 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2041 = precise::max(0.0, _2039);
    float _2043 = _1983;
    float _2045 = _2041;
    if (_2001)
    {
        float _2047 = _2027 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        _2043 = _2049;
    }
    float _2051 = _2043;
    float _2053 = -_1987;
    float _2055 = -_2041;
    float _2057 = fma(_1975, _2053, _2055);
    float _2059 = _2039;
    if (_2001)
    {
        float _2061 = rsqrt(_1997);
        _2059 = _2061;
    }
    float _2063 = _2059;
    if (_2001)
    {
        float _2065 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2045 = _2065;
    }
    float _2067 = _2045;
    float _2069 = _2067;
    if (!_2001)
    {
        _2031 = _1993;
    }
    float _2071 = _2031;
    float _2073 = _2037;
    float _2075 = _2071;
    if (_2001)
    {
        float _2077 = fma(_2037, _2067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2069 = _2077;
    }
    float _2079 = _2069;
    float _2081 = _2079;
    float _2083 = _2051;
    if (_2001)
    {
        float _2085 = _2051 + (-1.0);
        _2013 = _2085;
    }
    float _2087 = _2013;
    float _2089 = _2087;
    if (_2001)
    {
        float _2091 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2091;
    }
    float _2093 = _2015;
    if (!_2001)
    {
        _2089 = _1991;
    }
    float _2095 = _2089;
    float _2097 = _2063;
    float _2099 = _2095;
    if (_2001)
    {
        float _2101 = _2063 * _2079;
        _2073 = _2101;
    }
    float _2103 = _2073;
    if (!_2001)
    {
        _2081 = _1989;
    }
    float _2105 = _2081;
    float _2107 = _2105;
    if (!_2001)
    {
        _2097 = _2057;
    }
    float _2109 = _2097;
    float _2111 = _2109;
    if (_2001)
    {
        float _2113 = _1989 * _2103;
        _2107 = _2113;
    }
    float _2115 = _2107;
    if (_2001)
    {
        float _2117 = fma(_2057, _2051, _2093);
        _2111 = _2117;
    }
    float _2119 = _2111;
    if (_2001)
    {
        float _2121 = _1991 * _2103;
        _2099 = _2121;
    }
    float _2123 = _2099;
    if (!_2001)
    {
        _2083 = _1995;
    }
    float _2125 = _2083;
    float _2127 = _2125;
    if (_2001)
    {
        float _2129 = _2115 * _2115;
        _2075 = _2129;
    }
    float _2131 = _2075;
    if (_2001)
    {
        float _2133 = _2123 * _2123;
        _2127 = _2133;
    }
    float _2135 = _2127;
    float _2137 = fma(_2119, _2119, _2131);
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2141 = _2139 != 0;
    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2145 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2143);
    float _2147 = precise::clamp(_2145, 0.0, 1.0);
    float _2149 = _2137 + _2135;
    float _2151 = -_2147;
    float _2153 = _2151 + 1.0;
    float _2155 = rsqrt(_2149);
    float _2157 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2159 = floor(_2157);
    float _2161 = abs(_2153);
    float _2163 = log2(_2161);
    float _2165 = _2155 * _2115;
    float _2167 = _2155 * _2119;
    float _2169 = _2155 * _2123;
    float _2171 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2173 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2175 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2177 = -_2159;
    float _2179 = _2157 + _2177;
    float _2181 = -_2173;
    float _2183 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2181);
    float _2185 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2187 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2189 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2191 = -_2169;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2183);
    float _2195 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2197 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2187);
    float _2199 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2201 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2189);
    float _2203 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2195);
    float _2205 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2197);
    float _2207 = floor(_2171);
    float _2209 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2201);
    float _2211 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2203);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2215 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2175);
    float _2217 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2219 = _2211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2221 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2223 = exp2(_2199);
    float _2225 = fma(_2193, -0.5, 0.5);
    float _2227 = fma(_2193, 0.5, 0.5);
    float _2229 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2215);
    float _2231 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2221);
    float _2233 = _2167 + 1.0;
    float _2235 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2237 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2239 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2231);
    float _2241 = sqrt(_2225);
    float _2243 = -_2235;
    float _2245 = fma(_2243, _2185, 1.0);
    float _2247 = -_2207;
    float _2249 = _2171 + _2247;
    float _2251 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2253 = fma(_2227, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2255 = log2(_2245);
    float _2257 = -_2167;
    float _2259 = fma(_2223, _2233, _2257);
    float _2261 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2239);
    float _2263 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2265 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2251);
    float _2267 = fma(_2227, _2253, -0.212114393711090087890625);
    float _2269 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2263);
    float _2271 = 1.0 / _2261;
    float _2273 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2275 = fma(_2227, _2267, 1.570728778839111328125);
    float _2277 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2269);
    float _2279 = _2241 * 0.636619746685028076171875;
    float _2281 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2273);
    float2 _7333 = float2(_2179, _2249);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7333, float2(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7333, float2(0.0), isnan(_7333)), level(0.0)).x;
    float _2285 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2287 = _2255 * 0.693147182464599609375;
    float _2289 = -_2275;
    float _2291 = fma(_2279, _2289, 1.0);
    float _2293 = fma(_2259, 0.5, 0.5);
    float _2295 = in.m_61.w;
    float _2297 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2299 = in.m_71.x;
    float _2301 = _2285 * _2271;
    float _2303 = _2281 * _2271;
    float _2305 = fma(_2301, 0.5, 0.5);
    float _2307 = fma(_2303, -0.5, 0.5);
    float3 _7375 = float3(_2305, _2307, _2297);
    float _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7375, float3(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7375, float3(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2305, _2307, _2297);
    float4 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).xyzw;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = _2312.w;
    float2 _7402 = float2(_2291, _2293);
    float3 _2324 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7402, float2(0.0), isnan(_7402)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7402, float2(0.0), isnan(_7402)), level(0.0)).xyz;
    float _2326 = _2324.x;
    float _2328 = _2324.y;
    float _2330 = _2324.z;
    float _2332 = as_type<float>(_1629) * _1947;
    bool _2334 = uint(_1953) >= uint(_594);
    float _2336 = as_type<float>(_1190);
    float _2338 = _2297;
    int _2340 = as_type<int>(_2249);
    float _2342 = _2332;
    float _2344 = _2261;
    float _2346 = _2281;
    if (_2141)
    {
        float _2348 = in.m_61.x;
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = float(uint(_1787));
    float _2354 = trunc(_2332);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    bool _2360 = !_2334;
    int _2362 = _2360 ? 0 : (-1);
    float _2364 = fma(_1536, 100.0, _466);
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2368 = _2366 != 0;
    float _2370 = as_type<float>(_1604) * _2352;
    int _2372 = ~_1949;
    int _2374 = _2372 + _2362;
    int _2376 = _2374 + 1;
    float _2378 = -_1164;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2364);
    int _2382 = ~_628;
    int _2384 = _2382 + 1;
    float _2386 = -_1572;
    float _2388 = _2386 + 1.0;
    bool _2390 = _378 > 0.5;
    float _2392 = trunc(_2370);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    bool _2398 = _2295 > 0.5;
    int _2400 = _594 * _2376;
    int _2402 = _2400 + _1821;
    int _2404 = _2390 ? as_type<int>(_2388) : as_type<int>(_1572);
    float _2406 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2410 = _2408 != 0;
    int _2412 = _2384 * int(_2358);
    int _2414 = _2412 + _1939;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2418 = _2416 != 0;
    out.m_73.x = _1959;
    out.m_73.y = _1963;
    out.m_73.z = _1550;
    float _2420 = _2410 ? as_type<float>(_2404) : _1572;
    float _2422 = exp2(_2406);
    float _2424 = float(uint(_2414));
    int _2426 = _2414;
    bool _2428 = _2398;
    bool _2430 = _2410;
    if (_2141)
    {
        float _2432 = -_2299;
        float _2434 = _2432 + 1.0;
        _2426 = as_type<int>(_2434);
    }
    int _2436 = _2426;
    if (_2368)
    {
        float _2438 = _2398 ? _2388 : _1572;
        _1588 = _2438;
    }
    float _2440 = _1588;
    int _2442 = ~_594;
    int _2444 = _2442 + 1;
    float _2446 = as_type<float>(_1629) * _2424;
    if (_2141)
    {
        bool _2448 = _2350 > 0.5;
        _2428 = _2448;
    }
    bool _2450 = _2428;
    bool _2452 = !_1723;
    float _2454 = _2452 ? as_type<float>(_2402) : as_type<float>(0xffffffffu /* nan */);
    int _2456 = _2444 * int(_2396);
    int _2458 = _2456 + _1787;
    float _2460 = _2454;
    if (!_2141)
    {
        _2338 = _2299;
    }
    float _2462 = _2338;
    float _2464 = trunc(_2446);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    float _2470 = _2462;
    if (_2141)
    {
        float _2472 = _2450 ? as_type<float>(_2436) : _2299;
        _2470 = _2472;
    }
    float _2474 = _2470;
    if (_2418)
    {
        float _2476 = -_2299;
        float _2478 = _2476 + 1.0;
        _2340 = as_type<int>(_2478);
    }
    int _2480 = _2340;
    int _2482 = as_type<int>(_2454) & 3;
    bool _2484 = _2482 != 0;
    float _2486 = -_2422;
    float _2488 = _2486 + 1.0;
    if (_2418)
    {
        bool _2490 = _450 > 0.5;
        _2430 = _2490;
    }
    bool _2492 = _2430;
    float _2494 = float(uint(_2458));
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2498 = uint(_2482) > 1u;
    float _2500 = float(uint(_1923));
    float _2502 = as_type<float>(_1604) * _2494;
    if (!_2418)
    {
        _2342 = _2299;
    }
    float _2504 = _2342;
    float _2506 = _2504;
    if (_2418)
    {
        float _2508 = _2492 ? as_type<float>(_2480) : _2299;
        _2506 = _2508;
    }
    float _2510 = _2506;
    int _2512 = as_type<int>(_2454) & 3;
    bool _2514 = _2512 != 0;
    float _2516 = trunc(_2502);
    float _2518 = precise::max(_2516, 0.0);
    uint _2520 = uint(_2518);
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2528 = _2526 != 0;
    float _2530 = as_type<float>(_1629) * _2500;
    int _2532 = int(_2358) + int(_2468);
    int _2534 = ~_628;
    int _2536 = _2534 + 1;
    int _2538 = _2514 ? 0 : 1;
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    bool _2546 = uint(_2482) >= 2u;
    int _2548 = _2536 * _2532;
    int _2550 = _2548 + _1939;
    int _2552 = ~_2538;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    int _2558 = _2556;
    if (!_2498)
    {
        int _2560 = ~_2538;
        int _2562 = _2560 + 1;
        _2558 = _2562;
    }
    int _2564 = _2558;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2568 = _2546 ? 0 : 1;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2572 = uint(_2550) >= uint(_628);
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2576 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2578 = !_2572;
    float _2580 = _2578 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2582 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2584 = ~_628;
    int _2586 = _2584 + 1;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2590 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2592 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2594 = ~_2532;
    int _2596 = _2594 + as_type<int>(_2580);
    int _2598 = _2596 + 1;
    float _2600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2602 = ~_594;
    int _2604 = _2602 + 1;
    float _2606 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2608 = _2482 != 3;
    out.m_75.x = _2576;
    out.m_75.y = _2582;
    out.m_75.z = _2590;
    out.m_75.w = _2588;
    int _2610 = int(_2396) + int(_2520);
    int _2612 = _2586 * int(_2544);
    int _2614 = _2612 + _1923;
    int _2616 = _628 * _2598;
    int _2618 = _2616 + _1939;
    float _2620 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2622 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2624 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2626 = !_1789;
    int _2628 = _2626 ? _2618 : (-1);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    int _2630 = ~_2568;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2634;
    float _2638 = _2580;
    float _2640 = as_type<float>(_2586);
    if (_2608)
    {
        int _2642 = ~_2568;
        int _2644 = _2642 + 1;
        _2636 = _2644;
    }
    int _2646 = _2636;
    out.m_79.x = _2620;
    out.m_79.y = _2622;
    out.m_79.z = _2624;
    int _2648 = as_type<int>(_2454) >> 31;
    float _2650 = in.m_81.x;
    float _2652 = in.m_81.y;
    float _2654 = in.m_81.z;
    float _2656 = float(uint(_2614));
    int _2658 = _2604 * _2610;
    int _2660 = _2658 + _1787;
    int _2662 = _2648 & 3;
    bool _2664 = _1282 != 0.0;
    bool _2666 = isnan(_1282);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan(0.0);
    bool _2672 = _2668 || _2670;
    float _2674 = as_type<float>(_1629) * _2656;
    bool _2676 = uint(_2660) >= uint(_594);
    int _2678 = _2628 >> 31;
    int _2680 = as_type<int>(_2454) + _2662;
    float _2682 = trunc(_2674);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = in.m_83.x;
    float _2690 = in.m_83.y;
    float _2692 = in.m_83.z;
    float _2694 = in.m_83.w;
    int _2696 = _2678 & 3;
    bool _2698 = !_2676;
    int _2700 = _2698 ? 0 : (-1);
    int _2702 = _2680 >> 2;
    bool _2704 = _1280 == 0.0;
    bool _2706 = !_2672;
    bool _2708 = _2704 && _2706;
    int _2710 = _2628 & 3;
    bool _2712 = _2710 != 0;
    int _2714 = _2628 + _2696;
    int _2716 = _2702 << 4;
    int _2718 = _2716 + 368;
    bool _2720 = _1284 == 0.0;
    bool _2722 = _2720 && _2708;
    int _2724 = _2712 ? 0 : 1;
    bool _2726 = uint(_2710) >= 2u;
    int _2728 = _2714 >> 2;
    uint _2730 = uint(int(uint(_2718) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    int _2746 = _2726 ? 0 : 1;
    float _2748 = _2692 * _2650;
    int _2750 = _2728 << 4;
    int _2752 = _2750 + 512;
    bool _2754 = uint(_2710) > 1u;
    float _2756 = -_2748;
    float _2758 = fma(_2688, _2654, _2756);
    int _2760 = int(_2544) + int(_2686);
    uint _2762 = uint(int(uint(_2752) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[int(_2772)][_2774];
    float _2778 = _2758 * _2694;
    if (_2722)
    {
        _2638 = _2650;
    }
    float _2780 = _2638;
    float _2782 = _2780;
    if (!_2722)
    {
        float _2784 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2650);
        _2782 = _2784;
    }
    float _2786 = _2782;
    if (_2722)
    {
        _2460 = _2652;
    }
    float _2788 = _2460;
    float _2790 = _2788;
    if (!_2722)
    {
        float _2792 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2652);
        _2790 = _2792;
    }
    float _2794 = _2790;
    int _2796 = _2586 * _2760;
    int _2798 = _2796 + _1923;
    float _2800 = _2690 * _2654;
    int _2802 = ~_2724;
    int _2804 = _2802 + 1;
    int _2806 = _2804 + 1;
    int _2808 = _2806;
    if (!_2754)
    {
        int _2810 = ~_2724;
        int _2812 = _2810 + 1;
        _2808 = _2812;
    }
    int _2814 = _2808;
    float _2816 = -_2800;
    float _2818 = fma(_2692, _2652, _2816);
    bool _2820 = uint(_2798) >= uint(_628);
    float _2822 = _2688 * _2652;
    int _2824 = _2718 + 8;
    uint _2826 = uint(int(uint(_2824) >> uint(2)));
    uint _2828 = uint(int(uint(int(_2826)) >> uint(2)));
    int _2830 = int(_2826) & 3;
    float _2832 = (*spvDescriptorSet0.vp_c9)._m0[int(_2828)][_2830];
    int _2834 = int(_2826) + 1;
    uint _2836 = uint(int(uint(_2834) >> uint(2)));
    int _2838 = _2834 & 3;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[int(_2836)][_2838];
    if (_2722)
    {
        _2640 = _2654;
    }
    float _2842 = _2640;
    float _2844 = _2842;
    if (!_2722)
    {
        float _2846 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2654);
        _2844 = _2846;
    }
    float _2848 = _2844;
    float _2850 = -_2822;
    float _2852 = fma(_2690, _2650, _2850);
    bool _2854 = !_2820;
    int _2856 = _2854 ? 0 : (-1);
    float _2858 = _2818 * _2694;
    bool _2860 = _2710 != 3;
    float _2862 = _2852 * _2694;
    int _2864 = _2752 + 8;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
    int _2870 = int(_2866) & 3;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[int(_2868)][_2870];
    int _2874 = int(_2866) + 1;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    int _2878 = _2874 & 3;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[int(_2876)][_2878];
    bool _2882 = !_2484;
    int _2884 = _2882 ? 0 : 1;
    int _2886 = abs(_2564);
    int _2888 = _2628 & 3;
    bool _2890 = _2888 != 0;
    int _2892 = abs(_2884);
    int _2894 = ~_2886;
    int _2896 = _2894 + 1;
    int _2898 = _2896 + 1;
    float _2900 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2902 = int(_2900);
    int _2904 = ~_2610;
    int _2906 = _2904 + _2700;
    int _2908 = _2906 + 1;
    int _2910 = abs(_2814);
    float _2912 = _1354 * _2848;
    bool _2914 = _2482 != 3;
    int _2916 = _594 * _2908;
    int _2918 = _2916 + _1787;
    bool _2920 = !_2890;
    int _2922 = _2920 ? 0 : 1;
    int _2924 = _2898 * as_type<int>(_2744);
    int _2926 = ~_2892;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    int _2932 = ~_2760;
    int _2934 = _2932 + _2856;
    int _2936 = _2934 + 1;
    int _2938 = ~_2910;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    int _2944 = _2930 * as_type<int>(_2736);
    int _2946 = _2944 + _2924;
    int _2948 = ~_2746;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    float _2954 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2956 = int(_2954);
    bool _2958 = _2710 != 3;
    int _2960 = _2942 * as_type<int>(_2776);
    int _2962 = abs(_2922);
    float _2964 = -_2692;
    float _2966 = _1364 * _2964;
    int _2968 = _2952;
    if (_2860)
    {
        int _2970 = ~_2746;
        int _2972 = _2970 + 1;
        _2968 = _2972;
    }
    int _2974 = _2968;
    bool _2976 = !_2914;
    int _2978 = _2976 ? 0 : (-1);
    float _2980 = fma(_1376, _2688, _2966);
    int _2982 = abs(_2646);
    bool _2984 = !_2958;
    int _2986 = _2984 ? 0 : (-1);
    int _2988 = ~_2962;
    int _2990 = _2988 + 1;
    int _2992 = _2990 + 1;
    int _2994 = abs(_2974);
    int _2996 = abs(_2978);
    int _2998 = abs(_2986);
    int _3000 = _2992 * as_type<int>(_2768);
    int _3002 = _3000 + _2960;
    int _3004 = ~_2982;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    int _3010 = _3008 * as_type<int>(_2832);
    int _3012 = _3010 + _2946;
    int _3014 = ~_2994;
    int _3016 = _3014 + 1;
    int _3018 = _3016 + 1;
    float _3020 = _1356 * _2862;
    int _3022 = ~_2996;
    int _3024 = _3022 + 1;
    int _3026 = _3024 + 1;
    int _3028 = ~_2998;
    int _3030 = _3028 + 1;
    int _3032 = _3030 + 1;
    int _3034 = _3018 * as_type<int>(_2872);
    int _3036 = _3034 + _3002;
    float _3038 = float(uint(_2902));
    int _3040 = _3026 * as_type<int>(_2840);
    int _3042 = _3040 + _3012;
    bool _3044 = !_2524;
    int _3046 = _3044 ? 0 : 1;
    int _3048 = _3032 * as_type<int>(_2880);
    int _3050 = _3048 + _3036;
    bool _3052 = !_2528;
    int _3054 = _3052 ? 0 : 1;
    float _3056 = fma(_1390, _2858, _3020);
    int _3058 = abs(_3046);
    float _3060 = 1.0 / _3038;
    float _3062 = float(uint(_2956));
    int _3064 = abs(_3054);
    int _3066 = ~_3058;
    int _3068 = _3066 + 1;
    int _3070 = _3068 + 1;
    int _3072 = ~_3064;
    int _3074 = _3072 + 1;
    int _3076 = _3074 + 1;
    float _3078 = 1.0 / _3062;
    bool _3080 = !_1723;
    int _3082 = _3080 ? _2918 : (-1);
    int _3084 = _3042 * _3070;
    int _3086 = abs(_2902);
    int _3088 = _628 * _2936;
    int _3090 = _3088 + _1923;
    float _3092 = _1356 * _2692;
    int _3094 = _3076 * _3050;
    float _3096 = float(uint(_3086));
    int _3098 = _3082 * _3058;
    int _3100 = _3098 + _3084;
    float _3102 = _1354 * _2692;
    bool _3104 = !_1789;
    int _3106 = _3104 ? _3090 : (-1);
    float _3108 = -_2862;
    float _3110 = _1364 * _3108;
    int _3112 = abs(_2956);
    float _3114 = _1354 * _2862;
    int _3116 = as_type<int>(_3060) + (-2);
    float _3118 = -_2848;
    float _3120 = _1364 * _3118;
    float _3122 = float(uint(_3100));
    int _3124 = _3106 * _3064;
    int _3126 = _3124 + _3094;
    float _3128 = 1.0 / _3096;
    float _3130 = float(uint(_3112));
    float _3132 = fma(_1376, _2786, _3120);
    int _3134 = as_type<int>(_3078) + (-2);
    float _3136 = as_type<float>(_3116) * _3122;
    float _3138 = float(uint(_3126));
    float _3140 = _1356 * _2848;
    int _3142 = abs(_3100);
    float _3144 = 1.0 / _3130;
    float _3146 = fma(_1376, _2858, _3110);
    float _3148 = as_type<float>(_3134) * _3138;
    float _3150 = float(uint(_3142));
    float _3152 = fma(_1378, _2786, _2912);
    int _3154 = ~_2956;
    int _3156 = _3154 + 1;
    float _3158 = fma(_1378, _2858, _3114);
    float _3160 = -_2283;
    float _3162 = _3160 + 1.0;
    float _3164 = trunc(_3136);
    float _3166 = precise::max(_3164, 0.0);
    uint _3168 = uint(_3166);
    int _3170 = as_type<int>(_3128) + (-2);
    float _3172 = -_2794;
    float _3174 = fma(_1386, _3172, _3152);
    int _3176 = abs(_3126);
    float _3178 = _2496 * _2309;
    int _3180 = ~_2902;
    int _3182 = _3180 + 1;
    float _3184 = as_type<float>(_3170) * _3150;
    float _3186 = float(uint(_3176));
    float _3188 = trunc(_3148);
    float _3190 = precise::max(_3188, 0.0);
    uint _3192 = uint(_3190);
    int _3194 = as_type<int>(_3144) + (-2);
    float _3196 = fma(_1378, _2688, _3102);
    float _3198 = as_type<float>(_3194) * _3186;
    int _3200 = _3182 * int(_3168);
    int _3202 = _3200 + _3100;
    float _3204 = trunc(_3184);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    float _3210 = fma(_1390, _2786, _3140);
    int _3212 = ~_3086;
    int _3214 = _3212 + 1;
    float _3216 = -_2690;
    float _3218 = fma(_1386, _3216, _3196);
    float _3220 = float(uint(_3202));
    int _3222 = _3156 * int(_3192);
    int _3224 = _3222 + _3126;
    float _3226 = trunc(_3198);
    float _3228 = precise::max(_3226, 0.0);
    uint _3230 = uint(_3228);
    float _3232 = as_type<float>(_3116) * _3220;
    int _3234 = ~_3112;
    int _3236 = _3234 + 1;
    float _3238 = fma(_1390, _2688, _3092);
    float _3240 = float(uint(_3224));
    float _3242 = -_2794;
    float _3244 = fma(_1374, _3242, _3132);
    float _3246 = -_2690;
    float _3248 = fma(_1374, _3246, _2980);
    float _3250 = trunc(_3232);
    float _3252 = precise::max(_3250, 0.0);
    uint _3254 = uint(_3252);
    float _3256 = as_type<float>(_3134) * _3240;
    float _3258 = -_2778;
    float _3260 = fma(_1374, _3258, _3146);
    int _3262 = _3214 * int(_3208);
    int _3264 = _3262 + _3142;
    float _3266 = -_2794;
    float _3268 = fma(_1398, _3266, _3210);
    float _3270 = -_2690;
    float _3272 = fma(_1398, _3270, _3238);
    int _3274 = _3236 * int(_3230);
    int _3276 = _3274 + _3176;
    float _3278 = float(uint(_3264));
    float _3280 = trunc(_3256);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    float _3286 = float(uint(_3276));
    float _3288 = as_type<float>(_3170) * _3278;
    float _3290 = -_2778;
    float _3292 = fma(_1386, _3290, _3158);
    float _3294 = _3218 * _314;
    float _3296 = _3174 * _318;
    float _3298 = as_type<float>(_3194) * _3286;
    float _3300 = trunc(_3288);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    float _3306 = _3218 * _318;
    float _3308 = _3218 * _322;
    float _3310 = _3292 * _318;
    float _3312 = -_2778;
    float _3314 = fma(_1398, _3312, _3056);
    float _3316 = _3174 * _322;
    float _3318 = _3292 * _314;
    float _3320 = fma(_3248, _296, _3294);
    float _3322 = trunc(_3298);
    float _3324 = precise::max(_3322, 0.0);
    uint _3326 = uint(_3324);
    float _3328 = _3174 * _314;
    float _3330 = _3292 * _322;
    float _3332 = fma(_3248, _300, _3306);
    float _3334 = fma(_3248, _304, _3308);
    int _3336 = int(_3168) + int(_3254);
    float _3338 = fma(_3260, _300, _3310);
    int _3340 = ~_2902;
    int _3342 = _3340 + 1;
    float _3344 = fma(_3244, _304, _3316);
    int _3346 = int(_3192) + int(_3284);
    float _3348 = fma(_3314, _330, _3338);
    int _3350 = ~_2956;
    int _3352 = _3350 + 1;
    int _3354 = _3342 * _3336;
    int _3356 = _3354 + _3100;
    int _3358 = int(_3208) + int(_3304);
    float _3360 = fma(_3244, _300, _3296);
    int _3362 = ~_3086;
    int _3364 = _3362 + 1;
    int _3366 = _3352 * _3346;
    int _3368 = _3366 + _3126;
    int _3370 = int(_3230) + int(_3326);
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3374 = ~_3112;
    int _3376 = _3374 + 1;
    int _3378 = _3364 * _3358;
    int _3380 = _3378 + _3142;
    bool _3382 = uint(_3356) >= uint(_2902);
    bool _3384 = uint(_3368) >= uint(_2956);
    int _3386 = _3376 * _3370;
    int _3388 = _3386 + _3176;
    bool _3390 = !_3382;
    int _3392 = _3390 ? 0 : (-1);
    float _3394 = fma(_3260, _296, _3318);
    bool _3396 = uint(_3380) >= uint(_3086);
    float _3398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3400 = ~_3336;
    int _3402 = _3400 + _3392;
    int _3404 = _3402 + 1;
    float _3406 = fma(_3260, _304, _3330);
    bool _3408 = uint(_3388) >= uint(_3112);
    bool _3410 = !_3384;
    int _3412 = _3410 ? 0 : (-1);
    int _3414 = _2902 * _3404;
    int _3416 = _3414 + _3100;
    int _3418 = _3100 ^ _2902;
    float _3420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3422 = _3126 ^ _2956;
    float _3424 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3426 = ~_3346;
    int _3428 = _3426 + _3412;
    int _3430 = _3428 + 1;
    bool _3432 = _2902 == 0;
    float _3434 = fma(_3424, _2474, -0.5);
    bool _3436 = _2902 == 0;
    int _3438 = _2956 * _3430;
    int _3440 = _3438 + _3126;
    bool _3442 = !_3408;
    int _3444 = _3442 ? 0 : (-1);
    float _3446 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _3448 = uint(int(uint(_3422) >> uint(31)));
    bool _3450 = !_3396;
    int _3452 = _3450 ? 0 : (-1);
    uint _3454 = uint(int(uint(_3418) >> uint(31)));
    int _3456 = ~_3444;
    int _3458 = _3370 + _3456;
    int _3460 = _3458 + 1;
    bool _3462 = !_3432;
    int _3464 = _3462 ? _3416 : (-1);
    float _3466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3468 = ~int(_3448);
    int _3470 = _3468 + 1;
    int _3472 = ~_3452;
    int _3474 = _3358 + _3472;
    int _3476 = _3474 + 1;
    int _3478 = ~int(_3454);
    int _3480 = _3478 + 1;
    float _3482 = float(_3464);
    int _3484 = _3460 ^ _3470;
    int _3486 = _3476 ^ _3480;
    float _3488 = fma(_3424, _3482, _506);
    bool _3490 = _2956 == 0;
    bool _3492 = _2956 == 0;
    float _3494 = _3466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3496 = ~_3470;
    int _3498 = _3496 + _3484;
    int _3500 = _3498 + 1;
    float _3502 = fma(_690, _3434, _3488);
    int _3504 = ~_3480;
    int _3506 = _3504 + _3486;
    int _3508 = _3506 + 1;
    float _3510 = _3420 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3512 = !_3490;
    int _3514 = _3512 ? _3440 : (-1);
    float _3516 = fma(_3494, _2440, -0.5);
    bool _3518 = !_3492;
    int _3520 = _3518 ? _3500 : (-1);
    float _3522 = fma(_3510, _2510, -0.5);
    bool _3524 = !_3436;
    int _3526 = _3524 ? _3508 : (-1);
    float _3528 = float(_3514);
    float _3530 = float(_3520);
    float _3532 = fma(_3272, _334, _3334);
    float _3534 = float(_3526);
    float _3536 = fma(_3510, _3528, _624);
    float _3538 = fma(_3446, _2420, -0.5);
    float _3540 = -_648;
    float _3542 = fma(_3494, _3530, _3540);
    float _3544 = fma(_3244, _296, _3328);
    float _3546 = -_514;
    float _3548 = fma(_3446, _3534, _3546);
    float _3550 = fma(_562, _3522, _3536);
    float _3552 = fma(_3268, _330, _3360);
    float _3554 = fma(_3314, _334, _3406);
    float _3556 = fma(_3268, _334, _3344);
    float _3558 = _2380 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3560 = _2380 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3562 = fma(_650, _3538, _3548);
    float _3564 = fma(_3272, _330, _3332);
    float _3566 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3558);
    float _3568 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3560);
    float _3570 = fma(_3272, _326, _3320);
    float _3572 = fma(_3314, _326, _3394);
    float _3574 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3566);
    float _3576 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3568);
    float _3578 = fma(_686, _3516, _3542);
    out.m_85.x = _3564;
    out.m_85.y = _3570;
    out.m_85.z = _3532;
    float _3580 = _3574 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3582 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_87.x = _3348;
    out.m_87.y = _3572;
    out.m_87.z = _3554;
    float _3584 = 1.0 / _3580;
    float _3586 = _3582 + _3580;
    float _3588 = _2330 * _3178;
    float _3590 = in.m_63.x;
    float _3592 = fma(_3268, _326, _3544);
    float _3594 = _3550 + 0.5;
    float _3596 = _3502 + 0.5;
    float _3598 = _3578 + 0.5;
    float _3600 = _3562 + 0.5;
    float _3602 = fma(_2320, _3588, _2318);
    out.m_89.x = _3552;
    out.m_89.y = _3592;
    out.m_89.z = _3556;
    bool _3604 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3606 = isnan(_1985);
    bool _3608 = _3604 || _3606;
    bool _3610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3612 = _3608 || _3610;
    float _3614 = _3586 * _3584;
    float _3616 = _3614 * 0.5;
    out.m_91.x = _3596;
    out.m_91.y = _3600;
    out.m_91.z = _3594;
    out.m_91.w = _3598;
    float _3618 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3620 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3618);
    float _3622 = 1.0 / _3620;
    float _3624 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3626 = _3622 * _3624;
    float _3628 = abs(_3626);
    float _3630 = log2(_3628);
    bool _3632 = _3626 <= 8000.0;
    bool _3634 = isnan(_3626);
    bool _3636 = _3632 || _3634;
    bool _3638 = isnan(8000.0);
    bool _3640 = _3636 || _3638;
    float _3642 = float(_3640);
    float _3644 = _3630 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3646 = exp2(_3644);
    float _3648 = fma(_3646, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3650 = precise::clamp(_3648, 0.0, 1.0);
    float _3652 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3654 = fma(_3650, -2.0, 3.0);
    float _3656 = _3650 * _3650;
    float _3658 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3652);
    float _3660 = _3656 * _3654;
    float _3662 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3658);
    float _3664 = -_3660;
    float _3666 = _3664 + 1.0;
    float _3668 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3662);
    float _3670 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3660);
    float _3672 = _3668 + _2261;
    out.gl_Position.x = _2285;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _3668;
    out.gl_Position.w = _2261;
    float _3674 = _3642 * _3670;
    float _3676 = _3672 * 0.5;
    float _3678 = _3674 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_93.z = _3676;
    out.m_93.w = _2261;
    float _3680 = _3162 * _3678;
    float _3682 = precise::clamp(_3680, 0.0, 1.0);
    float _3684 = -_3682;
    float _3686 = fma(_3684, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3688 = _2320 * _3178;
    float _3690 = -_2496;
    float _3692 = _3690 + 1.0;
    float _3694 = _2261;
    float _3696 = _3676;
    float _3698 = _3668;
    float _3700 = _3692;
    if (!_3612)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3702 = _2344;
    float _3704 = _3686 * _3590;
    float _3706 = fma(_2326, _3688, _2314);
    float _3708 = fma(_2328, _3688, _2316);
    float _3710 = _2320 * _3692;
    float _3712 = _3704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3714 = _3702;
    float _3716 = _3702;
    if (!_3612)
    {
        _3694 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3718 = _3694;
    float _3720 = _3718;
    float _3722 = _3718;
    if (!_3612)
    {
        _3696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3724 = _3696;
    out.m_95.x = _3706;
    out.m_95.y = _3708;
    out.m_95.z = _3602;
    out.m_95.w = _3710;
    float _3726 = _3724;
    float _3728 = _3724;
    if (!_3612)
    {
        _3698 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3730 = _3698;
    float _3732 = _3730;
    float _3734 = _3730;
    if (!_3612)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3736 = _2346;
    out.m_97.x = _3712;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3612)
    {
        _3700 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3742 = _3700;
    bool _3744 = !_3612;
    float _3746 = _3742;
    float _3748 = _3742;
    if (!_3744)
    {
        bool _3750 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3752 = isnan(_1985);
        bool _3754 = _3750 || _3752;
        bool _3756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3758 = _3754 || _3756;
        if (!_3758)
        {
            float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3762 = _1985 + _3760;
            float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3766 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3764;
            float _3768 = 1.0 / _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3772 = _3770 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3776 = _3774 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3790 = _3762 * _3768;
            float _3792 = precise::clamp(_3790, 0.0, 1.0);
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3796 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3798 = fma(_3792, _3772, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3800 = fma(_3792, _3796, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3802 = fma(_3792, _3776, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3804 = fma(_3792, _3780, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3806 = fma(_3792, _3784, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3808 = fma(_3792, _3788, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3728 = _3800;
            _3740 = _3806;
            _3722 = _3798;
            _3734 = _3804;
            _3716 = _3802;
            _3748 = _3808;
            _3810 = true;
        }
        else
        {
            bool _3812 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3814 = isnan(_1985);
            bool _3816 = _3812 || _3814;
            bool _3818 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3820 = _3816 || _3818;
            if (!_3820)
            {
                _3720 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3822 = _3720;
            _3722 = _3822;
            if (!_3820)
            {
                _3726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3824 = _3726;
            _3728 = _3824;
            if (!_3820)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3826 = _3714;
            _3716 = _3826;
            if (!_3820)
            {
                _3732 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3828 = _3732;
            _3734 = _3828;
            if (!_3820)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3830 = _3738;
            _3740 = _3830;
            if (!_3820)
            {
                _3746 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3832 = _3746;
            bool _3834 = !_3820;
            _3748 = _3832;
            if (!_3834)
            {
                bool _3836 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3838 = isnan(_1985);
                bool _3840 = _3836 || _3838;
                bool _3842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3844 = _3840 || _3842;
                if (!_3844)
                {
                    float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3848 = _1985 + _3846;
                    float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3852 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3850;
                    float _3854 = 1.0 / _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3870 = _3868 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3874 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3876 = _3848 * _3854;
                    float _3878 = precise::clamp(_3876, 0.0, 1.0);
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3884 = fma(_3878, _3858, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3886 = fma(_3878, _3882, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3888 = fma(_3878, _3862, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3890 = fma(_3878, _3866, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3892 = fma(_3878, _3870, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3894 = fma(_3878, _3874, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3728 = _3886;
                    _3740 = _3892;
                    _3722 = _3884;
                    _3734 = _3890;
                    _3716 = _3888;
                    _3748 = _3894;
                    _3810 = true;
                }
                else
                {
                    _3728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3722 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3734 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3748 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3810 = false;
    float _3896 = _3728;
    float _3898 = _3740;
    float _3900 = _3722;
    float _3902 = _3734;
    float _3904 = _3716;
    float _3906 = _3748;
    float _3908 = fma(_3592, -0.5, 0.5);
    float _3910 = precise::clamp(_3908, 0.0, 1.0);
    float _3912 = -_3896;
    float _3914 = _3912 + _3898;
    float _3916 = -_3900;
    float _3918 = _3916 + _3902;
    float _3920 = -_3904;
    float _3922 = _3920 + _3906;
    bool _3924 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3926 = fma(_3910, _3914, _3896);
    float _3928 = fma(_3910, _3918, _3900);
    float _3930 = fma(_3910, _3922, _3904);
    float _3932 = _3926 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _3934 = fma(_3928, 0.298911988735198974609375, _3932);
    float _3936 = fma(_3930, 0.114477999508380889892578125, _3934);
    float _3938 = -_3936;
    float _3940 = _3928 + _3938;
    float _3942 = -_3936;
    float _3944 = _3926 + _3942;
    float _3946 = -_3936;
    float _3948 = _3930 + _3946;
    float _3950 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3952 = fma(_3940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    float _3956 = fma(_3948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    out.m_51.x = _3950;
    out.m_101.x = _3952;
    out.m_101.y = _3954;
    out.m_101.z = _3956;
    if (!_3924)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3958 = -_1963;
    float _3960 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3962 = -_1959;
    float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3966 = -_1550;
    float _3968 = _3966 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3970 = _3960 * _3960;
    float _3972 = fma(_3964, _3964, _3970);
    float _3974 = fma(_3968, _3968, _3972);
    float _3976 = sqrt(_3974);
    float _3978 = rsqrt(_3974);
    float _3980 = -_3976;
    float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3984 = _3982 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3986 = precise::clamp(_3984, 0.0, 1.0);
    float _3988 = _3964 * _3978;
    float _3990 = _3960 * _3978;
    float _3992 = abs(_3986);
    float _3994 = log2(_3992);
    float _3996 = _3968 * _3978;
    float _3998 = _3988 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4000 = _3592 * _3990;
    float _4002 = -_3990;
    float _4004 = -_3998;
    float _4006 = fma(_4002, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4004);
    float _4008 = fma(_3552, _3988, _4000);
    float _4010 = -_3996;
    float _4012 = fma(_4010, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4006);
    float _4014 = fma(_3556, _3996, _4008);
    float _4016 = precise::clamp(_4014, 0.0, 1.0);
    float _4018 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4020 = _4012 + _4018;
    float _4022 = _3994 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4024 = _4020 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4026 = precise::clamp(_4024, 0.0, 1.0);
    float _4028 = exp2(_4022);
    float _4030 = _4028 * _4026;
    float _4032 = _4016 * _4030;
    float _4034 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4036 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4038 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _4034;
    out.m_99.y = _4036;
    out.m_99.z = _4038;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3810 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4095 = as_type<float>(_136);
        out.gl_Position.z = _4095;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_53.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4165 = as_type<float>(_174);
        out.gl_Position.z = _4165;
    }
    if (_166)
    {
        return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _212 > 0.0;
    bool _220 = _214 > 0.0;
    float _222 = 0.0;
    float _224 = _214;
    int _226 = as_type<int>(_188);
    if (_218)
    {
        float _228 = rsqrt(_206);
        _222 = _228;
    }
    float _230 = _222;
    float _232 = 0.0;
    float _234 = 0.0;
    if (!_218)
    {
        _232 = 0.0;
        _234 = 0.0;
    }
    float _236 = _232;
    float _238 = _234;
    bool _240 = _216 > 0.0;
    float _242 = 0.0;
    float _244 = _238;
    float _246 = _236;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = _248;
    if (!_220)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _256 = _250;
    float _258 = _252;
    float _260 = _212;
    float _262 = _258;
    float _264 = _256;
    if (_220)
    {
        float _266 = rsqrt(_208);
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (!_220)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = _272;
    if (!_240)
    {
        _274 = 0.0;
        _276 = 0.0;
    }
    float _280 = _274;
    float _282 = _276;
    float _284 = _216;
    float _286 = _282;
    float _288 = _280;
    if (_240)
    {
        float _290 = rsqrt(_210);
        _284 = _290;
    }
    float _292 = _284;
    if (_218)
    {
        float _294 = _230 * _176;
        _244 = _294;
    }
    float _296 = _244;
    if (_218)
    {
        float _298 = _230 * _182;
        _254 = _298;
    }
    float _300 = _254;
    if (_218)
    {
        float _302 = _230 * _188;
        _246 = _302;
    }
    float _304 = _246;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _224 = 0.0;
    }
    float _308 = _224;
    float _310 = _308;
    if (_220)
    {
        float _312 = _268 * _178;
        _262 = _312;
    }
    float _314 = _262;
    if (_220)
    {
        float _316 = _268 * _184;
        _264 = _316;
    }
    float _318 = _264;
    if (_220)
    {
        float _320 = _268 * _190;
        _278 = _320;
    }
    float _322 = _278;
    if (_240)
    {
        float _324 = _292 * _180;
        _286 = _324;
    }
    float _326 = _286;
    if (_240)
    {
        float _328 = _292 * _186;
        _288 = _328;
    }
    float _330 = _288;
    if (_240)
    {
        float _332 = _292 * _192;
        _310 = _332;
    }
    float _334 = _310;
    bool _336 = !_306;
    float _354;
    if (!_336)
    {
        float _338 = in.m_61.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_120);
        float _360 = 1.0 / _358;
        float _362 = _154 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _374 = int(_372);
    float _376 = in.m_61.x;
    float _378 = in.m_61.y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _382 = _380 != 0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _386 = _364 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _388;
    float _392 = in.m_63.y;
    float _394 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _396 = int(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _364 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = _364 + _412;
    float _416 = float(_374);
    float _418 = 1.0 / _390;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _424 = _364 + _422;
    float _426 = in.m_59.w;
    float _428 = _190 * _368;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _434 = 1.0 / _404;
    float _436 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _438 = fma(_188, _366, _428);
    if (_382)
    {
        _226 = 0;
    }
    int _440 = _226;
    float _442 = _184 * _368;
    float _444 = fma(_436, -2.0, _406);
    int _446 = _440;
    if (!_382)
    {
        _446 = 1;
    }
    int _448 = _446;
    float _450 = in.m_61.z;
    float _452 = 1.0 / _400;
    float _454 = fma(_182, _366, _442);
    bool _456 = _448 != 1;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _460 = _364 + _458;
    float _462 = fma(_192, _370, _438);
    float _464 = fma(_186, _370, _454);
    float _466 = _368 + _392;
    float _468 = 1.0 / _432;
    float _470 = _460 * _434;
    float _472 = _376 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _474 = float(_396);
    float _476 = _424 * _418;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _478;
    float _482 = _460;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_456)
    {
        _482 = _378;
    }
    float _486 = _482;
    float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _490 = log2(_488);
    float _492 = _376 * 2.0;
    float _494 = _486;
    if (_456)
    {
        _494 = _376;
    }
    float _496 = _494;
    float _498 = -_420;
    float _500 = fma(_472, 2.0, _498);
    float _502 = _414 * _452;
    float _504 = -_154;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[76].x, _500);
    float _508 = floor(_492);
    float _510 = _386 * _468;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _514 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _444);
    float _516 = in.m_57.w;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _520 = 1.0 + _518;
    float _522 = 1.0 / _480;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _526 = _524;
    float _528 = _496;
    if (!_456)
    {
        _484 = _378;
    }
    float _530 = _484;
    float _532 = _490 * _154;
    float _534 = _530;
    if (_456)
    {
        _534 = _376;
    }
    float _536 = _534;
    float _538 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[83].z, _524);
    if (!_456)
    {
        _526 = _450;
    }
    float _540 = _526;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _542;
    bool _546 = _508 > 0.0;
    float _548 = _536 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _550 = 1.0 / _416;
    bool _552 = _508 >= 0.0;
    bool _554 = isnan(_508);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _538);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _566 = _540;
    if (_456)
    {
        _566 = _378;
    }
    float _568 = _566;
    float _570 = _410 * _522;
    if (!_456)
    {
        _528 = _450;
    }
    float _572 = _528;
    float _574 = exp2(_532);
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _578 = _572;
    if (_456)
    {
        _578 = _378;
    }
    float _580 = _578;
    float _582 = _568 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _584 = -_564;
    float _586 = fma(_548, 2.0, _584);
    float _588 = _450 * 2.0;
    float _590 = fma(_582, -2.0, _576);
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _594 = int(_592);
    float _596 = _550 * _154;
    bool _598 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _600 = isnan(1.0);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _606 = _602 || _604;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _618 = _614 || _616;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _622 = -_154;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _586);
    float _626 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _628 = int(_626);
    float _630 = -_574;
    float _632 = _630 + 1.0;
    float _634 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _608);
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _646 = _644 != 0;
    float _648 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _590);
    float _650 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _634);
    float _652 = _618 ? _632 : 0.0;
    float _654 = 1.0 / _474;
    float _656 = float(_594);
    float _658 = _462 + _426;
    bool _660 = !_642;
    int _662 = _660 ? 0 : 1;
    float _664 = _464 + _516;
    bool _666 = !_638;
    int _668 = _666 ? 0 : 1;
    float _670 = _656 * _154;
    bool _672 = !_646;
    int _674 = _672 ? 0 : 1;
    float _676 = floor(_588);
    float _678 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[83].w, _512);
    float _680 = _378 * 2.0;
    float _682 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _684 = float(_628);
    float _686 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _678);
    float _688 = _376 + _450;
    float _690 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _682);
    float _692 = 1.0 / _520;
    int _694 = _560 ? 0 : 1;
    float _696 = _654 * _154;
    float _698 = _688 + (-1.0);
    int _700 = ~_694;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    int _706 = _704;
    if (!_546)
    {
        int _708 = ~_694;
        int _710 = _708 + 1;
        _706 = _710;
    }
    int _712 = _706;
    float _714 = floor(_680);
    bool _716 = _676 >= 0.0;
    bool _718 = isnan(_676);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = _684 * _154;
    float _728 = _376 + _378;
    bool _730 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _732 = isnan(_364);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _748 = _746 != 0;
    float _750 = _728 + (-1.0);
    if (_606)
    {
        float _752 = _652 * _692;
        _156 = _752;
    }
    float _754 = _156;
    float _756 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _758 = _724 ? 0 : 1;
    float _760 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _762 = !_748;
    int _764 = _762 ? 0 : 1;
    float _766 = _378 + _450;
    bool _768 = !_744;
    int _770 = _768 ? 0 : 1;
    bool _772 = _714 >= 0.0;
    bool _774 = isnan(_714);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _766 + (-1.0);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _794 = _792 != 0;
    int _796 = _780 ? 0 : 1;
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _802 = _800 != 0;
    bool _804 = !_786;
    int _806 = _804 ? 0 : 1;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _814 = _812 != 0;
    bool _816 = _676 > 0.0;
    int _818 = ~_758;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _828;
    float _832 = fma(_826, _502, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _838 = _822;
    if (!_816)
    {
        int _840 = ~_758;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _862 = fma(_848, _502, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _864 = fma(_830, _502, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _874 = fma(_836, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _876 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _878 = isnan(_364);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_868, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _890 = fma(_872, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _892 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _894 = isnan(_364);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _904;
    bool _908 = _714 > 0.0;
    float _910 = fma(_852, _476, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _912 = fma(_856, _510, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _914 = -_902;
    float _916 = _914 + 1.0;
    bool _918 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _920 = isnan(_364);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = fma(_906, _476, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _932 = fma(_544, _476, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _934 = _886 * _916;
    float _936 = -_886;
    float _938 = _936 + 1.0;
    bool _940 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _942 = isnan(_364);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _956 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _958 = isnan(_364);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = _928 * _938;
    float _970 = -_928;
    float _972 = _970 + 1.0;
    float _974 = fma(_954, _510, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _976 = -_966;
    float _978 = _976 + 1.0;
    float _980 = -_950;
    float _982 = _980 + 1.0;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _984;
    float _988 = fma(_860, _510, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _990 = _966 * _972;
    float _992 = _950 * _978;
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _996 = in.m_65.x;
    float _998 = in.m_65.y;
    float _1000 = in.m_65.z;
    float _1002 = fma(_986, _570, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1004 = _740 * _982;
    int _1006 = abs(_806);
    float _1008 = -_740;
    float _1010 = _1008 + 1.0;
    float _1012 = _832 * _1004;
    float _1014 = float(_1006);
    float _1016 = _864 * _1004;
    float _1018 = float(_844);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1020;
    float _1024 = _862 * _1004;
    float _1026 = _754 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1028 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1012);
    float _1030 = _1014 * _1018;
    float _1032 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1024);
    float _1034 = _1026 * _994;
    float _1036 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1016);
    float _1038 = _1030 * (-2.0);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1042 = _466 + _1040;
    float _1044 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1034);
    int _1046 = ~_796;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    float _1052 = fma(_760, _1038, _760);
    float _1054 = _1042 * _1042;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _664 + _1056;
    int _1060 = _1050;
    if (!_908)
    {
        int _1062 = ~_796;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_1038, _996, _996);
    bool _1070 = !_790;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = _1044 + 0.25;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = _658 + _1076;
    float _1080 = fma(_1058, _1058, _1054);
    float _1082 = fma(_1022, _570, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1084 = floor(_1074);
    int _1086 = abs(_1072);
    float _1088 = fma(_1078, _1078, _1080);
    float _1090 = fma(_874, _992, _1028);
    bool _1092 = !_794;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = fma(_890, _992, _1036);
    float _1098 = float(_1066);
    float _1100 = floor(_1044);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _1102;
    float _1106 = float(_712);
    float _1108 = fma(_910, _990, _1090);
    float _1110 = float(_1086);
    float _1112 = fma(_1104, _570, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _1114 = abs(_1094);
    float _1116 = _376 + (-0.5);
    float _1118 = rsqrt(_1088);
    float _1120 = -_1084;
    float _1122 = _1074 + _1120;
    float _1124 = _1044 * 6.283185482025146484375;
    float _1126 = float(_1114);
    float _1128 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1068);
    bool _1130 = !_810;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = _1124 * 0.15915493667125701904296875;
    float _1136 = _1110 * _1106;
    float _1138 = -_1100;
    float _1140 = _1044 + _1138;
    int _1142 = abs(_1132);
    float _1144 = _1126 * _1098;
    bool _1146 = _1122 > 0.5;
    float _1148 = _1134 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    bool _1152 = _1140 >= 0.5;
    bool _1154 = isnan(_1140);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    float _1162 = fma(_1052, _754, _1128);
    float _1164 = _1042 * _1118;
    float _1166 = _1058 * _1118;
    bool _1168 = !_802;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = fma(_888, _992, _1032);
    float _1174 = -_1164;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1178 = -_1166;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    bool _1182 = !_1160;
    float _1184 = _1182 ? 0.5 : (-0.5);
    float _1186 = fma(_932, _990, _1096);
    float _1188 = _1176 * _1176;
    int _1190 = abs(_1170);
    float _1192 = _1122;
    if (_1146)
    {
        float _1194 = -_1122;
        float _1196 = _1194 + 1.0;
        _1192 = _1196;
    }
    float _1198 = _1192;
    bool _1200 = !_814;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = fma(_1180, _1180, _1188);
    float _1206 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1208 = _1206 * 2.0;
    float _1210 = float(_1142);
    float _1212 = _1078 * _1118;
    int _1214 = abs(_1202);
    float _1216 = fma(_912, _968, _1108);
    float _1218 = fma(_930, _990, _1172);
    float _1220 = -_1212;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1224 = _1210 * _1208;
    float _1226 = float(_1190);
    float _1228 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1230 = fma(_1222, _1222, _1204);
    float _1232 = fma(_1198, 4.0, -1.0);
    float _1234 = fma(_1226, _1228, _1224);
    float _1236 = float(_1214);
    float _1238 = _1144 * (-2.0);
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1242 = _450 + (-0.5);
    float _1244 = _1136 * (-2.0);
    float _1246 = fma(_1238, _1000, _1000);
    float _1248 = fma(_1236, _1240, _1234);
    float _1250 = fma(_756, _1238, _756);
    float _1252 = _378 + (-0.5);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1246);
    float _1256 = fma(_1248, 3.1415927410125732421875, _998);
    float _1258 = fma(_798, _1244, _798);
    float _1260 = sqrt(_1230);
    float _1262 = fma(_1250, _754, _1254);
    float _1264 = fma(_1256, _1244, _1256);
    float _1266 = fma(_988, _968, _1186);
    float _1268 = in.m_67.x;
    float _1270 = in.m_67.y;
    float _1272 = in.m_67.z;
    float _1274 = fma(_1002, _934, _1216);
    float _1276 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1264);
    float _1278 = fma(_974, _968, _1218);
    float _1280 = in.m_69.x;
    float _1282 = in.m_69.y;
    float _1284 = in.m_69.z;
    float _1286 = _1162 * 0.15915493667125701904296875;
    float _1288 = fma(_1258, _754, _1276);
    float _1290 = _1262 * 0.15915493667125701904296875;
    float _1292 = fma(_1112, _934, _1266);
    float _1294 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1274);
    float _1296 = _1288 * 0.15915493667125701904296875;
    float _1298 = fma(_1082, _934, _1278);
    float _1300 = _1286 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1292);
    float _1306 = _1118 * _1260;
    float _1308 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1298);
    float _1310 = _1286 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1294 * _1268;
    float _1316 = _1304 * _1272;
    float _1318 = _1308 * _1270;
    float _1320 = _1290 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1332 = _1306 * _1324;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1280);
    float _1336 = _1306 * _1326;
    float _1338 = _1296 * 6.283185482025146484375;
    float _1340 = sin(_1338);
    float _1342 = _1306 * _1328;
    float _1344 = _1334 * _1332;
    float _1346 = _1330 * _1336;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1282);
    float _1350 = _1296 * 6.283185482025146484375;
    float _1352 = cos(_1350);
    float _1354 = _1312 * _1322;
    float _1356 = _1302 * _1322;
    float _1358 = _1348 * _1342;
    float _1360 = _1354 * _1346;
    float _1362 = _1290 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = _1302 * _1340;
    float _1368 = _1312 * _1340;
    float _1370 = _1312 * _1352;
    float _1372 = _1302 * _1352;
    float _1374 = _1340 * _1322;
    float _1376 = _1352 * _1322;
    float _1378 = fma(_1364, _1370, _1366);
    float _1380 = -_1346;
    float _1382 = _1364 * _1380;
    float _1384 = -_1372;
    float _1386 = fma(_1364, _1368, _1384);
    float _1388 = -_1368;
    float _1390 = fma(_1364, _1372, _1388);
    float _1392 = fma(_1378, _1344, _1360);
    float _1394 = _1356 * _1346;
    float _1396 = fma(_1376, _1344, _1382);
    float _1398 = fma(_1364, _1366, _1370);
    float _1400 = -_1358;
    float _1402 = fma(_1386, _1400, _1392);
    float _1404 = fma(_1390, _1344, _1394);
    float _1406 = -_1358;
    float _1408 = fma(_1374, _1406, _1396);
    float _1410 = _1402 * _322;
    float _1412 = -_1358;
    float _1414 = fma(_1398, _1412, _1404);
    float _1416 = _1402 * _318;
    float _1418 = fma(_1408, _304, _1410);
    float _1420 = fma(_1408, _300, _1416);
    float _1422 = fma(_1414, _334, _1418);
    float _1424 = fma(_1414, _330, _1420);
    float _1426 = _658 + _1422;
    float _1428 = _664 + _1424;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1426 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1428 + _1434;
    float _1438 = _1432 * _1432;
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = _1402 * _314;
    float _1444 = sqrt(_1440);
    float _1446 = fma(_1408, _296, _1442);
    float _1448 = fma(_1414, _326, _1446);
    float _1450 = _466 + _1448;
    bool _1452 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1460 = _1458 != 0;
    bool _1462 = !_1456;
    int _1464 = _1462 ? 0 : 1;
    bool _1466 = !_1460;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1446;
    float _1472 = _1428;
    float _1474 = _1426;
    if (!_1452)
    {
        _1470 = _1450;
    }
    float _1476 = _1470;
    bool _1478 = !_1452;
    float _1480 = _1476;
    if (!_1478)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1486 = _1444 + _1484;
        float _1488 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = rsqrt(_1440);
        float _1492 = _1486 * _1482;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = _1494 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        float _1500 = _1494 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1498 + (-1.0);
        float _1506 = fma(_1502, _1488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1508 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = _1490 * _1506;
        float _1512 = fma(_1450, _1498, _1508);
        float _1514 = fma(_1436, _1510, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = fma(_1432, _1510, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1472 = _1514;
        _1474 = _1516;
        _1480 = _1512;
    }
    float _1518 = _1472;
    float _1520 = _1474;
    float _1522 = _1480;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1526 = _1518 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1530 = _1520 + _1528;
    float _1532 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1534 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6223 = float2(_1532, _1534);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6223, float2(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6223, float2(0.0), isnan(_6223)), level(0.0)).x;
    float _1538 = float(uint(_594));
    float _1540 = trunc(_596);
    int _1542 = int(_1540);
    int _1544 = ~_594;
    int _1546 = _1544 + 1;
    float _1548 = -_1212;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1554 = _1552 != 0;
    float _1556 = -_1166;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _1560 = float(uint(_628));
    float _1562 = -_1212;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _658);
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1568 = _1566 != 0;
    float _1570 = 1.0 / _1538;
    float _1572 = in.m_71.y;
    int _1574 = abs(_662);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1578 = _1576 != 0;
    int _1580 = abs(_1464);
    float _1582 = 1.0 / _1560;
    float _1584 = float(uint(_1542));
    float _1586 = _1538;
    float _1588 = _1572;
    if (_1554)
    {
        _1586 = 1.0;
    }
    float _1590 = _1586;
    float _1592 = _1590;
    if (!_1554)
    {
        _1592 = 7.345489978790283203125;
    }
    float _1594 = _1592;
    int _1596 = ~_594;
    int _1598 = _1596 + 1;
    float _1600 = trunc(_696);
    int _1602 = int(_1600);
    int _1604 = as_type<int>(_1570) + (-2);
    float _1606 = as_type<float>(_1604) * _1584;
    float _1608 = trunc(_1606);
    float _1610 = precise::max(_1608, 0.0);
    uint _1613 = uint(_1610);
    float _1615 = float(uint(_1602));
    float _1617 = _1594 * _376;
    float _1619 = float(_120);
    int _1621 = ~_594;
    int _1623 = _1621 + 1;
    int _1625 = _1546 * int(_1613);
    int _1627 = _1625 + _1542;
    int _1629 = as_type<int>(_1582) + (-2);
    float _1631 = floor(_1617);
    float _1633 = float(uint(_1627));
    float _1635 = as_type<float>(_1629) * _1615;
    float _1637 = as_type<float>(_1604) * _1633;
    float _1639 = 1.0 / _1619;
    float _1641 = _1633;
    if (_1554)
    {
        float _1643 = in.m_61.x;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = _1645;
    if (!_1554)
    {
        float _1649 = in.m_61.y;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = -_1631;
    float _1655 = _1617 + _1653;
    float _1657 = trunc(_1637);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    int _1663 = ~_628;
    int _1665 = _1663 + 1;
    float _1667 = trunc(_1635);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = _670 * _1639;
    float _1675 = _726 * _1639;
    int _1677 = _628 + (-1);
    int _1679 = int(_1613) + int(_1661);
    float _1681 = trunc(_1673);
    int _1683 = int(_1681);
    float _1685 = float(_1542);
    int _1687 = _1623 * _1679;
    int _1689 = _1687 + _1542;
    bool _1691 = _1685 >= _656;
    bool _1693 = isnan(_1685);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(_656);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = _1655 * _656;
    float _1705 = trunc(_1675);
    int _1707 = int(_1705);
    bool _1709 = uint(_1689) >= uint(_594);
    float _1711 = as_type<float>(_1665);
    if (_1554)
    {
        _1711 = 1.0;
    }
    float _1713 = _1711;
    int _1715 = _1665 * int(_1671);
    int _1717 = _1715 + _1602;
    bool _1719 = !_1709;
    int _1721 = _1719 ? 0 : (-1);
    bool _1723 = _594 == 0;
    float _1725 = trunc(_1701);
    int _1727 = int(_1725);
    int _1729 = ~_1679;
    int _1731 = _1729 + _1721;
    int _1733 = _1731 + 1;
    float _1735 = float(uint(_1717));
    float _1737 = _1713;
    if (!_1554)
    {
        _1737 = 1.2345600128173828125;
    }
    float _1739 = _1737;
    int _1741 = _594 * _1733;
    int _1743 = _1741 + _1542;
    bool _1745 = !_1578;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = as_type<float>(_1629) * _1735;
    float _1751 = trunc(_1703);
    int _1753 = int(_1751);
    float _1755 = _1651 * _1739;
    bool _1757 = !_1723;
    int _1759 = _1757 ? _1743 : (-1);
    int _1761 = _594 + (-1);
    int _1763 = abs(_1747);
    int _1765 = ~_1727;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    float _1771 = trunc(_1749);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    int _1777 = abs(_668);
    int _1779 = _1759 * _1769;
    bool _1781 = !_1568;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = _1753 * _1763;
    int _1787 = _1785 + _1542;
    bool _1789 = _628 == 0;
    int _1791 = _1727 * _1761;
    int _1793 = _1791 + _1779;
    int _1795 = abs(_674);
    int _1797 = _1793 * _1574;
    int _1799 = abs(_1783);
    int _1801 = _1683 * _1777;
    int _1803 = _1801 + _1797;
    int _1805 = ~_628;
    int _1807 = _1805 + 1;
    int _1809 = int(_1671) + int(_1775);
    int _1811 = _1787 * _1795;
    int _1813 = _1811 + _1803;
    float _1815 = float(_1602);
    float _1817 = floor(_1755);
    int _1819 = _1753 * _1799;
    int _1821 = _1819 + _1813;
    int _1823 = _1807 * _1809;
    int _1825 = _1823 + _1602;
    bool _1827 = _1815 >= _684;
    bool _1829 = isnan(_1815);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(_684);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = float(uint(_1821));
    bool _1841 = uint(_1825) >= uint(_628);
    float _1843 = trunc(_1837);
    int _1845 = int(_1843);
    float _1847 = as_type<float>(_1604) * _1839;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : (-1);
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1855 = _1853 != 0;
    float _1857 = -_1817;
    float _1859 = _1755 + _1857;
    int _1861 = ~_1809;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = trunc(_1847);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = ~_594;
    int _1875 = _1873 + 1;
    float _1877 = _684 * _1859;
    int _1879 = _628 * _1865;
    int _1881 = _1879 + _1602;
    int _1883 = ~_1845;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1877);
    int _1891 = int(_1889);
    bool _1893 = !_1789;
    int _1895 = _1893 ? _1881 : (-1);
    int _1897 = _1887 * _1895;
    bool _1899 = !_1855;
    int _1901 = _1899 ? 0 : 1;
    int _1903 = _1875 * int(_1871);
    int _1905 = _1903 + _1821;
    int _1907 = _1845 * _1677;
    int _1909 = _1907 + _1897;
    int _1911 = abs(_764);
    int _1913 = abs(_1901);
    int _1915 = abs(_770);
    int _1917 = _1909 * _1911;
    int _1919 = abs(_1468);
    int _1921 = _1891 * _1913;
    int _1923 = _1921 + _1602;
    float _1925 = float(uint(_1905));
    int _1927 = _1707 * _1915;
    int _1929 = _1927 + _1917;
    int _1931 = _1923 * _1580;
    int _1933 = _1931 + _1929;
    float _1935 = as_type<float>(_1604) * _1925;
    int _1937 = _1891 * _1919;
    int _1939 = _1937 + _1933;
    float _1941 = trunc(_1935);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    float _1947 = float(uint(_1939));
    int _1949 = int(_1871) + int(_1945);
    int _1951 = _1598 * _1949;
    int _1953 = _1951 + _1821;
    float _1955 = fma(_1536, 100.0, _1522);
    float _1957 = -_1166;
    float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    float _1961 = -_1164;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1955);
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1967 = _1959 + _1965;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1971 = _1550 + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1975 = _1963 + _1973;
    float _1977 = _1975 * _1975;
    float _1979 = fma(_1967, _1967, _1977);
    float _1981 = fma(_1971, _1971, _1979);
    float _1983 = rsqrt(_1981);
    float _1985 = sqrt(_1981);
    float _1987 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1989 = _1967 * _1987;
    float _1991 = _1971 * _1987;
    float _1993 = _1989 * _1989;
    float _1995 = _1991 * _1991;
    float _1997 = _1993 + _1995;
    float _1999 = sqrt(_1997);
    bool _2001 = _1999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2005 = _1999 + _2003;
    float _2007 = _1971;
    float _2009 = _2005;
    float _2011 = _1977;
    float _2013 = _1975;
    float _2015 = as_type<float>(_1871);
    if (_2001)
    {
        float _2017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2007 = _2017;
    }
    float _2019 = _2007;
    if (_2001)
    {
        float _2021 = _2005 * _2019;
        _2009 = _2021;
    }
    float _2023 = _2009;
    if (_2001)
    {
        float _2025 = _2023 * 0.15915493667125701904296875;
        _2011 = _2025;
    }
    float _2027 = _2011;
    float _2029 = as_type<float>(_764);
    float _2031 = _2027;
    if (_2001)
    {
        float _2033 = _2027 * 6.283185482025146484375;
        float _2035 = sin(_2033);
        _2029 = _2035;
    }
    float _2037 = _2029;
    float _2039 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2041 = precise::max(0.0, _2039);
    float _2043 = _1983;
    float _2045 = _2041;
    if (_2001)
    {
        float _2047 = _2027 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        _2043 = _2049;
    }
    float _2051 = _2043;
    float _2053 = -_1987;
    float _2055 = -_2041;
    float _2057 = fma(_1975, _2053, _2055);
    float _2059 = _2039;
    if (_2001)
    {
        float _2061 = rsqrt(_1997);
        _2059 = _2061;
    }
    float _2063 = _2059;
    if (_2001)
    {
        float _2065 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2045 = _2065;
    }
    float _2067 = _2045;
    float _2069 = _2067;
    if (!_2001)
    {
        _2031 = _1993;
    }
    float _2071 = _2031;
    float _2073 = _2037;
    float _2075 = _2071;
    if (_2001)
    {
        float _2077 = fma(_2037, _2067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2069 = _2077;
    }
    float _2079 = _2069;
    float _2081 = _2079;
    float _2083 = _2051;
    if (_2001)
    {
        float _2085 = _2051 + (-1.0);
        _2013 = _2085;
    }
    float _2087 = _2013;
    float _2089 = _2087;
    if (_2001)
    {
        float _2091 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2091;
    }
    float _2093 = _2015;
    if (!_2001)
    {
        _2089 = _1991;
    }
    float _2095 = _2089;
    float _2097 = _2063;
    float _2099 = _2095;
    if (_2001)
    {
        float _2101 = _2063 * _2079;
        _2073 = _2101;
    }
    float _2103 = _2073;
    if (!_2001)
    {
        _2081 = _1989;
    }
    float _2105 = _2081;
    float _2107 = _2105;
    if (!_2001)
    {
        _2097 = _2057;
    }
    float _2109 = _2097;
    float _2111 = _2109;
    if (_2001)
    {
        float _2113 = _1989 * _2103;
        _2107 = _2113;
    }
    float _2115 = _2107;
    if (_2001)
    {
        float _2117 = fma(_2057, _2051, _2093);
        _2111 = _2117;
    }
    float _2119 = _2111;
    if (_2001)
    {
        float _2121 = _1991 * _2103;
        _2099 = _2121;
    }
    float _2123 = _2099;
    if (!_2001)
    {
        _2083 = _1995;
    }
    float _2125 = _2083;
    float _2127 = _2125;
    if (_2001)
    {
        float _2129 = _2115 * _2115;
        _2075 = _2129;
    }
    float _2131 = _2075;
    if (_2001)
    {
        float _2133 = _2123 * _2123;
        _2127 = _2133;
    }
    float _2135 = _2127;
    float _2137 = fma(_2119, _2119, _2131);
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2141 = _2139 != 0;
    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2145 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2143);
    float _2147 = precise::clamp(_2145, 0.0, 1.0);
    float _2149 = _2137 + _2135;
    float _2151 = -_2147;
    float _2153 = _2151 + 1.0;
    float _2155 = rsqrt(_2149);
    float _2157 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2159 = floor(_2157);
    float _2161 = abs(_2153);
    float _2163 = log2(_2161);
    float _2165 = _2155 * _2115;
    float _2167 = _2155 * _2119;
    float _2169 = _2155 * _2123;
    float _2171 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2173 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2175 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2177 = -_2159;
    float _2179 = _2157 + _2177;
    float _2181 = -_2173;
    float _2183 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2181);
    float _2185 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2187 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2189 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2191 = -_2169;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2183);
    float _2195 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2197 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2187);
    float _2199 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2201 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2189);
    float _2203 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2195);
    float _2205 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2197);
    float _2207 = floor(_2171);
    float _2209 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2201);
    float _2211 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2203);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2215 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2175);
    float _2217 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2219 = _2211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2221 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2223 = exp2(_2199);
    float _2225 = fma(_2193, -0.5, 0.5);
    float _2227 = fma(_2193, 0.5, 0.5);
    float _2229 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2215);
    float _2231 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2221);
    float _2233 = _2167 + 1.0;
    float _2235 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2237 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2239 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2231);
    float _2241 = sqrt(_2225);
    float _2243 = -_2235;
    float _2245 = fma(_2243, _2185, 1.0);
    float _2247 = -_2207;
    float _2249 = _2171 + _2247;
    float _2251 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2253 = fma(_2227, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2255 = log2(_2245);
    float _2257 = -_2167;
    float _2259 = fma(_2223, _2233, _2257);
    float _2261 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2239);
    float _2263 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2265 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2251);
    float _2267 = fma(_2227, _2253, -0.212114393711090087890625);
    float _2269 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2263);
    float _2271 = 1.0 / _2261;
    float _2273 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2275 = fma(_2227, _2267, 1.570728778839111328125);
    float _2277 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2269);
    float _2279 = _2241 * 0.636619746685028076171875;
    float _2281 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2273);
    float2 _7333 = float2(_2179, _2249);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7333, float2(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7333, float2(0.0), isnan(_7333)), level(0.0)).x;
    float _2285 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2287 = _2255 * 0.693147182464599609375;
    float _2289 = -_2275;
    float _2291 = fma(_2279, _2289, 1.0);
    float _2293 = fma(_2259, 0.5, 0.5);
    float _2295 = in.m_61.w;
    float _2297 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2299 = in.m_71.x;
    float _2301 = _2285 * _2271;
    float _2303 = _2281 * _2271;
    float _2305 = fma(_2301, 0.5, 0.5);
    float _2307 = fma(_2303, -0.5, 0.5);
    float3 _7375 = float3(_2305, _2307, _2297);
    float _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7375, float3(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7375, float3(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2305, _2307, _2297);
    float4 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).xyzw;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = _2312.w;
    float2 _7402 = float2(_2291, _2293);
    float3 _2324 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7402, float2(0.0), isnan(_7402)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7402, float2(0.0), isnan(_7402)), level(0.0)).xyz;
    float _2326 = _2324.x;
    float _2328 = _2324.y;
    float _2330 = _2324.z;
    float _2332 = as_type<float>(_1629) * _1947;
    bool _2334 = uint(_1953) >= uint(_594);
    float _2336 = as_type<float>(_1190);
    float _2338 = _2297;
    int _2340 = as_type<int>(_2249);
    float _2342 = _2332;
    float _2344 = _2261;
    float _2346 = _2281;
    if (_2141)
    {
        float _2348 = in.m_61.x;
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = float(uint(_1787));
    float _2354 = trunc(_2332);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    bool _2360 = !_2334;
    int _2362 = _2360 ? 0 : (-1);
    float _2364 = fma(_1536, 100.0, _466);
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2368 = _2366 != 0;
    float _2370 = as_type<float>(_1604) * _2352;
    int _2372 = ~_1949;
    int _2374 = _2372 + _2362;
    int _2376 = _2374 + 1;
    float _2378 = -_1164;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2364);
    int _2382 = ~_628;
    int _2384 = _2382 + 1;
    float _2386 = -_1572;
    float _2388 = _2386 + 1.0;
    bool _2390 = _378 > 0.5;
    float _2392 = trunc(_2370);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    bool _2398 = _2295 > 0.5;
    int _2400 = _594 * _2376;
    int _2402 = _2400 + _1821;
    int _2404 = _2390 ? as_type<int>(_2388) : as_type<int>(_1572);
    float _2406 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2410 = _2408 != 0;
    int _2412 = _2384 * int(_2358);
    int _2414 = _2412 + _1939;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2418 = _2416 != 0;
    out.m_73.x = _1959;
    out.m_73.y = _1963;
    out.m_73.z = _1550;
    float _2420 = _2410 ? as_type<float>(_2404) : _1572;
    float _2422 = exp2(_2406);
    float _2424 = float(uint(_2414));
    int _2426 = _2414;
    bool _2428 = _2398;
    bool _2430 = _2410;
    if (_2141)
    {
        float _2432 = -_2299;
        float _2434 = _2432 + 1.0;
        _2426 = as_type<int>(_2434);
    }
    int _2436 = _2426;
    if (_2368)
    {
        float _2438 = _2398 ? _2388 : _1572;
        _1588 = _2438;
    }
    float _2440 = _1588;
    int _2442 = ~_594;
    int _2444 = _2442 + 1;
    float _2446 = as_type<float>(_1629) * _2424;
    if (_2141)
    {
        bool _2448 = _2350 > 0.5;
        _2428 = _2448;
    }
    bool _2450 = _2428;
    bool _2452 = !_1723;
    float _2454 = _2452 ? as_type<float>(_2402) : as_type<float>(0xffffffffu /* nan */);
    int _2456 = _2444 * int(_2396);
    int _2458 = _2456 + _1787;
    float _2460 = _2454;
    if (!_2141)
    {
        _2338 = _2299;
    }
    float _2462 = _2338;
    float _2464 = trunc(_2446);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    float _2470 = _2462;
    if (_2141)
    {
        float _2472 = _2450 ? as_type<float>(_2436) : _2299;
        _2470 = _2472;
    }
    float _2474 = _2470;
    if (_2418)
    {
        float _2476 = -_2299;
        float _2478 = _2476 + 1.0;
        _2340 = as_type<int>(_2478);
    }
    int _2480 = _2340;
    int _2482 = as_type<int>(_2454) & 3;
    bool _2484 = _2482 != 0;
    float _2486 = -_2422;
    float _2488 = _2486 + 1.0;
    if (_2418)
    {
        bool _2490 = _450 > 0.5;
        _2430 = _2490;
    }
    bool _2492 = _2430;
    float _2494 = float(uint(_2458));
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2498 = uint(_2482) > 1u;
    float _2500 = float(uint(_1923));
    float _2502 = as_type<float>(_1604) * _2494;
    if (!_2418)
    {
        _2342 = _2299;
    }
    float _2504 = _2342;
    float _2506 = _2504;
    if (_2418)
    {
        float _2508 = _2492 ? as_type<float>(_2480) : _2299;
        _2506 = _2508;
    }
    float _2510 = _2506;
    int _2512 = as_type<int>(_2454) & 3;
    bool _2514 = _2512 != 0;
    float _2516 = trunc(_2502);
    float _2518 = precise::max(_2516, 0.0);
    uint _2520 = uint(_2518);
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2528 = _2526 != 0;
    float _2530 = as_type<float>(_1629) * _2500;
    int _2532 = int(_2358) + int(_2468);
    int _2534 = ~_628;
    int _2536 = _2534 + 1;
    int _2538 = _2514 ? 0 : 1;
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    bool _2546 = uint(_2482) >= 2u;
    int _2548 = _2536 * _2532;
    int _2550 = _2548 + _1939;
    int _2552 = ~_2538;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    int _2558 = _2556;
    if (!_2498)
    {
        int _2560 = ~_2538;
        int _2562 = _2560 + 1;
        _2558 = _2562;
    }
    int _2564 = _2558;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2568 = _2546 ? 0 : 1;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2572 = uint(_2550) >= uint(_628);
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2576 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2578 = !_2572;
    float _2580 = _2578 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2582 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2584 = ~_628;
    int _2586 = _2584 + 1;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2590 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2592 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2594 = ~_2532;
    int _2596 = _2594 + as_type<int>(_2580);
    int _2598 = _2596 + 1;
    float _2600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2602 = ~_594;
    int _2604 = _2602 + 1;
    float _2606 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2608 = _2482 != 3;
    out.m_75.x = _2576;
    out.m_75.y = _2582;
    out.m_75.z = _2590;
    out.m_75.w = _2588;
    int _2610 = int(_2396) + int(_2520);
    int _2612 = _2586 * int(_2544);
    int _2614 = _2612 + _1923;
    int _2616 = _628 * _2598;
    int _2618 = _2616 + _1939;
    float _2620 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2622 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2624 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2626 = !_1789;
    int _2628 = _2626 ? _2618 : (-1);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    int _2630 = ~_2568;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2634;
    float _2638 = _2580;
    float _2640 = as_type<float>(_2586);
    if (_2608)
    {
        int _2642 = ~_2568;
        int _2644 = _2642 + 1;
        _2636 = _2644;
    }
    int _2646 = _2636;
    out.m_79.x = _2620;
    out.m_79.y = _2622;
    out.m_79.z = _2624;
    int _2648 = as_type<int>(_2454) >> 31;
    float _2650 = in.m_81.x;
    float _2652 = in.m_81.y;
    float _2654 = in.m_81.z;
    float _2656 = float(uint(_2614));
    int _2658 = _2604 * _2610;
    int _2660 = _2658 + _1787;
    int _2662 = _2648 & 3;
    bool _2664 = _1282 != 0.0;
    bool _2666 = isnan(_1282);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan(0.0);
    bool _2672 = _2668 || _2670;
    float _2674 = as_type<float>(_1629) * _2656;
    bool _2676 = uint(_2660) >= uint(_594);
    int _2678 = _2628 >> 31;
    int _2680 = as_type<int>(_2454) + _2662;
    float _2682 = trunc(_2674);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = in.m_83.x;
    float _2690 = in.m_83.y;
    float _2692 = in.m_83.z;
    float _2694 = in.m_83.w;
    int _2696 = _2678 & 3;
    bool _2698 = !_2676;
    int _2700 = _2698 ? 0 : (-1);
    int _2702 = _2680 >> 2;
    bool _2704 = _1280 == 0.0;
    bool _2706 = !_2672;
    bool _2708 = _2704 && _2706;
    int _2710 = _2628 & 3;
    bool _2712 = _2710 != 0;
    int _2714 = _2628 + _2696;
    int _2716 = _2702 << 4;
    int _2718 = _2716 + 368;
    bool _2720 = _1284 == 0.0;
    bool _2722 = _2720 && _2708;
    int _2724 = _2712 ? 0 : 1;
    bool _2726 = uint(_2710) >= 2u;
    int _2728 = _2714 >> 2;
    uint _2730 = uint(int(uint(_2718) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    int _2746 = _2726 ? 0 : 1;
    float _2748 = _2692 * _2650;
    int _2750 = _2728 << 4;
    int _2752 = _2750 + 512;
    bool _2754 = uint(_2710) > 1u;
    float _2756 = -_2748;
    float _2758 = fma(_2688, _2654, _2756);
    int _2760 = int(_2544) + int(_2686);
    uint _2762 = uint(int(uint(_2752) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[int(_2772)][_2774];
    float _2778 = _2758 * _2694;
    if (_2722)
    {
        _2638 = _2650;
    }
    float _2780 = _2638;
    float _2782 = _2780;
    if (!_2722)
    {
        float _2784 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2650);
        _2782 = _2784;
    }
    float _2786 = _2782;
    if (_2722)
    {
        _2460 = _2652;
    }
    float _2788 = _2460;
    float _2790 = _2788;
    if (!_2722)
    {
        float _2792 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2652);
        _2790 = _2792;
    }
    float _2794 = _2790;
    int _2796 = _2586 * _2760;
    int _2798 = _2796 + _1923;
    float _2800 = _2690 * _2654;
    int _2802 = ~_2724;
    int _2804 = _2802 + 1;
    int _2806 = _2804 + 1;
    int _2808 = _2806;
    if (!_2754)
    {
        int _2810 = ~_2724;
        int _2812 = _2810 + 1;
        _2808 = _2812;
    }
    int _2814 = _2808;
    float _2816 = -_2800;
    float _2818 = fma(_2692, _2652, _2816);
    bool _2820 = uint(_2798) >= uint(_628);
    float _2822 = _2688 * _2652;
    int _2824 = _2718 + 8;
    uint _2826 = uint(int(uint(_2824) >> uint(2)));
    uint _2828 = uint(int(uint(int(_2826)) >> uint(2)));
    int _2830 = int(_2826) & 3;
    float _2832 = (*spvDescriptorSet0.vp_c9)._m0[int(_2828)][_2830];
    int _2834 = int(_2826) + 1;
    uint _2836 = uint(int(uint(_2834) >> uint(2)));
    int _2838 = _2834 & 3;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[int(_2836)][_2838];
    if (_2722)
    {
        _2640 = _2654;
    }
    float _2842 = _2640;
    float _2844 = _2842;
    if (!_2722)
    {
        float _2846 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2654);
        _2844 = _2846;
    }
    float _2848 = _2844;
    float _2850 = -_2822;
    float _2852 = fma(_2690, _2650, _2850);
    bool _2854 = !_2820;
    int _2856 = _2854 ? 0 : (-1);
    float _2858 = _2818 * _2694;
    bool _2860 = _2710 != 3;
    float _2862 = _2852 * _2694;
    int _2864 = _2752 + 8;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
    int _2870 = int(_2866) & 3;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[int(_2868)][_2870];
    int _2874 = int(_2866) + 1;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    int _2878 = _2874 & 3;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[int(_2876)][_2878];
    bool _2882 = !_2484;
    int _2884 = _2882 ? 0 : 1;
    int _2886 = abs(_2564);
    int _2888 = _2628 & 3;
    bool _2890 = _2888 != 0;
    int _2892 = abs(_2884);
    int _2894 = ~_2886;
    int _2896 = _2894 + 1;
    int _2898 = _2896 + 1;
    float _2900 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2902 = int(_2900);
    int _2904 = ~_2610;
    int _2906 = _2904 + _2700;
    int _2908 = _2906 + 1;
    int _2910 = abs(_2814);
    float _2912 = _1354 * _2848;
    bool _2914 = _2482 != 3;
    int _2916 = _594 * _2908;
    int _2918 = _2916 + _1787;
    bool _2920 = !_2890;
    int _2922 = _2920 ? 0 : 1;
    int _2924 = _2898 * as_type<int>(_2744);
    int _2926 = ~_2892;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    int _2932 = ~_2760;
    int _2934 = _2932 + _2856;
    int _2936 = _2934 + 1;
    int _2938 = ~_2910;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    int _2944 = _2930 * as_type<int>(_2736);
    int _2946 = _2944 + _2924;
    int _2948 = ~_2746;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    float _2954 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2956 = int(_2954);
    bool _2958 = _2710 != 3;
    int _2960 = _2942 * as_type<int>(_2776);
    int _2962 = abs(_2922);
    float _2964 = -_2692;
    float _2966 = _1364 * _2964;
    int _2968 = _2952;
    if (_2860)
    {
        int _2970 = ~_2746;
        int _2972 = _2970 + 1;
        _2968 = _2972;
    }
    int _2974 = _2968;
    bool _2976 = !_2914;
    int _2978 = _2976 ? 0 : (-1);
    float _2980 = fma(_1376, _2688, _2966);
    int _2982 = abs(_2646);
    bool _2984 = !_2958;
    int _2986 = _2984 ? 0 : (-1);
    int _2988 = ~_2962;
    int _2990 = _2988 + 1;
    int _2992 = _2990 + 1;
    int _2994 = abs(_2974);
    int _2996 = abs(_2978);
    int _2998 = abs(_2986);
    int _3000 = _2992 * as_type<int>(_2768);
    int _3002 = _3000 + _2960;
    int _3004 = ~_2982;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    int _3010 = _3008 * as_type<int>(_2832);
    int _3012 = _3010 + _2946;
    int _3014 = ~_2994;
    int _3016 = _3014 + 1;
    int _3018 = _3016 + 1;
    float _3020 = _1356 * _2862;
    int _3022 = ~_2996;
    int _3024 = _3022 + 1;
    int _3026 = _3024 + 1;
    int _3028 = ~_2998;
    int _3030 = _3028 + 1;
    int _3032 = _3030 + 1;
    int _3034 = _3018 * as_type<int>(_2872);
    int _3036 = _3034 + _3002;
    float _3038 = float(uint(_2902));
    int _3040 = _3026 * as_type<int>(_2840);
    int _3042 = _3040 + _3012;
    bool _3044 = !_2524;
    int _3046 = _3044 ? 0 : 1;
    int _3048 = _3032 * as_type<int>(_2880);
    int _3050 = _3048 + _3036;
    bool _3052 = !_2528;
    int _3054 = _3052 ? 0 : 1;
    float _3056 = fma(_1390, _2858, _3020);
    int _3058 = abs(_3046);
    float _3060 = 1.0 / _3038;
    float _3062 = float(uint(_2956));
    int _3064 = abs(_3054);
    int _3066 = ~_3058;
    int _3068 = _3066 + 1;
    int _3070 = _3068 + 1;
    int _3072 = ~_3064;
    int _3074 = _3072 + 1;
    int _3076 = _3074 + 1;
    float _3078 = 1.0 / _3062;
    bool _3080 = !_1723;
    int _3082 = _3080 ? _2918 : (-1);
    int _3084 = _3042 * _3070;
    int _3086 = abs(_2902);
    int _3088 = _628 * _2936;
    int _3090 = _3088 + _1923;
    float _3092 = _1356 * _2692;
    int _3094 = _3076 * _3050;
    float _3096 = float(uint(_3086));
    int _3098 = _3082 * _3058;
    int _3100 = _3098 + _3084;
    float _3102 = _1354 * _2692;
    bool _3104 = !_1789;
    int _3106 = _3104 ? _3090 : (-1);
    float _3108 = -_2862;
    float _3110 = _1364 * _3108;
    int _3112 = abs(_2956);
    float _3114 = _1354 * _2862;
    int _3116 = as_type<int>(_3060) + (-2);
    float _3118 = -_2848;
    float _3120 = _1364 * _3118;
    float _3122 = float(uint(_3100));
    int _3124 = _3106 * _3064;
    int _3126 = _3124 + _3094;
    float _3128 = 1.0 / _3096;
    float _3130 = float(uint(_3112));
    float _3132 = fma(_1376, _2786, _3120);
    int _3134 = as_type<int>(_3078) + (-2);
    float _3136 = as_type<float>(_3116) * _3122;
    float _3138 = float(uint(_3126));
    float _3140 = _1356 * _2848;
    int _3142 = abs(_3100);
    float _3144 = 1.0 / _3130;
    float _3146 = fma(_1376, _2858, _3110);
    float _3148 = as_type<float>(_3134) * _3138;
    float _3150 = float(uint(_3142));
    float _3152 = fma(_1378, _2786, _2912);
    int _3154 = ~_2956;
    int _3156 = _3154 + 1;
    float _3158 = fma(_1378, _2858, _3114);
    float _3160 = -_2283;
    float _3162 = _3160 + 1.0;
    float _3164 = trunc(_3136);
    float _3166 = precise::max(_3164, 0.0);
    uint _3168 = uint(_3166);
    int _3170 = as_type<int>(_3128) + (-2);
    float _3172 = -_2794;
    float _3174 = fma(_1386, _3172, _3152);
    int _3176 = abs(_3126);
    float _3178 = _2496 * _2309;
    int _3180 = ~_2902;
    int _3182 = _3180 + 1;
    float _3184 = as_type<float>(_3170) * _3150;
    float _3186 = float(uint(_3176));
    float _3188 = trunc(_3148);
    float _3190 = precise::max(_3188, 0.0);
    uint _3192 = uint(_3190);
    int _3194 = as_type<int>(_3144) + (-2);
    float _3196 = fma(_1378, _2688, _3102);
    float _3198 = as_type<float>(_3194) * _3186;
    int _3200 = _3182 * int(_3168);
    int _3202 = _3200 + _3100;
    float _3204 = trunc(_3184);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    float _3210 = fma(_1390, _2786, _3140);
    int _3212 = ~_3086;
    int _3214 = _3212 + 1;
    float _3216 = -_2690;
    float _3218 = fma(_1386, _3216, _3196);
    float _3220 = float(uint(_3202));
    int _3222 = _3156 * int(_3192);
    int _3224 = _3222 + _3126;
    float _3226 = trunc(_3198);
    float _3228 = precise::max(_3226, 0.0);
    uint _3230 = uint(_3228);
    float _3232 = as_type<float>(_3116) * _3220;
    int _3234 = ~_3112;
    int _3236 = _3234 + 1;
    float _3238 = fma(_1390, _2688, _3092);
    float _3240 = float(uint(_3224));
    float _3242 = -_2794;
    float _3244 = fma(_1374, _3242, _3132);
    float _3246 = -_2690;
    float _3248 = fma(_1374, _3246, _2980);
    float _3250 = trunc(_3232);
    float _3252 = precise::max(_3250, 0.0);
    uint _3254 = uint(_3252);
    float _3256 = as_type<float>(_3134) * _3240;
    float _3258 = -_2778;
    float _3260 = fma(_1374, _3258, _3146);
    int _3262 = _3214 * int(_3208);
    int _3264 = _3262 + _3142;
    float _3266 = -_2794;
    float _3268 = fma(_1398, _3266, _3210);
    float _3270 = -_2690;
    float _3272 = fma(_1398, _3270, _3238);
    int _3274 = _3236 * int(_3230);
    int _3276 = _3274 + _3176;
    float _3278 = float(uint(_3264));
    float _3280 = trunc(_3256);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    float _3286 = float(uint(_3276));
    float _3288 = as_type<float>(_3170) * _3278;
    float _3290 = -_2778;
    float _3292 = fma(_1386, _3290, _3158);
    float _3294 = _3218 * _314;
    float _3296 = _3174 * _318;
    float _3298 = as_type<float>(_3194) * _3286;
    float _3300 = trunc(_3288);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    float _3306 = _3218 * _318;
    float _3308 = _3218 * _322;
    float _3310 = _3292 * _318;
    float _3312 = -_2778;
    float _3314 = fma(_1398, _3312, _3056);
    float _3316 = _3174 * _322;
    float _3318 = _3292 * _314;
    float _3320 = fma(_3248, _296, _3294);
    float _3322 = trunc(_3298);
    float _3324 = precise::max(_3322, 0.0);
    uint _3326 = uint(_3324);
    float _3328 = _3174 * _314;
    float _3330 = _3292 * _322;
    float _3332 = fma(_3248, _300, _3306);
    float _3334 = fma(_3248, _304, _3308);
    int _3336 = int(_3168) + int(_3254);
    float _3338 = fma(_3260, _300, _3310);
    int _3340 = ~_2902;
    int _3342 = _3340 + 1;
    float _3344 = fma(_3244, _304, _3316);
    int _3346 = int(_3192) + int(_3284);
    float _3348 = fma(_3314, _330, _3338);
    int _3350 = ~_2956;
    int _3352 = _3350 + 1;
    int _3354 = _3342 * _3336;
    int _3356 = _3354 + _3100;
    int _3358 = int(_3208) + int(_3304);
    float _3360 = fma(_3244, _300, _3296);
    int _3362 = ~_3086;
    int _3364 = _3362 + 1;
    int _3366 = _3352 * _3346;
    int _3368 = _3366 + _3126;
    int _3370 = int(_3230) + int(_3326);
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3374 = ~_3112;
    int _3376 = _3374 + 1;
    int _3378 = _3364 * _3358;
    int _3380 = _3378 + _3142;
    bool _3382 = uint(_3356) >= uint(_2902);
    bool _3384 = uint(_3368) >= uint(_2956);
    int _3386 = _3376 * _3370;
    int _3388 = _3386 + _3176;
    bool _3390 = !_3382;
    int _3392 = _3390 ? 0 : (-1);
    float _3394 = fma(_3260, _296, _3318);
    bool _3396 = uint(_3380) >= uint(_3086);
    float _3398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3400 = ~_3336;
    int _3402 = _3400 + _3392;
    int _3404 = _3402 + 1;
    float _3406 = fma(_3260, _304, _3330);
    bool _3408 = uint(_3388) >= uint(_3112);
    bool _3410 = !_3384;
    int _3412 = _3410 ? 0 : (-1);
    int _3414 = _2902 * _3404;
    int _3416 = _3414 + _3100;
    int _3418 = _3100 ^ _2902;
    float _3420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3422 = _3126 ^ _2956;
    float _3424 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3426 = ~_3346;
    int _3428 = _3426 + _3412;
    int _3430 = _3428 + 1;
    bool _3432 = _2902 == 0;
    float _3434 = fma(_3424, _2474, -0.5);
    bool _3436 = _2902 == 0;
    int _3438 = _2956 * _3430;
    int _3440 = _3438 + _3126;
    bool _3442 = !_3408;
    int _3444 = _3442 ? 0 : (-1);
    float _3446 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _3448 = uint(int(uint(_3422) >> uint(31)));
    bool _3450 = !_3396;
    int _3452 = _3450 ? 0 : (-1);
    uint _3454 = uint(int(uint(_3418) >> uint(31)));
    int _3456 = ~_3444;
    int _3458 = _3370 + _3456;
    int _3460 = _3458 + 1;
    bool _3462 = !_3432;
    int _3464 = _3462 ? _3416 : (-1);
    float _3466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3468 = ~int(_3448);
    int _3470 = _3468 + 1;
    int _3472 = ~_3452;
    int _3474 = _3358 + _3472;
    int _3476 = _3474 + 1;
    int _3478 = ~int(_3454);
    int _3480 = _3478 + 1;
    float _3482 = float(_3464);
    int _3484 = _3460 ^ _3470;
    int _3486 = _3476 ^ _3480;
    float _3488 = fma(_3424, _3482, _506);
    bool _3490 = _2956 == 0;
    bool _3492 = _2956 == 0;
    float _3494 = _3466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3496 = ~_3470;
    int _3498 = _3496 + _3484;
    int _3500 = _3498 + 1;
    float _3502 = fma(_690, _3434, _3488);
    int _3504 = ~_3480;
    int _3506 = _3504 + _3486;
    int _3508 = _3506 + 1;
    float _3510 = _3420 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3512 = !_3490;
    int _3514 = _3512 ? _3440 : (-1);
    float _3516 = fma(_3494, _2440, -0.5);
    bool _3518 = !_3492;
    int _3520 = _3518 ? _3500 : (-1);
    float _3522 = fma(_3510, _2510, -0.5);
    bool _3524 = !_3436;
    int _3526 = _3524 ? _3508 : (-1);
    float _3528 = float(_3514);
    float _3530 = float(_3520);
    float _3532 = fma(_3272, _334, _3334);
    float _3534 = float(_3526);
    float _3536 = fma(_3510, _3528, _624);
    float _3538 = fma(_3446, _2420, -0.5);
    float _3540 = -_648;
    float _3542 = fma(_3494, _3530, _3540);
    float _3544 = fma(_3244, _296, _3328);
    float _3546 = -_514;
    float _3548 = fma(_3446, _3534, _3546);
    float _3550 = fma(_562, _3522, _3536);
    float _3552 = fma(_3268, _330, _3360);
    float _3554 = fma(_3314, _334, _3406);
    float _3556 = fma(_3268, _334, _3344);
    float _3558 = _2380 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3560 = _2380 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3562 = fma(_650, _3538, _3548);
    float _3564 = fma(_3272, _330, _3332);
    float _3566 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3558);
    float _3568 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3560);
    float _3570 = fma(_3272, _326, _3320);
    float _3572 = fma(_3314, _326, _3394);
    float _3574 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3566);
    float _3576 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3568);
    float _3578 = fma(_686, _3516, _3542);
    out.m_85.x = _3564;
    out.m_85.y = _3570;
    out.m_85.z = _3532;
    float _3580 = _3574 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3582 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_87.x = _3348;
    out.m_87.y = _3572;
    out.m_87.z = _3554;
    float _3584 = 1.0 / _3580;
    float _3586 = _3582 + _3580;
    float _3588 = _2330 * _3178;
    float _3590 = in.m_63.x;
    float _3592 = fma(_3268, _326, _3544);
    float _3594 = _3550 + 0.5;
    float _3596 = _3502 + 0.5;
    float _3598 = _3578 + 0.5;
    float _3600 = _3562 + 0.5;
    float _3602 = fma(_2320, _3588, _2318);
    out.m_89.x = _3552;
    out.m_89.y = _3592;
    out.m_89.z = _3556;
    bool _3604 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3606 = isnan(_1985);
    bool _3608 = _3604 || _3606;
    bool _3610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3612 = _3608 || _3610;
    float _3614 = _3586 * _3584;
    float _3616 = _3614 * 0.5;
    out.m_91.x = _3596;
    out.m_91.y = _3600;
    out.m_91.z = _3594;
    out.m_91.w = _3598;
    float _3618 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3620 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3618);
    float _3622 = 1.0 / _3620;
    float _3624 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3626 = _3622 * _3624;
    float _3628 = abs(_3626);
    float _3630 = log2(_3628);
    bool _3632 = _3626 <= 8000.0;
    bool _3634 = isnan(_3626);
    bool _3636 = _3632 || _3634;
    bool _3638 = isnan(8000.0);
    bool _3640 = _3636 || _3638;
    float _3642 = float(_3640);
    float _3644 = _3630 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3646 = exp2(_3644);
    float _3648 = fma(_3646, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3650 = precise::clamp(_3648, 0.0, 1.0);
    float _3652 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3654 = fma(_3650, -2.0, 3.0);
    float _3656 = _3650 * _3650;
    float _3658 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3652);
    float _3660 = _3656 * _3654;
    float _3662 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3658);
    float _3664 = -_3660;
    float _3666 = _3664 + 1.0;
    float _3668 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3662);
    float _3670 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3660);
    float _3672 = _3668 + _2261;
    out.gl_Position.x = _2285;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _3668;
    out.gl_Position.w = _2261;
    float _3674 = _3642 * _3670;
    float _3676 = _3672 * 0.5;
    float _3678 = _3674 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_93.z = _3676;
    out.m_93.w = _2261;
    float _3680 = _3162 * _3678;
    float _3682 = precise::clamp(_3680, 0.0, 1.0);
    float _3684 = -_3682;
    float _3686 = fma(_3684, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3688 = _2320 * _3178;
    float _3690 = -_2496;
    float _3692 = _3690 + 1.0;
    float _3694 = _2261;
    float _3696 = _3676;
    float _3698 = _3668;
    float _3700 = _3692;
    if (!_3612)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3702 = _2344;
    float _3704 = _3686 * _3590;
    float _3706 = fma(_2326, _3688, _2314);
    float _3708 = fma(_2328, _3688, _2316);
    float _3710 = _2320 * _3692;
    float _3712 = _3704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3714 = _3702;
    float _3716 = _3702;
    if (!_3612)
    {
        _3694 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3718 = _3694;
    float _3720 = _3718;
    float _3722 = _3718;
    if (!_3612)
    {
        _3696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3724 = _3696;
    out.m_95.x = _3706;
    out.m_95.y = _3708;
    out.m_95.z = _3602;
    out.m_95.w = _3710;
    float _3726 = _3724;
    float _3728 = _3724;
    if (!_3612)
    {
        _3698 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3730 = _3698;
    float _3732 = _3730;
    float _3734 = _3730;
    if (!_3612)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3736 = _2346;
    out.m_97.x = _3712;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3612)
    {
        _3700 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3742 = _3700;
    bool _3744 = !_3612;
    float _3746 = _3742;
    float _3748 = _3742;
    if (!_3744)
    {
        bool _3750 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3752 = isnan(_1985);
        bool _3754 = _3750 || _3752;
        bool _3756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3758 = _3754 || _3756;
        if (!_3758)
        {
            float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3762 = _1985 + _3760;
            float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3766 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3764;
            float _3768 = 1.0 / _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3772 = _3770 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3776 = _3774 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3790 = _3762 * _3768;
            float _3792 = precise::clamp(_3790, 0.0, 1.0);
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3796 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3798 = fma(_3792, _3772, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3800 = fma(_3792, _3796, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3802 = fma(_3792, _3776, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3804 = fma(_3792, _3780, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3806 = fma(_3792, _3784, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3808 = fma(_3792, _3788, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3728 = _3800;
            _3740 = _3806;
            _3722 = _3798;
            _3734 = _3804;
            _3716 = _3802;
            _3748 = _3808;
            _3810 = true;
        }
        else
        {
            bool _3812 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3814 = isnan(_1985);
            bool _3816 = _3812 || _3814;
            bool _3818 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3820 = _3816 || _3818;
            if (!_3820)
            {
                _3720 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3822 = _3720;
            _3722 = _3822;
            if (!_3820)
            {
                _3726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3824 = _3726;
            _3728 = _3824;
            if (!_3820)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3826 = _3714;
            _3716 = _3826;
            if (!_3820)
            {
                _3732 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3828 = _3732;
            _3734 = _3828;
            if (!_3820)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3830 = _3738;
            _3740 = _3830;
            if (!_3820)
            {
                _3746 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3832 = _3746;
            bool _3834 = !_3820;
            _3748 = _3832;
            if (!_3834)
            {
                bool _3836 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3838 = isnan(_1985);
                bool _3840 = _3836 || _3838;
                bool _3842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3844 = _3840 || _3842;
                if (!_3844)
                {
                    float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3848 = _1985 + _3846;
                    float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3852 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3850;
                    float _3854 = 1.0 / _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3870 = _3868 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3874 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3876 = _3848 * _3854;
                    float _3878 = precise::clamp(_3876, 0.0, 1.0);
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3884 = fma(_3878, _3858, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3886 = fma(_3878, _3882, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3888 = fma(_3878, _3862, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3890 = fma(_3878, _3866, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3892 = fma(_3878, _3870, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3894 = fma(_3878, _3874, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3728 = _3886;
                    _3740 = _3892;
                    _3722 = _3884;
                    _3734 = _3890;
                    _3716 = _3888;
                    _3748 = _3894;
                    _3810 = true;
                }
                else
                {
                    _3728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3722 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3734 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3748 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3810 = false;
    float _3896 = _3728;
    float _3898 = _3740;
    float _3900 = _3722;
    float _3902 = _3734;
    float _3904 = _3716;
    float _3906 = _3748;
    float _3908 = fma(_3592, -0.5, 0.5);
    float _3910 = precise::clamp(_3908, 0.0, 1.0);
    float _3912 = -_3896;
    float _3914 = _3912 + _3898;
    float _3916 = -_3900;
    float _3918 = _3916 + _3902;
    float _3920 = -_3904;
    float _3922 = _3920 + _3906;
    bool _3924 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3926 = fma(_3910, _3914, _3896);
    float _3928 = fma(_3910, _3918, _3900);
    float _3930 = fma(_3910, _3922, _3904);
    float _3932 = _3926 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _3934 = fma(_3928, 0.298911988735198974609375, _3932);
    float _3936 = fma(_3930, 0.114477999508380889892578125, _3934);
    float _3938 = -_3936;
    float _3940 = _3928 + _3938;
    float _3942 = -_3936;
    float _3944 = _3926 + _3942;
    float _3946 = -_3936;
    float _3948 = _3930 + _3946;
    float _3950 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3952 = fma(_3940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    float _3956 = fma(_3948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    out.m_51.x = _3950;
    out.m_101.x = _3952;
    out.m_101.y = _3954;
    out.m_101.z = _3956;
    if (!_3924)
    {
        return out;
    }
    float _3958 = -_1963;
    float _3960 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3962 = -_1959;
    float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3966 = -_1550;
    float _3968 = _3966 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3970 = _3960 * _3960;
    float _3972 = fma(_3964, _3964, _3970);
    float _3974 = fma(_3968, _3968, _3972);
    float _3976 = sqrt(_3974);
    float _3978 = rsqrt(_3974);
    float _3980 = -_3976;
    float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3984 = _3982 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3986 = precise::clamp(_3984, 0.0, 1.0);
    float _3988 = _3964 * _3978;
    float _3990 = _3960 * _3978;
    float _3992 = abs(_3986);
    float _3994 = log2(_3992);
    float _3996 = _3968 * _3978;
    float _3998 = _3988 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4000 = _3592 * _3990;
    float _4002 = -_3990;
    float _4004 = -_3998;
    float _4006 = fma(_4002, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4004);
    float _4008 = fma(_3552, _3988, _4000);
    float _4010 = -_3996;
    float _4012 = fma(_4010, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4006);
    float _4014 = fma(_3556, _3996, _4008);
    float _4016 = precise::clamp(_4014, 0.0, 1.0);
    float _4018 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4020 = _4012 + _4018;
    float _4022 = _3994 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4024 = _4020 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4026 = precise::clamp(_4024, 0.0, 1.0);
    float _4028 = exp2(_4022);
    float _4030 = _4028 * _4026;
    float _4032 = _4016 * _4030;
    float _4034 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4036 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4038 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _4034;
    out.m_99.y = _4036;
    out.m_99.z = _4038;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3810 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4095 = as_type<float>(_136);
        out.gl_Position.z = _4095;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_53.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4165 = as_type<float>(_174);
        out.gl_Position.z = _4165;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _212 > 0.0;
    bool _220 = _214 > 0.0;
    float _222 = 0.0;
    float _224 = _214;
    int _226 = as_type<int>(_188);
    if (_218)
    {
        float _228 = rsqrt(_206);
        _222 = _228;
    }
    float _230 = _222;
    float _232 = 0.0;
    float _234 = 0.0;
    if (!_218)
    {
        _232 = 0.0;
        _234 = 0.0;
    }
    float _236 = _232;
    float _238 = _234;
    bool _240 = _216 > 0.0;
    float _242 = 0.0;
    float _244 = _238;
    float _246 = _236;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _248 = _242;
    float _250 = 0.0;
    float _252 = 0.0;
    float _254 = _248;
    if (!_220)
    {
        _250 = 0.0;
        _252 = 0.0;
    }
    float _256 = _250;
    float _258 = _252;
    float _260 = _212;
    float _262 = _258;
    float _264 = _256;
    if (_220)
    {
        float _266 = rsqrt(_208);
        _260 = _266;
    }
    float _268 = _260;
    float _270 = 0.0;
    if (!_220)
    {
        _270 = 0.0;
    }
    float _272 = _270;
    float _274 = 0.0;
    float _276 = 0.0;
    float _278 = _272;
    if (!_240)
    {
        _274 = 0.0;
        _276 = 0.0;
    }
    float _280 = _274;
    float _282 = _276;
    float _284 = _216;
    float _286 = _282;
    float _288 = _280;
    if (_240)
    {
        float _290 = rsqrt(_210);
        _284 = _290;
    }
    float _292 = _284;
    if (_218)
    {
        float _294 = _230 * _176;
        _244 = _294;
    }
    float _296 = _244;
    if (_218)
    {
        float _298 = _230 * _182;
        _254 = _298;
    }
    float _300 = _254;
    if (_218)
    {
        float _302 = _230 * _188;
        _246 = _302;
    }
    float _304 = _246;
    bool _306 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _224 = 0.0;
    }
    float _308 = _224;
    float _310 = _308;
    if (_220)
    {
        float _312 = _268 * _178;
        _262 = _312;
    }
    float _314 = _262;
    if (_220)
    {
        float _316 = _268 * _184;
        _264 = _316;
    }
    float _318 = _264;
    if (_220)
    {
        float _320 = _268 * _190;
        _278 = _320;
    }
    float _322 = _278;
    if (_240)
    {
        float _324 = _292 * _180;
        _286 = _324;
    }
    float _326 = _286;
    if (_240)
    {
        float _328 = _292 * _186;
        _288 = _328;
    }
    float _330 = _288;
    if (_240)
    {
        float _332 = _292 * _192;
        _310 = _332;
    }
    float _334 = _310;
    bool _336 = !_306;
    float _354;
    if (!_336)
    {
        float _338 = in.m_61.x;
        float _340 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _342 = _338 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _344 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _346 = _344 * _340;
        float _348 = floor(_346);
        float _350 = -_348;
        float _352 = _346 + _350;
        _354 = _352;
        _356 = true;
    }
    else
    {
        float _358 = float(_120);
        float _360 = 1.0 / _358;
        float _362 = _154 * _360;
        _354 = _362;
    }
    _356 = false;
    float _364 = _354;
    float _366 = in.m_48.x;
    float _368 = in.m_48.y;
    float _370 = in.m_48.z;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _374 = int(_372);
    float _376 = in.m_61.x;
    float _378 = in.m_61.y;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _382 = _380 != 0;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _386 = _364 + _384;
    float _388 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _388;
    float _392 = in.m_63.y;
    float _394 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _396 = int(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _398;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _410 = _364 + _408;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _414 = _364 + _412;
    float _416 = float(_374);
    float _418 = 1.0 / _390;
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _424 = _364 + _422;
    float _426 = in.m_59.w;
    float _428 = _190 * _368;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _432 = _430 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _434 = 1.0 / _404;
    float _436 = _378 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _438 = fma(_188, _366, _428);
    if (_382)
    {
        _226 = 0;
    }
    int _440 = _226;
    float _442 = _184 * _368;
    float _444 = fma(_436, -2.0, _406);
    int _446 = _440;
    if (!_382)
    {
        _446 = 1;
    }
    int _448 = _446;
    float _450 = in.m_61.z;
    float _452 = 1.0 / _400;
    float _454 = fma(_182, _366, _442);
    bool _456 = _448 != 1;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _460 = _364 + _458;
    float _462 = fma(_192, _370, _438);
    float _464 = fma(_186, _370, _454);
    float _466 = _368 + _392;
    float _468 = 1.0 / _432;
    float _470 = _460 * _434;
    float _472 = _376 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _474 = float(_396);
    float _476 = _424 * _418;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _478;
    float _482 = _460;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[83].z;
    if (!_456)
    {
        _482 = _378;
    }
    float _486 = _482;
    float _488 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _490 = log2(_488);
    float _492 = _376 * 2.0;
    float _494 = _486;
    if (_456)
    {
        _494 = _376;
    }
    float _496 = _494;
    float _498 = -_420;
    float _500 = fma(_472, 2.0, _498);
    float _502 = _414 * _452;
    float _504 = -_154;
    float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[76].x, _500);
    float _508 = floor(_492);
    float _510 = _386 * _468;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _514 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _444);
    float _516 = in.m_57.w;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _520 = 1.0 + _518;
    float _522 = 1.0 / _480;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _526 = _524;
    float _528 = _496;
    if (!_456)
    {
        _484 = _378;
    }
    float _530 = _484;
    float _532 = _490 * _154;
    float _534 = _530;
    if (_456)
    {
        _534 = _376;
    }
    float _536 = _534;
    float _538 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[83].z, _524);
    if (!_456)
    {
        _526 = _450;
    }
    float _540 = _526;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _542;
    bool _546 = _508 > 0.0;
    float _548 = _536 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _550 = 1.0 / _416;
    bool _552 = _508 >= 0.0;
    bool _554 = isnan(_508);
    bool _556 = _552 || _554;
    bool _558 = isnan(0.0);
    bool _560 = _556 || _558;
    float _562 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _538);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _566 = _540;
    if (_456)
    {
        _566 = _378;
    }
    float _568 = _566;
    float _570 = _410 * _522;
    if (!_456)
    {
        _528 = _450;
    }
    float _572 = _528;
    float _574 = exp2(_532);
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _578 = _572;
    if (_456)
    {
        _578 = _378;
    }
    float _580 = _578;
    float _582 = _568 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _584 = -_564;
    float _586 = fma(_548, 2.0, _584);
    float _588 = _450 * 2.0;
    float _590 = fma(_582, -2.0, _576);
    float _592 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _594 = int(_592);
    float _596 = _550 * _154;
    bool _598 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _600 = isnan(1.0);
    bool _602 = _598 || _600;
    bool _604 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _606 = _602 || _604;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _610 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    bool _616 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _618 = _614 || _616;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _622 = -_154;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[81].x, _586);
    float _626 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _628 = int(_626);
    float _630 = -_574;
    float _632 = _630 + 1.0;
    float _634 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[78].w, _608);
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _642 = _640 != 0;
    int _644 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _646 = _644 != 0;
    float _648 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _590);
    float _650 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _634);
    float _652 = _618 ? _632 : 0.0;
    float _654 = 1.0 / _474;
    float _656 = float(_594);
    float _658 = _462 + _426;
    bool _660 = !_642;
    int _662 = _660 ? 0 : 1;
    float _664 = _464 + _516;
    bool _666 = !_638;
    int _668 = _666 ? 0 : 1;
    float _670 = _656 * _154;
    bool _672 = !_646;
    int _674 = _672 ? 0 : 1;
    float _676 = floor(_588);
    float _678 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[83].w, _512);
    float _680 = _378 * 2.0;
    float _682 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[78].z, _620);
    float _684 = float(_628);
    float _686 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _678);
    float _688 = _376 + _450;
    float _690 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _682);
    float _692 = 1.0 / _520;
    int _694 = _560 ? 0 : 1;
    float _696 = _654 * _154;
    float _698 = _688 + (-1.0);
    int _700 = ~_694;
    int _702 = _700 + 1;
    int _704 = _702 + 1;
    int _706 = _704;
    if (!_546)
    {
        int _708 = ~_694;
        int _710 = _708 + 1;
        _706 = _710;
    }
    int _712 = _706;
    float _714 = floor(_680);
    bool _716 = _676 >= 0.0;
    bool _718 = isnan(_676);
    bool _720 = _716 || _718;
    bool _722 = isnan(0.0);
    bool _724 = _720 || _722;
    float _726 = _684 * _154;
    float _728 = _376 + _378;
    bool _730 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _732 = isnan(_364);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _748 = _746 != 0;
    float _750 = _728 + (-1.0);
    if (_606)
    {
        float _752 = _652 * _692;
        _156 = _752;
    }
    float _754 = _156;
    float _756 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _758 = _724 ? 0 : 1;
    float _760 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _762 = !_748;
    int _764 = _762 ? 0 : 1;
    float _766 = _378 + _450;
    bool _768 = !_744;
    int _770 = _768 ? 0 : 1;
    bool _772 = _714 >= 0.0;
    bool _774 = isnan(_714);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _766 + (-1.0);
    int _784 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _786 = _784 != 0;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _790 = _788 != 0;
    int _792 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _794 = _792 != 0;
    int _796 = _780 ? 0 : 1;
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _802 = _800 != 0;
    bool _804 = !_786;
    int _806 = _804 ? 0 : 1;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _810 = _808 != 0;
    int _812 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _814 = _812 != 0;
    bool _816 = _676 > 0.0;
    int _818 = ~_758;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _826 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _824;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _828;
    float _832 = fma(_826, _502, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _838 = _822;
    if (!_816)
    {
        int _840 = ~_758;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _846;
    float _850 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _850;
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _862 = fma(_848, _502, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _864 = fma(_830, _502, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _866 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _868 = _866 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _874 = fma(_836, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _876 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _878 = isnan(_364);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _884 = _880 || _882;
    float _886 = float(_884);
    float _888 = fma(_868, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _890 = fma(_872, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _892 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _894 = isnan(_364);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _904;
    bool _908 = _714 > 0.0;
    float _910 = fma(_852, _476, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _912 = fma(_856, _510, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _914 = -_902;
    float _916 = _914 + 1.0;
    bool _918 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _920 = isnan(_364);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = fma(_906, _476, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _932 = fma(_544, _476, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _934 = _886 * _916;
    float _936 = -_886;
    float _938 = _936 + 1.0;
    bool _940 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _942 = isnan(_364);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _954 = _952 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _956 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _958 = isnan(_364);
    bool _960 = _956 || _958;
    bool _962 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _964 = _960 || _962;
    float _966 = float(_964);
    float _968 = _928 * _938;
    float _970 = -_928;
    float _972 = _970 + 1.0;
    float _974 = fma(_954, _510, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _976 = -_966;
    float _978 = _976 + 1.0;
    float _980 = -_950;
    float _982 = _980 + 1.0;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _984;
    float _988 = fma(_860, _510, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _990 = _966 * _972;
    float _992 = _950 * _978;
    float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _996 = in.m_65.x;
    float _998 = in.m_65.y;
    float _1000 = in.m_65.z;
    float _1002 = fma(_986, _570, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _1004 = _740 * _982;
    int _1006 = abs(_806);
    float _1008 = -_740;
    float _1010 = _1008 + 1.0;
    float _1012 = _832 * _1004;
    float _1014 = float(_1006);
    float _1016 = _864 * _1004;
    float _1018 = float(_844);
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _1020;
    float _1024 = _862 * _1004;
    float _1026 = _754 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    float _1028 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1012);
    float _1030 = _1014 * _1018;
    float _1032 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1024);
    float _1034 = _1026 * _994;
    float _1036 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1016);
    float _1038 = _1030 * (-2.0);
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1042 = _466 + _1040;
    float _1044 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[203].y, _1034);
    int _1046 = ~_796;
    int _1048 = _1046 + 1;
    int _1050 = _1048 + 1;
    float _1052 = fma(_760, _1038, _760);
    float _1054 = _1042 * _1042;
    float _1056 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1058 = _664 + _1056;
    int _1060 = _1050;
    if (!_908)
    {
        int _1062 = ~_796;
        int _1064 = _1062 + 1;
        _1060 = _1064;
    }
    int _1066 = _1060;
    float _1068 = fma(_1038, _996, _996);
    bool _1070 = !_790;
    int _1072 = _1070 ? 0 : 1;
    float _1074 = _1044 + 0.25;
    float _1076 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1078 = _658 + _1076;
    float _1080 = fma(_1058, _1058, _1054);
    float _1082 = fma(_1022, _570, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _1084 = floor(_1074);
    int _1086 = abs(_1072);
    float _1088 = fma(_1078, _1078, _1080);
    float _1090 = fma(_874, _992, _1028);
    bool _1092 = !_794;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = fma(_890, _992, _1036);
    float _1098 = float(_1066);
    float _1100 = floor(_1044);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _1104 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _1102;
    float _1106 = float(_712);
    float _1108 = fma(_910, _990, _1090);
    float _1110 = float(_1086);
    float _1112 = fma(_1104, _570, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    int _1114 = abs(_1094);
    float _1116 = _376 + (-0.5);
    float _1118 = rsqrt(_1088);
    float _1120 = -_1084;
    float _1122 = _1074 + _1120;
    float _1124 = _1044 * 6.283185482025146484375;
    float _1126 = float(_1114);
    float _1128 = fma(_1116, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1068);
    bool _1130 = !_810;
    int _1132 = _1130 ? 0 : 1;
    float _1134 = _1124 * 0.15915493667125701904296875;
    float _1136 = _1110 * _1106;
    float _1138 = -_1100;
    float _1140 = _1044 + _1138;
    int _1142 = abs(_1132);
    float _1144 = _1126 * _1098;
    bool _1146 = _1122 > 0.5;
    float _1148 = _1134 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    bool _1152 = _1140 >= 0.5;
    bool _1154 = isnan(_1140);
    bool _1156 = _1152 || _1154;
    bool _1158 = isnan(0.5);
    bool _1160 = _1156 || _1158;
    float _1162 = fma(_1052, _754, _1128);
    float _1164 = _1042 * _1118;
    float _1166 = _1058 * _1118;
    bool _1168 = !_802;
    int _1170 = _1168 ? 0 : 1;
    float _1172 = fma(_888, _992, _1032);
    float _1174 = -_1164;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1178 = -_1166;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    bool _1182 = !_1160;
    float _1184 = _1182 ? 0.5 : (-0.5);
    float _1186 = fma(_932, _990, _1096);
    float _1188 = _1176 * _1176;
    int _1190 = abs(_1170);
    float _1192 = _1122;
    if (_1146)
    {
        float _1194 = -_1122;
        float _1196 = _1194 + 1.0;
        _1192 = _1196;
    }
    float _1198 = _1192;
    bool _1200 = !_814;
    int _1202 = _1200 ? 0 : 1;
    float _1204 = fma(_1180, _1180, _1188);
    float _1206 = _1184 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1208 = _1206 * 2.0;
    float _1210 = float(_1142);
    float _1212 = _1078 * _1118;
    int _1214 = abs(_1202);
    float _1216 = fma(_912, _968, _1108);
    float _1218 = fma(_930, _990, _1172);
    float _1220 = -_1212;
    float _1222 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1078);
    float _1224 = _1210 * _1208;
    float _1226 = float(_1190);
    float _1228 = _1150 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1230 = fma(_1222, _1222, _1204);
    float _1232 = fma(_1198, 4.0, -1.0);
    float _1234 = fma(_1226, _1228, _1224);
    float _1236 = float(_1214);
    float _1238 = _1144 * (-2.0);
    float _1240 = _1232 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1242 = _450 + (-0.5);
    float _1244 = _1136 * (-2.0);
    float _1246 = fma(_1238, _1000, _1000);
    float _1248 = fma(_1236, _1240, _1234);
    float _1250 = fma(_756, _1238, _756);
    float _1252 = _378 + (-0.5);
    float _1254 = fma(_1242, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1246);
    float _1256 = fma(_1248, 3.1415927410125732421875, _998);
    float _1258 = fma(_798, _1244, _798);
    float _1260 = sqrt(_1230);
    float _1262 = fma(_1250, _754, _1254);
    float _1264 = fma(_1256, _1244, _1256);
    float _1266 = fma(_988, _968, _1186);
    float _1268 = in.m_67.x;
    float _1270 = in.m_67.y;
    float _1272 = in.m_67.z;
    float _1274 = fma(_1002, _934, _1216);
    float _1276 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1264);
    float _1278 = fma(_974, _968, _1218);
    float _1280 = in.m_69.x;
    float _1282 = in.m_69.y;
    float _1284 = in.m_69.z;
    float _1286 = _1162 * 0.15915493667125701904296875;
    float _1288 = fma(_1258, _754, _1276);
    float _1290 = _1262 * 0.15915493667125701904296875;
    float _1292 = fma(_1112, _934, _1266);
    float _1294 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].x, _1274);
    float _1296 = _1288 * 0.15915493667125701904296875;
    float _1298 = fma(_1082, _934, _1278);
    float _1300 = _1286 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].z, _1292);
    float _1306 = _1118 * _1260;
    float _1308 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[148].y, _1298);
    float _1310 = _1286 * 6.283185482025146484375;
    float _1312 = cos(_1310);
    float _1314 = _1294 * _1268;
    float _1316 = _1304 * _1272;
    float _1318 = _1308 * _1270;
    float _1320 = _1290 * 6.283185482025146484375;
    float _1322 = cos(_1320);
    float _1324 = _1314 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1326 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1328 = _1318 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1284);
    float _1332 = _1306 * _1324;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1280);
    float _1336 = _1306 * _1326;
    float _1338 = _1296 * 6.283185482025146484375;
    float _1340 = sin(_1338);
    float _1342 = _1306 * _1328;
    float _1344 = _1334 * _1332;
    float _1346 = _1330 * _1336;
    float _1348 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1282);
    float _1350 = _1296 * 6.283185482025146484375;
    float _1352 = cos(_1350);
    float _1354 = _1312 * _1322;
    float _1356 = _1302 * _1322;
    float _1358 = _1348 * _1342;
    float _1360 = _1354 * _1346;
    float _1362 = _1290 * 6.283185482025146484375;
    float _1364 = sin(_1362);
    float _1366 = _1302 * _1340;
    float _1368 = _1312 * _1340;
    float _1370 = _1312 * _1352;
    float _1372 = _1302 * _1352;
    float _1374 = _1340 * _1322;
    float _1376 = _1352 * _1322;
    float _1378 = fma(_1364, _1370, _1366);
    float _1380 = -_1346;
    float _1382 = _1364 * _1380;
    float _1384 = -_1372;
    float _1386 = fma(_1364, _1368, _1384);
    float _1388 = -_1368;
    float _1390 = fma(_1364, _1372, _1388);
    float _1392 = fma(_1378, _1344, _1360);
    float _1394 = _1356 * _1346;
    float _1396 = fma(_1376, _1344, _1382);
    float _1398 = fma(_1364, _1366, _1370);
    float _1400 = -_1358;
    float _1402 = fma(_1386, _1400, _1392);
    float _1404 = fma(_1390, _1344, _1394);
    float _1406 = -_1358;
    float _1408 = fma(_1374, _1406, _1396);
    float _1410 = _1402 * _322;
    float _1412 = -_1358;
    float _1414 = fma(_1398, _1412, _1404);
    float _1416 = _1402 * _318;
    float _1418 = fma(_1408, _304, _1410);
    float _1420 = fma(_1408, _300, _1416);
    float _1422 = fma(_1414, _334, _1418);
    float _1424 = fma(_1414, _330, _1420);
    float _1426 = _658 + _1422;
    float _1428 = _664 + _1424;
    float _1430 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1432 = _1426 + _1430;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1436 = _1428 + _1434;
    float _1438 = _1432 * _1432;
    float _1440 = fma(_1436, _1436, _1438);
    float _1442 = _1402 * _314;
    float _1444 = sqrt(_1440);
    float _1446 = fma(_1408, _296, _1442);
    float _1448 = fma(_1414, _326, _1446);
    float _1450 = _466 + _1448;
    bool _1452 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1456 = _1454 != 0;
    int _1458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1460 = _1458 != 0;
    bool _1462 = !_1456;
    int _1464 = _1462 ? 0 : 1;
    bool _1466 = !_1460;
    int _1468 = _1466 ? 0 : 1;
    float _1470 = _1446;
    float _1472 = _1428;
    float _1474 = _1426;
    if (!_1452)
    {
        _1470 = _1450;
    }
    float _1476 = _1470;
    bool _1478 = !_1452;
    float _1480 = _1476;
    if (!_1478)
    {
        float _1482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1486 = _1444 + _1484;
        float _1488 = _1450 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1490 = rsqrt(_1440);
        float _1492 = _1486 * _1482;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = _1494 * 6.283185482025146484375;
        float _1498 = cos(_1496);
        float _1500 = _1494 * 6.283185482025146484375;
        float _1502 = sin(_1500);
        float _1504 = _1498 + (-1.0);
        float _1506 = fma(_1502, _1488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1508 = _1504 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1510 = _1490 * _1506;
        float _1512 = fma(_1450, _1498, _1508);
        float _1514 = fma(_1436, _1510, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1516 = fma(_1432, _1510, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1472 = _1514;
        _1474 = _1516;
        _1480 = _1512;
    }
    float _1518 = _1472;
    float _1520 = _1474;
    float _1522 = _1480;
    float _1524 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1526 = _1518 + _1524;
    float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1530 = _1520 + _1528;
    float _1532 = fma(_1526, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1534 = fma(_1530, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6223 = float2(_1532, _1534);
    float _1536 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6223, float2(0.0), isnan(_6223)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6223, float2(0.0), isnan(_6223)), level(0.0)).x;
    float _1538 = float(uint(_594));
    float _1540 = trunc(_596);
    int _1542 = int(_1540);
    int _1544 = ~_594;
    int _1546 = _1544 + 1;
    float _1548 = -_1212;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1520);
    int _1552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1554 = _1552 != 0;
    float _1556 = -_1166;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c9)._m0[18].w, _664);
    float _1560 = float(uint(_628));
    float _1562 = -_1212;
    float _1564 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[18].w, _658);
    int _1566 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1568 = _1566 != 0;
    float _1570 = 1.0 / _1538;
    float _1572 = in.m_71.y;
    int _1574 = abs(_662);
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1578 = _1576 != 0;
    int _1580 = abs(_1464);
    float _1582 = 1.0 / _1560;
    float _1584 = float(uint(_1542));
    float _1586 = _1538;
    float _1588 = _1572;
    if (_1554)
    {
        _1586 = 1.0;
    }
    float _1590 = _1586;
    float _1592 = _1590;
    if (!_1554)
    {
        _1592 = 7.345489978790283203125;
    }
    float _1594 = _1592;
    int _1596 = ~_594;
    int _1598 = _1596 + 1;
    float _1600 = trunc(_696);
    int _1602 = int(_1600);
    int _1604 = as_type<int>(_1570) + (-2);
    float _1606 = as_type<float>(_1604) * _1584;
    float _1608 = trunc(_1606);
    float _1610 = precise::max(_1608, 0.0);
    uint _1613 = uint(_1610);
    float _1615 = float(uint(_1602));
    float _1617 = _1594 * _376;
    float _1619 = float(_120);
    int _1621 = ~_594;
    int _1623 = _1621 + 1;
    int _1625 = _1546 * int(_1613);
    int _1627 = _1625 + _1542;
    int _1629 = as_type<int>(_1582) + (-2);
    float _1631 = floor(_1617);
    float _1633 = float(uint(_1627));
    float _1635 = as_type<float>(_1629) * _1615;
    float _1637 = as_type<float>(_1604) * _1633;
    float _1639 = 1.0 / _1619;
    float _1641 = _1633;
    if (_1554)
    {
        float _1643 = in.m_61.x;
        _1641 = _1643;
    }
    float _1645 = _1641;
    float _1647 = _1645;
    if (!_1554)
    {
        float _1649 = in.m_61.y;
        _1647 = _1649;
    }
    float _1651 = _1647;
    float _1653 = -_1631;
    float _1655 = _1617 + _1653;
    float _1657 = trunc(_1637);
    float _1659 = precise::max(_1657, 0.0);
    uint _1661 = uint(_1659);
    int _1663 = ~_628;
    int _1665 = _1663 + 1;
    float _1667 = trunc(_1635);
    float _1669 = precise::max(_1667, 0.0);
    uint _1671 = uint(_1669);
    float _1673 = _670 * _1639;
    float _1675 = _726 * _1639;
    int _1677 = _628 + (-1);
    int _1679 = int(_1613) + int(_1661);
    float _1681 = trunc(_1673);
    int _1683 = int(_1681);
    float _1685 = float(_1542);
    int _1687 = _1623 * _1679;
    int _1689 = _1687 + _1542;
    bool _1691 = _1685 >= _656;
    bool _1693 = isnan(_1685);
    bool _1695 = _1691 || _1693;
    bool _1697 = isnan(_656);
    bool _1699 = _1695 || _1697;
    float _1701 = float(_1699);
    float _1703 = _1655 * _656;
    float _1705 = trunc(_1675);
    int _1707 = int(_1705);
    bool _1709 = uint(_1689) >= uint(_594);
    float _1711 = as_type<float>(_1665);
    if (_1554)
    {
        _1711 = 1.0;
    }
    float _1713 = _1711;
    int _1715 = _1665 * int(_1671);
    int _1717 = _1715 + _1602;
    bool _1719 = !_1709;
    int _1721 = _1719 ? 0 : (-1);
    bool _1723 = _594 == 0;
    float _1725 = trunc(_1701);
    int _1727 = int(_1725);
    int _1729 = ~_1679;
    int _1731 = _1729 + _1721;
    int _1733 = _1731 + 1;
    float _1735 = float(uint(_1717));
    float _1737 = _1713;
    if (!_1554)
    {
        _1737 = 1.2345600128173828125;
    }
    float _1739 = _1737;
    int _1741 = _594 * _1733;
    int _1743 = _1741 + _1542;
    bool _1745 = !_1578;
    int _1747 = _1745 ? 0 : 1;
    float _1749 = as_type<float>(_1629) * _1735;
    float _1751 = trunc(_1703);
    int _1753 = int(_1751);
    float _1755 = _1651 * _1739;
    bool _1757 = !_1723;
    int _1759 = _1757 ? _1743 : (-1);
    int _1761 = _594 + (-1);
    int _1763 = abs(_1747);
    int _1765 = ~_1727;
    int _1767 = _1765 + 1;
    int _1769 = _1767 + 1;
    float _1771 = trunc(_1749);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    int _1777 = abs(_668);
    int _1779 = _1759 * _1769;
    bool _1781 = !_1568;
    int _1783 = _1781 ? 0 : 1;
    int _1785 = _1753 * _1763;
    int _1787 = _1785 + _1542;
    bool _1789 = _628 == 0;
    int _1791 = _1727 * _1761;
    int _1793 = _1791 + _1779;
    int _1795 = abs(_674);
    int _1797 = _1793 * _1574;
    int _1799 = abs(_1783);
    int _1801 = _1683 * _1777;
    int _1803 = _1801 + _1797;
    int _1805 = ~_628;
    int _1807 = _1805 + 1;
    int _1809 = int(_1671) + int(_1775);
    int _1811 = _1787 * _1795;
    int _1813 = _1811 + _1803;
    float _1815 = float(_1602);
    float _1817 = floor(_1755);
    int _1819 = _1753 * _1799;
    int _1821 = _1819 + _1813;
    int _1823 = _1807 * _1809;
    int _1825 = _1823 + _1602;
    bool _1827 = _1815 >= _684;
    bool _1829 = isnan(_1815);
    bool _1831 = _1827 || _1829;
    bool _1833 = isnan(_684);
    bool _1835 = _1831 || _1833;
    float _1837 = float(_1835);
    float _1839 = float(uint(_1821));
    bool _1841 = uint(_1825) >= uint(_628);
    float _1843 = trunc(_1837);
    int _1845 = int(_1843);
    float _1847 = as_type<float>(_1604) * _1839;
    bool _1849 = !_1841;
    int _1851 = _1849 ? 0 : (-1);
    int _1853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1855 = _1853 != 0;
    float _1857 = -_1817;
    float _1859 = _1755 + _1857;
    int _1861 = ~_1809;
    int _1863 = _1861 + _1851;
    int _1865 = _1863 + 1;
    float _1867 = trunc(_1847);
    float _1869 = precise::max(_1867, 0.0);
    uint _1871 = uint(_1869);
    int _1873 = ~_594;
    int _1875 = _1873 + 1;
    float _1877 = _684 * _1859;
    int _1879 = _628 * _1865;
    int _1881 = _1879 + _1602;
    int _1883 = ~_1845;
    int _1885 = _1883 + 1;
    int _1887 = _1885 + 1;
    float _1889 = trunc(_1877);
    int _1891 = int(_1889);
    bool _1893 = !_1789;
    int _1895 = _1893 ? _1881 : (-1);
    int _1897 = _1887 * _1895;
    bool _1899 = !_1855;
    int _1901 = _1899 ? 0 : 1;
    int _1903 = _1875 * int(_1871);
    int _1905 = _1903 + _1821;
    int _1907 = _1845 * _1677;
    int _1909 = _1907 + _1897;
    int _1911 = abs(_764);
    int _1913 = abs(_1901);
    int _1915 = abs(_770);
    int _1917 = _1909 * _1911;
    int _1919 = abs(_1468);
    int _1921 = _1891 * _1913;
    int _1923 = _1921 + _1602;
    float _1925 = float(uint(_1905));
    int _1927 = _1707 * _1915;
    int _1929 = _1927 + _1917;
    int _1931 = _1923 * _1580;
    int _1933 = _1931 + _1929;
    float _1935 = as_type<float>(_1604) * _1925;
    int _1937 = _1891 * _1919;
    int _1939 = _1937 + _1933;
    float _1941 = trunc(_1935);
    float _1943 = precise::max(_1941, 0.0);
    uint _1945 = uint(_1943);
    float _1947 = float(uint(_1939));
    int _1949 = int(_1871) + int(_1945);
    int _1951 = _1598 * _1949;
    int _1953 = _1951 + _1821;
    float _1955 = fma(_1536, 100.0, _1522);
    float _1957 = -_1166;
    float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1518);
    float _1961 = -_1164;
    float _1963 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1955);
    float _1965 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1967 = _1959 + _1965;
    float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1971 = _1550 + _1969;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1975 = _1963 + _1973;
    float _1977 = _1975 * _1975;
    float _1979 = fma(_1967, _1967, _1977);
    float _1981 = fma(_1971, _1971, _1979);
    float _1983 = rsqrt(_1981);
    float _1985 = sqrt(_1981);
    float _1987 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1989 = _1967 * _1987;
    float _1991 = _1971 * _1987;
    float _1993 = _1989 * _1989;
    float _1995 = _1991 * _1991;
    float _1997 = _1993 + _1995;
    float _1999 = sqrt(_1997);
    bool _2001 = _1999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2003 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2005 = _1999 + _2003;
    float _2007 = _1971;
    float _2009 = _2005;
    float _2011 = _1977;
    float _2013 = _1975;
    float _2015 = as_type<float>(_1871);
    if (_2001)
    {
        float _2017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2007 = _2017;
    }
    float _2019 = _2007;
    if (_2001)
    {
        float _2021 = _2005 * _2019;
        _2009 = _2021;
    }
    float _2023 = _2009;
    if (_2001)
    {
        float _2025 = _2023 * 0.15915493667125701904296875;
        _2011 = _2025;
    }
    float _2027 = _2011;
    float _2029 = as_type<float>(_764);
    float _2031 = _2027;
    if (_2001)
    {
        float _2033 = _2027 * 6.283185482025146484375;
        float _2035 = sin(_2033);
        _2029 = _2035;
    }
    float _2037 = _2029;
    float _2039 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2041 = precise::max(0.0, _2039);
    float _2043 = _1983;
    float _2045 = _2041;
    if (_2001)
    {
        float _2047 = _2027 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        _2043 = _2049;
    }
    float _2051 = _2043;
    float _2053 = -_1987;
    float _2055 = -_2041;
    float _2057 = fma(_1975, _2053, _2055);
    float _2059 = _2039;
    if (_2001)
    {
        float _2061 = rsqrt(_1997);
        _2059 = _2061;
    }
    float _2063 = _2059;
    if (_2001)
    {
        float _2065 = _2057 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2045 = _2065;
    }
    float _2067 = _2045;
    float _2069 = _2067;
    if (!_2001)
    {
        _2031 = _1993;
    }
    float _2071 = _2031;
    float _2073 = _2037;
    float _2075 = _2071;
    if (_2001)
    {
        float _2077 = fma(_2037, _2067, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2069 = _2077;
    }
    float _2079 = _2069;
    float _2081 = _2079;
    float _2083 = _2051;
    if (_2001)
    {
        float _2085 = _2051 + (-1.0);
        _2013 = _2085;
    }
    float _2087 = _2013;
    float _2089 = _2087;
    if (_2001)
    {
        float _2091 = _2087 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2015 = _2091;
    }
    float _2093 = _2015;
    if (!_2001)
    {
        _2089 = _1991;
    }
    float _2095 = _2089;
    float _2097 = _2063;
    float _2099 = _2095;
    if (_2001)
    {
        float _2101 = _2063 * _2079;
        _2073 = _2101;
    }
    float _2103 = _2073;
    if (!_2001)
    {
        _2081 = _1989;
    }
    float _2105 = _2081;
    float _2107 = _2105;
    if (!_2001)
    {
        _2097 = _2057;
    }
    float _2109 = _2097;
    float _2111 = _2109;
    if (_2001)
    {
        float _2113 = _1989 * _2103;
        _2107 = _2113;
    }
    float _2115 = _2107;
    if (_2001)
    {
        float _2117 = fma(_2057, _2051, _2093);
        _2111 = _2117;
    }
    float _2119 = _2111;
    if (_2001)
    {
        float _2121 = _1991 * _2103;
        _2099 = _2121;
    }
    float _2123 = _2099;
    if (!_2001)
    {
        _2083 = _1995;
    }
    float _2125 = _2083;
    float _2127 = _2125;
    if (_2001)
    {
        float _2129 = _2115 * _2115;
        _2075 = _2129;
    }
    float _2131 = _2075;
    if (_2001)
    {
        float _2133 = _2123 * _2123;
        _2127 = _2133;
    }
    float _2135 = _2127;
    float _2137 = fma(_2119, _2119, _2131);
    int _2139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2141 = _2139 != 0;
    float _2143 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2145 = fma(_1985, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2143);
    float _2147 = precise::clamp(_2145, 0.0, 1.0);
    float _2149 = _2137 + _2135;
    float _2151 = -_2147;
    float _2153 = _2151 + 1.0;
    float _2155 = rsqrt(_2149);
    float _2157 = fma(_1558, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2159 = floor(_2157);
    float _2161 = abs(_2153);
    float _2163 = log2(_2161);
    float _2165 = _2155 * _2115;
    float _2167 = _2155 * _2119;
    float _2169 = _2155 * _2123;
    float _2171 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2173 = _2165 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2175 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2177 = -_2159;
    float _2179 = _2157 + _2177;
    float _2181 = -_2173;
    float _2183 = fma(_2167, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2181);
    float _2185 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2187 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2189 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2191 = -_2169;
    float _2193 = fma(_2191, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2183);
    float _2195 = _1963 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2197 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2187);
    float _2199 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2201 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2189);
    float _2203 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2195);
    float _2205 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2197);
    float _2207 = floor(_2171);
    float _2209 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2201);
    float _2211 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2203);
    float _2213 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2215 = fma(_1959, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2175);
    float _2217 = _2209 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2219 = _2211 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2221 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2223 = exp2(_2199);
    float _2225 = fma(_2193, -0.5, 0.5);
    float _2227 = fma(_2193, 0.5, 0.5);
    float _2229 = fma(_1550, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2215);
    float _2231 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2221);
    float _2233 = _2167 + 1.0;
    float _2235 = _2217 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2237 = _2229 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2239 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2231);
    float _2241 = sqrt(_2225);
    float _2243 = -_2235;
    float _2245 = fma(_2243, _2185, 1.0);
    float _2247 = -_2207;
    float _2249 = _2171 + _2247;
    float _2251 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2253 = fma(_2227, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2255 = log2(_2245);
    float _2257 = -_2167;
    float _2259 = fma(_2223, _2233, _2257);
    float _2261 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2239);
    float _2263 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2265 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2251);
    float _2267 = fma(_2227, _2253, -0.212114393711090087890625);
    float _2269 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2263);
    float _2271 = 1.0 / _2261;
    float _2273 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2265);
    float _2275 = fma(_2227, _2267, 1.570728778839111328125);
    float _2277 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2269);
    float _2279 = _2241 * 0.636619746685028076171875;
    float _2281 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2273);
    float2 _7333 = float2(_2179, _2249);
    float _2283 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7333, float2(0.0), isnan(_7333)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7333, float2(0.0), isnan(_7333)), level(0.0)).x;
    float _2285 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2277);
    float _2287 = _2255 * 0.693147182464599609375;
    float _2289 = -_2275;
    float _2291 = fma(_2279, _2289, 1.0);
    float _2293 = fma(_2259, 0.5, 0.5);
    float _2295 = in.m_61.w;
    float _2297 = _2287 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2299 = in.m_71.x;
    float _2301 = _2285 * _2271;
    float _2303 = _2281 * _2271;
    float _2305 = fma(_2301, 0.5, 0.5);
    float _2307 = fma(_2303, -0.5, 0.5);
    float3 _7375 = float3(_2305, _2307, _2297);
    float _2309 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7375, float3(0.0), isnan(_7375)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7375, float3(0.0), isnan(_7375)), level(0.0)).x;
    float3 _7386 = float3(_2305, _2307, _2297);
    float4 _2312 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7386, float3(0.0), isnan(_7386)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7386, float3(0.0), isnan(_7386)), level(0.0)).xyzw;
    float _2314 = _2312.x;
    float _2316 = _2312.y;
    float _2318 = _2312.z;
    float _2320 = _2312.w;
    float2 _7402 = float2(_2291, _2293);
    float3 _2324 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7402, float2(0.0), isnan(_7402)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7402, float2(0.0), isnan(_7402)), level(0.0)).xyz;
    float _2326 = _2324.x;
    float _2328 = _2324.y;
    float _2330 = _2324.z;
    float _2332 = as_type<float>(_1629) * _1947;
    bool _2334 = uint(_1953) >= uint(_594);
    float _2336 = as_type<float>(_1190);
    float _2338 = _2297;
    int _2340 = as_type<int>(_2249);
    float _2342 = _2332;
    float _2344 = _2261;
    float _2346 = _2281;
    if (_2141)
    {
        float _2348 = in.m_61.x;
        _2336 = _2348;
    }
    float _2350 = _2336;
    float _2352 = float(uint(_1787));
    float _2354 = trunc(_2332);
    float _2356 = precise::max(_2354, 0.0);
    uint _2358 = uint(_2356);
    bool _2360 = !_2334;
    int _2362 = _2360 ? 0 : (-1);
    float _2364 = fma(_1536, 100.0, _466);
    int _2366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2368 = _2366 != 0;
    float _2370 = as_type<float>(_1604) * _2352;
    int _2372 = ~_1949;
    int _2374 = _2372 + _2362;
    int _2376 = _2374 + 1;
    float _2378 = -_1164;
    float _2380 = fma(_2378, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2364);
    int _2382 = ~_628;
    int _2384 = _2382 + 1;
    float _2386 = -_1572;
    float _2388 = _2386 + 1.0;
    bool _2390 = _378 > 0.5;
    float _2392 = trunc(_2370);
    float _2394 = precise::max(_2392, 0.0);
    uint _2396 = uint(_2394);
    bool _2398 = _2295 > 0.5;
    int _2400 = _594 * _2376;
    int _2402 = _2400 + _1821;
    int _2404 = _2390 ? as_type<int>(_2388) : as_type<int>(_1572);
    float _2406 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2410 = _2408 != 0;
    int _2412 = _2384 * int(_2358);
    int _2414 = _2412 + _1939;
    int _2416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2418 = _2416 != 0;
    out.m_73.x = _1959;
    out.m_73.y = _1963;
    out.m_73.z = _1550;
    float _2420 = _2410 ? as_type<float>(_2404) : _1572;
    float _2422 = exp2(_2406);
    float _2424 = float(uint(_2414));
    int _2426 = _2414;
    bool _2428 = _2398;
    bool _2430 = _2410;
    if (_2141)
    {
        float _2432 = -_2299;
        float _2434 = _2432 + 1.0;
        _2426 = as_type<int>(_2434);
    }
    int _2436 = _2426;
    if (_2368)
    {
        float _2438 = _2398 ? _2388 : _1572;
        _1588 = _2438;
    }
    float _2440 = _1588;
    int _2442 = ~_594;
    int _2444 = _2442 + 1;
    float _2446 = as_type<float>(_1629) * _2424;
    if (_2141)
    {
        bool _2448 = _2350 > 0.5;
        _2428 = _2448;
    }
    bool _2450 = _2428;
    bool _2452 = !_1723;
    float _2454 = _2452 ? as_type<float>(_2402) : as_type<float>(0xffffffffu /* nan */);
    int _2456 = _2444 * int(_2396);
    int _2458 = _2456 + _1787;
    float _2460 = _2454;
    if (!_2141)
    {
        _2338 = _2299;
    }
    float _2462 = _2338;
    float _2464 = trunc(_2446);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    float _2470 = _2462;
    if (_2141)
    {
        float _2472 = _2450 ? as_type<float>(_2436) : _2299;
        _2470 = _2472;
    }
    float _2474 = _2470;
    if (_2418)
    {
        float _2476 = -_2299;
        float _2478 = _2476 + 1.0;
        _2340 = as_type<int>(_2478);
    }
    int _2480 = _2340;
    int _2482 = as_type<int>(_2454) & 3;
    bool _2484 = _2482 != 0;
    float _2486 = -_2422;
    float _2488 = _2486 + 1.0;
    if (_2418)
    {
        bool _2490 = _450 > 0.5;
        _2430 = _2490;
    }
    bool _2492 = _2430;
    float _2494 = float(uint(_2458));
    float _2496 = _2488 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2498 = uint(_2482) > 1u;
    float _2500 = float(uint(_1923));
    float _2502 = as_type<float>(_1604) * _2494;
    if (!_2418)
    {
        _2342 = _2299;
    }
    float _2504 = _2342;
    float _2506 = _2504;
    if (_2418)
    {
        float _2508 = _2492 ? as_type<float>(_2480) : _2299;
        _2506 = _2508;
    }
    float _2510 = _2506;
    int _2512 = as_type<int>(_2454) & 3;
    bool _2514 = _2512 != 0;
    float _2516 = trunc(_2502);
    float _2518 = precise::max(_2516, 0.0);
    uint _2520 = uint(_2518);
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2528 = _2526 != 0;
    float _2530 = as_type<float>(_1629) * _2500;
    int _2532 = int(_2358) + int(_2468);
    int _2534 = ~_628;
    int _2536 = _2534 + 1;
    int _2538 = _2514 ? 0 : 1;
    float _2540 = trunc(_2530);
    float _2542 = precise::max(_2540, 0.0);
    uint _2544 = uint(_2542);
    bool _2546 = uint(_2482) >= 2u;
    int _2548 = _2536 * _2532;
    int _2550 = _2548 + _1939;
    int _2552 = ~_2538;
    int _2554 = _2552 + 1;
    int _2556 = _2554 + 1;
    int _2558 = _2556;
    if (!_2498)
    {
        int _2560 = ~_2538;
        int _2562 = _2560 + 1;
        _2558 = _2562;
    }
    int _2564 = _2558;
    float _2566 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2568 = _2546 ? 0 : 1;
    float _2570 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2572 = uint(_2550) >= uint(_628);
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2576 = _2566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2578 = !_2572;
    float _2580 = _2578 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2582 = _2570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2584 = ~_628;
    int _2586 = _2584 + 1;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2590 = _2574 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2592 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2594 = ~_2532;
    int _2596 = _2594 + as_type<int>(_2580);
    int _2598 = _2596 + 1;
    float _2600 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2602 = ~_594;
    int _2604 = _2602 + 1;
    float _2606 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2608 = _2482 != 3;
    out.m_75.x = _2576;
    out.m_75.y = _2582;
    out.m_75.z = _2590;
    out.m_75.w = _2588;
    int _2610 = int(_2396) + int(_2520);
    int _2612 = _2586 * int(_2544);
    int _2614 = _2612 + _1923;
    int _2616 = _628 * _2598;
    int _2618 = _2616 + _1939;
    float _2620 = _2592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2622 = _2600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2624 = _2606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2626 = !_1789;
    int _2628 = _2626 ? _2618 : (-1);
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    int _2630 = ~_2568;
    int _2632 = _2630 + 1;
    int _2634 = _2632 + 1;
    int _2636 = _2634;
    float _2638 = _2580;
    float _2640 = as_type<float>(_2586);
    if (_2608)
    {
        int _2642 = ~_2568;
        int _2644 = _2642 + 1;
        _2636 = _2644;
    }
    int _2646 = _2636;
    out.m_79.x = _2620;
    out.m_79.y = _2622;
    out.m_79.z = _2624;
    int _2648 = as_type<int>(_2454) >> 31;
    float _2650 = in.m_81.x;
    float _2652 = in.m_81.y;
    float _2654 = in.m_81.z;
    float _2656 = float(uint(_2614));
    int _2658 = _2604 * _2610;
    int _2660 = _2658 + _1787;
    int _2662 = _2648 & 3;
    bool _2664 = _1282 != 0.0;
    bool _2666 = isnan(_1282);
    bool _2668 = _2664 || _2666;
    bool _2670 = isnan(0.0);
    bool _2672 = _2668 || _2670;
    float _2674 = as_type<float>(_1629) * _2656;
    bool _2676 = uint(_2660) >= uint(_594);
    int _2678 = _2628 >> 31;
    int _2680 = as_type<int>(_2454) + _2662;
    float _2682 = trunc(_2674);
    float _2684 = precise::max(_2682, 0.0);
    uint _2686 = uint(_2684);
    float _2688 = in.m_83.x;
    float _2690 = in.m_83.y;
    float _2692 = in.m_83.z;
    float _2694 = in.m_83.w;
    int _2696 = _2678 & 3;
    bool _2698 = !_2676;
    int _2700 = _2698 ? 0 : (-1);
    int _2702 = _2680 >> 2;
    bool _2704 = _1280 == 0.0;
    bool _2706 = !_2672;
    bool _2708 = _2704 && _2706;
    int _2710 = _2628 & 3;
    bool _2712 = _2710 != 0;
    int _2714 = _2628 + _2696;
    int _2716 = _2702 << 4;
    int _2718 = _2716 + 368;
    bool _2720 = _1284 == 0.0;
    bool _2722 = _2720 && _2708;
    int _2724 = _2712 ? 0 : 1;
    bool _2726 = uint(_2710) >= 2u;
    int _2728 = _2714 >> 2;
    uint _2730 = uint(int(uint(_2718) >> uint(2)));
    uint _2732 = uint(int(uint(int(_2730)) >> uint(2)));
    int _2734 = int(_2730) & 3;
    float _2736 = (*spvDescriptorSet0.vp_c9)._m0[int(_2732)][_2734];
    int _2738 = int(_2730) + 1;
    uint _2740 = uint(int(uint(_2738) >> uint(2)));
    int _2742 = _2738 & 3;
    float _2744 = (*spvDescriptorSet0.vp_c9)._m0[int(_2740)][_2742];
    int _2746 = _2726 ? 0 : 1;
    float _2748 = _2692 * _2650;
    int _2750 = _2728 << 4;
    int _2752 = _2750 + 512;
    bool _2754 = uint(_2710) > 1u;
    float _2756 = -_2748;
    float _2758 = fma(_2688, _2654, _2756);
    int _2760 = int(_2544) + int(_2686);
    uint _2762 = uint(int(uint(_2752) >> uint(2)));
    uint _2764 = uint(int(uint(int(_2762)) >> uint(2)));
    int _2766 = int(_2762) & 3;
    float _2768 = (*spvDescriptorSet0.vp_c9)._m0[int(_2764)][_2766];
    int _2770 = int(_2762) + 1;
    uint _2772 = uint(int(uint(_2770) >> uint(2)));
    int _2774 = _2770 & 3;
    float _2776 = (*spvDescriptorSet0.vp_c9)._m0[int(_2772)][_2774];
    float _2778 = _2758 * _2694;
    if (_2722)
    {
        _2638 = _2650;
    }
    float _2780 = _2638;
    float _2782 = _2780;
    if (!_2722)
    {
        float _2784 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2650);
        _2782 = _2784;
    }
    float _2786 = _2782;
    if (_2722)
    {
        _2460 = _2652;
    }
    float _2788 = _2460;
    float _2790 = _2788;
    if (!_2722)
    {
        float _2792 = fma(_1282, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2652);
        _2790 = _2792;
    }
    float _2794 = _2790;
    int _2796 = _2586 * _2760;
    int _2798 = _2796 + _1923;
    float _2800 = _2690 * _2654;
    int _2802 = ~_2724;
    int _2804 = _2802 + 1;
    int _2806 = _2804 + 1;
    int _2808 = _2806;
    if (!_2754)
    {
        int _2810 = ~_2724;
        int _2812 = _2810 + 1;
        _2808 = _2812;
    }
    int _2814 = _2808;
    float _2816 = -_2800;
    float _2818 = fma(_2692, _2652, _2816);
    bool _2820 = uint(_2798) >= uint(_628);
    float _2822 = _2688 * _2652;
    int _2824 = _2718 + 8;
    uint _2826 = uint(int(uint(_2824) >> uint(2)));
    uint _2828 = uint(int(uint(int(_2826)) >> uint(2)));
    int _2830 = int(_2826) & 3;
    float _2832 = (*spvDescriptorSet0.vp_c9)._m0[int(_2828)][_2830];
    int _2834 = int(_2826) + 1;
    uint _2836 = uint(int(uint(_2834) >> uint(2)));
    int _2838 = _2834 & 3;
    float _2840 = (*spvDescriptorSet0.vp_c9)._m0[int(_2836)][_2838];
    if (_2722)
    {
        _2640 = _2654;
    }
    float _2842 = _2640;
    float _2844 = _2842;
    if (!_2722)
    {
        float _2846 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2654);
        _2844 = _2846;
    }
    float _2848 = _2844;
    float _2850 = -_2822;
    float _2852 = fma(_2690, _2650, _2850);
    bool _2854 = !_2820;
    int _2856 = _2854 ? 0 : (-1);
    float _2858 = _2818 * _2694;
    bool _2860 = _2710 != 3;
    float _2862 = _2852 * _2694;
    int _2864 = _2752 + 8;
    uint _2866 = uint(int(uint(_2864) >> uint(2)));
    uint _2868 = uint(int(uint(int(_2866)) >> uint(2)));
    int _2870 = int(_2866) & 3;
    float _2872 = (*spvDescriptorSet0.vp_c9)._m0[int(_2868)][_2870];
    int _2874 = int(_2866) + 1;
    uint _2876 = uint(int(uint(_2874) >> uint(2)));
    int _2878 = _2874 & 3;
    float _2880 = (*spvDescriptorSet0.vp_c9)._m0[int(_2876)][_2878];
    bool _2882 = !_2484;
    int _2884 = _2882 ? 0 : 1;
    int _2886 = abs(_2564);
    int _2888 = _2628 & 3;
    bool _2890 = _2888 != 0;
    int _2892 = abs(_2884);
    int _2894 = ~_2886;
    int _2896 = _2894 + 1;
    int _2898 = _2896 + 1;
    float _2900 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2902 = int(_2900);
    int _2904 = ~_2610;
    int _2906 = _2904 + _2700;
    int _2908 = _2906 + 1;
    int _2910 = abs(_2814);
    float _2912 = _1354 * _2848;
    bool _2914 = _2482 != 3;
    int _2916 = _594 * _2908;
    int _2918 = _2916 + _1787;
    bool _2920 = !_2890;
    int _2922 = _2920 ? 0 : 1;
    int _2924 = _2898 * as_type<int>(_2744);
    int _2926 = ~_2892;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    int _2932 = ~_2760;
    int _2934 = _2932 + _2856;
    int _2936 = _2934 + 1;
    int _2938 = ~_2910;
    int _2940 = _2938 + 1;
    int _2942 = _2940 + 1;
    int _2944 = _2930 * as_type<int>(_2736);
    int _2946 = _2944 + _2924;
    int _2948 = ~_2746;
    int _2950 = _2948 + 1;
    int _2952 = _2950 + 1;
    float _2954 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2956 = int(_2954);
    bool _2958 = _2710 != 3;
    int _2960 = _2942 * as_type<int>(_2776);
    int _2962 = abs(_2922);
    float _2964 = -_2692;
    float _2966 = _1364 * _2964;
    int _2968 = _2952;
    if (_2860)
    {
        int _2970 = ~_2746;
        int _2972 = _2970 + 1;
        _2968 = _2972;
    }
    int _2974 = _2968;
    bool _2976 = !_2914;
    int _2978 = _2976 ? 0 : (-1);
    float _2980 = fma(_1376, _2688, _2966);
    int _2982 = abs(_2646);
    bool _2984 = !_2958;
    int _2986 = _2984 ? 0 : (-1);
    int _2988 = ~_2962;
    int _2990 = _2988 + 1;
    int _2992 = _2990 + 1;
    int _2994 = abs(_2974);
    int _2996 = abs(_2978);
    int _2998 = abs(_2986);
    int _3000 = _2992 * as_type<int>(_2768);
    int _3002 = _3000 + _2960;
    int _3004 = ~_2982;
    int _3006 = _3004 + 1;
    int _3008 = _3006 + 1;
    int _3010 = _3008 * as_type<int>(_2832);
    int _3012 = _3010 + _2946;
    int _3014 = ~_2994;
    int _3016 = _3014 + 1;
    int _3018 = _3016 + 1;
    float _3020 = _1356 * _2862;
    int _3022 = ~_2996;
    int _3024 = _3022 + 1;
    int _3026 = _3024 + 1;
    int _3028 = ~_2998;
    int _3030 = _3028 + 1;
    int _3032 = _3030 + 1;
    int _3034 = _3018 * as_type<int>(_2872);
    int _3036 = _3034 + _3002;
    float _3038 = float(uint(_2902));
    int _3040 = _3026 * as_type<int>(_2840);
    int _3042 = _3040 + _3012;
    bool _3044 = !_2524;
    int _3046 = _3044 ? 0 : 1;
    int _3048 = _3032 * as_type<int>(_2880);
    int _3050 = _3048 + _3036;
    bool _3052 = !_2528;
    int _3054 = _3052 ? 0 : 1;
    float _3056 = fma(_1390, _2858, _3020);
    int _3058 = abs(_3046);
    float _3060 = 1.0 / _3038;
    float _3062 = float(uint(_2956));
    int _3064 = abs(_3054);
    int _3066 = ~_3058;
    int _3068 = _3066 + 1;
    int _3070 = _3068 + 1;
    int _3072 = ~_3064;
    int _3074 = _3072 + 1;
    int _3076 = _3074 + 1;
    float _3078 = 1.0 / _3062;
    bool _3080 = !_1723;
    int _3082 = _3080 ? _2918 : (-1);
    int _3084 = _3042 * _3070;
    int _3086 = abs(_2902);
    int _3088 = _628 * _2936;
    int _3090 = _3088 + _1923;
    float _3092 = _1356 * _2692;
    int _3094 = _3076 * _3050;
    float _3096 = float(uint(_3086));
    int _3098 = _3082 * _3058;
    int _3100 = _3098 + _3084;
    float _3102 = _1354 * _2692;
    bool _3104 = !_1789;
    int _3106 = _3104 ? _3090 : (-1);
    float _3108 = -_2862;
    float _3110 = _1364 * _3108;
    int _3112 = abs(_2956);
    float _3114 = _1354 * _2862;
    int _3116 = as_type<int>(_3060) + (-2);
    float _3118 = -_2848;
    float _3120 = _1364 * _3118;
    float _3122 = float(uint(_3100));
    int _3124 = _3106 * _3064;
    int _3126 = _3124 + _3094;
    float _3128 = 1.0 / _3096;
    float _3130 = float(uint(_3112));
    float _3132 = fma(_1376, _2786, _3120);
    int _3134 = as_type<int>(_3078) + (-2);
    float _3136 = as_type<float>(_3116) * _3122;
    float _3138 = float(uint(_3126));
    float _3140 = _1356 * _2848;
    int _3142 = abs(_3100);
    float _3144 = 1.0 / _3130;
    float _3146 = fma(_1376, _2858, _3110);
    float _3148 = as_type<float>(_3134) * _3138;
    float _3150 = float(uint(_3142));
    float _3152 = fma(_1378, _2786, _2912);
    int _3154 = ~_2956;
    int _3156 = _3154 + 1;
    float _3158 = fma(_1378, _2858, _3114);
    float _3160 = -_2283;
    float _3162 = _3160 + 1.0;
    float _3164 = trunc(_3136);
    float _3166 = precise::max(_3164, 0.0);
    uint _3168 = uint(_3166);
    int _3170 = as_type<int>(_3128) + (-2);
    float _3172 = -_2794;
    float _3174 = fma(_1386, _3172, _3152);
    int _3176 = abs(_3126);
    float _3178 = _2496 * _2309;
    int _3180 = ~_2902;
    int _3182 = _3180 + 1;
    float _3184 = as_type<float>(_3170) * _3150;
    float _3186 = float(uint(_3176));
    float _3188 = trunc(_3148);
    float _3190 = precise::max(_3188, 0.0);
    uint _3192 = uint(_3190);
    int _3194 = as_type<int>(_3144) + (-2);
    float _3196 = fma(_1378, _2688, _3102);
    float _3198 = as_type<float>(_3194) * _3186;
    int _3200 = _3182 * int(_3168);
    int _3202 = _3200 + _3100;
    float _3204 = trunc(_3184);
    float _3206 = precise::max(_3204, 0.0);
    uint _3208 = uint(_3206);
    float _3210 = fma(_1390, _2786, _3140);
    int _3212 = ~_3086;
    int _3214 = _3212 + 1;
    float _3216 = -_2690;
    float _3218 = fma(_1386, _3216, _3196);
    float _3220 = float(uint(_3202));
    int _3222 = _3156 * int(_3192);
    int _3224 = _3222 + _3126;
    float _3226 = trunc(_3198);
    float _3228 = precise::max(_3226, 0.0);
    uint _3230 = uint(_3228);
    float _3232 = as_type<float>(_3116) * _3220;
    int _3234 = ~_3112;
    int _3236 = _3234 + 1;
    float _3238 = fma(_1390, _2688, _3092);
    float _3240 = float(uint(_3224));
    float _3242 = -_2794;
    float _3244 = fma(_1374, _3242, _3132);
    float _3246 = -_2690;
    float _3248 = fma(_1374, _3246, _2980);
    float _3250 = trunc(_3232);
    float _3252 = precise::max(_3250, 0.0);
    uint _3254 = uint(_3252);
    float _3256 = as_type<float>(_3134) * _3240;
    float _3258 = -_2778;
    float _3260 = fma(_1374, _3258, _3146);
    int _3262 = _3214 * int(_3208);
    int _3264 = _3262 + _3142;
    float _3266 = -_2794;
    float _3268 = fma(_1398, _3266, _3210);
    float _3270 = -_2690;
    float _3272 = fma(_1398, _3270, _3238);
    int _3274 = _3236 * int(_3230);
    int _3276 = _3274 + _3176;
    float _3278 = float(uint(_3264));
    float _3280 = trunc(_3256);
    float _3282 = precise::max(_3280, 0.0);
    uint _3284 = uint(_3282);
    float _3286 = float(uint(_3276));
    float _3288 = as_type<float>(_3170) * _3278;
    float _3290 = -_2778;
    float _3292 = fma(_1386, _3290, _3158);
    float _3294 = _3218 * _314;
    float _3296 = _3174 * _318;
    float _3298 = as_type<float>(_3194) * _3286;
    float _3300 = trunc(_3288);
    float _3302 = precise::max(_3300, 0.0);
    uint _3304 = uint(_3302);
    float _3306 = _3218 * _318;
    float _3308 = _3218 * _322;
    float _3310 = _3292 * _318;
    float _3312 = -_2778;
    float _3314 = fma(_1398, _3312, _3056);
    float _3316 = _3174 * _322;
    float _3318 = _3292 * _314;
    float _3320 = fma(_3248, _296, _3294);
    float _3322 = trunc(_3298);
    float _3324 = precise::max(_3322, 0.0);
    uint _3326 = uint(_3324);
    float _3328 = _3174 * _314;
    float _3330 = _3292 * _322;
    float _3332 = fma(_3248, _300, _3306);
    float _3334 = fma(_3248, _304, _3308);
    int _3336 = int(_3168) + int(_3254);
    float _3338 = fma(_3260, _300, _3310);
    int _3340 = ~_2902;
    int _3342 = _3340 + 1;
    float _3344 = fma(_3244, _304, _3316);
    int _3346 = int(_3192) + int(_3284);
    float _3348 = fma(_3314, _330, _3338);
    int _3350 = ~_2956;
    int _3352 = _3350 + 1;
    int _3354 = _3342 * _3336;
    int _3356 = _3354 + _3100;
    int _3358 = int(_3208) + int(_3304);
    float _3360 = fma(_3244, _300, _3296);
    int _3362 = ~_3086;
    int _3364 = _3362 + 1;
    int _3366 = _3352 * _3346;
    int _3368 = _3366 + _3126;
    int _3370 = int(_3230) + int(_3326);
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3374 = ~_3112;
    int _3376 = _3374 + 1;
    int _3378 = _3364 * _3358;
    int _3380 = _3378 + _3142;
    bool _3382 = uint(_3356) >= uint(_2902);
    bool _3384 = uint(_3368) >= uint(_2956);
    int _3386 = _3376 * _3370;
    int _3388 = _3386 + _3176;
    bool _3390 = !_3382;
    int _3392 = _3390 ? 0 : (-1);
    float _3394 = fma(_3260, _296, _3318);
    bool _3396 = uint(_3380) >= uint(_3086);
    float _3398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3400 = ~_3336;
    int _3402 = _3400 + _3392;
    int _3404 = _3402 + 1;
    float _3406 = fma(_3260, _304, _3330);
    bool _3408 = uint(_3388) >= uint(_3112);
    bool _3410 = !_3384;
    int _3412 = _3410 ? 0 : (-1);
    int _3414 = _2902 * _3404;
    int _3416 = _3414 + _3100;
    int _3418 = _3100 ^ _2902;
    float _3420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3422 = _3126 ^ _2956;
    float _3424 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3426 = ~_3346;
    int _3428 = _3426 + _3412;
    int _3430 = _3428 + 1;
    bool _3432 = _2902 == 0;
    float _3434 = fma(_3424, _2474, -0.5);
    bool _3436 = _2902 == 0;
    int _3438 = _2956 * _3430;
    int _3440 = _3438 + _3126;
    bool _3442 = !_3408;
    int _3444 = _3442 ? 0 : (-1);
    float _3446 = _3398 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _3448 = uint(int(uint(_3422) >> uint(31)));
    bool _3450 = !_3396;
    int _3452 = _3450 ? 0 : (-1);
    uint _3454 = uint(int(uint(_3418) >> uint(31)));
    int _3456 = ~_3444;
    int _3458 = _3370 + _3456;
    int _3460 = _3458 + 1;
    bool _3462 = !_3432;
    int _3464 = _3462 ? _3416 : (-1);
    float _3466 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3468 = ~int(_3448);
    int _3470 = _3468 + 1;
    int _3472 = ~_3452;
    int _3474 = _3358 + _3472;
    int _3476 = _3474 + 1;
    int _3478 = ~int(_3454);
    int _3480 = _3478 + 1;
    float _3482 = float(_3464);
    int _3484 = _3460 ^ _3470;
    int _3486 = _3476 ^ _3480;
    float _3488 = fma(_3424, _3482, _506);
    bool _3490 = _2956 == 0;
    bool _3492 = _2956 == 0;
    float _3494 = _3466 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3496 = ~_3470;
    int _3498 = _3496 + _3484;
    int _3500 = _3498 + 1;
    float _3502 = fma(_690, _3434, _3488);
    int _3504 = ~_3480;
    int _3506 = _3504 + _3486;
    int _3508 = _3506 + 1;
    float _3510 = _3420 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3512 = !_3490;
    int _3514 = _3512 ? _3440 : (-1);
    float _3516 = fma(_3494, _2440, -0.5);
    bool _3518 = !_3492;
    int _3520 = _3518 ? _3500 : (-1);
    float _3522 = fma(_3510, _2510, -0.5);
    bool _3524 = !_3436;
    int _3526 = _3524 ? _3508 : (-1);
    float _3528 = float(_3514);
    float _3530 = float(_3520);
    float _3532 = fma(_3272, _334, _3334);
    float _3534 = float(_3526);
    float _3536 = fma(_3510, _3528, _624);
    float _3538 = fma(_3446, _2420, -0.5);
    float _3540 = -_648;
    float _3542 = fma(_3494, _3530, _3540);
    float _3544 = fma(_3244, _296, _3328);
    float _3546 = -_514;
    float _3548 = fma(_3446, _3534, _3546);
    float _3550 = fma(_562, _3522, _3536);
    float _3552 = fma(_3268, _330, _3360);
    float _3554 = fma(_3314, _334, _3406);
    float _3556 = fma(_3268, _334, _3344);
    float _3558 = _2380 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3560 = _2380 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3562 = fma(_650, _3538, _3548);
    float _3564 = fma(_3272, _330, _3332);
    float _3566 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3558);
    float _3568 = fma(_1558, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3560);
    float _3570 = fma(_3272, _326, _3320);
    float _3572 = fma(_3314, _326, _3394);
    float _3574 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3566);
    float _3576 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3568);
    float _3578 = fma(_686, _3516, _3542);
    out.m_85.x = _3564;
    out.m_85.y = _3570;
    out.m_85.z = _3532;
    float _3580 = _3574 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3582 = _3576 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_87.x = _3348;
    out.m_87.y = _3572;
    out.m_87.z = _3554;
    float _3584 = 1.0 / _3580;
    float _3586 = _3582 + _3580;
    float _3588 = _2330 * _3178;
    float _3590 = in.m_63.x;
    float _3592 = fma(_3268, _326, _3544);
    float _3594 = _3550 + 0.5;
    float _3596 = _3502 + 0.5;
    float _3598 = _3578 + 0.5;
    float _3600 = _3562 + 0.5;
    float _3602 = fma(_2320, _3588, _2318);
    out.m_89.x = _3552;
    out.m_89.y = _3592;
    out.m_89.z = _3556;
    bool _3604 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3606 = isnan(_1985);
    bool _3608 = _3604 || _3606;
    bool _3610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3612 = _3608 || _3610;
    float _3614 = _3586 * _3584;
    float _3616 = _3614 * 0.5;
    out.m_91.x = _3596;
    out.m_91.y = _3600;
    out.m_91.z = _3594;
    out.m_91.w = _3598;
    float _3618 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3620 = fma(_3616, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3618);
    float _3622 = 1.0 / _3620;
    float _3624 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3626 = _3622 * _3624;
    float _3628 = abs(_3626);
    float _3630 = log2(_3628);
    bool _3632 = _3626 <= 8000.0;
    bool _3634 = isnan(_3626);
    bool _3636 = _3632 || _3634;
    bool _3638 = isnan(8000.0);
    bool _3640 = _3636 || _3638;
    float _3642 = float(_3640);
    float _3644 = _3630 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3646 = exp2(_3644);
    float _3648 = fma(_3646, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3650 = precise::clamp(_3648, 0.0, 1.0);
    float _3652 = _2213 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3654 = fma(_3650, -2.0, 3.0);
    float _3656 = _3650 * _3650;
    float _3658 = fma(_2219, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3652);
    float _3660 = _3656 * _3654;
    float _3662 = fma(_2217, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3658);
    float _3664 = -_3660;
    float _3666 = _3664 + 1.0;
    float _3668 = fma(_2237, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3662);
    float _3670 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3660);
    float _3672 = _3668 + _2261;
    out.gl_Position.x = _2285;
    out.gl_Position.y = _2281;
    out.gl_Position.z = _3668;
    out.gl_Position.w = _2261;
    float _3674 = _3642 * _3670;
    float _3676 = _3672 * 0.5;
    float _3678 = _3674 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_93.z = _3676;
    out.m_93.w = _2261;
    float _3680 = _3162 * _3678;
    float _3682 = precise::clamp(_3680, 0.0, 1.0);
    float _3684 = -_3682;
    float _3686 = fma(_3684, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3688 = _2320 * _3178;
    float _3690 = -_2496;
    float _3692 = _3690 + 1.0;
    float _3694 = _2261;
    float _3696 = _3676;
    float _3698 = _3668;
    float _3700 = _3692;
    if (!_3612)
    {
        _2344 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3702 = _2344;
    float _3704 = _3686 * _3590;
    float _3706 = fma(_2326, _3688, _2314);
    float _3708 = fma(_2328, _3688, _2316);
    float _3710 = _2320 * _3692;
    float _3712 = _3704 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3714 = _3702;
    float _3716 = _3702;
    if (!_3612)
    {
        _3694 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3718 = _3694;
    float _3720 = _3718;
    float _3722 = _3718;
    if (!_3612)
    {
        _3696 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3724 = _3696;
    out.m_95.x = _3706;
    out.m_95.y = _3708;
    out.m_95.z = _3602;
    out.m_95.w = _3710;
    float _3726 = _3724;
    float _3728 = _3724;
    if (!_3612)
    {
        _3698 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3730 = _3698;
    float _3732 = _3730;
    float _3734 = _3730;
    if (!_3612)
    {
        _2346 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3736 = _2346;
    out.m_97.x = _3712;
    float _3738 = _3736;
    float _3740 = _3736;
    if (!_3612)
    {
        _3700 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3742 = _3700;
    bool _3744 = !_3612;
    float _3746 = _3742;
    float _3748 = _3742;
    if (!_3744)
    {
        bool _3750 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3752 = isnan(_1985);
        bool _3754 = _3750 || _3752;
        bool _3756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3758 = _3754 || _3756;
        if (!_3758)
        {
            float _3760 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3762 = _1985 + _3760;
            float _3764 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3766 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3764;
            float _3768 = 1.0 / _3766;
            float _3770 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3772 = _3770 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3774 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3776 = _3774 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3778 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3780 = _3778 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3782 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3784 = _3782 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3786 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3788 = _3786 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3790 = _3762 * _3768;
            float _3792 = precise::clamp(_3790, 0.0, 1.0);
            float _3794 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3796 = _3794 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3798 = fma(_3792, _3772, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3800 = fma(_3792, _3796, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3802 = fma(_3792, _3776, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3804 = fma(_3792, _3780, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3806 = fma(_3792, _3784, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3808 = fma(_3792, _3788, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3728 = _3800;
            _3740 = _3806;
            _3722 = _3798;
            _3734 = _3804;
            _3716 = _3802;
            _3748 = _3808;
            _3810 = true;
        }
        else
        {
            bool _3812 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3814 = isnan(_1985);
            bool _3816 = _3812 || _3814;
            bool _3818 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3820 = _3816 || _3818;
            if (!_3820)
            {
                _3720 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3822 = _3720;
            _3722 = _3822;
            if (!_3820)
            {
                _3726 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3824 = _3726;
            _3728 = _3824;
            if (!_3820)
            {
                _3714 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3826 = _3714;
            _3716 = _3826;
            if (!_3820)
            {
                _3732 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3828 = _3732;
            _3734 = _3828;
            if (!_3820)
            {
                _3738 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3830 = _3738;
            _3740 = _3830;
            if (!_3820)
            {
                _3746 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3832 = _3746;
            bool _3834 = !_3820;
            _3748 = _3832;
            if (!_3834)
            {
                bool _3836 = _1985 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3838 = isnan(_1985);
                bool _3840 = _3836 || _3838;
                bool _3842 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3844 = _3840 || _3842;
                if (!_3844)
                {
                    float _3846 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3848 = _1985 + _3846;
                    float _3850 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3852 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3850;
                    float _3854 = 1.0 / _3852;
                    float _3856 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3858 = _3856 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3860 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3862 = _3860 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3864 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3866 = _3864 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3868 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3870 = _3868 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3872 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3874 = _3872 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3876 = _3848 * _3854;
                    float _3878 = precise::clamp(_3876, 0.0, 1.0);
                    float _3880 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3882 = _3880 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3884 = fma(_3878, _3858, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3886 = fma(_3878, _3882, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3888 = fma(_3878, _3862, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3890 = fma(_3878, _3866, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3892 = fma(_3878, _3870, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3894 = fma(_3878, _3874, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3728 = _3886;
                    _3740 = _3892;
                    _3722 = _3884;
                    _3734 = _3890;
                    _3716 = _3888;
                    _3748 = _3894;
                    _3810 = true;
                }
                else
                {
                    _3728 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3740 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3722 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3734 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3716 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3748 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3810 = false;
    float _3896 = _3728;
    float _3898 = _3740;
    float _3900 = _3722;
    float _3902 = _3734;
    float _3904 = _3716;
    float _3906 = _3748;
    float _3908 = fma(_3592, -0.5, 0.5);
    float _3910 = precise::clamp(_3908, 0.0, 1.0);
    float _3912 = -_3896;
    float _3914 = _3912 + _3898;
    float _3916 = -_3900;
    float _3918 = _3916 + _3902;
    float _3920 = -_3904;
    float _3922 = _3920 + _3906;
    bool _3924 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3926 = fma(_3910, _3914, _3896);
    float _3928 = fma(_3910, _3918, _3900);
    float _3930 = fma(_3910, _3922, _3904);
    float _3932 = _3926 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _3934 = fma(_3928, 0.298911988735198974609375, _3932);
    float _3936 = fma(_3930, 0.114477999508380889892578125, _3934);
    float _3938 = -_3936;
    float _3940 = _3928 + _3938;
    float _3942 = -_3936;
    float _3944 = _3926 + _3942;
    float _3946 = -_3936;
    float _3948 = _3930 + _3946;
    float _3950 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3952 = fma(_3940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    float _3954 = fma(_3944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    float _3956 = fma(_3948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3936);
    out.m_51.x = _3950;
    out.m_101.x = _3952;
    out.m_101.y = _3954;
    out.m_101.z = _3956;
    if (!_3924)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3958 = -_1963;
    float _3960 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3962 = -_1959;
    float _3964 = _3962 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3966 = -_1550;
    float _3968 = _3966 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3970 = _3960 * _3960;
    float _3972 = fma(_3964, _3964, _3970);
    float _3974 = fma(_3968, _3968, _3972);
    float _3976 = sqrt(_3974);
    float _3978 = rsqrt(_3974);
    float _3980 = -_3976;
    float _3982 = _3980 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3984 = _3982 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3986 = precise::clamp(_3984, 0.0, 1.0);
    float _3988 = _3964 * _3978;
    float _3990 = _3960 * _3978;
    float _3992 = abs(_3986);
    float _3994 = log2(_3992);
    float _3996 = _3968 * _3978;
    float _3998 = _3988 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4000 = _3592 * _3990;
    float _4002 = -_3990;
    float _4004 = -_3998;
    float _4006 = fma(_4002, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4004);
    float _4008 = fma(_3552, _3988, _4000);
    float _4010 = -_3996;
    float _4012 = fma(_4010, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4006);
    float _4014 = fma(_3556, _3996, _4008);
    float _4016 = precise::clamp(_4014, 0.0, 1.0);
    float _4018 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4020 = _4012 + _4018;
    float _4022 = _3994 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4024 = _4020 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4026 = precise::clamp(_4024, 0.0, 1.0);
    float _4028 = exp2(_4022);
    float _4030 = _4028 * _4026;
    float _4032 = _4016 * _4030;
    float _4034 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4036 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4038 = _4032 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _4034;
    out.m_99.y = _4036;
    out.m_99.z = _4038;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

