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
    float4 m_79 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_83 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_101 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_71 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_73 [[attribute(13)]];
    float4 m_87 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2582 = false;
    bool _380 = false;
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
    float _128 = as_type<float>(_120);
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _126;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_136);
        out.gl_Position.z = _2928;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_53.w;
    float _142 = float(_120);
    float _144 = -_140;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_140);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    bool _158 = _146 >= _142;
    bool _160 = !_156;
    bool _162 = _158 || _160;
    float _164 = _146;
    if (_162)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _138 = as_type<int>(_168);
    }
    int _170 = _138;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2992 = as_type<float>(_170);
        out.gl_Position.z = _2992;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = 1.0 / _142;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _146 * _178;
    float _196 = _172 * _172;
    float _198 = _174 * _174;
    float _200 = fma(_182, _182, _196);
    float _202 = fma(_184, _184, _198);
    float _204 = fma(_188, _188, _200);
    float _206 = _176 * _176;
    float _208 = fma(_190, _190, _202);
    float _210 = sqrt(_204);
    float _212 = fma(_186, _186, _206);
    float _214 = fma(_192, _192, _212);
    float _216 = in.m_61.x;
    float _218 = in.m_61.y;
    float _220 = in.m_61.z;
    float _222 = sqrt(_208);
    float _224 = sqrt(_214);
    bool _226 = _210 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = 0.0;
    float _232 = _204;
    if (_226)
    {
        float _234 = rsqrt(_204);
        _230 = _234;
    }
    float _236 = _230;
    float _238 = _184 * _218;
    bool _240 = _224 > 0.0;
    float _242 = _174 * _218;
    float _244 = _190 * _218;
    float _246 = fma(_182, _216, _238);
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_226)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    float _256 = fma(_172, _216, _242);
    float _258 = _224;
    float _260 = _252;
    float _262 = _254;
    if (_228)
    {
        float _264 = rsqrt(_208);
        _258 = _264;
    }
    float _266 = _258;
    float _268 = fma(_188, _216, _244);
    float _270 = 0.0;
    float _272 = 0.0;
    if (!_228)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _274 = _270;
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _274;
    float _282 = _276;
    if (!_226)
    {
        _278 = 0.0;
    }
    float _284 = _278;
    float _286 = fma(_186, _220, _246);
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _286;
    if (!_228)
    {
        _288 = 0.0;
    }
    float _294 = _288;
    float _296 = fma(_176, _220, _256);
    float _298 = 0.0;
    float _300 = 0.0;
    float _302 = _294;
    if (!_240)
    {
        _298 = 0.0;
        _300 = 0.0;
    }
    float _304 = _298;
    float _306 = _300;
    float _308 = 0.0;
    float _310 = _306;
    float _312 = _304;
    if (_240)
    {
        float _314 = rsqrt(_214);
        _308 = _314;
    }
    float _316 = _308;
    if (!_240)
    {
        _232 = 0.0;
    }
    float _318 = _232;
    float _320 = fma(_192, _220, _268);
    float _322 = _318;
    if (_226)
    {
        float _324 = _236 * _172;
        _290 = _324;
    }
    float _326 = _290;
    if (_226)
    {
        float _328 = _236 * _182;
        _260 = _328;
    }
    float _330 = _260;
    if (_226)
    {
        float _332 = _236 * _188;
        _262 = _332;
    }
    float _334 = _262;
    if (_228)
    {
        float _336 = _266 * _174;
        _302 = _336;
    }
    float _338 = _302;
    if (_228)
    {
        float _340 = _266 * _184;
        _280 = _340;
    }
    float _342 = _280;
    if (_228)
    {
        float _344 = _266 * _190;
        _282 = _344;
    }
    float _346 = _282;
    if (_240)
    {
        float _348 = _316 * _176;
        _310 = _348;
    }
    float _350 = _310;
    if (_240)
    {
        float _352 = _316 * _186;
        _312 = _352;
    }
    float _354 = _312;
    if (_240)
    {
        float _356 = _316 * _192;
        _322 = _356;
    }
    float _358 = _322;
    bool _360 = !_180;
    float _378;
    if (!_360)
    {
        float _362 = in.m_63.x;
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _362 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        _378 = _194;
    }
    _380 = false;
    float _382 = _378;
    float _384 = in.m_63.z;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _382 + _390;
    float _394 = in.m_48.x;
    float _396 = in.m_48.y;
    float _398 = in.m_48.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = in.m_63.y;
    float _410 = -_194;
    float _412 = _410 + 1.0;
    float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _416;
    bool _420 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _428 = _424 || _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _382 + _430;
    float _434 = in.m_59.w;
    float _436 = 1.0 / _406;
    float _438 = _388 * _146;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = _384 * 2.0;
    float _450 = 1.0 / _402;
    float _452 = _194 * _414;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = _184 * _396;
    float _458 = _190 * _396;
    float _460 = _412 * _414;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = fma(_182, _394, _456);
    float _466 = fma(_188, _394, _458);
    float _468 = floor(_448);
    float _470 = _392 * _436;
    float _472 = in.m_63.x;
    float _474 = fma(_186, _398, _464);
    float _476 = _408 * 2.0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _480 = 1.0 + _478;
    float _482 = exp2(_438);
    bool _484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _492 = _488 || _490;
    float _494 = fma(_192, _398, _466);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _500 = _382 + _498;
    float _502 = precise::min(_454, _462);
    float _504 = _432 * _450;
    float _506 = fma(_496, _408, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _508 = floor(_476);
    bool _510 = _468 > 0.0;
    float _512 = fma(_442, _504, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _514 = _468 >= 0.0;
    bool _516 = isnan(_468);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = _506 * _146;
    float _526 = fma(_446, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _528 = _522 ? 0 : 1;
    float _530 = 1.0 / _418;
    float _532 = -_482;
    float _534 = _532 + 1.0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _546 = _544 != 0;
    float _548 = _472 + _384;
    int _550 = ~_528;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = fma(_472, 6.283185482025146484375, _524);
    float _558 = _428 ? _534 : 0.0;
    float _560 = _548 + (-1.0);
    float _562 = 1.0 / _480;
    int _564 = _554;
    if (!_510)
    {
        int _566 = ~_528;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _472 * 2.0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _580 = _578 != 0;
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _584 = !_542;
    int _586 = _584 ? 0 : 1;
    float _588 = _556 * 0.15915493667125701904296875;
    bool _590 = _508 >= 0.0;
    bool _592 = isnan(_508);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _500 * _530;
    bool _602 = !_538;
    int _604 = _602 ? 0 : 1;
    float _606 = floor(_572);
    int _608 = _598 ? 0 : 1;
    float _610 = -_502;
    float _612 = _610 + 1.0;
    int _614 = ~_608;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (_492)
    {
        float _622 = _558 * _562;
        _164 = _622;
    }
    float _624 = _164;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _636 = _634 != 0;
    float _638 = _472 + _408;
    bool _640 = _508 > 0.0;
    float _642 = _408 + _384;
    float _644 = _638 + (-1.0);
    bool _646 = !_546;
    int _648 = _646 ? 0 : 1;
    float _650 = _642 + (-1.0);
    bool _652 = !_636;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _658 = !_576;
    int _660 = _658 ? 0 : 1;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _666 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    if (!_640)
    {
        int _668 = ~_608;
        int _670 = _668 + 1;
        _620 = _670;
    }
    int _672 = _620;
    float _674 = _384 + (-0.5);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _686 = _684 != 0;
    float _688 = in.m_57.w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _690;
    bool _694 = _606 >= 0.0;
    bool _696 = isnan(_606);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _706 = !_678;
    int _708 = _706 ? 0 : 1;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _710;
    int _714 = _702 ? 0 : 1;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _720 = _606 > 0.0;
    float _722 = fma(_712, _504, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _724 = fma(_692, _504, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _730;
    float _734 = fma(_718, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _740;
    float _744 = fma(_728, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _746 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _748 = isnan(_382);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_738, _600, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _760 = fma(_742, _600, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _762 = fma(_732, _600, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _764 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _766 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _768 = isnan(_382);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _780 = _474 + _688;
    float _782 = _764 * _664;
    bool _784 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _786 = isnan(_382);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_776;
    float _798 = _796 + 1.0;
    float _800 = -_756;
    float _802 = _800 + 1.0;
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].x, _782);
    float _806 = _666 * _704;
    float _808 = _756 * _798;
    bool _810 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _812 = isnan(_382);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = floor(_804);
    float _824 = _794 * _802;
    float _826 = -_794;
    float _828 = _826 + 1.0;
    float _830 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _832 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].y, _806);
    float _834 = _494 + _434;
    float _836 = _820 * _828;
    float _838 = _830 * _778;
    float _840 = -_820;
    float _842 = _840 + 1.0;
    float _844 = floor(_832);
    float _846 = _722 * _836;
    float _848 = _512 * _836;
    float _850 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].z, _838);
    int _852 = ~_714;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].x, _846);
    int _860 = _856;
    if (!_720)
    {
        int _862 = ~_714;
        int _864 = _862 + 1;
        _860 = _864;
    }
    int _866 = _860;
    float _868 = _724 * _836;
    float _870 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].y, _848);
    float _872 = -_822;
    float _874 = _804 + _872;
    float _876 = _804 + 0.25;
    float _878 = fma(_734, _824, _858);
    float _880 = _832 + 0.25;
    float _882 = fma(_526, _824, _870);
    float _884 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].z, _868);
    float _886 = floor(_876);
    float _888 = fma(_758, _808, _878);
    bool _890 = _874 >= 0.5;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.5);
    bool _898 = _894 || _896;
    float _900 = fma(_744, _824, _884);
    bool _902 = !_682;
    int _904 = _902 ? 0 : 1;
    float _906 = _804 * 6.283185482025146484375;
    int _908 = abs(_708);
    float _910 = fma(_760, _808, _882);
    float _912 = floor(_880);
    int _914 = abs(_904);
    float _916 = fma(_762, _808, _900);
    float _918 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].x, _888);
    float _920 = float(_866);
    float _922 = -_844;
    float _924 = _832 + _922;
    float _926 = floor(_850);
    float _928 = float(_570);
    float _930 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].z, _916);
    float _932 = float(_908);
    bool _934 = !_898;
    float _936 = _934 ? 0.5 : (-0.5);
    bool _938 = _924 >= 0.5;
    bool _940 = isnan(_924);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.5);
    bool _946 = _942 || _944;
    float _948 = _932 * _928;
    float _950 = -_886;
    float _952 = _876 + _950;
    float _954 = -_912;
    float _956 = _880 + _954;
    bool _958 = !_946;
    float _960 = _958 ? 0.5 : (-0.5);
    float _962 = _948 * (-2.0);
    int _964 = abs(_586);
    float _966 = _588 * 6.283185482025146484375;
    float _968 = sin(_966);
    int _970 = abs(_660);
    float _972 = -_926;
    float _974 = _850 + _972;
    float _976 = _936 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _978 = _976 * 2.0;
    float _980 = _960 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _982 = _980 * 2.0;
    float _984 = _906 * 0.15915493667125701904296875;
    bool _986 = !_632;
    int _988 = _986 ? 0 : 1;
    bool _990 = _974 >= 0.5;
    bool _992 = isnan(_974);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    float _1000 = float(_970);
    float _1002 = _984 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    int _1006 = abs(_988);
    float _1008 = _832 * 6.283185482025146484375;
    float _1010 = float(_964);
    float _1012 = _1000 * _982;
    int _1014 = abs(_604);
    float _1016 = _1008 * 0.15915493667125701904296875;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1020 = _1018 != 0;
    float _1022 = _1010 * _978;
    bool _1024 = _952 > 0.5;
    float _1026 = in.m_65.x;
    float _1028 = in.m_65.y;
    float _1030 = in.m_65.z;
    bool _1032 = !_998;
    float _1034 = _1032 ? 0.5 : (-0.5);
    float _1036 = _1016 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    bool _1040 = !_1020;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = abs(_968);
    float _1046 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1048 = float(_1006);
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1052 = _1050 * 2.0;
    float _1054 = float(_1014);
    float _1056 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1058 = _850 + 0.25;
    int _1060 = abs(_1042);
    float _1062 = fma(_1054, _1056, _1022);
    float _1064 = _952;
    float _1066 = _956;
    if (_1024)
    {
        float _1068 = -_952;
        float _1070 = _1068 + 1.0;
        _1064 = _1070;
    }
    float _1072 = _1064;
    float _1074 = floor(_1058);
    float _1076 = _850 * 6.283185482025146484375;
    bool _1078 = _956 > 0.5;
    float _1080 = fma(_1072, 4.0, -1.0);
    int _1082 = abs(_648);
    float _1084 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1086 = float(_1060);
    float _1088 = _1076 * 0.15915493667125701904296875;
    bool _1090 = !_580;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1048 * _1052;
    float _1096 = float(_1082);
    float _1098 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1100 = fma(_1086, _1084, _1012);
    int _1102 = abs(_1092);
    float _1104 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1046);
    float _1106 = _1088 * 6.283185482025146484375;
    float _1108 = sin(_1106);
    float _1110 = fma(_1096, _1098, _1062);
    if (_1078)
    {
        float _1112 = -_956;
        float _1114 = _1112 + 1.0;
        _1066 = _1114;
    }
    float _1116 = _1066;
    float _1118 = -_1074;
    float _1120 = _1058 + _1118;
    bool _1122 = !_628;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1110, 3.1415927410125732421875, _1026);
    float _1128 = fma(_1116, 4.0, -1.0);
    int _1130 = abs(_1124);
    float _1132 = fma(_656, _962, _656);
    float _1134 = float(_1102);
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1138 = _1120 > 0.5;
    float _1140 = fma(_1126, _962, _1126);
    float _1142 = float(_1130);
    float _1144 = fma(_1134, _1136, _1100);
    float _1146 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1148 = float(_914);
    float _1150 = _472 + (-0.5);
    float _1152 = fma(_1144, 3.1415927410125732421875, _1028);
    float _1154 = fma(_1142, _1146, _1094);
    int _1156 = abs(_654);
    float _1158 = _834 * _834;
    bool _1160 = !_686;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = _1148 * _920;
    float _1166 = _1120;
    if (_1138)
    {
        float _1168 = -_1120;
        float _1170 = _1168 + 1.0;
        _1166 = _1170;
    }
    float _1172 = _1166;
    float _1174 = fma(_780, _780, _1158);
    int _1176 = abs(_1162);
    float _1178 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1140);
    float _1180 = fma(_1172, 4.0, -1.0);
    float _1182 = float(_672);
    float _1184 = in.m_67.y;
    float _1186 = _1164 * (-2.0);
    float _1188 = float(_1156);
    float _1190 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1192 = fma(_1132, _624, _1178);
    float _1194 = _408 + (-0.5);
    float _1196 = fma(_1152, _1186, _1152);
    float _1198 = float(_1176);
    float _1200 = fma(_1188, _1190, _1154);
    float _1202 = fma(_662, _1186, _662);
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1196);
    float _1206 = in.m_67.x;
    float _1208 = fma(_1200, 3.1415927410125732421875, _1030);
    float _1210 = _1198 * _1182;
    float _1212 = fma(_1202, _624, _1204);
    float _1214 = in.m_69.x;
    float _1216 = in.m_69.y;
    float _1218 = in.m_69.z;
    float _1220 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].y, _910);
    float _1222 = _1210 * (-2.0);
    float _1224 = _1192 * 0.15915493667125701904296875;
    float _1226 = in.m_67.z;
    float _1228 = _1212 * 0.15915493667125701904296875;
    float _1230 = fma(_582, _1222, _582);
    float _1232 = fma(_1208, _1222, _1208);
    float _1234 = sqrt(_1174);
    float _1236 = -_1104;
    float _1238 = _1236 + _1184;
    float _1240 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1232);
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1238);
    float _1244 = fma(_1230, _624, _1240);
    float _1246 = _1224 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1244 * 0.15915493667125701904296875;
    float _1252 = _1220 * _1216;
    float _1254 = _1224 * 6.283185482025146484375;
    float _1256 = cos(_1254);
    float _1258 = _918 * _1214;
    float _1260 = _930 * _1218;
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1206);
    float _1264 = _572 + (-1.0);
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1268 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1226);
    float _1272 = _1228 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    float _1276 = _1266 * _1262;
    float _1278 = _1264 * _1234;
    float _1280 = _1268 * _1242;
    float _1282 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1284 = _1278 * 0.75;
    float _1286 = _1228 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = _1282 * _1270;
    float _1292 = _1250 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = _1248 * _1274;
    float _1298 = _1256 * _1274;
    float _1300 = _1250 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = _1256 * _1288;
    float _1306 = _1248 * _1288;
    float _1308 = _1256 * _1294;
    float _1310 = _1248 * _1294;
    float _1312 = _1288 * _1294;
    float _1314 = _1284 * 0.15915493667125701904296875;
    float _1316 = _1308 * _1280;
    float _1318 = _1310 * _1280;
    float _1320 = _1274 * _1294;
    float _1322 = _1314 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = fma(_1302, _1304, _1296);
    float _1328 = -_1298;
    float _1330 = fma(_1302, _1306, _1328);
    float _1332 = -_1306;
    float _1334 = fma(_1302, _1298, _1332);
    float _1336 = -_1280;
    float _1338 = _1302 * _1336;
    float _1340 = fma(_1326, _1276, _1316);
    float _1342 = fma(_1330, _1276, _1318);
    float _1344 = fma(_1302, _1296, _1304);
    float _1346 = fma(_1312, _1276, _1338);
    float _1348 = fma(_1334, _1290, _1340);
    float _1350 = _1314 * 6.283185482025146484375;
    float _1352 = cos(_1350);
    float _1354 = fma(_1344, _1290, _1342);
    float _1356 = fma(_1320, _1290, _1346);
    float _1358 = _1348 * _342;
    float _1360 = _1348 * _346;
    float _1362 = _1348 * _338;
    float _1364 = fma(_1356, _330, _1358);
    float _1366 = fma(_1356, _334, _1360);
    float _1368 = fma(_1356, _326, _1362);
    float _1370 = fma(_1354, _354, _1364);
    float _1372 = fma(_1354, _358, _1366);
    float _1374 = fma(_1354, _350, _1368);
    float _1376 = _1370 * _1324;
    float _1378 = _1370 * _1352;
    float _1380 = -_1376;
    float _1382 = fma(_1372, _1352, _1380);
    float _1384 = fma(_1372, _1324, _1378);
    float _1386 = _834 + _1382;
    float _1388 = _780 + _1384;
    float _1390 = in.m_71.y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1386 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1398 = _1388 + _1396;
    float _1400 = _1394 * _1394;
    float _1402 = fma(_1398, _1398, _1400);
    float _1404 = sqrt(_1402);
    float _1406 = _396 + _1390;
    float _1408 = _1406 + _1374;
    bool _1410 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1404 + _1412;
    float _1416 = _1324;
    float _1418 = _1368;
    float _1420 = _1356;
    float _1422 = _1404;
    float _1424 = _1314;
    float _1426 = _1408;
    float _1428 = _1406;
    float _1430 = _1184;
    if (_1410)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1410)
    {
        float _1436 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1418 = _1436;
    }
    float _1438 = _1418;
    float _1440 = _1438;
    if (!_1410)
    {
        _1420 = _1388;
    }
    float _1442 = _1420;
    float _1444 = _1434;
    float _1446 = _1442;
    if (_1410)
    {
        float _1448 = _1414 * _1434;
        _1422 = _1448;
    }
    float _1450 = _1422;
    if (_1410)
    {
        float _1452 = rsqrt(_1402);
        _1444 = _1452;
    }
    float _1454 = _1444;
    float _1456 = _1454;
    if (_1410)
    {
        float _1458 = _1450 * 0.15915493667125701904296875;
        _1424 = _1458;
    }
    float _1460 = _1424;
    float _1462 = _1450;
    if (_1410)
    {
        float _1464 = _1460 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        _1462 = _1466;
    }
    float _1468 = _1462;
    float _1470 = _1468;
    if (_1410)
    {
        float _1472 = fma(_1468, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1472;
    }
    float _1474 = _1440;
    float _1476 = _1474;
    if (!_1410)
    {
        _1470 = _1386;
    }
    float _1478 = _1470;
    float _1480 = _1478;
    if (_1410)
    {
        float _1482 = _1454 * _1474;
        _1476 = _1482;
    }
    float _1484 = _1476;
    if (_1410)
    {
        float _1486 = fma(_1394, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1480 = _1486;
    }
    float _1488 = _1480;
    float _1490 = _1488;
    if (_1410)
    {
        float _1492 = fma(_1398, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1446 = _1492;
    }
    float _1494 = _1446;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1498 = _1488 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1502 = _1494 + _1500;
    float _1504 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1506 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4904 = float2(_1506, _1504);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4904, float2(0.0), isnan(_4904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4904, float2(0.0), isnan(_4904)), level(0.0)).x;
    float _1510 = _1502;
    float _1512 = _1494;
    if (_1410)
    {
        float _1514 = _1460 * 6.283185482025146484375;
        float _1516 = cos(_1514);
        _1510 = _1516;
    }
    float _1518 = _1510;
    float _1520 = -_780;
    float _1522 = _1520 + _1494;
    float _1524 = -_834;
    float _1526 = _1524 + _1488;
    bool _1528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1530 = isnan(0.5);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1536 = _1532 || _1534;
    if (_1410)
    {
        float _1538 = _1518 + (-1.0);
        _1456 = _1538;
    }
    float _1540 = _1456;
    float _1542 = _1540;
    if (_1410)
    {
        float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1542 = _1544;
    }
    float _1546 = _1542;
    if (_1410)
    {
        float _1548 = fma(_1408, _1518, _1546);
        _1426 = _1548;
    }
    float _1550 = _1426;
    float _1552 = -_1406;
    float _1554 = _1552 + _1550;
    float _1556 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1558 = _1554 * _1554;
    float _1560 = floor(_1556);
    float _1562 = fma(_1522, _1522, _1558);
    float _1564 = fma(_1526, _1526, _1562);
    float _1566 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1568 = sqrt(_1564);
    float _1570 = -_1560;
    float _1572 = _1556 + _1570;
    float _1574 = floor(_1566);
    bool _1576 = _1568 > 0.0;
    float _1578 = -_1574;
    float _1580 = _1566 + _1578;
    float _1582 = fma(_1508, 100.0, _1550);
    float _1584 = fma(_1508, 100.0, _1406);
    float _1586 = _1556;
    float _1588 = _1568;
    float _1590 = _1508;
    float _1592 = _1564;
    if (!_1576)
    {
        _1428 = _1582;
    }
    float _1594 = _1428;
    bool _1596 = !_1576;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = _296 * _296;
        float _1602 = rsqrt(_1564);
        float _1604 = fma(_286, _286, _1600);
        float _1606 = fma(_320, _320, _1604);
        float _1608 = sqrt(_1606);
        float _1610 = _1522 * _1602;
        float _1612 = _1554 * _1602;
        float _1614 = _1526 * _1602;
        bool _1616 = _1608 > 0.0;
        float _1618 = _1602;
        _1586 = _1612;
        if (!_1616)
        {
            _1618 = _1582;
        }
        float _1620 = _1618;
        bool _1622 = !_1616;
        _1598 = _1620;
        if (!_1622)
        {
            float _1624 = rsqrt(_1606);
            float _1626 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1628 = _296 * _1624;
            float _1630 = _286 * _1624;
            float _1632 = _1612 * _1628;
            float _1634 = _320 * _1624;
            float _1636 = fma(_1610, _1630, _1632);
            float _1638 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1640 = fma(_1614, _1634, _1636);
            float _1642 = _1640 * _1638;
            float _1644 = fma(_286, _1642, _1494);
            float _1646 = fma(_296, _1642, _1582);
            float _1648 = fma(_320, _1642, _1488);
            _1586 = _1636;
            _1512 = _1644;
            _1598 = _1646;
            _1490 = _1648;
            _1588 = _1638;
            _1590 = _1626;
        }
    }
    float _1650 = _1586;
    float _1652 = _1512;
    float _1654 = _1598;
    float _1656 = _1490;
    float _1658 = _1588;
    float _1660 = _1590;
    float _1662 = _1654;
    float _1664 = _1652;
    float _1666 = _1656;
    float _1668 = _1658;
    float _1670 = _1650;
    float _1672 = _1660;
    if (!_1536)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1676 = _1584 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1680 = _780 + _1678;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1684 = -_780;
        float _1686 = _1684 + _1652;
        float _1688 = _1676 * _1676;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1692 = _834 + _1690;
        float _1694 = -_1584;
        float _1696 = _1694 + _1654;
        float _1698 = -_834;
        float _1700 = _1698 + _1656;
        float _1702 = fma(_1680, _1680, _1688);
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1706 = fma(_1692, _1692, _1702);
        float _1708 = sqrt(_1706);
        float _1710 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1712 = precise::min(_1708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1714 = _1712 * _1704;
        float _1716 = _1710 * _1714;
        float _1718 = fma(_1686, _1716, _780);
        float _1720 = fma(_1696, _1716, _1584);
        float _1722 = fma(_1700, _1716, _834);
        _1662 = _1720;
        _1664 = _1718;
        _1666 = _1722;
        _292 = _1712;
        _1668 = _1704;
        _1670 = _1714;
    }
    float _1724 = _1662;
    float _1726 = _1664;
    float _1728 = _1666;
    float _1730 = _292;
    float _1732 = _1668;
    float _1734 = _1670;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = _1724 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1726 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1728 + _1744;
    float _1748 = _1738 * _1738;
    float _1750 = fma(_1742, _1742, _1748);
    float _1752 = fma(_1746, _1746, _1750);
    float _1754 = rsqrt(_1752);
    float _1756 = sqrt(_1752);
    float _1758 = _1742 * _1754;
    float _1760 = _1746 * _1754;
    float _1762 = _1738 * _1754;
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1766 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 * _1766;
    float _1772 = _1768 + _1770;
    float _1774 = sqrt(_1772);
    bool _1776 = _1774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1780 = _1774 + _1778;
    float _1782 = _1730;
    float _1784 = _1780;
    float _1786 = _1732;
    if (_1776)
    {
        float _1788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (_1776)
    {
        float _1792 = rsqrt(_1772);
        _1672 = _1792;
    }
    float _1794 = _1672;
    float _1796 = _1794;
    if (_1776)
    {
        float _1798 = _1780 * _1790;
        _1784 = _1798;
    }
    float _1800 = _1784;
    if (_1776)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1786 = _1802;
    }
    float _1804 = _1786;
    float _1806 = _1790;
    if (_1776)
    {
        float _1808 = _1804 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1816 = precise::max(0.0, _1814);
    float _1818 = _1734;
    float _1820 = _1814;
    float _1822 = _1816;
    if (_1776)
    {
        float _1824 = _1804 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1818 = _1826;
    }
    float _1828 = _1818;
    float _1830 = -_1762;
    float _1832 = -_1816;
    float _1834 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1832);
    if (_1776)
    {
        float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1836;
    }
    float _1838 = _1820;
    float _1840 = _1838;
    float _1842 = _1812;
    if (_1776)
    {
        float _1844 = fma(_1812, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1844;
    }
    float _1846 = _1840;
    float _1848 = _1846;
    if (!_1776)
    {
        _1842 = _1764;
    }
    float _1850 = _1842;
    float _1852 = _1850;
    float _1854 = _1828;
    if (_1776)
    {
        float _1856 = _1828 + (-1.0);
        _1822 = _1856;
    }
    float _1858 = _1822;
    float _1860 = _1858;
    if (_1776)
    {
        float _1862 = _1794 * _1846;
        _1592 = _1862;
    }
    float _1864 = _1592;
    if (!_1776)
    {
        _1848 = _1834;
    }
    float _1866 = _1848;
    float _1868 = _1866;
    if (_1776)
    {
        float _1870 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1870;
    }
    float _1872 = _1796;
    float _1874 = _1872;
    if (_1776)
    {
        float _1876 = _1764 * _1864;
        _1852 = _1876;
    }
    float _1878 = _1852;
    if (!_1776)
    {
        _1860 = _1766;
    }
    float _1880 = _1860;
    float _1882 = _1880;
    if (_1776)
    {
        float _1884 = _1766 * _1864;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (_1776)
    {
        float _1888 = fma(_1834, _1828, _1872);
        _1868 = _1888;
    }
    float _1890 = _1868;
    if (!_1776)
    {
        _1874 = _1768;
    }
    float _1892 = _1874;
    float _1894 = _1892;
    if (_1776)
    {
        float _1896 = _1878 * _1878;
        _1894 = _1896;
    }
    float _1898 = _1894;
    float _1900 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1776)
    {
        _1854 = _1770;
    }
    float _1902 = _1854;
    float _1904 = _1902;
    if (_1776)
    {
        float _1906 = _1886 * _1886;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1890, _1890, _1898);
    float _1912 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1900);
    float _1914 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1916 = _1910 + _1908;
    float _1918 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1912);
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1914);
    float _1928 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1930 = rsqrt(_1916);
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1934 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1938 = -_1924;
    float _1940 = _1938 + 1.0;
    float _1942 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1926);
    float _1944 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1946 = -_1936;
    float _1948 = fma(_1946, _1932, 1.0);
    float _1950 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = abs(_1940);
    float _1954 = log2(_1952);
    float _1956 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1944);
    float _1958 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1960 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1962 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1964 = _1930 * _1878;
    float _1966 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1960);
    float _1968 = _1930 * _1890;
    float _1970 = _1930 * _1886;
    float _1972 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1978 = log2(_1948);
    float _1980 = -_1972;
    float _1982 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1980);
    float _1984 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1986 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1976);
    float _1988 = _1968 + 1.0;
    float _1990 = -_1970;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1982);
    float _1994 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1986);
    float _1996 = exp2(_1984);
    float _1998 = fma(_1992, -0.5, 0.5);
    float _2000 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2004 = fma(_1992, 0.5, 0.5);
    float _2006 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2008 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2000);
    float _2010 = 1.0 / _2002;
    float _2012 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2006);
    float _2014 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2008);
    float _2016 = fma(_2004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5721 = float2(_1580, _1572);
    float _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5721, float2(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5721, float2(0.0), isnan(_5721)), level(0.0)).x;
    float _2020 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2012);
    float _2022 = _1978 * 0.693147182464599609375;
    float _2024 = fma(_2004, _2016, -0.212114393711090087890625);
    float _2026 = sqrt(_1998);
    float _2028 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2020);
    float _2030 = fma(_2004, _2024, 1.570728778839111328125);
    float _2032 = -_1968;
    float _2034 = fma(_1996, _1988, _2032);
    float _2036 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2014);
    float _2038 = _2028 * _2010;
    float _2040 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2042 = _2036 * _2010;
    float _2044 = fma(_2034, 0.5, 0.5);
    float _2046 = _2026 * 0.636619746685028076171875;
    float _2048 = fma(_2042, 0.5, 0.5);
    float _2050 = fma(_2038, -0.5, 0.5);
    float _2052 = -_2030;
    float _2054 = fma(_2046, _2052, 1.0);
    float3 _5788 = float3(_2048, _2050, _2040);
    float _2056 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5788, float3(0.0), isnan(_5788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5788, float3(0.0), isnan(_5788)), level(0.0)).x;
    float3 _5799 = float3(_2048, _2050, _2040);
    float4 _2059 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5799, float3(0.0), isnan(_5799)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5799, float3(0.0), isnan(_5799)), level(0.0)).xyzw;
    float _2061 = _2059.x;
    float _2063 = _2059.y;
    float _2065 = _2059.z;
    float _2067 = _2059.w;
    float2 _5815 = float2(_2054, _2044);
    float3 _2071 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5815, float2(0.0), isnan(_5815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5815, float2(0.0), isnan(_5815)), level(0.0)).xyz;
    float _2073 = _2071.x;
    float _2075 = _2071.y;
    float _2077 = _2071.z;
    float _2079 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2081 = in.m_73.x;
    float _2083 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2085 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = -_1104;
    float _2089 = -_1184;
    bool _2091 = _2087 != _2089;
    bool _2093 = isnan(_2087);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan(_2089);
    bool _2099 = _2095 || _2097;
    float _2101 = _2079 * _472;
    bool _2103 = _408 > 0.5;
    float _2105 = _2083 * _472;
    bool _2107 = _1206 == 0.0;
    bool _2109 = !_2099;
    bool _2111 = _2107 && _2109;
    float _2113 = in.m_73.y;
    float _2115 = trunc(_2101);
    int _2117 = int(_2115);
    bool _2119 = _1226 == 0.0;
    bool _2121 = _2119 && _2111;
    float _2123 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2127 = _2125 != 0;
    out.m_75.x = _1726;
    out.m_75.y = _1724;
    out.m_75.z = _1728;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2131 = _2129 != 0;
    float _2133 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2123);
    bool _2135 = _472 > 0.5;
    bool _2137 = _2135 && _2127;
    float _2139 = trunc(_2105);
    int _2141 = int(_2139);
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2145 = _2117 << 4;
    int _2147 = _2145 + 1712;
    float _2149 = exp2(_2085);
    float _2151 = in.m_77.x;
    float _2153 = in.m_77.y;
    float _2155 = in.m_77.z;
    float _2157 = _2081;
    float _2159 = _2028;
    float _2161 = _2036;
    if (!_2127)
    {
        _1430 = _2081;
    }
    float _2163 = _1430;
    int _2165 = _2147 + 8;
    uint _2168 = uint(int(uint(_2165) >> uint(2)));
    uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
    int _2172 = int(_2168) & 3;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[int(_2170)][_2172];
    float _2176 = _2163;
    if (_2137)
    {
        float _2178 = -_2081;
        float _2180 = _2178 + 1.0;
        _2157 = _2180;
    }
    float _2182 = _2157;
    float _2184 = -_2113;
    float _2186 = _2184 + 1.0;
    int _2188 = _2141 << 4;
    int _2190 = _2188 + 1968;
    float _2192 = _2113;
    if (_2127)
    {
        _2176 = _2182;
    }
    float _2194 = _2176;
    uint _2196 = uint(int(uint(_2147) >> uint(2)));
    uint _2198 = uint(int(uint(int(_2196)) >> uint(2)));
    int _2200 = int(_2196) & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = int(_2196) + 1;
    uint _2206 = uint(int(uint(_2204) >> uint(2)));
    int _2208 = _2204 & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    if (_2131)
    {
        float _2212 = _2103 ? _2186 : _2113;
        _2192 = _2212;
    }
    float _2214 = _2192;
    float _2216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2218 = -_2149;
    float _2220 = _2218 + 1.0;
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _2224 = uint(int(uint(_2190) >> uint(2)));
    uint _2226 = uint(int(uint(int(_2224)) >> uint(2)));
    int _2228 = int(_2224) & 3;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[int(_2226)][_2228];
    int _2232 = int(_2224) + 1;
    uint _2234 = uint(int(uint(_2232) >> uint(2)));
    int _2236 = _2232 & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    float _2240 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2242 = _2153;
    float _2244 = _2151;
    float _2246 = _2155;
    if (!_2121)
    {
        float _2248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2153);
        _2242 = _2248;
    }
    float _2250 = _2242;
    if (!_2121)
    {
        float _2252 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2151);
        _2244 = _2252;
    }
    float _2254 = _2244;
    if (!_2121)
    {
        float _2256 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2155);
        _2246 = _2256;
    }
    float _2258 = _2246;
    int _2260 = _2190 + 8;
    uint _2262 = uint(int(uint(_2260) >> uint(2)));
    uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
    int _2266 = int(_2262) & 3;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[int(_2264)][_2266];
    float _2270 = _1308 * _2250;
    float _2272 = -_2250;
    float _2274 = _1302 * _2272;
    float _2276 = _1310 * _2250;
    float _2278 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2280 = fma(_1326, _2254, _2270);
    float _2282 = fma(_1312, _2254, _2274);
    float _2284 = fma(_1330, _2254, _2276);
    float _2286 = _2222 * _2216;
    float _2288 = fma(_1334, _2258, _2280);
    float _2290 = fma(_1320, _2258, _2282);
    float _2292 = fma(_1344, _2258, _2284);
    bool _2294 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2296 = isnan(_1756);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2302 = _2298 || _2300;
    float _2304 = _2288 * _342;
    float _2306 = _2288 * _338;
    float _2308 = _2288 * _346;
    float _2310 = fma(_2290, _330, _2304);
    float _2312 = fma(_2290, _334, _2308);
    float _2314 = fma(_2292, _354, _2310);
    float _2316 = _2174 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2320 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2322 = _2202 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2324 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2326 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2330 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2332 = _2238 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_79.x = _2326;
    out.m_79.y = _2328;
    out.m_79.z = _2320;
    out.m_79.w = _2143;
    float _2334 = _2278 * _2318;
    float _2336 = fma(_2290, _326, _2306);
    float _2338 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2342 = fma(_2292, _350, _2336);
    float _2344 = fma(_2292, _358, _2312);
    float _2346 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_81.x = _2334;
    out.m_81.y = _2286;
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_83.x = _2314;
    out.m_83.y = _2342;
    out.m_83.z = _2344;
    float _2350 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2352 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_85.x = _2338;
    out.m_85.y = _2340;
    out.m_85.z = _2348;
    float _2354 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2350);
    float _2356 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2352);
    float _2358 = in.m_87.w;
    float _2360 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2354);
    float _2362 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2364 = in.m_87.z;
    float _2366 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2368 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2370 = 1.0 / _2366;
    float _2372 = _2368 + _2366;
    float _2374 = _2348;
    if (!_2302)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2376 = _2374;
    out.m_89.w = _2358;
    float _2378 = _2372 * _2370;
    float _2380 = _2378 * 0.5;
    out.m_89.z = _2364;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = in.m_87.x;
    float _2388 = 1.0 / _2384;
    float _2390 = _2364;
    float _2392 = _2376;
    float _2394 = _2376;
    if (!_2302)
    {
        _2390 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _2390;
    float _2398 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2400 = _2388 * _2398;
    float _2402 = abs(_2400);
    float _2404 = log2(_2402);
    out.m_89.x = _2386;
    bool _2406 = _2400 <= 8000.0;
    bool _2408 = isnan(_2400);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan(8000.0);
    bool _2414 = _2410 || _2412;
    float _2416 = float(_2414);
    float _2418 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2420 = exp2(_2418);
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    float _2426 = fma(_2424, -2.0, 3.0);
    float _2428 = _2424 * _2424;
    float _2430 = in.m_87.y;
    float _2432 = _2428 * _2426;
    float _2434 = in.m_71.x;
    float _2436 = -_2432;
    float _2438 = _2436 + 1.0;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2432);
    float _2442 = _2416 * _2440;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.y = _2430;
    float _2446 = _2430;
    float _2448 = _2396;
    float _2450 = _2396;
    if (!_2302)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2452 = _2446;
    float _2454 = -_2018;
    float _2456 = _2454 + 1.0;
    float _2458 = _2456 * _2444;
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = -_2460;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2466 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2133);
    float _2468 = _2464 * _2434;
    float _2470 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2466);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2474 = _2470 + _2002;
    out.gl_Position.x = _2036;
    out.gl_Position.y = _2028;
    out.gl_Position.z = _2470;
    out.gl_Position.w = _2002;
    out.m_91.x = _2472;
    float _2476 = _2240 * _2056;
    float _2478 = -_2240;
    float _2480 = _2478 + 1.0;
    float _2482 = _2067 * _2476;
    float _2484 = _2077 * _2476;
    float _2486 = _2067 * _2480;
    float _2488 = _2474;
    float _2490 = _2452;
    float _2492 = _2452;
    if (!_2302)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2494 = _2159;
    float _2496 = fma(_2073, _2482, _2061);
    float _2498 = fma(_2075, _2482, _2063);
    float _2500 = _2474 * 0.5;
    float _2502 = fma(_2067, _2484, _2065);
    float _2504 = _2494;
    float _2506 = _2494;
    if (!_2302)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2508 = _2488;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2302)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2514 = _2161;
    out.m_93.z = _2500;
    out.m_93.w = _2002;
    out.m_95.x = _2496;
    out.m_95.y = _2498;
    out.m_95.z = _2502;
    out.m_95.w = _2486;
    bool _2516 = !_2302;
    float _2518 = _2514;
    float _2520 = _2514;
    if (!_2516)
    {
        bool _2522 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2524 = isnan(_1756);
        bool _2526 = _2522 || _2524;
        bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2530 = _2526 || _2528;
        if (!_2530)
        {
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = _1756 + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2538 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = 1.0 / _2538;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2562 = _2534 * _2544;
            float _2564 = precise::clamp(_2562, 0.0, 1.0);
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2570 = fma(_2564, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2572 = fma(_2564, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2564, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2564, _2552, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2578 = fma(_2564, _2556, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2580 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2492 = _2574;
            _2506 = _2578;
            _2394 = _2570;
            _2512 = _2576;
            _2450 = _2572;
            _2520 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2586 = isnan(_1756);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2594 = _2392;
            _2394 = _2594;
            if (!_2592)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2596 = _2490;
            _2492 = _2596;
            if (!_2592)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2598 = _2448;
            _2450 = _2598;
            if (!_2592)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2600 = _2510;
            _2512 = _2600;
            if (!_2592)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2602 = _2504;
            _2506 = _2602;
            if (!_2592)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2604 = _2518;
            bool _2606 = !_2592;
            _2520 = _2604;
            if (!_2606)
            {
                bool _2608 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2610 = isnan(_1756);
                bool _2612 = _2608 || _2610;
                bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2616 = _2612 || _2614;
                if (!_2616)
                {
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2620 = _1756 + _2618;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = 1.0 / _2624;
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2648 = _2620 * _2630;
                    float _2650 = precise::clamp(_2648, 0.0, 1.0);
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2656 = fma(_2650, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2658 = fma(_2650, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2650, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2650, _2638, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2664 = fma(_2650, _2642, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2666 = fma(_2650, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2492 = _2660;
                    _2506 = _2664;
                    _2394 = _2656;
                    _2512 = _2662;
                    _2450 = _2658;
                    _2520 = _2666;
                    _2582 = true;
                }
                else
                {
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2582 = false;
    float _2668 = _2492;
    float _2670 = _2506;
    float _2672 = _2394;
    float _2674 = _2512;
    float _2676 = _2450;
    float _2678 = _2520;
    float _2680 = fma(_2342, -0.5, 0.5);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = -_2668;
    float _2686 = _2684 + _2670;
    float _2688 = -_2672;
    float _2690 = _2688 + _2674;
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    bool _2696 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2698 = fma(_2682, _2686, _2668);
    float _2700 = fma(_2682, _2690, _2672);
    float _2702 = fma(_2682, _2694, _2676);
    float _2704 = _2698 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2706 = fma(_2700, 0.298911988735198974609375, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2710 = fma(_2702, 0.114477999508380889892578125, _2706);
    out.m_91.w = _2708;
    float _2712 = -_2710;
    float _2714 = _2700 + _2712;
    float _2716 = -_2710;
    float _2718 = _2698 + _2716;
    float _2720 = -_2710;
    float _2722 = _2702 + _2720;
    out.m_97.x = 0.0;
    float _2724 = fma(_2714, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2728 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    out.m_99.x = 0.0;
    out.m_101.x = _2724;
    out.m_101.y = _2726;
    out.m_101.z = _2728;
    if (!_2696)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2730 = -_1724;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2734 = -_1726;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2738 = -_1728;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2742 = _2732 * _2732;
    float _2744 = fma(_2736, _2736, _2742);
    float _2746 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = fma(_2740, _2740, _2744);
    float _2752 = _2748 * _2748;
    float _2754 = rsqrt(_2750);
    float _2756 = _2732 * _2754;
    float _2758 = _2736 * _2754;
    float _2760 = _2740 * _2754;
    float _2762 = sqrt(_2750);
    float _2764 = -_1762;
    float _2766 = _2764 + _2756;
    float _2768 = -_1758;
    float _2770 = _2768 + _2758;
    float _2772 = -_1760;
    float _2774 = _2772 + _2760;
    float _2776 = _2766 * _2766;
    float _2778 = fma(_2770, _2770, _2776);
    float _2780 = fma(_2774, _2774, _2778);
    float _2782 = -_2762;
    float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2786 = rsqrt(_2780);
    float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2790 = precise::clamp(_2788, 0.0, 1.0);
    float _2792 = abs(_2790);
    float _2794 = log2(_2792);
    float _2796 = _2752 + (-1.0);
    float _2798 = _2766 * _2786;
    float _2800 = _2770 * _2786;
    float _2802 = _2774 * _2786;
    float _2804 = _2342 * _2798;
    float _2806 = _2342 * _2756;
    float _2808 = fma(_2314, _2800, _2804);
    float _2810 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2812 = fma(_2314, _2758, _2806);
    float _2814 = fma(_2344, _2802, _2808);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = fma(_2344, _2760, _2812);
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = exp2(_2810);
    float _2824 = _2816 * _2816;
    float _2826 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2828 = fma(_2824, _2796, 1.0);
    float _2830 = -_2756;
    float _2832 = -_2826;
    float _2834 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2832);
    float _2836 = _2828 * _2828;
    float _2838 = -_2760;
    float _2840 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2834);
    float _2842 = 1.0 / _2836;
    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2846 = _2840 + _2844;
    float _2848 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2822 * _2850;
    float _2854 = _2820 * _2852;
    float _2856 = _2752 * _2842;
    float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2860 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2862 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2864 = _2854 * _2856;
    float _2866 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2868 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2870 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2858;
    out.m_97.y = _2860;
    out.m_97.z = _2862;
    out.m_99.x = _2866;
    out.m_99.y = _2868;
    out.m_99.z = _2870;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2582 = false;
    bool _380 = false;
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
    float _128 = as_type<float>(_120);
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _126;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_136);
        out.gl_Position.z = _2928;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_53.w;
    float _142 = float(_120);
    float _144 = -_140;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_140);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    bool _158 = _146 >= _142;
    bool _160 = !_156;
    bool _162 = _158 || _160;
    float _164 = _146;
    if (_162)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _138 = as_type<int>(_168);
    }
    int _170 = _138;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2992 = as_type<float>(_170);
        out.gl_Position.z = _2992;
    }
    if (_162)
    {
        return out;
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = 1.0 / _142;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _146 * _178;
    float _196 = _172 * _172;
    float _198 = _174 * _174;
    float _200 = fma(_182, _182, _196);
    float _202 = fma(_184, _184, _198);
    float _204 = fma(_188, _188, _200);
    float _206 = _176 * _176;
    float _208 = fma(_190, _190, _202);
    float _210 = sqrt(_204);
    float _212 = fma(_186, _186, _206);
    float _214 = fma(_192, _192, _212);
    float _216 = in.m_61.x;
    float _218 = in.m_61.y;
    float _220 = in.m_61.z;
    float _222 = sqrt(_208);
    float _224 = sqrt(_214);
    bool _226 = _210 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = 0.0;
    float _232 = _204;
    if (_226)
    {
        float _234 = rsqrt(_204);
        _230 = _234;
    }
    float _236 = _230;
    float _238 = _184 * _218;
    bool _240 = _224 > 0.0;
    float _242 = _174 * _218;
    float _244 = _190 * _218;
    float _246 = fma(_182, _216, _238);
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_226)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    float _256 = fma(_172, _216, _242);
    float _258 = _224;
    float _260 = _252;
    float _262 = _254;
    if (_228)
    {
        float _264 = rsqrt(_208);
        _258 = _264;
    }
    float _266 = _258;
    float _268 = fma(_188, _216, _244);
    float _270 = 0.0;
    float _272 = 0.0;
    if (!_228)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _274 = _270;
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _274;
    float _282 = _276;
    if (!_226)
    {
        _278 = 0.0;
    }
    float _284 = _278;
    float _286 = fma(_186, _220, _246);
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _286;
    if (!_228)
    {
        _288 = 0.0;
    }
    float _294 = _288;
    float _296 = fma(_176, _220, _256);
    float _298 = 0.0;
    float _300 = 0.0;
    float _302 = _294;
    if (!_240)
    {
        _298 = 0.0;
        _300 = 0.0;
    }
    float _304 = _298;
    float _306 = _300;
    float _308 = 0.0;
    float _310 = _306;
    float _312 = _304;
    if (_240)
    {
        float _314 = rsqrt(_214);
        _308 = _314;
    }
    float _316 = _308;
    if (!_240)
    {
        _232 = 0.0;
    }
    float _318 = _232;
    float _320 = fma(_192, _220, _268);
    float _322 = _318;
    if (_226)
    {
        float _324 = _236 * _172;
        _290 = _324;
    }
    float _326 = _290;
    if (_226)
    {
        float _328 = _236 * _182;
        _260 = _328;
    }
    float _330 = _260;
    if (_226)
    {
        float _332 = _236 * _188;
        _262 = _332;
    }
    float _334 = _262;
    if (_228)
    {
        float _336 = _266 * _174;
        _302 = _336;
    }
    float _338 = _302;
    if (_228)
    {
        float _340 = _266 * _184;
        _280 = _340;
    }
    float _342 = _280;
    if (_228)
    {
        float _344 = _266 * _190;
        _282 = _344;
    }
    float _346 = _282;
    if (_240)
    {
        float _348 = _316 * _176;
        _310 = _348;
    }
    float _350 = _310;
    if (_240)
    {
        float _352 = _316 * _186;
        _312 = _352;
    }
    float _354 = _312;
    if (_240)
    {
        float _356 = _316 * _192;
        _322 = _356;
    }
    float _358 = _322;
    bool _360 = !_180;
    float _378;
    if (!_360)
    {
        float _362 = in.m_63.x;
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _362 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        _378 = _194;
    }
    _380 = false;
    float _382 = _378;
    float _384 = in.m_63.z;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _382 + _390;
    float _394 = in.m_48.x;
    float _396 = in.m_48.y;
    float _398 = in.m_48.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = in.m_63.y;
    float _410 = -_194;
    float _412 = _410 + 1.0;
    float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _416;
    bool _420 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _428 = _424 || _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _382 + _430;
    float _434 = in.m_59.w;
    float _436 = 1.0 / _406;
    float _438 = _388 * _146;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = _384 * 2.0;
    float _450 = 1.0 / _402;
    float _452 = _194 * _414;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = _184 * _396;
    float _458 = _190 * _396;
    float _460 = _412 * _414;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = fma(_182, _394, _456);
    float _466 = fma(_188, _394, _458);
    float _468 = floor(_448);
    float _470 = _392 * _436;
    float _472 = in.m_63.x;
    float _474 = fma(_186, _398, _464);
    float _476 = _408 * 2.0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _480 = 1.0 + _478;
    float _482 = exp2(_438);
    bool _484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _492 = _488 || _490;
    float _494 = fma(_192, _398, _466);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _500 = _382 + _498;
    float _502 = precise::min(_454, _462);
    float _504 = _432 * _450;
    float _506 = fma(_496, _408, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _508 = floor(_476);
    bool _510 = _468 > 0.0;
    float _512 = fma(_442, _504, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _514 = _468 >= 0.0;
    bool _516 = isnan(_468);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = _506 * _146;
    float _526 = fma(_446, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _528 = _522 ? 0 : 1;
    float _530 = 1.0 / _418;
    float _532 = -_482;
    float _534 = _532 + 1.0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _546 = _544 != 0;
    float _548 = _472 + _384;
    int _550 = ~_528;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = fma(_472, 6.283185482025146484375, _524);
    float _558 = _428 ? _534 : 0.0;
    float _560 = _548 + (-1.0);
    float _562 = 1.0 / _480;
    int _564 = _554;
    if (!_510)
    {
        int _566 = ~_528;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _472 * 2.0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _580 = _578 != 0;
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _584 = !_542;
    int _586 = _584 ? 0 : 1;
    float _588 = _556 * 0.15915493667125701904296875;
    bool _590 = _508 >= 0.0;
    bool _592 = isnan(_508);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _500 * _530;
    bool _602 = !_538;
    int _604 = _602 ? 0 : 1;
    float _606 = floor(_572);
    int _608 = _598 ? 0 : 1;
    float _610 = -_502;
    float _612 = _610 + 1.0;
    int _614 = ~_608;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (_492)
    {
        float _622 = _558 * _562;
        _164 = _622;
    }
    float _624 = _164;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _636 = _634 != 0;
    float _638 = _472 + _408;
    bool _640 = _508 > 0.0;
    float _642 = _408 + _384;
    float _644 = _638 + (-1.0);
    bool _646 = !_546;
    int _648 = _646 ? 0 : 1;
    float _650 = _642 + (-1.0);
    bool _652 = !_636;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _658 = !_576;
    int _660 = _658 ? 0 : 1;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _666 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    if (!_640)
    {
        int _668 = ~_608;
        int _670 = _668 + 1;
        _620 = _670;
    }
    int _672 = _620;
    float _674 = _384 + (-0.5);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _686 = _684 != 0;
    float _688 = in.m_57.w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _690;
    bool _694 = _606 >= 0.0;
    bool _696 = isnan(_606);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _706 = !_678;
    int _708 = _706 ? 0 : 1;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _710;
    int _714 = _702 ? 0 : 1;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _720 = _606 > 0.0;
    float _722 = fma(_712, _504, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _724 = fma(_692, _504, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _730;
    float _734 = fma(_718, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _740;
    float _744 = fma(_728, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _746 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _748 = isnan(_382);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_738, _600, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _760 = fma(_742, _600, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _762 = fma(_732, _600, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _764 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _766 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _768 = isnan(_382);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _780 = _474 + _688;
    float _782 = _764 * _664;
    bool _784 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _786 = isnan(_382);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_776;
    float _798 = _796 + 1.0;
    float _800 = -_756;
    float _802 = _800 + 1.0;
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].x, _782);
    float _806 = _666 * _704;
    float _808 = _756 * _798;
    bool _810 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _812 = isnan(_382);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = floor(_804);
    float _824 = _794 * _802;
    float _826 = -_794;
    float _828 = _826 + 1.0;
    float _830 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _832 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].y, _806);
    float _834 = _494 + _434;
    float _836 = _820 * _828;
    float _838 = _830 * _778;
    float _840 = -_820;
    float _842 = _840 + 1.0;
    float _844 = floor(_832);
    float _846 = _722 * _836;
    float _848 = _512 * _836;
    float _850 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].z, _838);
    int _852 = ~_714;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].x, _846);
    int _860 = _856;
    if (!_720)
    {
        int _862 = ~_714;
        int _864 = _862 + 1;
        _860 = _864;
    }
    int _866 = _860;
    float _868 = _724 * _836;
    float _870 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].y, _848);
    float _872 = -_822;
    float _874 = _804 + _872;
    float _876 = _804 + 0.25;
    float _878 = fma(_734, _824, _858);
    float _880 = _832 + 0.25;
    float _882 = fma(_526, _824, _870);
    float _884 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].z, _868);
    float _886 = floor(_876);
    float _888 = fma(_758, _808, _878);
    bool _890 = _874 >= 0.5;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.5);
    bool _898 = _894 || _896;
    float _900 = fma(_744, _824, _884);
    bool _902 = !_682;
    int _904 = _902 ? 0 : 1;
    float _906 = _804 * 6.283185482025146484375;
    int _908 = abs(_708);
    float _910 = fma(_760, _808, _882);
    float _912 = floor(_880);
    int _914 = abs(_904);
    float _916 = fma(_762, _808, _900);
    float _918 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].x, _888);
    float _920 = float(_866);
    float _922 = -_844;
    float _924 = _832 + _922;
    float _926 = floor(_850);
    float _928 = float(_570);
    float _930 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].z, _916);
    float _932 = float(_908);
    bool _934 = !_898;
    float _936 = _934 ? 0.5 : (-0.5);
    bool _938 = _924 >= 0.5;
    bool _940 = isnan(_924);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.5);
    bool _946 = _942 || _944;
    float _948 = _932 * _928;
    float _950 = -_886;
    float _952 = _876 + _950;
    float _954 = -_912;
    float _956 = _880 + _954;
    bool _958 = !_946;
    float _960 = _958 ? 0.5 : (-0.5);
    float _962 = _948 * (-2.0);
    int _964 = abs(_586);
    float _966 = _588 * 6.283185482025146484375;
    float _968 = sin(_966);
    int _970 = abs(_660);
    float _972 = -_926;
    float _974 = _850 + _972;
    float _976 = _936 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _978 = _976 * 2.0;
    float _980 = _960 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _982 = _980 * 2.0;
    float _984 = _906 * 0.15915493667125701904296875;
    bool _986 = !_632;
    int _988 = _986 ? 0 : 1;
    bool _990 = _974 >= 0.5;
    bool _992 = isnan(_974);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    float _1000 = float(_970);
    float _1002 = _984 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    int _1006 = abs(_988);
    float _1008 = _832 * 6.283185482025146484375;
    float _1010 = float(_964);
    float _1012 = _1000 * _982;
    int _1014 = abs(_604);
    float _1016 = _1008 * 0.15915493667125701904296875;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1020 = _1018 != 0;
    float _1022 = _1010 * _978;
    bool _1024 = _952 > 0.5;
    float _1026 = in.m_65.x;
    float _1028 = in.m_65.y;
    float _1030 = in.m_65.z;
    bool _1032 = !_998;
    float _1034 = _1032 ? 0.5 : (-0.5);
    float _1036 = _1016 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    bool _1040 = !_1020;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = abs(_968);
    float _1046 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1048 = float(_1006);
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1052 = _1050 * 2.0;
    float _1054 = float(_1014);
    float _1056 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1058 = _850 + 0.25;
    int _1060 = abs(_1042);
    float _1062 = fma(_1054, _1056, _1022);
    float _1064 = _952;
    float _1066 = _956;
    if (_1024)
    {
        float _1068 = -_952;
        float _1070 = _1068 + 1.0;
        _1064 = _1070;
    }
    float _1072 = _1064;
    float _1074 = floor(_1058);
    float _1076 = _850 * 6.283185482025146484375;
    bool _1078 = _956 > 0.5;
    float _1080 = fma(_1072, 4.0, -1.0);
    int _1082 = abs(_648);
    float _1084 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1086 = float(_1060);
    float _1088 = _1076 * 0.15915493667125701904296875;
    bool _1090 = !_580;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1048 * _1052;
    float _1096 = float(_1082);
    float _1098 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1100 = fma(_1086, _1084, _1012);
    int _1102 = abs(_1092);
    float _1104 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1046);
    float _1106 = _1088 * 6.283185482025146484375;
    float _1108 = sin(_1106);
    float _1110 = fma(_1096, _1098, _1062);
    if (_1078)
    {
        float _1112 = -_956;
        float _1114 = _1112 + 1.0;
        _1066 = _1114;
    }
    float _1116 = _1066;
    float _1118 = -_1074;
    float _1120 = _1058 + _1118;
    bool _1122 = !_628;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1110, 3.1415927410125732421875, _1026);
    float _1128 = fma(_1116, 4.0, -1.0);
    int _1130 = abs(_1124);
    float _1132 = fma(_656, _962, _656);
    float _1134 = float(_1102);
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1138 = _1120 > 0.5;
    float _1140 = fma(_1126, _962, _1126);
    float _1142 = float(_1130);
    float _1144 = fma(_1134, _1136, _1100);
    float _1146 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1148 = float(_914);
    float _1150 = _472 + (-0.5);
    float _1152 = fma(_1144, 3.1415927410125732421875, _1028);
    float _1154 = fma(_1142, _1146, _1094);
    int _1156 = abs(_654);
    float _1158 = _834 * _834;
    bool _1160 = !_686;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = _1148 * _920;
    float _1166 = _1120;
    if (_1138)
    {
        float _1168 = -_1120;
        float _1170 = _1168 + 1.0;
        _1166 = _1170;
    }
    float _1172 = _1166;
    float _1174 = fma(_780, _780, _1158);
    int _1176 = abs(_1162);
    float _1178 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1140);
    float _1180 = fma(_1172, 4.0, -1.0);
    float _1182 = float(_672);
    float _1184 = in.m_67.y;
    float _1186 = _1164 * (-2.0);
    float _1188 = float(_1156);
    float _1190 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1192 = fma(_1132, _624, _1178);
    float _1194 = _408 + (-0.5);
    float _1196 = fma(_1152, _1186, _1152);
    float _1198 = float(_1176);
    float _1200 = fma(_1188, _1190, _1154);
    float _1202 = fma(_662, _1186, _662);
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1196);
    float _1206 = in.m_67.x;
    float _1208 = fma(_1200, 3.1415927410125732421875, _1030);
    float _1210 = _1198 * _1182;
    float _1212 = fma(_1202, _624, _1204);
    float _1214 = in.m_69.x;
    float _1216 = in.m_69.y;
    float _1218 = in.m_69.z;
    float _1220 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].y, _910);
    float _1222 = _1210 * (-2.0);
    float _1224 = _1192 * 0.15915493667125701904296875;
    float _1226 = in.m_67.z;
    float _1228 = _1212 * 0.15915493667125701904296875;
    float _1230 = fma(_582, _1222, _582);
    float _1232 = fma(_1208, _1222, _1208);
    float _1234 = sqrt(_1174);
    float _1236 = -_1104;
    float _1238 = _1236 + _1184;
    float _1240 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1232);
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1238);
    float _1244 = fma(_1230, _624, _1240);
    float _1246 = _1224 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1244 * 0.15915493667125701904296875;
    float _1252 = _1220 * _1216;
    float _1254 = _1224 * 6.283185482025146484375;
    float _1256 = cos(_1254);
    float _1258 = _918 * _1214;
    float _1260 = _930 * _1218;
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1206);
    float _1264 = _572 + (-1.0);
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1268 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1226);
    float _1272 = _1228 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    float _1276 = _1266 * _1262;
    float _1278 = _1264 * _1234;
    float _1280 = _1268 * _1242;
    float _1282 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1284 = _1278 * 0.75;
    float _1286 = _1228 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = _1282 * _1270;
    float _1292 = _1250 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = _1248 * _1274;
    float _1298 = _1256 * _1274;
    float _1300 = _1250 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = _1256 * _1288;
    float _1306 = _1248 * _1288;
    float _1308 = _1256 * _1294;
    float _1310 = _1248 * _1294;
    float _1312 = _1288 * _1294;
    float _1314 = _1284 * 0.15915493667125701904296875;
    float _1316 = _1308 * _1280;
    float _1318 = _1310 * _1280;
    float _1320 = _1274 * _1294;
    float _1322 = _1314 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = fma(_1302, _1304, _1296);
    float _1328 = -_1298;
    float _1330 = fma(_1302, _1306, _1328);
    float _1332 = -_1306;
    float _1334 = fma(_1302, _1298, _1332);
    float _1336 = -_1280;
    float _1338 = _1302 * _1336;
    float _1340 = fma(_1326, _1276, _1316);
    float _1342 = fma(_1330, _1276, _1318);
    float _1344 = fma(_1302, _1296, _1304);
    float _1346 = fma(_1312, _1276, _1338);
    float _1348 = fma(_1334, _1290, _1340);
    float _1350 = _1314 * 6.283185482025146484375;
    float _1352 = cos(_1350);
    float _1354 = fma(_1344, _1290, _1342);
    float _1356 = fma(_1320, _1290, _1346);
    float _1358 = _1348 * _342;
    float _1360 = _1348 * _346;
    float _1362 = _1348 * _338;
    float _1364 = fma(_1356, _330, _1358);
    float _1366 = fma(_1356, _334, _1360);
    float _1368 = fma(_1356, _326, _1362);
    float _1370 = fma(_1354, _354, _1364);
    float _1372 = fma(_1354, _358, _1366);
    float _1374 = fma(_1354, _350, _1368);
    float _1376 = _1370 * _1324;
    float _1378 = _1370 * _1352;
    float _1380 = -_1376;
    float _1382 = fma(_1372, _1352, _1380);
    float _1384 = fma(_1372, _1324, _1378);
    float _1386 = _834 + _1382;
    float _1388 = _780 + _1384;
    float _1390 = in.m_71.y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1386 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1398 = _1388 + _1396;
    float _1400 = _1394 * _1394;
    float _1402 = fma(_1398, _1398, _1400);
    float _1404 = sqrt(_1402);
    float _1406 = _396 + _1390;
    float _1408 = _1406 + _1374;
    bool _1410 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1404 + _1412;
    float _1416 = _1324;
    float _1418 = _1368;
    float _1420 = _1356;
    float _1422 = _1404;
    float _1424 = _1314;
    float _1426 = _1408;
    float _1428 = _1406;
    float _1430 = _1184;
    if (_1410)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1410)
    {
        float _1436 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1418 = _1436;
    }
    float _1438 = _1418;
    float _1440 = _1438;
    if (!_1410)
    {
        _1420 = _1388;
    }
    float _1442 = _1420;
    float _1444 = _1434;
    float _1446 = _1442;
    if (_1410)
    {
        float _1448 = _1414 * _1434;
        _1422 = _1448;
    }
    float _1450 = _1422;
    if (_1410)
    {
        float _1452 = rsqrt(_1402);
        _1444 = _1452;
    }
    float _1454 = _1444;
    float _1456 = _1454;
    if (_1410)
    {
        float _1458 = _1450 * 0.15915493667125701904296875;
        _1424 = _1458;
    }
    float _1460 = _1424;
    float _1462 = _1450;
    if (_1410)
    {
        float _1464 = _1460 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        _1462 = _1466;
    }
    float _1468 = _1462;
    float _1470 = _1468;
    if (_1410)
    {
        float _1472 = fma(_1468, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1472;
    }
    float _1474 = _1440;
    float _1476 = _1474;
    if (!_1410)
    {
        _1470 = _1386;
    }
    float _1478 = _1470;
    float _1480 = _1478;
    if (_1410)
    {
        float _1482 = _1454 * _1474;
        _1476 = _1482;
    }
    float _1484 = _1476;
    if (_1410)
    {
        float _1486 = fma(_1394, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1480 = _1486;
    }
    float _1488 = _1480;
    float _1490 = _1488;
    if (_1410)
    {
        float _1492 = fma(_1398, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1446 = _1492;
    }
    float _1494 = _1446;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1498 = _1488 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1502 = _1494 + _1500;
    float _1504 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1506 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4904 = float2(_1506, _1504);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4904, float2(0.0), isnan(_4904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4904, float2(0.0), isnan(_4904)), level(0.0)).x;
    float _1510 = _1502;
    float _1512 = _1494;
    if (_1410)
    {
        float _1514 = _1460 * 6.283185482025146484375;
        float _1516 = cos(_1514);
        _1510 = _1516;
    }
    float _1518 = _1510;
    float _1520 = -_780;
    float _1522 = _1520 + _1494;
    float _1524 = -_834;
    float _1526 = _1524 + _1488;
    bool _1528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1530 = isnan(0.5);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1536 = _1532 || _1534;
    if (_1410)
    {
        float _1538 = _1518 + (-1.0);
        _1456 = _1538;
    }
    float _1540 = _1456;
    float _1542 = _1540;
    if (_1410)
    {
        float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1542 = _1544;
    }
    float _1546 = _1542;
    if (_1410)
    {
        float _1548 = fma(_1408, _1518, _1546);
        _1426 = _1548;
    }
    float _1550 = _1426;
    float _1552 = -_1406;
    float _1554 = _1552 + _1550;
    float _1556 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1558 = _1554 * _1554;
    float _1560 = floor(_1556);
    float _1562 = fma(_1522, _1522, _1558);
    float _1564 = fma(_1526, _1526, _1562);
    float _1566 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1568 = sqrt(_1564);
    float _1570 = -_1560;
    float _1572 = _1556 + _1570;
    float _1574 = floor(_1566);
    bool _1576 = _1568 > 0.0;
    float _1578 = -_1574;
    float _1580 = _1566 + _1578;
    float _1582 = fma(_1508, 100.0, _1550);
    float _1584 = fma(_1508, 100.0, _1406);
    float _1586 = _1556;
    float _1588 = _1568;
    float _1590 = _1508;
    float _1592 = _1564;
    if (!_1576)
    {
        _1428 = _1582;
    }
    float _1594 = _1428;
    bool _1596 = !_1576;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = _296 * _296;
        float _1602 = rsqrt(_1564);
        float _1604 = fma(_286, _286, _1600);
        float _1606 = fma(_320, _320, _1604);
        float _1608 = sqrt(_1606);
        float _1610 = _1522 * _1602;
        float _1612 = _1554 * _1602;
        float _1614 = _1526 * _1602;
        bool _1616 = _1608 > 0.0;
        float _1618 = _1602;
        _1586 = _1612;
        if (!_1616)
        {
            _1618 = _1582;
        }
        float _1620 = _1618;
        bool _1622 = !_1616;
        _1598 = _1620;
        if (!_1622)
        {
            float _1624 = rsqrt(_1606);
            float _1626 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1628 = _296 * _1624;
            float _1630 = _286 * _1624;
            float _1632 = _1612 * _1628;
            float _1634 = _320 * _1624;
            float _1636 = fma(_1610, _1630, _1632);
            float _1638 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1640 = fma(_1614, _1634, _1636);
            float _1642 = _1640 * _1638;
            float _1644 = fma(_286, _1642, _1494);
            float _1646 = fma(_296, _1642, _1582);
            float _1648 = fma(_320, _1642, _1488);
            _1586 = _1636;
            _1512 = _1644;
            _1598 = _1646;
            _1490 = _1648;
            _1588 = _1638;
            _1590 = _1626;
        }
    }
    float _1650 = _1586;
    float _1652 = _1512;
    float _1654 = _1598;
    float _1656 = _1490;
    float _1658 = _1588;
    float _1660 = _1590;
    float _1662 = _1654;
    float _1664 = _1652;
    float _1666 = _1656;
    float _1668 = _1658;
    float _1670 = _1650;
    float _1672 = _1660;
    if (!_1536)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1676 = _1584 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1680 = _780 + _1678;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1684 = -_780;
        float _1686 = _1684 + _1652;
        float _1688 = _1676 * _1676;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1692 = _834 + _1690;
        float _1694 = -_1584;
        float _1696 = _1694 + _1654;
        float _1698 = -_834;
        float _1700 = _1698 + _1656;
        float _1702 = fma(_1680, _1680, _1688);
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1706 = fma(_1692, _1692, _1702);
        float _1708 = sqrt(_1706);
        float _1710 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1712 = precise::min(_1708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1714 = _1712 * _1704;
        float _1716 = _1710 * _1714;
        float _1718 = fma(_1686, _1716, _780);
        float _1720 = fma(_1696, _1716, _1584);
        float _1722 = fma(_1700, _1716, _834);
        _1662 = _1720;
        _1664 = _1718;
        _1666 = _1722;
        _292 = _1712;
        _1668 = _1704;
        _1670 = _1714;
    }
    float _1724 = _1662;
    float _1726 = _1664;
    float _1728 = _1666;
    float _1730 = _292;
    float _1732 = _1668;
    float _1734 = _1670;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = _1724 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1726 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1728 + _1744;
    float _1748 = _1738 * _1738;
    float _1750 = fma(_1742, _1742, _1748);
    float _1752 = fma(_1746, _1746, _1750);
    float _1754 = rsqrt(_1752);
    float _1756 = sqrt(_1752);
    float _1758 = _1742 * _1754;
    float _1760 = _1746 * _1754;
    float _1762 = _1738 * _1754;
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1766 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 * _1766;
    float _1772 = _1768 + _1770;
    float _1774 = sqrt(_1772);
    bool _1776 = _1774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1780 = _1774 + _1778;
    float _1782 = _1730;
    float _1784 = _1780;
    float _1786 = _1732;
    if (_1776)
    {
        float _1788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (_1776)
    {
        float _1792 = rsqrt(_1772);
        _1672 = _1792;
    }
    float _1794 = _1672;
    float _1796 = _1794;
    if (_1776)
    {
        float _1798 = _1780 * _1790;
        _1784 = _1798;
    }
    float _1800 = _1784;
    if (_1776)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1786 = _1802;
    }
    float _1804 = _1786;
    float _1806 = _1790;
    if (_1776)
    {
        float _1808 = _1804 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1816 = precise::max(0.0, _1814);
    float _1818 = _1734;
    float _1820 = _1814;
    float _1822 = _1816;
    if (_1776)
    {
        float _1824 = _1804 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1818 = _1826;
    }
    float _1828 = _1818;
    float _1830 = -_1762;
    float _1832 = -_1816;
    float _1834 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1832);
    if (_1776)
    {
        float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1836;
    }
    float _1838 = _1820;
    float _1840 = _1838;
    float _1842 = _1812;
    if (_1776)
    {
        float _1844 = fma(_1812, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1844;
    }
    float _1846 = _1840;
    float _1848 = _1846;
    if (!_1776)
    {
        _1842 = _1764;
    }
    float _1850 = _1842;
    float _1852 = _1850;
    float _1854 = _1828;
    if (_1776)
    {
        float _1856 = _1828 + (-1.0);
        _1822 = _1856;
    }
    float _1858 = _1822;
    float _1860 = _1858;
    if (_1776)
    {
        float _1862 = _1794 * _1846;
        _1592 = _1862;
    }
    float _1864 = _1592;
    if (!_1776)
    {
        _1848 = _1834;
    }
    float _1866 = _1848;
    float _1868 = _1866;
    if (_1776)
    {
        float _1870 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1870;
    }
    float _1872 = _1796;
    float _1874 = _1872;
    if (_1776)
    {
        float _1876 = _1764 * _1864;
        _1852 = _1876;
    }
    float _1878 = _1852;
    if (!_1776)
    {
        _1860 = _1766;
    }
    float _1880 = _1860;
    float _1882 = _1880;
    if (_1776)
    {
        float _1884 = _1766 * _1864;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (_1776)
    {
        float _1888 = fma(_1834, _1828, _1872);
        _1868 = _1888;
    }
    float _1890 = _1868;
    if (!_1776)
    {
        _1874 = _1768;
    }
    float _1892 = _1874;
    float _1894 = _1892;
    if (_1776)
    {
        float _1896 = _1878 * _1878;
        _1894 = _1896;
    }
    float _1898 = _1894;
    float _1900 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1776)
    {
        _1854 = _1770;
    }
    float _1902 = _1854;
    float _1904 = _1902;
    if (_1776)
    {
        float _1906 = _1886 * _1886;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1890, _1890, _1898);
    float _1912 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1900);
    float _1914 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1916 = _1910 + _1908;
    float _1918 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1912);
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1914);
    float _1928 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1930 = rsqrt(_1916);
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1934 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1938 = -_1924;
    float _1940 = _1938 + 1.0;
    float _1942 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1926);
    float _1944 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1946 = -_1936;
    float _1948 = fma(_1946, _1932, 1.0);
    float _1950 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = abs(_1940);
    float _1954 = log2(_1952);
    float _1956 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1944);
    float _1958 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1960 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1962 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1964 = _1930 * _1878;
    float _1966 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1960);
    float _1968 = _1930 * _1890;
    float _1970 = _1930 * _1886;
    float _1972 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1978 = log2(_1948);
    float _1980 = -_1972;
    float _1982 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1980);
    float _1984 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1986 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1976);
    float _1988 = _1968 + 1.0;
    float _1990 = -_1970;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1982);
    float _1994 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1986);
    float _1996 = exp2(_1984);
    float _1998 = fma(_1992, -0.5, 0.5);
    float _2000 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2004 = fma(_1992, 0.5, 0.5);
    float _2006 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2008 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2000);
    float _2010 = 1.0 / _2002;
    float _2012 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2006);
    float _2014 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2008);
    float _2016 = fma(_2004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5721 = float2(_1580, _1572);
    float _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5721, float2(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5721, float2(0.0), isnan(_5721)), level(0.0)).x;
    float _2020 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2012);
    float _2022 = _1978 * 0.693147182464599609375;
    float _2024 = fma(_2004, _2016, -0.212114393711090087890625);
    float _2026 = sqrt(_1998);
    float _2028 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2020);
    float _2030 = fma(_2004, _2024, 1.570728778839111328125);
    float _2032 = -_1968;
    float _2034 = fma(_1996, _1988, _2032);
    float _2036 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2014);
    float _2038 = _2028 * _2010;
    float _2040 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2042 = _2036 * _2010;
    float _2044 = fma(_2034, 0.5, 0.5);
    float _2046 = _2026 * 0.636619746685028076171875;
    float _2048 = fma(_2042, 0.5, 0.5);
    float _2050 = fma(_2038, -0.5, 0.5);
    float _2052 = -_2030;
    float _2054 = fma(_2046, _2052, 1.0);
    float3 _5788 = float3(_2048, _2050, _2040);
    float _2056 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5788, float3(0.0), isnan(_5788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5788, float3(0.0), isnan(_5788)), level(0.0)).x;
    float3 _5799 = float3(_2048, _2050, _2040);
    float4 _2059 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5799, float3(0.0), isnan(_5799)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5799, float3(0.0), isnan(_5799)), level(0.0)).xyzw;
    float _2061 = _2059.x;
    float _2063 = _2059.y;
    float _2065 = _2059.z;
    float _2067 = _2059.w;
    float2 _5815 = float2(_2054, _2044);
    float3 _2071 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5815, float2(0.0), isnan(_5815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5815, float2(0.0), isnan(_5815)), level(0.0)).xyz;
    float _2073 = _2071.x;
    float _2075 = _2071.y;
    float _2077 = _2071.z;
    float _2079 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2081 = in.m_73.x;
    float _2083 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2085 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = -_1104;
    float _2089 = -_1184;
    bool _2091 = _2087 != _2089;
    bool _2093 = isnan(_2087);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan(_2089);
    bool _2099 = _2095 || _2097;
    float _2101 = _2079 * _472;
    bool _2103 = _408 > 0.5;
    float _2105 = _2083 * _472;
    bool _2107 = _1206 == 0.0;
    bool _2109 = !_2099;
    bool _2111 = _2107 && _2109;
    float _2113 = in.m_73.y;
    float _2115 = trunc(_2101);
    int _2117 = int(_2115);
    bool _2119 = _1226 == 0.0;
    bool _2121 = _2119 && _2111;
    float _2123 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2127 = _2125 != 0;
    out.m_75.x = _1726;
    out.m_75.y = _1724;
    out.m_75.z = _1728;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2131 = _2129 != 0;
    float _2133 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2123);
    bool _2135 = _472 > 0.5;
    bool _2137 = _2135 && _2127;
    float _2139 = trunc(_2105);
    int _2141 = int(_2139);
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2145 = _2117 << 4;
    int _2147 = _2145 + 1712;
    float _2149 = exp2(_2085);
    float _2151 = in.m_77.x;
    float _2153 = in.m_77.y;
    float _2155 = in.m_77.z;
    float _2157 = _2081;
    float _2159 = _2028;
    float _2161 = _2036;
    if (!_2127)
    {
        _1430 = _2081;
    }
    float _2163 = _1430;
    int _2165 = _2147 + 8;
    uint _2168 = uint(int(uint(_2165) >> uint(2)));
    uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
    int _2172 = int(_2168) & 3;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[int(_2170)][_2172];
    float _2176 = _2163;
    if (_2137)
    {
        float _2178 = -_2081;
        float _2180 = _2178 + 1.0;
        _2157 = _2180;
    }
    float _2182 = _2157;
    float _2184 = -_2113;
    float _2186 = _2184 + 1.0;
    int _2188 = _2141 << 4;
    int _2190 = _2188 + 1968;
    float _2192 = _2113;
    if (_2127)
    {
        _2176 = _2182;
    }
    float _2194 = _2176;
    uint _2196 = uint(int(uint(_2147) >> uint(2)));
    uint _2198 = uint(int(uint(int(_2196)) >> uint(2)));
    int _2200 = int(_2196) & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = int(_2196) + 1;
    uint _2206 = uint(int(uint(_2204) >> uint(2)));
    int _2208 = _2204 & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    if (_2131)
    {
        float _2212 = _2103 ? _2186 : _2113;
        _2192 = _2212;
    }
    float _2214 = _2192;
    float _2216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2218 = -_2149;
    float _2220 = _2218 + 1.0;
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _2224 = uint(int(uint(_2190) >> uint(2)));
    uint _2226 = uint(int(uint(int(_2224)) >> uint(2)));
    int _2228 = int(_2224) & 3;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[int(_2226)][_2228];
    int _2232 = int(_2224) + 1;
    uint _2234 = uint(int(uint(_2232) >> uint(2)));
    int _2236 = _2232 & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    float _2240 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2242 = _2153;
    float _2244 = _2151;
    float _2246 = _2155;
    if (!_2121)
    {
        float _2248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2153);
        _2242 = _2248;
    }
    float _2250 = _2242;
    if (!_2121)
    {
        float _2252 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2151);
        _2244 = _2252;
    }
    float _2254 = _2244;
    if (!_2121)
    {
        float _2256 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2155);
        _2246 = _2256;
    }
    float _2258 = _2246;
    int _2260 = _2190 + 8;
    uint _2262 = uint(int(uint(_2260) >> uint(2)));
    uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
    int _2266 = int(_2262) & 3;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[int(_2264)][_2266];
    float _2270 = _1308 * _2250;
    float _2272 = -_2250;
    float _2274 = _1302 * _2272;
    float _2276 = _1310 * _2250;
    float _2278 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2280 = fma(_1326, _2254, _2270);
    float _2282 = fma(_1312, _2254, _2274);
    float _2284 = fma(_1330, _2254, _2276);
    float _2286 = _2222 * _2216;
    float _2288 = fma(_1334, _2258, _2280);
    float _2290 = fma(_1320, _2258, _2282);
    float _2292 = fma(_1344, _2258, _2284);
    bool _2294 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2296 = isnan(_1756);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2302 = _2298 || _2300;
    float _2304 = _2288 * _342;
    float _2306 = _2288 * _338;
    float _2308 = _2288 * _346;
    float _2310 = fma(_2290, _330, _2304);
    float _2312 = fma(_2290, _334, _2308);
    float _2314 = fma(_2292, _354, _2310);
    float _2316 = _2174 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2320 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2322 = _2202 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2324 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2326 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2330 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2332 = _2238 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_79.x = _2326;
    out.m_79.y = _2328;
    out.m_79.z = _2320;
    out.m_79.w = _2143;
    float _2334 = _2278 * _2318;
    float _2336 = fma(_2290, _326, _2306);
    float _2338 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2342 = fma(_2292, _350, _2336);
    float _2344 = fma(_2292, _358, _2312);
    float _2346 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_81.x = _2334;
    out.m_81.y = _2286;
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_83.x = _2314;
    out.m_83.y = _2342;
    out.m_83.z = _2344;
    float _2350 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2352 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_85.x = _2338;
    out.m_85.y = _2340;
    out.m_85.z = _2348;
    float _2354 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2350);
    float _2356 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2352);
    float _2358 = in.m_87.w;
    float _2360 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2354);
    float _2362 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2364 = in.m_87.z;
    float _2366 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2368 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2370 = 1.0 / _2366;
    float _2372 = _2368 + _2366;
    float _2374 = _2348;
    if (!_2302)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2376 = _2374;
    out.m_89.w = _2358;
    float _2378 = _2372 * _2370;
    float _2380 = _2378 * 0.5;
    out.m_89.z = _2364;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = in.m_87.x;
    float _2388 = 1.0 / _2384;
    float _2390 = _2364;
    float _2392 = _2376;
    float _2394 = _2376;
    if (!_2302)
    {
        _2390 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _2390;
    float _2398 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2400 = _2388 * _2398;
    float _2402 = abs(_2400);
    float _2404 = log2(_2402);
    out.m_89.x = _2386;
    bool _2406 = _2400 <= 8000.0;
    bool _2408 = isnan(_2400);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan(8000.0);
    bool _2414 = _2410 || _2412;
    float _2416 = float(_2414);
    float _2418 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2420 = exp2(_2418);
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    float _2426 = fma(_2424, -2.0, 3.0);
    float _2428 = _2424 * _2424;
    float _2430 = in.m_87.y;
    float _2432 = _2428 * _2426;
    float _2434 = in.m_71.x;
    float _2436 = -_2432;
    float _2438 = _2436 + 1.0;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2432);
    float _2442 = _2416 * _2440;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.y = _2430;
    float _2446 = _2430;
    float _2448 = _2396;
    float _2450 = _2396;
    if (!_2302)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2452 = _2446;
    float _2454 = -_2018;
    float _2456 = _2454 + 1.0;
    float _2458 = _2456 * _2444;
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = -_2460;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2466 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2133);
    float _2468 = _2464 * _2434;
    float _2470 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2466);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2474 = _2470 + _2002;
    out.gl_Position.x = _2036;
    out.gl_Position.y = _2028;
    out.gl_Position.z = _2470;
    out.gl_Position.w = _2002;
    out.m_91.x = _2472;
    float _2476 = _2240 * _2056;
    float _2478 = -_2240;
    float _2480 = _2478 + 1.0;
    float _2482 = _2067 * _2476;
    float _2484 = _2077 * _2476;
    float _2486 = _2067 * _2480;
    float _2488 = _2474;
    float _2490 = _2452;
    float _2492 = _2452;
    if (!_2302)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2494 = _2159;
    float _2496 = fma(_2073, _2482, _2061);
    float _2498 = fma(_2075, _2482, _2063);
    float _2500 = _2474 * 0.5;
    float _2502 = fma(_2067, _2484, _2065);
    float _2504 = _2494;
    float _2506 = _2494;
    if (!_2302)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2508 = _2488;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2302)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2514 = _2161;
    out.m_93.z = _2500;
    out.m_93.w = _2002;
    out.m_95.x = _2496;
    out.m_95.y = _2498;
    out.m_95.z = _2502;
    out.m_95.w = _2486;
    bool _2516 = !_2302;
    float _2518 = _2514;
    float _2520 = _2514;
    if (!_2516)
    {
        bool _2522 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2524 = isnan(_1756);
        bool _2526 = _2522 || _2524;
        bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2530 = _2526 || _2528;
        if (!_2530)
        {
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = _1756 + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2538 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = 1.0 / _2538;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2562 = _2534 * _2544;
            float _2564 = precise::clamp(_2562, 0.0, 1.0);
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2570 = fma(_2564, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2572 = fma(_2564, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2564, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2564, _2552, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2578 = fma(_2564, _2556, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2580 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2492 = _2574;
            _2506 = _2578;
            _2394 = _2570;
            _2512 = _2576;
            _2450 = _2572;
            _2520 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2586 = isnan(_1756);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2594 = _2392;
            _2394 = _2594;
            if (!_2592)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2596 = _2490;
            _2492 = _2596;
            if (!_2592)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2598 = _2448;
            _2450 = _2598;
            if (!_2592)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2600 = _2510;
            _2512 = _2600;
            if (!_2592)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2602 = _2504;
            _2506 = _2602;
            if (!_2592)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2604 = _2518;
            bool _2606 = !_2592;
            _2520 = _2604;
            if (!_2606)
            {
                bool _2608 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2610 = isnan(_1756);
                bool _2612 = _2608 || _2610;
                bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2616 = _2612 || _2614;
                if (!_2616)
                {
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2620 = _1756 + _2618;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = 1.0 / _2624;
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2648 = _2620 * _2630;
                    float _2650 = precise::clamp(_2648, 0.0, 1.0);
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2656 = fma(_2650, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2658 = fma(_2650, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2650, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2650, _2638, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2664 = fma(_2650, _2642, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2666 = fma(_2650, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2492 = _2660;
                    _2506 = _2664;
                    _2394 = _2656;
                    _2512 = _2662;
                    _2450 = _2658;
                    _2520 = _2666;
                    _2582 = true;
                }
                else
                {
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2582 = false;
    float _2668 = _2492;
    float _2670 = _2506;
    float _2672 = _2394;
    float _2674 = _2512;
    float _2676 = _2450;
    float _2678 = _2520;
    float _2680 = fma(_2342, -0.5, 0.5);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = -_2668;
    float _2686 = _2684 + _2670;
    float _2688 = -_2672;
    float _2690 = _2688 + _2674;
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    bool _2696 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2698 = fma(_2682, _2686, _2668);
    float _2700 = fma(_2682, _2690, _2672);
    float _2702 = fma(_2682, _2694, _2676);
    float _2704 = _2698 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2706 = fma(_2700, 0.298911988735198974609375, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2710 = fma(_2702, 0.114477999508380889892578125, _2706);
    out.m_91.w = _2708;
    float _2712 = -_2710;
    float _2714 = _2700 + _2712;
    float _2716 = -_2710;
    float _2718 = _2698 + _2716;
    float _2720 = -_2710;
    float _2722 = _2702 + _2720;
    out.m_97.x = 0.0;
    float _2724 = fma(_2714, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2728 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    out.m_99.x = 0.0;
    out.m_101.x = _2724;
    out.m_101.y = _2726;
    out.m_101.z = _2728;
    if (!_2696)
    {
        return out;
    }
    float _2730 = -_1724;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2734 = -_1726;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2738 = -_1728;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2742 = _2732 * _2732;
    float _2744 = fma(_2736, _2736, _2742);
    float _2746 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = fma(_2740, _2740, _2744);
    float _2752 = _2748 * _2748;
    float _2754 = rsqrt(_2750);
    float _2756 = _2732 * _2754;
    float _2758 = _2736 * _2754;
    float _2760 = _2740 * _2754;
    float _2762 = sqrt(_2750);
    float _2764 = -_1762;
    float _2766 = _2764 + _2756;
    float _2768 = -_1758;
    float _2770 = _2768 + _2758;
    float _2772 = -_1760;
    float _2774 = _2772 + _2760;
    float _2776 = _2766 * _2766;
    float _2778 = fma(_2770, _2770, _2776);
    float _2780 = fma(_2774, _2774, _2778);
    float _2782 = -_2762;
    float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2786 = rsqrt(_2780);
    float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2790 = precise::clamp(_2788, 0.0, 1.0);
    float _2792 = abs(_2790);
    float _2794 = log2(_2792);
    float _2796 = _2752 + (-1.0);
    float _2798 = _2766 * _2786;
    float _2800 = _2770 * _2786;
    float _2802 = _2774 * _2786;
    float _2804 = _2342 * _2798;
    float _2806 = _2342 * _2756;
    float _2808 = fma(_2314, _2800, _2804);
    float _2810 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2812 = fma(_2314, _2758, _2806);
    float _2814 = fma(_2344, _2802, _2808);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = fma(_2344, _2760, _2812);
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = exp2(_2810);
    float _2824 = _2816 * _2816;
    float _2826 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2828 = fma(_2824, _2796, 1.0);
    float _2830 = -_2756;
    float _2832 = -_2826;
    float _2834 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2832);
    float _2836 = _2828 * _2828;
    float _2838 = -_2760;
    float _2840 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2834);
    float _2842 = 1.0 / _2836;
    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2846 = _2840 + _2844;
    float _2848 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2822 * _2850;
    float _2854 = _2820 * _2852;
    float _2856 = _2752 * _2842;
    float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2860 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2862 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2864 = _2854 * _2856;
    float _2866 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2868 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2870 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2858;
    out.m_97.y = _2860;
    out.m_97.z = _2862;
    out.m_99.x = _2866;
    out.m_99.y = _2868;
    out.m_99.z = _2870;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2582 = false;
    bool _380 = false;
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
    float _128 = as_type<float>(_120);
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _126;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _130 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2928 = as_type<float>(_136);
        out.gl_Position.z = _2928;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_53.w;
    float _142 = float(_120);
    float _144 = -_140;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_140);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    bool _158 = _146 >= _142;
    bool _160 = !_156;
    bool _162 = _158 || _160;
    float _164 = _146;
    if (_162)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _128;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    if (_162)
    {
        float _168 = _166 * 5.0;
        _138 = as_type<int>(_168);
    }
    int _170 = _138;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2992 = as_type<float>(_170);
        out.gl_Position.z = _2992;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = 1.0 / _142;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _146 * _178;
    float _196 = _172 * _172;
    float _198 = _174 * _174;
    float _200 = fma(_182, _182, _196);
    float _202 = fma(_184, _184, _198);
    float _204 = fma(_188, _188, _200);
    float _206 = _176 * _176;
    float _208 = fma(_190, _190, _202);
    float _210 = sqrt(_204);
    float _212 = fma(_186, _186, _206);
    float _214 = fma(_192, _192, _212);
    float _216 = in.m_61.x;
    float _218 = in.m_61.y;
    float _220 = in.m_61.z;
    float _222 = sqrt(_208);
    float _224 = sqrt(_214);
    bool _226 = _210 > 0.0;
    bool _228 = _222 > 0.0;
    float _230 = 0.0;
    float _232 = _204;
    if (_226)
    {
        float _234 = rsqrt(_204);
        _230 = _234;
    }
    float _236 = _230;
    float _238 = _184 * _218;
    bool _240 = _224 > 0.0;
    float _242 = _174 * _218;
    float _244 = _190 * _218;
    float _246 = fma(_182, _216, _238);
    float _248 = 0.0;
    float _250 = 0.0;
    if (!_226)
    {
        _248 = 0.0;
        _250 = 0.0;
    }
    float _252 = _248;
    float _254 = _250;
    float _256 = fma(_172, _216, _242);
    float _258 = _224;
    float _260 = _252;
    float _262 = _254;
    if (_228)
    {
        float _264 = rsqrt(_208);
        _258 = _264;
    }
    float _266 = _258;
    float _268 = fma(_188, _216, _244);
    float _270 = 0.0;
    float _272 = 0.0;
    if (!_228)
    {
        _270 = 0.0;
        _272 = 0.0;
    }
    float _274 = _270;
    float _276 = _272;
    float _278 = 0.0;
    float _280 = _274;
    float _282 = _276;
    if (!_226)
    {
        _278 = 0.0;
    }
    float _284 = _278;
    float _286 = fma(_186, _220, _246);
    float _288 = 0.0;
    float _290 = _284;
    float _292 = _286;
    if (!_228)
    {
        _288 = 0.0;
    }
    float _294 = _288;
    float _296 = fma(_176, _220, _256);
    float _298 = 0.0;
    float _300 = 0.0;
    float _302 = _294;
    if (!_240)
    {
        _298 = 0.0;
        _300 = 0.0;
    }
    float _304 = _298;
    float _306 = _300;
    float _308 = 0.0;
    float _310 = _306;
    float _312 = _304;
    if (_240)
    {
        float _314 = rsqrt(_214);
        _308 = _314;
    }
    float _316 = _308;
    if (!_240)
    {
        _232 = 0.0;
    }
    float _318 = _232;
    float _320 = fma(_192, _220, _268);
    float _322 = _318;
    if (_226)
    {
        float _324 = _236 * _172;
        _290 = _324;
    }
    float _326 = _290;
    if (_226)
    {
        float _328 = _236 * _182;
        _260 = _328;
    }
    float _330 = _260;
    if (_226)
    {
        float _332 = _236 * _188;
        _262 = _332;
    }
    float _334 = _262;
    if (_228)
    {
        float _336 = _266 * _174;
        _302 = _336;
    }
    float _338 = _302;
    if (_228)
    {
        float _340 = _266 * _184;
        _280 = _340;
    }
    float _342 = _280;
    if (_228)
    {
        float _344 = _266 * _190;
        _282 = _344;
    }
    float _346 = _282;
    if (_240)
    {
        float _348 = _316 * _176;
        _310 = _348;
    }
    float _350 = _310;
    if (_240)
    {
        float _352 = _316 * _186;
        _312 = _352;
    }
    float _354 = _312;
    if (_240)
    {
        float _356 = _316 * _192;
        _322 = _356;
    }
    float _358 = _322;
    bool _360 = !_180;
    float _378;
    if (!_360)
    {
        float _362 = in.m_63.x;
        float _364 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _366 = _362 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _368 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
        float _370 = _368 * _364;
        float _372 = floor(_370);
        float _374 = -_372;
        float _376 = _370 + _374;
        _378 = _376;
        _380 = true;
    }
    else
    {
        _378 = _194;
    }
    _380 = false;
    float _382 = _378;
    float _384 = in.m_63.z;
    float _386 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _388 = log2(_386);
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _382 + _390;
    float _394 = in.m_48.x;
    float _396 = in.m_48.y;
    float _398 = in.m_48.z;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _408 = in.m_63.y;
    float _410 = -_194;
    float _412 = _410 + 1.0;
    float _414 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _416;
    bool _420 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _422 = isnan(0.0);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _428 = _424 || _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _432 = _382 + _430;
    float _434 = in.m_59.w;
    float _436 = 1.0 / _406;
    float _438 = _388 * _146;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = _384 * 2.0;
    float _450 = 1.0 / _402;
    float _452 = _194 * _414;
    float _454 = precise::clamp(_452, 0.0, 1.0);
    float _456 = _184 * _396;
    float _458 = _190 * _396;
    float _460 = _412 * _414;
    float _462 = precise::clamp(_460, 0.0, 1.0);
    float _464 = fma(_182, _394, _456);
    float _466 = fma(_188, _394, _458);
    float _468 = floor(_448);
    float _470 = _392 * _436;
    float _472 = in.m_63.x;
    float _474 = fma(_186, _398, _464);
    float _476 = _408 * 2.0;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _480 = 1.0 + _478;
    float _482 = exp2(_438);
    bool _484 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _492 = _488 || _490;
    float _494 = fma(_192, _398, _466);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[191].w * (-0.199999988079071044921875);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _500 = _382 + _498;
    float _502 = precise::min(_454, _462);
    float _504 = _432 * _450;
    float _506 = fma(_496, _408, (*spvDescriptorSet0.vp_c9)._m0[191].w);
    float _508 = floor(_476);
    bool _510 = _468 > 0.0;
    float _512 = fma(_442, _504, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _514 = _468 >= 0.0;
    bool _516 = isnan(_468);
    bool _518 = _514 || _516;
    bool _520 = isnan(0.0);
    bool _522 = _518 || _520;
    float _524 = _506 * _146;
    float _526 = fma(_446, _470, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _528 = _522 ? 0 : 1;
    float _530 = 1.0 / _418;
    float _532 = -_482;
    float _534 = _532 + 1.0;
    int _536 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 4096;
    bool _538 = _536 != 0;
    int _540 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 8192;
    bool _542 = _540 != 0;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 16384;
    bool _546 = _544 != 0;
    float _548 = _472 + _384;
    int _550 = ~_528;
    int _552 = _550 + 1;
    int _554 = _552 + 1;
    float _556 = fma(_472, 6.283185482025146484375, _524);
    float _558 = _428 ? _534 : 0.0;
    float _560 = _548 + (-1.0);
    float _562 = 1.0 / _480;
    int _564 = _554;
    if (!_510)
    {
        int _566 = ~_528;
        int _568 = _566 + 1;
        _564 = _568;
    }
    int _570 = _564;
    float _572 = _472 * 2.0;
    int _574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _576 = _574 != 0;
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _580 = _578 != 0;
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _584 = !_542;
    int _586 = _584 ? 0 : 1;
    float _588 = _556 * 0.15915493667125701904296875;
    bool _590 = _508 >= 0.0;
    bool _592 = isnan(_508);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = _500 * _530;
    bool _602 = !_538;
    int _604 = _602 ? 0 : 1;
    float _606 = floor(_572);
    int _608 = _598 ? 0 : 1;
    float _610 = -_502;
    float _612 = _610 + 1.0;
    int _614 = ~_608;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    int _620 = _618;
    if (_492)
    {
        float _622 = _558 * _562;
        _164 = _622;
    }
    float _624 = _164;
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 262144;
    bool _628 = _626 != 0;
    int _630 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 524288;
    bool _632 = _630 != 0;
    int _634 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1048576;
    bool _636 = _634 != 0;
    float _638 = _472 + _408;
    bool _640 = _508 > 0.0;
    float _642 = _408 + _384;
    float _644 = _638 + (-1.0);
    bool _646 = !_546;
    int _648 = _646 ? 0 : 1;
    float _650 = _642 + (-1.0);
    bool _652 = !_636;
    int _654 = _652 ? 0 : 1;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _658 = !_576;
    int _660 = _658 ? 0 : 1;
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].x;
    float _666 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    if (!_640)
    {
        int _668 = ~_608;
        int _670 = _668 + 1;
        _620 = _670;
    }
    int _672 = _620;
    float _674 = _384 + (-0.5);
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _686 = _684 != 0;
    float _688 = in.m_57.w;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _690;
    bool _694 = _606 >= 0.0;
    bool _696 = isnan(_606);
    bool _698 = _694 || _696;
    bool _700 = isnan(0.0);
    bool _702 = _698 || _700;
    float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    bool _706 = !_678;
    int _708 = _706 ? 0 : 1;
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _710;
    int _714 = _702 ? 0 : 1;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _720 = _606 > 0.0;
    float _722 = fma(_712, _504, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _724 = fma(_692, _504, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _728 = _726 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _730;
    float _734 = fma(_718, _470, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _736;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _740;
    float _744 = fma(_728, _470, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _746 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _748 = isnan(_382);
    bool _750 = _746 || _748;
    bool _752 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _754 = _750 || _752;
    float _756 = float(_754);
    float _758 = fma(_738, _600, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _760 = fma(_742, _600, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _762 = fma(_732, _600, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _764 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].x;
    bool _766 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _768 = isnan(_382);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].z;
    float _780 = _474 + _688;
    float _782 = _764 * _664;
    bool _784 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _786 = isnan(_382);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = -_776;
    float _798 = _796 + 1.0;
    float _800 = -_756;
    float _802 = _800 + 1.0;
    float _804 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].x, _782);
    float _806 = _666 * _704;
    float _808 = _756 * _798;
    bool _810 = _382 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _812 = isnan(_382);
    bool _814 = _810 || _812;
    bool _816 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _818 = _814 || _816;
    float _820 = float(_818);
    float _822 = floor(_804);
    float _824 = _794 * _802;
    float _826 = -_794;
    float _828 = _826 + 1.0;
    float _830 = _624 + (*spvDescriptorSet0.vp_c9)._m0[202].z;
    float _832 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].y, _806);
    float _834 = _494 + _434;
    float _836 = _820 * _828;
    float _838 = _830 * _778;
    float _840 = -_820;
    float _842 = _840 + 1.0;
    float _844 = floor(_832);
    float _846 = _722 * _836;
    float _848 = _512 * _836;
    float _850 = fma(_472, (*spvDescriptorSet0.vp_c9)._m0[203].z, _838);
    int _852 = ~_714;
    int _854 = _852 + 1;
    int _856 = _854 + 1;
    float _858 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].x, _846);
    int _860 = _856;
    if (!_720)
    {
        int _862 = ~_714;
        int _864 = _862 + 1;
        _860 = _864;
    }
    int _866 = _860;
    float _868 = _724 * _836;
    float _870 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].y, _848);
    float _872 = -_822;
    float _874 = _804 + _872;
    float _876 = _804 + 0.25;
    float _878 = fma(_734, _824, _858);
    float _880 = _832 + 0.25;
    float _882 = fma(_526, _824, _870);
    float _884 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[143].z, _868);
    float _886 = floor(_876);
    float _888 = fma(_758, _808, _878);
    bool _890 = _874 >= 0.5;
    bool _892 = isnan(_874);
    bool _894 = _890 || _892;
    bool _896 = isnan(0.5);
    bool _898 = _894 || _896;
    float _900 = fma(_744, _824, _884);
    bool _902 = !_682;
    int _904 = _902 ? 0 : 1;
    float _906 = _804 * 6.283185482025146484375;
    int _908 = abs(_708);
    float _910 = fma(_760, _808, _882);
    float _912 = floor(_880);
    int _914 = abs(_904);
    float _916 = fma(_762, _808, _900);
    float _918 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].x, _888);
    float _920 = float(_866);
    float _922 = -_844;
    float _924 = _832 + _922;
    float _926 = floor(_850);
    float _928 = float(_570);
    float _930 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].z, _916);
    float _932 = float(_908);
    bool _934 = !_898;
    float _936 = _934 ? 0.5 : (-0.5);
    bool _938 = _924 >= 0.5;
    bool _940 = isnan(_924);
    bool _942 = _938 || _940;
    bool _944 = isnan(0.5);
    bool _946 = _942 || _944;
    float _948 = _932 * _928;
    float _950 = -_886;
    float _952 = _876 + _950;
    float _954 = -_912;
    float _956 = _880 + _954;
    bool _958 = !_946;
    float _960 = _958 ? 0.5 : (-0.5);
    float _962 = _948 * (-2.0);
    int _964 = abs(_586);
    float _966 = _588 * 6.283185482025146484375;
    float _968 = sin(_966);
    int _970 = abs(_660);
    float _972 = -_926;
    float _974 = _850 + _972;
    float _976 = _936 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _978 = _976 * 2.0;
    float _980 = _960 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _982 = _980 * 2.0;
    float _984 = _906 * 0.15915493667125701904296875;
    bool _986 = !_632;
    int _988 = _986 ? 0 : 1;
    bool _990 = _974 >= 0.5;
    bool _992 = isnan(_974);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    float _1000 = float(_970);
    float _1002 = _984 * 6.283185482025146484375;
    float _1004 = sin(_1002);
    int _1006 = abs(_988);
    float _1008 = _832 * 6.283185482025146484375;
    float _1010 = float(_964);
    float _1012 = _1000 * _982;
    int _1014 = abs(_604);
    float _1016 = _1008 * 0.15915493667125701904296875;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _1020 = _1018 != 0;
    float _1022 = _1010 * _978;
    bool _1024 = _952 > 0.5;
    float _1026 = in.m_65.x;
    float _1028 = in.m_65.y;
    float _1030 = in.m_65.z;
    bool _1032 = !_998;
    float _1034 = _1032 ? 0.5 : (-0.5);
    float _1036 = _1016 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    bool _1040 = !_1020;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = abs(_968);
    float _1046 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1048 = float(_1006);
    float _1050 = _1034 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1052 = _1050 * 2.0;
    float _1054 = float(_1014);
    float _1056 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1058 = _850 + 0.25;
    int _1060 = abs(_1042);
    float _1062 = fma(_1054, _1056, _1022);
    float _1064 = _952;
    float _1066 = _956;
    if (_1024)
    {
        float _1068 = -_952;
        float _1070 = _1068 + 1.0;
        _1064 = _1070;
    }
    float _1072 = _1064;
    float _1074 = floor(_1058);
    float _1076 = _850 * 6.283185482025146484375;
    bool _1078 = _956 > 0.5;
    float _1080 = fma(_1072, 4.0, -1.0);
    int _1082 = abs(_648);
    float _1084 = _1038 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1086 = float(_1060);
    float _1088 = _1076 * 0.15915493667125701904296875;
    bool _1090 = !_580;
    int _1092 = _1090 ? 0 : 1;
    float _1094 = _1048 * _1052;
    float _1096 = float(_1082);
    float _1098 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[200].x;
    float _1100 = fma(_1086, _1084, _1012);
    int _1102 = abs(_1092);
    float _1104 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[191].y, _1046);
    float _1106 = _1088 * 6.283185482025146484375;
    float _1108 = sin(_1106);
    float _1110 = fma(_1096, _1098, _1062);
    if (_1078)
    {
        float _1112 = -_956;
        float _1114 = _1112 + 1.0;
        _1066 = _1114;
    }
    float _1116 = _1066;
    float _1118 = -_1074;
    float _1120 = _1058 + _1118;
    bool _1122 = !_628;
    int _1124 = _1122 ? 0 : 1;
    float _1126 = fma(_1110, 3.1415927410125732421875, _1026);
    float _1128 = fma(_1116, 4.0, -1.0);
    int _1130 = abs(_1124);
    float _1132 = fma(_656, _962, _656);
    float _1134 = float(_1102);
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    bool _1138 = _1120 > 0.5;
    float _1140 = fma(_1126, _962, _1126);
    float _1142 = float(_1130);
    float _1144 = fma(_1134, _1136, _1100);
    float _1146 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1148 = float(_914);
    float _1150 = _472 + (-0.5);
    float _1152 = fma(_1144, 3.1415927410125732421875, _1028);
    float _1154 = fma(_1142, _1146, _1094);
    int _1156 = abs(_654);
    float _1158 = _834 * _834;
    bool _1160 = !_686;
    int _1162 = _1160 ? 0 : 1;
    float _1164 = _1148 * _920;
    float _1166 = _1120;
    if (_1138)
    {
        float _1168 = -_1120;
        float _1170 = _1168 + 1.0;
        _1166 = _1170;
    }
    float _1172 = _1166;
    float _1174 = fma(_780, _780, _1158);
    int _1176 = abs(_1162);
    float _1178 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1140);
    float _1180 = fma(_1172, 4.0, -1.0);
    float _1182 = float(_672);
    float _1184 = in.m_67.y;
    float _1186 = _1164 * (-2.0);
    float _1188 = float(_1156);
    float _1190 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[200].z;
    float _1192 = fma(_1132, _624, _1178);
    float _1194 = _408 + (-0.5);
    float _1196 = fma(_1152, _1186, _1152);
    float _1198 = float(_1176);
    float _1200 = fma(_1188, _1190, _1154);
    float _1202 = fma(_662, _1186, _662);
    float _1204 = fma(_1194, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1196);
    float _1206 = in.m_67.x;
    float _1208 = fma(_1200, 3.1415927410125732421875, _1030);
    float _1210 = _1198 * _1182;
    float _1212 = fma(_1202, _624, _1204);
    float _1214 = in.m_69.x;
    float _1216 = in.m_69.y;
    float _1218 = in.m_69.z;
    float _1220 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[146].y, _910);
    float _1222 = _1210 * (-2.0);
    float _1224 = _1192 * 0.15915493667125701904296875;
    float _1226 = in.m_67.z;
    float _1228 = _1212 * 0.15915493667125701904296875;
    float _1230 = fma(_582, _1222, _582);
    float _1232 = fma(_1208, _1222, _1208);
    float _1234 = sqrt(_1174);
    float _1236 = -_1104;
    float _1238 = _1236 + _1184;
    float _1240 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1232);
    float _1242 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1238);
    float _1244 = fma(_1230, _624, _1240);
    float _1246 = _1224 * 6.283185482025146484375;
    float _1248 = sin(_1246);
    float _1250 = _1244 * 0.15915493667125701904296875;
    float _1252 = _1220 * _1216;
    float _1254 = _1224 * 6.283185482025146484375;
    float _1256 = cos(_1254);
    float _1258 = _918 * _1214;
    float _1260 = _930 * _1218;
    float _1262 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1206);
    float _1264 = _572 + (-1.0);
    float _1266 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1268 = _1252 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1226);
    float _1272 = _1228 * 6.283185482025146484375;
    float _1274 = sin(_1272);
    float _1276 = _1266 * _1262;
    float _1278 = _1264 * _1234;
    float _1280 = _1268 * _1242;
    float _1282 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1284 = _1278 * 0.75;
    float _1286 = _1228 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    float _1290 = _1282 * _1270;
    float _1292 = _1250 * 6.283185482025146484375;
    float _1294 = cos(_1292);
    float _1296 = _1248 * _1274;
    float _1298 = _1256 * _1274;
    float _1300 = _1250 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = _1256 * _1288;
    float _1306 = _1248 * _1288;
    float _1308 = _1256 * _1294;
    float _1310 = _1248 * _1294;
    float _1312 = _1288 * _1294;
    float _1314 = _1284 * 0.15915493667125701904296875;
    float _1316 = _1308 * _1280;
    float _1318 = _1310 * _1280;
    float _1320 = _1274 * _1294;
    float _1322 = _1314 * 6.283185482025146484375;
    float _1324 = sin(_1322);
    float _1326 = fma(_1302, _1304, _1296);
    float _1328 = -_1298;
    float _1330 = fma(_1302, _1306, _1328);
    float _1332 = -_1306;
    float _1334 = fma(_1302, _1298, _1332);
    float _1336 = -_1280;
    float _1338 = _1302 * _1336;
    float _1340 = fma(_1326, _1276, _1316);
    float _1342 = fma(_1330, _1276, _1318);
    float _1344 = fma(_1302, _1296, _1304);
    float _1346 = fma(_1312, _1276, _1338);
    float _1348 = fma(_1334, _1290, _1340);
    float _1350 = _1314 * 6.283185482025146484375;
    float _1352 = cos(_1350);
    float _1354 = fma(_1344, _1290, _1342);
    float _1356 = fma(_1320, _1290, _1346);
    float _1358 = _1348 * _342;
    float _1360 = _1348 * _346;
    float _1362 = _1348 * _338;
    float _1364 = fma(_1356, _330, _1358);
    float _1366 = fma(_1356, _334, _1360);
    float _1368 = fma(_1356, _326, _1362);
    float _1370 = fma(_1354, _354, _1364);
    float _1372 = fma(_1354, _358, _1366);
    float _1374 = fma(_1354, _350, _1368);
    float _1376 = _1370 * _1324;
    float _1378 = _1370 * _1352;
    float _1380 = -_1376;
    float _1382 = fma(_1372, _1352, _1380);
    float _1384 = fma(_1372, _1324, _1378);
    float _1386 = _834 + _1382;
    float _1388 = _780 + _1384;
    float _1390 = in.m_71.y;
    float _1392 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1394 = _1386 + _1392;
    float _1396 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1398 = _1388 + _1396;
    float _1400 = _1394 * _1394;
    float _1402 = fma(_1398, _1398, _1400);
    float _1404 = sqrt(_1402);
    float _1406 = _396 + _1390;
    float _1408 = _1406 + _1374;
    bool _1410 = _1404 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1414 = _1404 + _1412;
    float _1416 = _1324;
    float _1418 = _1368;
    float _1420 = _1356;
    float _1422 = _1404;
    float _1424 = _1314;
    float _1426 = _1408;
    float _1428 = _1406;
    float _1430 = _1184;
    if (_1410)
    {
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1416 = _1432;
    }
    float _1434 = _1416;
    if (_1410)
    {
        float _1436 = _1408 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1418 = _1436;
    }
    float _1438 = _1418;
    float _1440 = _1438;
    if (!_1410)
    {
        _1420 = _1388;
    }
    float _1442 = _1420;
    float _1444 = _1434;
    float _1446 = _1442;
    if (_1410)
    {
        float _1448 = _1414 * _1434;
        _1422 = _1448;
    }
    float _1450 = _1422;
    if (_1410)
    {
        float _1452 = rsqrt(_1402);
        _1444 = _1452;
    }
    float _1454 = _1444;
    float _1456 = _1454;
    if (_1410)
    {
        float _1458 = _1450 * 0.15915493667125701904296875;
        _1424 = _1458;
    }
    float _1460 = _1424;
    float _1462 = _1450;
    if (_1410)
    {
        float _1464 = _1460 * 6.283185482025146484375;
        float _1466 = sin(_1464);
        _1462 = _1466;
    }
    float _1468 = _1462;
    float _1470 = _1468;
    if (_1410)
    {
        float _1472 = fma(_1468, _1438, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1440 = _1472;
    }
    float _1474 = _1440;
    float _1476 = _1474;
    if (!_1410)
    {
        _1470 = _1386;
    }
    float _1478 = _1470;
    float _1480 = _1478;
    if (_1410)
    {
        float _1482 = _1454 * _1474;
        _1476 = _1482;
    }
    float _1484 = _1476;
    if (_1410)
    {
        float _1486 = fma(_1394, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1480 = _1486;
    }
    float _1488 = _1480;
    float _1490 = _1488;
    if (_1410)
    {
        float _1492 = fma(_1398, _1484, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1446 = _1492;
    }
    float _1494 = _1446;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1498 = _1488 + _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1502 = _1494 + _1500;
    float _1504 = fma(_1498, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1506 = fma(_1502, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4904 = float2(_1506, _1504);
    float _1508 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4904, float2(0.0), isnan(_4904)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4904, float2(0.0), isnan(_4904)), level(0.0)).x;
    float _1510 = _1502;
    float _1512 = _1494;
    if (_1410)
    {
        float _1514 = _1460 * 6.283185482025146484375;
        float _1516 = cos(_1514);
        _1510 = _1516;
    }
    float _1518 = _1510;
    float _1520 = -_780;
    float _1522 = _1520 + _1494;
    float _1524 = -_834;
    float _1526 = _1524 + _1488;
    bool _1528 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1530 = isnan(0.5);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1536 = _1532 || _1534;
    if (_1410)
    {
        float _1538 = _1518 + (-1.0);
        _1456 = _1538;
    }
    float _1540 = _1456;
    float _1542 = _1540;
    if (_1410)
    {
        float _1544 = _1540 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1542 = _1544;
    }
    float _1546 = _1542;
    if (_1410)
    {
        float _1548 = fma(_1408, _1518, _1546);
        _1426 = _1548;
    }
    float _1550 = _1426;
    float _1552 = -_1406;
    float _1554 = _1552 + _1550;
    float _1556 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1558 = _1554 * _1554;
    float _1560 = floor(_1556);
    float _1562 = fma(_1522, _1522, _1558);
    float _1564 = fma(_1526, _1526, _1562);
    float _1566 = fma(_780, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1568 = sqrt(_1564);
    float _1570 = -_1560;
    float _1572 = _1556 + _1570;
    float _1574 = floor(_1566);
    bool _1576 = _1568 > 0.0;
    float _1578 = -_1574;
    float _1580 = _1566 + _1578;
    float _1582 = fma(_1508, 100.0, _1550);
    float _1584 = fma(_1508, 100.0, _1406);
    float _1586 = _1556;
    float _1588 = _1568;
    float _1590 = _1508;
    float _1592 = _1564;
    if (!_1576)
    {
        _1428 = _1582;
    }
    float _1594 = _1428;
    bool _1596 = !_1576;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = _296 * _296;
        float _1602 = rsqrt(_1564);
        float _1604 = fma(_286, _286, _1600);
        float _1606 = fma(_320, _320, _1604);
        float _1608 = sqrt(_1606);
        float _1610 = _1522 * _1602;
        float _1612 = _1554 * _1602;
        float _1614 = _1526 * _1602;
        bool _1616 = _1608 > 0.0;
        float _1618 = _1602;
        _1586 = _1612;
        if (!_1616)
        {
            _1618 = _1582;
        }
        float _1620 = _1618;
        bool _1622 = !_1616;
        _1598 = _1620;
        if (!_1622)
        {
            float _1624 = rsqrt(_1606);
            float _1626 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1628 = _296 * _1624;
            float _1630 = _286 * _1624;
            float _1632 = _1612 * _1628;
            float _1634 = _320 * _1624;
            float _1636 = fma(_1610, _1630, _1632);
            float _1638 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1640 = fma(_1614, _1634, _1636);
            float _1642 = _1640 * _1638;
            float _1644 = fma(_286, _1642, _1494);
            float _1646 = fma(_296, _1642, _1582);
            float _1648 = fma(_320, _1642, _1488);
            _1586 = _1636;
            _1512 = _1644;
            _1598 = _1646;
            _1490 = _1648;
            _1588 = _1638;
            _1590 = _1626;
        }
    }
    float _1650 = _1586;
    float _1652 = _1512;
    float _1654 = _1598;
    float _1656 = _1490;
    float _1658 = _1588;
    float _1660 = _1590;
    float _1662 = _1654;
    float _1664 = _1652;
    float _1666 = _1656;
    float _1668 = _1658;
    float _1670 = _1650;
    float _1672 = _1660;
    if (!_1536)
    {
        float _1674 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1676 = _1584 + _1674;
        float _1678 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1680 = _780 + _1678;
        float _1682 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1684 = -_780;
        float _1686 = _1684 + _1652;
        float _1688 = _1676 * _1676;
        float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1692 = _834 + _1690;
        float _1694 = -_1584;
        float _1696 = _1694 + _1654;
        float _1698 = -_834;
        float _1700 = _1698 + _1656;
        float _1702 = fma(_1680, _1680, _1688);
        float _1704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1706 = fma(_1692, _1692, _1702);
        float _1708 = sqrt(_1706);
        float _1710 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1712 = precise::min(_1708, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1714 = _1712 * _1704;
        float _1716 = _1710 * _1714;
        float _1718 = fma(_1686, _1716, _780);
        float _1720 = fma(_1696, _1716, _1584);
        float _1722 = fma(_1700, _1716, _834);
        _1662 = _1720;
        _1664 = _1718;
        _1666 = _1722;
        _292 = _1712;
        _1668 = _1704;
        _1670 = _1714;
    }
    float _1724 = _1662;
    float _1726 = _1664;
    float _1728 = _1666;
    float _1730 = _292;
    float _1732 = _1668;
    float _1734 = _1670;
    float _1736 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1738 = _1724 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1742 = _1726 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1746 = _1728 + _1744;
    float _1748 = _1738 * _1738;
    float _1750 = fma(_1742, _1742, _1748);
    float _1752 = fma(_1746, _1746, _1750);
    float _1754 = rsqrt(_1752);
    float _1756 = sqrt(_1752);
    float _1758 = _1742 * _1754;
    float _1760 = _1746 * _1754;
    float _1762 = _1738 * _1754;
    float _1764 = _1758 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1766 = _1760 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1768 = _1764 * _1764;
    float _1770 = _1766 * _1766;
    float _1772 = _1768 + _1770;
    float _1774 = sqrt(_1772);
    bool _1776 = _1774 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1778 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1780 = _1774 + _1778;
    float _1782 = _1730;
    float _1784 = _1780;
    float _1786 = _1732;
    if (_1776)
    {
        float _1788 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1782 = _1788;
    }
    float _1790 = _1782;
    if (_1776)
    {
        float _1792 = rsqrt(_1772);
        _1672 = _1792;
    }
    float _1794 = _1672;
    float _1796 = _1794;
    if (_1776)
    {
        float _1798 = _1780 * _1790;
        _1784 = _1798;
    }
    float _1800 = _1784;
    if (_1776)
    {
        float _1802 = _1800 * 0.15915493667125701904296875;
        _1786 = _1802;
    }
    float _1804 = _1786;
    float _1806 = _1790;
    if (_1776)
    {
        float _1808 = _1804 * 6.283185482025146484375;
        float _1810 = sin(_1808);
        _1806 = _1810;
    }
    float _1812 = _1806;
    float _1814 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1816 = precise::max(0.0, _1814);
    float _1818 = _1734;
    float _1820 = _1814;
    float _1822 = _1816;
    if (_1776)
    {
        float _1824 = _1804 * 6.283185482025146484375;
        float _1826 = cos(_1824);
        _1818 = _1826;
    }
    float _1828 = _1818;
    float _1830 = -_1762;
    float _1832 = -_1816;
    float _1834 = fma(_1830, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1832);
    if (_1776)
    {
        float _1836 = _1834 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1820 = _1836;
    }
    float _1838 = _1820;
    float _1840 = _1838;
    float _1842 = _1812;
    if (_1776)
    {
        float _1844 = fma(_1812, _1838, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1840 = _1844;
    }
    float _1846 = _1840;
    float _1848 = _1846;
    if (!_1776)
    {
        _1842 = _1764;
    }
    float _1850 = _1842;
    float _1852 = _1850;
    float _1854 = _1828;
    if (_1776)
    {
        float _1856 = _1828 + (-1.0);
        _1822 = _1856;
    }
    float _1858 = _1822;
    float _1860 = _1858;
    if (_1776)
    {
        float _1862 = _1794 * _1846;
        _1592 = _1862;
    }
    float _1864 = _1592;
    if (!_1776)
    {
        _1848 = _1834;
    }
    float _1866 = _1848;
    float _1868 = _1866;
    if (_1776)
    {
        float _1870 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1796 = _1870;
    }
    float _1872 = _1796;
    float _1874 = _1872;
    if (_1776)
    {
        float _1876 = _1764 * _1864;
        _1852 = _1876;
    }
    float _1878 = _1852;
    if (!_1776)
    {
        _1860 = _1766;
    }
    float _1880 = _1860;
    float _1882 = _1880;
    if (_1776)
    {
        float _1884 = _1766 * _1864;
        _1882 = _1884;
    }
    float _1886 = _1882;
    if (_1776)
    {
        float _1888 = fma(_1834, _1828, _1872);
        _1868 = _1888;
    }
    float _1890 = _1868;
    if (!_1776)
    {
        _1874 = _1768;
    }
    float _1892 = _1874;
    float _1894 = _1892;
    if (_1776)
    {
        float _1896 = _1878 * _1878;
        _1894 = _1896;
    }
    float _1898 = _1894;
    float _1900 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_1776)
    {
        _1854 = _1770;
    }
    float _1902 = _1854;
    float _1904 = _1902;
    if (_1776)
    {
        float _1906 = _1886 * _1886;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1890, _1890, _1898);
    float _1912 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1900);
    float _1914 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1916 = _1910 + _1908;
    float _1918 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1912);
    float _1920 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1922 = fma(_1756, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1920);
    float _1924 = precise::clamp(_1922, 0.0, 1.0);
    float _1926 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1914);
    float _1928 = _1918 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1930 = rsqrt(_1916);
    float _1932 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1934 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1936 = _1928 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1938 = -_1924;
    float _1940 = _1938 + 1.0;
    float _1942 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1926);
    float _1944 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1934);
    float _1946 = -_1936;
    float _1948 = fma(_1946, _1932, 1.0);
    float _1950 = _1724 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1952 = abs(_1940);
    float _1954 = log2(_1952);
    float _1956 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1944);
    float _1958 = _1942 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1960 = fma(_1726, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1950);
    float _1962 = _1956 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1964 = _1930 * _1878;
    float _1966 = fma(_1728, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1960);
    float _1968 = _1930 * _1890;
    float _1970 = _1930 * _1886;
    float _1972 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = _1966 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1978 = log2(_1948);
    float _1980 = -_1972;
    float _1982 = fma(_1968, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1980);
    float _1984 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1986 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1976);
    float _1988 = _1968 + 1.0;
    float _1990 = -_1970;
    float _1992 = fma(_1990, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1982);
    float _1994 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1986);
    float _1996 = exp2(_1984);
    float _1998 = fma(_1992, -0.5, 0.5);
    float _2000 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1994);
    float _2004 = fma(_1992, 0.5, 0.5);
    float _2006 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2008 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2000);
    float _2010 = 1.0 / _2002;
    float _2012 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2006);
    float _2014 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2008);
    float _2016 = fma(_2004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float2 _5721 = float2(_1580, _1572);
    float _2018 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5721, float2(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5721, float2(0.0), isnan(_5721)), level(0.0)).x;
    float _2020 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2012);
    float _2022 = _1978 * 0.693147182464599609375;
    float _2024 = fma(_2004, _2016, -0.212114393711090087890625);
    float _2026 = sqrt(_1998);
    float _2028 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2020);
    float _2030 = fma(_2004, _2024, 1.570728778839111328125);
    float _2032 = -_1968;
    float _2034 = fma(_1996, _1988, _2032);
    float _2036 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2014);
    float _2038 = _2028 * _2010;
    float _2040 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2042 = _2036 * _2010;
    float _2044 = fma(_2034, 0.5, 0.5);
    float _2046 = _2026 * 0.636619746685028076171875;
    float _2048 = fma(_2042, 0.5, 0.5);
    float _2050 = fma(_2038, -0.5, 0.5);
    float _2052 = -_2030;
    float _2054 = fma(_2046, _2052, 1.0);
    float3 _5788 = float3(_2048, _2050, _2040);
    float _2056 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5788, float3(0.0), isnan(_5788)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5788, float3(0.0), isnan(_5788)), level(0.0)).x;
    float3 _5799 = float3(_2048, _2050, _2040);
    float4 _2059 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5799, float3(0.0), isnan(_5799)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5799, float3(0.0), isnan(_5799)), level(0.0)).xyzw;
    float _2061 = _2059.x;
    float _2063 = _2059.y;
    float _2065 = _2059.z;
    float _2067 = _2059.w;
    float2 _5815 = float2(_2054, _2044);
    float3 _2071 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5815, float2(0.0), isnan(_5815)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5815, float2(0.0), isnan(_5815)), level(0.0)).xyz;
    float _2073 = _2071.x;
    float _2075 = _2071.y;
    float _2077 = _2071.z;
    float _2079 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _2081 = in.m_73.x;
    float _2083 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2085 = _1954 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2087 = -_1104;
    float _2089 = -_1184;
    bool _2091 = _2087 != _2089;
    bool _2093 = isnan(_2087);
    bool _2095 = _2091 || _2093;
    bool _2097 = isnan(_2089);
    bool _2099 = _2095 || _2097;
    float _2101 = _2079 * _472;
    bool _2103 = _408 > 0.5;
    float _2105 = _2083 * _472;
    bool _2107 = _1206 == 0.0;
    bool _2109 = !_2099;
    bool _2111 = _2107 && _2109;
    float _2113 = in.m_73.y;
    float _2115 = trunc(_2101);
    int _2117 = int(_2115);
    bool _2119 = _1226 == 0.0;
    bool _2121 = _2119 && _2111;
    float _2123 = _1962 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2127 = _2125 != 0;
    out.m_75.x = _1726;
    out.m_75.y = _1724;
    out.m_75.z = _1728;
    int _2129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2131 = _2129 != 0;
    float _2133 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2123);
    bool _2135 = _472 > 0.5;
    bool _2137 = _2135 && _2127;
    float _2139 = trunc(_2105);
    int _2141 = int(_2139);
    float _2143 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2145 = _2117 << 4;
    int _2147 = _2145 + 1712;
    float _2149 = exp2(_2085);
    float _2151 = in.m_77.x;
    float _2153 = in.m_77.y;
    float _2155 = in.m_77.z;
    float _2157 = _2081;
    float _2159 = _2028;
    float _2161 = _2036;
    if (!_2127)
    {
        _1430 = _2081;
    }
    float _2163 = _1430;
    int _2165 = _2147 + 8;
    uint _2168 = uint(int(uint(_2165) >> uint(2)));
    uint _2170 = uint(int(uint(int(_2168)) >> uint(2)));
    int _2172 = int(_2168) & 3;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[int(_2170)][_2172];
    float _2176 = _2163;
    if (_2137)
    {
        float _2178 = -_2081;
        float _2180 = _2178 + 1.0;
        _2157 = _2180;
    }
    float _2182 = _2157;
    float _2184 = -_2113;
    float _2186 = _2184 + 1.0;
    int _2188 = _2141 << 4;
    int _2190 = _2188 + 1968;
    float _2192 = _2113;
    if (_2127)
    {
        _2176 = _2182;
    }
    float _2194 = _2176;
    uint _2196 = uint(int(uint(_2147) >> uint(2)));
    uint _2198 = uint(int(uint(int(_2196)) >> uint(2)));
    int _2200 = int(_2196) & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = int(_2196) + 1;
    uint _2206 = uint(int(uint(_2204) >> uint(2)));
    int _2208 = _2204 & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    if (_2131)
    {
        float _2212 = _2103 ? _2186 : _2113;
        _2192 = _2212;
    }
    float _2214 = _2192;
    float _2216 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2218 = -_2149;
    float _2220 = _2218 + 1.0;
    float _2222 = _2214 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    uint _2224 = uint(int(uint(_2190) >> uint(2)));
    uint _2226 = uint(int(uint(int(_2224)) >> uint(2)));
    int _2228 = int(_2224) & 3;
    float _2230 = (*spvDescriptorSet0.vp_c9)._m0[int(_2226)][_2228];
    int _2232 = int(_2224) + 1;
    uint _2234 = uint(int(uint(_2232) >> uint(2)));
    int _2236 = _2232 & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    float _2240 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2242 = _2153;
    float _2244 = _2151;
    float _2246 = _2155;
    if (!_2121)
    {
        float _2248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2153);
        _2242 = _2248;
    }
    float _2250 = _2242;
    if (!_2121)
    {
        float _2252 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2151);
        _2244 = _2252;
    }
    float _2254 = _2244;
    if (!_2121)
    {
        float _2256 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2155);
        _2246 = _2256;
    }
    float _2258 = _2246;
    int _2260 = _2190 + 8;
    uint _2262 = uint(int(uint(_2260) >> uint(2)));
    uint _2264 = uint(int(uint(int(_2262)) >> uint(2)));
    int _2266 = int(_2262) & 3;
    float _2268 = (*spvDescriptorSet0.vp_c9)._m0[int(_2264)][_2266];
    float _2270 = _1308 * _2250;
    float _2272 = -_2250;
    float _2274 = _1302 * _2272;
    float _2276 = _1310 * _2250;
    float _2278 = _2194 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2280 = fma(_1326, _2254, _2270);
    float _2282 = fma(_1312, _2254, _2274);
    float _2284 = fma(_1330, _2254, _2276);
    float _2286 = _2222 * _2216;
    float _2288 = fma(_1334, _2258, _2280);
    float _2290 = fma(_1320, _2258, _2282);
    float _2292 = fma(_1344, _2258, _2284);
    bool _2294 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2296 = isnan(_1756);
    bool _2298 = _2294 || _2296;
    bool _2300 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2302 = _2298 || _2300;
    float _2304 = _2288 * _342;
    float _2306 = _2288 * _338;
    float _2308 = _2288 * _346;
    float _2310 = fma(_2290, _330, _2304);
    float _2312 = fma(_2290, _334, _2308);
    float _2314 = fma(_2292, _354, _2310);
    float _2316 = _2174 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2320 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2322 = _2202 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2324 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2326 = _2322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2328 = _2324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2330 = _2230 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2332 = _2238 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    out.m_79.x = _2326;
    out.m_79.y = _2328;
    out.m_79.z = _2320;
    out.m_79.w = _2143;
    float _2334 = _2278 * _2318;
    float _2336 = fma(_2290, _326, _2306);
    float _2338 = _2330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2340 = _2332 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2342 = fma(_2292, _350, _2336);
    float _2344 = fma(_2292, _358, _2312);
    float _2346 = _2268 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    out.m_81.x = _2334;
    out.m_81.y = _2286;
    float _2348 = _2346 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_83.x = _2314;
    out.m_83.y = _2342;
    out.m_83.z = _2344;
    float _2350 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2352 = _1584 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_85.x = _2338;
    out.m_85.y = _2340;
    out.m_85.z = _2348;
    float _2354 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2350);
    float _2356 = fma(_780, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2352);
    float _2358 = in.m_87.w;
    float _2360 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2354);
    float _2362 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2356);
    float _2364 = in.m_87.z;
    float _2366 = _2360 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2368 = _2362 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2370 = 1.0 / _2366;
    float _2372 = _2368 + _2366;
    float _2374 = _2348;
    if (!_2302)
    {
        _2374 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2376 = _2374;
    out.m_89.w = _2358;
    float _2378 = _2372 * _2370;
    float _2380 = _2378 * 0.5;
    out.m_89.z = _2364;
    float _2382 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2384 = fma(_2380, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2382);
    float _2386 = in.m_87.x;
    float _2388 = 1.0 / _2384;
    float _2390 = _2364;
    float _2392 = _2376;
    float _2394 = _2376;
    if (!_2302)
    {
        _2390 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2396 = _2390;
    float _2398 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2400 = _2388 * _2398;
    float _2402 = abs(_2400);
    float _2404 = log2(_2402);
    out.m_89.x = _2386;
    bool _2406 = _2400 <= 8000.0;
    bool _2408 = isnan(_2400);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan(8000.0);
    bool _2414 = _2410 || _2412;
    float _2416 = float(_2414);
    float _2418 = _2404 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2420 = exp2(_2418);
    float _2422 = fma(_2420, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2424 = precise::clamp(_2422, 0.0, 1.0);
    float _2426 = fma(_2424, -2.0, 3.0);
    float _2428 = _2424 * _2424;
    float _2430 = in.m_87.y;
    float _2432 = _2428 * _2426;
    float _2434 = in.m_71.x;
    float _2436 = -_2432;
    float _2438 = _2436 + 1.0;
    float _2440 = fma(_2438, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2432);
    float _2442 = _2416 * _2440;
    float _2444 = _2442 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_89.y = _2430;
    float _2446 = _2430;
    float _2448 = _2396;
    float _2450 = _2396;
    if (!_2302)
    {
        _2446 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2452 = _2446;
    float _2454 = -_2018;
    float _2456 = _2454 + 1.0;
    float _2458 = _2456 * _2444;
    float _2460 = precise::clamp(_2458, 0.0, 1.0);
    float _2462 = -_2460;
    float _2464 = fma(_2462, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2466 = fma(_1928, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2133);
    float _2468 = _2464 * _2434;
    float _2470 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2466);
    float _2472 = _2468 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2474 = _2470 + _2002;
    out.gl_Position.x = _2036;
    out.gl_Position.y = _2028;
    out.gl_Position.z = _2470;
    out.gl_Position.w = _2002;
    out.m_91.x = _2472;
    float _2476 = _2240 * _2056;
    float _2478 = -_2240;
    float _2480 = _2478 + 1.0;
    float _2482 = _2067 * _2476;
    float _2484 = _2077 * _2476;
    float _2486 = _2067 * _2480;
    float _2488 = _2474;
    float _2490 = _2452;
    float _2492 = _2452;
    if (!_2302)
    {
        _2159 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2494 = _2159;
    float _2496 = fma(_2073, _2482, _2061);
    float _2498 = fma(_2075, _2482, _2063);
    float _2500 = _2474 * 0.5;
    float _2502 = fma(_2067, _2484, _2065);
    float _2504 = _2494;
    float _2506 = _2494;
    if (!_2302)
    {
        _2488 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2508 = _2488;
    float _2510 = _2508;
    float _2512 = _2508;
    if (!_2302)
    {
        _2161 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2514 = _2161;
    out.m_93.z = _2500;
    out.m_93.w = _2002;
    out.m_95.x = _2496;
    out.m_95.y = _2498;
    out.m_95.z = _2502;
    out.m_95.w = _2486;
    bool _2516 = !_2302;
    float _2518 = _2514;
    float _2520 = _2514;
    if (!_2516)
    {
        bool _2522 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2524 = isnan(_1756);
        bool _2526 = _2522 || _2524;
        bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2530 = _2526 || _2528;
        if (!_2530)
        {
            float _2532 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2534 = _1756 + _2532;
            float _2536 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2538 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = 1.0 / _2538;
            float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2550 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2554 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2556 = _2554 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2558 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2560 = _2558 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2562 = _2534 * _2544;
            float _2564 = precise::clamp(_2562, 0.0, 1.0);
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2570 = fma(_2564, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2572 = fma(_2564, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2564, _2548, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2576 = fma(_2564, _2552, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2578 = fma(_2564, _2556, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2580 = fma(_2564, _2560, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2492 = _2574;
            _2506 = _2578;
            _2394 = _2570;
            _2512 = _2576;
            _2450 = _2572;
            _2520 = _2580;
            _2582 = true;
        }
        else
        {
            bool _2584 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2586 = isnan(_1756);
            bool _2588 = _2584 || _2586;
            bool _2590 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2592 = _2588 || _2590;
            if (!_2592)
            {
                _2392 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2594 = _2392;
            _2394 = _2594;
            if (!_2592)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2596 = _2490;
            _2492 = _2596;
            if (!_2592)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2598 = _2448;
            _2450 = _2598;
            if (!_2592)
            {
                _2510 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2600 = _2510;
            _2512 = _2600;
            if (!_2592)
            {
                _2504 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2602 = _2504;
            _2506 = _2602;
            if (!_2592)
            {
                _2518 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2604 = _2518;
            bool _2606 = !_2592;
            _2520 = _2604;
            if (!_2606)
            {
                bool _2608 = _1756 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2610 = isnan(_1756);
                bool _2612 = _2608 || _2610;
                bool _2614 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2616 = _2612 || _2614;
                if (!_2616)
                {
                    float _2618 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2620 = _1756 + _2618;
                    float _2622 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2624 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = 1.0 / _2624;
                    float _2632 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2634 = _2632 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2636 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2638 = _2636 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2640 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2642 = _2640 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2644 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2646 = _2644 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2648 = _2620 * _2630;
                    float _2650 = precise::clamp(_2648, 0.0, 1.0);
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2656 = fma(_2650, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2658 = fma(_2650, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2650, _2634, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2662 = fma(_2650, _2638, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2664 = fma(_2650, _2642, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2666 = fma(_2650, _2646, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2492 = _2660;
                    _2506 = _2664;
                    _2394 = _2656;
                    _2512 = _2662;
                    _2450 = _2658;
                    _2520 = _2666;
                    _2582 = true;
                }
                else
                {
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2506 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2394 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2512 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2520 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2582 = false;
    float _2668 = _2492;
    float _2670 = _2506;
    float _2672 = _2394;
    float _2674 = _2512;
    float _2676 = _2450;
    float _2678 = _2520;
    float _2680 = fma(_2342, -0.5, 0.5);
    float _2682 = precise::clamp(_2680, 0.0, 1.0);
    float _2684 = -_2668;
    float _2686 = _2684 + _2670;
    float _2688 = -_2672;
    float _2690 = _2688 + _2674;
    float _2692 = -_2676;
    float _2694 = _2692 + _2678;
    bool _2696 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2698 = fma(_2682, _2686, _2668);
    float _2700 = fma(_2682, _2690, _2672);
    float _2702 = fma(_2682, _2694, _2676);
    float _2704 = _2698 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2706 = fma(_2700, 0.298911988735198974609375, _2704);
    float _2708 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2710 = fma(_2702, 0.114477999508380889892578125, _2706);
    out.m_91.w = _2708;
    float _2712 = -_2710;
    float _2714 = _2700 + _2712;
    float _2716 = -_2710;
    float _2718 = _2698 + _2716;
    float _2720 = -_2710;
    float _2722 = _2702 + _2720;
    out.m_97.x = 0.0;
    float _2724 = fma(_2714, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2726 = fma(_2718, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    float _2728 = fma(_2722, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2710);
    out.m_99.x = 0.0;
    out.m_101.x = _2724;
    out.m_101.y = _2726;
    out.m_101.z = _2728;
    if (!_2696)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2730 = -_1724;
    float _2732 = _2730 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2734 = -_1726;
    float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2738 = -_1728;
    float _2740 = _2738 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2742 = _2732 * _2732;
    float _2744 = fma(_2736, _2736, _2742);
    float _2746 = fma((*spvDescriptorSet0.vp_c13)._m0[4].y, (*spvDescriptorSet0.vp_c13)._m0[4].y, 0.00999999977648258209228515625);
    float _2748 = precise::clamp(_2746, 0.0, 1.0);
    float _2750 = fma(_2740, _2740, _2744);
    float _2752 = _2748 * _2748;
    float _2754 = rsqrt(_2750);
    float _2756 = _2732 * _2754;
    float _2758 = _2736 * _2754;
    float _2760 = _2740 * _2754;
    float _2762 = sqrt(_2750);
    float _2764 = -_1762;
    float _2766 = _2764 + _2756;
    float _2768 = -_1758;
    float _2770 = _2768 + _2758;
    float _2772 = -_1760;
    float _2774 = _2772 + _2760;
    float _2776 = _2766 * _2766;
    float _2778 = fma(_2770, _2770, _2776);
    float _2780 = fma(_2774, _2774, _2778);
    float _2782 = -_2762;
    float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2786 = rsqrt(_2780);
    float _2788 = _2784 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2790 = precise::clamp(_2788, 0.0, 1.0);
    float _2792 = abs(_2790);
    float _2794 = log2(_2792);
    float _2796 = _2752 + (-1.0);
    float _2798 = _2766 * _2786;
    float _2800 = _2770 * _2786;
    float _2802 = _2774 * _2786;
    float _2804 = _2342 * _2798;
    float _2806 = _2342 * _2756;
    float _2808 = fma(_2314, _2800, _2804);
    float _2810 = _2794 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2812 = fma(_2314, _2758, _2806);
    float _2814 = fma(_2344, _2802, _2808);
    float _2816 = precise::clamp(_2814, 0.0, 1.0);
    float _2818 = fma(_2344, _2760, _2812);
    float _2820 = precise::clamp(_2818, 0.0, 1.0);
    float _2822 = exp2(_2810);
    float _2824 = _2816 * _2816;
    float _2826 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2828 = fma(_2824, _2796, 1.0);
    float _2830 = -_2756;
    float _2832 = -_2826;
    float _2834 = fma(_2830, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2832);
    float _2836 = _2828 * _2828;
    float _2838 = -_2760;
    float _2840 = fma(_2838, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2834);
    float _2842 = 1.0 / _2836;
    float _2844 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2846 = _2840 + _2844;
    float _2848 = _2846 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = _2822 * _2850;
    float _2854 = _2820 * _2852;
    float _2856 = _2752 * _2842;
    float _2858 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2860 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2862 = _2854 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    float _2864 = _2854 * _2856;
    float _2866 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2868 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2870 = _2864 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2858;
    out.m_97.y = _2860;
    out.m_97.z = _2862;
    out.m_99.x = _2866;
    out.m_99.y = _2868;
    out.m_99.z = _2870;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

