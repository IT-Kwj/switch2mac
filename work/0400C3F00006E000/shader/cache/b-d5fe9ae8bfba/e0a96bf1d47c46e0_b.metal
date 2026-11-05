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
    float4 m_73 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_77 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_57 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2044 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2328 = as_type<float>(_120);
        out.gl_Position.z = _2328;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_53.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_106);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = 0.0;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2397 = as_type<float>(_160);
        out.gl_Position.z = _2397;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _138 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _196 = log2(_194);
    float _198 = in.m_55.z;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _192 + _200;
    float _204 = in.m_57.y;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _208 = 1.0 + _206;
    int _210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _212 = _210 != 0;
    float _214 = in.m_48.x;
    float _216 = in.m_48.y;
    float _218 = in.m_48.z;
    float _220 = 1.0 / _208;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _228 = _226 != 0;
    float _230 = in.m_55.x;
    bool _232 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _234 = isnan(1.0);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _240 = _236 || _238;
    float _242 = _196 * _138;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    bool _248 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _256 = _252 || _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = exp2(_242);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _192 + _264;
    float _268 = _198 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = 1.0 / _246;
    float _276 = in.m_55.y;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _216 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = _216 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _286 = floor(_268);
    float _288 = -_262;
    float _290 = _288 + 1.0;
    float _292 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _294 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[6].x, _284);
    float _296 = _256 ? _290 : 0.0;
    float _298 = _230 * 2.0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _310 = _308 != 0;
    float _312 = _216 + _204;
    float _314 = _216 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _312;
    if (_240)
    {
        float _318 = _296 * _220;
        _142 = _318;
    }
    float _320 = _142;
    float _322 = 1.0 / _260;
    float _324 = _266 * _274;
    float _326 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _328 = _230 + _198;
    bool _330 = _286 >= 0.0;
    bool _332 = isnan(_286);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = _276 * 2.0;
    float _342 = _328 + (-1.0);
    float _344 = floor(_298);
    int _346 = _338 ? 0 : 1;
    float _348 = _276 + _198;
    bool _350 = _286 > 0.0;
    float _352 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _354 = !_302;
    int _356 = _354 ? 0 : 1;
    float _358 = _348 + (-1.0);
    float _360 = floor(_340);
    float _362 = _202 * _322;
    int _364 = ~_346;
    int _366 = _364 + 1;
    int _368 = _366 + 1;
    float _370 = fma(_272, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _374 = _230 + _276;
    float _376 = fma(_280, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _198 + (-0.5);
    int _380 = _368;
    if (!_350)
    {
        int _382 = ~_346;
        int _384 = _382 + 1;
        _380 = _384;
    }
    int _386 = _380;
    float _388 = _374 + (-1.0);
    bool _390 = _344 >= 0.0;
    bool _392 = isnan(_344);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    int _400 = abs(_356);
    float _402 = _320 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _404 = _398 ? 0 : 1;
    float _406 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _408 = _344 > 0.0;
    float _410 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[6].z, _294);
    float _412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _414 = _360 >= 0.0;
    bool _416 = isnan(_360);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[5].z, _326);
    float _426 = float(_400);
    float _428 = _410 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _430 = _422 ? 0 : 1;
    float _432 = _424 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _434 = _360 > 0.0;
    float _436 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _438 = float(_386);
    int _440 = ~_404;
    int _442 = _440 + 1;
    int _444 = _442 + 1;
    float _446 = _436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _448 = ~_430;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    int _454 = _444;
    int _456 = _452;
    float _458 = _428;
    float _460 = _446;
    if (!_408)
    {
        int _462 = ~_404;
        int _464 = _462 + 1;
        _454 = _464;
    }
    int _466 = _454;
    float _468 = _402 * _412;
    bool _470 = !_306;
    int _472 = _470 ? 0 : 1;
    float _474 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[203].y, _468);
    if (!_434)
    {
        int _476 = ~_430;
        int _478 = _476 + 1;
        _456 = _478;
    }
    int _480 = _456;
    float _482 = _426 * _438;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = in.m_59.x;
    float _490 = in.m_59.y;
    float _492 = in.m_59.z;
    float _494 = _474 + 0.25;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = fma(_486, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _506 = floor(_474);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _512 = !_310;
    int _514 = _512 ? 0 : 1;
    float _516 = _482 * (-2.0);
    int _518 = abs(_472);
    float _520 = _474 * 6.283185482025146484375;
    int _522 = abs(_514);
    float _524 = fma(_498, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = floor(_494);
    float _528 = float(_518);
    float _530 = fma(_504, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _532 = float(_466);
    float _534 = fma(_510, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _536 = float(_522);
    float _538 = _520 * 0.15915493667125701904296875;
    bool _540 = !_224;
    int _542 = _540 ? 0 : 1;
    float _544 = -_506;
    float _546 = _474 + _544;
    float _548 = _528 * _532;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _552 = _428 + _550;
    float _554 = fma(_516, _488, _488);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _446 + _556;
    float _560 = float(_480);
    float _562 = fma(_406, _516, _406);
    bool _564 = _546 >= 0.5;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.5);
    bool _572 = _568 || _570;
    float _574 = -_526;
    float _576 = _494 + _574;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _312 + _578;
    float _582 = _558 * _558;
    bool _584 = !_212;
    int _586 = _584 ? 0 : 1;
    float _588 = _538 * 6.283185482025146484375;
    float _590 = sin(_588);
    int _592 = abs(_542);
    float _594 = _552 * _552;
    float _596 = fma(_580, _580, _582);
    float _598 = _536 * _560;
    float _600 = _230 + (-0.5);
    int _602 = abs(_586);
    float _604 = _594 + _596;
    bool _606 = _576 > 0.5;
    float _608 = _598 * (-2.0);
    bool _610 = !_572;
    float _612 = _610 ? 0.5 : (-0.5);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _616 = float(_592);
    float _618 = rsqrt(_604);
    float _620 = fma(_608, _492, _492);
    float _622 = _612 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _624 = _622 * 2.0;
    float _626 = fma(_352, _608, _352);
    bool _628 = !_228;
    int _630 = _628 ? 0 : 1;
    float _632 = _616 * _624;
    float _634 = float(_602);
    float _636 = _590 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _638 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[196].z, _620);
    int _640 = abs(_630);
    float _642 = _576;
    if (_606)
    {
        float _644 = -_576;
        float _646 = _644 + 1.0;
        _642 = _646;
    }
    float _648 = _642;
    float _650 = fma(_634, _636, _632);
    float _652 = fma(_562, _320, _614);
    float _654 = fma(_648, 4.0, -1.0);
    float _656 = _580 * _618;
    float _658 = _558 * _618;
    float _660 = float(_640);
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _664 = -_656;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _668 = -_658;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _672 = _652 * 0.15915493667125701904296875;
    float _674 = fma(_660, _662, _650);
    float _676 = _666 * _666;
    float _678 = _548 * (-2.0);
    bool _680 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _682 = isnan(_192);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_674, 3.1415927410125732421875, _490);
    float _694 = fma(_670, _670, _676);
    bool _696 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _698 = isnan(_192);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = fma(_372, _678, _372);
    float _710 = fma(_692, _678, _692);
    float _712 = -_690;
    float _714 = _712 + 1.0;
    float _716 = _552 * _618;
    bool _718 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _720 = isnan(_192);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_626, _320, _638);
    float _732 = _706 * _714;
    float _734 = -_716;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _738 = -_706;
    float _740 = _738 + 1.0;
    float _742 = in.m_61.x;
    float _744 = in.m_61.y;
    float _746 = in.m_61.z;
    float _748 = _276 + (-0.5);
    float _750 = fma(_736, _736, _694);
    float _752 = _728 * _740;
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    float _760 = _672 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _500 * _752;
    float _766 = _370 * _752;
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = _376 * _752;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].x, _764);
    float _778 = fma(_708, _320, _758);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _782 = sqrt(_750);
    float _784 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].z, _774);
    float _786 = fma(_524, _732, _776);
    float _788 = _730 * 0.15915493667125701904296875;
    float _790 = fma(_530, _732, _780);
    float _792 = fma(_534, _732, _784);
    float _794 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].x, _786);
    float _796 = _778 * 0.15915493667125701904296875;
    float _798 = _672 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].z, _792);
    float _804 = _794 * _742;
    float _806 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].y, _790);
    float _808 = _802 * _746;
    float _810 = _806 * _744;
    float _812 = _788 * 6.283185482025146484375;
    float _814 = cos(_812);
    float _816 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _818 = _618 * _782;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _822 = _432 + _820;
    float _824 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _832 = _796 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _816 * _818;
    float _838 = _824 * _818;
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _842 = _826 * _818;
    float _844 = fma(_822, _822, _582);
    float _846 = _836 * _828;
    float _848 = _838 * _830;
    float _850 = _796 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _842 * _840;
    float _856 = _800 * _814;
    float _858 = _594 + _844;
    float _860 = _762 * _814;
    float _862 = _856 * _854;
    float _864 = _788 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _762 * _834;
    float _870 = _800 * _834;
    float _872 = _834 * _814;
    float _874 = _860 * _854;
    float _876 = _800 * _852;
    float _878 = _762 * _852;
    float _880 = sqrt(_858);
    float _882 = _852 * _814;
    float _884 = fma(_866, _876, _868);
    float _886 = -_870;
    float _888 = fma(_866, _878, _886);
    float _890 = rsqrt(_858);
    float _892 = -_878;
    float _894 = fma(_866, _870, _892);
    float _896 = -_854;
    float _898 = _866 * _896;
    float _900 = fma(_884, _846, _862);
    float _902 = fma(_888, _846, _874);
    float _904 = fma(_866, _868, _876);
    float _906 = fma(_882, _846, _898);
    float _908 = fma(_894, _848, _900);
    float _910 = precise::max(_880, 2.0);
    float _912 = fma(_904, _848, _902);
    float _914 = fma(_872, _848, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _920 = precise::min(_910, 20.0);
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _924 = -_822;
    float _926 = fma(_924, _890, 0.0);
    float _928 = precise::clamp(_926, 0.0, 1.0);
    float _930 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[8].x, _918);
    float _932 = fma(_920, -0.02777777798473834991455078125, 0.5555555820465087890625);
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _936 = _340 + (-1.0);
    float _938 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _940 = -_928;
    float _942 = _940 + 1.0;
    float _944 = _428 + _934;
    float _946 = _298 + (-1.0);
    float _948 = _446 + _938;
    float _950 = _932 * _942;
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[191].x, _944);
    float _954 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[191].x, _948);
    float _956 = -_952;
    float _958 = _428 + _956;
    float _960 = -_954;
    float _962 = _446 + _960;
    float _964 = fma(_950, _958, _952);
    float _966 = fma(_950, _962, _954);
    float _968 = _908 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _964 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _976 = _966 + _974;
    float _978 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[9].x, _968);
    float _980 = _972 * _972;
    float _982 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].z, _978);
    float _984 = fma(_976, _976, _980);
    float _986 = _312 + _982;
    float _988 = sqrt(_984);
    float _990 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[191].y, _986);
    bool _992 = _988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _914;
    float _996 = _978;
    float _998 = _966;
    float _1000 = _976;
    float _1002 = _658;
    float _1004 = _818;
    if (!_992)
    {
        _994 = _966;
    }
    float _1006 = _994;
    float _1008 = _1006;
    if (!_992)
    {
        _996 = _964;
    }
    float _1010 = _996;
    float _1012 = _1010;
    if (!_992)
    {
        _998 = _990;
    }
    float _1014 = _998;
    bool _1016 = !_992;
    float _1018 = _1014;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _988 + _1022;
        float _1026 = rsqrt(_984);
        float _1028 = _1024 * _1020;
        float _1030 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = _1028 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1036 + (-1.0);
        float _1044 = fma(_1040, _1030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1026 * _1044;
        float _1050 = fma(_990, _1036, _1046);
        float _1052 = fma(_976, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1054 = fma(_972, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1008 = _1052;
        _1012 = _1054;
        _1018 = _1050;
    }
    float _1056 = _1008;
    float _1058 = _1012;
    float _1060 = _1018;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1064 = _1056 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1068 = _1058 + _1066;
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1072 = fma(_1068, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3774 = float2(_1070, _1072);
    float _1074 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3774, float2(0.0), isnan(_3774)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3774, float2(0.0), isnan(_3774)), level(0.0)).x;
    bool _1076 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1078 = isnan(0.5);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1084 = _1080 || _1082;
    float _1086 = -_716;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _428);
    float _1090 = -_658;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _446);
    float _1094 = -_658;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    float _1098 = -_716;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1102 = _1058;
    float _1104 = _1072;
    float _1106 = _1056;
    float _1108 = _1096;
    float _1110 = _1100;
    if (!_1084)
    {
        float _1112 = -_428;
        float _1114 = _1112 + _1058;
        _1000 = _1114;
    }
    float _1116 = _1000;
    if (!_1084)
    {
        float _1118 = -_446;
        float _1120 = _1118 + _1056;
        _1002 = _1120;
    }
    float _1122 = _1002;
    if (!_1084)
    {
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1126 = _1092 + _1124;
        _1102 = _1126;
    }
    float _1128 = _1102;
    float _1130 = _1128;
    if (!_1084)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1104 = _1132;
    }
    float _1134 = _1104;
    float _1136 = _1134;
    if (!_1084)
    {
        float _1138 = 1.0 / _818;
        _1004 = _1138;
    }
    float _1140 = _1004;
    float _1142 = fma(_1074, 100.0, _312);
    float _1144 = _1074;
    float _1146 = _1140;
    if (!_1084)
    {
        float _1148 = -_312;
        float _1150 = _1148 + _1060;
        _316 = _1150;
    }
    float _1152 = _316;
    float _1154 = fma(_1074, 100.0, _1060);
    float _1156 = -_656;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1160 = -_656;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1164 = _1154;
    float _1166 = _1162;
    if (!_1084)
    {
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1170 = _1158 + _1168;
        _458 = _1170;
    }
    float _1172 = _458;
    if (!_1084)
    {
        float _1174 = _1172 * _1172;
        _1106 = _1174;
    }
    float _1176 = _1106;
    float _1178 = _1176;
    if (!_1084)
    {
        float _1180 = fma(_1128, _1128, _1176);
        _1178 = _1180;
    }
    float _1182 = _1178;
    float _1184 = _1182;
    if (!_1084)
    {
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1188 = _1088 + _1186;
        _1130 = _1188;
    }
    float _1190 = _1130;
    float _1192 = _1190;
    if (!_1084)
    {
        float _1194 = fma(_1190, _1190, _1182);
        _1184 = _1194;
    }
    float _1196 = _1184;
    float _1198 = _1196;
    if (!_1084)
    {
        float _1200 = sqrt(_1196);
        _1198 = _1200;
    }
    float _1202 = _1198;
    if (!_1084)
    {
        float _1204 = precise::min(_1202, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1192 = _1204;
    }
    float _1206 = _1192;
    float _1208 = _1206;
    if (!_1084)
    {
        float _1210 = _1206 * _1134;
        _1208 = _1210;
    }
    float _1212 = _1208;
    if (!_1084)
    {
        float _1214 = _1212 * _1140;
        _1164 = _1214;
    }
    float _1216 = _1164;
    if (!_1084)
    {
        float _1218 = fma(_1152, _1216, _1158);
        _1166 = _1218;
    }
    float _1220 = _1166;
    if (!_1084)
    {
        float _1222 = fma(_1122, _1216, _1092);
        _1108 = _1222;
    }
    float _1224 = _1108;
    if (!_1084)
    {
        float _1226 = fma(_1116, _1216, _1088);
        _1110 = _1226;
    }
    float _1228 = _1110;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1232 = _1220 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1236 = _1224 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = _1228 + _1238;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = fma(_1240, _1240, _1244);
    float _1248 = rsqrt(_1246);
    float _1250 = sqrt(_1246);
    float _1252 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1254 = _1236 * _1252;
    float _1256 = _1240 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 + _1260;
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = _1264 + _1268;
    float _1272 = _1240;
    float _1274 = _1270;
    float _1276 = _1232;
    if (_1266)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1278;
    }
    float _1280 = _1272;
    if (_1266)
    {
        float _1282 = rsqrt(_1262);
        _1144 = _1282;
    }
    float _1284 = _1144;
    float _1286 = _1284;
    if (_1266)
    {
        float _1288 = _1270 * _1280;
        _1274 = _1288;
    }
    float _1290 = _1274;
    if (_1266)
    {
        float _1292 = _1290 * 0.15915493667125701904296875;
        _460 = _1292;
    }
    float _1294 = _460;
    float _1296 = _1242;
    if (_1266)
    {
        float _1298 = _1294 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1296 = _1300;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1248;
    float _1310 = _1304;
    float _1312 = _1306;
    if (_1266)
    {
        float _1314 = _1294 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        _1308 = _1316;
    }
    float _1318 = _1308;
    float _1320 = -_1252;
    float _1322 = -_1306;
    float _1324 = fma(_1232, _1320, _1322);
    if (_1266)
    {
        float _1326 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1326;
    }
    float _1328 = _1310;
    float _1330 = _1302;
    if (_1266)
    {
        float _1332 = fma(_1302, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1136 = _1332;
    }
    float _1334 = _1136;
    float _1336 = _1334;
    if (!_1266)
    {
        _1330 = _1324;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    float _1342 = _1318;
    if (_1266)
    {
        float _1344 = _1318 + (-1.0);
        _1276 = _1344;
    }
    float _1346 = _1276;
    float _1348 = _1346;
    if (_1266)
    {
        float _1350 = _1284 * _1334;
        _1146 = _1350;
    }
    float _1352 = _1146;
    if (!_1266)
    {
        _1286 = _1254;
    }
    float _1354 = _1286;
    float _1356 = _1354;
    if (_1266)
    {
        float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1358;
    }
    float _1360 = _1312;
    if (_1266)
    {
        float _1362 = _1254 * _1352;
        _1356 = _1362;
    }
    float _1364 = _1356;
    if (!_1266)
    {
        _1348 = _1256;
    }
    float _1366 = _1348;
    float _1368 = _1366;
    if (_1266)
    {
        float _1370 = _1256 * _1352;
        _1368 = _1370;
    }
    float _1372 = _1368;
    if (_1266)
    {
        float _1374 = fma(_1324, _1318, _1360);
        _1340 = _1374;
    }
    float _1376 = _1340;
    if (!_1266)
    {
        _1342 = _1258;
    }
    float _1378 = _1342;
    float _1380 = _1378;
    if (_1266)
    {
        float _1382 = _1364 * _1364;
        _1380 = _1382;
    }
    float _1384 = _1380;
    if (!_1266)
    {
        _1336 = _1260;
    }
    float _1386 = _1336;
    float _1388 = _1386;
    if (_1266)
    {
        float _1390 = _1372 * _1372;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1376, _1376, _1384);
    float _1396 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1400 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = _1394 + _1392;
    float _1404 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1408 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1406);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    float _1412 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1414 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1404);
    float _1416 = rsqrt(_1402);
    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1420 = -_1410;
    float _1422 = _1420 + 1.0;
    float _1424 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1426 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1412);
    float _1428 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = abs(_1422);
    float _1434 = log2(_1432);
    float _1436 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1438 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1440 = -_1430;
    float _1442 = fma(_1440, _1418, 1.0);
    float _1444 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1428);
    float _1450 = _1416 * _1364;
    float _1452 = _1416 * _1376;
    float _1454 = _1416 * _1372;
    float _1456 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1444);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1460 = floor(_1398);
    float _1462 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1464 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1456);
    float _1466 = -_1458;
    float _1468 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1466);
    float _1470 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1474 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1476 = -_1454;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1468);
    float _1480 = floor(_1438);
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1470);
    float _1484 = fma(_1478, 0.5, 0.5);
    float _1486 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1482);
    float _1488 = log2(_1442);
    float _1490 = -_1460;
    float _1492 = _1398 + _1490;
    float _1494 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1486);
    float _1496 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1500 = exp2(_1472);
    float _1502 = fma(_1478, -0.5, 0.5);
    float _1504 = -_1480;
    float _1506 = _1438 + _1504;
    float _1508 = _1452 + 1.0;
    float _1510 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1498);
    float _1512 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1514 = 1.0 / _1494;
    float _1516 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1518 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1520 = fma(_1484, _1512, -0.212114393711090087890625);
    float _1522 = _1488 * 0.693147182464599609375;
    float _1524 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1516);
    float _1526 = sqrt(_1502);
    float _1528 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1530 = -_1452;
    float _1532 = fma(_1500, _1508, _1530);
    float2 _4559 = float2(_1492, _1506);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4559, float2(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4559, float2(0.0), isnan(_4559)), level(0.0)).x;
    float _1536 = fma(_1484, _1520, 1.570728778839111328125);
    float _1538 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1528);
    float _1540 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = _1518 * _1514;
    float _1546 = _1538 * _1514;
    float _1548 = fma(_1544, 0.5, 0.5);
    float _1550 = fma(_1546, -0.5, 0.5);
    float _1552 = _1526 * 0.636619746685028076171875;
    float3 _4596 = float3(_1548, _1550, _1540);
    float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4596, float3(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4596, float3(0.0), isnan(_4596)), level(0.0)).x;
    float3 _4607 = float3(_1548, _1550, _1540);
    float4 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).xyzw;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = _1557.w;
    float _1567 = -_1536;
    float _1569 = fma(_1552, _1567, 1.0);
    float2 _4628 = float2(_1569, _1542);
    float3 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4628, float2(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4628, float2(0.0), isnan(_4628)), level(0.0)).xyz;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1583 = in.m_65.x;
    bool _1585 = _770 != 0.0;
    bool _1587 = isnan(_770);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    float _1595 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1597 = _276 > 0.5;
    float _1599 = _1581 * _230;
    float _1601 = in.m_65.y;
    bool _1603 = _768 == 0.0;
    bool _1605 = !_1593;
    bool _1607 = _1603 && _1605;
    float _1609 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1613 = _1611 != 0;
    float _1615 = trunc(_1599);
    int _1617 = int(_1615);
    bool _1619 = _772 == 0.0;
    bool _1621 = _1619 && _1607;
    float _1623 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    bool _1625 = _230 > 0.5;
    bool _1627 = _1625 && _1613;
    float _1629 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1623);
    int _1631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1633 = _1631 != 0;
    float _1635 = exp2(_1595);
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = 0.0187292993068695068359375;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1643 = _1494;
    float _1645 = _1538;
    if (_1613)
    {
        _1639 = _1583;
    }
    float _1647 = _1639;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1651 = _1617 << 4;
    int _1653 = _1651 + 1712;
    float _1655 = _1647;
    if (!_1613)
    {
        _1641 = _1583;
    }
    float _1657 = _1641;
    float _1659 = _1657;
    if (_1627)
    {
        float _1661 = -_1647;
        float _1663 = _1661 + 1.0;
        _1655 = _1663;
    }
    float _1665 = _1655;
    uint _1668 = uint(int(uint(_1653) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    float _1684 = in.m_67.x;
    float _1686 = in.m_67.y;
    float _1688 = in.m_67.z;
    float _1690 = -_1601;
    float _1692 = _1690 + 1.0;
    float _1694 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1601;
    if (_1613)
    {
        _1659 = _1665;
    }
    float _1698 = _1659;
    float _1700 = -_1635;
    float _1702 = _1700 + 1.0;
    if (_1633)
    {
        float _1704 = _1597 ? _1692 : _1601;
        _1696 = _1704;
    }
    float _1706 = _1696;
    int _1708 = _1653 + 8;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1722 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_69.x = _1694;
    out.m_69.y = _1724;
    out.m_69.z = _1722;
    float _1730 = _1686;
    float _1732 = _1684;
    float _1734 = _1688;
    if (!_1621)
    {
        float _1736 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1686);
        _1730 = _1736;
    }
    float _1738 = _1730;
    if (!_1621)
    {
        float _1740 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1684);
        _1732 = _1740;
    }
    float _1742 = _1732;
    if (!_1621)
    {
        float _1744 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1734 = _1744;
    }
    float _1746 = _1734;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1750 = _856 * _1738;
    float _1752 = -_1738;
    float _1754 = _866 * _1752;
    float _1756 = _860 * _1738;
    float _1758 = in.m_57.x;
    float _1760 = fma(_884, _1742, _1750);
    float _1762 = fma(_882, _1742, _1754);
    float _1764 = fma(_888, _1742, _1756);
    bool _1766 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1768 = isnan(_1250);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1774 = _1770 || _1772;
    float _1776 = fma(_894, _1746, _1760);
    float _1778 = fma(_872, _1746, _1762);
    float _1780 = fma(_904, _1746, _1764);
    float _1782 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1786 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1782);
    float _1788 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1784);
    float _1790 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1786);
    float _1796 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1788);
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1802 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1804 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1806 = _1720 * _1728;
    float _1808 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1810 = _1800 * _1748;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1808);
    out.m_71.x = _1806;
    out.m_71.y = _1810;
    float _1816 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1814);
    float _1818 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_73.x = _1804;
    out.m_73.y = _1798;
    out.m_73.z = _1812;
    out.m_73.w = _1726;
    float _1820 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1818);
    out.m_75.x = _1816;
    out.m_75.y = _1796;
    out.m_75.z = _1794;
    float _1822 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1820);
    float _1824 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1826 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1828 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1824);
    float _1830 = 1.0 / _1826;
    float _1832 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1828);
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1836 = _1834 + _1826;
    float _1838 = _1836 * _1830;
    float _1840 = _1838 * 0.5;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1844 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1842);
    float _1846 = 1.0 / _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1850 = _1846 * _1848;
    float _1852 = abs(_1850);
    float _1854 = log2(_1852);
    bool _1856 = _1850 <= 8000.0;
    bool _1858 = isnan(_1850);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(8000.0);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1870 = exp2(_1868);
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = fma(_1874, -2.0, 3.0);
    float _1878 = _1874 * _1874;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1880 = _1878 * _1876;
    float _1882 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1629);
    float _1884 = -_1880;
    float _1886 = _1884 + 1.0;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1890 = _1882 + _1888;
    float _1892 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1880);
    float _1894 = _1494 + _1890;
    out.gl_Position.x = _1518;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1890;
    out.gl_Position.w = _1494;
    float _1896 = 1.0;
    float _1898 = _1890;
    if (!_1774)
    {
        _1896 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1900 = _1896;
    float _1902 = _1866 * _1892;
    float _1904 = _1894 * 0.5;
    float _1906 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1908 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1904;
    out.m_79.w = _1494;
    float _1910 = -_1906;
    float _1912 = _1910 + 1.0;
    float _1914 = _1912;
    float _1916 = _1900;
    float _1918 = _1900;
    if (!_1774)
    {
        _1643 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1920 = _1643;
    float _1922 = _1920;
    float _1924 = _1920;
    if (!_1774)
    {
        _1898 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1926 = _1898;
    float _1928 = _1926;
    float _1930 = _1926;
    if (!_1774)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1932 = _1645;
    float _1934 = -_1534;
    float _1936 = _1934 + 1.0;
    float _1938 = _1936 * _1908;
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1940;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1946 = _1944 * _1758;
    float _1948 = _1906 * _1554;
    float _1950 = _1565 * _1912;
    float _1952 = _1946 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1954 = _1932;
    float _1956 = _1932;
    if (!_1774)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1958 = _1914;
    float _1960 = _1565 * _1948;
    out.m_81.x = _1952;
    float _1962 = _1579 * _1948;
    float _1964 = fma(_1575, _1960, _1559);
    float _1966 = fma(_1577, _1960, _1561);
    float _1968 = _1960;
    float _1970 = _1958;
    float _1972 = _1958;
    if (!_1774)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1974 = _1968;
    float _1976 = fma(_1565, _1962, _1563);
    out.m_83.x = _1964;
    out.m_83.y = _1966;
    out.m_83.z = _1976;
    out.m_83.w = _1950;
    bool _1978 = !_1774;
    float _1980 = _1974;
    float _1982 = _1974;
    if (!_1978)
    {
        bool _1984 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1986 = isnan(_1250);
        bool _1988 = _1984 || _1986;
        bool _1990 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1992 = _1988 || _1990;
        if (!_1992)
        {
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1996 = _1250 + _1994;
            float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2000 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1998;
            float _2002 = 1.0 / _2000;
            float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2018 = _2016 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2024 = _1996 * _2002;
            float _2026 = precise::clamp(_2024, 0.0, 1.0);
            float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2032 = fma(_2026, _2006, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2034 = fma(_2026, _2030, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2036 = fma(_2026, _2010, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2038 = fma(_2026, _2014, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2040 = fma(_2026, _2018, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2042 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1918 = _2034;
            _1956 = _2040;
            _1982 = _2032;
            _1930 = _2038;
            _1924 = _2036;
            _1972 = _2042;
            _2044 = true;
        }
        else
        {
            bool _2046 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2048 = isnan(_1250);
            bool _2050 = _2046 || _2048;
            bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2054 = _2050 || _2052;
            if (!_2054)
            {
                _1980 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2056 = _1980;
            _1982 = _2056;
            if (!_2054)
            {
                _1916 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2058 = _1916;
            _1918 = _2058;
            if (!_2054)
            {
                _1922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2060 = _1922;
            _1924 = _2060;
            if (!_2054)
            {
                _1928 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2062 = _1928;
            _1930 = _2062;
            if (!_2054)
            {
                _1954 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2064 = _1954;
            _1956 = _2064;
            if (!_2054)
            {
                _1970 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2066 = _1970;
            bool _2068 = !_2054;
            _1972 = _2066;
            if (!_2068)
            {
                bool _2070 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2072 = isnan(_1250);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2078 = _2074 || _2076;
                if (!_2078)
                {
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2082 = _1250 + _2080;
                    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2084;
                    float _2088 = 1.0 / _2086;
                    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2110 = _2082 * _2088;
                    float _2112 = precise::clamp(_2110, 0.0, 1.0);
                    float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2118 = fma(_2112, _2092, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2120 = fma(_2112, _2116, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2122 = fma(_2112, _2096, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2124 = fma(_2112, _2100, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2126 = fma(_2112, _2104, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2128 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1918 = _2120;
                    _1956 = _2126;
                    _1982 = _2118;
                    _1930 = _2124;
                    _1924 = _2122;
                    _1972 = _2128;
                    _2044 = true;
                }
                else
                {
                    _1918 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1956 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1982 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1930 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1972 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2044 = false;
    float _2130 = _1918;
    float _2132 = _1956;
    float _2134 = _1982;
    float _2136 = _1930;
    float _2138 = _1924;
    float _2140 = _1972;
    float _2142 = fma(_1796, -0.5, 0.5);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = -_2130;
    float _2148 = _2146 + _2132;
    float _2150 = -_2134;
    float _2152 = _2150 + _2136;
    float _2154 = -_2138;
    float _2156 = _2154 + _2140;
    bool _2158 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2160 = fma(_2144, _2148, _2130);
    float _2162 = fma(_2144, _2152, _2134);
    float _2164 = fma(_2144, _2156, _2138);
    float _2166 = _2160 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2168 = fma(_2162, 0.298911988735198974609375, _2166);
    float _2170 = fma(_2164, 0.114477999508380889892578125, _2168);
    out.m_85.x = 0.0;
    float _2172 = -_2170;
    float _2174 = _2162 + _2172;
    float _2176 = -_2170;
    float _2178 = _2160 + _2176;
    float _2180 = -_2170;
    float _2182 = _2164 + _2180;
    float _2184 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2186 = fma(_2174, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    float _2188 = fma(_2178, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    float _2190 = fma(_2182, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    out.m_81.w = _2184;
    out.m_87.x = _2186;
    out.m_87.y = _2188;
    out.m_87.z = _2190;
    if (!_2158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2192 = -_1220;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2196 = -_1224;
    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2200 = -_1228;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2204 = _2194 * _2194;
    float _2206 = fma(_2198, _2198, _2204);
    float _2208 = fma(_2202, _2202, _2206);
    float _2210 = sqrt(_2208);
    float _2212 = rsqrt(_2208);
    float _2214 = -_2210;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2218 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = _2198 * _2212;
    float _2224 = _2194 * _2212;
    float _2226 = abs(_2220);
    float _2228 = log2(_2226);
    float _2230 = _2202 * _2212;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2234 = _1796 * _2224;
    float _2236 = -_2224;
    float _2238 = -_2232;
    float _2240 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2238);
    float _2242 = fma(_1816, _2222, _2234);
    float _2244 = -_2230;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2240);
    float _2248 = fma(_1794, _2230, _2242);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2254 = _2246 + _2252;
    float _2256 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2258 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2260 = precise::clamp(_2258, 0.0, 1.0);
    float _2262 = exp2(_2256);
    float _2264 = _2262 * _2260;
    float _2266 = _2250 * _2264;
    float _2268 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2270 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2272 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2268;
    out.m_85.y = _2270;
    out.m_85.z = _2272;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2044 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2328 = as_type<float>(_120);
        out.gl_Position.z = _2328;
    }
    if (!_110)
    {
        return out;
    }
    float _124 = in.m_53.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_106);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = 0.0;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2397 = as_type<float>(_160);
        out.gl_Position.z = _2397;
    }
    if (_152)
    {
        return out;
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _138 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _196 = log2(_194);
    float _198 = in.m_55.z;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _192 + _200;
    float _204 = in.m_57.y;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _208 = 1.0 + _206;
    int _210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _212 = _210 != 0;
    float _214 = in.m_48.x;
    float _216 = in.m_48.y;
    float _218 = in.m_48.z;
    float _220 = 1.0 / _208;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _228 = _226 != 0;
    float _230 = in.m_55.x;
    bool _232 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _234 = isnan(1.0);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _240 = _236 || _238;
    float _242 = _196 * _138;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    bool _248 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _256 = _252 || _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = exp2(_242);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _192 + _264;
    float _268 = _198 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = 1.0 / _246;
    float _276 = in.m_55.y;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _216 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = _216 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _286 = floor(_268);
    float _288 = -_262;
    float _290 = _288 + 1.0;
    float _292 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _294 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[6].x, _284);
    float _296 = _256 ? _290 : 0.0;
    float _298 = _230 * 2.0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _310 = _308 != 0;
    float _312 = _216 + _204;
    float _314 = _216 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _312;
    if (_240)
    {
        float _318 = _296 * _220;
        _142 = _318;
    }
    float _320 = _142;
    float _322 = 1.0 / _260;
    float _324 = _266 * _274;
    float _326 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _328 = _230 + _198;
    bool _330 = _286 >= 0.0;
    bool _332 = isnan(_286);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = _276 * 2.0;
    float _342 = _328 + (-1.0);
    float _344 = floor(_298);
    int _346 = _338 ? 0 : 1;
    float _348 = _276 + _198;
    bool _350 = _286 > 0.0;
    float _352 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _354 = !_302;
    int _356 = _354 ? 0 : 1;
    float _358 = _348 + (-1.0);
    float _360 = floor(_340);
    float _362 = _202 * _322;
    int _364 = ~_346;
    int _366 = _364 + 1;
    int _368 = _366 + 1;
    float _370 = fma(_272, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _374 = _230 + _276;
    float _376 = fma(_280, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _198 + (-0.5);
    int _380 = _368;
    if (!_350)
    {
        int _382 = ~_346;
        int _384 = _382 + 1;
        _380 = _384;
    }
    int _386 = _380;
    float _388 = _374 + (-1.0);
    bool _390 = _344 >= 0.0;
    bool _392 = isnan(_344);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    int _400 = abs(_356);
    float _402 = _320 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _404 = _398 ? 0 : 1;
    float _406 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _408 = _344 > 0.0;
    float _410 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[6].z, _294);
    float _412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _414 = _360 >= 0.0;
    bool _416 = isnan(_360);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[5].z, _326);
    float _426 = float(_400);
    float _428 = _410 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _430 = _422 ? 0 : 1;
    float _432 = _424 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _434 = _360 > 0.0;
    float _436 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _438 = float(_386);
    int _440 = ~_404;
    int _442 = _440 + 1;
    int _444 = _442 + 1;
    float _446 = _436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _448 = ~_430;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    int _454 = _444;
    int _456 = _452;
    float _458 = _428;
    float _460 = _446;
    if (!_408)
    {
        int _462 = ~_404;
        int _464 = _462 + 1;
        _454 = _464;
    }
    int _466 = _454;
    float _468 = _402 * _412;
    bool _470 = !_306;
    int _472 = _470 ? 0 : 1;
    float _474 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[203].y, _468);
    if (!_434)
    {
        int _476 = ~_430;
        int _478 = _476 + 1;
        _456 = _478;
    }
    int _480 = _456;
    float _482 = _426 * _438;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = in.m_59.x;
    float _490 = in.m_59.y;
    float _492 = in.m_59.z;
    float _494 = _474 + 0.25;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = fma(_486, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _506 = floor(_474);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _512 = !_310;
    int _514 = _512 ? 0 : 1;
    float _516 = _482 * (-2.0);
    int _518 = abs(_472);
    float _520 = _474 * 6.283185482025146484375;
    int _522 = abs(_514);
    float _524 = fma(_498, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = floor(_494);
    float _528 = float(_518);
    float _530 = fma(_504, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _532 = float(_466);
    float _534 = fma(_510, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _536 = float(_522);
    float _538 = _520 * 0.15915493667125701904296875;
    bool _540 = !_224;
    int _542 = _540 ? 0 : 1;
    float _544 = -_506;
    float _546 = _474 + _544;
    float _548 = _528 * _532;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _552 = _428 + _550;
    float _554 = fma(_516, _488, _488);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _446 + _556;
    float _560 = float(_480);
    float _562 = fma(_406, _516, _406);
    bool _564 = _546 >= 0.5;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.5);
    bool _572 = _568 || _570;
    float _574 = -_526;
    float _576 = _494 + _574;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _312 + _578;
    float _582 = _558 * _558;
    bool _584 = !_212;
    int _586 = _584 ? 0 : 1;
    float _588 = _538 * 6.283185482025146484375;
    float _590 = sin(_588);
    int _592 = abs(_542);
    float _594 = _552 * _552;
    float _596 = fma(_580, _580, _582);
    float _598 = _536 * _560;
    float _600 = _230 + (-0.5);
    int _602 = abs(_586);
    float _604 = _594 + _596;
    bool _606 = _576 > 0.5;
    float _608 = _598 * (-2.0);
    bool _610 = !_572;
    float _612 = _610 ? 0.5 : (-0.5);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _616 = float(_592);
    float _618 = rsqrt(_604);
    float _620 = fma(_608, _492, _492);
    float _622 = _612 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _624 = _622 * 2.0;
    float _626 = fma(_352, _608, _352);
    bool _628 = !_228;
    int _630 = _628 ? 0 : 1;
    float _632 = _616 * _624;
    float _634 = float(_602);
    float _636 = _590 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _638 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[196].z, _620);
    int _640 = abs(_630);
    float _642 = _576;
    if (_606)
    {
        float _644 = -_576;
        float _646 = _644 + 1.0;
        _642 = _646;
    }
    float _648 = _642;
    float _650 = fma(_634, _636, _632);
    float _652 = fma(_562, _320, _614);
    float _654 = fma(_648, 4.0, -1.0);
    float _656 = _580 * _618;
    float _658 = _558 * _618;
    float _660 = float(_640);
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _664 = -_656;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _668 = -_658;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _672 = _652 * 0.15915493667125701904296875;
    float _674 = fma(_660, _662, _650);
    float _676 = _666 * _666;
    float _678 = _548 * (-2.0);
    bool _680 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _682 = isnan(_192);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_674, 3.1415927410125732421875, _490);
    float _694 = fma(_670, _670, _676);
    bool _696 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _698 = isnan(_192);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = fma(_372, _678, _372);
    float _710 = fma(_692, _678, _692);
    float _712 = -_690;
    float _714 = _712 + 1.0;
    float _716 = _552 * _618;
    bool _718 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _720 = isnan(_192);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_626, _320, _638);
    float _732 = _706 * _714;
    float _734 = -_716;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _738 = -_706;
    float _740 = _738 + 1.0;
    float _742 = in.m_61.x;
    float _744 = in.m_61.y;
    float _746 = in.m_61.z;
    float _748 = _276 + (-0.5);
    float _750 = fma(_736, _736, _694);
    float _752 = _728 * _740;
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    float _760 = _672 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _500 * _752;
    float _766 = _370 * _752;
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = _376 * _752;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].x, _764);
    float _778 = fma(_708, _320, _758);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _782 = sqrt(_750);
    float _784 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].z, _774);
    float _786 = fma(_524, _732, _776);
    float _788 = _730 * 0.15915493667125701904296875;
    float _790 = fma(_530, _732, _780);
    float _792 = fma(_534, _732, _784);
    float _794 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].x, _786);
    float _796 = _778 * 0.15915493667125701904296875;
    float _798 = _672 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].z, _792);
    float _804 = _794 * _742;
    float _806 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].y, _790);
    float _808 = _802 * _746;
    float _810 = _806 * _744;
    float _812 = _788 * 6.283185482025146484375;
    float _814 = cos(_812);
    float _816 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _818 = _618 * _782;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _822 = _432 + _820;
    float _824 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _832 = _796 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _816 * _818;
    float _838 = _824 * _818;
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _842 = _826 * _818;
    float _844 = fma(_822, _822, _582);
    float _846 = _836 * _828;
    float _848 = _838 * _830;
    float _850 = _796 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _842 * _840;
    float _856 = _800 * _814;
    float _858 = _594 + _844;
    float _860 = _762 * _814;
    float _862 = _856 * _854;
    float _864 = _788 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _762 * _834;
    float _870 = _800 * _834;
    float _872 = _834 * _814;
    float _874 = _860 * _854;
    float _876 = _800 * _852;
    float _878 = _762 * _852;
    float _880 = sqrt(_858);
    float _882 = _852 * _814;
    float _884 = fma(_866, _876, _868);
    float _886 = -_870;
    float _888 = fma(_866, _878, _886);
    float _890 = rsqrt(_858);
    float _892 = -_878;
    float _894 = fma(_866, _870, _892);
    float _896 = -_854;
    float _898 = _866 * _896;
    float _900 = fma(_884, _846, _862);
    float _902 = fma(_888, _846, _874);
    float _904 = fma(_866, _868, _876);
    float _906 = fma(_882, _846, _898);
    float _908 = fma(_894, _848, _900);
    float _910 = precise::max(_880, 2.0);
    float _912 = fma(_904, _848, _902);
    float _914 = fma(_872, _848, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _920 = precise::min(_910, 20.0);
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _924 = -_822;
    float _926 = fma(_924, _890, 0.0);
    float _928 = precise::clamp(_926, 0.0, 1.0);
    float _930 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[8].x, _918);
    float _932 = fma(_920, -0.02777777798473834991455078125, 0.5555555820465087890625);
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _936 = _340 + (-1.0);
    float _938 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _940 = -_928;
    float _942 = _940 + 1.0;
    float _944 = _428 + _934;
    float _946 = _298 + (-1.0);
    float _948 = _446 + _938;
    float _950 = _932 * _942;
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[191].x, _944);
    float _954 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[191].x, _948);
    float _956 = -_952;
    float _958 = _428 + _956;
    float _960 = -_954;
    float _962 = _446 + _960;
    float _964 = fma(_950, _958, _952);
    float _966 = fma(_950, _962, _954);
    float _968 = _908 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _964 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _976 = _966 + _974;
    float _978 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[9].x, _968);
    float _980 = _972 * _972;
    float _982 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].z, _978);
    float _984 = fma(_976, _976, _980);
    float _986 = _312 + _982;
    float _988 = sqrt(_984);
    float _990 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[191].y, _986);
    bool _992 = _988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _914;
    float _996 = _978;
    float _998 = _966;
    float _1000 = _976;
    float _1002 = _658;
    float _1004 = _818;
    if (!_992)
    {
        _994 = _966;
    }
    float _1006 = _994;
    float _1008 = _1006;
    if (!_992)
    {
        _996 = _964;
    }
    float _1010 = _996;
    float _1012 = _1010;
    if (!_992)
    {
        _998 = _990;
    }
    float _1014 = _998;
    bool _1016 = !_992;
    float _1018 = _1014;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _988 + _1022;
        float _1026 = rsqrt(_984);
        float _1028 = _1024 * _1020;
        float _1030 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = _1028 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1036 + (-1.0);
        float _1044 = fma(_1040, _1030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1026 * _1044;
        float _1050 = fma(_990, _1036, _1046);
        float _1052 = fma(_976, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1054 = fma(_972, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1008 = _1052;
        _1012 = _1054;
        _1018 = _1050;
    }
    float _1056 = _1008;
    float _1058 = _1012;
    float _1060 = _1018;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1064 = _1056 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1068 = _1058 + _1066;
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1072 = fma(_1068, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3774 = float2(_1070, _1072);
    float _1074 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3774, float2(0.0), isnan(_3774)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3774, float2(0.0), isnan(_3774)), level(0.0)).x;
    bool _1076 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1078 = isnan(0.5);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1084 = _1080 || _1082;
    float _1086 = -_716;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _428);
    float _1090 = -_658;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _446);
    float _1094 = -_658;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    float _1098 = -_716;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1102 = _1058;
    float _1104 = _1072;
    float _1106 = _1056;
    float _1108 = _1096;
    float _1110 = _1100;
    if (!_1084)
    {
        float _1112 = -_428;
        float _1114 = _1112 + _1058;
        _1000 = _1114;
    }
    float _1116 = _1000;
    if (!_1084)
    {
        float _1118 = -_446;
        float _1120 = _1118 + _1056;
        _1002 = _1120;
    }
    float _1122 = _1002;
    if (!_1084)
    {
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1126 = _1092 + _1124;
        _1102 = _1126;
    }
    float _1128 = _1102;
    float _1130 = _1128;
    if (!_1084)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1104 = _1132;
    }
    float _1134 = _1104;
    float _1136 = _1134;
    if (!_1084)
    {
        float _1138 = 1.0 / _818;
        _1004 = _1138;
    }
    float _1140 = _1004;
    float _1142 = fma(_1074, 100.0, _312);
    float _1144 = _1074;
    float _1146 = _1140;
    if (!_1084)
    {
        float _1148 = -_312;
        float _1150 = _1148 + _1060;
        _316 = _1150;
    }
    float _1152 = _316;
    float _1154 = fma(_1074, 100.0, _1060);
    float _1156 = -_656;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1160 = -_656;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1164 = _1154;
    float _1166 = _1162;
    if (!_1084)
    {
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1170 = _1158 + _1168;
        _458 = _1170;
    }
    float _1172 = _458;
    if (!_1084)
    {
        float _1174 = _1172 * _1172;
        _1106 = _1174;
    }
    float _1176 = _1106;
    float _1178 = _1176;
    if (!_1084)
    {
        float _1180 = fma(_1128, _1128, _1176);
        _1178 = _1180;
    }
    float _1182 = _1178;
    float _1184 = _1182;
    if (!_1084)
    {
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1188 = _1088 + _1186;
        _1130 = _1188;
    }
    float _1190 = _1130;
    float _1192 = _1190;
    if (!_1084)
    {
        float _1194 = fma(_1190, _1190, _1182);
        _1184 = _1194;
    }
    float _1196 = _1184;
    float _1198 = _1196;
    if (!_1084)
    {
        float _1200 = sqrt(_1196);
        _1198 = _1200;
    }
    float _1202 = _1198;
    if (!_1084)
    {
        float _1204 = precise::min(_1202, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1192 = _1204;
    }
    float _1206 = _1192;
    float _1208 = _1206;
    if (!_1084)
    {
        float _1210 = _1206 * _1134;
        _1208 = _1210;
    }
    float _1212 = _1208;
    if (!_1084)
    {
        float _1214 = _1212 * _1140;
        _1164 = _1214;
    }
    float _1216 = _1164;
    if (!_1084)
    {
        float _1218 = fma(_1152, _1216, _1158);
        _1166 = _1218;
    }
    float _1220 = _1166;
    if (!_1084)
    {
        float _1222 = fma(_1122, _1216, _1092);
        _1108 = _1222;
    }
    float _1224 = _1108;
    if (!_1084)
    {
        float _1226 = fma(_1116, _1216, _1088);
        _1110 = _1226;
    }
    float _1228 = _1110;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1232 = _1220 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1236 = _1224 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = _1228 + _1238;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = fma(_1240, _1240, _1244);
    float _1248 = rsqrt(_1246);
    float _1250 = sqrt(_1246);
    float _1252 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1254 = _1236 * _1252;
    float _1256 = _1240 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 + _1260;
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = _1264 + _1268;
    float _1272 = _1240;
    float _1274 = _1270;
    float _1276 = _1232;
    if (_1266)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1278;
    }
    float _1280 = _1272;
    if (_1266)
    {
        float _1282 = rsqrt(_1262);
        _1144 = _1282;
    }
    float _1284 = _1144;
    float _1286 = _1284;
    if (_1266)
    {
        float _1288 = _1270 * _1280;
        _1274 = _1288;
    }
    float _1290 = _1274;
    if (_1266)
    {
        float _1292 = _1290 * 0.15915493667125701904296875;
        _460 = _1292;
    }
    float _1294 = _460;
    float _1296 = _1242;
    if (_1266)
    {
        float _1298 = _1294 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1296 = _1300;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1248;
    float _1310 = _1304;
    float _1312 = _1306;
    if (_1266)
    {
        float _1314 = _1294 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        _1308 = _1316;
    }
    float _1318 = _1308;
    float _1320 = -_1252;
    float _1322 = -_1306;
    float _1324 = fma(_1232, _1320, _1322);
    if (_1266)
    {
        float _1326 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1326;
    }
    float _1328 = _1310;
    float _1330 = _1302;
    if (_1266)
    {
        float _1332 = fma(_1302, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1136 = _1332;
    }
    float _1334 = _1136;
    float _1336 = _1334;
    if (!_1266)
    {
        _1330 = _1324;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    float _1342 = _1318;
    if (_1266)
    {
        float _1344 = _1318 + (-1.0);
        _1276 = _1344;
    }
    float _1346 = _1276;
    float _1348 = _1346;
    if (_1266)
    {
        float _1350 = _1284 * _1334;
        _1146 = _1350;
    }
    float _1352 = _1146;
    if (!_1266)
    {
        _1286 = _1254;
    }
    float _1354 = _1286;
    float _1356 = _1354;
    if (_1266)
    {
        float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1358;
    }
    float _1360 = _1312;
    if (_1266)
    {
        float _1362 = _1254 * _1352;
        _1356 = _1362;
    }
    float _1364 = _1356;
    if (!_1266)
    {
        _1348 = _1256;
    }
    float _1366 = _1348;
    float _1368 = _1366;
    if (_1266)
    {
        float _1370 = _1256 * _1352;
        _1368 = _1370;
    }
    float _1372 = _1368;
    if (_1266)
    {
        float _1374 = fma(_1324, _1318, _1360);
        _1340 = _1374;
    }
    float _1376 = _1340;
    if (!_1266)
    {
        _1342 = _1258;
    }
    float _1378 = _1342;
    float _1380 = _1378;
    if (_1266)
    {
        float _1382 = _1364 * _1364;
        _1380 = _1382;
    }
    float _1384 = _1380;
    if (!_1266)
    {
        _1336 = _1260;
    }
    float _1386 = _1336;
    float _1388 = _1386;
    if (_1266)
    {
        float _1390 = _1372 * _1372;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1376, _1376, _1384);
    float _1396 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1400 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = _1394 + _1392;
    float _1404 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1408 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1406);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    float _1412 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1414 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1404);
    float _1416 = rsqrt(_1402);
    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1420 = -_1410;
    float _1422 = _1420 + 1.0;
    float _1424 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1426 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1412);
    float _1428 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = abs(_1422);
    float _1434 = log2(_1432);
    float _1436 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1438 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1440 = -_1430;
    float _1442 = fma(_1440, _1418, 1.0);
    float _1444 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1428);
    float _1450 = _1416 * _1364;
    float _1452 = _1416 * _1376;
    float _1454 = _1416 * _1372;
    float _1456 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1444);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1460 = floor(_1398);
    float _1462 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1464 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1456);
    float _1466 = -_1458;
    float _1468 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1466);
    float _1470 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1474 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1476 = -_1454;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1468);
    float _1480 = floor(_1438);
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1470);
    float _1484 = fma(_1478, 0.5, 0.5);
    float _1486 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1482);
    float _1488 = log2(_1442);
    float _1490 = -_1460;
    float _1492 = _1398 + _1490;
    float _1494 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1486);
    float _1496 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1500 = exp2(_1472);
    float _1502 = fma(_1478, -0.5, 0.5);
    float _1504 = -_1480;
    float _1506 = _1438 + _1504;
    float _1508 = _1452 + 1.0;
    float _1510 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1498);
    float _1512 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1514 = 1.0 / _1494;
    float _1516 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1518 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1520 = fma(_1484, _1512, -0.212114393711090087890625);
    float _1522 = _1488 * 0.693147182464599609375;
    float _1524 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1516);
    float _1526 = sqrt(_1502);
    float _1528 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1530 = -_1452;
    float _1532 = fma(_1500, _1508, _1530);
    float2 _4559 = float2(_1492, _1506);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4559, float2(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4559, float2(0.0), isnan(_4559)), level(0.0)).x;
    float _1536 = fma(_1484, _1520, 1.570728778839111328125);
    float _1538 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1528);
    float _1540 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = _1518 * _1514;
    float _1546 = _1538 * _1514;
    float _1548 = fma(_1544, 0.5, 0.5);
    float _1550 = fma(_1546, -0.5, 0.5);
    float _1552 = _1526 * 0.636619746685028076171875;
    float3 _4596 = float3(_1548, _1550, _1540);
    float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4596, float3(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4596, float3(0.0), isnan(_4596)), level(0.0)).x;
    float3 _4607 = float3(_1548, _1550, _1540);
    float4 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).xyzw;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = _1557.w;
    float _1567 = -_1536;
    float _1569 = fma(_1552, _1567, 1.0);
    float2 _4628 = float2(_1569, _1542);
    float3 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4628, float2(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4628, float2(0.0), isnan(_4628)), level(0.0)).xyz;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1583 = in.m_65.x;
    bool _1585 = _770 != 0.0;
    bool _1587 = isnan(_770);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    float _1595 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1597 = _276 > 0.5;
    float _1599 = _1581 * _230;
    float _1601 = in.m_65.y;
    bool _1603 = _768 == 0.0;
    bool _1605 = !_1593;
    bool _1607 = _1603 && _1605;
    float _1609 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1613 = _1611 != 0;
    float _1615 = trunc(_1599);
    int _1617 = int(_1615);
    bool _1619 = _772 == 0.0;
    bool _1621 = _1619 && _1607;
    float _1623 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    bool _1625 = _230 > 0.5;
    bool _1627 = _1625 && _1613;
    float _1629 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1623);
    int _1631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1633 = _1631 != 0;
    float _1635 = exp2(_1595);
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = 0.0187292993068695068359375;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1643 = _1494;
    float _1645 = _1538;
    if (_1613)
    {
        _1639 = _1583;
    }
    float _1647 = _1639;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1651 = _1617 << 4;
    int _1653 = _1651 + 1712;
    float _1655 = _1647;
    if (!_1613)
    {
        _1641 = _1583;
    }
    float _1657 = _1641;
    float _1659 = _1657;
    if (_1627)
    {
        float _1661 = -_1647;
        float _1663 = _1661 + 1.0;
        _1655 = _1663;
    }
    float _1665 = _1655;
    uint _1668 = uint(int(uint(_1653) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    float _1684 = in.m_67.x;
    float _1686 = in.m_67.y;
    float _1688 = in.m_67.z;
    float _1690 = -_1601;
    float _1692 = _1690 + 1.0;
    float _1694 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1601;
    if (_1613)
    {
        _1659 = _1665;
    }
    float _1698 = _1659;
    float _1700 = -_1635;
    float _1702 = _1700 + 1.0;
    if (_1633)
    {
        float _1704 = _1597 ? _1692 : _1601;
        _1696 = _1704;
    }
    float _1706 = _1696;
    int _1708 = _1653 + 8;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1722 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_69.x = _1694;
    out.m_69.y = _1724;
    out.m_69.z = _1722;
    float _1730 = _1686;
    float _1732 = _1684;
    float _1734 = _1688;
    if (!_1621)
    {
        float _1736 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1686);
        _1730 = _1736;
    }
    float _1738 = _1730;
    if (!_1621)
    {
        float _1740 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1684);
        _1732 = _1740;
    }
    float _1742 = _1732;
    if (!_1621)
    {
        float _1744 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1734 = _1744;
    }
    float _1746 = _1734;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1750 = _856 * _1738;
    float _1752 = -_1738;
    float _1754 = _866 * _1752;
    float _1756 = _860 * _1738;
    float _1758 = in.m_57.x;
    float _1760 = fma(_884, _1742, _1750);
    float _1762 = fma(_882, _1742, _1754);
    float _1764 = fma(_888, _1742, _1756);
    bool _1766 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1768 = isnan(_1250);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1774 = _1770 || _1772;
    float _1776 = fma(_894, _1746, _1760);
    float _1778 = fma(_872, _1746, _1762);
    float _1780 = fma(_904, _1746, _1764);
    float _1782 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1786 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1782);
    float _1788 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1784);
    float _1790 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1786);
    float _1796 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1788);
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1802 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1804 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1806 = _1720 * _1728;
    float _1808 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1810 = _1800 * _1748;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1808);
    out.m_71.x = _1806;
    out.m_71.y = _1810;
    float _1816 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1814);
    float _1818 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_73.x = _1804;
    out.m_73.y = _1798;
    out.m_73.z = _1812;
    out.m_73.w = _1726;
    float _1820 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1818);
    out.m_75.x = _1816;
    out.m_75.y = _1796;
    out.m_75.z = _1794;
    float _1822 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1820);
    float _1824 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1826 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1828 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1824);
    float _1830 = 1.0 / _1826;
    float _1832 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1828);
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1836 = _1834 + _1826;
    float _1838 = _1836 * _1830;
    float _1840 = _1838 * 0.5;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1844 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1842);
    float _1846 = 1.0 / _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1850 = _1846 * _1848;
    float _1852 = abs(_1850);
    float _1854 = log2(_1852);
    bool _1856 = _1850 <= 8000.0;
    bool _1858 = isnan(_1850);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(8000.0);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1870 = exp2(_1868);
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = fma(_1874, -2.0, 3.0);
    float _1878 = _1874 * _1874;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1880 = _1878 * _1876;
    float _1882 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1629);
    float _1884 = -_1880;
    float _1886 = _1884 + 1.0;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1890 = _1882 + _1888;
    float _1892 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1880);
    float _1894 = _1494 + _1890;
    out.gl_Position.x = _1518;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1890;
    out.gl_Position.w = _1494;
    float _1896 = 1.0;
    float _1898 = _1890;
    if (!_1774)
    {
        _1896 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1900 = _1896;
    float _1902 = _1866 * _1892;
    float _1904 = _1894 * 0.5;
    float _1906 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1908 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1904;
    out.m_79.w = _1494;
    float _1910 = -_1906;
    float _1912 = _1910 + 1.0;
    float _1914 = _1912;
    float _1916 = _1900;
    float _1918 = _1900;
    if (!_1774)
    {
        _1643 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1920 = _1643;
    float _1922 = _1920;
    float _1924 = _1920;
    if (!_1774)
    {
        _1898 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1926 = _1898;
    float _1928 = _1926;
    float _1930 = _1926;
    if (!_1774)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1932 = _1645;
    float _1934 = -_1534;
    float _1936 = _1934 + 1.0;
    float _1938 = _1936 * _1908;
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1940;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1946 = _1944 * _1758;
    float _1948 = _1906 * _1554;
    float _1950 = _1565 * _1912;
    float _1952 = _1946 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1954 = _1932;
    float _1956 = _1932;
    if (!_1774)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1958 = _1914;
    float _1960 = _1565 * _1948;
    out.m_81.x = _1952;
    float _1962 = _1579 * _1948;
    float _1964 = fma(_1575, _1960, _1559);
    float _1966 = fma(_1577, _1960, _1561);
    float _1968 = _1960;
    float _1970 = _1958;
    float _1972 = _1958;
    if (!_1774)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1974 = _1968;
    float _1976 = fma(_1565, _1962, _1563);
    out.m_83.x = _1964;
    out.m_83.y = _1966;
    out.m_83.z = _1976;
    out.m_83.w = _1950;
    bool _1978 = !_1774;
    float _1980 = _1974;
    float _1982 = _1974;
    if (!_1978)
    {
        bool _1984 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1986 = isnan(_1250);
        bool _1988 = _1984 || _1986;
        bool _1990 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1992 = _1988 || _1990;
        if (!_1992)
        {
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1996 = _1250 + _1994;
            float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2000 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1998;
            float _2002 = 1.0 / _2000;
            float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2018 = _2016 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2024 = _1996 * _2002;
            float _2026 = precise::clamp(_2024, 0.0, 1.0);
            float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2032 = fma(_2026, _2006, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2034 = fma(_2026, _2030, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2036 = fma(_2026, _2010, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2038 = fma(_2026, _2014, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2040 = fma(_2026, _2018, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2042 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1918 = _2034;
            _1956 = _2040;
            _1982 = _2032;
            _1930 = _2038;
            _1924 = _2036;
            _1972 = _2042;
            _2044 = true;
        }
        else
        {
            bool _2046 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2048 = isnan(_1250);
            bool _2050 = _2046 || _2048;
            bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2054 = _2050 || _2052;
            if (!_2054)
            {
                _1980 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2056 = _1980;
            _1982 = _2056;
            if (!_2054)
            {
                _1916 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2058 = _1916;
            _1918 = _2058;
            if (!_2054)
            {
                _1922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2060 = _1922;
            _1924 = _2060;
            if (!_2054)
            {
                _1928 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2062 = _1928;
            _1930 = _2062;
            if (!_2054)
            {
                _1954 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2064 = _1954;
            _1956 = _2064;
            if (!_2054)
            {
                _1970 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2066 = _1970;
            bool _2068 = !_2054;
            _1972 = _2066;
            if (!_2068)
            {
                bool _2070 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2072 = isnan(_1250);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2078 = _2074 || _2076;
                if (!_2078)
                {
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2082 = _1250 + _2080;
                    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2084;
                    float _2088 = 1.0 / _2086;
                    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2110 = _2082 * _2088;
                    float _2112 = precise::clamp(_2110, 0.0, 1.0);
                    float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2118 = fma(_2112, _2092, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2120 = fma(_2112, _2116, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2122 = fma(_2112, _2096, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2124 = fma(_2112, _2100, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2126 = fma(_2112, _2104, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2128 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1918 = _2120;
                    _1956 = _2126;
                    _1982 = _2118;
                    _1930 = _2124;
                    _1924 = _2122;
                    _1972 = _2128;
                    _2044 = true;
                }
                else
                {
                    _1918 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1956 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1982 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1930 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1972 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2044 = false;
    float _2130 = _1918;
    float _2132 = _1956;
    float _2134 = _1982;
    float _2136 = _1930;
    float _2138 = _1924;
    float _2140 = _1972;
    float _2142 = fma(_1796, -0.5, 0.5);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = -_2130;
    float _2148 = _2146 + _2132;
    float _2150 = -_2134;
    float _2152 = _2150 + _2136;
    float _2154 = -_2138;
    float _2156 = _2154 + _2140;
    bool _2158 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2160 = fma(_2144, _2148, _2130);
    float _2162 = fma(_2144, _2152, _2134);
    float _2164 = fma(_2144, _2156, _2138);
    float _2166 = _2160 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2168 = fma(_2162, 0.298911988735198974609375, _2166);
    float _2170 = fma(_2164, 0.114477999508380889892578125, _2168);
    out.m_85.x = 0.0;
    float _2172 = -_2170;
    float _2174 = _2162 + _2172;
    float _2176 = -_2170;
    float _2178 = _2160 + _2176;
    float _2180 = -_2170;
    float _2182 = _2164 + _2180;
    float _2184 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2186 = fma(_2174, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    float _2188 = fma(_2178, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    float _2190 = fma(_2182, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    out.m_81.w = _2184;
    out.m_87.x = _2186;
    out.m_87.y = _2188;
    out.m_87.z = _2190;
    if (!_2158)
    {
        return out;
    }
    float _2192 = -_1220;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2196 = -_1224;
    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2200 = -_1228;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2204 = _2194 * _2194;
    float _2206 = fma(_2198, _2198, _2204);
    float _2208 = fma(_2202, _2202, _2206);
    float _2210 = sqrt(_2208);
    float _2212 = rsqrt(_2208);
    float _2214 = -_2210;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2218 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = _2198 * _2212;
    float _2224 = _2194 * _2212;
    float _2226 = abs(_2220);
    float _2228 = log2(_2226);
    float _2230 = _2202 * _2212;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2234 = _1796 * _2224;
    float _2236 = -_2224;
    float _2238 = -_2232;
    float _2240 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2238);
    float _2242 = fma(_1816, _2222, _2234);
    float _2244 = -_2230;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2240);
    float _2248 = fma(_1794, _2230, _2242);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2254 = _2246 + _2252;
    float _2256 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2258 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2260 = precise::clamp(_2258, 0.0, 1.0);
    float _2262 = exp2(_2256);
    float _2264 = _2262 * _2260;
    float _2266 = _2250 * _2264;
    float _2268 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2270 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2272 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2268;
    out.m_85.y = _2270;
    out.m_85.z = _2272;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2044 = false;
    bool _184 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2328 = as_type<float>(_120);
        out.gl_Position.z = _2328;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_53.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_106);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    float _154 = 0.0;
    if (_152)
    {
        _154 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _154;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _158 = _156 * 5.0;
        _122 = as_type<int>(_158);
    }
    int _160 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2397 = as_type<float>(_160);
        out.gl_Position.z = _2397;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _164 = !_162;
    float _182;
    if (!_164)
    {
        float _166 = in.m_55.x;
        float _168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _170 = _166 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _172 = fma(_170, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _174 = _172 * _168;
        float _176 = floor(_174);
        float _178 = -_176;
        float _180 = _174 + _178;
        _182 = _180;
        _184 = true;
    }
    else
    {
        float _186 = float(_106);
        float _188 = 1.0 / _186;
        float _190 = _138 * _188;
        _182 = _190;
    }
    _184 = false;
    float _192 = _182;
    float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _196 = log2(_194);
    float _198 = in.m_55.z;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _192 + _200;
    float _204 = in.m_57.y;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _208 = 1.0 + _206;
    int _210 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _212 = _210 != 0;
    float _214 = in.m_48.x;
    float _216 = in.m_48.y;
    float _218 = in.m_48.z;
    float _220 = 1.0 / _208;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _224 = _222 != 0;
    int _226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _228 = _226 != 0;
    float _230 = in.m_55.x;
    bool _232 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _234 = isnan(1.0);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _240 = _236 || _238;
    float _242 = _196 * _138;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _244;
    bool _248 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _250 = isnan(0.0);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _256 = _252 || _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _258 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = exp2(_242);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = _192 + _264;
    float _268 = _198 * 2.0;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _270;
    float _274 = 1.0 / _246;
    float _276 = in.m_55.y;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _216 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _284 = _216 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _286 = floor(_268);
    float _288 = -_262;
    float _290 = _288 + 1.0;
    float _292 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[4].x, _282);
    float _294 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[6].x, _284);
    float _296 = _256 ? _290 : 0.0;
    float _298 = _230 * 2.0;
    int _300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _302 = _300 != 0;
    int _304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _306 = _304 != 0;
    int _308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _310 = _308 != 0;
    float _312 = _216 + _204;
    float _314 = _216 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _316 = _312;
    if (_240)
    {
        float _318 = _296 * _220;
        _142 = _318;
    }
    float _320 = _142;
    float _322 = 1.0 / _260;
    float _324 = _266 * _274;
    float _326 = fma(_214, (*spvDescriptorSet0.vp_c10)._m0[5].x, _314);
    float _328 = _230 + _198;
    bool _330 = _286 >= 0.0;
    bool _332 = isnan(_286);
    bool _334 = _330 || _332;
    bool _336 = isnan(0.0);
    bool _338 = _334 || _336;
    float _340 = _276 * 2.0;
    float _342 = _328 + (-1.0);
    float _344 = floor(_298);
    int _346 = _338 ? 0 : 1;
    float _348 = _276 + _198;
    bool _350 = _286 > 0.0;
    float _352 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _354 = !_302;
    int _356 = _354 ? 0 : 1;
    float _358 = _348 + (-1.0);
    float _360 = floor(_340);
    float _362 = _202 * _322;
    int _364 = ~_346;
    int _366 = _364 + 1;
    int _368 = _366 + 1;
    float _370 = fma(_272, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _372 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _374 = _230 + _276;
    float _376 = fma(_280, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _378 = _198 + (-0.5);
    int _380 = _368;
    if (!_350)
    {
        int _382 = ~_346;
        int _384 = _382 + 1;
        _380 = _384;
    }
    int _386 = _380;
    float _388 = _374 + (-1.0);
    bool _390 = _344 >= 0.0;
    bool _392 = isnan(_344);
    bool _394 = _390 || _392;
    bool _396 = isnan(0.0);
    bool _398 = _394 || _396;
    int _400 = abs(_356);
    float _402 = _320 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    int _404 = _398 ? 0 : 1;
    float _406 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _408 = _344 > 0.0;
    float _410 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[6].z, _294);
    float _412 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _414 = _360 >= 0.0;
    bool _416 = isnan(_360);
    bool _418 = _414 || _416;
    bool _420 = isnan(0.0);
    bool _422 = _418 || _420;
    float _424 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[5].z, _326);
    float _426 = float(_400);
    float _428 = _410 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _430 = _422 ? 0 : 1;
    float _432 = _424 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _434 = _360 > 0.0;
    float _436 = fma(_218, (*spvDescriptorSet0.vp_c10)._m0[4].z, _292);
    float _438 = float(_386);
    int _440 = ~_404;
    int _442 = _440 + 1;
    int _444 = _442 + 1;
    float _446 = _436 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _448 = ~_430;
    int _450 = _448 + 1;
    int _452 = _450 + 1;
    int _454 = _444;
    int _456 = _452;
    float _458 = _428;
    float _460 = _446;
    if (!_408)
    {
        int _462 = ~_404;
        int _464 = _462 + 1;
        _454 = _464;
    }
    int _466 = _454;
    float _468 = _402 * _412;
    bool _470 = !_306;
    int _472 = _470 ? 0 : 1;
    float _474 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[203].y, _468);
    if (!_434)
    {
        int _476 = ~_430;
        int _478 = _476 + 1;
        _456 = _478;
    }
    int _480 = _456;
    float _482 = _426 * _438;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _484;
    float _488 = in.m_59.x;
    float _490 = in.m_59.y;
    float _492 = in.m_59.z;
    float _494 = _474 + 0.25;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _498 = _496 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _500 = fma(_486, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _506 = floor(_474);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _512 = !_310;
    int _514 = _512 ? 0 : 1;
    float _516 = _482 * (-2.0);
    int _518 = abs(_472);
    float _520 = _474 * 6.283185482025146484375;
    int _522 = abs(_514);
    float _524 = fma(_498, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _526 = floor(_494);
    float _528 = float(_518);
    float _530 = fma(_504, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _532 = float(_466);
    float _534 = fma(_510, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _536 = float(_522);
    float _538 = _520 * 0.15915493667125701904296875;
    bool _540 = !_224;
    int _542 = _540 ? 0 : 1;
    float _544 = -_506;
    float _546 = _474 + _544;
    float _548 = _528 * _532;
    float _550 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _552 = _428 + _550;
    float _554 = fma(_516, _488, _488);
    float _556 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _558 = _446 + _556;
    float _560 = float(_480);
    float _562 = fma(_406, _516, _406);
    bool _564 = _546 >= 0.5;
    bool _566 = isnan(_546);
    bool _568 = _564 || _566;
    bool _570 = isnan(0.5);
    bool _572 = _568 || _570;
    float _574 = -_526;
    float _576 = _494 + _574;
    float _578 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _580 = _312 + _578;
    float _582 = _558 * _558;
    bool _584 = !_212;
    int _586 = _584 ? 0 : 1;
    float _588 = _538 * 6.283185482025146484375;
    float _590 = sin(_588);
    int _592 = abs(_542);
    float _594 = _552 * _552;
    float _596 = fma(_580, _580, _582);
    float _598 = _536 * _560;
    float _600 = _230 + (-0.5);
    int _602 = abs(_586);
    float _604 = _594 + _596;
    bool _606 = _576 > 0.5;
    float _608 = _598 * (-2.0);
    bool _610 = !_572;
    float _612 = _610 ? 0.5 : (-0.5);
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _616 = float(_592);
    float _618 = rsqrt(_604);
    float _620 = fma(_608, _492, _492);
    float _622 = _612 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _624 = _622 * 2.0;
    float _626 = fma(_352, _608, _352);
    bool _628 = !_228;
    int _630 = _628 ? 0 : 1;
    float _632 = _616 * _624;
    float _634 = float(_602);
    float _636 = _590 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _638 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[196].z, _620);
    int _640 = abs(_630);
    float _642 = _576;
    if (_606)
    {
        float _644 = -_576;
        float _646 = _644 + 1.0;
        _642 = _646;
    }
    float _648 = _642;
    float _650 = fma(_634, _636, _632);
    float _652 = fma(_562, _320, _614);
    float _654 = fma(_648, 4.0, -1.0);
    float _656 = _580 * _618;
    float _658 = _558 * _618;
    float _660 = float(_640);
    float _662 = _654 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _664 = -_656;
    float _666 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[18].w, _580);
    float _668 = -_658;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _672 = _652 * 0.15915493667125701904296875;
    float _674 = fma(_660, _662, _650);
    float _676 = _666 * _666;
    float _678 = _548 * (-2.0);
    bool _680 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _682 = isnan(_192);
    bool _684 = _680 || _682;
    bool _686 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _688 = _684 || _686;
    float _690 = float(_688);
    float _692 = fma(_674, 3.1415927410125732421875, _490);
    float _694 = fma(_670, _670, _676);
    bool _696 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _698 = isnan(_192);
    bool _700 = _696 || _698;
    bool _702 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _704 = _700 || _702;
    float _706 = float(_704);
    float _708 = fma(_372, _678, _372);
    float _710 = fma(_692, _678, _692);
    float _712 = -_690;
    float _714 = _712 + 1.0;
    float _716 = _552 * _618;
    bool _718 = _192 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _720 = isnan(_192);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = fma(_626, _320, _638);
    float _732 = _706 * _714;
    float _734 = -_716;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[18].w, _552);
    float _738 = -_706;
    float _740 = _738 + 1.0;
    float _742 = in.m_61.x;
    float _744 = in.m_61.y;
    float _746 = in.m_61.z;
    float _748 = _276 + (-0.5);
    float _750 = fma(_736, _736, _694);
    float _752 = _728 * _740;
    float _754 = -_728;
    float _756 = _754 + 1.0;
    float _758 = fma(_748, (*spvDescriptorSet0.vp_c9)._m0[196].y, _710);
    float _760 = _672 * 6.283185482025146484375;
    float _762 = sin(_760);
    float _764 = _500 * _752;
    float _766 = _370 * _752;
    float _768 = in.m_63.x;
    float _770 = in.m_63.y;
    float _772 = in.m_63.z;
    float _774 = _376 * _752;
    float _776 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].x, _764);
    float _778 = fma(_708, _320, _758);
    float _780 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].y, _766);
    float _782 = sqrt(_750);
    float _784 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[143].z, _774);
    float _786 = fma(_524, _732, _776);
    float _788 = _730 * 0.15915493667125701904296875;
    float _790 = fma(_530, _732, _780);
    float _792 = fma(_534, _732, _784);
    float _794 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].x, _786);
    float _796 = _778 * 0.15915493667125701904296875;
    float _798 = _672 * 6.283185482025146484375;
    float _800 = cos(_798);
    float _802 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].z, _792);
    float _804 = _794 * _742;
    float _806 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[145].y, _790);
    float _808 = _802 * _746;
    float _810 = _806 * _744;
    float _812 = _788 * 6.283185482025146484375;
    float _814 = cos(_812);
    float _816 = _804 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _818 = _618 * _782;
    float _820 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _822 = _432 + _820;
    float _824 = _808 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _826 = _810 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _828 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _768);
    float _830 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _772);
    float _832 = _796 * 6.283185482025146484375;
    float _834 = sin(_832);
    float _836 = _816 * _818;
    float _838 = _824 * _818;
    float _840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _770);
    float _842 = _826 * _818;
    float _844 = fma(_822, _822, _582);
    float _846 = _836 * _828;
    float _848 = _838 * _830;
    float _850 = _796 * 6.283185482025146484375;
    float _852 = cos(_850);
    float _854 = _842 * _840;
    float _856 = _800 * _814;
    float _858 = _594 + _844;
    float _860 = _762 * _814;
    float _862 = _856 * _854;
    float _864 = _788 * 6.283185482025146484375;
    float _866 = sin(_864);
    float _868 = _762 * _834;
    float _870 = _800 * _834;
    float _872 = _834 * _814;
    float _874 = _860 * _854;
    float _876 = _800 * _852;
    float _878 = _762 * _852;
    float _880 = sqrt(_858);
    float _882 = _852 * _814;
    float _884 = fma(_866, _876, _868);
    float _886 = -_870;
    float _888 = fma(_866, _878, _886);
    float _890 = rsqrt(_858);
    float _892 = -_878;
    float _894 = fma(_866, _870, _892);
    float _896 = -_854;
    float _898 = _866 * _896;
    float _900 = fma(_884, _846, _862);
    float _902 = fma(_888, _846, _874);
    float _904 = fma(_866, _868, _876);
    float _906 = fma(_882, _846, _898);
    float _908 = fma(_894, _848, _900);
    float _910 = precise::max(_880, 2.0);
    float _912 = fma(_904, _848, _902);
    float _914 = fma(_872, _848, _906);
    float _916 = _908 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _918 = _908 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _920 = precise::min(_910, 20.0);
    float _922 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _924 = -_822;
    float _926 = fma(_924, _890, 0.0);
    float _928 = precise::clamp(_926, 0.0, 1.0);
    float _930 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[8].x, _918);
    float _932 = fma(_920, -0.02777777798473834991455078125, 0.5555555820465087890625);
    float _934 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _936 = _340 + (-1.0);
    float _938 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[8].z, _930);
    float _940 = -_928;
    float _942 = _940 + 1.0;
    float _944 = _428 + _934;
    float _946 = _298 + (-1.0);
    float _948 = _446 + _938;
    float _950 = _932 * _942;
    float _952 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[191].x, _944);
    float _954 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[191].x, _948);
    float _956 = -_952;
    float _958 = _428 + _956;
    float _960 = -_954;
    float _962 = _446 + _960;
    float _964 = fma(_950, _958, _952);
    float _966 = fma(_950, _962, _954);
    float _968 = _908 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _970 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _972 = _964 + _970;
    float _974 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _976 = _966 + _974;
    float _978 = fma(_914, (*spvDescriptorSet0.vp_c10)._m0[9].x, _968);
    float _980 = _972 * _972;
    float _982 = fma(_912, (*spvDescriptorSet0.vp_c10)._m0[9].z, _978);
    float _984 = fma(_976, _976, _980);
    float _986 = _312 + _982;
    float _988 = sqrt(_984);
    float _990 = fma(_942, (*spvDescriptorSet0.vp_c9)._m0[191].y, _986);
    bool _992 = _988 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _994 = _914;
    float _996 = _978;
    float _998 = _966;
    float _1000 = _976;
    float _1002 = _658;
    float _1004 = _818;
    if (!_992)
    {
        _994 = _966;
    }
    float _1006 = _994;
    float _1008 = _1006;
    if (!_992)
    {
        _996 = _964;
    }
    float _1010 = _996;
    float _1012 = _1010;
    if (!_992)
    {
        _998 = _990;
    }
    float _1014 = _998;
    bool _1016 = !_992;
    float _1018 = _1014;
    if (!_1016)
    {
        float _1020 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1022 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1024 = _988 + _1022;
        float _1026 = rsqrt(_984);
        float _1028 = _1024 * _1020;
        float _1030 = _990 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1032 = _1028 * 0.15915493667125701904296875;
        float _1034 = _1032 * 6.283185482025146484375;
        float _1036 = cos(_1034);
        float _1038 = _1032 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1036 + (-1.0);
        float _1044 = fma(_1040, _1030, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1046 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1048 = _1026 * _1044;
        float _1050 = fma(_990, _1036, _1046);
        float _1052 = fma(_976, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1054 = fma(_972, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1008 = _1052;
        _1012 = _1054;
        _1018 = _1050;
    }
    float _1056 = _1008;
    float _1058 = _1012;
    float _1060 = _1018;
    float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1064 = _1056 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1068 = _1058 + _1066;
    float _1070 = fma(_1064, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1072 = fma(_1068, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _3774 = float2(_1070, _1072);
    float _1074 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_3774, float2(0.0), isnan(_3774)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_3774, float2(0.0), isnan(_3774)), level(0.0)).x;
    bool _1076 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1078 = isnan(0.5);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1084 = _1080 || _1082;
    float _1086 = -_716;
    float _1088 = fma(_1086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _428);
    float _1090 = -_658;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[18].w, _446);
    float _1094 = -_658;
    float _1096 = fma(_1094, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1056);
    float _1098 = -_716;
    float _1100 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1058);
    float _1102 = _1058;
    float _1104 = _1072;
    float _1106 = _1056;
    float _1108 = _1096;
    float _1110 = _1100;
    if (!_1084)
    {
        float _1112 = -_428;
        float _1114 = _1112 + _1058;
        _1000 = _1114;
    }
    float _1116 = _1000;
    if (!_1084)
    {
        float _1118 = -_446;
        float _1120 = _1118 + _1056;
        _1002 = _1120;
    }
    float _1122 = _1002;
    if (!_1084)
    {
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1126 = _1092 + _1124;
        _1102 = _1126;
    }
    float _1128 = _1102;
    float _1130 = _1128;
    if (!_1084)
    {
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        _1104 = _1132;
    }
    float _1134 = _1104;
    float _1136 = _1134;
    if (!_1084)
    {
        float _1138 = 1.0 / _818;
        _1004 = _1138;
    }
    float _1140 = _1004;
    float _1142 = fma(_1074, 100.0, _312);
    float _1144 = _1074;
    float _1146 = _1140;
    if (!_1084)
    {
        float _1148 = -_312;
        float _1150 = _1148 + _1060;
        _316 = _1150;
    }
    float _1152 = _316;
    float _1154 = fma(_1074, 100.0, _1060);
    float _1156 = -_656;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1142);
    float _1160 = -_656;
    float _1162 = fma(_1160, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1154);
    float _1164 = _1154;
    float _1166 = _1162;
    if (!_1084)
    {
        float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1170 = _1158 + _1168;
        _458 = _1170;
    }
    float _1172 = _458;
    if (!_1084)
    {
        float _1174 = _1172 * _1172;
        _1106 = _1174;
    }
    float _1176 = _1106;
    float _1178 = _1176;
    if (!_1084)
    {
        float _1180 = fma(_1128, _1128, _1176);
        _1178 = _1180;
    }
    float _1182 = _1178;
    float _1184 = _1182;
    if (!_1084)
    {
        float _1186 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1188 = _1088 + _1186;
        _1130 = _1188;
    }
    float _1190 = _1130;
    float _1192 = _1190;
    if (!_1084)
    {
        float _1194 = fma(_1190, _1190, _1182);
        _1184 = _1194;
    }
    float _1196 = _1184;
    float _1198 = _1196;
    if (!_1084)
    {
        float _1200 = sqrt(_1196);
        _1198 = _1200;
    }
    float _1202 = _1198;
    if (!_1084)
    {
        float _1204 = precise::min(_1202, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        _1192 = _1204;
    }
    float _1206 = _1192;
    float _1208 = _1206;
    if (!_1084)
    {
        float _1210 = _1206 * _1134;
        _1208 = _1210;
    }
    float _1212 = _1208;
    if (!_1084)
    {
        float _1214 = _1212 * _1140;
        _1164 = _1214;
    }
    float _1216 = _1164;
    if (!_1084)
    {
        float _1218 = fma(_1152, _1216, _1158);
        _1166 = _1218;
    }
    float _1220 = _1166;
    if (!_1084)
    {
        float _1222 = fma(_1122, _1216, _1092);
        _1108 = _1222;
    }
    float _1224 = _1108;
    if (!_1084)
    {
        float _1226 = fma(_1116, _1216, _1088);
        _1110 = _1226;
    }
    float _1228 = _1110;
    float _1230 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1232 = _1220 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1236 = _1224 + _1234;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1240 = _1228 + _1238;
    float _1242 = _1232 * _1232;
    float _1244 = fma(_1236, _1236, _1242);
    float _1246 = fma(_1240, _1240, _1244);
    float _1248 = rsqrt(_1246);
    float _1250 = sqrt(_1246);
    float _1252 = _1248 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1254 = _1236 * _1252;
    float _1256 = _1240 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 * _1256;
    float _1262 = _1258 + _1260;
    float _1264 = sqrt(_1262);
    bool _1266 = _1264 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1270 = _1264 + _1268;
    float _1272 = _1240;
    float _1274 = _1270;
    float _1276 = _1232;
    if (_1266)
    {
        float _1278 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1272 = _1278;
    }
    float _1280 = _1272;
    if (_1266)
    {
        float _1282 = rsqrt(_1262);
        _1144 = _1282;
    }
    float _1284 = _1144;
    float _1286 = _1284;
    if (_1266)
    {
        float _1288 = _1270 * _1280;
        _1274 = _1288;
    }
    float _1290 = _1274;
    if (_1266)
    {
        float _1292 = _1290 * 0.15915493667125701904296875;
        _460 = _1292;
    }
    float _1294 = _460;
    float _1296 = _1242;
    if (_1266)
    {
        float _1298 = _1294 * 6.283185482025146484375;
        float _1300 = sin(_1298);
        _1296 = _1300;
    }
    float _1302 = _1296;
    float _1304 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1306 = precise::max(0.0, _1304);
    float _1308 = _1248;
    float _1310 = _1304;
    float _1312 = _1306;
    if (_1266)
    {
        float _1314 = _1294 * 6.283185482025146484375;
        float _1316 = cos(_1314);
        _1308 = _1316;
    }
    float _1318 = _1308;
    float _1320 = -_1252;
    float _1322 = -_1306;
    float _1324 = fma(_1232, _1320, _1322);
    if (_1266)
    {
        float _1326 = _1324 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1310 = _1326;
    }
    float _1328 = _1310;
    float _1330 = _1302;
    if (_1266)
    {
        float _1332 = fma(_1302, _1328, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1136 = _1332;
    }
    float _1334 = _1136;
    float _1336 = _1334;
    if (!_1266)
    {
        _1330 = _1324;
    }
    float _1338 = _1330;
    float _1340 = _1338;
    float _1342 = _1318;
    if (_1266)
    {
        float _1344 = _1318 + (-1.0);
        _1276 = _1344;
    }
    float _1346 = _1276;
    float _1348 = _1346;
    if (_1266)
    {
        float _1350 = _1284 * _1334;
        _1146 = _1350;
    }
    float _1352 = _1146;
    if (!_1266)
    {
        _1286 = _1254;
    }
    float _1354 = _1286;
    float _1356 = _1354;
    if (_1266)
    {
        float _1358 = _1346 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1358;
    }
    float _1360 = _1312;
    if (_1266)
    {
        float _1362 = _1254 * _1352;
        _1356 = _1362;
    }
    float _1364 = _1356;
    if (!_1266)
    {
        _1348 = _1256;
    }
    float _1366 = _1348;
    float _1368 = _1366;
    if (_1266)
    {
        float _1370 = _1256 * _1352;
        _1368 = _1370;
    }
    float _1372 = _1368;
    if (_1266)
    {
        float _1374 = fma(_1324, _1318, _1360);
        _1340 = _1374;
    }
    float _1376 = _1340;
    if (!_1266)
    {
        _1342 = _1258;
    }
    float _1378 = _1342;
    float _1380 = _1378;
    if (_1266)
    {
        float _1382 = _1364 * _1364;
        _1380 = _1382;
    }
    float _1384 = _1380;
    if (!_1266)
    {
        _1336 = _1260;
    }
    float _1386 = _1336;
    float _1388 = _1386;
    if (_1266)
    {
        float _1390 = _1372 * _1372;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1376, _1376, _1384);
    float _1396 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1398 = fma(_1092, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1400 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1402 = _1394 + _1392;
    float _1404 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1396);
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1408 = fma(_1250, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1406);
    float _1410 = precise::clamp(_1408, 0.0, 1.0);
    float _1412 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1414 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1404);
    float _1416 = rsqrt(_1402);
    float _1418 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1420 = -_1410;
    float _1422 = _1420 + 1.0;
    float _1424 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1426 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1412);
    float _1428 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1400);
    float _1430 = _1424 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = abs(_1422);
    float _1434 = log2(_1432);
    float _1436 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1438 = fma(_1088, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1440 = -_1430;
    float _1442 = fma(_1440, _1418, 1.0);
    float _1444 = _1220 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1428);
    float _1450 = _1416 * _1364;
    float _1452 = _1416 * _1376;
    float _1454 = _1416 * _1372;
    float _1456 = fma(_1224, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1444);
    float _1458 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1460 = floor(_1398);
    float _1462 = _1448 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1464 = fma(_1228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1456);
    float _1466 = -_1458;
    float _1468 = fma(_1452, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1466);
    float _1470 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1474 = _1464 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1476 = -_1454;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1468);
    float _1480 = floor(_1438);
    float _1482 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1470);
    float _1484 = fma(_1478, 0.5, 0.5);
    float _1486 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1482);
    float _1488 = log2(_1442);
    float _1490 = -_1460;
    float _1492 = _1398 + _1490;
    float _1494 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1486);
    float _1496 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1498 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1496);
    float _1500 = exp2(_1472);
    float _1502 = fma(_1478, -0.5, 0.5);
    float _1504 = -_1480;
    float _1506 = _1438 + _1504;
    float _1508 = _1452 + 1.0;
    float _1510 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1498);
    float _1512 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1514 = 1.0 / _1494;
    float _1516 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1518 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1510);
    float _1520 = fma(_1484, _1512, -0.212114393711090087890625);
    float _1522 = _1488 * 0.693147182464599609375;
    float _1524 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1516);
    float _1526 = sqrt(_1502);
    float _1528 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1530 = -_1452;
    float _1532 = fma(_1500, _1508, _1530);
    float2 _4559 = float2(_1492, _1506);
    float _1534 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4559, float2(0.0), isnan(_4559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4559, float2(0.0), isnan(_4559)), level(0.0)).x;
    float _1536 = fma(_1484, _1520, 1.570728778839111328125);
    float _1538 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1528);
    float _1540 = _1522 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1542 = fma(_1532, 0.5, 0.5);
    float _1544 = _1518 * _1514;
    float _1546 = _1538 * _1514;
    float _1548 = fma(_1544, 0.5, 0.5);
    float _1550 = fma(_1546, -0.5, 0.5);
    float _1552 = _1526 * 0.636619746685028076171875;
    float3 _4596 = float3(_1548, _1550, _1540);
    float _1554 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4596, float3(0.0), isnan(_4596)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4596, float3(0.0), isnan(_4596)), level(0.0)).x;
    float3 _4607 = float3(_1548, _1550, _1540);
    float4 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).xyzw;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = _1557.w;
    float _1567 = -_1536;
    float _1569 = fma(_1552, _1567, 1.0);
    float2 _4628 = float2(_1569, _1542);
    float3 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4628, float2(0.0), isnan(_4628)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4628, float2(0.0), isnan(_4628)), level(0.0)).xyz;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _1583 = in.m_65.x;
    bool _1585 = _770 != 0.0;
    bool _1587 = isnan(_770);
    bool _1589 = _1585 || _1587;
    bool _1591 = isnan(0.0);
    bool _1593 = _1589 || _1591;
    float _1595 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1597 = _276 > 0.5;
    float _1599 = _1581 * _230;
    float _1601 = in.m_65.y;
    bool _1603 = _768 == 0.0;
    bool _1605 = !_1593;
    bool _1607 = _1603 && _1605;
    float _1609 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1611 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1613 = _1611 != 0;
    float _1615 = trunc(_1599);
    int _1617 = int(_1615);
    bool _1619 = _772 == 0.0;
    bool _1621 = _1619 && _1607;
    float _1623 = fma(_1474, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1609);
    bool _1625 = _230 > 0.5;
    bool _1627 = _1625 && _1613;
    float _1629 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1623);
    int _1631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1633 = _1631 != 0;
    float _1635 = exp2(_1595);
    float _1637 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1639 = 0.0187292993068695068359375;
    float _1641 = (*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1643 = _1494;
    float _1645 = _1538;
    if (_1613)
    {
        _1639 = _1583;
    }
    float _1647 = _1639;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1651 = _1617 << 4;
    int _1653 = _1651 + 1712;
    float _1655 = _1647;
    if (!_1613)
    {
        _1641 = _1583;
    }
    float _1657 = _1641;
    float _1659 = _1657;
    if (_1627)
    {
        float _1661 = -_1647;
        float _1663 = _1661 + 1.0;
        _1655 = _1663;
    }
    float _1665 = _1655;
    uint _1668 = uint(int(uint(_1653) >> uint(2)));
    uint _1670 = uint(int(uint(int(_1668)) >> uint(2)));
    int _1672 = int(_1668) & 3;
    float _1674 = (*spvDescriptorSet0.vp_c9)._m0[int(_1670)][_1672];
    int _1676 = int(_1668) + 1;
    uint _1678 = uint(int(uint(_1676) >> uint(2)));
    int _1680 = _1676 & 3;
    float _1682 = (*spvDescriptorSet0.vp_c9)._m0[int(_1678)][_1680];
    float _1684 = in.m_67.x;
    float _1686 = in.m_67.y;
    float _1688 = in.m_67.z;
    float _1690 = -_1601;
    float _1692 = _1690 + 1.0;
    float _1694 = _1649 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1696 = _1601;
    if (_1613)
    {
        _1659 = _1665;
    }
    float _1698 = _1659;
    float _1700 = -_1635;
    float _1702 = _1700 + 1.0;
    if (_1633)
    {
        float _1704 = _1597 ? _1692 : _1601;
        _1696 = _1704;
    }
    float _1706 = _1696;
    int _1708 = _1653 + 8;
    uint _1710 = uint(int(uint(_1708) >> uint(2)));
    uint _1712 = uint(int(uint(int(_1710)) >> uint(2)));
    int _1714 = int(_1710) & 3;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[int(_1712)][_1714];
    float _1718 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1720 = _1698 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1722 = _1718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1724 = _1637 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    out.m_69.x = _1694;
    out.m_69.y = _1724;
    out.m_69.z = _1722;
    float _1730 = _1686;
    float _1732 = _1684;
    float _1734 = _1688;
    if (!_1621)
    {
        float _1736 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1686);
        _1730 = _1736;
    }
    float _1738 = _1730;
    if (!_1621)
    {
        float _1740 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1684);
        _1732 = _1740;
    }
    float _1742 = _1732;
    if (!_1621)
    {
        float _1744 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1688);
        _1734 = _1744;
    }
    float _1746 = _1734;
    float _1748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1750 = _856 * _1738;
    float _1752 = -_1738;
    float _1754 = _866 * _1752;
    float _1756 = _860 * _1738;
    float _1758 = in.m_57.x;
    float _1760 = fma(_884, _1742, _1750);
    float _1762 = fma(_882, _1742, _1754);
    float _1764 = fma(_888, _1742, _1756);
    bool _1766 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1768 = isnan(_1250);
    bool _1770 = _1766 || _1768;
    bool _1772 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1774 = _1770 || _1772;
    float _1776 = fma(_894, _1746, _1760);
    float _1778 = fma(_872, _1746, _1762);
    float _1780 = fma(_904, _1746, _1764);
    float _1782 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1784 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1786 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1782);
    float _1788 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1784);
    float _1790 = _1674 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1792 = _1682 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1794 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1786);
    float _1796 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1788);
    float _1798 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1800 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1802 = _1716 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1804 = _1790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1806 = _1720 * _1728;
    float _1808 = _1776 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1810 = _1800 * _1748;
    float _1812 = _1802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1814 = fma(_1778, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1808);
    out.m_71.x = _1806;
    out.m_71.y = _1810;
    float _1816 = fma(_1780, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1814);
    float _1818 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_73.x = _1804;
    out.m_73.y = _1798;
    out.m_73.z = _1812;
    out.m_73.w = _1726;
    float _1820 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1818);
    out.m_75.x = _1816;
    out.m_75.y = _1796;
    out.m_75.z = _1794;
    float _1822 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1820);
    float _1824 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1826 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1828 = fma(_1092, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1824);
    float _1830 = 1.0 / _1826;
    float _1832 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1828);
    float _1834 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1836 = _1834 + _1826;
    float _1838 = _1836 * _1830;
    float _1840 = _1838 * 0.5;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1844 = fma(_1840, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1842);
    float _1846 = 1.0 / _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1850 = _1846 * _1848;
    float _1852 = abs(_1850);
    float _1854 = log2(_1852);
    bool _1856 = _1850 <= 8000.0;
    bool _1858 = isnan(_1850);
    bool _1860 = _1856 || _1858;
    bool _1862 = isnan(8000.0);
    bool _1864 = _1860 || _1862;
    float _1866 = float(_1864);
    float _1868 = _1854 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1870 = exp2(_1868);
    float _1872 = fma(_1870, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = fma(_1874, -2.0, 3.0);
    float _1878 = _1874 * _1874;
    out.m_77.x = 1.0;
    out.m_77.y = 1.0;
    out.m_77.z = 1.0;
    float _1880 = _1878 * _1876;
    float _1882 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1629);
    float _1884 = -_1880;
    float _1886 = _1884 + 1.0;
    float _1888 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1890 = _1882 + _1888;
    float _1892 = fma(_1886, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1880);
    float _1894 = _1494 + _1890;
    out.gl_Position.x = _1518;
    out.gl_Position.y = _1538;
    out.gl_Position.z = _1890;
    out.gl_Position.w = _1494;
    float _1896 = 1.0;
    float _1898 = _1890;
    if (!_1774)
    {
        _1896 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1900 = _1896;
    float _1902 = _1866 * _1892;
    float _1904 = _1894 * 0.5;
    float _1906 = _1702 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1908 = _1902 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_79.z = _1904;
    out.m_79.w = _1494;
    float _1910 = -_1906;
    float _1912 = _1910 + 1.0;
    float _1914 = _1912;
    float _1916 = _1900;
    float _1918 = _1900;
    if (!_1774)
    {
        _1643 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1920 = _1643;
    float _1922 = _1920;
    float _1924 = _1920;
    if (!_1774)
    {
        _1898 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1926 = _1898;
    float _1928 = _1926;
    float _1930 = _1926;
    if (!_1774)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1932 = _1645;
    float _1934 = -_1534;
    float _1936 = _1934 + 1.0;
    float _1938 = _1936 * _1908;
    float _1940 = precise::clamp(_1938, 0.0, 1.0);
    float _1942 = -_1940;
    float _1944 = fma(_1942, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1946 = _1944 * _1758;
    float _1948 = _1906 * _1554;
    float _1950 = _1565 * _1912;
    float _1952 = _1946 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1954 = _1932;
    float _1956 = _1932;
    if (!_1774)
    {
        _1914 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1958 = _1914;
    float _1960 = _1565 * _1948;
    out.m_81.x = _1952;
    float _1962 = _1579 * _1948;
    float _1964 = fma(_1575, _1960, _1559);
    float _1966 = fma(_1577, _1960, _1561);
    float _1968 = _1960;
    float _1970 = _1958;
    float _1972 = _1958;
    if (!_1774)
    {
        _1968 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1974 = _1968;
    float _1976 = fma(_1565, _1962, _1563);
    out.m_83.x = _1964;
    out.m_83.y = _1966;
    out.m_83.z = _1976;
    out.m_83.w = _1950;
    bool _1978 = !_1774;
    float _1980 = _1974;
    float _1982 = _1974;
    if (!_1978)
    {
        bool _1984 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1986 = isnan(_1250);
        bool _1988 = _1984 || _1986;
        bool _1990 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1992 = _1988 || _1990;
        if (!_1992)
        {
            float _1994 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1996 = _1250 + _1994;
            float _1998 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2000 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1998;
            float _2002 = 1.0 / _2000;
            float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2006 = _2004 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2010 = _2008 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2012 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2014 = _2012 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2016 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2018 = _2016 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2020 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2022 = _2020 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2024 = _1996 * _2002;
            float _2026 = precise::clamp(_2024, 0.0, 1.0);
            float _2028 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2030 = _2028 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2032 = fma(_2026, _2006, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2034 = fma(_2026, _2030, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2036 = fma(_2026, _2010, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2038 = fma(_2026, _2014, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2040 = fma(_2026, _2018, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2042 = fma(_2026, _2022, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1918 = _2034;
            _1956 = _2040;
            _1982 = _2032;
            _1930 = _2038;
            _1924 = _2036;
            _1972 = _2042;
            _2044 = true;
        }
        else
        {
            bool _2046 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2048 = isnan(_1250);
            bool _2050 = _2046 || _2048;
            bool _2052 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2054 = _2050 || _2052;
            if (!_2054)
            {
                _1980 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2056 = _1980;
            _1982 = _2056;
            if (!_2054)
            {
                _1916 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2058 = _1916;
            _1918 = _2058;
            if (!_2054)
            {
                _1922 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2060 = _1922;
            _1924 = _2060;
            if (!_2054)
            {
                _1928 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2062 = _1928;
            _1930 = _2062;
            if (!_2054)
            {
                _1954 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2064 = _1954;
            _1956 = _2064;
            if (!_2054)
            {
                _1970 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2066 = _1970;
            bool _2068 = !_2054;
            _1972 = _2066;
            if (!_2068)
            {
                bool _2070 = _1250 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2072 = isnan(_1250);
                bool _2074 = _2070 || _2072;
                bool _2076 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2078 = _2074 || _2076;
                if (!_2078)
                {
                    float _2080 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2082 = _1250 + _2080;
                    float _2084 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2086 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2084;
                    float _2088 = 1.0 / _2086;
                    float _2090 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2092 = _2090 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2094 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2096 = _2094 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2098 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2100 = _2098 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2102 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2104 = _2102 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2106 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2108 = _2106 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2110 = _2082 * _2088;
                    float _2112 = precise::clamp(_2110, 0.0, 1.0);
                    float _2114 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2116 = _2114 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2118 = fma(_2112, _2092, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2120 = fma(_2112, _2116, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2122 = fma(_2112, _2096, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2124 = fma(_2112, _2100, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2126 = fma(_2112, _2104, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2128 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1918 = _2120;
                    _1956 = _2126;
                    _1982 = _2118;
                    _1930 = _2124;
                    _1924 = _2122;
                    _1972 = _2128;
                    _2044 = true;
                }
                else
                {
                    _1918 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1956 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1982 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1930 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1924 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1972 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2044 = false;
    float _2130 = _1918;
    float _2132 = _1956;
    float _2134 = _1982;
    float _2136 = _1930;
    float _2138 = _1924;
    float _2140 = _1972;
    float _2142 = fma(_1796, -0.5, 0.5);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = -_2130;
    float _2148 = _2146 + _2132;
    float _2150 = -_2134;
    float _2152 = _2150 + _2136;
    float _2154 = -_2138;
    float _2156 = _2154 + _2140;
    bool _2158 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2160 = fma(_2144, _2148, _2130);
    float _2162 = fma(_2144, _2152, _2134);
    float _2164 = fma(_2144, _2156, _2138);
    float _2166 = _2160 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2168 = fma(_2162, 0.298911988735198974609375, _2166);
    float _2170 = fma(_2164, 0.114477999508380889892578125, _2168);
    out.m_85.x = 0.0;
    float _2172 = -_2170;
    float _2174 = _2162 + _2172;
    float _2176 = -_2170;
    float _2178 = _2160 + _2176;
    float _2180 = -_2170;
    float _2182 = _2164 + _2180;
    float _2184 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2186 = fma(_2174, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    float _2188 = fma(_2178, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    float _2190 = fma(_2182, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2170);
    out.m_81.w = _2184;
    out.m_87.x = _2186;
    out.m_87.y = _2188;
    out.m_87.z = _2190;
    if (!_2158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2192 = -_1220;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2196 = -_1224;
    float _2198 = _2196 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2200 = -_1228;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2204 = _2194 * _2194;
    float _2206 = fma(_2198, _2198, _2204);
    float _2208 = fma(_2202, _2202, _2206);
    float _2210 = sqrt(_2208);
    float _2212 = rsqrt(_2208);
    float _2214 = -_2210;
    float _2216 = _2214 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2218 = _2216 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2220 = precise::clamp(_2218, 0.0, 1.0);
    float _2222 = _2198 * _2212;
    float _2224 = _2194 * _2212;
    float _2226 = abs(_2220);
    float _2228 = log2(_2226);
    float _2230 = _2202 * _2212;
    float _2232 = _2222 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2234 = _1796 * _2224;
    float _2236 = -_2224;
    float _2238 = -_2232;
    float _2240 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2238);
    float _2242 = fma(_1816, _2222, _2234);
    float _2244 = -_2230;
    float _2246 = fma(_2244, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2240);
    float _2248 = fma(_1794, _2230, _2242);
    float _2250 = precise::clamp(_2248, 0.0, 1.0);
    float _2252 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2254 = _2246 + _2252;
    float _2256 = _2228 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2258 = _2254 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2260 = precise::clamp(_2258, 0.0, 1.0);
    float _2262 = exp2(_2256);
    float _2264 = _2262 * _2260;
    float _2266 = _2250 * _2264;
    float _2268 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2270 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2272 = _2266 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _2268;
    out.m_85.y = _2270;
    out.m_85.z = _2272;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

