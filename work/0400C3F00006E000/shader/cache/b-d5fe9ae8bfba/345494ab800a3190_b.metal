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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_77 [[user(locn0)]];
    float4 m_75 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_101 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_89 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 m_97 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_93 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_50 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_79 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2125 = false;
    bool _1496 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2410 = as_type<float>(_136);
        out.gl_Position.z = _2410;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_55.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_174);
        out.gl_Position.z = _2479;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
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
    float _222 = _214;
    float _224 = _210;
    if (_218)
    {
        float _226 = rsqrt(_206);
        _222 = _226;
    }
    float _228 = _222;
    float _230 = 0.0;
    if (!_218)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _216 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    float _240 = _216;
    if (!_218)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    float _244 = 0.0;
    float _246 = _242;
    if (!_218)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _212;
    float _252 = _248;
    if (_220)
    {
        float _254 = rsqrt(_208);
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_220)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = 0.0;
    float _264 = _260;
    if (!_220)
    {
        _262 = 0.0;
    }
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _266;
    if (!_220)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    if (_234)
    {
        float _278 = rsqrt(_210);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _228;
    if (_218)
    {
        float _284 = _228 * _182;
        _238 = _284;
    }
    float _286 = _238;
    if (_218)
    {
        float _288 = _228 * _176;
        _246 = _288;
    }
    float _290 = _246;
    if (_218)
    {
        float _292 = _228 * _188;
        _252 = _292;
    }
    float _294 = _252;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_234)
    {
        _240 = 0.0;
    }
    float _298 = _240;
    float _300 = _298;
    if (!_234)
    {
        _282 = 0.0;
    }
    float _302 = _282;
    float _304 = _302;
    if (_220)
    {
        float _306 = _256 * _184;
        _264 = _306;
    }
    float _308 = _264;
    if (!_234)
    {
        _224 = 0.0;
    }
    float _310 = _224;
    float _312 = _310;
    if (_220)
    {
        float _314 = _256 * _178;
        _270 = _314;
    }
    float _316 = _270;
    if (_220)
    {
        float _318 = _256 * _190;
        _276 = _318;
    }
    float _320 = _276;
    if (_234)
    {
        float _322 = _280 * _186;
        _300 = _322;
    }
    float _324 = _300;
    if (_234)
    {
        float _326 = _280 * _180;
        _312 = _326;
    }
    float _328 = _312;
    if (_234)
    {
        float _330 = _280 * _192;
        _304 = _330;
    }
    float _332 = _304;
    bool _334 = !_296;
    float _336 = _332;
    float _354;
    if (!_334)
    {
        float _338 = in.m_63.x;
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
    float _366 = in.m_50.x;
    float _368 = in.m_50.y;
    float _370 = in.m_50.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _364 + _372;
    float _376 = in.m_63.x;
    float _378 = in.m_63.y;
    float _380 = in.m_63.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _396 = _394 != 0;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _400 = _398 != 0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _364 + _402;
    float _406 = 1.0 / _384;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _408;
    float _412 = 1.0 / _388;
    bool _414 = !_392;
    int _416 = _414 ? 0 : 1;
    bool _418 = !_396;
    int _420 = _418 ? 0 : 1;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    int _426 = abs(_416);
    float _428 = _184 * _368;
    float _430 = _190 * _368;
    float _432 = 1.0 / _410;
    int _434 = abs(_420);
    float _436 = fma(_182, _366, _428);
    float _438 = _380 * 2.0;
    float _440 = fma(_188, _366, _430);
    float _442 = _378 + _380;
    float _444 = _376 + _380;
    float _446 = _380 + (-0.5);
    float _448 = _378 + _376;
    float _450 = _376 + (-0.5);
    float _452 = _376 * 2.0;
    float _454 = _378 + (-0.5);
    float _456 = _378 * 2.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = _364 + _458;
    float _462 = floor(_438);
    float _464 = _448 + (-1.0);
    float _466 = _442 + (-1.0);
    float _468 = _460 * _406;
    float _470 = _374 * _412;
    float _472 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _474 = floor(_452);
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _478 = _444 + (-1.0);
    float _480 = _404 * _432;
    float _482 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _484 = fma(_186, _370, _436);
    float _486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _488 = log2(_486);
    bool _490 = _462 > 0.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _492;
    bool _496 = _462 >= 0.0;
    bool _498 = isnan(_462);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _510 = fma(_494, _468, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _512 = _504 ? 0 : 1;
    float _514 = floor(_456);
    bool _516 = _474 > 0.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _518;
    bool _522 = _474 >= 0.0;
    bool _524 = isnan(_474);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _544 = _530 ? 0 : 1;
    float _546 = _488 * _154;
    float _548 = fma(_508, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_520, _468, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _552 = ~_512;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = fma(_534, _468, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _560 = ~_544;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _568 = 1.0 + _566;
    bool _570 = _514 > 0.0;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _572;
    bool _576 = _514 >= 0.0;
    bool _578 = isnan(_514);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = fma(_538, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _588 = fma(_542, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _590 = _556;
    int _592 = _564;
    float _594 = _370;
    if (!_490)
    {
        int _596 = ~_512;
        int _598 = _596 + 1;
        _590 = _598;
    }
    int _600 = _590;
    float _602 = exp2(_546);
    if (!_516)
    {
        int _604 = ~_544;
        int _606 = _604 + 1;
        _592 = _606;
    }
    int _608 = _592;
    float _610 = fma(_192, _370, _440);
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    bool _618 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    float _628 = _178 * _368;
    bool _630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = 1.0 / _568;
    float _642 = float(_600);
    float _644 = fma(_176, _366, _628);
    float _646 = float(_608);
    int _648 = _584 ? 0 : 1;
    float _650 = fma(_180, _370, _644);
    float _652 = -_602;
    float _654 = _652 + 1.0;
    float _656 = fma(_424, _480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _658 = float(_426);
    float _660 = float(_434);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _662;
    float _666 = _638 ? _654 : 0.0;
    float _668 = _658 * _642;
    int _670 = ~_648;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = _660 * _646;
    int _678 = _674;
    if (!_570)
    {
        int _680 = ~_648;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    if (_626)
    {
        float _686 = _666 * _640;
        _158 = _686;
    }
    float _688 = _158;
    float _690 = _668 * (-2.0);
    float _692 = _676 * (-2.0);
    bool _694 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _696 = isnan(_364);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = fma(_664, _480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _708 = fma(_476, _690, _476);
    float _710 = fma(_690, _612, _612);
    float _712 = fma(_692, _614, _614);
    bool _714 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _716 = isnan(_364);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_704;
    float _728 = _726 + 1.0;
    float _730 = fma(_472, _692, _472);
    float _732 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[196].x, _710);
    bool _734 = !_400;
    int _736 = _734 ? 0 : 1;
    float _738 = _724 * _728;
    bool _740 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _742 = isnan(_364);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -_724;
    float _754 = _752 + 1.0;
    float _756 = fma(_708, _688, _732);
    int _758 = abs(_736);
    float _760 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _712);
    bool _762 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _764 = isnan(_364);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = _750 * _754;
    float _776 = -_750;
    float _778 = _776 + 1.0;
    float _780 = fma(_574, _480, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _782 = fma(_730, _688, _760);
    float _784 = _772 * _778;
    float _786 = float(_758);
    float _788 = -_772;
    float _790 = _788 + 1.0;
    float _792 = float(_684);
    float _794 = _510 * _784;
    float _796 = _558 * _784;
    float _798 = _550 * _784;
    float _800 = in.m_67.x;
    float _802 = in.m_67.y;
    float _804 = in.m_67.z;
    float _806 = _786 * _792;
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].x, _798);
    float _812 = in.m_69.x;
    float _814 = in.m_69.y;
    float _816 = in.m_69.z;
    float _818 = _806 * (-2.0);
    float _820 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    float _822 = fma(_586, _774, _810);
    float _824 = fma(_588, _774, _808);
    float _826 = fma(_818, _616, _616);
    float _828 = fma(_482, _818, _482);
    float _830 = fma(_548, _774, _820);
    float _832 = _756 * 0.15915493667125701904296875;
    float _834 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[196].z, _826);
    float _836 = _782 * 0.15915493667125701904296875;
    float _838 = fma(_706, _738, _822);
    float _840 = fma(_780, _738, _824);
    float _842 = fma(_828, _688, _834);
    float _844 = fma(_656, _738, _830);
    float _846 = _832 * 6.283185482025146484375;
    float _848 = cos(_846);
    float _850 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].x, _838);
    float _852 = _842 * 0.15915493667125701904296875;
    float _854 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].z, _840);
    float _856 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].y, _844);
    float _858 = in.m_61.w;
    float _860 = _854 * _804;
    float _862 = _836 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _856 * _802;
    float _868 = _850 * _800;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _812);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _814);
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _876 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _878 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _880 = _836 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _872 * _874;
    float _886 = _870 * _876;
    float _888 = in.m_59.w;
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    float _892 = _852 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = _848 * _864;
    float _898 = _890 * _878;
    float _900 = _832 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = _848 * _882;
    float _906 = _852 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _848 * _894;
    float _912 = _882 * _894;
    float _914 = _910 * _884;
    float _916 = _902 * _864;
    float _918 = _902 * _882;
    float _920 = _902 * _894;
    float _922 = _864 * _894;
    float _924 = _920 * _884;
    float _926 = fma(_908, _904, _916);
    float _928 = -_884;
    float _930 = _908 * _928;
    float _932 = -_918;
    float _934 = fma(_908, _896, _932);
    float _936 = -_896;
    float _938 = fma(_908, _918, _936);
    float _940 = fma(_926, _886, _914);
    float _942 = fma(_912, _886, _930);
    float _944 = fma(_908, _916, _904);
    float _946 = fma(_938, _886, _924);
    float _948 = fma(_934, _898, _940);
    float _950 = fma(_922, _898, _942);
    float _952 = _610 + _858;
    float _954 = fma(_944, _898, _946);
    float _956 = _948 * _308;
    float _958 = _948 * _320;
    float _960 = _484 + _888;
    float _962 = _948 * _316;
    float _964 = fma(_950, _286, _956);
    float _966 = fma(_950, _294, _958);
    float _968 = fma(_950, _290, _962);
    float _970 = fma(_954, _324, _964);
    float _972 = fma(_954, _332, _966);
    float _974 = in.m_57.w;
    float _976 = _960 + _970;
    float _978 = _952 + _972;
    float _980 = fma(_954, _328, _968);
    float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _984 = _976 + _982;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _978 + _986;
    float _990 = _984 * _984;
    float _992 = _988 * _988;
    float _994 = _990 + _992;
    float _996 = sqrt(_994);
    float _998 = _650 + _974;
    float _1000 = _998 + _980;
    float _1002 = fma(_960, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1004 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1008 = _996 + _1006;
    float _1010 = floor(_1002);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1014 = floor(_1012);
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1018 = _976;
    float _1020 = _978;
    float _1022 = _912;
    float _1024 = _1000;
    float _1026 = _990;
    float _1028 = _992;
    if (_1004)
    {
        float _1030 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1030;
    }
    float _1032 = _1016;
    float _1034 = _834;
    float _1036 = _1032;
    if (_1004)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1038;
    }
    float _1040 = _1034;
    if (_1004)
    {
        float _1042 = rsqrt(_994);
        _594 = _1042;
    }
    float _1044 = _594;
    float _1046 = -_1014;
    float _1048 = _1012 + _1046;
    float _1050 = _1040;
    if (_1004)
    {
        float _1052 = _1008 * _1040;
        _1050 = _1052;
    }
    float _1054 = _1050;
    float _1056 = -_1010;
    float _1058 = _1002 + _1056;
    float _1060 = _1054;
    if (_1004)
    {
        float _1062 = _1054 * 0.15915493667125701904296875;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = _176;
    if (_1004)
    {
        float _1068 = _1064 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        _1066 = _1070;
    }
    float _1072 = _1066;
    if (_1004)
    {
        float _1074 = fma(_1072, _1032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1036 = _1074;
    }
    float _1076 = _1036;
    float _1078 = _1076;
    if (_1004)
    {
        float _1080 = _1044 * _1076;
        _1078 = _1080;
    }
    float _1082 = _1078;
    if (_1004)
    {
        float _1084 = fma(_984, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1018 = _1084;
    }
    float _1086 = _1018;
    if (_1004)
    {
        float _1088 = fma(_988, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1020 = _1088;
    }
    float _1090 = _1020;
    float _1092 = fma(_1086, 6.2500002968590706586837768554688e-05, 0.5);
    float _1094 = fma(_1090, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3844 = float2(_1092, _1094);
    float3 _1098 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3844, float2(0.0), isnan(_3844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3844, float2(0.0), isnan(_3844)), level(0.0)).xyz;
    float _1100 = _1098.x;
    float _1102 = _1098.y;
    float _1104 = _1098.z;
    float2 _3860 = float2(_1058, _1048);
    float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3860, float2(0.0), isnan(_3860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3860, float2(0.0), isnan(_3860)), level(0.0)).x;
    float _1108 = in.m_71.y;
    bool _1110 = _814 != 0.0;
    bool _1112 = isnan(_814);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    float _1120 = _1064;
    if (_1004)
    {
        float _1122 = _1064 * 6.283185482025146484375;
        float _1124 = cos(_1122);
        _1120 = _1124;
    }
    float _1126 = _1120;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1130 = _1128 != 0;
    float _1132 = in.m_63.w;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1136 = _1134 != 0;
    bool _1138 = _812 == 0.0;
    bool _1140 = !_1118;
    bool _1142 = _1138 && _1140;
    float _1144 = in.m_71.x;
    bool _1146 = _816 == 0.0;
    bool _1148 = _1146 && _1142;
    float _1150 = in.m_73.x;
    float _1152 = in.m_73.y;
    float _1154 = in.m_73.z;
    float _1156 = _948;
    float _1158 = 1.0;
    float _1160 = 1.0;
    if (_1130)
    {
        float _1162 = in.m_63.z;
        _1156 = _1162;
    }
    float _1164 = _1156;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1170 = -_1108;
    float _1172 = _1170 + 1.0;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1180 = _1132 > 0.5;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1108;
    if (_1136)
    {
        float _1188 = _1180 ? _1172 : _1108;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = 0.0;
    if (_1130)
    {
        _1192 = _1144;
    }
    float _1194 = _1192;
    out.m_77.x = _1178;
    out.m_77.y = _1182;
    out.m_77.z = _1184;
    out.m_77.w = _1176;
    float _1196 = _1194;
    if (!_1130)
    {
        _1158 = _1144;
    }
    float _1198 = _1158;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (_1148)
    {
        _1200 = _1152;
    }
    float _1204 = _1200;
    float _1206 = _1204;
    if (!_1148)
    {
        float _1208 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1152);
        _1206 = _1208;
    }
    float _1210 = _1206;
    bool _1212 = _1164 > 0.5;
    bool _1214 = _1212 && _1130;
    float _1216 = in.m_79.x;
    float _1218 = in.m_79.y;
    float _1220 = in.m_79.z;
    float _1222 = in.m_79.w;
    if (_1148)
    {
        _1160 = _1154;
    }
    float _1224 = _1160;
    float _1226 = _1224;
    if (!_1148)
    {
        float _1228 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1154);
        _1226 = _1228;
    }
    float _1230 = _1226;
    float _1232 = 0.0;
    if (_1148)
    {
        _1232 = _1150;
    }
    float _1234 = _1232;
    float _1236 = _1234;
    if (!_1148)
    {
        float _1238 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = _920 * _1210;
    if (_1214)
    {
        float _1244 = -_1194;
        float _1246 = _1244 + 1.0;
        _1196 = _1246;
    }
    float _1248 = _1196;
    if (_1130)
    {
        _1202 = _1248;
    }
    float _1250 = _1202;
    float _1252 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1254 = _1220 * _1150;
    float _1256 = _1218 * _1154;
    float _1258 = _1216 * _1152;
    float _1260 = -_1254;
    float _1262 = fma(_1216, _1154, _1260);
    float _1264 = -_1256;
    float _1266 = fma(_1220, _1152, _1264);
    float _1268 = -_1258;
    float _1270 = fma(_1218, _1150, _1268);
    float _1272 = -_1210;
    float _1274 = _908 * _1272;
    float _1276 = _1262 * _1222;
    float _1278 = _1266 * _1222;
    float _1280 = _910 * _1210;
    float _1282 = _1270 * _1222;
    float _1284 = -_1276;
    float _1286 = _908 * _1284;
    float _1288 = _910 * _1276;
    float _1290 = _920 * _1276;
    float _1292 = -_1218;
    float _1294 = _908 * _1292;
    float _1296 = _910 * _1218;
    float _1298 = fma(_912, _1240, _1274);
    float _1300 = _920 * _1218;
    float _1302 = fma(_926, _1240, _1280);
    float _1304 = fma(_938, _1240, _1242);
    float _1306 = fma(_912, _1278, _1286);
    float _1308 = fma(_926, _1278, _1288);
    float _1310 = fma(_938, _1278, _1290);
    float _1312 = fma(_912, _1216, _1294);
    float _1314 = fma(_926, _1216, _1296);
    float _1316 = fma(_938, _1216, _1300);
    float _1318 = fma(_922, _1230, _1298);
    float _1320 = fma(_934, _1230, _1302);
    float _1322 = fma(_944, _1230, _1304);
    float _1324 = fma(_922, _1282, _1306);
    float _1326 = fma(_934, _1282, _1308);
    float _1328 = fma(_944, _1282, _1310);
    float _1330 = fma(_922, _1220, _1312);
    float _1332 = fma(_934, _1220, _1314);
    float _1334 = _1282;
    float _1336 = _1330;
    if (_1004)
    {
        float _1338 = _1126 + (-1.0);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = fma(_944, _1220, _1316);
    float _1344 = _1320 * _308;
    float _1346 = _1320 * _316;
    float _1348 = _1320 * _320;
    float _1350 = _1348;
    if (_1004)
    {
        float _1352 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1352;
    }
    float _1354 = _1022;
    float _1356 = _1332 * _308;
    float _1358 = _1332 * _316;
    float _1360 = _1332 * _320;
    float _1362 = _1326 * _320;
    float _1364 = fma(_1318, _294, _1348);
    float _1366 = _1364;
    if (_1004)
    {
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1370 = _1086 + _1368;
        _1350 = _1370;
    }
    float _1372 = _1350;
    if (_1004)
    {
        float _1374 = fma(_1000, _1126, _1354);
        _1024 = _1374;
    }
    float _1376 = _1024;
    float _1378 = fma(_1330, _286, _1356);
    float _1380 = fma(_1330, _290, _1358);
    float _1382 = fma(_1330, _294, _1360);
    if (_1004)
    {
        float _1384 = _1372 * _1372;
        _1026 = _1384;
    }
    float _1386 = _1026;
    if (_1004)
    {
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1390 = _1090 + _1388;
        _1336 = _1390;
    }
    float _1392 = _1336;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1396 = _1376 + _1394;
    float _1398 = fma(_1318, _286, _1344);
    float _1400 = fma(_1318, _290, _1346);
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1004)
    {
        float _1404 = _1392 * _1392;
        _1028 = _1404;
    }
    float _1406 = _1028;
    float _1408 = fma(_1396, _1396, _1386);
    float _1410 = _1326 * _316;
    float _1412 = _1326 * _308;
    float _1414 = fma(_1324, _294, _1362);
    float _1416 = _1408 + _1406;
    float _1418 = fma(_1324, _290, _1410);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1422 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1424 = fma(_1324, _286, _1412);
    float _1426 = fma(_1342, _324, _1378);
    float _1428 = fma(_1342, _328, _1380);
    float _1430 = fma(_1342, _332, _1382);
    float _1432 = fma(_1322, _324, _1398);
    float _1434 = fma(_1322, _328, _1400);
    float _1436 = sqrt(_1416);
    float _1438 = _1252 * _1402;
    float _1440 = fma(_1328, _328, _1418);
    float _1442 = fma(_1328, _332, _1414);
    float _1444 = fma(_1322, _332, _1364);
    out.m_81.x = _1426;
    out.m_81.y = _1428;
    out.m_81.z = _1430;
    float _1446 = _1422 * _1420;
    float _1448 = fma(_1328, _324, _1424);
    out.m_83.x = _1432;
    out.m_83.y = _1434;
    out.m_83.z = _1444;
    out.m_85.z = _1438;
    out.m_85.w = _1446;
    bool _1450 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1452 = isnan(_1436);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1458 = _1454 || _1456;
    out.m_87.x = _1448;
    out.m_87.y = _1440;
    out.m_87.z = _1442;
    float _1460 = _1438;
    if (!_1458)
    {
        _336 = 1.0;
    }
    float _1462 = _336;
    out.m_89.x = _1100;
    out.m_89.y = _1102;
    out.m_89.z = _1104;
    bool _1464 = !_1458;
    float _1466 = _1462;
    if (!_1464)
    {
        bool _1468 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1470 = isnan(_1436);
        bool _1472 = _1468 || _1470;
        bool _1474 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1476 = _1472 || _1474;
        if (!_1476)
        {
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1480 = _1436 + _1478;
            float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1484 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1482;
            float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1488 = _1486 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1490 = 1.0 / _1484;
            float _1492 = _1480 * _1490;
            float _1494 = fma(_1492, _1488, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1466 = _1494;
            _1496 = true;
        }
        else
        {
            bool _1498 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1500 = isnan(_1436);
            bool _1502 = _1498 || _1500;
            bool _1504 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1506 = _1502 || _1504;
            if (!_1506)
            {
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1510 = _1436 + _1508;
                float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1514 = _1512 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1518 = _1516 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1520 = 1.0 / _1514;
                float _1522 = _1510 * _1520;
                float _1524 = fma(_1522, _1518, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1466 = _1524;
                _1496 = true;
            }
            else
            {
                _1466 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1496 = false;
    float _1526 = _1466;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1530 = _1376 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1534 = _1086 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1538 = _1090 + _1536;
    float _1540 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1542 = fma(_1534, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1544 = fma(_1538, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1548 = _1540 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = _1542 + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = _1544 + _1554;
    float _1558 = _1548 * _1548;
    float _1560 = fma(_1552, _1552, _1558);
    float _1562 = fma(_1556, _1556, _1560);
    float _1564 = rsqrt(_1562);
    float _1566 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1568 = _1552 * _1566;
    float _1570 = _1556 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 * _1570;
    float _1576 = _1572 + _1574;
    float _1578 = sqrt(_1576);
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1584 = _1578 + _1582;
    float _1586 = _1556;
    float _1588 = _1576;
    float _1590 = _1584;
    float _1592 = _1566;
    float _1594 = _1568;
    if (_1580)
    {
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1596;
    }
    float _1598 = _1586;
    if (_1580)
    {
        float _1600 = rsqrt(_1576);
        _1588 = _1600;
    }
    float _1602 = _1588;
    float _1604 = _1602;
    if (_1580)
    {
        float _1606 = _1584 * _1598;
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1580)
    {
        float _1610 = _1608 * 0.15915493667125701904296875;
        _1366 = _1610;
    }
    float _1612 = _1366;
    float _1614 = _1564;
    if (_1580)
    {
        float _1616 = _1612 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1624 = precise::max(0.0, _1622);
    float _1626 = _324;
    float _1628 = _1624;
    float _1630 = _1622;
    if (_1580)
    {
        float _1632 = _1612 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = -_1566;
    float _1640 = -_1624;
    float _1642 = fma(_1548, _1638, _1640);
    float _1644 = _1642;
    if (_1580)
    {
        float _1646 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1628 = _1646;
    }
    float _1648 = _1628;
    float _1650 = _1620;
    float _1652 = _1648;
    if (_1580)
    {
        float _1654 = fma(_1620, _1648, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = _1656;
    if (!_1580)
    {
        _1652 = _1570;
    }
    float _1660 = _1652;
    float _1662 = _1660;
    if (_1580)
    {
        float _1664 = _1636 + (-1.0);
        _1630 = _1664;
    }
    float _1666 = _1630;
    if (_1580)
    {
        float _1668 = _1602 * _1656;
        _1460 = _1668;
    }
    float _1670 = _1460;
    if (!_1580)
    {
        _1658 = _1642;
    }
    float _1672 = _1658;
    float _1674 = _1672;
    if (_1580)
    {
        float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1676;
    }
    float _1678 = _1592;
    if (_1580)
    {
        float _1680 = _1568 * _1670;
        _1594 = _1680;
    }
    float _1682 = _1594;
    float _1684 = sqrt(_1562);
    if (!_1580)
    {
        _1604 = _1572;
    }
    float _1686 = _1604;
    float _1688 = _1686;
    if (_1580)
    {
        float _1690 = fma(_1642, _1636, _1678);
        _1674 = _1690;
    }
    float _1692 = _1674;
    if (_1580)
    {
        float _1694 = _1570 * _1670;
        _1662 = _1694;
    }
    float _1696 = _1662;
    if (_1580)
    {
        float _1698 = _1682 * _1682;
        _1688 = _1698;
    }
    float _1700 = _1688;
    if (!_1580)
    {
        _1644 = _1574;
    }
    float _1702 = _1644;
    float _1704 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = _1702;
    if (_1580)
    {
        float _1708 = _1696 * _1696;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = fma(_1692, _1692, _1700);
    float _1714 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1716 = _1712 + _1710;
    float _1718 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1720 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1722 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = rsqrt(_1716);
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1728 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1726);
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1718);
    float _1734 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1738 = -_1730;
    float _1740 = _1738 + 1.0;
    float _1742 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1744 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1732);
    float _1746 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1748 = abs(_1740);
    float _1750 = log2(_1748);
    float _1752 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1742);
    float _1754 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1736, 1.0);
    float _1764 = _1724 * _1682;
    float _1766 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1746);
    float _1768 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1770 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1772 = _1724 * _1692;
    float _1774 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1776 = _1724 * _1696;
    float _1778 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1770);
    float _1780 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = -_1774;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1788 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1778);
    float _1790 = log2(_1762);
    float _1792 = -_1776;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1796 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1798 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1788);
    float _1800 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1802 = fma(_1794, -0.5, 0.5);
    float _1804 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1796);
    float _1806 = fma(_1794, 0.5, 0.5);
    float _1808 = exp2(_1786);
    float _1810 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1800);
    float _1812 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1804);
    float _1814 = fma(_1806, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1816 = _1772 + 1.0;
    float _1818 = fma(_1806, _1814, -0.212114393711090087890625);
    float _1820 = 1.0 / _1798;
    float _1822 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1824 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1812);
    float _1826 = _1790 * 0.693147182464599609375;
    float _1828 = fma(_1806, _1818, 1.570728778839111328125);
    float _1830 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1822);
    float _1832 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1834 = sqrt(_1802);
    float _1836 = -_1772;
    float _1838 = fma(_1808, _1816, _1836);
    float _1840 = fma(_1838, 0.5, 0.5);
    float _1842 = _1824 * _1820;
    float _1844 = _1830 * _1820;
    float _1846 = fma(_1842, 0.5, 0.5);
    float _1848 = fma(_1844, -0.5, 0.5);
    float _1850 = _1834 * 0.636619746685028076171875;
    float _1852 = -_1828;
    float _1854 = fma(_1850, _1852, 1.0);
    float3 _5144 = float3(_1846, _1848, _1832);
    float _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5144, float3(0.0), isnan(_5144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5144, float3(0.0), isnan(_5144)), level(0.0)).x;
    float3 _5155 = float3(_1846, _1848, _1832);
    float4 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5155, float3(0.0), isnan(_5155)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5155, float3(0.0), isnan(_5155)), level(0.0)).xyzw;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1859.w;
    float2 _5171 = float2(_1854, _1840);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5171, float2(0.0), isnan(_5171)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5171, float2(0.0), isnan(_5171)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _998 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1879 = _998 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1881 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1883 = -_1106;
    float _1885 = _1883 + 1.0;
    float _1887 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1877);
    float _1889 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1879);
    float _1891 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1881);
    out.m_91.x = _1542;
    out.m_91.y = _1540;
    out.m_91.z = _1544;
    float _1893 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1887);
    float _1895 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    float _1897 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1891);
    float _1899 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1897);
    float _1905 = 1.0 / _1899;
    float _1907 = _1901 + _1899;
    float _1909 = in.m_93.x;
    bool _1911 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1913 = isnan(_1684);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1919 = _1915 || _1917;
    out.gl_Position.x = _1824;
    out.gl_Position.y = _1830;
    out.gl_Position.z = _1903;
    out.gl_Position.w = _1798;
    float _1921 = _1907 * _1905;
    float _1923 = _1921 * 0.5;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1927 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
    float _1929 = _1903;
    float _1931 = _1824;
    float _1933 = _1867;
    float _1935 = _1865;
    if (!_1919)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1937 = _1929;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1919)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1943 = _1931;
    float _1945 = 1.0 / _1927;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1949 = _1945 * _1947;
    float _1951 = abs(_1949);
    float _1953 = log2(_1951);
    bool _1955 = _1949 <= 8000.0;
    bool _1957 = isnan(_1949);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan(8000.0);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1969 = exp2(_1967);
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1977 = fma(_1973, -2.0, 3.0);
    float _1979 = _1973 * _1973;
    float _1981 = exp2(_1975);
    float _1983 = _1979 * _1977;
    float _1985 = -_1983;
    float _1987 = _1985 + 1.0;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1983);
    float _1991 = _1965 * _1989;
    float _1993 = -_1981;
    float _1995 = _1993 + 1.0;
    float _1997 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2001 = _1885 * _1997;
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = -_1999;
    float _2007 = _2005 + 1.0;
    float _2009 = -_2003;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = _2011 * _1909;
    float _2015 = _2013 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.x = _2015;
    float _2017 = _2015;
    float _2019 = _1999;
    float _2021 = _1943;
    float _2023 = _1943;
    if (!_1919)
    {
        _2017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2025 = _2017;
    float _2027 = _1999 * _1856;
    float _2029 = _2025;
    float _2031 = _2025;
    if (!_1919)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2033 = _2019;
    float _2035 = _1867 * _2027;
    float _2037 = _1875 * _2027;
    float _2039 = fma(_1871, _2035, _1861);
    float _2041 = fma(_1873, _2035, _1863);
    float _2043 = _1867 * _2007;
    float _2045 = fma(_1867, _2037, _1865);
    float _2047 = _2033;
    float _2049 = _2033;
    if (!_1919)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2051 = _1933;
    float _2053 = _2051;
    float _2055 = _2051;
    if (!_1919)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2057 = _1935;
    out.m_97.x = _2039;
    out.m_97.y = _2041;
    out.m_97.z = _2045;
    out.m_97.w = _2043;
    bool _2059 = !_1919;
    float _2061 = _2057;
    float _2063 = _2057;
    if (!_2059)
    {
        bool _2065 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2067 = isnan(_1684);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2073 = _2069 || _2071;
        if (!_2073)
        {
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2077 = _1684 + _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2079;
            float _2083 = 1.0 / _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2105 = _2077 * _2083;
            float _2107 = precise::clamp(_2105, 0.0, 1.0);
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2113 = fma(_2107, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2115 = fma(_2107, _2111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2117 = fma(_2107, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2119 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2121 = fma(_2107, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2123 = fma(_2107, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2031 = _2115;
            _2063 = _2121;
            _1941 = _2113;
            _2055 = _2119;
            _2023 = _2117;
            _2049 = _2123;
            _2125 = true;
        }
        else
        {
            bool _2127 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2129 = isnan(_1684);
            bool _2131 = _2127 || _2129;
            bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2135 = _2131 || _2133;
            if (!_2135)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2137 = _1939;
            _1941 = _2137;
            if (!_2135)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2139 = _2029;
            _2031 = _2139;
            if (!_2135)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2141 = _2021;
            _2023 = _2141;
            if (!_2135)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2143 = _2053;
            _2055 = _2143;
            if (!_2135)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2145 = _2061;
            _2063 = _2145;
            if (!_2135)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2147 = _2047;
            bool _2149 = !_2135;
            _2049 = _2147;
            if (!_2149)
            {
                bool _2151 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2153 = isnan(_1684);
                bool _2155 = _2151 || _2153;
                bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2159 = _2155 || _2157;
                if (!_2159)
                {
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2163 = _1684 + _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2165;
                    float _2169 = 1.0 / _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2191 = _2163 * _2169;
                    float _2193 = precise::clamp(_2191, 0.0, 1.0);
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2199 = fma(_2193, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2201 = fma(_2193, _2197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2203 = fma(_2193, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2205 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2207 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2031 = _2201;
                    _2063 = _2207;
                    _1941 = _2199;
                    _2055 = _2205;
                    _2023 = _2203;
                    _2049 = _2209;
                    _2125 = true;
                }
                else
                {
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2125 = false;
    float _2211 = _2031;
    float _2213 = _2063;
    float _2215 = _1941;
    float _2217 = _2055;
    float _2219 = _2023;
    float _2221 = _2049;
    float _2223 = fma(_1434, -0.5, 0.5);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    float _2231 = -_2215;
    float _2233 = _2231 + _2217;
    float _2235 = -_2219;
    float _2237 = _2235 + _2221;
    bool _2239 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2241 = fma(_2225, _2229, _2211);
    float _2243 = fma(_2225, _2233, _2215);
    float _2245 = fma(_2225, _2237, _2219);
    float _2247 = _2241 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2249 = fma(_2243, 0.298911988735198974609375, _2247);
    float _2251 = fma(_2245, 0.114477999508380889892578125, _2249);
    out.m_99.x = 0.0;
    float _2253 = -_2251;
    float _2255 = _2243 + _2253;
    float _2257 = -_2251;
    float _2259 = _2241 + _2257;
    float _2261 = -_2251;
    float _2263 = _2245 + _2261;
    float _2265 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2267 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2269 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2271 = fma(_2263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    out.m_95.w = _2265;
    out.m_101.x = _2267;
    out.m_101.y = _2269;
    out.m_101.z = _2271;
    if (!_2239)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2273 = -_1540;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2277 = -_1542;
    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2281 = -_1544;
    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2285 = _2275 * _2275;
    float _2287 = fma(_2279, _2279, _2285);
    float _2289 = fma(_2283, _2283, _2287);
    float _2291 = sqrt(_2289);
    float _2293 = rsqrt(_2289);
    float _2295 = -_2291;
    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2299 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = _2279 * _2293;
    float _2305 = _2275 * _2293;
    float _2307 = abs(_2301);
    float _2309 = log2(_2307);
    float _2311 = _2283 * _2293;
    float _2313 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2315 = _1434 * _2305;
    float _2317 = -_2305;
    float _2319 = -_2313;
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2319);
    float _2323 = fma(_1432, _2303, _2315);
    float _2325 = -_2311;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2321);
    float _2329 = fma(_1444, _2311, _2323);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2335 = _2327 + _2333;
    float _2337 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = exp2(_2337);
    float _2345 = _2343 * _2341;
    float _2347 = _2331 * _2345;
    float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2349;
    out.m_99.y = _2351;
    out.m_99.z = _2353;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2125 = false;
    bool _1496 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2410 = as_type<float>(_136);
        out.gl_Position.z = _2410;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_55.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_174);
        out.gl_Position.z = _2479;
    }
    if (_168)
    {
        return out;
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
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
    float _222 = _214;
    float _224 = _210;
    if (_218)
    {
        float _226 = rsqrt(_206);
        _222 = _226;
    }
    float _228 = _222;
    float _230 = 0.0;
    if (!_218)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _216 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    float _240 = _216;
    if (!_218)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    float _244 = 0.0;
    float _246 = _242;
    if (!_218)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _212;
    float _252 = _248;
    if (_220)
    {
        float _254 = rsqrt(_208);
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_220)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = 0.0;
    float _264 = _260;
    if (!_220)
    {
        _262 = 0.0;
    }
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _266;
    if (!_220)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    if (_234)
    {
        float _278 = rsqrt(_210);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _228;
    if (_218)
    {
        float _284 = _228 * _182;
        _238 = _284;
    }
    float _286 = _238;
    if (_218)
    {
        float _288 = _228 * _176;
        _246 = _288;
    }
    float _290 = _246;
    if (_218)
    {
        float _292 = _228 * _188;
        _252 = _292;
    }
    float _294 = _252;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_234)
    {
        _240 = 0.0;
    }
    float _298 = _240;
    float _300 = _298;
    if (!_234)
    {
        _282 = 0.0;
    }
    float _302 = _282;
    float _304 = _302;
    if (_220)
    {
        float _306 = _256 * _184;
        _264 = _306;
    }
    float _308 = _264;
    if (!_234)
    {
        _224 = 0.0;
    }
    float _310 = _224;
    float _312 = _310;
    if (_220)
    {
        float _314 = _256 * _178;
        _270 = _314;
    }
    float _316 = _270;
    if (_220)
    {
        float _318 = _256 * _190;
        _276 = _318;
    }
    float _320 = _276;
    if (_234)
    {
        float _322 = _280 * _186;
        _300 = _322;
    }
    float _324 = _300;
    if (_234)
    {
        float _326 = _280 * _180;
        _312 = _326;
    }
    float _328 = _312;
    if (_234)
    {
        float _330 = _280 * _192;
        _304 = _330;
    }
    float _332 = _304;
    bool _334 = !_296;
    float _336 = _332;
    float _354;
    if (!_334)
    {
        float _338 = in.m_63.x;
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
    float _366 = in.m_50.x;
    float _368 = in.m_50.y;
    float _370 = in.m_50.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _364 + _372;
    float _376 = in.m_63.x;
    float _378 = in.m_63.y;
    float _380 = in.m_63.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _396 = _394 != 0;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _400 = _398 != 0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _364 + _402;
    float _406 = 1.0 / _384;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _408;
    float _412 = 1.0 / _388;
    bool _414 = !_392;
    int _416 = _414 ? 0 : 1;
    bool _418 = !_396;
    int _420 = _418 ? 0 : 1;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    int _426 = abs(_416);
    float _428 = _184 * _368;
    float _430 = _190 * _368;
    float _432 = 1.0 / _410;
    int _434 = abs(_420);
    float _436 = fma(_182, _366, _428);
    float _438 = _380 * 2.0;
    float _440 = fma(_188, _366, _430);
    float _442 = _378 + _380;
    float _444 = _376 + _380;
    float _446 = _380 + (-0.5);
    float _448 = _378 + _376;
    float _450 = _376 + (-0.5);
    float _452 = _376 * 2.0;
    float _454 = _378 + (-0.5);
    float _456 = _378 * 2.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = _364 + _458;
    float _462 = floor(_438);
    float _464 = _448 + (-1.0);
    float _466 = _442 + (-1.0);
    float _468 = _460 * _406;
    float _470 = _374 * _412;
    float _472 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _474 = floor(_452);
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _478 = _444 + (-1.0);
    float _480 = _404 * _432;
    float _482 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _484 = fma(_186, _370, _436);
    float _486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _488 = log2(_486);
    bool _490 = _462 > 0.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _492;
    bool _496 = _462 >= 0.0;
    bool _498 = isnan(_462);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _510 = fma(_494, _468, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _512 = _504 ? 0 : 1;
    float _514 = floor(_456);
    bool _516 = _474 > 0.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _518;
    bool _522 = _474 >= 0.0;
    bool _524 = isnan(_474);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _544 = _530 ? 0 : 1;
    float _546 = _488 * _154;
    float _548 = fma(_508, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_520, _468, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _552 = ~_512;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = fma(_534, _468, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _560 = ~_544;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _568 = 1.0 + _566;
    bool _570 = _514 > 0.0;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _572;
    bool _576 = _514 >= 0.0;
    bool _578 = isnan(_514);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = fma(_538, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _588 = fma(_542, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _590 = _556;
    int _592 = _564;
    float _594 = _370;
    if (!_490)
    {
        int _596 = ~_512;
        int _598 = _596 + 1;
        _590 = _598;
    }
    int _600 = _590;
    float _602 = exp2(_546);
    if (!_516)
    {
        int _604 = ~_544;
        int _606 = _604 + 1;
        _592 = _606;
    }
    int _608 = _592;
    float _610 = fma(_192, _370, _440);
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    bool _618 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    float _628 = _178 * _368;
    bool _630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = 1.0 / _568;
    float _642 = float(_600);
    float _644 = fma(_176, _366, _628);
    float _646 = float(_608);
    int _648 = _584 ? 0 : 1;
    float _650 = fma(_180, _370, _644);
    float _652 = -_602;
    float _654 = _652 + 1.0;
    float _656 = fma(_424, _480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _658 = float(_426);
    float _660 = float(_434);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _662;
    float _666 = _638 ? _654 : 0.0;
    float _668 = _658 * _642;
    int _670 = ~_648;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = _660 * _646;
    int _678 = _674;
    if (!_570)
    {
        int _680 = ~_648;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    if (_626)
    {
        float _686 = _666 * _640;
        _158 = _686;
    }
    float _688 = _158;
    float _690 = _668 * (-2.0);
    float _692 = _676 * (-2.0);
    bool _694 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _696 = isnan(_364);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = fma(_664, _480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _708 = fma(_476, _690, _476);
    float _710 = fma(_690, _612, _612);
    float _712 = fma(_692, _614, _614);
    bool _714 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _716 = isnan(_364);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_704;
    float _728 = _726 + 1.0;
    float _730 = fma(_472, _692, _472);
    float _732 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[196].x, _710);
    bool _734 = !_400;
    int _736 = _734 ? 0 : 1;
    float _738 = _724 * _728;
    bool _740 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _742 = isnan(_364);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -_724;
    float _754 = _752 + 1.0;
    float _756 = fma(_708, _688, _732);
    int _758 = abs(_736);
    float _760 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _712);
    bool _762 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _764 = isnan(_364);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = _750 * _754;
    float _776 = -_750;
    float _778 = _776 + 1.0;
    float _780 = fma(_574, _480, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _782 = fma(_730, _688, _760);
    float _784 = _772 * _778;
    float _786 = float(_758);
    float _788 = -_772;
    float _790 = _788 + 1.0;
    float _792 = float(_684);
    float _794 = _510 * _784;
    float _796 = _558 * _784;
    float _798 = _550 * _784;
    float _800 = in.m_67.x;
    float _802 = in.m_67.y;
    float _804 = in.m_67.z;
    float _806 = _786 * _792;
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].x, _798);
    float _812 = in.m_69.x;
    float _814 = in.m_69.y;
    float _816 = in.m_69.z;
    float _818 = _806 * (-2.0);
    float _820 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    float _822 = fma(_586, _774, _810);
    float _824 = fma(_588, _774, _808);
    float _826 = fma(_818, _616, _616);
    float _828 = fma(_482, _818, _482);
    float _830 = fma(_548, _774, _820);
    float _832 = _756 * 0.15915493667125701904296875;
    float _834 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[196].z, _826);
    float _836 = _782 * 0.15915493667125701904296875;
    float _838 = fma(_706, _738, _822);
    float _840 = fma(_780, _738, _824);
    float _842 = fma(_828, _688, _834);
    float _844 = fma(_656, _738, _830);
    float _846 = _832 * 6.283185482025146484375;
    float _848 = cos(_846);
    float _850 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].x, _838);
    float _852 = _842 * 0.15915493667125701904296875;
    float _854 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].z, _840);
    float _856 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].y, _844);
    float _858 = in.m_61.w;
    float _860 = _854 * _804;
    float _862 = _836 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _856 * _802;
    float _868 = _850 * _800;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _812);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _814);
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _876 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _878 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _880 = _836 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _872 * _874;
    float _886 = _870 * _876;
    float _888 = in.m_59.w;
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    float _892 = _852 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = _848 * _864;
    float _898 = _890 * _878;
    float _900 = _832 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = _848 * _882;
    float _906 = _852 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _848 * _894;
    float _912 = _882 * _894;
    float _914 = _910 * _884;
    float _916 = _902 * _864;
    float _918 = _902 * _882;
    float _920 = _902 * _894;
    float _922 = _864 * _894;
    float _924 = _920 * _884;
    float _926 = fma(_908, _904, _916);
    float _928 = -_884;
    float _930 = _908 * _928;
    float _932 = -_918;
    float _934 = fma(_908, _896, _932);
    float _936 = -_896;
    float _938 = fma(_908, _918, _936);
    float _940 = fma(_926, _886, _914);
    float _942 = fma(_912, _886, _930);
    float _944 = fma(_908, _916, _904);
    float _946 = fma(_938, _886, _924);
    float _948 = fma(_934, _898, _940);
    float _950 = fma(_922, _898, _942);
    float _952 = _610 + _858;
    float _954 = fma(_944, _898, _946);
    float _956 = _948 * _308;
    float _958 = _948 * _320;
    float _960 = _484 + _888;
    float _962 = _948 * _316;
    float _964 = fma(_950, _286, _956);
    float _966 = fma(_950, _294, _958);
    float _968 = fma(_950, _290, _962);
    float _970 = fma(_954, _324, _964);
    float _972 = fma(_954, _332, _966);
    float _974 = in.m_57.w;
    float _976 = _960 + _970;
    float _978 = _952 + _972;
    float _980 = fma(_954, _328, _968);
    float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _984 = _976 + _982;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _978 + _986;
    float _990 = _984 * _984;
    float _992 = _988 * _988;
    float _994 = _990 + _992;
    float _996 = sqrt(_994);
    float _998 = _650 + _974;
    float _1000 = _998 + _980;
    float _1002 = fma(_960, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1004 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1008 = _996 + _1006;
    float _1010 = floor(_1002);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1014 = floor(_1012);
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1018 = _976;
    float _1020 = _978;
    float _1022 = _912;
    float _1024 = _1000;
    float _1026 = _990;
    float _1028 = _992;
    if (_1004)
    {
        float _1030 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1030;
    }
    float _1032 = _1016;
    float _1034 = _834;
    float _1036 = _1032;
    if (_1004)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1038;
    }
    float _1040 = _1034;
    if (_1004)
    {
        float _1042 = rsqrt(_994);
        _594 = _1042;
    }
    float _1044 = _594;
    float _1046 = -_1014;
    float _1048 = _1012 + _1046;
    float _1050 = _1040;
    if (_1004)
    {
        float _1052 = _1008 * _1040;
        _1050 = _1052;
    }
    float _1054 = _1050;
    float _1056 = -_1010;
    float _1058 = _1002 + _1056;
    float _1060 = _1054;
    if (_1004)
    {
        float _1062 = _1054 * 0.15915493667125701904296875;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = _176;
    if (_1004)
    {
        float _1068 = _1064 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        _1066 = _1070;
    }
    float _1072 = _1066;
    if (_1004)
    {
        float _1074 = fma(_1072, _1032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1036 = _1074;
    }
    float _1076 = _1036;
    float _1078 = _1076;
    if (_1004)
    {
        float _1080 = _1044 * _1076;
        _1078 = _1080;
    }
    float _1082 = _1078;
    if (_1004)
    {
        float _1084 = fma(_984, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1018 = _1084;
    }
    float _1086 = _1018;
    if (_1004)
    {
        float _1088 = fma(_988, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1020 = _1088;
    }
    float _1090 = _1020;
    float _1092 = fma(_1086, 6.2500002968590706586837768554688e-05, 0.5);
    float _1094 = fma(_1090, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3844 = float2(_1092, _1094);
    float3 _1098 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3844, float2(0.0), isnan(_3844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3844, float2(0.0), isnan(_3844)), level(0.0)).xyz;
    float _1100 = _1098.x;
    float _1102 = _1098.y;
    float _1104 = _1098.z;
    float2 _3860 = float2(_1058, _1048);
    float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3860, float2(0.0), isnan(_3860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3860, float2(0.0), isnan(_3860)), level(0.0)).x;
    float _1108 = in.m_71.y;
    bool _1110 = _814 != 0.0;
    bool _1112 = isnan(_814);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    float _1120 = _1064;
    if (_1004)
    {
        float _1122 = _1064 * 6.283185482025146484375;
        float _1124 = cos(_1122);
        _1120 = _1124;
    }
    float _1126 = _1120;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1130 = _1128 != 0;
    float _1132 = in.m_63.w;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1136 = _1134 != 0;
    bool _1138 = _812 == 0.0;
    bool _1140 = !_1118;
    bool _1142 = _1138 && _1140;
    float _1144 = in.m_71.x;
    bool _1146 = _816 == 0.0;
    bool _1148 = _1146 && _1142;
    float _1150 = in.m_73.x;
    float _1152 = in.m_73.y;
    float _1154 = in.m_73.z;
    float _1156 = _948;
    float _1158 = 1.0;
    float _1160 = 1.0;
    if (_1130)
    {
        float _1162 = in.m_63.z;
        _1156 = _1162;
    }
    float _1164 = _1156;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1170 = -_1108;
    float _1172 = _1170 + 1.0;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1180 = _1132 > 0.5;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1108;
    if (_1136)
    {
        float _1188 = _1180 ? _1172 : _1108;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = 0.0;
    if (_1130)
    {
        _1192 = _1144;
    }
    float _1194 = _1192;
    out.m_77.x = _1178;
    out.m_77.y = _1182;
    out.m_77.z = _1184;
    out.m_77.w = _1176;
    float _1196 = _1194;
    if (!_1130)
    {
        _1158 = _1144;
    }
    float _1198 = _1158;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (_1148)
    {
        _1200 = _1152;
    }
    float _1204 = _1200;
    float _1206 = _1204;
    if (!_1148)
    {
        float _1208 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1152);
        _1206 = _1208;
    }
    float _1210 = _1206;
    bool _1212 = _1164 > 0.5;
    bool _1214 = _1212 && _1130;
    float _1216 = in.m_79.x;
    float _1218 = in.m_79.y;
    float _1220 = in.m_79.z;
    float _1222 = in.m_79.w;
    if (_1148)
    {
        _1160 = _1154;
    }
    float _1224 = _1160;
    float _1226 = _1224;
    if (!_1148)
    {
        float _1228 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1154);
        _1226 = _1228;
    }
    float _1230 = _1226;
    float _1232 = 0.0;
    if (_1148)
    {
        _1232 = _1150;
    }
    float _1234 = _1232;
    float _1236 = _1234;
    if (!_1148)
    {
        float _1238 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = _920 * _1210;
    if (_1214)
    {
        float _1244 = -_1194;
        float _1246 = _1244 + 1.0;
        _1196 = _1246;
    }
    float _1248 = _1196;
    if (_1130)
    {
        _1202 = _1248;
    }
    float _1250 = _1202;
    float _1252 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1254 = _1220 * _1150;
    float _1256 = _1218 * _1154;
    float _1258 = _1216 * _1152;
    float _1260 = -_1254;
    float _1262 = fma(_1216, _1154, _1260);
    float _1264 = -_1256;
    float _1266 = fma(_1220, _1152, _1264);
    float _1268 = -_1258;
    float _1270 = fma(_1218, _1150, _1268);
    float _1272 = -_1210;
    float _1274 = _908 * _1272;
    float _1276 = _1262 * _1222;
    float _1278 = _1266 * _1222;
    float _1280 = _910 * _1210;
    float _1282 = _1270 * _1222;
    float _1284 = -_1276;
    float _1286 = _908 * _1284;
    float _1288 = _910 * _1276;
    float _1290 = _920 * _1276;
    float _1292 = -_1218;
    float _1294 = _908 * _1292;
    float _1296 = _910 * _1218;
    float _1298 = fma(_912, _1240, _1274);
    float _1300 = _920 * _1218;
    float _1302 = fma(_926, _1240, _1280);
    float _1304 = fma(_938, _1240, _1242);
    float _1306 = fma(_912, _1278, _1286);
    float _1308 = fma(_926, _1278, _1288);
    float _1310 = fma(_938, _1278, _1290);
    float _1312 = fma(_912, _1216, _1294);
    float _1314 = fma(_926, _1216, _1296);
    float _1316 = fma(_938, _1216, _1300);
    float _1318 = fma(_922, _1230, _1298);
    float _1320 = fma(_934, _1230, _1302);
    float _1322 = fma(_944, _1230, _1304);
    float _1324 = fma(_922, _1282, _1306);
    float _1326 = fma(_934, _1282, _1308);
    float _1328 = fma(_944, _1282, _1310);
    float _1330 = fma(_922, _1220, _1312);
    float _1332 = fma(_934, _1220, _1314);
    float _1334 = _1282;
    float _1336 = _1330;
    if (_1004)
    {
        float _1338 = _1126 + (-1.0);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = fma(_944, _1220, _1316);
    float _1344 = _1320 * _308;
    float _1346 = _1320 * _316;
    float _1348 = _1320 * _320;
    float _1350 = _1348;
    if (_1004)
    {
        float _1352 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1352;
    }
    float _1354 = _1022;
    float _1356 = _1332 * _308;
    float _1358 = _1332 * _316;
    float _1360 = _1332 * _320;
    float _1362 = _1326 * _320;
    float _1364 = fma(_1318, _294, _1348);
    float _1366 = _1364;
    if (_1004)
    {
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1370 = _1086 + _1368;
        _1350 = _1370;
    }
    float _1372 = _1350;
    if (_1004)
    {
        float _1374 = fma(_1000, _1126, _1354);
        _1024 = _1374;
    }
    float _1376 = _1024;
    float _1378 = fma(_1330, _286, _1356);
    float _1380 = fma(_1330, _290, _1358);
    float _1382 = fma(_1330, _294, _1360);
    if (_1004)
    {
        float _1384 = _1372 * _1372;
        _1026 = _1384;
    }
    float _1386 = _1026;
    if (_1004)
    {
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1390 = _1090 + _1388;
        _1336 = _1390;
    }
    float _1392 = _1336;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1396 = _1376 + _1394;
    float _1398 = fma(_1318, _286, _1344);
    float _1400 = fma(_1318, _290, _1346);
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1004)
    {
        float _1404 = _1392 * _1392;
        _1028 = _1404;
    }
    float _1406 = _1028;
    float _1408 = fma(_1396, _1396, _1386);
    float _1410 = _1326 * _316;
    float _1412 = _1326 * _308;
    float _1414 = fma(_1324, _294, _1362);
    float _1416 = _1408 + _1406;
    float _1418 = fma(_1324, _290, _1410);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1422 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1424 = fma(_1324, _286, _1412);
    float _1426 = fma(_1342, _324, _1378);
    float _1428 = fma(_1342, _328, _1380);
    float _1430 = fma(_1342, _332, _1382);
    float _1432 = fma(_1322, _324, _1398);
    float _1434 = fma(_1322, _328, _1400);
    float _1436 = sqrt(_1416);
    float _1438 = _1252 * _1402;
    float _1440 = fma(_1328, _328, _1418);
    float _1442 = fma(_1328, _332, _1414);
    float _1444 = fma(_1322, _332, _1364);
    out.m_81.x = _1426;
    out.m_81.y = _1428;
    out.m_81.z = _1430;
    float _1446 = _1422 * _1420;
    float _1448 = fma(_1328, _324, _1424);
    out.m_83.x = _1432;
    out.m_83.y = _1434;
    out.m_83.z = _1444;
    out.m_85.z = _1438;
    out.m_85.w = _1446;
    bool _1450 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1452 = isnan(_1436);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1458 = _1454 || _1456;
    out.m_87.x = _1448;
    out.m_87.y = _1440;
    out.m_87.z = _1442;
    float _1460 = _1438;
    if (!_1458)
    {
        _336 = 1.0;
    }
    float _1462 = _336;
    out.m_89.x = _1100;
    out.m_89.y = _1102;
    out.m_89.z = _1104;
    bool _1464 = !_1458;
    float _1466 = _1462;
    if (!_1464)
    {
        bool _1468 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1470 = isnan(_1436);
        bool _1472 = _1468 || _1470;
        bool _1474 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1476 = _1472 || _1474;
        if (!_1476)
        {
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1480 = _1436 + _1478;
            float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1484 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1482;
            float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1488 = _1486 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1490 = 1.0 / _1484;
            float _1492 = _1480 * _1490;
            float _1494 = fma(_1492, _1488, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1466 = _1494;
            _1496 = true;
        }
        else
        {
            bool _1498 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1500 = isnan(_1436);
            bool _1502 = _1498 || _1500;
            bool _1504 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1506 = _1502 || _1504;
            if (!_1506)
            {
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1510 = _1436 + _1508;
                float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1514 = _1512 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1518 = _1516 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1520 = 1.0 / _1514;
                float _1522 = _1510 * _1520;
                float _1524 = fma(_1522, _1518, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1466 = _1524;
                _1496 = true;
            }
            else
            {
                _1466 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1496 = false;
    float _1526 = _1466;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1530 = _1376 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1534 = _1086 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1538 = _1090 + _1536;
    float _1540 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1542 = fma(_1534, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1544 = fma(_1538, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1548 = _1540 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = _1542 + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = _1544 + _1554;
    float _1558 = _1548 * _1548;
    float _1560 = fma(_1552, _1552, _1558);
    float _1562 = fma(_1556, _1556, _1560);
    float _1564 = rsqrt(_1562);
    float _1566 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1568 = _1552 * _1566;
    float _1570 = _1556 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 * _1570;
    float _1576 = _1572 + _1574;
    float _1578 = sqrt(_1576);
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1584 = _1578 + _1582;
    float _1586 = _1556;
    float _1588 = _1576;
    float _1590 = _1584;
    float _1592 = _1566;
    float _1594 = _1568;
    if (_1580)
    {
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1596;
    }
    float _1598 = _1586;
    if (_1580)
    {
        float _1600 = rsqrt(_1576);
        _1588 = _1600;
    }
    float _1602 = _1588;
    float _1604 = _1602;
    if (_1580)
    {
        float _1606 = _1584 * _1598;
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1580)
    {
        float _1610 = _1608 * 0.15915493667125701904296875;
        _1366 = _1610;
    }
    float _1612 = _1366;
    float _1614 = _1564;
    if (_1580)
    {
        float _1616 = _1612 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1624 = precise::max(0.0, _1622);
    float _1626 = _324;
    float _1628 = _1624;
    float _1630 = _1622;
    if (_1580)
    {
        float _1632 = _1612 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = -_1566;
    float _1640 = -_1624;
    float _1642 = fma(_1548, _1638, _1640);
    float _1644 = _1642;
    if (_1580)
    {
        float _1646 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1628 = _1646;
    }
    float _1648 = _1628;
    float _1650 = _1620;
    float _1652 = _1648;
    if (_1580)
    {
        float _1654 = fma(_1620, _1648, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = _1656;
    if (!_1580)
    {
        _1652 = _1570;
    }
    float _1660 = _1652;
    float _1662 = _1660;
    if (_1580)
    {
        float _1664 = _1636 + (-1.0);
        _1630 = _1664;
    }
    float _1666 = _1630;
    if (_1580)
    {
        float _1668 = _1602 * _1656;
        _1460 = _1668;
    }
    float _1670 = _1460;
    if (!_1580)
    {
        _1658 = _1642;
    }
    float _1672 = _1658;
    float _1674 = _1672;
    if (_1580)
    {
        float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1676;
    }
    float _1678 = _1592;
    if (_1580)
    {
        float _1680 = _1568 * _1670;
        _1594 = _1680;
    }
    float _1682 = _1594;
    float _1684 = sqrt(_1562);
    if (!_1580)
    {
        _1604 = _1572;
    }
    float _1686 = _1604;
    float _1688 = _1686;
    if (_1580)
    {
        float _1690 = fma(_1642, _1636, _1678);
        _1674 = _1690;
    }
    float _1692 = _1674;
    if (_1580)
    {
        float _1694 = _1570 * _1670;
        _1662 = _1694;
    }
    float _1696 = _1662;
    if (_1580)
    {
        float _1698 = _1682 * _1682;
        _1688 = _1698;
    }
    float _1700 = _1688;
    if (!_1580)
    {
        _1644 = _1574;
    }
    float _1702 = _1644;
    float _1704 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = _1702;
    if (_1580)
    {
        float _1708 = _1696 * _1696;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = fma(_1692, _1692, _1700);
    float _1714 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1716 = _1712 + _1710;
    float _1718 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1720 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1722 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = rsqrt(_1716);
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1728 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1726);
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1718);
    float _1734 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1738 = -_1730;
    float _1740 = _1738 + 1.0;
    float _1742 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1744 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1732);
    float _1746 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1748 = abs(_1740);
    float _1750 = log2(_1748);
    float _1752 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1742);
    float _1754 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1736, 1.0);
    float _1764 = _1724 * _1682;
    float _1766 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1746);
    float _1768 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1770 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1772 = _1724 * _1692;
    float _1774 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1776 = _1724 * _1696;
    float _1778 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1770);
    float _1780 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = -_1774;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1788 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1778);
    float _1790 = log2(_1762);
    float _1792 = -_1776;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1796 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1798 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1788);
    float _1800 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1802 = fma(_1794, -0.5, 0.5);
    float _1804 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1796);
    float _1806 = fma(_1794, 0.5, 0.5);
    float _1808 = exp2(_1786);
    float _1810 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1800);
    float _1812 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1804);
    float _1814 = fma(_1806, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1816 = _1772 + 1.0;
    float _1818 = fma(_1806, _1814, -0.212114393711090087890625);
    float _1820 = 1.0 / _1798;
    float _1822 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1824 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1812);
    float _1826 = _1790 * 0.693147182464599609375;
    float _1828 = fma(_1806, _1818, 1.570728778839111328125);
    float _1830 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1822);
    float _1832 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1834 = sqrt(_1802);
    float _1836 = -_1772;
    float _1838 = fma(_1808, _1816, _1836);
    float _1840 = fma(_1838, 0.5, 0.5);
    float _1842 = _1824 * _1820;
    float _1844 = _1830 * _1820;
    float _1846 = fma(_1842, 0.5, 0.5);
    float _1848 = fma(_1844, -0.5, 0.5);
    float _1850 = _1834 * 0.636619746685028076171875;
    float _1852 = -_1828;
    float _1854 = fma(_1850, _1852, 1.0);
    float3 _5144 = float3(_1846, _1848, _1832);
    float _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5144, float3(0.0), isnan(_5144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5144, float3(0.0), isnan(_5144)), level(0.0)).x;
    float3 _5155 = float3(_1846, _1848, _1832);
    float4 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5155, float3(0.0), isnan(_5155)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5155, float3(0.0), isnan(_5155)), level(0.0)).xyzw;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1859.w;
    float2 _5171 = float2(_1854, _1840);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5171, float2(0.0), isnan(_5171)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5171, float2(0.0), isnan(_5171)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _998 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1879 = _998 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1881 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1883 = -_1106;
    float _1885 = _1883 + 1.0;
    float _1887 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1877);
    float _1889 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1879);
    float _1891 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1881);
    out.m_91.x = _1542;
    out.m_91.y = _1540;
    out.m_91.z = _1544;
    float _1893 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1887);
    float _1895 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    float _1897 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1891);
    float _1899 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1897);
    float _1905 = 1.0 / _1899;
    float _1907 = _1901 + _1899;
    float _1909 = in.m_93.x;
    bool _1911 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1913 = isnan(_1684);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1919 = _1915 || _1917;
    out.gl_Position.x = _1824;
    out.gl_Position.y = _1830;
    out.gl_Position.z = _1903;
    out.gl_Position.w = _1798;
    float _1921 = _1907 * _1905;
    float _1923 = _1921 * 0.5;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1927 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
    float _1929 = _1903;
    float _1931 = _1824;
    float _1933 = _1867;
    float _1935 = _1865;
    if (!_1919)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1937 = _1929;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1919)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1943 = _1931;
    float _1945 = 1.0 / _1927;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1949 = _1945 * _1947;
    float _1951 = abs(_1949);
    float _1953 = log2(_1951);
    bool _1955 = _1949 <= 8000.0;
    bool _1957 = isnan(_1949);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan(8000.0);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1969 = exp2(_1967);
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1977 = fma(_1973, -2.0, 3.0);
    float _1979 = _1973 * _1973;
    float _1981 = exp2(_1975);
    float _1983 = _1979 * _1977;
    float _1985 = -_1983;
    float _1987 = _1985 + 1.0;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1983);
    float _1991 = _1965 * _1989;
    float _1993 = -_1981;
    float _1995 = _1993 + 1.0;
    float _1997 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2001 = _1885 * _1997;
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = -_1999;
    float _2007 = _2005 + 1.0;
    float _2009 = -_2003;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = _2011 * _1909;
    float _2015 = _2013 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.x = _2015;
    float _2017 = _2015;
    float _2019 = _1999;
    float _2021 = _1943;
    float _2023 = _1943;
    if (!_1919)
    {
        _2017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2025 = _2017;
    float _2027 = _1999 * _1856;
    float _2029 = _2025;
    float _2031 = _2025;
    if (!_1919)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2033 = _2019;
    float _2035 = _1867 * _2027;
    float _2037 = _1875 * _2027;
    float _2039 = fma(_1871, _2035, _1861);
    float _2041 = fma(_1873, _2035, _1863);
    float _2043 = _1867 * _2007;
    float _2045 = fma(_1867, _2037, _1865);
    float _2047 = _2033;
    float _2049 = _2033;
    if (!_1919)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2051 = _1933;
    float _2053 = _2051;
    float _2055 = _2051;
    if (!_1919)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2057 = _1935;
    out.m_97.x = _2039;
    out.m_97.y = _2041;
    out.m_97.z = _2045;
    out.m_97.w = _2043;
    bool _2059 = !_1919;
    float _2061 = _2057;
    float _2063 = _2057;
    if (!_2059)
    {
        bool _2065 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2067 = isnan(_1684);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2073 = _2069 || _2071;
        if (!_2073)
        {
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2077 = _1684 + _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2079;
            float _2083 = 1.0 / _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2105 = _2077 * _2083;
            float _2107 = precise::clamp(_2105, 0.0, 1.0);
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2113 = fma(_2107, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2115 = fma(_2107, _2111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2117 = fma(_2107, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2119 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2121 = fma(_2107, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2123 = fma(_2107, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2031 = _2115;
            _2063 = _2121;
            _1941 = _2113;
            _2055 = _2119;
            _2023 = _2117;
            _2049 = _2123;
            _2125 = true;
        }
        else
        {
            bool _2127 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2129 = isnan(_1684);
            bool _2131 = _2127 || _2129;
            bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2135 = _2131 || _2133;
            if (!_2135)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2137 = _1939;
            _1941 = _2137;
            if (!_2135)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2139 = _2029;
            _2031 = _2139;
            if (!_2135)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2141 = _2021;
            _2023 = _2141;
            if (!_2135)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2143 = _2053;
            _2055 = _2143;
            if (!_2135)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2145 = _2061;
            _2063 = _2145;
            if (!_2135)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2147 = _2047;
            bool _2149 = !_2135;
            _2049 = _2147;
            if (!_2149)
            {
                bool _2151 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2153 = isnan(_1684);
                bool _2155 = _2151 || _2153;
                bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2159 = _2155 || _2157;
                if (!_2159)
                {
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2163 = _1684 + _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2165;
                    float _2169 = 1.0 / _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2191 = _2163 * _2169;
                    float _2193 = precise::clamp(_2191, 0.0, 1.0);
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2199 = fma(_2193, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2201 = fma(_2193, _2197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2203 = fma(_2193, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2205 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2207 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2031 = _2201;
                    _2063 = _2207;
                    _1941 = _2199;
                    _2055 = _2205;
                    _2023 = _2203;
                    _2049 = _2209;
                    _2125 = true;
                }
                else
                {
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2125 = false;
    float _2211 = _2031;
    float _2213 = _2063;
    float _2215 = _1941;
    float _2217 = _2055;
    float _2219 = _2023;
    float _2221 = _2049;
    float _2223 = fma(_1434, -0.5, 0.5);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    float _2231 = -_2215;
    float _2233 = _2231 + _2217;
    float _2235 = -_2219;
    float _2237 = _2235 + _2221;
    bool _2239 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2241 = fma(_2225, _2229, _2211);
    float _2243 = fma(_2225, _2233, _2215);
    float _2245 = fma(_2225, _2237, _2219);
    float _2247 = _2241 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2249 = fma(_2243, 0.298911988735198974609375, _2247);
    float _2251 = fma(_2245, 0.114477999508380889892578125, _2249);
    out.m_99.x = 0.0;
    float _2253 = -_2251;
    float _2255 = _2243 + _2253;
    float _2257 = -_2251;
    float _2259 = _2241 + _2257;
    float _2261 = -_2251;
    float _2263 = _2245 + _2261;
    float _2265 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2267 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2269 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2271 = fma(_2263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    out.m_95.w = _2265;
    out.m_101.x = _2267;
    out.m_101.y = _2269;
    out.m_101.z = _2271;
    if (!_2239)
    {
        return out;
    }
    float _2273 = -_1540;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2277 = -_1542;
    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2281 = -_1544;
    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2285 = _2275 * _2275;
    float _2287 = fma(_2279, _2279, _2285);
    float _2289 = fma(_2283, _2283, _2287);
    float _2291 = sqrt(_2289);
    float _2293 = rsqrt(_2289);
    float _2295 = -_2291;
    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2299 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = _2279 * _2293;
    float _2305 = _2275 * _2293;
    float _2307 = abs(_2301);
    float _2309 = log2(_2307);
    float _2311 = _2283 * _2293;
    float _2313 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2315 = _1434 * _2305;
    float _2317 = -_2305;
    float _2319 = -_2313;
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2319);
    float _2323 = fma(_1432, _2303, _2315);
    float _2325 = -_2311;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2321);
    float _2329 = fma(_1444, _2311, _2323);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2335 = _2327 + _2333;
    float _2337 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = exp2(_2337);
    float _2345 = _2343 * _2341;
    float _2347 = _2331 * _2345;
    float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2349;
    out.m_99.y = _2351;
    out.m_99.z = _2353;
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
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2125 = false;
    bool _1496 = false;
    bool _356 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2410 = as_type<float>(_136);
        out.gl_Position.z = _2410;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_55.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = 0.0;
    float _158 = _154;
    if (_150)
    {
        float _160 = float(_120);
        _156 = _160;
    }
    float _162 = _156;
    bool _164 = _154 >= _162;
    bool _166 = !_150;
    bool _168 = _164 || _166;
    if (_168)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _130;
    if (_168)
    {
        out.m_53.x = 0.0;
    }
    if (_168)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2479 = as_type<float>(_174);
        out.gl_Position.z = _2479;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_57.x;
    float _178 = in.m_57.y;
    float _180 = in.m_57.z;
    float _182 = in.m_59.x;
    float _184 = in.m_59.y;
    float _186 = in.m_59.z;
    float _188 = in.m_61.x;
    float _190 = in.m_61.y;
    float _192 = in.m_61.z;
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
    float _222 = _214;
    float _224 = _210;
    if (_218)
    {
        float _226 = rsqrt(_206);
        _222 = _226;
    }
    float _228 = _222;
    float _230 = 0.0;
    if (!_218)
    {
        _230 = 0.0;
    }
    float _232 = _230;
    bool _234 = _216 > 0.0;
    float _236 = 0.0;
    float _238 = _232;
    float _240 = _216;
    if (!_218)
    {
        _236 = 0.0;
    }
    float _242 = _236;
    float _244 = 0.0;
    float _246 = _242;
    if (!_218)
    {
        _244 = 0.0;
    }
    float _248 = _244;
    float _250 = _212;
    float _252 = _248;
    if (_220)
    {
        float _254 = rsqrt(_208);
        _250 = _254;
    }
    float _256 = _250;
    float _258 = 0.0;
    if (!_220)
    {
        _258 = 0.0;
    }
    float _260 = _258;
    float _262 = 0.0;
    float _264 = _260;
    if (!_220)
    {
        _262 = 0.0;
    }
    float _266 = _262;
    float _268 = 0.0;
    float _270 = _266;
    if (!_220)
    {
        _268 = 0.0;
    }
    float _272 = _268;
    float _274 = 0.0;
    float _276 = _272;
    if (_234)
    {
        float _278 = rsqrt(_210);
        _274 = _278;
    }
    float _280 = _274;
    float _282 = _228;
    if (_218)
    {
        float _284 = _228 * _182;
        _238 = _284;
    }
    float _286 = _238;
    if (_218)
    {
        float _288 = _228 * _176;
        _246 = _288;
    }
    float _290 = _246;
    if (_218)
    {
        float _292 = _228 * _188;
        _252 = _292;
    }
    float _294 = _252;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_234)
    {
        _240 = 0.0;
    }
    float _298 = _240;
    float _300 = _298;
    if (!_234)
    {
        _282 = 0.0;
    }
    float _302 = _282;
    float _304 = _302;
    if (_220)
    {
        float _306 = _256 * _184;
        _264 = _306;
    }
    float _308 = _264;
    if (!_234)
    {
        _224 = 0.0;
    }
    float _310 = _224;
    float _312 = _310;
    if (_220)
    {
        float _314 = _256 * _178;
        _270 = _314;
    }
    float _316 = _270;
    if (_220)
    {
        float _318 = _256 * _190;
        _276 = _318;
    }
    float _320 = _276;
    if (_234)
    {
        float _322 = _280 * _186;
        _300 = _322;
    }
    float _324 = _300;
    if (_234)
    {
        float _326 = _280 * _180;
        _312 = _326;
    }
    float _328 = _312;
    if (_234)
    {
        float _330 = _280 * _192;
        _304 = _330;
    }
    float _332 = _304;
    bool _334 = !_296;
    float _336 = _332;
    float _354;
    if (!_334)
    {
        float _338 = in.m_63.x;
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
    float _366 = in.m_50.x;
    float _368 = in.m_50.y;
    float _370 = in.m_50.z;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _364 + _372;
    float _376 = in.m_63.x;
    float _378 = in.m_63.y;
    float _380 = in.m_63.z;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _396 = _394 != 0;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _400 = _398 != 0;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _404 = _364 + _402;
    float _406 = 1.0 / _384;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _408;
    float _412 = 1.0 / _388;
    bool _414 = !_392;
    int _416 = _414 ? 0 : 1;
    bool _418 = !_396;
    int _420 = _418 ? 0 : 1;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    int _426 = abs(_416);
    float _428 = _184 * _368;
    float _430 = _190 * _368;
    float _432 = 1.0 / _410;
    int _434 = abs(_420);
    float _436 = fma(_182, _366, _428);
    float _438 = _380 * 2.0;
    float _440 = fma(_188, _366, _430);
    float _442 = _378 + _380;
    float _444 = _376 + _380;
    float _446 = _380 + (-0.5);
    float _448 = _378 + _376;
    float _450 = _376 + (-0.5);
    float _452 = _376 * 2.0;
    float _454 = _378 + (-0.5);
    float _456 = _378 * 2.0;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = _364 + _458;
    float _462 = floor(_438);
    float _464 = _448 + (-1.0);
    float _466 = _442 + (-1.0);
    float _468 = _460 * _406;
    float _470 = _374 * _412;
    float _472 = fma(_466, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _474 = floor(_452);
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _478 = _444 + (-1.0);
    float _480 = _404 * _432;
    float _482 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _484 = fma(_186, _370, _436);
    float _486 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _488 = log2(_486);
    bool _490 = _462 > 0.0;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _492;
    bool _496 = _462 >= 0.0;
    bool _498 = isnan(_462);
    bool _500 = _496 || _498;
    bool _502 = isnan(0.0);
    bool _504 = _500 || _502;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _510 = fma(_494, _468, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _512 = _504 ? 0 : 1;
    float _514 = floor(_456);
    bool _516 = _474 > 0.0;
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _518;
    bool _522 = _474 >= 0.0;
    bool _524 = isnan(_474);
    bool _526 = _522 || _524;
    bool _528 = isnan(0.0);
    bool _530 = _526 || _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    int _544 = _530 ? 0 : 1;
    float _546 = _488 * _154;
    float _548 = fma(_508, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_520, _468, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _552 = ~_512;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = fma(_534, _468, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    int _560 = ~_544;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _568 = 1.0 + _566;
    bool _570 = _514 > 0.0;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _572;
    bool _576 = _514 >= 0.0;
    bool _578 = isnan(_514);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = fma(_538, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _588 = fma(_542, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    int _590 = _556;
    int _592 = _564;
    float _594 = _370;
    if (!_490)
    {
        int _596 = ~_512;
        int _598 = _596 + 1;
        _590 = _598;
    }
    int _600 = _590;
    float _602 = exp2(_546);
    if (!_516)
    {
        int _604 = ~_544;
        int _606 = _604 + 1;
        _592 = _606;
    }
    int _608 = _592;
    float _610 = fma(_192, _370, _440);
    float _612 = in.m_65.x;
    float _614 = in.m_65.y;
    float _616 = in.m_65.z;
    bool _618 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _620 = isnan(1.0);
    bool _622 = _618 || _620;
    bool _624 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _626 = _622 || _624;
    float _628 = _178 * _368;
    bool _630 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _638 = _634 || _636;
    float _640 = 1.0 / _568;
    float _642 = float(_600);
    float _644 = fma(_176, _366, _628);
    float _646 = float(_608);
    int _648 = _584 ? 0 : 1;
    float _650 = fma(_180, _370, _644);
    float _652 = -_602;
    float _654 = _652 + 1.0;
    float _656 = fma(_424, _480, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _658 = float(_426);
    float _660 = float(_434);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _662;
    float _666 = _638 ? _654 : 0.0;
    float _668 = _658 * _642;
    int _670 = ~_648;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = _660 * _646;
    int _678 = _674;
    if (!_570)
    {
        int _680 = ~_648;
        int _682 = _680 + 1;
        _678 = _682;
    }
    int _684 = _678;
    if (_626)
    {
        float _686 = _666 * _640;
        _158 = _686;
    }
    float _688 = _158;
    float _690 = _668 * (-2.0);
    float _692 = _676 * (-2.0);
    bool _694 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _696 = isnan(_364);
    bool _698 = _694 || _696;
    bool _700 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _702 = _698 || _700;
    float _704 = float(_702);
    float _706 = fma(_664, _480, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _708 = fma(_476, _690, _476);
    float _710 = fma(_690, _612, _612);
    float _712 = fma(_692, _614, _614);
    bool _714 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _716 = isnan(_364);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -_704;
    float _728 = _726 + 1.0;
    float _730 = fma(_472, _692, _472);
    float _732 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[196].x, _710);
    bool _734 = !_400;
    int _736 = _734 ? 0 : 1;
    float _738 = _724 * _728;
    bool _740 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _742 = isnan(_364);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -_724;
    float _754 = _752 + 1.0;
    float _756 = fma(_708, _688, _732);
    int _758 = abs(_736);
    float _760 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[196].y, _712);
    bool _762 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _764 = isnan(_364);
    bool _766 = _762 || _764;
    bool _768 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _770 = _766 || _768;
    float _772 = float(_770);
    float _774 = _750 * _754;
    float _776 = -_750;
    float _778 = _776 + 1.0;
    float _780 = fma(_574, _480, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _782 = fma(_730, _688, _760);
    float _784 = _772 * _778;
    float _786 = float(_758);
    float _788 = -_772;
    float _790 = _788 + 1.0;
    float _792 = float(_684);
    float _794 = _510 * _784;
    float _796 = _558 * _784;
    float _798 = _550 * _784;
    float _800 = in.m_67.x;
    float _802 = in.m_67.y;
    float _804 = in.m_67.z;
    float _806 = _786 * _792;
    float _808 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].z, _796);
    float _810 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].x, _798);
    float _812 = in.m_69.x;
    float _814 = in.m_69.y;
    float _816 = in.m_69.z;
    float _818 = _806 * (-2.0);
    float _820 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[143].y, _794);
    float _822 = fma(_586, _774, _810);
    float _824 = fma(_588, _774, _808);
    float _826 = fma(_818, _616, _616);
    float _828 = fma(_482, _818, _482);
    float _830 = fma(_548, _774, _820);
    float _832 = _756 * 0.15915493667125701904296875;
    float _834 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[196].z, _826);
    float _836 = _782 * 0.15915493667125701904296875;
    float _838 = fma(_706, _738, _822);
    float _840 = fma(_780, _738, _824);
    float _842 = fma(_828, _688, _834);
    float _844 = fma(_656, _738, _830);
    float _846 = _832 * 6.283185482025146484375;
    float _848 = cos(_846);
    float _850 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].x, _838);
    float _852 = _842 * 0.15915493667125701904296875;
    float _854 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].z, _840);
    float _856 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[146].y, _844);
    float _858 = in.m_61.w;
    float _860 = _854 * _804;
    float _862 = _836 * 6.283185482025146484375;
    float _864 = sin(_862);
    float _866 = _856 * _802;
    float _868 = _850 * _800;
    float _870 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _812);
    float _872 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _814);
    float _874 = _866 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _876 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _878 = _860 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _880 = _836 * 6.283185482025146484375;
    float _882 = cos(_880);
    float _884 = _872 * _874;
    float _886 = _870 * _876;
    float _888 = in.m_59.w;
    float _890 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _816);
    float _892 = _852 * 6.283185482025146484375;
    float _894 = cos(_892);
    float _896 = _848 * _864;
    float _898 = _890 * _878;
    float _900 = _832 * 6.283185482025146484375;
    float _902 = sin(_900);
    float _904 = _848 * _882;
    float _906 = _852 * 6.283185482025146484375;
    float _908 = sin(_906);
    float _910 = _848 * _894;
    float _912 = _882 * _894;
    float _914 = _910 * _884;
    float _916 = _902 * _864;
    float _918 = _902 * _882;
    float _920 = _902 * _894;
    float _922 = _864 * _894;
    float _924 = _920 * _884;
    float _926 = fma(_908, _904, _916);
    float _928 = -_884;
    float _930 = _908 * _928;
    float _932 = -_918;
    float _934 = fma(_908, _896, _932);
    float _936 = -_896;
    float _938 = fma(_908, _918, _936);
    float _940 = fma(_926, _886, _914);
    float _942 = fma(_912, _886, _930);
    float _944 = fma(_908, _916, _904);
    float _946 = fma(_938, _886, _924);
    float _948 = fma(_934, _898, _940);
    float _950 = fma(_922, _898, _942);
    float _952 = _610 + _858;
    float _954 = fma(_944, _898, _946);
    float _956 = _948 * _308;
    float _958 = _948 * _320;
    float _960 = _484 + _888;
    float _962 = _948 * _316;
    float _964 = fma(_950, _286, _956);
    float _966 = fma(_950, _294, _958);
    float _968 = fma(_950, _290, _962);
    float _970 = fma(_954, _324, _964);
    float _972 = fma(_954, _332, _966);
    float _974 = in.m_57.w;
    float _976 = _960 + _970;
    float _978 = _952 + _972;
    float _980 = fma(_954, _328, _968);
    float _982 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _984 = _976 + _982;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _978 + _986;
    float _990 = _984 * _984;
    float _992 = _988 * _988;
    float _994 = _990 + _992;
    float _996 = sqrt(_994);
    float _998 = _650 + _974;
    float _1000 = _998 + _980;
    float _1002 = fma(_960, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    bool _1004 = _996 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1008 = _996 + _1006;
    float _1010 = floor(_1002);
    float _1012 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1014 = floor(_1012);
    float _1016 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1018 = _976;
    float _1020 = _978;
    float _1022 = _912;
    float _1024 = _1000;
    float _1026 = _990;
    float _1028 = _992;
    if (_1004)
    {
        float _1030 = _1000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1016 = _1030;
    }
    float _1032 = _1016;
    float _1034 = _834;
    float _1036 = _1032;
    if (_1004)
    {
        float _1038 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1034 = _1038;
    }
    float _1040 = _1034;
    if (_1004)
    {
        float _1042 = rsqrt(_994);
        _594 = _1042;
    }
    float _1044 = _594;
    float _1046 = -_1014;
    float _1048 = _1012 + _1046;
    float _1050 = _1040;
    if (_1004)
    {
        float _1052 = _1008 * _1040;
        _1050 = _1052;
    }
    float _1054 = _1050;
    float _1056 = -_1010;
    float _1058 = _1002 + _1056;
    float _1060 = _1054;
    if (_1004)
    {
        float _1062 = _1054 * 0.15915493667125701904296875;
        _1060 = _1062;
    }
    float _1064 = _1060;
    float _1066 = _176;
    if (_1004)
    {
        float _1068 = _1064 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        _1066 = _1070;
    }
    float _1072 = _1066;
    if (_1004)
    {
        float _1074 = fma(_1072, _1032, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1036 = _1074;
    }
    float _1076 = _1036;
    float _1078 = _1076;
    if (_1004)
    {
        float _1080 = _1044 * _1076;
        _1078 = _1080;
    }
    float _1082 = _1078;
    if (_1004)
    {
        float _1084 = fma(_984, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1018 = _1084;
    }
    float _1086 = _1018;
    if (_1004)
    {
        float _1088 = fma(_988, _1082, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1020 = _1088;
    }
    float _1090 = _1020;
    float _1092 = fma(_1086, 6.2500002968590706586837768554688e-05, 0.5);
    float _1094 = fma(_1090, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _3844 = float2(_1092, _1094);
    float3 _1098 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3844, float2(0.0), isnan(_3844)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3844, float2(0.0), isnan(_3844)), level(0.0)).xyz;
    float _1100 = _1098.x;
    float _1102 = _1098.y;
    float _1104 = _1098.z;
    float2 _3860 = float2(_1058, _1048);
    float _1106 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3860, float2(0.0), isnan(_3860)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3860, float2(0.0), isnan(_3860)), level(0.0)).x;
    float _1108 = in.m_71.y;
    bool _1110 = _814 != 0.0;
    bool _1112 = isnan(_814);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    float _1120 = _1064;
    if (_1004)
    {
        float _1122 = _1064 * 6.283185482025146484375;
        float _1124 = cos(_1122);
        _1120 = _1124;
    }
    float _1126 = _1120;
    int _1128 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1130 = _1128 != 0;
    float _1132 = in.m_63.w;
    int _1134 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1136 = _1134 != 0;
    bool _1138 = _812 == 0.0;
    bool _1140 = !_1118;
    bool _1142 = _1138 && _1140;
    float _1144 = in.m_71.x;
    bool _1146 = _816 == 0.0;
    bool _1148 = _1146 && _1142;
    float _1150 = in.m_73.x;
    float _1152 = in.m_73.y;
    float _1154 = in.m_73.z;
    float _1156 = _948;
    float _1158 = 1.0;
    float _1160 = 1.0;
    if (_1130)
    {
        float _1162 = in.m_63.z;
        _1156 = _1162;
    }
    float _1164 = _1156;
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1170 = -_1108;
    float _1172 = _1170 + 1.0;
    float _1174 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1176 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1178 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1180 = _1132 > 0.5;
    float _1182 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1184 = _1174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1186 = _1108;
    if (_1136)
    {
        float _1188 = _1180 ? _1172 : _1108;
        _1186 = _1188;
    }
    float _1190 = _1186;
    float _1192 = 0.0;
    if (_1130)
    {
        _1192 = _1144;
    }
    float _1194 = _1192;
    out.m_77.x = _1178;
    out.m_77.y = _1182;
    out.m_77.z = _1184;
    out.m_77.w = _1176;
    float _1196 = _1194;
    if (!_1130)
    {
        _1158 = _1144;
    }
    float _1198 = _1158;
    float _1200 = 0.0;
    float _1202 = _1198;
    if (_1148)
    {
        _1200 = _1152;
    }
    float _1204 = _1200;
    float _1206 = _1204;
    if (!_1148)
    {
        float _1208 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1152);
        _1206 = _1208;
    }
    float _1210 = _1206;
    bool _1212 = _1164 > 0.5;
    bool _1214 = _1212 && _1130;
    float _1216 = in.m_79.x;
    float _1218 = in.m_79.y;
    float _1220 = in.m_79.z;
    float _1222 = in.m_79.w;
    if (_1148)
    {
        _1160 = _1154;
    }
    float _1224 = _1160;
    float _1226 = _1224;
    if (!_1148)
    {
        float _1228 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1154);
        _1226 = _1228;
    }
    float _1230 = _1226;
    float _1232 = 0.0;
    if (_1148)
    {
        _1232 = _1150;
    }
    float _1234 = _1232;
    float _1236 = _1234;
    if (!_1148)
    {
        float _1238 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1150);
        _1236 = _1238;
    }
    float _1240 = _1236;
    float _1242 = _920 * _1210;
    if (_1214)
    {
        float _1244 = -_1194;
        float _1246 = _1244 + 1.0;
        _1196 = _1246;
    }
    float _1248 = _1196;
    if (_1130)
    {
        _1202 = _1248;
    }
    float _1250 = _1202;
    float _1252 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1254 = _1220 * _1150;
    float _1256 = _1218 * _1154;
    float _1258 = _1216 * _1152;
    float _1260 = -_1254;
    float _1262 = fma(_1216, _1154, _1260);
    float _1264 = -_1256;
    float _1266 = fma(_1220, _1152, _1264);
    float _1268 = -_1258;
    float _1270 = fma(_1218, _1150, _1268);
    float _1272 = -_1210;
    float _1274 = _908 * _1272;
    float _1276 = _1262 * _1222;
    float _1278 = _1266 * _1222;
    float _1280 = _910 * _1210;
    float _1282 = _1270 * _1222;
    float _1284 = -_1276;
    float _1286 = _908 * _1284;
    float _1288 = _910 * _1276;
    float _1290 = _920 * _1276;
    float _1292 = -_1218;
    float _1294 = _908 * _1292;
    float _1296 = _910 * _1218;
    float _1298 = fma(_912, _1240, _1274);
    float _1300 = _920 * _1218;
    float _1302 = fma(_926, _1240, _1280);
    float _1304 = fma(_938, _1240, _1242);
    float _1306 = fma(_912, _1278, _1286);
    float _1308 = fma(_926, _1278, _1288);
    float _1310 = fma(_938, _1278, _1290);
    float _1312 = fma(_912, _1216, _1294);
    float _1314 = fma(_926, _1216, _1296);
    float _1316 = fma(_938, _1216, _1300);
    float _1318 = fma(_922, _1230, _1298);
    float _1320 = fma(_934, _1230, _1302);
    float _1322 = fma(_944, _1230, _1304);
    float _1324 = fma(_922, _1282, _1306);
    float _1326 = fma(_934, _1282, _1308);
    float _1328 = fma(_944, _1282, _1310);
    float _1330 = fma(_922, _1220, _1312);
    float _1332 = fma(_934, _1220, _1314);
    float _1334 = _1282;
    float _1336 = _1330;
    if (_1004)
    {
        float _1338 = _1126 + (-1.0);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = fma(_944, _1220, _1316);
    float _1344 = _1320 * _308;
    float _1346 = _1320 * _316;
    float _1348 = _1320 * _320;
    float _1350 = _1348;
    if (_1004)
    {
        float _1352 = _1340 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1022 = _1352;
    }
    float _1354 = _1022;
    float _1356 = _1332 * _308;
    float _1358 = _1332 * _316;
    float _1360 = _1332 * _320;
    float _1362 = _1326 * _320;
    float _1364 = fma(_1318, _294, _1348);
    float _1366 = _1364;
    if (_1004)
    {
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1370 = _1086 + _1368;
        _1350 = _1370;
    }
    float _1372 = _1350;
    if (_1004)
    {
        float _1374 = fma(_1000, _1126, _1354);
        _1024 = _1374;
    }
    float _1376 = _1024;
    float _1378 = fma(_1330, _286, _1356);
    float _1380 = fma(_1330, _290, _1358);
    float _1382 = fma(_1330, _294, _1360);
    if (_1004)
    {
        float _1384 = _1372 * _1372;
        _1026 = _1384;
    }
    float _1386 = _1026;
    if (_1004)
    {
        float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1390 = _1090 + _1388;
        _1336 = _1390;
    }
    float _1392 = _1336;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1396 = _1376 + _1394;
    float _1398 = fma(_1318, _286, _1344);
    float _1400 = fma(_1318, _290, _1346);
    float _1402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_1004)
    {
        float _1404 = _1392 * _1392;
        _1028 = _1404;
    }
    float _1406 = _1028;
    float _1408 = fma(_1396, _1396, _1386);
    float _1410 = _1326 * _316;
    float _1412 = _1326 * _308;
    float _1414 = fma(_1324, _294, _1362);
    float _1416 = _1408 + _1406;
    float _1418 = fma(_1324, _290, _1410);
    float _1420 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1422 = _1190 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1424 = fma(_1324, _286, _1412);
    float _1426 = fma(_1342, _324, _1378);
    float _1428 = fma(_1342, _328, _1380);
    float _1430 = fma(_1342, _332, _1382);
    float _1432 = fma(_1322, _324, _1398);
    float _1434 = fma(_1322, _328, _1400);
    float _1436 = sqrt(_1416);
    float _1438 = _1252 * _1402;
    float _1440 = fma(_1328, _328, _1418);
    float _1442 = fma(_1328, _332, _1414);
    float _1444 = fma(_1322, _332, _1364);
    out.m_81.x = _1426;
    out.m_81.y = _1428;
    out.m_81.z = _1430;
    float _1446 = _1422 * _1420;
    float _1448 = fma(_1328, _324, _1424);
    out.m_83.x = _1432;
    out.m_83.y = _1434;
    out.m_83.z = _1444;
    out.m_85.z = _1438;
    out.m_85.w = _1446;
    bool _1450 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1452 = isnan(_1436);
    bool _1454 = _1450 || _1452;
    bool _1456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1458 = _1454 || _1456;
    out.m_87.x = _1448;
    out.m_87.y = _1440;
    out.m_87.z = _1442;
    float _1460 = _1438;
    if (!_1458)
    {
        _336 = 1.0;
    }
    float _1462 = _336;
    out.m_89.x = _1100;
    out.m_89.y = _1102;
    out.m_89.z = _1104;
    bool _1464 = !_1458;
    float _1466 = _1462;
    if (!_1464)
    {
        bool _1468 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1470 = isnan(_1436);
        bool _1472 = _1468 || _1470;
        bool _1474 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1476 = _1472 || _1474;
        if (!_1476)
        {
            float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1480 = _1436 + _1478;
            float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1484 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1482;
            float _1486 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1488 = _1486 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1490 = 1.0 / _1484;
            float _1492 = _1480 * _1490;
            float _1494 = fma(_1492, _1488, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1466 = _1494;
            _1496 = true;
        }
        else
        {
            bool _1498 = _1436 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1500 = isnan(_1436);
            bool _1502 = _1498 || _1500;
            bool _1504 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1506 = _1502 || _1504;
            if (!_1506)
            {
                float _1508 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1510 = _1436 + _1508;
                float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1514 = _1512 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1518 = _1516 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1520 = 1.0 / _1514;
                float _1522 = _1510 * _1520;
                float _1524 = fma(_1522, _1518, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1466 = _1524;
                _1496 = true;
            }
            else
            {
                _1466 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1496 = false;
    float _1526 = _1466;
    float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1530 = _1376 + _1528;
    float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1534 = _1086 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1538 = _1090 + _1536;
    float _1540 = fma(_1530, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1542 = fma(_1534, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1544 = fma(_1538, _1526, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1546 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1548 = _1540 + _1546;
    float _1550 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1552 = _1542 + _1550;
    float _1554 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1556 = _1544 + _1554;
    float _1558 = _1548 * _1548;
    float _1560 = fma(_1552, _1552, _1558);
    float _1562 = fma(_1556, _1556, _1560);
    float _1564 = rsqrt(_1562);
    float _1566 = _1564 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1568 = _1552 * _1566;
    float _1570 = _1556 * _1566;
    float _1572 = _1568 * _1568;
    float _1574 = _1570 * _1570;
    float _1576 = _1572 + _1574;
    float _1578 = sqrt(_1576);
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1584 = _1578 + _1582;
    float _1586 = _1556;
    float _1588 = _1576;
    float _1590 = _1584;
    float _1592 = _1566;
    float _1594 = _1568;
    if (_1580)
    {
        float _1596 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1586 = _1596;
    }
    float _1598 = _1586;
    if (_1580)
    {
        float _1600 = rsqrt(_1576);
        _1588 = _1600;
    }
    float _1602 = _1588;
    float _1604 = _1602;
    if (_1580)
    {
        float _1606 = _1584 * _1598;
        _1590 = _1606;
    }
    float _1608 = _1590;
    if (_1580)
    {
        float _1610 = _1608 * 0.15915493667125701904296875;
        _1366 = _1610;
    }
    float _1612 = _1366;
    float _1614 = _1564;
    if (_1580)
    {
        float _1616 = _1612 * 6.283185482025146484375;
        float _1618 = sin(_1616);
        _1614 = _1618;
    }
    float _1620 = _1614;
    float _1622 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1624 = precise::max(0.0, _1622);
    float _1626 = _324;
    float _1628 = _1624;
    float _1630 = _1622;
    if (_1580)
    {
        float _1632 = _1612 * 6.283185482025146484375;
        float _1634 = cos(_1632);
        _1626 = _1634;
    }
    float _1636 = _1626;
    float _1638 = -_1566;
    float _1640 = -_1624;
    float _1642 = fma(_1548, _1638, _1640);
    float _1644 = _1642;
    if (_1580)
    {
        float _1646 = _1642 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1628 = _1646;
    }
    float _1648 = _1628;
    float _1650 = _1620;
    float _1652 = _1648;
    if (_1580)
    {
        float _1654 = fma(_1620, _1648, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1650 = _1654;
    }
    float _1656 = _1650;
    float _1658 = _1656;
    if (!_1580)
    {
        _1652 = _1570;
    }
    float _1660 = _1652;
    float _1662 = _1660;
    if (_1580)
    {
        float _1664 = _1636 + (-1.0);
        _1630 = _1664;
    }
    float _1666 = _1630;
    if (_1580)
    {
        float _1668 = _1602 * _1656;
        _1460 = _1668;
    }
    float _1670 = _1460;
    if (!_1580)
    {
        _1658 = _1642;
    }
    float _1672 = _1658;
    float _1674 = _1672;
    if (_1580)
    {
        float _1676 = _1666 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1592 = _1676;
    }
    float _1678 = _1592;
    if (_1580)
    {
        float _1680 = _1568 * _1670;
        _1594 = _1680;
    }
    float _1682 = _1594;
    float _1684 = sqrt(_1562);
    if (!_1580)
    {
        _1604 = _1572;
    }
    float _1686 = _1604;
    float _1688 = _1686;
    if (_1580)
    {
        float _1690 = fma(_1642, _1636, _1678);
        _1674 = _1690;
    }
    float _1692 = _1674;
    if (_1580)
    {
        float _1694 = _1570 * _1670;
        _1662 = _1694;
    }
    float _1696 = _1662;
    if (_1580)
    {
        float _1698 = _1682 * _1682;
        _1688 = _1698;
    }
    float _1700 = _1688;
    if (!_1580)
    {
        _1644 = _1574;
    }
    float _1702 = _1644;
    float _1704 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1706 = _1702;
    if (_1580)
    {
        float _1708 = _1696 * _1696;
        _1706 = _1708;
    }
    float _1710 = _1706;
    float _1712 = fma(_1692, _1692, _1700);
    float _1714 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1704);
    float _1716 = _1712 + _1710;
    float _1718 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1720 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1722 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1724 = rsqrt(_1716);
    float _1726 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1728 = fma(_1684, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1726);
    float _1730 = precise::clamp(_1728, 0.0, 1.0);
    float _1732 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1718);
    float _1734 = _1720 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1736 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1738 = -_1730;
    float _1740 = _1738 + 1.0;
    float _1742 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1744 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1732);
    float _1746 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1722);
    float _1748 = abs(_1740);
    float _1750 = log2(_1748);
    float _1752 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1742);
    float _1754 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1758 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1752);
    float _1760 = -_1754;
    float _1762 = fma(_1760, _1736, 1.0);
    float _1764 = _1724 * _1682;
    float _1766 = fma(_1544, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1746);
    float _1768 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1770 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1772 = _1724 * _1692;
    float _1774 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1776 = _1724 * _1696;
    float _1778 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1770);
    float _1780 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1782 = -_1774;
    float _1784 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1782);
    float _1786 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1788 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1778);
    float _1790 = log2(_1762);
    float _1792 = -_1776;
    float _1794 = fma(_1792, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1784);
    float _1796 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1798 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1788);
    float _1800 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1802 = fma(_1794, -0.5, 0.5);
    float _1804 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1796);
    float _1806 = fma(_1794, 0.5, 0.5);
    float _1808 = exp2(_1786);
    float _1810 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1800);
    float _1812 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1804);
    float _1814 = fma(_1806, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1816 = _1772 + 1.0;
    float _1818 = fma(_1806, _1814, -0.212114393711090087890625);
    float _1820 = 1.0 / _1798;
    float _1822 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1810);
    float _1824 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1812);
    float _1826 = _1790 * 0.693147182464599609375;
    float _1828 = fma(_1806, _1818, 1.570728778839111328125);
    float _1830 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1822);
    float _1832 = _1826 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1834 = sqrt(_1802);
    float _1836 = -_1772;
    float _1838 = fma(_1808, _1816, _1836);
    float _1840 = fma(_1838, 0.5, 0.5);
    float _1842 = _1824 * _1820;
    float _1844 = _1830 * _1820;
    float _1846 = fma(_1842, 0.5, 0.5);
    float _1848 = fma(_1844, -0.5, 0.5);
    float _1850 = _1834 * 0.636619746685028076171875;
    float _1852 = -_1828;
    float _1854 = fma(_1850, _1852, 1.0);
    float3 _5144 = float3(_1846, _1848, _1832);
    float _1856 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5144, float3(0.0), isnan(_5144)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5144, float3(0.0), isnan(_5144)), level(0.0)).x;
    float3 _5155 = float3(_1846, _1848, _1832);
    float4 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5155, float3(0.0), isnan(_5155)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5155, float3(0.0), isnan(_5155)), level(0.0)).xyzw;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1859.w;
    float2 _5171 = float2(_1854, _1840);
    float3 _1869 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5171, float2(0.0), isnan(_5171)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5171, float2(0.0), isnan(_5171)), level(0.0)).xyz;
    float _1871 = _1869.x;
    float _1873 = _1869.y;
    float _1875 = _1869.z;
    float _1877 = _998 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1879 = _998 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1881 = _1756 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1883 = -_1106;
    float _1885 = _1883 + 1.0;
    float _1887 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1877);
    float _1889 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1879);
    float _1891 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1881);
    out.m_91.x = _1542;
    out.m_91.y = _1540;
    out.m_91.z = _1544;
    float _1893 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1887);
    float _1895 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1889);
    float _1897 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1891);
    float _1899 = _1893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1901 = _1895 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1903 = fma(_1780, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1897);
    float _1905 = 1.0 / _1899;
    float _1907 = _1901 + _1899;
    float _1909 = in.m_93.x;
    bool _1911 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1913 = isnan(_1684);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1919 = _1915 || _1917;
    out.gl_Position.x = _1824;
    out.gl_Position.y = _1830;
    out.gl_Position.z = _1903;
    out.gl_Position.w = _1798;
    float _1921 = _1907 * _1905;
    float _1923 = _1921 * 0.5;
    float _1925 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1927 = fma(_1923, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1925);
    float _1929 = _1903;
    float _1931 = _1824;
    float _1933 = _1867;
    float _1935 = _1865;
    if (!_1919)
    {
        _1929 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1937 = _1929;
    float _1939 = _1937;
    float _1941 = _1937;
    if (!_1919)
    {
        _1931 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1943 = _1931;
    float _1945 = 1.0 / _1927;
    float _1947 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1949 = _1945 * _1947;
    float _1951 = abs(_1949);
    float _1953 = log2(_1951);
    bool _1955 = _1949 <= 8000.0;
    bool _1957 = isnan(_1949);
    bool _1959 = _1955 || _1957;
    bool _1961 = isnan(8000.0);
    bool _1963 = _1959 || _1961;
    float _1965 = float(_1963);
    float _1967 = _1953 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1969 = exp2(_1967);
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1973 = precise::clamp(_1971, 0.0, 1.0);
    float _1975 = _1750 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1977 = fma(_1973, -2.0, 3.0);
    float _1979 = _1973 * _1973;
    float _1981 = exp2(_1975);
    float _1983 = _1979 * _1977;
    float _1985 = -_1983;
    float _1987 = _1985 + 1.0;
    float _1989 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1983);
    float _1991 = _1965 * _1989;
    float _1993 = -_1981;
    float _1995 = _1993 + 1.0;
    float _1997 = _1991 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1999 = _1995 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2001 = _1885 * _1997;
    float _2003 = precise::clamp(_2001, 0.0, 1.0);
    float _2005 = -_1999;
    float _2007 = _2005 + 1.0;
    float _2009 = -_2003;
    float _2011 = fma(_2009, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2013 = _2011 * _1909;
    float _2015 = _2013 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_95.x = _2015;
    float _2017 = _2015;
    float _2019 = _1999;
    float _2021 = _1943;
    float _2023 = _1943;
    if (!_1919)
    {
        _2017 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2025 = _2017;
    float _2027 = _1999 * _1856;
    float _2029 = _2025;
    float _2031 = _2025;
    if (!_1919)
    {
        _2019 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2033 = _2019;
    float _2035 = _1867 * _2027;
    float _2037 = _1875 * _2027;
    float _2039 = fma(_1871, _2035, _1861);
    float _2041 = fma(_1873, _2035, _1863);
    float _2043 = _1867 * _2007;
    float _2045 = fma(_1867, _2037, _1865);
    float _2047 = _2033;
    float _2049 = _2033;
    if (!_1919)
    {
        _1933 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2051 = _1933;
    float _2053 = _2051;
    float _2055 = _2051;
    if (!_1919)
    {
        _1935 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2057 = _1935;
    out.m_97.x = _2039;
    out.m_97.y = _2041;
    out.m_97.z = _2045;
    out.m_97.w = _2043;
    bool _2059 = !_1919;
    float _2061 = _2057;
    float _2063 = _2057;
    if (!_2059)
    {
        bool _2065 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2067 = isnan(_1684);
        bool _2069 = _2065 || _2067;
        bool _2071 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2073 = _2069 || _2071;
        if (!_2073)
        {
            float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2077 = _1684 + _2075;
            float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2081 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2079;
            float _2083 = 1.0 / _2081;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2093 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2095 = _2093 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2101 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2103 = _2101 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2105 = _2077 * _2083;
            float _2107 = precise::clamp(_2105, 0.0, 1.0);
            float _2109 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2111 = _2109 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2113 = fma(_2107, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2115 = fma(_2107, _2111, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2117 = fma(_2107, _2091, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2119 = fma(_2107, _2095, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2121 = fma(_2107, _2099, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2123 = fma(_2107, _2103, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2031 = _2115;
            _2063 = _2121;
            _1941 = _2113;
            _2055 = _2119;
            _2023 = _2117;
            _2049 = _2123;
            _2125 = true;
        }
        else
        {
            bool _2127 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2129 = isnan(_1684);
            bool _2131 = _2127 || _2129;
            bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2135 = _2131 || _2133;
            if (!_2135)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2137 = _1939;
            _1941 = _2137;
            if (!_2135)
            {
                _2029 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2139 = _2029;
            _2031 = _2139;
            if (!_2135)
            {
                _2021 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2141 = _2021;
            _2023 = _2141;
            if (!_2135)
            {
                _2053 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2143 = _2053;
            _2055 = _2143;
            if (!_2135)
            {
                _2061 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2145 = _2061;
            _2063 = _2145;
            if (!_2135)
            {
                _2047 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2147 = _2047;
            bool _2149 = !_2135;
            _2049 = _2147;
            if (!_2149)
            {
                bool _2151 = _1684 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2153 = isnan(_1684);
                bool _2155 = _2151 || _2153;
                bool _2157 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2159 = _2155 || _2157;
                if (!_2159)
                {
                    float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2163 = _1684 + _2161;
                    float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2167 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2165;
                    float _2169 = 1.0 / _2167;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2187 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2191 = _2163 * _2169;
                    float _2193 = precise::clamp(_2191, 0.0, 1.0);
                    float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2197 = _2195 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2199 = fma(_2193, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2201 = fma(_2193, _2197, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2203 = fma(_2193, _2177, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2205 = fma(_2193, _2181, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2207 = fma(_2193, _2185, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2209 = fma(_2193, _2189, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2031 = _2201;
                    _2063 = _2207;
                    _1941 = _2199;
                    _2055 = _2205;
                    _2023 = _2203;
                    _2049 = _2209;
                    _2125 = true;
                }
                else
                {
                    _2031 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2063 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2055 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2023 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2049 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2125 = false;
    float _2211 = _2031;
    float _2213 = _2063;
    float _2215 = _1941;
    float _2217 = _2055;
    float _2219 = _2023;
    float _2221 = _2049;
    float _2223 = fma(_1434, -0.5, 0.5);
    float _2225 = precise::clamp(_2223, 0.0, 1.0);
    float _2227 = -_2211;
    float _2229 = _2227 + _2213;
    float _2231 = -_2215;
    float _2233 = _2231 + _2217;
    float _2235 = -_2219;
    float _2237 = _2235 + _2221;
    bool _2239 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2241 = fma(_2225, _2229, _2211);
    float _2243 = fma(_2225, _2233, _2215);
    float _2245 = fma(_2225, _2237, _2219);
    float _2247 = _2241 * 0.586610972881317138671875;
    out.m_53.x = 1.0;
    float _2249 = fma(_2243, 0.298911988735198974609375, _2247);
    float _2251 = fma(_2245, 0.114477999508380889892578125, _2249);
    out.m_99.x = 0.0;
    float _2253 = -_2251;
    float _2255 = _2243 + _2253;
    float _2257 = -_2251;
    float _2259 = _2241 + _2257;
    float _2261 = -_2251;
    float _2263 = _2245 + _2261;
    float _2265 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2267 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2269 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2271 = fma(_2263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    out.m_95.w = _2265;
    out.m_101.x = _2267;
    out.m_101.y = _2269;
    out.m_101.z = _2271;
    if (!_2239)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2273 = -_1540;
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2277 = -_1542;
    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2281 = -_1544;
    float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2285 = _2275 * _2275;
    float _2287 = fma(_2279, _2279, _2285);
    float _2289 = fma(_2283, _2283, _2287);
    float _2291 = sqrt(_2289);
    float _2293 = rsqrt(_2289);
    float _2295 = -_2291;
    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2299 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2301 = precise::clamp(_2299, 0.0, 1.0);
    float _2303 = _2279 * _2293;
    float _2305 = _2275 * _2293;
    float _2307 = abs(_2301);
    float _2309 = log2(_2307);
    float _2311 = _2283 * _2293;
    float _2313 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2315 = _1434 * _2305;
    float _2317 = -_2305;
    float _2319 = -_2313;
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2319);
    float _2323 = fma(_1432, _2303, _2315);
    float _2325 = -_2311;
    float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2321);
    float _2329 = fma(_1444, _2311, _2323);
    float _2331 = precise::clamp(_2329, 0.0, 1.0);
    float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2335 = _2327 + _2333;
    float _2337 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2341 = precise::clamp(_2339, 0.0, 1.0);
    float _2343 = exp2(_2337);
    float _2345 = _2343 * _2341;
    float _2347 = _2331 * _2345;
    float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2353 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _2349;
    out.m_99.y = _2351;
    out.m_99.z = _2353;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

