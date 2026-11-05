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
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_75 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_87 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_85 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_44 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_67 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_63 [[attribute(11)]];
    float4 m_69 [[attribute(13)]];
    float4 m_61 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2101 = false;
    bool _334 = false;
    bool _226 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2401 = as_type<float>(_122);
        out.gl_Position.z = _2401;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_49.w;
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
    float _150 = _132;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _114;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2465 = as_type<float>(_156);
        out.gl_Position.z = _2465;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = 1.0 / _128;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = _132 * _164;
    float _188 = _160 * _170;
    float _190 = _160 * _176;
    float _192 = fma(_158, _168, _188);
    float _194 = _160 * _182;
    float _196 = fma(_158, _174, _190);
    float _198 = fma(_162, _172, _192);
    float _200 = fma(_158, _180, _194);
    float _202 = fma(_162, _178, _196);
    float _204 = fma(_162, _184, _200);
    bool _206 = !_166;
    float _224;
    if (!_206)
    {
        float _208 = in.m_59.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _186;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_244;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = 1.0 / _248;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = _260 * _264;
    float _276 = -_260;
    float _278 = _276 + 1.0;
    float _280 = _232 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_268, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = fma(_290, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = _286 * _274;
    float _298 = _292 * _274;
    float _300 = _294 * _274;
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _306 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _308 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    bool _314 = !_272;
    float _332;
    if (!_314)
    {
        float _316 = in.m_59.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _324 = _322 * _318;
        float _326 = floor(_324);
        float _328 = -_326;
        float _330 = _324 + _328;
        _332 = _330;
        _334 = true;
    }
    else
    {
        _332 = _186;
    }
    _334 = false;
    float _336 = _332;
    float _338 = in.m_59.z;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = in.m_44.x;
    float _360 = in.m_44.y;
    float _362 = in.m_44.z;
    float _364 = in.m_59.y;
    float _366 = in.m_63.x;
    float _368 = in.m_63.y;
    float _370 = in.m_63.z;
    float _372 = in.m_59.x;
    float _374 = _338 * 2.0;
    float _376 = fma(_342, 2.0, -1.0);
    float _378 = fma(_340, 2.0, -1.0);
    float _380 = floor(_374);
    float _382 = fma(_344, 2.0, -1.0);
    float _384 = _182 * _360;
    float _386 = _170 * _360;
    float _388 = _176 * _360;
    float _390 = fma(_180, _358, _384);
    float _392 = fma(_168, _358, _386);
    float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _396 = log2(_394);
    float _398 = _364 + _338;
    float _400 = _312 * _370;
    float _402 = fma(_184, _362, _390);
    float _404 = _364 * 2.0;
    float _406 = _398 + (-1.0);
    float _408 = _372 * 2.0;
    float _410 = fma(_174, _358, _388);
    bool _412 = _380 > 0.0;
    float _414 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _416 = floor(_408);
    float _418 = fma(_178, _362, _410);
    bool _420 = _380 >= 0.0;
    bool _422 = isnan(_380);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = in.m_53.w;
    float _432 = _372 + _364;
    float _434 = _396 * _132;
    int _436 = _428 ? 0 : 1;
    float _438 = floor(_404);
    float _440 = _432 + (-1.0);
    float _442 = fma(_172, _362, _392);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    float _450 = in.m_55.w;
    int _452 = _448;
    if (!_412)
    {
        int _454 = ~_436;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = _308 * _366;
    float _462 = exp2(_434);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _466 = _416 > 0.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _470 = 1.0 + _468;
    bool _472 = _416 >= 0.0;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = in.m_57.w;
    bool _484 = !_348;
    int _486 = _484 ? 0 : 1;
    float _488 = _310 * _368;
    bool _490 = _438 > 0.0;
    float _492 = 1.0 / _470;
    bool _494 = _438 >= 0.0;
    bool _496 = isnan(_438);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = _442 + _430;
    float _506 = in.m_65.x;
    float _508 = in.m_65.y;
    float _510 = in.m_65.z;
    bool _512 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _524 = abs(_486);
    float _526 = -_462;
    float _528 = _526 + 1.0;
    int _530 = _480 ? 0 : 1;
    float _532 = abs(_186);
    float _534 = log2(_532);
    bool _536 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _548 = float(_524);
    float _550 = _418 + _450;
    float _552 = float(_458);
    float _554 = _544 ? _528 : 0.0;
    bool _556 = !_352;
    int _558 = _556 ? 0 : 1;
    float _560 = _548 * _552;
    int _562 = _502 ? 0 : 1;
    float _564 = _460;
    if (_520)
    {
        float _566 = _554 * _492;
        _150 = _566;
    }
    float _568 = _150;
    float _570 = _402 + _482;
    float _572 = _560 * (-2.0);
    float _574 = _372 + (-0.5);
    int _576 = ~_530;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    float _582 = -_550;
    float _584 = _582 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _586 = fma(_572, _506, _506);
    int _588 = abs(_558);
    float _590 = fma(_464, _572, _464);
    int _592 = _580;
    if (!_466)
    {
        int _594 = ~_530;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[196].x, _586);
    int _602 = ~_562;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _534 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _610 = _606;
    if (!_490)
    {
        int _612 = ~_562;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = -_504;
    float _620 = _618 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = float(_588);
    float _624 = _584 * _584;
    float _626 = float(_598);
    float _628 = -_570;
    float _630 = _628 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = fma(_590, _568, _600);
    float _634 = fma(_620, _620, _624);
    bool _636 = !_356;
    int _638 = _636 ? 0 : 1;
    float _640 = _622 * _626;
    float _642 = float(_616);
    float _644 = fma(_630, _630, _634);
    int _646 = abs(_638);
    float _648 = _640 * (-2.0);
    float _650 = exp2(_608);
    float _652 = in.m_67.x;
    float _654 = in.m_67.y;
    float _656 = in.m_67.z;
    float _658 = _632 * 0.15915493667125701904296875;
    float _660 = fma(_414, _648, _414);
    float _662 = fma(_648, _508, _508);
    float _664 = _364 + (-0.5);
    float _666 = float(_646);
    float _668 = rsqrt(_644);
    float _670 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _662);
    float _672 = _372 + _338;
    float _674 = _666 * _642;
    float _676 = _338 + (-0.5);
    float _678 = fma(_660, _568, _670);
    float _680 = _672 + (-1.0);
    float _682 = _674 * (-2.0);
    float _684 = _678 * 0.15915493667125701904296875;
    float _686 = _658 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _692 = fma(_682, _510, _510);
    float _694 = fma(_690, _682, _690);
    float _696 = _620 * _668;
    float _698 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _692);
    float _700 = _630 * _668;
    float _702 = -_656;
    float _704 = _382 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _708 = _696 * _706;
    float _710 = fma(_694, _568, _698);
    float _712 = _584 * _668;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = _700 * _714;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _720 = -_708;
    float _722 = fma(_700, _718, _720);
    float _724 = fma(_650, _704, _656);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _728 = _712 * _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _732 = -_716;
    float _734 = fma(_712, _730, _732);
    float _736 = _722 * _722;
    float _738 = -_652;
    float _740 = _378 + _738;
    float _742 = -_654;
    float _744 = _376 + _742;
    float _746 = _710 * 0.15915493667125701904296875;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _750 = -_728;
    float _752 = fma(_696, _748, _750);
    float _754 = fma(_734, _734, _736);
    float _756 = fma(_650, _740, _652);
    float _758 = fma(_650, _744, _654);
    float _760 = _658 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = fma(_752, _752, _754);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _724);
    float _768 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _774 = _684 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _768 * _770;
    float _780 = _546 * _772;
    float _782 = _746 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _684 * 6.283185482025146484375;
    float _788 = sin(_786);
    float _790 = _688 * _776;
    float _792 = _762 * _776;
    float _794 = _746 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = rsqrt(_764);
    float _800 = _522 * _766;
    float _802 = _776 * _784;
    float _804 = _762 * _788;
    float _806 = _688 * _788;
    float _808 = _762 * _784;
    float _810 = _688 * _784;
    float _812 = _788 * _784;
    float _814 = fma(_796, _792, _806);
    float _816 = _808 * _780;
    float _818 = fma(_796, _806, _792);
    float _820 = -_804;
    float _822 = fma(_796, _790, _820);
    float _824 = -_780;
    float _826 = _796 * _824;
    float _828 = fma(_814, _778, _816);
    float _830 = -_790;
    float _832 = fma(_796, _804, _830);
    float _834 = _810 * _780;
    float _836 = _734 * _798;
    float _838 = _722 * _798;
    float _840 = fma(_802, _778, _826);
    float _842 = _752 * _798;
    float _844 = _712 * _836;
    float _846 = fma(_832, _800, _828);
    float _848 = _700 * _838;
    float _850 = fma(_822, _778, _834);
    float _852 = -_844;
    float _854 = fma(_696, _838, _852);
    float _856 = fma(_812, _800, _840);
    float _858 = -_848;
    float _860 = fma(_712, _842, _858);
    float _862 = fma(_818, _800, _850);
    float _864 = _854 * _846;
    float _866 = _696 * _842;
    float _868 = _860 * _846;
    float _870 = fma(_842, _856, _864);
    float _872 = -_866;
    float _874 = fma(_700, _836, _872);
    float _876 = fma(_836, _856, _868);
    float _878 = fma(_700, _862, _870);
    float _880 = fma(_696, _862, _876);
    float _882 = _570 + _878;
    float _884 = _504 + _880;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _882 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _892 = _884 + _890;
    float _894 = _888 * _888;
    float _896 = fma(_892, _892, _894);
    float _898 = _874 * _846;
    float _900 = sqrt(_896);
    float _902 = fma(_838, _856, _898);
    float _904 = fma(_712, _862, _902);
    float _906 = _550 + _904;
    bool _908 = _900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _862;
    float _912 = _884;
    float _914 = _898;
    float _916 = _896;
    float _918 = _658;
    if (!_908)
    {
        _910 = _884;
    }
    float _920 = _910;
    float _922 = _920;
    if (!_908)
    {
        _912 = _882;
    }
    float _924 = _912;
    float _926 = _924;
    if (!_908)
    {
        _914 = _906;
    }
    float _928 = _914;
    bool _930 = !_908;
    float _932 = _928;
    if (!_930)
    {
        float _934 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _938 = _900 + _936;
        float _940 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = rsqrt(_896);
        float _944 = _938 * _934;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = _946 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = _946 * 6.283185482025146484375;
        float _954 = cos(_952);
        float _956 = fma(_950, _940, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _958 = _942 * _956;
        float _960 = _954 + (-1.0);
        float _962 = fma(_892, _958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _964 = fma(_888, _958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _966 = _960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = fma(_906, _954, _966);
        _932 = _968;
        _922 = _962;
        _926 = _964;
    }
    float _970 = _932;
    float _972 = _922;
    float _974 = _926;
    float _976 = -_550;
    float _978 = _976 + _970;
    float _980 = -_504;
    float _982 = _980 + _972;
    float _984 = -_570;
    float _986 = _984 + _974;
    float _988 = _550 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = _978 * _978;
    bool _992 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _994 = isnan(0.5);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1000 = _996 || _998;
    float _1002 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1004 = fma(_982, _982, _990);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1014 = _1010 || _1012;
    float _1016 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1002);
    float _1018 = fma(_986, _986, _1004);
    float _1020 = _550 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1024 = sqrt(_1018);
    float _1026 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1028 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1026);
    float _1030 = 1.0 / _1022;
    float _1032 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1034 = _1032 + _1022;
    bool _1036 = _1024 > 0.0;
    float _1038 = _1034 * _1030;
    float _1040 = _1038 * 0.5;
    bool _1042 = !_1036;
    float _1044 = _972;
    float _1046 = _970;
    float _1048 = _974;
    float _1050 = _1022;
    float _1052 = _1024;
    if (!_1042)
    {
        float _1054 = _202 * _202;
        float _1056 = fma(_198, _198, _1054);
        float _1058 = fma(_204, _204, _1056);
        float _1060 = rsqrt(_1018);
        float _1062 = sqrt(_1058);
        float _1064 = _982 * _1060;
        float _1066 = _978 * _1060;
        float _1068 = _986 * _1060;
        bool _1070 = _1062 > 0.0;
        bool _1072 = !_1070;
        _916 = _1068;
        _1050 = _1058;
        _1052 = _1066;
        if (!_1072)
        {
            float _1074 = rsqrt(_1058);
            float _1076 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1078 = _202 * _1074;
            float _1080 = _198 * _1074;
            float _1082 = _204 * _1074;
            float _1084 = _1066 * _1078;
            float _1086 = fma(_1064, _1080, _1084);
            float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1090 = fma(_1068, _1082, _1086);
            float _1092 = _1090 * _1088;
            float _1094 = fma(_198, _1092, _972);
            float _1096 = fma(_202, _1092, _970);
            float _1098 = fma(_204, _1092, _974);
            _1044 = _1094;
            _1046 = _1096;
            _1048 = _1098;
        }
    }
    float _1100 = _1044;
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _916;
    float _1108 = _1050;
    float _1110 = _1052;
    float _1112 = _1110;
    float _1114 = _1106;
    float _1116 = _1100;
    float _1118 = _1108;
    if (_1014)
    {
        _1112 = 1.0;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (_1000)
    {
        _1114 = _1100;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (_1000)
    {
        _918 = _1102;
    }
    float _1128 = _918;
    float _1130 = _1128;
    if (_1000)
    {
        _564 = _1104;
    }
    float _1132 = _564;
    float _1134 = _1132;
    if (!_1000)
    {
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1138 = _550 + _1136;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1142 = _504 + _1140;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1146 = -_504;
        float _1148 = _1146 + _1100;
        float _1150 = _1138 * _1138;
        float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1154 = _570 + _1152;
        float _1156 = -_570;
        float _1158 = _1156 + _1104;
        float _1160 = fma(_1142, _1142, _1150);
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1164 = fma(_1154, _1154, _1160);
        float _1166 = sqrt(_1164);
        float _1168 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = precise::min(_1166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1172 = _1170 * _1162;
        float _1174 = _1168 * _1172;
        float _1176 = -_550;
        float _1178 = _1176 + _1102;
        float _1180 = fma(_1148, _1174, _504);
        float _1182 = fma(_1178, _1174, _550);
        float _1184 = fma(_1158, _1174, _570);
        _1130 = _1182;
        _1126 = _1180;
        _1134 = _1184;
    }
    float _1186 = _1130;
    float _1188 = _1126;
    float _1190 = _1134;
    if (!_1014)
    {
        float _1192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1194 = _1192 * 0.15915493667125701904296875;
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1200 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1198);
        float _1202 = _1194 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1196 * 0.15915493667125701904296875;
        float _1208 = _1194 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1216 * _1218;
        float _1226 = 1.0 / _1200;
        float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1230 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1228;
        float _1232 = 1.0 / _1224;
        float _1234 = 1.0 / _1230;
        float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1238 = _1226 * _1236;
        float _1240 = _1222 * _1232;
        float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1244 = fma(_1240, _1238, _1242);
        float _1246 = _1244 * _1234;
        float _1248 = precise::clamp(_1246, 0.0, 1.0);
        _1116 = _1200;
        _1122 = _1248;
    }
    float _1250 = _1116;
    float _1252 = _1122;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1256 = _1186 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1260 = _1188 + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1264 = _1190 + _1262;
    float _1266 = _1256 * _1256;
    float _1268 = fma(_1260, _1260, _1266);
    float _1270 = fma(_1264, _1264, _1268);
    float _1272 = rsqrt(_1270);
    float _1274 = sqrt(_1270);
    float _1276 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1278 = _1260 * _1276;
    float _1280 = _1264 * _1276;
    float _1282 = _1278 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 + _1284;
    float _1288 = sqrt(_1286);
    bool _1290 = _1288 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = _1288 + _1292;
    float _1296 = _1264;
    float _1298 = _1286;
    float _1300 = _1294;
    float _1302 = _1250;
    float _1304 = _1256;
    if (_1290)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1306;
    }
    float _1308 = _1296;
    if (_1290)
    {
        float _1310 = rsqrt(_1286);
        _1298 = _1310;
    }
    float _1312 = _1298;
    float _1314 = _1312;
    if (_1290)
    {
        float _1316 = _1294 * _1308;
        _1300 = _1316;
    }
    float _1318 = _1300;
    if (_1290)
    {
        float _1320 = _1318 * 0.15915493667125701904296875;
        _1302 = _1320;
    }
    float _1322 = _1302;
    float _1324 = _1308;
    float _1326 = _1322;
    if (_1290)
    {
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        _1324 = _1330;
    }
    float _1332 = _1324;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = precise::max(0.0, _1334);
    float _1338 = _1268;
    float _1340 = _1336;
    if (_1290)
    {
        float _1342 = _1322 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1338 = _1344;
    }
    float _1346 = _1338;
    float _1348 = -_1276;
    float _1350 = -_1336;
    float _1352 = fma(_1256, _1348, _1350);
    if (_1290)
    {
        float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    float _1360 = _1332;
    if (_1290)
    {
        float _1362 = fma(_1332, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1364;
    if (!_1290)
    {
        _1360 = _1278;
    }
    float _1368 = _1360;
    float _1370 = _1368;
    float _1372 = _1346;
    if (_1290)
    {
        float _1374 = _1346 + (-1.0);
        _1304 = _1374;
    }
    float _1376 = _1304;
    float _1378 = _1376;
    if (_1290)
    {
        float _1380 = _1312 * _1364;
        _1118 = _1380;
    }
    float _1382 = _1118;
    if (!_1290)
    {
        _1366 = _1352;
    }
    float _1384 = _1366;
    float _1386 = _1384;
    if (_1290)
    {
        float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1326 = _1388;
    }
    float _1390 = _1326;
    if (_1290)
    {
        float _1392 = _1278 * _1382;
        _1370 = _1392;
    }
    float _1394 = _1370;
    if (!_1290)
    {
        _1378 = _1280;
    }
    float _1396 = _1378;
    float _1398 = _1396;
    if (_1290)
    {
        float _1400 = _1280 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    if (!_1290)
    {
        _1314 = _1282;
    }
    float _1404 = _1314;
    float _1406 = _1404;
    if (_1290)
    {
        float _1408 = fma(_1352, _1346, _1390);
        _1386 = _1408;
    }
    float _1410 = _1386;
    if (_1290)
    {
        float _1412 = _1394 * _1394;
        _1406 = _1412;
    }
    float _1414 = _1406;
    if (!_1290)
    {
        _1372 = _1284;
    }
    float _1416 = _1372;
    float _1418 = _1416;
    if (_1290)
    {
        float _1420 = _1402 * _1402;
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = fma(_1410, _1410, _1414);
    float _1426 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1428 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1430 = _1424 + _1422;
    float _1432 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1426);
    float _1434 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1438 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1436);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1444 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1432);
    float _1446 = rsqrt(_1430);
    float _1448 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1450 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1452 = -_1440;
    float _1454 = _1452 + 1.0;
    float _1456 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1442);
    float _1458 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1448);
    float _1460 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1450);
    float _1462 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1464 = abs(_1454);
    float _1466 = log2(_1464);
    float _1468 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1472 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1456);
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1478 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1480 = _1446 * _1394;
    float _1482 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1484 = _1446 * _1410;
    float _1486 = _1446 * _1402;
    float _1488 = -_1474;
    float _1490 = fma(_1488, _1428, 1.0);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1482);
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1496 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1492);
    float _1502 = -_1494;
    float _1504 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1502);
    float _1506 = log2(_1490);
    float _1508 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1510 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1500);
    float _1512 = -_1486;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1504);
    float _1516 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1518 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1484 + 1.0;
    float _1522 = fma(_1514, -0.5, 0.5);
    float _1524 = exp2(_1498);
    float _1526 = fma(_1514, 0.5, 0.5);
    float _1528 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1516);
    float _1530 = fma(_1526, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1534 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1536 = 1.0 / _1510;
    float _1538 = fma(_1526, _1530, -0.212114393711090087890625);
    float _1540 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1532);
    float _1542 = _1506 * 0.693147182464599609375;
    float _1544 = fma(_1526, _1538, 1.570728778839111328125);
    float _1546 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1548 = sqrt(_1522);
    float _1550 = -_1484;
    float _1552 = fma(_1524, _1520, _1550);
    float _1554 = fma(_1552, 0.5, 0.5);
    float _1556 = _1540 * _1536;
    float _1558 = _1534 * _1536;
    float _1560 = fma(_1556, 0.5, 0.5);
    float _1562 = fma(_1558, -0.5, 0.5);
    float _1564 = _1548 * 0.636619746685028076171875;
    float3 _4591 = float3(_1560, _1562, _1546);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4591, float3(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4591, float3(0.0), isnan(_4591)), level(0.0)).x;
    float _1568 = -_1544;
    float _1570 = fma(_1564, _1568, 1.0);
    float3 _4607 = float3(_1560, _1562, _1546);
    float4 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).xyzw;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = _1573.w;
    float2 _4624 = float2(_1570, _1554);
    float3 _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4624, float2(0.0), isnan(_4624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4624, float2(0.0), isnan(_4624)), level(0.0)).xyz;
    float _1587 = _1585.x;
    float _1589 = _1585.y;
    float _1591 = _1585.z;
    float _1593 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1595 = _808 * _854;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1601 = _364 > 0.5;
    float _1603 = exp2(_1593);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = in.m_69.x;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1617 = _1615 != 0;
    float _1619 = -_796;
    float _1621 = fma(_1619, _842, _1595);
    bool _1623 = _372 > 0.5;
    bool _1625 = _1623 && _1607;
    float _1627 = in.m_69.y;
    float _1629 = 1.0 / _1599;
    float _1631 = fma(_810, _700, _1621);
    bool _1633 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1635 = isnan(_336);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    bool _1645 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1647 = isnan(_336);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = 1.0 / _1613;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1663 = -_1643;
    float _1665 = _1663 + 1.0;
    bool _1667 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1669 = isnan(_336);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1679;
    float _1683 = -_1655;
    float _1685 = _1683 + 1.0;
    float _1687 = _1655 * _1665;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1693 = _1681 * _1629;
    bool _1695 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1697 = isnan(_336);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1677 * _1685;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1711 = _336 + _1709;
    float _1713 = -_1677;
    float _1715 = _1713 + 1.0;
    float _1717 = 1.0 / _1661;
    float _1719 = fma(_1693, _1711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1721 = _1691 * _1657;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1725 = _336 + _1723;
    float _1727 = _1705 * _1715;
    float _1729 = -_1705;
    float _1731 = _1729 + 1.0;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1733;
    float _1737 = fma(_1721, _1725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1739 = _1719 * _1727;
    float _1741 = _1725;
    float _1743 = _1609;
    float _1745 = _1510;
    float _1747 = _1534;
    float _1749 = _1540;
    if (_1607)
    {
        _1741 = _1609;
    }
    float _1751 = _1741;
    float _1753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1757 = _336 + _1755;
    float _1759 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1739);
    float _1761 = -_1627;
    float _1763 = _1761 + 1.0;
    float _1765 = _1751;
    float _1767 = _1627;
    if (_1625)
    {
        float _1769 = -_1751;
        float _1771 = _1769 + 1.0;
        _1765 = _1771;
    }
    float _1773 = _1765;
    float _1775 = _1735 * _1717;
    float _1777 = fma(_1737, _1707, _1759);
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1617)
    {
        float _1781 = _1601 ? _1763 : _1627;
        _1767 = _1781;
    }
    float _1783 = _1767;
    float _1785 = fma(_1775, _1757, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1607)
    {
        _1743 = _1773;
    }
    float _1787 = _1743;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1791 = _758 != 0.0;
    bool _1793 = isnan(_758);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan(0.0);
    bool _1799 = _1795 || _1797;
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1803 = fma(_1785, _1687, _1777);
    float _1805 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1807 = _1801 * _1753;
    float _1809 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1803);
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1813 = _756 == 0.0;
    bool _1815 = !_1799;
    bool _1817 = _1813 && _1815;
    float _1819 = _1805 * _1779;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _808 * _874;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1835 = _724 == 0.0;
    bool _1837 = _1835 && _1817;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1843 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1829;
    out.m_71.y = _1833;
    out.m_71.z = _1825;
    out.m_71.w = _1823;
    float _1845 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = _1809 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1851 = in.m_73.x;
    float _1853 = in.m_73.y;
    float _1855 = in.m_73.z;
    float _1857 = _814 * _874;
    float _1859 = _808 * _860;
    float _1861 = _832 * _860;
    out.m_75.x = _1843;
    out.m_75.y = _1845;
    out.m_75.z = _1847;
    out.m_75.w = _1849;
    float _1863 = _832 * _874;
    float _1865 = fma(_802, _838, _1857);
    float _1867 = _814 * _860;
    out.m_77.x = _1819;
    out.m_77.y = _1807;
    float _1869 = fma(_812, _838, _1863);
    float _1871 = -_796;
    float _1873 = fma(_1871, _838, _1831);
    float _1875 = _814 * _854;
    float _1877 = -_1603;
    float _1879 = _1877 + 1.0;
    float _1881 = _832 * _854;
    float _1883 = fma(_802, _842, _1875);
    float _1885 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1887 = fma(_812, _842, _1881);
    float _1889 = fma(_810, _712, _1873);
    float _1891 = -_796;
    float _1893 = fma(_1891, _836, _1859);
    float _1895 = fma(_812, _836, _1861);
    float _1897 = fma(_822, _712, _1865);
    float _1899 = fma(_802, _836, _1867);
    float _1901 = fma(_810, _696, _1893);
    float _1903 = _1853;
    float _1905 = _1851;
    float _1907 = _1855;
    if (!_1837)
    {
        float _1909 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1853);
        _1903 = _1909;
    }
    float _1911 = _1903;
    if (!_1837)
    {
        float _1913 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1851);
        _1905 = _1913;
    }
    float _1915 = _1905;
    float _1917 = fma(_818, _696, _1895);
    float _1919 = fma(_818, _712, _1869);
    float _1921 = _1889 * _1911;
    if (!_1837)
    {
        float _1923 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _1907 = _1923;
    }
    float _1925 = _1907;
    float _1927 = _1901 * _1911;
    float _1929 = _1631 * _1911;
    float _1931 = fma(_1897, _1915, _1921);
    float _1933 = fma(_822, _696, _1899);
    float _1935 = fma(_822, _700, _1883);
    float _1937 = fma(_818, _700, _1887);
    float _1939 = fma(_1919, _1925, _1931);
    float _1941 = fma(_1933, _1915, _1927);
    float _1943 = fma(_1935, _1915, _1929);
    float _1945 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1947 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1949 = isnan(_1274);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1955 = _1951 || _1953;
    float _1957 = fma(_1917, _1925, _1941);
    float _1959 = fma(_1937, _1925, _1943);
    float _1961 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1963 = _1540 + _1510;
    float _1965 = _1510 * 0.5;
    out.m_79.x = _1957;
    out.m_79.y = _1939;
    out.m_79.z = _1959;
    float _1967 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1961);
    float _1969 = _1963 * 0.5;
    float _1971 = fma(_1534, -0.5, _1965);
    float _1973 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1975 = _1973 + _1510;
    out.gl_Position.x = _1540;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1510;
    float _1977 = _1975 * 0.5;
    out.m_81.x = _1969;
    out.m_81.y = _1971;
    out.m_81.z = _1977;
    out.m_81.w = _1510;
    float _1979 = _1973;
    float _1981 = _1969;
    if (!_1955)
    {
        _1745 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1983 = _1745;
    float _1985 = _1983;
    float _1987 = _1983;
    if (!_1955)
    {
        _1979 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1989 = _1979;
    float _1991 = _1989;
    float _1993 = _1989;
    if (!_1955)
    {
        _1747 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1995 = _1747;
    float _1997 = _1995;
    float _1999 = _1995;
    if (!_1955)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2001 = _1749;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1955)
    {
        _1981 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1981;
    float _2009 = _1885 * _1566;
    float _2011 = -_1885;
    float _2013 = _2011 + 1.0;
    float _2015 = _1581 * _2009;
    float _2017 = _1581 * _2013;
    float _2019 = _1591 * _2009;
    float _2021 = fma(_1587, _2015, _1575);
    float _2023 = fma(_1589, _2015, _1577);
    float _2025 = _2015;
    float _2027 = _2007;
    float _2029 = _2007;
    if (!_1955)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2031 = _2025;
    float _2033 = fma(_1581, _2019, _1579);
    out.m_83.x = _2021;
    out.m_83.y = _2023;
    out.m_83.z = _2033;
    out.m_83.w = _2017;
    bool _2035 = !_1955;
    float _2037 = _2031;
    float _2039 = _2031;
    if (!_2035)
    {
        bool _2041 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2043 = isnan(_1274);
        bool _2045 = _2041 || _2043;
        bool _2047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2049 = _2045 || _2047;
        if (!_2049)
        {
            float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2053 = _1274 + _2051;
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2055;
            float _2059 = 1.0 / _2057;
            float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2081 = _2053 * _2059;
            float _2083 = precise::clamp(_2081, 0.0, 1.0);
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2089 = fma(_2083, _2063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2091 = fma(_2083, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2093 = fma(_2083, _2067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2095 = fma(_2083, _2071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2097 = fma(_2083, _2075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2099 = fma(_2083, _2079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2029 = _2091;
            _1999 = _2097;
            _2039 = _2089;
            _1993 = _2095;
            _1987 = _2093;
            _2005 = _2099;
            _2101 = true;
        }
        else
        {
            bool _2103 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2105 = isnan(_1274);
            bool _2107 = _2103 || _2105;
            bool _2109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2111 = _2107 || _2109;
            if (!_2111)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2113 = _2037;
            _2039 = _2113;
            if (!_2111)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2115 = _2027;
            _2029 = _2115;
            if (!_2111)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2117 = _1985;
            _1987 = _2117;
            if (!_2111)
            {
                _1991 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2119 = _1991;
            _1993 = _2119;
            if (!_2111)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2121 = _1997;
            _1999 = _2121;
            if (!_2111)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2123 = _2003;
            bool _2125 = !_2111;
            _2005 = _2123;
            if (!_2125)
            {
                bool _2127 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2129 = isnan(_1274);
                bool _2131 = _2127 || _2129;
                bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2135 = _2131 || _2133;
                if (!_2135)
                {
                    float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2139 = _1274 + _2137;
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2141;
                    float _2145 = 1.0 / _2143;
                    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2167 = _2139 * _2145;
                    float _2169 = precise::clamp(_2167, 0.0, 1.0);
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2175 = fma(_2169, _2149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2177 = fma(_2169, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2179 = fma(_2169, _2153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2181 = fma(_2169, _2157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2183 = fma(_2169, _2161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2185 = fma(_2169, _2165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2029 = _2177;
                    _1999 = _2183;
                    _2039 = _2175;
                    _1993 = _2181;
                    _1987 = _2179;
                    _2005 = _2185;
                    _2101 = true;
                }
                else
                {
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1993 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2101 = false;
    float _2187 = _2029;
    float _2189 = _1999;
    float _2191 = _2039;
    float _2193 = _1993;
    float _2195 = _1987;
    float _2197 = _2005;
    float _2199 = fma(_1939, -0.5, 0.5);
    float _2201 = precise::clamp(_2199, 0.0, 1.0);
    float _2203 = -_2187;
    float _2205 = _2203 + _2189;
    float _2207 = _1252 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2209 = -_2191;
    float _2211 = _2209 + _2193;
    float _2213 = fma(_2201, _2205, _2187);
    out.m_85.x = 0.0;
    float _2215 = -_2195;
    float _2217 = _2215 + _2197;
    float _2219 = fma(_2201, _2211, _2191);
    float _2221 = _2213 * 0.586610972881317138671875;
    out.m_47.x = _2207;
    bool _2223 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2225 = fma(_2201, _2217, _2195);
    float _2227 = fma(_2219, 0.298911988735198974609375, _2221);
    bool _2229 = _1252 > 0.0;
    bool _2231 = isnan(_1252);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.0);
    bool _2237 = _2233 || _2235;
    float _2239 = fma(_2225, 0.114477999508380889892578125, _2227);
    float _2241 = -_2239;
    float _2243 = _2219 + _2241;
    float _2245 = -_2239;
    float _2247 = _2213 + _2245;
    float _2249 = -_2239;
    float _2251 = _2225 + _2249;
    float _2253 = fma(_2243, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    float _2255 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    float _2257 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    bool _2259 = !_2223;
    if (!_2259)
    {
        float _2261 = -_1186;
        float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2265 = -_1188;
        float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2269 = -_1190;
        float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2273 = _2263 * _2263;
        float _2275 = fma(_2267, _2267, _2273);
        float _2277 = fma(_2271, _2271, _2275);
        float _2279 = sqrt(_2277);
        float _2281 = rsqrt(_2277);
        float _2283 = -_2279;
        float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2289 = precise::clamp(_2287, 0.0, 1.0);
        float _2291 = _2267 * _2281;
        float _2293 = _2263 * _2281;
        float _2295 = abs(_2289);
        float _2297 = log2(_2295);
        float _2299 = _2271 * _2281;
        float _2301 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2303 = _1939 * _2293;
        float _2305 = -_2293;
        float _2307 = -_2301;
        float _2309 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2307);
        float _2311 = fma(_1957, _2291, _2303);
        float _2313 = -_2299;
        float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2309);
        float _2317 = fma(_1959, _2299, _2311);
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2323 = _2315 + _2321;
        float _2325 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = exp2(_2325);
        float _2333 = _2331 * _2329;
        float _2335 = _2319 * _2333;
        float _2337 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2341 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2337;
        out.m_85.y = _2339;
        out.m_85.z = _2341;
    }
    out.m_87.x = _2253;
    out.m_87.y = _2255;
    out.m_87.z = _2257;
    if (_2237)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2343 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2343;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2101 = false;
    bool _334 = false;
    bool _226 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2401 = as_type<float>(_122);
        out.gl_Position.z = _2401;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_49.w;
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
    float _150 = _132;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _114;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2465 = as_type<float>(_156);
        out.gl_Position.z = _2465;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = 1.0 / _128;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = _132 * _164;
    float _188 = _160 * _170;
    float _190 = _160 * _176;
    float _192 = fma(_158, _168, _188);
    float _194 = _160 * _182;
    float _196 = fma(_158, _174, _190);
    float _198 = fma(_162, _172, _192);
    float _200 = fma(_158, _180, _194);
    float _202 = fma(_162, _178, _196);
    float _204 = fma(_162, _184, _200);
    bool _206 = !_166;
    float _224;
    if (!_206)
    {
        float _208 = in.m_59.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _186;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_244;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = 1.0 / _248;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = _260 * _264;
    float _276 = -_260;
    float _278 = _276 + 1.0;
    float _280 = _232 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_268, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = fma(_290, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = _286 * _274;
    float _298 = _292 * _274;
    float _300 = _294 * _274;
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _306 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _308 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    bool _314 = !_272;
    float _332;
    if (!_314)
    {
        float _316 = in.m_59.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _324 = _322 * _318;
        float _326 = floor(_324);
        float _328 = -_326;
        float _330 = _324 + _328;
        _332 = _330;
        _334 = true;
    }
    else
    {
        _332 = _186;
    }
    _334 = false;
    float _336 = _332;
    float _338 = in.m_59.z;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = in.m_44.x;
    float _360 = in.m_44.y;
    float _362 = in.m_44.z;
    float _364 = in.m_59.y;
    float _366 = in.m_63.x;
    float _368 = in.m_63.y;
    float _370 = in.m_63.z;
    float _372 = in.m_59.x;
    float _374 = _338 * 2.0;
    float _376 = fma(_342, 2.0, -1.0);
    float _378 = fma(_340, 2.0, -1.0);
    float _380 = floor(_374);
    float _382 = fma(_344, 2.0, -1.0);
    float _384 = _182 * _360;
    float _386 = _170 * _360;
    float _388 = _176 * _360;
    float _390 = fma(_180, _358, _384);
    float _392 = fma(_168, _358, _386);
    float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _396 = log2(_394);
    float _398 = _364 + _338;
    float _400 = _312 * _370;
    float _402 = fma(_184, _362, _390);
    float _404 = _364 * 2.0;
    float _406 = _398 + (-1.0);
    float _408 = _372 * 2.0;
    float _410 = fma(_174, _358, _388);
    bool _412 = _380 > 0.0;
    float _414 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _416 = floor(_408);
    float _418 = fma(_178, _362, _410);
    bool _420 = _380 >= 0.0;
    bool _422 = isnan(_380);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = in.m_53.w;
    float _432 = _372 + _364;
    float _434 = _396 * _132;
    int _436 = _428 ? 0 : 1;
    float _438 = floor(_404);
    float _440 = _432 + (-1.0);
    float _442 = fma(_172, _362, _392);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    float _450 = in.m_55.w;
    int _452 = _448;
    if (!_412)
    {
        int _454 = ~_436;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = _308 * _366;
    float _462 = exp2(_434);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _466 = _416 > 0.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _470 = 1.0 + _468;
    bool _472 = _416 >= 0.0;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = in.m_57.w;
    bool _484 = !_348;
    int _486 = _484 ? 0 : 1;
    float _488 = _310 * _368;
    bool _490 = _438 > 0.0;
    float _492 = 1.0 / _470;
    bool _494 = _438 >= 0.0;
    bool _496 = isnan(_438);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = _442 + _430;
    float _506 = in.m_65.x;
    float _508 = in.m_65.y;
    float _510 = in.m_65.z;
    bool _512 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _524 = abs(_486);
    float _526 = -_462;
    float _528 = _526 + 1.0;
    int _530 = _480 ? 0 : 1;
    float _532 = abs(_186);
    float _534 = log2(_532);
    bool _536 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _548 = float(_524);
    float _550 = _418 + _450;
    float _552 = float(_458);
    float _554 = _544 ? _528 : 0.0;
    bool _556 = !_352;
    int _558 = _556 ? 0 : 1;
    float _560 = _548 * _552;
    int _562 = _502 ? 0 : 1;
    float _564 = _460;
    if (_520)
    {
        float _566 = _554 * _492;
        _150 = _566;
    }
    float _568 = _150;
    float _570 = _402 + _482;
    float _572 = _560 * (-2.0);
    float _574 = _372 + (-0.5);
    int _576 = ~_530;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    float _582 = -_550;
    float _584 = _582 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _586 = fma(_572, _506, _506);
    int _588 = abs(_558);
    float _590 = fma(_464, _572, _464);
    int _592 = _580;
    if (!_466)
    {
        int _594 = ~_530;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[196].x, _586);
    int _602 = ~_562;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _534 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _610 = _606;
    if (!_490)
    {
        int _612 = ~_562;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = -_504;
    float _620 = _618 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = float(_588);
    float _624 = _584 * _584;
    float _626 = float(_598);
    float _628 = -_570;
    float _630 = _628 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = fma(_590, _568, _600);
    float _634 = fma(_620, _620, _624);
    bool _636 = !_356;
    int _638 = _636 ? 0 : 1;
    float _640 = _622 * _626;
    float _642 = float(_616);
    float _644 = fma(_630, _630, _634);
    int _646 = abs(_638);
    float _648 = _640 * (-2.0);
    float _650 = exp2(_608);
    float _652 = in.m_67.x;
    float _654 = in.m_67.y;
    float _656 = in.m_67.z;
    float _658 = _632 * 0.15915493667125701904296875;
    float _660 = fma(_414, _648, _414);
    float _662 = fma(_648, _508, _508);
    float _664 = _364 + (-0.5);
    float _666 = float(_646);
    float _668 = rsqrt(_644);
    float _670 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _662);
    float _672 = _372 + _338;
    float _674 = _666 * _642;
    float _676 = _338 + (-0.5);
    float _678 = fma(_660, _568, _670);
    float _680 = _672 + (-1.0);
    float _682 = _674 * (-2.0);
    float _684 = _678 * 0.15915493667125701904296875;
    float _686 = _658 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _692 = fma(_682, _510, _510);
    float _694 = fma(_690, _682, _690);
    float _696 = _620 * _668;
    float _698 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _692);
    float _700 = _630 * _668;
    float _702 = -_656;
    float _704 = _382 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _708 = _696 * _706;
    float _710 = fma(_694, _568, _698);
    float _712 = _584 * _668;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = _700 * _714;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _720 = -_708;
    float _722 = fma(_700, _718, _720);
    float _724 = fma(_650, _704, _656);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _728 = _712 * _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _732 = -_716;
    float _734 = fma(_712, _730, _732);
    float _736 = _722 * _722;
    float _738 = -_652;
    float _740 = _378 + _738;
    float _742 = -_654;
    float _744 = _376 + _742;
    float _746 = _710 * 0.15915493667125701904296875;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _750 = -_728;
    float _752 = fma(_696, _748, _750);
    float _754 = fma(_734, _734, _736);
    float _756 = fma(_650, _740, _652);
    float _758 = fma(_650, _744, _654);
    float _760 = _658 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = fma(_752, _752, _754);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _724);
    float _768 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _774 = _684 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _768 * _770;
    float _780 = _546 * _772;
    float _782 = _746 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _684 * 6.283185482025146484375;
    float _788 = sin(_786);
    float _790 = _688 * _776;
    float _792 = _762 * _776;
    float _794 = _746 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = rsqrt(_764);
    float _800 = _522 * _766;
    float _802 = _776 * _784;
    float _804 = _762 * _788;
    float _806 = _688 * _788;
    float _808 = _762 * _784;
    float _810 = _688 * _784;
    float _812 = _788 * _784;
    float _814 = fma(_796, _792, _806);
    float _816 = _808 * _780;
    float _818 = fma(_796, _806, _792);
    float _820 = -_804;
    float _822 = fma(_796, _790, _820);
    float _824 = -_780;
    float _826 = _796 * _824;
    float _828 = fma(_814, _778, _816);
    float _830 = -_790;
    float _832 = fma(_796, _804, _830);
    float _834 = _810 * _780;
    float _836 = _734 * _798;
    float _838 = _722 * _798;
    float _840 = fma(_802, _778, _826);
    float _842 = _752 * _798;
    float _844 = _712 * _836;
    float _846 = fma(_832, _800, _828);
    float _848 = _700 * _838;
    float _850 = fma(_822, _778, _834);
    float _852 = -_844;
    float _854 = fma(_696, _838, _852);
    float _856 = fma(_812, _800, _840);
    float _858 = -_848;
    float _860 = fma(_712, _842, _858);
    float _862 = fma(_818, _800, _850);
    float _864 = _854 * _846;
    float _866 = _696 * _842;
    float _868 = _860 * _846;
    float _870 = fma(_842, _856, _864);
    float _872 = -_866;
    float _874 = fma(_700, _836, _872);
    float _876 = fma(_836, _856, _868);
    float _878 = fma(_700, _862, _870);
    float _880 = fma(_696, _862, _876);
    float _882 = _570 + _878;
    float _884 = _504 + _880;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _882 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _892 = _884 + _890;
    float _894 = _888 * _888;
    float _896 = fma(_892, _892, _894);
    float _898 = _874 * _846;
    float _900 = sqrt(_896);
    float _902 = fma(_838, _856, _898);
    float _904 = fma(_712, _862, _902);
    float _906 = _550 + _904;
    bool _908 = _900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _862;
    float _912 = _884;
    float _914 = _898;
    float _916 = _896;
    float _918 = _658;
    if (!_908)
    {
        _910 = _884;
    }
    float _920 = _910;
    float _922 = _920;
    if (!_908)
    {
        _912 = _882;
    }
    float _924 = _912;
    float _926 = _924;
    if (!_908)
    {
        _914 = _906;
    }
    float _928 = _914;
    bool _930 = !_908;
    float _932 = _928;
    if (!_930)
    {
        float _934 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _938 = _900 + _936;
        float _940 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = rsqrt(_896);
        float _944 = _938 * _934;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = _946 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = _946 * 6.283185482025146484375;
        float _954 = cos(_952);
        float _956 = fma(_950, _940, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _958 = _942 * _956;
        float _960 = _954 + (-1.0);
        float _962 = fma(_892, _958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _964 = fma(_888, _958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _966 = _960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = fma(_906, _954, _966);
        _932 = _968;
        _922 = _962;
        _926 = _964;
    }
    float _970 = _932;
    float _972 = _922;
    float _974 = _926;
    float _976 = -_550;
    float _978 = _976 + _970;
    float _980 = -_504;
    float _982 = _980 + _972;
    float _984 = -_570;
    float _986 = _984 + _974;
    float _988 = _550 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = _978 * _978;
    bool _992 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _994 = isnan(0.5);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1000 = _996 || _998;
    float _1002 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1004 = fma(_982, _982, _990);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1014 = _1010 || _1012;
    float _1016 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1002);
    float _1018 = fma(_986, _986, _1004);
    float _1020 = _550 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1024 = sqrt(_1018);
    float _1026 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1028 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1026);
    float _1030 = 1.0 / _1022;
    float _1032 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1034 = _1032 + _1022;
    bool _1036 = _1024 > 0.0;
    float _1038 = _1034 * _1030;
    float _1040 = _1038 * 0.5;
    bool _1042 = !_1036;
    float _1044 = _972;
    float _1046 = _970;
    float _1048 = _974;
    float _1050 = _1022;
    float _1052 = _1024;
    if (!_1042)
    {
        float _1054 = _202 * _202;
        float _1056 = fma(_198, _198, _1054);
        float _1058 = fma(_204, _204, _1056);
        float _1060 = rsqrt(_1018);
        float _1062 = sqrt(_1058);
        float _1064 = _982 * _1060;
        float _1066 = _978 * _1060;
        float _1068 = _986 * _1060;
        bool _1070 = _1062 > 0.0;
        bool _1072 = !_1070;
        _916 = _1068;
        _1050 = _1058;
        _1052 = _1066;
        if (!_1072)
        {
            float _1074 = rsqrt(_1058);
            float _1076 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1078 = _202 * _1074;
            float _1080 = _198 * _1074;
            float _1082 = _204 * _1074;
            float _1084 = _1066 * _1078;
            float _1086 = fma(_1064, _1080, _1084);
            float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1090 = fma(_1068, _1082, _1086);
            float _1092 = _1090 * _1088;
            float _1094 = fma(_198, _1092, _972);
            float _1096 = fma(_202, _1092, _970);
            float _1098 = fma(_204, _1092, _974);
            _1044 = _1094;
            _1046 = _1096;
            _1048 = _1098;
        }
    }
    float _1100 = _1044;
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _916;
    float _1108 = _1050;
    float _1110 = _1052;
    float _1112 = _1110;
    float _1114 = _1106;
    float _1116 = _1100;
    float _1118 = _1108;
    if (_1014)
    {
        _1112 = 1.0;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (_1000)
    {
        _1114 = _1100;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (_1000)
    {
        _918 = _1102;
    }
    float _1128 = _918;
    float _1130 = _1128;
    if (_1000)
    {
        _564 = _1104;
    }
    float _1132 = _564;
    float _1134 = _1132;
    if (!_1000)
    {
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1138 = _550 + _1136;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1142 = _504 + _1140;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1146 = -_504;
        float _1148 = _1146 + _1100;
        float _1150 = _1138 * _1138;
        float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1154 = _570 + _1152;
        float _1156 = -_570;
        float _1158 = _1156 + _1104;
        float _1160 = fma(_1142, _1142, _1150);
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1164 = fma(_1154, _1154, _1160);
        float _1166 = sqrt(_1164);
        float _1168 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = precise::min(_1166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1172 = _1170 * _1162;
        float _1174 = _1168 * _1172;
        float _1176 = -_550;
        float _1178 = _1176 + _1102;
        float _1180 = fma(_1148, _1174, _504);
        float _1182 = fma(_1178, _1174, _550);
        float _1184 = fma(_1158, _1174, _570);
        _1130 = _1182;
        _1126 = _1180;
        _1134 = _1184;
    }
    float _1186 = _1130;
    float _1188 = _1126;
    float _1190 = _1134;
    if (!_1014)
    {
        float _1192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1194 = _1192 * 0.15915493667125701904296875;
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1200 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1198);
        float _1202 = _1194 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1196 * 0.15915493667125701904296875;
        float _1208 = _1194 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1216 * _1218;
        float _1226 = 1.0 / _1200;
        float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1230 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1228;
        float _1232 = 1.0 / _1224;
        float _1234 = 1.0 / _1230;
        float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1238 = _1226 * _1236;
        float _1240 = _1222 * _1232;
        float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1244 = fma(_1240, _1238, _1242);
        float _1246 = _1244 * _1234;
        float _1248 = precise::clamp(_1246, 0.0, 1.0);
        _1116 = _1200;
        _1122 = _1248;
    }
    float _1250 = _1116;
    float _1252 = _1122;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1256 = _1186 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1260 = _1188 + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1264 = _1190 + _1262;
    float _1266 = _1256 * _1256;
    float _1268 = fma(_1260, _1260, _1266);
    float _1270 = fma(_1264, _1264, _1268);
    float _1272 = rsqrt(_1270);
    float _1274 = sqrt(_1270);
    float _1276 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1278 = _1260 * _1276;
    float _1280 = _1264 * _1276;
    float _1282 = _1278 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 + _1284;
    float _1288 = sqrt(_1286);
    bool _1290 = _1288 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = _1288 + _1292;
    float _1296 = _1264;
    float _1298 = _1286;
    float _1300 = _1294;
    float _1302 = _1250;
    float _1304 = _1256;
    if (_1290)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1306;
    }
    float _1308 = _1296;
    if (_1290)
    {
        float _1310 = rsqrt(_1286);
        _1298 = _1310;
    }
    float _1312 = _1298;
    float _1314 = _1312;
    if (_1290)
    {
        float _1316 = _1294 * _1308;
        _1300 = _1316;
    }
    float _1318 = _1300;
    if (_1290)
    {
        float _1320 = _1318 * 0.15915493667125701904296875;
        _1302 = _1320;
    }
    float _1322 = _1302;
    float _1324 = _1308;
    float _1326 = _1322;
    if (_1290)
    {
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        _1324 = _1330;
    }
    float _1332 = _1324;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = precise::max(0.0, _1334);
    float _1338 = _1268;
    float _1340 = _1336;
    if (_1290)
    {
        float _1342 = _1322 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1338 = _1344;
    }
    float _1346 = _1338;
    float _1348 = -_1276;
    float _1350 = -_1336;
    float _1352 = fma(_1256, _1348, _1350);
    if (_1290)
    {
        float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    float _1360 = _1332;
    if (_1290)
    {
        float _1362 = fma(_1332, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1364;
    if (!_1290)
    {
        _1360 = _1278;
    }
    float _1368 = _1360;
    float _1370 = _1368;
    float _1372 = _1346;
    if (_1290)
    {
        float _1374 = _1346 + (-1.0);
        _1304 = _1374;
    }
    float _1376 = _1304;
    float _1378 = _1376;
    if (_1290)
    {
        float _1380 = _1312 * _1364;
        _1118 = _1380;
    }
    float _1382 = _1118;
    if (!_1290)
    {
        _1366 = _1352;
    }
    float _1384 = _1366;
    float _1386 = _1384;
    if (_1290)
    {
        float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1326 = _1388;
    }
    float _1390 = _1326;
    if (_1290)
    {
        float _1392 = _1278 * _1382;
        _1370 = _1392;
    }
    float _1394 = _1370;
    if (!_1290)
    {
        _1378 = _1280;
    }
    float _1396 = _1378;
    float _1398 = _1396;
    if (_1290)
    {
        float _1400 = _1280 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    if (!_1290)
    {
        _1314 = _1282;
    }
    float _1404 = _1314;
    float _1406 = _1404;
    if (_1290)
    {
        float _1408 = fma(_1352, _1346, _1390);
        _1386 = _1408;
    }
    float _1410 = _1386;
    if (_1290)
    {
        float _1412 = _1394 * _1394;
        _1406 = _1412;
    }
    float _1414 = _1406;
    if (!_1290)
    {
        _1372 = _1284;
    }
    float _1416 = _1372;
    float _1418 = _1416;
    if (_1290)
    {
        float _1420 = _1402 * _1402;
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = fma(_1410, _1410, _1414);
    float _1426 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1428 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1430 = _1424 + _1422;
    float _1432 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1426);
    float _1434 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1438 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1436);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1444 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1432);
    float _1446 = rsqrt(_1430);
    float _1448 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1450 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1452 = -_1440;
    float _1454 = _1452 + 1.0;
    float _1456 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1442);
    float _1458 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1448);
    float _1460 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1450);
    float _1462 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1464 = abs(_1454);
    float _1466 = log2(_1464);
    float _1468 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1472 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1456);
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1478 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1480 = _1446 * _1394;
    float _1482 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1484 = _1446 * _1410;
    float _1486 = _1446 * _1402;
    float _1488 = -_1474;
    float _1490 = fma(_1488, _1428, 1.0);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1482);
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1496 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1492);
    float _1502 = -_1494;
    float _1504 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1502);
    float _1506 = log2(_1490);
    float _1508 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1510 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1500);
    float _1512 = -_1486;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1504);
    float _1516 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1518 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1484 + 1.0;
    float _1522 = fma(_1514, -0.5, 0.5);
    float _1524 = exp2(_1498);
    float _1526 = fma(_1514, 0.5, 0.5);
    float _1528 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1516);
    float _1530 = fma(_1526, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1534 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1536 = 1.0 / _1510;
    float _1538 = fma(_1526, _1530, -0.212114393711090087890625);
    float _1540 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1532);
    float _1542 = _1506 * 0.693147182464599609375;
    float _1544 = fma(_1526, _1538, 1.570728778839111328125);
    float _1546 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1548 = sqrt(_1522);
    float _1550 = -_1484;
    float _1552 = fma(_1524, _1520, _1550);
    float _1554 = fma(_1552, 0.5, 0.5);
    float _1556 = _1540 * _1536;
    float _1558 = _1534 * _1536;
    float _1560 = fma(_1556, 0.5, 0.5);
    float _1562 = fma(_1558, -0.5, 0.5);
    float _1564 = _1548 * 0.636619746685028076171875;
    float3 _4591 = float3(_1560, _1562, _1546);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4591, float3(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4591, float3(0.0), isnan(_4591)), level(0.0)).x;
    float _1568 = -_1544;
    float _1570 = fma(_1564, _1568, 1.0);
    float3 _4607 = float3(_1560, _1562, _1546);
    float4 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).xyzw;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = _1573.w;
    float2 _4624 = float2(_1570, _1554);
    float3 _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4624, float2(0.0), isnan(_4624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4624, float2(0.0), isnan(_4624)), level(0.0)).xyz;
    float _1587 = _1585.x;
    float _1589 = _1585.y;
    float _1591 = _1585.z;
    float _1593 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1595 = _808 * _854;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1601 = _364 > 0.5;
    float _1603 = exp2(_1593);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = in.m_69.x;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1617 = _1615 != 0;
    float _1619 = -_796;
    float _1621 = fma(_1619, _842, _1595);
    bool _1623 = _372 > 0.5;
    bool _1625 = _1623 && _1607;
    float _1627 = in.m_69.y;
    float _1629 = 1.0 / _1599;
    float _1631 = fma(_810, _700, _1621);
    bool _1633 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1635 = isnan(_336);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    bool _1645 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1647 = isnan(_336);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = 1.0 / _1613;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1663 = -_1643;
    float _1665 = _1663 + 1.0;
    bool _1667 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1669 = isnan(_336);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1679;
    float _1683 = -_1655;
    float _1685 = _1683 + 1.0;
    float _1687 = _1655 * _1665;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1693 = _1681 * _1629;
    bool _1695 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1697 = isnan(_336);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1677 * _1685;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1711 = _336 + _1709;
    float _1713 = -_1677;
    float _1715 = _1713 + 1.0;
    float _1717 = 1.0 / _1661;
    float _1719 = fma(_1693, _1711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1721 = _1691 * _1657;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1725 = _336 + _1723;
    float _1727 = _1705 * _1715;
    float _1729 = -_1705;
    float _1731 = _1729 + 1.0;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1733;
    float _1737 = fma(_1721, _1725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1739 = _1719 * _1727;
    float _1741 = _1725;
    float _1743 = _1609;
    float _1745 = _1510;
    float _1747 = _1534;
    float _1749 = _1540;
    if (_1607)
    {
        _1741 = _1609;
    }
    float _1751 = _1741;
    float _1753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1757 = _336 + _1755;
    float _1759 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1739);
    float _1761 = -_1627;
    float _1763 = _1761 + 1.0;
    float _1765 = _1751;
    float _1767 = _1627;
    if (_1625)
    {
        float _1769 = -_1751;
        float _1771 = _1769 + 1.0;
        _1765 = _1771;
    }
    float _1773 = _1765;
    float _1775 = _1735 * _1717;
    float _1777 = fma(_1737, _1707, _1759);
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1617)
    {
        float _1781 = _1601 ? _1763 : _1627;
        _1767 = _1781;
    }
    float _1783 = _1767;
    float _1785 = fma(_1775, _1757, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1607)
    {
        _1743 = _1773;
    }
    float _1787 = _1743;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1791 = _758 != 0.0;
    bool _1793 = isnan(_758);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan(0.0);
    bool _1799 = _1795 || _1797;
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1803 = fma(_1785, _1687, _1777);
    float _1805 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1807 = _1801 * _1753;
    float _1809 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1803);
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1813 = _756 == 0.0;
    bool _1815 = !_1799;
    bool _1817 = _1813 && _1815;
    float _1819 = _1805 * _1779;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _808 * _874;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1835 = _724 == 0.0;
    bool _1837 = _1835 && _1817;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1843 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1829;
    out.m_71.y = _1833;
    out.m_71.z = _1825;
    out.m_71.w = _1823;
    float _1845 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = _1809 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1851 = in.m_73.x;
    float _1853 = in.m_73.y;
    float _1855 = in.m_73.z;
    float _1857 = _814 * _874;
    float _1859 = _808 * _860;
    float _1861 = _832 * _860;
    out.m_75.x = _1843;
    out.m_75.y = _1845;
    out.m_75.z = _1847;
    out.m_75.w = _1849;
    float _1863 = _832 * _874;
    float _1865 = fma(_802, _838, _1857);
    float _1867 = _814 * _860;
    out.m_77.x = _1819;
    out.m_77.y = _1807;
    float _1869 = fma(_812, _838, _1863);
    float _1871 = -_796;
    float _1873 = fma(_1871, _838, _1831);
    float _1875 = _814 * _854;
    float _1877 = -_1603;
    float _1879 = _1877 + 1.0;
    float _1881 = _832 * _854;
    float _1883 = fma(_802, _842, _1875);
    float _1885 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1887 = fma(_812, _842, _1881);
    float _1889 = fma(_810, _712, _1873);
    float _1891 = -_796;
    float _1893 = fma(_1891, _836, _1859);
    float _1895 = fma(_812, _836, _1861);
    float _1897 = fma(_822, _712, _1865);
    float _1899 = fma(_802, _836, _1867);
    float _1901 = fma(_810, _696, _1893);
    float _1903 = _1853;
    float _1905 = _1851;
    float _1907 = _1855;
    if (!_1837)
    {
        float _1909 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1853);
        _1903 = _1909;
    }
    float _1911 = _1903;
    if (!_1837)
    {
        float _1913 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1851);
        _1905 = _1913;
    }
    float _1915 = _1905;
    float _1917 = fma(_818, _696, _1895);
    float _1919 = fma(_818, _712, _1869);
    float _1921 = _1889 * _1911;
    if (!_1837)
    {
        float _1923 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _1907 = _1923;
    }
    float _1925 = _1907;
    float _1927 = _1901 * _1911;
    float _1929 = _1631 * _1911;
    float _1931 = fma(_1897, _1915, _1921);
    float _1933 = fma(_822, _696, _1899);
    float _1935 = fma(_822, _700, _1883);
    float _1937 = fma(_818, _700, _1887);
    float _1939 = fma(_1919, _1925, _1931);
    float _1941 = fma(_1933, _1915, _1927);
    float _1943 = fma(_1935, _1915, _1929);
    float _1945 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1947 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1949 = isnan(_1274);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1955 = _1951 || _1953;
    float _1957 = fma(_1917, _1925, _1941);
    float _1959 = fma(_1937, _1925, _1943);
    float _1961 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1963 = _1540 + _1510;
    float _1965 = _1510 * 0.5;
    out.m_79.x = _1957;
    out.m_79.y = _1939;
    out.m_79.z = _1959;
    float _1967 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1961);
    float _1969 = _1963 * 0.5;
    float _1971 = fma(_1534, -0.5, _1965);
    float _1973 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1975 = _1973 + _1510;
    out.gl_Position.x = _1540;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1510;
    float _1977 = _1975 * 0.5;
    out.m_81.x = _1969;
    out.m_81.y = _1971;
    out.m_81.z = _1977;
    out.m_81.w = _1510;
    float _1979 = _1973;
    float _1981 = _1969;
    if (!_1955)
    {
        _1745 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1983 = _1745;
    float _1985 = _1983;
    float _1987 = _1983;
    if (!_1955)
    {
        _1979 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1989 = _1979;
    float _1991 = _1989;
    float _1993 = _1989;
    if (!_1955)
    {
        _1747 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1995 = _1747;
    float _1997 = _1995;
    float _1999 = _1995;
    if (!_1955)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2001 = _1749;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1955)
    {
        _1981 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1981;
    float _2009 = _1885 * _1566;
    float _2011 = -_1885;
    float _2013 = _2011 + 1.0;
    float _2015 = _1581 * _2009;
    float _2017 = _1581 * _2013;
    float _2019 = _1591 * _2009;
    float _2021 = fma(_1587, _2015, _1575);
    float _2023 = fma(_1589, _2015, _1577);
    float _2025 = _2015;
    float _2027 = _2007;
    float _2029 = _2007;
    if (!_1955)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2031 = _2025;
    float _2033 = fma(_1581, _2019, _1579);
    out.m_83.x = _2021;
    out.m_83.y = _2023;
    out.m_83.z = _2033;
    out.m_83.w = _2017;
    bool _2035 = !_1955;
    float _2037 = _2031;
    float _2039 = _2031;
    if (!_2035)
    {
        bool _2041 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2043 = isnan(_1274);
        bool _2045 = _2041 || _2043;
        bool _2047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2049 = _2045 || _2047;
        if (!_2049)
        {
            float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2053 = _1274 + _2051;
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2055;
            float _2059 = 1.0 / _2057;
            float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2081 = _2053 * _2059;
            float _2083 = precise::clamp(_2081, 0.0, 1.0);
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2089 = fma(_2083, _2063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2091 = fma(_2083, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2093 = fma(_2083, _2067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2095 = fma(_2083, _2071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2097 = fma(_2083, _2075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2099 = fma(_2083, _2079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2029 = _2091;
            _1999 = _2097;
            _2039 = _2089;
            _1993 = _2095;
            _1987 = _2093;
            _2005 = _2099;
            _2101 = true;
        }
        else
        {
            bool _2103 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2105 = isnan(_1274);
            bool _2107 = _2103 || _2105;
            bool _2109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2111 = _2107 || _2109;
            if (!_2111)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2113 = _2037;
            _2039 = _2113;
            if (!_2111)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2115 = _2027;
            _2029 = _2115;
            if (!_2111)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2117 = _1985;
            _1987 = _2117;
            if (!_2111)
            {
                _1991 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2119 = _1991;
            _1993 = _2119;
            if (!_2111)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2121 = _1997;
            _1999 = _2121;
            if (!_2111)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2123 = _2003;
            bool _2125 = !_2111;
            _2005 = _2123;
            if (!_2125)
            {
                bool _2127 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2129 = isnan(_1274);
                bool _2131 = _2127 || _2129;
                bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2135 = _2131 || _2133;
                if (!_2135)
                {
                    float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2139 = _1274 + _2137;
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2141;
                    float _2145 = 1.0 / _2143;
                    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2167 = _2139 * _2145;
                    float _2169 = precise::clamp(_2167, 0.0, 1.0);
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2175 = fma(_2169, _2149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2177 = fma(_2169, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2179 = fma(_2169, _2153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2181 = fma(_2169, _2157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2183 = fma(_2169, _2161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2185 = fma(_2169, _2165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2029 = _2177;
                    _1999 = _2183;
                    _2039 = _2175;
                    _1993 = _2181;
                    _1987 = _2179;
                    _2005 = _2185;
                    _2101 = true;
                }
                else
                {
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1993 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2101 = false;
    float _2187 = _2029;
    float _2189 = _1999;
    float _2191 = _2039;
    float _2193 = _1993;
    float _2195 = _1987;
    float _2197 = _2005;
    float _2199 = fma(_1939, -0.5, 0.5);
    float _2201 = precise::clamp(_2199, 0.0, 1.0);
    float _2203 = -_2187;
    float _2205 = _2203 + _2189;
    float _2207 = _1252 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2209 = -_2191;
    float _2211 = _2209 + _2193;
    float _2213 = fma(_2201, _2205, _2187);
    out.m_85.x = 0.0;
    float _2215 = -_2195;
    float _2217 = _2215 + _2197;
    float _2219 = fma(_2201, _2211, _2191);
    float _2221 = _2213 * 0.586610972881317138671875;
    out.m_47.x = _2207;
    bool _2223 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2225 = fma(_2201, _2217, _2195);
    float _2227 = fma(_2219, 0.298911988735198974609375, _2221);
    bool _2229 = _1252 > 0.0;
    bool _2231 = isnan(_1252);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.0);
    bool _2237 = _2233 || _2235;
    float _2239 = fma(_2225, 0.114477999508380889892578125, _2227);
    float _2241 = -_2239;
    float _2243 = _2219 + _2241;
    float _2245 = -_2239;
    float _2247 = _2213 + _2245;
    float _2249 = -_2239;
    float _2251 = _2225 + _2249;
    float _2253 = fma(_2243, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    float _2255 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    float _2257 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    bool _2259 = !_2223;
    if (!_2259)
    {
        float _2261 = -_1186;
        float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2265 = -_1188;
        float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2269 = -_1190;
        float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2273 = _2263 * _2263;
        float _2275 = fma(_2267, _2267, _2273);
        float _2277 = fma(_2271, _2271, _2275);
        float _2279 = sqrt(_2277);
        float _2281 = rsqrt(_2277);
        float _2283 = -_2279;
        float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2289 = precise::clamp(_2287, 0.0, 1.0);
        float _2291 = _2267 * _2281;
        float _2293 = _2263 * _2281;
        float _2295 = abs(_2289);
        float _2297 = log2(_2295);
        float _2299 = _2271 * _2281;
        float _2301 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2303 = _1939 * _2293;
        float _2305 = -_2293;
        float _2307 = -_2301;
        float _2309 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2307);
        float _2311 = fma(_1957, _2291, _2303);
        float _2313 = -_2299;
        float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2309);
        float _2317 = fma(_1959, _2299, _2311);
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2323 = _2315 + _2321;
        float _2325 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = exp2(_2325);
        float _2333 = _2331 * _2329;
        float _2335 = _2319 * _2333;
        float _2337 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2341 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2337;
        out.m_85.y = _2339;
        out.m_85.z = _2341;
    }
    out.m_87.x = _2253;
    out.m_87.y = _2255;
    out.m_87.z = _2257;
    if (_2237)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2343 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2343;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2101 = false;
    bool _334 = false;
    bool _226 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2401 = as_type<float>(_122);
        out.gl_Position.z = _2401;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_49.w;
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
    float _150 = _132;
    if (_148)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _114;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _124 = as_type<int>(_154);
    }
    int _156 = _124;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2465 = as_type<float>(_156);
        out.gl_Position.z = _2465;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.x;
    float _160 = in.m_51.y;
    float _162 = in.m_51.z;
    float _164 = 1.0 / _128;
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _168 = in.m_53.x;
    float _170 = in.m_53.y;
    float _172 = in.m_53.z;
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    float _180 = in.m_57.x;
    float _182 = in.m_57.y;
    float _184 = in.m_57.z;
    float _186 = _132 * _164;
    float _188 = _160 * _170;
    float _190 = _160 * _176;
    float _192 = fma(_158, _168, _188);
    float _194 = _160 * _182;
    float _196 = fma(_158, _174, _190);
    float _198 = fma(_162, _172, _192);
    float _200 = fma(_158, _180, _194);
    float _202 = fma(_162, _178, _196);
    float _204 = fma(_162, _184, _200);
    bool _206 = !_166;
    float _224;
    if (!_206)
    {
        float _208 = in.m_59.x;
        float _210 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _212 = _208 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _214 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[12].x, _132);
        float _216 = _214 * _210;
        float _218 = floor(_216);
        float _220 = -_218;
        float _222 = _216 + _220;
        _224 = _222;
        _226 = true;
    }
    else
    {
        _224 = _186;
    }
    _226 = false;
    float _228 = _224;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _228 + _230;
    bool _234 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _236 = isnan(_228);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _246;
    bool _250 = _228 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _252 = isnan(_228);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = -_244;
    float _264 = _262 + 1.0;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _266;
    float _270 = 1.0 / _248;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = _260 * _264;
    float _276 = -_260;
    float _278 = _276 + 1.0;
    float _280 = _232 * _270;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _282;
    float _286 = fma(_268, _280, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _288;
    float _292 = fma(_284, _280, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _294 = fma(_290, _280, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _296 = _286 * _274;
    float _298 = _292 * _274;
    float _300 = _294 * _274;
    float _302 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].x, _296);
    float _304 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].y, _300);
    float _306 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[143].z, _298);
    float _308 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].x, _302);
    float _310 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].y, _304);
    float _312 = fma(_244, (*spvDescriptorSet0.vp_c9)._m0[144].z, _306);
    bool _314 = !_272;
    float _332;
    if (!_314)
    {
        float _316 = in.m_59.x;
        float _318 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _320 = _316 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _322 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[11].y, _132);
        float _324 = _322 * _318;
        float _326 = floor(_324);
        float _328 = -_326;
        float _330 = _324 + _328;
        _332 = _330;
        _334 = true;
    }
    else
    {
        _332 = _186;
    }
    _334 = false;
    float _336 = _332;
    float _338 = in.m_59.z;
    float _340 = in.m_61.x;
    float _342 = in.m_61.y;
    float _344 = in.m_61.z;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _348 = _346 != 0;
    int _350 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _352 = _350 != 0;
    int _354 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _356 = _354 != 0;
    float _358 = in.m_44.x;
    float _360 = in.m_44.y;
    float _362 = in.m_44.z;
    float _364 = in.m_59.y;
    float _366 = in.m_63.x;
    float _368 = in.m_63.y;
    float _370 = in.m_63.z;
    float _372 = in.m_59.x;
    float _374 = _338 * 2.0;
    float _376 = fma(_342, 2.0, -1.0);
    float _378 = fma(_340, 2.0, -1.0);
    float _380 = floor(_374);
    float _382 = fma(_344, 2.0, -1.0);
    float _384 = _182 * _360;
    float _386 = _170 * _360;
    float _388 = _176 * _360;
    float _390 = fma(_180, _358, _384);
    float _392 = fma(_168, _358, _386);
    float _394 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _396 = log2(_394);
    float _398 = _364 + _338;
    float _400 = _312 * _370;
    float _402 = fma(_184, _362, _390);
    float _404 = _364 * 2.0;
    float _406 = _398 + (-1.0);
    float _408 = _372 * 2.0;
    float _410 = fma(_174, _358, _388);
    bool _412 = _380 > 0.0;
    float _414 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _416 = floor(_408);
    float _418 = fma(_178, _362, _410);
    bool _420 = _380 >= 0.0;
    bool _422 = isnan(_380);
    bool _424 = _420 || _422;
    bool _426 = isnan(0.0);
    bool _428 = _424 || _426;
    float _430 = in.m_53.w;
    float _432 = _372 + _364;
    float _434 = _396 * _132;
    int _436 = _428 ? 0 : 1;
    float _438 = floor(_404);
    float _440 = _432 + (-1.0);
    float _442 = fma(_172, _362, _392);
    int _444 = ~_436;
    int _446 = _444 + 1;
    int _448 = _446 + 1;
    float _450 = in.m_55.w;
    int _452 = _448;
    if (!_412)
    {
        int _454 = ~_436;
        int _456 = _454 + 1;
        _452 = _456;
    }
    int _458 = _452;
    float _460 = _308 * _366;
    float _462 = exp2(_434);
    float _464 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _466 = _416 > 0.0;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _470 = 1.0 + _468;
    bool _472 = _416 >= 0.0;
    bool _474 = isnan(_416);
    bool _476 = _472 || _474;
    bool _478 = isnan(0.0);
    bool _480 = _476 || _478;
    float _482 = in.m_57.w;
    bool _484 = !_348;
    int _486 = _484 ? 0 : 1;
    float _488 = _310 * _368;
    bool _490 = _438 > 0.0;
    float _492 = 1.0 / _470;
    bool _494 = _438 >= 0.0;
    bool _496 = isnan(_438);
    bool _498 = _494 || _496;
    bool _500 = isnan(0.0);
    bool _502 = _498 || _500;
    float _504 = _442 + _430;
    float _506 = in.m_65.x;
    float _508 = in.m_65.y;
    float _510 = in.m_65.z;
    bool _512 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _514 = isnan(1.0);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _520 = _516 || _518;
    float _522 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    int _524 = abs(_486);
    float _526 = -_462;
    float _528 = _526 + 1.0;
    int _530 = _480 ? 0 : 1;
    float _532 = abs(_186);
    float _534 = log2(_532);
    bool _536 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _544 = _540 || _542;
    float _546 = _488 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _548 = float(_524);
    float _550 = _418 + _450;
    float _552 = float(_458);
    float _554 = _544 ? _528 : 0.0;
    bool _556 = !_352;
    int _558 = _556 ? 0 : 1;
    float _560 = _548 * _552;
    int _562 = _502 ? 0 : 1;
    float _564 = _460;
    if (_520)
    {
        float _566 = _554 * _492;
        _150 = _566;
    }
    float _568 = _150;
    float _570 = _402 + _482;
    float _572 = _560 * (-2.0);
    float _574 = _372 + (-0.5);
    int _576 = ~_530;
    int _578 = _576 + 1;
    int _580 = _578 + 1;
    float _582 = -_550;
    float _584 = _582 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _586 = fma(_572, _506, _506);
    int _588 = abs(_558);
    float _590 = fma(_464, _572, _464);
    int _592 = _580;
    if (!_466)
    {
        int _594 = ~_530;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[196].x, _586);
    int _602 = ~_562;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = _534 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _610 = _606;
    if (!_490)
    {
        int _612 = ~_562;
        int _614 = _612 + 1;
        _610 = _614;
    }
    int _616 = _610;
    float _618 = -_504;
    float _620 = _618 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _622 = float(_588);
    float _624 = _584 * _584;
    float _626 = float(_598);
    float _628 = -_570;
    float _630 = _628 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _632 = fma(_590, _568, _600);
    float _634 = fma(_620, _620, _624);
    bool _636 = !_356;
    int _638 = _636 ? 0 : 1;
    float _640 = _622 * _626;
    float _642 = float(_616);
    float _644 = fma(_630, _630, _634);
    int _646 = abs(_638);
    float _648 = _640 * (-2.0);
    float _650 = exp2(_608);
    float _652 = in.m_67.x;
    float _654 = in.m_67.y;
    float _656 = in.m_67.z;
    float _658 = _632 * 0.15915493667125701904296875;
    float _660 = fma(_414, _648, _414);
    float _662 = fma(_648, _508, _508);
    float _664 = _364 + (-0.5);
    float _666 = float(_646);
    float _668 = rsqrt(_644);
    float _670 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _662);
    float _672 = _372 + _338;
    float _674 = _666 * _642;
    float _676 = _338 + (-0.5);
    float _678 = fma(_660, _568, _670);
    float _680 = _672 + (-1.0);
    float _682 = _674 * (-2.0);
    float _684 = _678 * 0.15915493667125701904296875;
    float _686 = _658 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _692 = fma(_682, _510, _510);
    float _694 = fma(_690, _682, _690);
    float _696 = _620 * _668;
    float _698 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[196].z, _692);
    float _700 = _630 * _668;
    float _702 = -_656;
    float _704 = _382 + _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _708 = _696 * _706;
    float _710 = fma(_694, _568, _698);
    float _712 = _584 * _668;
    float _714 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _716 = _700 * _714;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _720 = -_708;
    float _722 = fma(_700, _718, _720);
    float _724 = fma(_650, _704, _656);
    float _726 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _728 = _712 * _726;
    float _730 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _732 = -_716;
    float _734 = fma(_712, _730, _732);
    float _736 = _722 * _722;
    float _738 = -_652;
    float _740 = _378 + _738;
    float _742 = -_654;
    float _744 = _376 + _742;
    float _746 = _710 * 0.15915493667125701904296875;
    float _748 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _750 = -_728;
    float _752 = fma(_696, _748, _750);
    float _754 = fma(_734, _734, _736);
    float _756 = fma(_650, _740, _652);
    float _758 = fma(_650, _744, _654);
    float _760 = _658 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = fma(_752, _752, _754);
    float _766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _724);
    float _768 = _460 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _756);
    float _772 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _758);
    float _774 = _684 * 6.283185482025146484375;
    float _776 = cos(_774);
    float _778 = _768 * _770;
    float _780 = _546 * _772;
    float _782 = _746 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _684 * 6.283185482025146484375;
    float _788 = sin(_786);
    float _790 = _688 * _776;
    float _792 = _762 * _776;
    float _794 = _746 * 6.283185482025146484375;
    float _796 = sin(_794);
    float _798 = rsqrt(_764);
    float _800 = _522 * _766;
    float _802 = _776 * _784;
    float _804 = _762 * _788;
    float _806 = _688 * _788;
    float _808 = _762 * _784;
    float _810 = _688 * _784;
    float _812 = _788 * _784;
    float _814 = fma(_796, _792, _806);
    float _816 = _808 * _780;
    float _818 = fma(_796, _806, _792);
    float _820 = -_804;
    float _822 = fma(_796, _790, _820);
    float _824 = -_780;
    float _826 = _796 * _824;
    float _828 = fma(_814, _778, _816);
    float _830 = -_790;
    float _832 = fma(_796, _804, _830);
    float _834 = _810 * _780;
    float _836 = _734 * _798;
    float _838 = _722 * _798;
    float _840 = fma(_802, _778, _826);
    float _842 = _752 * _798;
    float _844 = _712 * _836;
    float _846 = fma(_832, _800, _828);
    float _848 = _700 * _838;
    float _850 = fma(_822, _778, _834);
    float _852 = -_844;
    float _854 = fma(_696, _838, _852);
    float _856 = fma(_812, _800, _840);
    float _858 = -_848;
    float _860 = fma(_712, _842, _858);
    float _862 = fma(_818, _800, _850);
    float _864 = _854 * _846;
    float _866 = _696 * _842;
    float _868 = _860 * _846;
    float _870 = fma(_842, _856, _864);
    float _872 = -_866;
    float _874 = fma(_700, _836, _872);
    float _876 = fma(_836, _856, _868);
    float _878 = fma(_700, _862, _870);
    float _880 = fma(_696, _862, _876);
    float _882 = _570 + _878;
    float _884 = _504 + _880;
    float _886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _888 = _882 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _892 = _884 + _890;
    float _894 = _888 * _888;
    float _896 = fma(_892, _892, _894);
    float _898 = _874 * _846;
    float _900 = sqrt(_896);
    float _902 = fma(_838, _856, _898);
    float _904 = fma(_712, _862, _902);
    float _906 = _550 + _904;
    bool _908 = _900 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _910 = _862;
    float _912 = _884;
    float _914 = _898;
    float _916 = _896;
    float _918 = _658;
    if (!_908)
    {
        _910 = _884;
    }
    float _920 = _910;
    float _922 = _920;
    if (!_908)
    {
        _912 = _882;
    }
    float _924 = _912;
    float _926 = _924;
    if (!_908)
    {
        _914 = _906;
    }
    float _928 = _914;
    bool _930 = !_908;
    float _932 = _928;
    if (!_930)
    {
        float _934 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _936 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _938 = _900 + _936;
        float _940 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _942 = rsqrt(_896);
        float _944 = _938 * _934;
        float _946 = _944 * 0.15915493667125701904296875;
        float _948 = _946 * 6.283185482025146484375;
        float _950 = sin(_948);
        float _952 = _946 * 6.283185482025146484375;
        float _954 = cos(_952);
        float _956 = fma(_950, _940, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _958 = _942 * _956;
        float _960 = _954 + (-1.0);
        float _962 = fma(_892, _958, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _964 = fma(_888, _958, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _966 = _960 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _968 = fma(_906, _954, _966);
        _932 = _968;
        _922 = _962;
        _926 = _964;
    }
    float _970 = _932;
    float _972 = _922;
    float _974 = _926;
    float _976 = -_550;
    float _978 = _976 + _970;
    float _980 = -_504;
    float _982 = _980 + _972;
    float _984 = -_570;
    float _986 = _984 + _974;
    float _988 = _550 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _990 = _978 * _978;
    bool _992 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _994 = isnan(0.5);
    bool _996 = _992 || _994;
    bool _998 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1000 = _996 || _998;
    float _1002 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[11].x, _988);
    float _1004 = fma(_982, _982, _990);
    bool _1006 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1008 = isnan(0.5);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1014 = _1010 || _1012;
    float _1016 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1002);
    float _1018 = fma(_986, _986, _1004);
    float _1020 = _550 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1022 = _1016 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1024 = sqrt(_1018);
    float _1026 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1020);
    float _1028 = fma(_570, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1026);
    float _1030 = 1.0 / _1022;
    float _1032 = _1028 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1034 = _1032 + _1022;
    bool _1036 = _1024 > 0.0;
    float _1038 = _1034 * _1030;
    float _1040 = _1038 * 0.5;
    bool _1042 = !_1036;
    float _1044 = _972;
    float _1046 = _970;
    float _1048 = _974;
    float _1050 = _1022;
    float _1052 = _1024;
    if (!_1042)
    {
        float _1054 = _202 * _202;
        float _1056 = fma(_198, _198, _1054);
        float _1058 = fma(_204, _204, _1056);
        float _1060 = rsqrt(_1018);
        float _1062 = sqrt(_1058);
        float _1064 = _982 * _1060;
        float _1066 = _978 * _1060;
        float _1068 = _986 * _1060;
        bool _1070 = _1062 > 0.0;
        bool _1072 = !_1070;
        _916 = _1068;
        _1050 = _1058;
        _1052 = _1066;
        if (!_1072)
        {
            float _1074 = rsqrt(_1058);
            float _1076 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1078 = _202 * _1074;
            float _1080 = _198 * _1074;
            float _1082 = _204 * _1074;
            float _1084 = _1066 * _1078;
            float _1086 = fma(_1064, _1080, _1084);
            float _1088 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1090 = fma(_1068, _1082, _1086);
            float _1092 = _1090 * _1088;
            float _1094 = fma(_198, _1092, _972);
            float _1096 = fma(_202, _1092, _970);
            float _1098 = fma(_204, _1092, _974);
            _1044 = _1094;
            _1046 = _1096;
            _1048 = _1098;
        }
    }
    float _1100 = _1044;
    float _1102 = _1046;
    float _1104 = _1048;
    float _1106 = _916;
    float _1108 = _1050;
    float _1110 = _1052;
    float _1112 = _1110;
    float _1114 = _1106;
    float _1116 = _1100;
    float _1118 = _1108;
    if (_1014)
    {
        _1112 = 1.0;
    }
    float _1120 = _1112;
    float _1122 = _1120;
    if (_1000)
    {
        _1114 = _1100;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (_1000)
    {
        _918 = _1102;
    }
    float _1128 = _918;
    float _1130 = _1128;
    if (_1000)
    {
        _564 = _1104;
    }
    float _1132 = _564;
    float _1134 = _1132;
    if (!_1000)
    {
        float _1136 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1138 = _550 + _1136;
        float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1142 = _504 + _1140;
        float _1144 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1146 = -_504;
        float _1148 = _1146 + _1100;
        float _1150 = _1138 * _1138;
        float _1152 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1154 = _570 + _1152;
        float _1156 = -_570;
        float _1158 = _1156 + _1104;
        float _1160 = fma(_1142, _1142, _1150);
        float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1164 = fma(_1154, _1154, _1160);
        float _1166 = sqrt(_1164);
        float _1168 = _1144 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = precise::min(_1166, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1172 = _1170 * _1162;
        float _1174 = _1168 * _1172;
        float _1176 = -_550;
        float _1178 = _1176 + _1102;
        float _1180 = fma(_1148, _1174, _504);
        float _1182 = fma(_1178, _1174, _550);
        float _1184 = fma(_1158, _1174, _570);
        _1130 = _1182;
        _1126 = _1180;
        _1134 = _1184;
    }
    float _1186 = _1130;
    float _1188 = _1126;
    float _1190 = _1134;
    if (!_1014)
    {
        float _1192 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1194 = _1192 * 0.15915493667125701904296875;
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1198 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1200 = fma(_1040, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1198);
        float _1202 = _1194 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1196 * 0.15915493667125701904296875;
        float _1208 = _1194 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1216 * _1218;
        float _1226 = 1.0 / _1200;
        float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1230 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1228;
        float _1232 = 1.0 / _1224;
        float _1234 = 1.0 / _1230;
        float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1238 = _1226 * _1236;
        float _1240 = _1222 * _1232;
        float _1242 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1244 = fma(_1240, _1238, _1242);
        float _1246 = _1244 * _1234;
        float _1248 = precise::clamp(_1246, 0.0, 1.0);
        _1116 = _1200;
        _1122 = _1248;
    }
    float _1250 = _1116;
    float _1252 = _1122;
    float _1254 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1256 = _1186 + _1254;
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1260 = _1188 + _1258;
    float _1262 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1264 = _1190 + _1262;
    float _1266 = _1256 * _1256;
    float _1268 = fma(_1260, _1260, _1266);
    float _1270 = fma(_1264, _1264, _1268);
    float _1272 = rsqrt(_1270);
    float _1274 = sqrt(_1270);
    float _1276 = _1272 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1278 = _1260 * _1276;
    float _1280 = _1264 * _1276;
    float _1282 = _1278 * _1278;
    float _1284 = _1280 * _1280;
    float _1286 = _1282 + _1284;
    float _1288 = sqrt(_1286);
    bool _1290 = _1288 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1294 = _1288 + _1292;
    float _1296 = _1264;
    float _1298 = _1286;
    float _1300 = _1294;
    float _1302 = _1250;
    float _1304 = _1256;
    if (_1290)
    {
        float _1306 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1296 = _1306;
    }
    float _1308 = _1296;
    if (_1290)
    {
        float _1310 = rsqrt(_1286);
        _1298 = _1310;
    }
    float _1312 = _1298;
    float _1314 = _1312;
    if (_1290)
    {
        float _1316 = _1294 * _1308;
        _1300 = _1316;
    }
    float _1318 = _1300;
    if (_1290)
    {
        float _1320 = _1318 * 0.15915493667125701904296875;
        _1302 = _1320;
    }
    float _1322 = _1302;
    float _1324 = _1308;
    float _1326 = _1322;
    if (_1290)
    {
        float _1328 = _1322 * 6.283185482025146484375;
        float _1330 = sin(_1328);
        _1324 = _1330;
    }
    float _1332 = _1324;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = precise::max(0.0, _1334);
    float _1338 = _1268;
    float _1340 = _1336;
    if (_1290)
    {
        float _1342 = _1322 * 6.283185482025146484375;
        float _1344 = cos(_1342);
        _1338 = _1344;
    }
    float _1346 = _1338;
    float _1348 = -_1276;
    float _1350 = -_1336;
    float _1352 = fma(_1256, _1348, _1350);
    if (_1290)
    {
        float _1354 = _1352 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1340 = _1354;
    }
    float _1356 = _1340;
    float _1358 = _1356;
    float _1360 = _1332;
    if (_1290)
    {
        float _1362 = fma(_1332, _1356, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1358 = _1362;
    }
    float _1364 = _1358;
    float _1366 = _1364;
    if (!_1290)
    {
        _1360 = _1278;
    }
    float _1368 = _1360;
    float _1370 = _1368;
    float _1372 = _1346;
    if (_1290)
    {
        float _1374 = _1346 + (-1.0);
        _1304 = _1374;
    }
    float _1376 = _1304;
    float _1378 = _1376;
    if (_1290)
    {
        float _1380 = _1312 * _1364;
        _1118 = _1380;
    }
    float _1382 = _1118;
    if (!_1290)
    {
        _1366 = _1352;
    }
    float _1384 = _1366;
    float _1386 = _1384;
    if (_1290)
    {
        float _1388 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1326 = _1388;
    }
    float _1390 = _1326;
    if (_1290)
    {
        float _1392 = _1278 * _1382;
        _1370 = _1392;
    }
    float _1394 = _1370;
    if (!_1290)
    {
        _1378 = _1280;
    }
    float _1396 = _1378;
    float _1398 = _1396;
    if (_1290)
    {
        float _1400 = _1280 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    if (!_1290)
    {
        _1314 = _1282;
    }
    float _1404 = _1314;
    float _1406 = _1404;
    if (_1290)
    {
        float _1408 = fma(_1352, _1346, _1390);
        _1386 = _1408;
    }
    float _1410 = _1386;
    if (_1290)
    {
        float _1412 = _1394 * _1394;
        _1406 = _1412;
    }
    float _1414 = _1406;
    if (!_1290)
    {
        _1372 = _1284;
    }
    float _1416 = _1372;
    float _1418 = _1416;
    if (_1290)
    {
        float _1420 = _1402 * _1402;
        _1418 = _1420;
    }
    float _1422 = _1418;
    float _1424 = fma(_1410, _1410, _1414);
    float _1426 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1428 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1430 = _1424 + _1422;
    float _1432 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1426);
    float _1434 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1438 = fma(_1274, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1436);
    float _1440 = precise::clamp(_1438, 0.0, 1.0);
    float _1442 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1444 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1432);
    float _1446 = rsqrt(_1430);
    float _1448 = _1186 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1450 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1434);
    float _1452 = -_1440;
    float _1454 = _1452 + 1.0;
    float _1456 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1442);
    float _1458 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1448);
    float _1460 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1450);
    float _1462 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1464 = abs(_1454);
    float _1466 = log2(_1464);
    float _1468 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1458);
    float _1470 = _1460 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1472 = fma(_1190, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1456);
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1476 = _1468 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1478 = _1472 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1480 = _1446 * _1394;
    float _1482 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1484 = _1446 * _1410;
    float _1486 = _1446 * _1402;
    float _1488 = -_1474;
    float _1490 = fma(_1488, _1428, 1.0);
    float _1492 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1482);
    float _1494 = _1480 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1496 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1498 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1492);
    float _1502 = -_1494;
    float _1504 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1502);
    float _1506 = log2(_1490);
    float _1508 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1496);
    float _1510 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1500);
    float _1512 = -_1486;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1504);
    float _1516 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1518 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1508);
    float _1520 = _1484 + 1.0;
    float _1522 = fma(_1514, -0.5, 0.5);
    float _1524 = exp2(_1498);
    float _1526 = fma(_1514, 0.5, 0.5);
    float _1528 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1516);
    float _1530 = fma(_1526, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1528);
    float _1534 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1518);
    float _1536 = 1.0 / _1510;
    float _1538 = fma(_1526, _1530, -0.212114393711090087890625);
    float _1540 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1532);
    float _1542 = _1506 * 0.693147182464599609375;
    float _1544 = fma(_1526, _1538, 1.570728778839111328125);
    float _1546 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1548 = sqrt(_1522);
    float _1550 = -_1484;
    float _1552 = fma(_1524, _1520, _1550);
    float _1554 = fma(_1552, 0.5, 0.5);
    float _1556 = _1540 * _1536;
    float _1558 = _1534 * _1536;
    float _1560 = fma(_1556, 0.5, 0.5);
    float _1562 = fma(_1558, -0.5, 0.5);
    float _1564 = _1548 * 0.636619746685028076171875;
    float3 _4591 = float3(_1560, _1562, _1546);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4591, float3(0.0), isnan(_4591)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4591, float3(0.0), isnan(_4591)), level(0.0)).x;
    float _1568 = -_1544;
    float _1570 = fma(_1564, _1568, 1.0);
    float3 _4607 = float3(_1560, _1562, _1546);
    float4 _1573 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).xyzw;
    float _1575 = _1573.x;
    float _1577 = _1573.y;
    float _1579 = _1573.z;
    float _1581 = _1573.w;
    float2 _4624 = float2(_1570, _1554);
    float3 _1585 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4624, float2(0.0), isnan(_4624)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4624, float2(0.0), isnan(_4624)), level(0.0)).xyz;
    float _1587 = _1585.x;
    float _1589 = _1585.y;
    float _1591 = _1585.z;
    float _1593 = _1466 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1595 = _808 * _854;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1599 = _1597 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1601 = _364 > 0.5;
    float _1603 = exp2(_1593);
    int _1605 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1607 = _1605 != 0;
    float _1609 = in.m_69.x;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1617 = _1615 != 0;
    float _1619 = -_796;
    float _1621 = fma(_1619, _842, _1595);
    bool _1623 = _372 > 0.5;
    bool _1625 = _1623 && _1607;
    float _1627 = in.m_69.y;
    float _1629 = 1.0 / _1599;
    float _1631 = fma(_810, _700, _1621);
    bool _1633 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1635 = isnan(_336);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    bool _1645 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1647 = isnan(_336);
    bool _1649 = _1645 || _1647;
    bool _1651 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1653 = _1649 || _1651;
    float _1655 = float(_1653);
    float _1657 = 1.0 / _1613;
    float _1659 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1661 = _1659 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1663 = -_1643;
    float _1665 = _1663 + 1.0;
    bool _1667 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1669 = isnan(_336);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1681 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1679;
    float _1683 = -_1655;
    float _1685 = _1683 + 1.0;
    float _1687 = _1655 * _1665;
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1691 = _1689 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1693 = _1681 * _1629;
    bool _1695 = _336 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1697 = isnan(_336);
    bool _1699 = _1695 || _1697;
    bool _1701 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1703 = _1699 || _1701;
    float _1705 = float(_1703);
    float _1707 = _1677 * _1685;
    float _1709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1711 = _336 + _1709;
    float _1713 = -_1677;
    float _1715 = _1713 + 1.0;
    float _1717 = 1.0 / _1661;
    float _1719 = fma(_1693, _1711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1721 = _1691 * _1657;
    float _1723 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1725 = _336 + _1723;
    float _1727 = _1705 * _1715;
    float _1729 = -_1705;
    float _1731 = _1729 + 1.0;
    float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1733;
    float _1737 = fma(_1721, _1725, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1739 = _1719 * _1727;
    float _1741 = _1725;
    float _1743 = _1609;
    float _1745 = _1510;
    float _1747 = _1534;
    float _1749 = _1540;
    if (_1607)
    {
        _1741 = _1609;
    }
    float _1751 = _1741;
    float _1753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1755 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1757 = _336 + _1755;
    float _1759 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1739);
    float _1761 = -_1627;
    float _1763 = _1761 + 1.0;
    float _1765 = _1751;
    float _1767 = _1627;
    if (_1625)
    {
        float _1769 = -_1751;
        float _1771 = _1769 + 1.0;
        _1765 = _1771;
    }
    float _1773 = _1765;
    float _1775 = _1735 * _1717;
    float _1777 = fma(_1737, _1707, _1759);
    float _1779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1617)
    {
        float _1781 = _1601 ? _1763 : _1627;
        _1767 = _1781;
    }
    float _1783 = _1767;
    float _1785 = fma(_1775, _1757, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    if (_1607)
    {
        _1743 = _1773;
    }
    float _1787 = _1743;
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1791 = _758 != 0.0;
    bool _1793 = isnan(_758);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan(0.0);
    bool _1799 = _1795 || _1797;
    float _1801 = _1783 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1803 = fma(_1785, _1687, _1777);
    float _1805 = _1787 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1807 = _1801 * _1753;
    float _1809 = fma(_1643, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1803);
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1813 = _756 == 0.0;
    bool _1815 = !_1799;
    bool _1817 = _1813 && _1815;
    float _1819 = _1805 * _1779;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1825 = _1811 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1829 = _1821 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1831 = _808 * _874;
    float _1833 = _1827 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1835 = _724 == 0.0;
    bool _1837 = _1835 && _1817;
    float _1839 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1841 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1843 = _1789 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_71.x = _1829;
    out.m_71.y = _1833;
    out.m_71.z = _1825;
    out.m_71.w = _1823;
    float _1845 = _1839 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1847 = _1841 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1849 = _1809 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1851 = in.m_73.x;
    float _1853 = in.m_73.y;
    float _1855 = in.m_73.z;
    float _1857 = _814 * _874;
    float _1859 = _808 * _860;
    float _1861 = _832 * _860;
    out.m_75.x = _1843;
    out.m_75.y = _1845;
    out.m_75.z = _1847;
    out.m_75.w = _1849;
    float _1863 = _832 * _874;
    float _1865 = fma(_802, _838, _1857);
    float _1867 = _814 * _860;
    out.m_77.x = _1819;
    out.m_77.y = _1807;
    float _1869 = fma(_812, _838, _1863);
    float _1871 = -_796;
    float _1873 = fma(_1871, _838, _1831);
    float _1875 = _814 * _854;
    float _1877 = -_1603;
    float _1879 = _1877 + 1.0;
    float _1881 = _832 * _854;
    float _1883 = fma(_802, _842, _1875);
    float _1885 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1887 = fma(_812, _842, _1881);
    float _1889 = fma(_810, _712, _1873);
    float _1891 = -_796;
    float _1893 = fma(_1891, _836, _1859);
    float _1895 = fma(_812, _836, _1861);
    float _1897 = fma(_822, _712, _1865);
    float _1899 = fma(_802, _836, _1867);
    float _1901 = fma(_810, _696, _1893);
    float _1903 = _1853;
    float _1905 = _1851;
    float _1907 = _1855;
    if (!_1837)
    {
        float _1909 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1853);
        _1903 = _1909;
    }
    float _1911 = _1903;
    if (!_1837)
    {
        float _1913 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1851);
        _1905 = _1913;
    }
    float _1915 = _1905;
    float _1917 = fma(_818, _696, _1895);
    float _1919 = fma(_818, _712, _1869);
    float _1921 = _1889 * _1911;
    if (!_1837)
    {
        float _1923 = fma(_724, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _1907 = _1923;
    }
    float _1925 = _1907;
    float _1927 = _1901 * _1911;
    float _1929 = _1631 * _1911;
    float _1931 = fma(_1897, _1915, _1921);
    float _1933 = fma(_822, _696, _1899);
    float _1935 = fma(_822, _700, _1883);
    float _1937 = fma(_818, _700, _1887);
    float _1939 = fma(_1919, _1925, _1931);
    float _1941 = fma(_1933, _1915, _1927);
    float _1943 = fma(_1935, _1915, _1929);
    float _1945 = _1470 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1947 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1949 = isnan(_1274);
    bool _1951 = _1947 || _1949;
    bool _1953 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1955 = _1951 || _1953;
    float _1957 = fma(_1917, _1925, _1941);
    float _1959 = fma(_1937, _1925, _1943);
    float _1961 = fma(_1476, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1963 = _1540 + _1510;
    float _1965 = _1510 * 0.5;
    out.m_79.x = _1957;
    out.m_79.y = _1939;
    out.m_79.z = _1959;
    float _1967 = fma(_1462, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1961);
    float _1969 = _1963 * 0.5;
    float _1971 = fma(_1534, -0.5, _1965);
    float _1973 = fma(_1478, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1967);
    float _1975 = _1973 + _1510;
    out.gl_Position.x = _1540;
    out.gl_Position.y = _1534;
    out.gl_Position.z = _1973;
    out.gl_Position.w = _1510;
    float _1977 = _1975 * 0.5;
    out.m_81.x = _1969;
    out.m_81.y = _1971;
    out.m_81.z = _1977;
    out.m_81.w = _1510;
    float _1979 = _1973;
    float _1981 = _1969;
    if (!_1955)
    {
        _1745 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1983 = _1745;
    float _1985 = _1983;
    float _1987 = _1983;
    if (!_1955)
    {
        _1979 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1989 = _1979;
    float _1991 = _1989;
    float _1993 = _1989;
    if (!_1955)
    {
        _1747 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1995 = _1747;
    float _1997 = _1995;
    float _1999 = _1995;
    if (!_1955)
    {
        _1749 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2001 = _1749;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1955)
    {
        _1981 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1981;
    float _2009 = _1885 * _1566;
    float _2011 = -_1885;
    float _2013 = _2011 + 1.0;
    float _2015 = _1581 * _2009;
    float _2017 = _1581 * _2013;
    float _2019 = _1591 * _2009;
    float _2021 = fma(_1587, _2015, _1575);
    float _2023 = fma(_1589, _2015, _1577);
    float _2025 = _2015;
    float _2027 = _2007;
    float _2029 = _2007;
    if (!_1955)
    {
        _2025 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2031 = _2025;
    float _2033 = fma(_1581, _2019, _1579);
    out.m_83.x = _2021;
    out.m_83.y = _2023;
    out.m_83.z = _2033;
    out.m_83.w = _2017;
    bool _2035 = !_1955;
    float _2037 = _2031;
    float _2039 = _2031;
    if (!_2035)
    {
        bool _2041 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2043 = isnan(_1274);
        bool _2045 = _2041 || _2043;
        bool _2047 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2049 = _2045 || _2047;
        if (!_2049)
        {
            float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2053 = _1274 + _2051;
            float _2055 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2057 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2055;
            float _2059 = 1.0 / _2057;
            float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2065 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2067 = _2065 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2069 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2071 = _2069 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2081 = _2053 * _2059;
            float _2083 = precise::clamp(_2081, 0.0, 1.0);
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2089 = fma(_2083, _2063, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2091 = fma(_2083, _2087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2093 = fma(_2083, _2067, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2095 = fma(_2083, _2071, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2097 = fma(_2083, _2075, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2099 = fma(_2083, _2079, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2029 = _2091;
            _1999 = _2097;
            _2039 = _2089;
            _1993 = _2095;
            _1987 = _2093;
            _2005 = _2099;
            _2101 = true;
        }
        else
        {
            bool _2103 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2105 = isnan(_1274);
            bool _2107 = _2103 || _2105;
            bool _2109 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2111 = _2107 || _2109;
            if (!_2111)
            {
                _2037 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2113 = _2037;
            _2039 = _2113;
            if (!_2111)
            {
                _2027 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2115 = _2027;
            _2029 = _2115;
            if (!_2111)
            {
                _1985 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2117 = _1985;
            _1987 = _2117;
            if (!_2111)
            {
                _1991 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2119 = _1991;
            _1993 = _2119;
            if (!_2111)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2121 = _1997;
            _1999 = _2121;
            if (!_2111)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2123 = _2003;
            bool _2125 = !_2111;
            _2005 = _2123;
            if (!_2125)
            {
                bool _2127 = _1274 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2129 = isnan(_1274);
                bool _2131 = _2127 || _2129;
                bool _2133 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2135 = _2131 || _2133;
                if (!_2135)
                {
                    float _2137 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2139 = _1274 + _2137;
                    float _2141 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2143 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2141;
                    float _2145 = 1.0 / _2143;
                    float _2147 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2149 = _2147 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2151 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2153 = _2151 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2155 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2157 = _2155 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2167 = _2139 * _2145;
                    float _2169 = precise::clamp(_2167, 0.0, 1.0);
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2175 = fma(_2169, _2149, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2177 = fma(_2169, _2173, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2179 = fma(_2169, _2153, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2181 = fma(_2169, _2157, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2183 = fma(_2169, _2161, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2185 = fma(_2169, _2165, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2029 = _2177;
                    _1999 = _2183;
                    _2039 = _2175;
                    _1993 = _2181;
                    _1987 = _2179;
                    _2005 = _2185;
                    _2101 = true;
                }
                else
                {
                    _2029 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2039 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1993 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1987 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2101 = false;
    float _2187 = _2029;
    float _2189 = _1999;
    float _2191 = _2039;
    float _2193 = _1993;
    float _2195 = _1987;
    float _2197 = _2005;
    float _2199 = fma(_1939, -0.5, 0.5);
    float _2201 = precise::clamp(_2199, 0.0, 1.0);
    float _2203 = -_2187;
    float _2205 = _2203 + _2189;
    float _2207 = _1252 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2209 = -_2191;
    float _2211 = _2209 + _2193;
    float _2213 = fma(_2201, _2205, _2187);
    out.m_85.x = 0.0;
    float _2215 = -_2195;
    float _2217 = _2215 + _2197;
    float _2219 = fma(_2201, _2211, _2191);
    float _2221 = _2213 * 0.586610972881317138671875;
    out.m_47.x = _2207;
    bool _2223 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2225 = fma(_2201, _2217, _2195);
    float _2227 = fma(_2219, 0.298911988735198974609375, _2221);
    bool _2229 = _1252 > 0.0;
    bool _2231 = isnan(_1252);
    bool _2233 = _2229 || _2231;
    bool _2235 = isnan(0.0);
    bool _2237 = _2233 || _2235;
    float _2239 = fma(_2225, 0.114477999508380889892578125, _2227);
    float _2241 = -_2239;
    float _2243 = _2219 + _2241;
    float _2245 = -_2239;
    float _2247 = _2213 + _2245;
    float _2249 = -_2239;
    float _2251 = _2225 + _2249;
    float _2253 = fma(_2243, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    float _2255 = fma(_2247, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    float _2257 = fma(_2251, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2239);
    bool _2259 = !_2223;
    if (!_2259)
    {
        float _2261 = -_1186;
        float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2265 = -_1188;
        float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2269 = -_1190;
        float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2273 = _2263 * _2263;
        float _2275 = fma(_2267, _2267, _2273);
        float _2277 = fma(_2271, _2271, _2275);
        float _2279 = sqrt(_2277);
        float _2281 = rsqrt(_2277);
        float _2283 = -_2279;
        float _2285 = _2283 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2287 = _2285 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2289 = precise::clamp(_2287, 0.0, 1.0);
        float _2291 = _2267 * _2281;
        float _2293 = _2263 * _2281;
        float _2295 = abs(_2289);
        float _2297 = log2(_2295);
        float _2299 = _2271 * _2281;
        float _2301 = _2291 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2303 = _1939 * _2293;
        float _2305 = -_2293;
        float _2307 = -_2301;
        float _2309 = fma(_2305, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2307);
        float _2311 = fma(_1957, _2291, _2303);
        float _2313 = -_2299;
        float _2315 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2309);
        float _2317 = fma(_1959, _2299, _2311);
        float _2319 = precise::clamp(_2317, 0.0, 1.0);
        float _2321 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2323 = _2315 + _2321;
        float _2325 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2327 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2329 = precise::clamp(_2327, 0.0, 1.0);
        float _2331 = exp2(_2325);
        float _2333 = _2331 * _2329;
        float _2335 = _2319 * _2333;
        float _2337 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2341 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_85.x = _2337;
        out.m_85.y = _2339;
        out.m_85.z = _2341;
    }
    out.m_87.x = _2253;
    out.m_87.y = _2255;
    out.m_87.z = _2257;
    if (_2237)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2343 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2343;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

