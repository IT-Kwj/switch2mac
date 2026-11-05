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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c9 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c10 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    constant _16* vp_c16 [[id(6)]];
    texture2d<float> vp_t_tcb_C [[id(7)]];
    sampler vp_t_tcb_CSmplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_71 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

static inline __attribute__((always_inline))
int _86(thread const int& _6607, thread const int& _6608, constant _10& support_buffer)
{
    float _6611 = as_type<float>(support_buffer._m4);
    int _6613 = _6608 + as_type<int>(_6611);
    int _6615 = 1 + _6613;
    float _6617 = support_buffer._m5[_6615].x;
    float _6619 = abs(_6617);
    bool _6621 = _6619 == 1.0;
    if (_6621)
    {
        return _6607;
    }
    float _6623 = float(_6607);
    float _6625 = _6623 / _6619;
    int _6627 = int(_6625);
    return _6627;
}

static inline __attribute__((always_inline))
int _87(thread const int& _6657, thread const int& _6658, constant _10& support_buffer)
{
    float _6661 = as_type<float>(support_buffer._m4);
    int _6663 = _6658 + as_type<int>(_6661);
    int _6665 = 1 + _6663;
    float _6667 = support_buffer._m5[_6665].x;
    bool _6669 = _6667 == 1.0;
    if (_6669)
    {
        return _6657;
    }
    float _6671 = float(_6657);
    float _6673 = _6671 * _6667;
    int _6675 = int(_6673);
    return _6675;
}

static inline __attribute__((always_inline))
void _84(thread int& _6604, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    _6604 = 0;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2713 = as_type<float>(_111);
        out.gl_Position.z = _2713;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_95);
        _105 = _131;
    }
    float _133 = _105;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    int _145 = 0;
    if (_139)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2783 = as_type<float>(_149);
        out.gl_Position.z = _2783;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    int _151 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _153 = _151;
    int _155 = 0;
    int _157 = _86(_153, _155, (*spvDescriptorSet0.support_buffer));
    float _159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _161 = int(_159);
    float _163 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = float(_95);
    float _167 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _169 = int(_167);
    float _171 = float(_161);
    float _173 = 1.0 / _165;
    float _175 = float(uint(_169));
    float _177 = 1.0 / _171;
    int _179 = ~_169;
    int _181 = _179 + 1;
    float _183 = float(_169);
    int _185 = ~_169;
    int _187 = _185 + 1;
    float _189 = 1.0 / _175;
    float _191 = _127 * _177;
    float _193 = trunc(_191);
    int _195 = int(_193);
    int _197 = as_type<int>(_189) + (-2);
    float _199 = float(uint(_195));
    float _201 = as_type<float>(_197) * _199;
    float _203 = in.m_53.x;
    float _205 = in.m_53.y;
    float _207 = trunc(_201);
    float _209 = precise::max(_207, 0.0);
    uint _212 = uint(_209);
    float _214 = float(_195);
    bool _216 = _214 >= _183;
    bool _218 = isnan(_214);
    bool _220 = _216 || _218;
    bool _222 = isnan(_183);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    int _228 = _181 * int(_212);
    int _230 = _228 + _195;
    float _232 = trunc(_226);
    int _234 = int(_232);
    float _236 = float(uint(_230));
    float _238 = as_type<float>(_197) * _236;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _242 = _240 != 0;
    float _244 = trunc(_238);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    bool _250 = !_242;
    float _252 = _250 ? 7.345489978790283203125 : 1.0;
    bool _254 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _258 = _254 || _256;
    bool _260 = isnan(1.0);
    bool _262 = _258 || _260;
    float _264 = _252 * _203;
    float _266 = floor(_264);
    int _268 = int(_212) + int(_248);
    float _270 = as_type<float>(_187);
    float _272 = _264;
    if (!_262)
    {
        float _274 = _163 * _163;
        float _276 = _274 * 0.5;
        _270 = _276;
    }
    float _278 = _270;
    int _280 = _187 * _268;
    int _282 = _280 + _195;
    float _284 = _278;
    if (!_262)
    {
        float _286 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _286;
    }
    float _288 = _284;
    bool _290 = uint(_282) >= uint(_169);
    float _292 = -_266;
    float _294 = _264 + _292;
    float _296 = _288;
    if (!_262)
    {
        _272 = _163;
    }
    float _298 = _272;
    bool _300 = !_290;
    int _302 = _300 ? 0 : (-1);
    bool _304 = !_262;
    float _306 = _298;
    if (!_304)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = _163 * _310;
        float _320 = 1.0 / _314;
        float _322 = _316 * 0.693147182464599609375;
        float _324 = exp2(_318);
        float _326 = 1.0 / _322;
        float _328 = _324 + (-1.0);
        float _330 = -_328;
        float _332 = fma(_330, _326, _163);
        float _334 = _332 * _320;
        float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _296 = _336;
    }
    float _338 = _296;
    bool _340 = !_262;
    if (!_340)
    {
        float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _344 = log2(_342);
        float _346 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _348 = _346 + 1.0;
        float _350 = 1.0 / _348;
        float _352 = _163 * _344;
        float _354 = exp2(_352);
        float _356 = -_354;
        float _358 = _356 + 1.0;
        float _360 = _358 * _350;
        _306 = _360;
    }
    float _362 = _306;
    int _364 = ~_268;
    int _366 = _364 + _302;
    int _368 = _366 + 1;
    float _370 = _294 * _183;
    float _372 = _127 * _183;
    bool _374 = _169 == 0;
    int _376 = _169 * _368;
    int _378 = _376 + _195;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _382 = _380 != 0;
    float _384 = _372 * _173;
    int _386 = ~_234;
    int _388 = _386 + 1;
    int _390 = _388 + 1;
    float _392 = trunc(_370);
    int _394 = int(_392);
    bool _396 = !_374;
    int _398 = _396 ? _378 : (-1);
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _402 = _400 != 0;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _410 = _408 != 0;
    int _412 = _398 * _390;
    int _414 = _169 + (-1);
    float _416 = trunc(_384);
    int _418 = int(_416);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _422 = _420 != 0;
    bool _424 = !_406;
    int _426 = _424 ? 0 : 1;
    int _428 = _234 * _414;
    int _430 = _428 + _412;
    bool _432 = !_422;
    int _434 = _432 ? 0 : 1;
    bool _436 = !_402;
    int _438 = _436 ? 0 : 1;
    int _440 = abs(_426);
    int _442 = abs(_434);
    bool _444 = !_410;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_438);
    int _450 = _394 * _442;
    int _452 = _450 + _195;
    bool _454 = !_382;
    int _456 = _454 ? 0 : 1;
    int _458 = abs(_446);
    int _460 = _430 * _440;
    int _462 = abs(_456);
    int _464 = _418 * _448;
    int _466 = _464 + _460;
    int _468 = ~_169;
    int _470 = _468 + 1;
    int _472 = _452 * _458;
    int _474 = _472 + _466;
    float _476 = float(uint(_452));
    int _478 = _394 * _462;
    int _480 = _478 + _474;
    float _482 = as_type<float>(_197) * _476;
    float _484 = float(uint(_480));
    float _486 = trunc(_482);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    float _492 = as_type<float>(_197) * _484;
    float _494 = trunc(_492);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    int _500 = ~_169;
    int _502 = _500 + 1;
    int _504 = _470 * int(_498);
    int _506 = _504 + _480;
    float _508 = float(uint(_506));
    int _510 = ~_169;
    int _512 = _510 + 1;
    float _514 = as_type<float>(_197) * _508;
    int _516 = _512 * int(_490);
    int _518 = _516 + _452;
    float _520 = trunc(_514);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    int _526 = int(_498) + int(_524);
    float _528 = float(uint(_518));
    int _530 = _502 * _526;
    int _532 = _530 + _480;
    float _534 = as_type<float>(_197) * _528;
    bool _536 = uint(_532) >= uint(_169);
    float _538 = trunc(_534);
    float _540 = precise::max(_538, 0.0);
    uint _542 = uint(_540);
    bool _544 = !_536;
    int _546 = _544 ? 0 : (-1);
    int _548 = ~_526;
    int _550 = _548 + _546;
    int _552 = _550 + 1;
    int _554 = _169 * _552;
    int _556 = _554 + _480;
    float _558 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _560 = !_374;
    int _562 = _560 ? _556 : (-1);
    float _564 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    int _566 = int(_490) + int(_542);
    int _568 = _562 & 3;
    bool _570 = _568 != 0;
    int _572 = _562 & 3;
    bool _574 = _572 != 0;
    bool _576 = uint(_568) > 1u;
    int _578 = _574 ? 0 : 1;
    int _580 = _562 >> 31;
    int _582 = ~_578;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    int _588 = _580 & 3;
    int _590 = abs(_157);
    int _592 = _562 + _588;
    int _594 = _586;
    if (!_576)
    {
        int _596 = ~_578;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = float(_157);
    int _604 = _592 >> 2;
    float _606 = _564 * _602;
    int _608 = _604 << 4;
    int _610 = _608 + 368;
    float _612 = trunc(_606);
    int _614 = int(_612);
    float _616 = float(uint(_590));
    uint _618 = uint(int(uint(_610) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    float _634 = 1.0 / _616;
    int _636 = abs(_614);
    uint _638 = uint(int(uint(_614) >> uint(31)));
    float _640 = float(uint(_636));
    int _642 = ~int(_638);
    int _644 = _642 + 1;
    int _646 = as_type<int>(_634) + (-2);
    float _648 = as_type<float>(_646) * _640;
    float _650 = trunc(_648);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    int _656 = ~int(_654);
    int _658 = _656 + 1;
    int _660 = _658 * _590;
    int _662 = _660 + _636;
    float _664 = float(uint(_662));
    float _666 = as_type<float>(_646) * _664;
    float _668 = in.m_55.z;
    float _670 = trunc(_666);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    int _676 = int(_654) + int(_674);
    int _678 = ~_676;
    int _680 = _678 + 1;
    float _682 = trunc(_668);
    int _684 = int(_682);
    int _686 = _680 * _590;
    int _688 = _686 + _636;
    bool _690 = uint(_688) >= uint(_590);
    bool _692 = !_690;
    int _694 = _692 ? 0 : (-1);
    bool _696 = _157 == 0;
    int _698 = ~_676;
    int _700 = _698 + _694;
    int _702 = _700 + 1;
    int _704 = _610 + 8;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = _702 * _590;
    int _724 = _722 + _636;
    int _726 = ~_169;
    int _728 = _726 + 1;
    int _730 = _724 ^ _644;
    int _732 = ~_644;
    int _734 = _732 + _730;
    int _736 = _734 + 1;
    int _738 = _728 * _566;
    int _740 = _738 + _452;
    bool _742 = !_696;
    int _744 = _742 ? _736 : (-1);
    int _746 = _744;
    int _748 = 0;
    int _750 = _87(_746, _748, (*spvDescriptorSet0.support_buffer));
    int _752 = _684;
    int _754 = 0;
    int _756 = _87(_752, _754, (*spvDescriptorSet0.support_buffer));
    float3 _760 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_750, _756)), 0).xyw;
    float _762 = _760.x;
    float _764 = _760.y;
    float _766 = _760.z;
    bool _768 = _568 != 3;
    bool _770 = uint(_568) >= 2u;
    int _772 = abs(_600);
    int _774 = _770 ? 0 : 1;
    float _776 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _778 = int(_776);
    int _780 = ~_772;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    bool _786 = uint(_740) >= uint(_169);
    bool _788 = _568 != 3;
    int _790 = _784 * as_type<int>(_632);
    bool _792 = !_570;
    int _794 = _792 ? 0 : 1;
    int _796 = ~_774;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    int _802 = _800;
    if (_768)
    {
        int _804 = ~_774;
        int _806 = _804 + 1;
        _802 = _806;
    }
    int _808 = _802;
    bool _810 = !_786;
    int _812 = _810 ? 0 : (-1);
    bool _814 = !_788;
    int _816 = _814 ? 0 : (-1);
    int _818 = abs(_794);
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _822 = _820 != 0;
    int _824 = abs(_808);
    int _826 = ~_566;
    int _828 = _826 + _812;
    int _830 = _828 + 1;
    int _832 = abs(_816);
    bool _834 = !_822;
    int _836 = _834 ? 0 : 1;
    int _838 = _169 * _830;
    int _840 = _838 + _452;
    int _842 = ~_818;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = abs(_836);
    int _850 = _846 * as_type<int>(_624);
    int _852 = _850 + _790;
    int _854 = ~_824;
    int _856 = _854 + 1;
    int _858 = _856 + 1;
    int _860 = ~_832;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    int _866 = abs(_778);
    int _868 = _858 * as_type<int>(_712);
    int _870 = _868 + _852;
    int _872 = ~_848;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = _864 * as_type<int>(_720);
    int _880 = _878 + _870;
    bool _882 = !_374;
    int _884 = _882 ? _840 : (-1);
    float _886 = float(uint(_866));
    int _888 = _880 * _876;
    float _890 = float(uint(_778));
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _894 = _892 != 0;
    int _896 = _884 * _848;
    int _898 = _896 + _888;
    float _900 = 1.0 / _886;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _904 = _902 != 0;
    int _906 = ~_778;
    int _908 = _906 + 1;
    int _910 = abs(_898);
    float _912 = float(uint(_898));
    float _914 = 1.0 / _890;
    float _916 = float(uint(_910));
    bool _918 = _205 > 0.5;
    bool _920 = _918 && _904;
    bool _922 = _778 == 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _926 = as_type<int>(_900) + (-2);
    float _928 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[78].w, _924);
    float _930 = as_type<float>(_926) * _916;
    int _932 = as_type<int>(_914) + (-2);
    float _934 = trunc(_930);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    int _940 = ~_778;
    int _942 = _940 + 1;
    float _944 = as_type<float>(_932) * _912;
    float _946 = trunc(_944);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = ~int(_938);
    int _954 = _952 + 1;
    int _956 = _954 * _866;
    int _958 = _956 + _910;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _962 = _942 * int(_950);
    int _964 = _962 + _898;
    float _966 = float(uint(_958));
    float _968 = float(uint(_964));
    float _970 = as_type<float>(_926) * _966;
    float _972 = as_type<float>(_932) * _968;
    float _974 = _203 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _976 = trunc(_970);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _984 = -_982;
    float _986 = fma(_974, 2.0, _984);
    float _988 = _205 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _990 = _898 ^ _778;
    float _992 = trunc(_972);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    uint _998 = uint(int(uint(_990) >> uint(31)));
    int _1000 = int(_938) + int(_980);
    float _1002 = in.m_55.x;
    int _1004 = ~_1000;
    int _1006 = _1004 + 1;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1010 = int(_950) + int(_996);
    float _1012 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[78].z, _960);
    float _1014 = as_type<float>(_996);
    float _1016 = as_type<float>(_998);
    if (_894)
    {
        float _1018 = in.m_53.x;
        _1014 = _1018;
    }
    float _1020 = _1014;
    float _1022 = fma(_988, -2.0, _1008);
    int _1024 = _1006 * _866;
    int _1026 = _1024 + _910;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1030 = _908 * _1010;
    int _1032 = _1030 + _898;
    float _1034 = in.m_51.x;
    float _1036 = in.m_51.y;
    float _1038 = in.m_51.z;
    float _1040 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1022);
    float _1042 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1012);
    bool _1044 = uint(_1032) >= uint(_778);
    bool _1046 = !_1044;
    int _1048 = _1046 ? 0 : (-1);
    bool _1050 = uint(_1026) >= uint(_866);
    int _1052 = ~_1010;
    int _1054 = _1052 + _1048;
    int _1056 = _1054 + 1;
    bool _1058 = !_1050;
    int _1060 = _1058 ? 0 : (-1);
    float _1062 = in.m_55.y;
    float _1064 = as_type<float>(_1026);
    if (_894)
    {
        _1064 = _1002;
    }
    float _1066 = _1064;
    int _1068 = _778 * _1056;
    int _1070 = _1068 + _898;
    int _1072 = ~_1060;
    int _1074 = _1000 + _1072;
    int _1076 = _1074 + 1;
    float _1078 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _1080 = _1020 > 0.5;
    bool _1082 = _1080 && _894;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1086 = ~int(_998);
    int _1088 = _1086 + 1;
    float _1090 = fma(_362, _1034, _1078);
    bool _1092 = _778 == 0;
    float _1094 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1096 = _1076 ^ _1088;
    bool _1098 = !_1092;
    int _1100 = _1098 ? _1070 : (-1);
    int _1102 = ~_1088;
    int _1104 = _1102 + _1096;
    int _1106 = _1104 + 1;
    float _1108 = _1066;
    if (_1082)
    {
        float _1110 = -_1066;
        float _1112 = _1110 + 1.0;
        _1108 = _1112;
    }
    float _1114 = _1108;
    if (!_894)
    {
        _1016 = _1002;
    }
    float _1116 = _1016;
    bool _1118 = !_922;
    int _1120 = _1118 ? _1106 : (-1);
    float _1122 = _1116;
    if (_894)
    {
        _1122 = _1114;
    }
    float _1124 = _1122;
    float _1126 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1128 = float(_1100);
    float _1130 = -_127;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[76].x, _986);
    float _1134 = float(_1120);
    float _1136 = fma(_1094, _1124, -0.5);
    float _1138 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1140 = fma(_1094, _1128, _1132);
    float _1142 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _1144 = _744 + 1;
    float _1146 = -_1040;
    float _1148 = fma(_1126, _1134, _1146);
    float _1150 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _928);
    float _1152 = fma(_362, _1036, _1142);
    int _1154 = abs(_1144);
    float _1156 = _1062;
    if (_920)
    {
        float _1158 = -_1062;
        float _1160 = _1158 + 1.0;
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = fma(_1042, _1136, _1140);
    uint _1166 = uint(int(uint(_1144) >> uint(31)));
    float _1168 = float(uint(_1154));
    float _1170 = fma(_1126, _1162, -0.5);
    float _1172 = fma(_362, _1038, _1138);
    int _1174 = ~int(_1166);
    int _1176 = _1174 + 1;
    float _1178 = as_type<float>(_646) * _1168;
    float _1180 = fma(_1150, _1170, _1148);
    float _1182 = trunc(_1178);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    int _1188 = ~int(_1186);
    int _1190 = _1188 + 1;
    int _1192 = _1190 * _590;
    int _1194 = _1192 + _1154;
    float _1196 = float(uint(_1194));
    float _1198 = as_type<float>(_646) * _1196;
    float _1200 = trunc(_1198);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    float _1206 = in.m_46.x;
    float _1208 = in.m_46.y;
    float _1210 = in.m_46.z;
    int _1212 = int(_1186) + int(_1204);
    float _1214 = in.m_57.x;
    float _1216 = in.m_57.y;
    float _1218 = in.m_57.z;
    float _1220 = in.m_57.w;
    int _1222 = ~_1212;
    int _1224 = _1222 + 1;
    int _1226 = _1224 * _590;
    int _1228 = _1226 + _1154;
    bool _1230 = uint(_1228) >= uint(_590);
    bool _1232 = !_1230;
    int _1234 = _1232 ? 0 : (-1);
    int _1236 = ~_1212;
    int _1238 = _1236 + _1234;
    int _1240 = _1238 + 1;
    uint _1242 = as_type<uint>(half2(float2(_766, 0.0)));
    float _1244 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1246 = fma(_1172, _1220, _1210);
    float _1248 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    uint _1250 = extract_bits(_1242, 0u, 8u);
    int _1252 = int(_1250) & 255;
    uint _1254 = extract_bits(_1242, 8u, 8u);
    int _1256 = int(_1254) & 255;
    int _1258 = _1256 << 8;
    int _1260 = _1252 | _1258;
    int _1262 = _1240 * _590;
    int _1264 = _1262 + _1154;
    float _1266 = fma(_1090, _1220, _1206);
    bool _1268 = _1260 >= 32768;
    float _1270 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _1272 = _1260 + (-1024);
    float _1274 = fma(_1152, _1220, _1208);
    int _1276 = _1264 ^ _1176;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1280 = _1164 + 0.5;
    int _1282 = ~_1176;
    int _1284 = _1282 + _1276;
    int _1286 = _1284 + 1;
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1292 = _1180 + 0.5;
    int _1294 = _1272;
    if (_1268)
    {
        int _1296 = ~_1260;
        int _1298 = _1296 + 33792;
        int _1300 = _1298 + 1;
        _1294 = _1300;
    }
    int _1302 = _1294;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1308 = _1302 + 30719;
    float _1310 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1314 = float(_1308);
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1318 = !_696;
    int _1320 = _1318 ? _1286 : (-1);
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1324 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = fma(_1314, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1328 = abs(_1326);
    float _1330 = -_1328;
    float _1332 = _1330 + 1.0;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1336 = as_type<int>(_1332) + (-218103808);
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1340 = uint(_1336) >= 1920991232u;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1346 = !_1340;
    if (!_1346)
    {
        int _1348;
        _84(_1348, out.gl_Position, out.gl_PointSize);
    }
    int _1350 = _1320;
    int _1352 = 0;
    int _1354 = _87(_1350, _1352, (*spvDescriptorSet0.support_buffer));
    int _1356 = _684;
    int _1358 = 0;
    int _1360 = _87(_1356, _1358, (*spvDescriptorSet0.support_buffer));
    float3 _1362 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1354, _1360)), 0).xyw;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = floor(_606);
    float _1372 = -_1370;
    float _1374 = _606 + _1372;
    uint _1376 = as_type<uint>(half2(float2(_1368, 0.0)));
    float _1378 = -_762;
    float _1380 = _1378 + _1364;
    float _1382 = -_764;
    float _1384 = _1382 + _1366;
    uint _1386 = extract_bits(_1376, 0u, 8u);
    int _1388 = int(_1386) & 255;
    uint _1390 = extract_bits(_1376, 8u, 8u);
    int _1392 = int(_1390) & 255;
    int _1394 = _1392 << 8;
    int _1396 = _1388 | _1394;
    float _1398 = fma(_1374, _1380, _762);
    float _1400 = fma(_1374, _1384, _764);
    bool _1402 = _1396 >= 32768;
    int _1404 = _1396 + (-1024);
    int _1406 = _1404;
    if (_1402)
    {
        int _1408 = ~_1396;
        int _1410 = _1408 + 33792;
        int _1412 = _1410 + 1;
        _1406 = _1412;
    }
    int _1414 = _1406;
    int _1416 = _1414 + 30719;
    float _1418 = float(_1416);
    float _1420 = fma(_1418, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1422 = abs(_1420);
    float _1424 = -_1422;
    float _1426 = _1424 + 1.0;
    int _1428 = as_type<int>(_1426) + (-218103808);
    bool _1430 = uint(_1428) >= 1920991232u;
    bool _1432 = !_1430;
    if (!_1432)
    {
        int _1434;
        _84(_1434, out.gl_Position, out.gl_PointSize);
    }
    float _1436 = in.m_53.x;
    float _1438 = in.m_53.y;
    float _1440 = in.m_53.z;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1448 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1450 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1452 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1446);
    float _1454 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1448);
    float _1456 = _1400 * _1400;
    float _1458 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1450);
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1470 = _1468 != 0;
    float _1472 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1474 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1458);
    float _1476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1400);
    float _1478 = _1444 * _127;
    float _1480 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1482 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1490 = _1486 || _1488;
    float _1492 = exp2(_1478);
    bool _1494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1496 = isnan(1.0);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1502 = _1498 || _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1506 = 1.0 + _1504;
    float _1508 = _1440 + _1438;
    float _1510 = _1440 + _1436;
    float _1512 = _1440 + (-0.5);
    float _1514 = _1440 * 2.0;
    float _1516 = _1438 + _1436;
    float _1518 = _1436 * 2.0;
    float _1520 = _1436 + (-0.5);
    float _1522 = fma(_1398, _1398, _1456);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1398);
    float _1526 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1452);
    float _1528 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1454);
    float _1530 = floor(_1514);
    float _1532 = _1472 * _1524;
    float _1534 = _1438 + (-0.5);
    float _1536 = _1438 * 2.0;
    float _1538 = _1508 + (-1.0);
    float _1540 = -_1492;
    float _1542 = _1540 + 1.0;
    float _1544 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1546 = sqrt(_1522);
    float _1548 = _1516 + (-1.0);
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1552 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1544);
    float _1554 = _1510 + (-1.0);
    float _1556 = _1480 * _1476;
    float _1558 = _1490 ? _1542 : 0.0;
    float _1560 = 1.0 / _1506;
    bool _1562 = _1530 > 0.0;
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1566 = !_1462;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = _1528 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1572 = _1530 >= 0.0;
    bool _1574 = isnan(_1530);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan(0.0);
    bool _1580 = _1576 || _1578;
    float _1582 = _1526 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1584 = floor(_1518);
    int _1586 = _1580 ? 0 : 1;
    float _1588 = _1474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1590 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1552);
    float _1592 = floor(_1536);
    if (_1502)
    {
        float _1594 = _1558 * _1560;
        _129 = _1594;
    }
    float _1596 = _129;
    int _1598 = abs(_1568);
    float _1600 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1602 = float(_1598);
    bool _1604 = _1584 > 0.0;
    float _1606 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1608 = -_1546;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _1612 = _1584 >= 0.0;
    bool _1614 = isnan(_1584);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    float _1622 = _1606 * _1610;
    int _1624 = _1620 ? 0 : 1;
    float _1626 = in.m_59.x;
    float _1628 = in.m_59.y;
    float _1630 = in.m_59.z;
    bool _1632 = _1592 > 0.0;
    bool _1634 = _1592 >= 0.0;
    bool _1636 = isnan(_1592);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    float _1644 = sqrt(_1622);
    int _1646 = ~_1586;
    int _1648 = _1646 + 1;
    int _1650 = _1648 + 1;
    int _1652 = _1650;
    if (!_1562)
    {
        int _1654 = ~_1586;
        int _1656 = _1654 + 1;
        _1652 = _1656;
    }
    int _1658 = _1652;
    int _1660 = ~_1624;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    float _1666 = float(_1658);
    int _1668 = _1664;
    if (!_1604)
    {
        int _1670 = ~_1624;
        int _1672 = _1670 + 1;
        _1668 = _1672;
    }
    int _1674 = _1668;
    bool _1676 = !_1470;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = _1602 * _1666;
    int _1682 = _1642 ? 0 : 1;
    float _1684 = rsqrt(_1590);
    int _1686 = abs(_1678);
    float _1688 = -_1570;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1692 = !_1466;
    int _1694 = _1692 ? 0 : 1;
    float _1696 = _1680 * (-2.0);
    int _1698 = ~_1682;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    float _1704 = _1690 * _1690;
    int _1706 = _1702;
    if (!_1632)
    {
        int _1708 = ~_1682;
        int _1710 = _1708 + 1;
        _1706 = _1710;
    }
    int _1712 = _1706;
    float _1714 = -_1582;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1718 = abs(_1694);
    float _1720 = fma(_1696, _1626, _1626);
    float _1722 = -_1588;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = float(_1674);
    float _1728 = fma(_1716, _1716, _1704);
    float _1730 = float(_1718);
    float _1732 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1720);
    float _1734 = float(_1686);
    float _1736 = fma(_1724, _1724, _1728);
    float _1738 = float(_1712);
    float _1740 = _1730 * _1726;
    float _1742 = fma(_1564, _1696, _1564);
    float _1744 = _1740 * (-2.0);
    float _1746 = _1734 * _1738;
    float _1748 = rsqrt(_1736);
    float _1750 = fma(_1742, _1596, _1732);
    float _1752 = fma(_1550, _1744, _1550);
    float _1754 = _1746 * (-2.0);
    float _1756 = fma(_1744, _1628, _1628);
    float _1758 = fma(_1600, _1754, _1600);
    float _1760 = fma(_1754, _1630, _1630);
    float _1762 = _1750 * 0.15915493667125701904296875;
    float _1764 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1766 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    float _1768 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1756);
    float _1770 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1772 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1764);
    float _1774 = _1716 * _1748;
    float _1776 = fma(_1758, _1596, _1766);
    float _1778 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1770);
    float _1780 = _1724 * _1748;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1784 = _1774 * _1782;
    float _1786 = fma(_1752, _1596, _1768);
    float _1788 = _1690 * _1748;
    float _1790 = _1776 * 0.15915493667125701904296875;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = _1780 * _1792;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1798 = -_1784;
    float _1800 = fma(_1780, _1796, _1798);
    float _1802 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1806 = -_1794;
    float _1808 = fma(_1788, _1804, _1806);
    float _1810 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1814 = _1788 * _1812;
    float _1816 = _1800 * _1800;
    float _1818 = _1786 * 0.15915493667125701904296875;
    float _1820 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1802);
    float _1822 = _1762 * 6.283185482025146484375;
    float _1824 = sin(_1822);
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = -_1814;
    float _1830 = fma(_1774, _1826, _1828);
    float _1832 = fma(_1808, _1808, _1816);
    float _1834 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1810);
    float _1836 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1778);
    float _1838 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1772);
    float _1840 = _1762 * 6.283185482025146484375;
    float _1842 = cos(_1840);
    float _1844 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1644);
    float _1848 = _1844 * _1846;
    float _1850 = _1818 * 6.283185482025146484375;
    float _1852 = sin(_1850);
    float _1854 = _1790 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = _1818 * 6.283185482025146484375;
    float _1860 = cos(_1858);
    float _1862 = _1824 * _1852;
    float _1864 = _1790 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = fma(_1830, _1830, _1832);
    float _1870 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1834);
    float _1872 = _1842 * _1852;
    float _1874 = _1852 * _1856;
    float _1876 = rsqrt(_1868);
    float _1878 = _1860 * _1856;
    float _1880 = _1824 * _1860;
    float _1882 = _1842 * _1860;
    float _1884 = _1856 * _1556;
    float _1886 = -_1556;
    float _1888 = _1866 * _1886;
    float _1890 = -_1872;
    float _1892 = fma(_1866, _1880, _1890);
    float _1894 = fma(_1866, _1882, _1862);
    float _1896 = _1842 * _1884;
    float _1898 = -_1880;
    float _1900 = fma(_1866, _1872, _1898);
    float _1902 = fma(_1866, _1862, _1882);
    float _1904 = rsqrt(_1838);
    float _1906 = fma(_1878, _1532, _1888);
    float _1908 = _1830 * _1876;
    float _1910 = _1824 * _1884;
    float _1912 = fma(_1894, _1532, _1896);
    float _1914 = _1808 * _1876;
    float _1916 = _1800 * _1876;
    float _1918 = _1774 * _1908;
    float _1920 = rsqrt(_1836);
    float _1922 = fma(_1900, _1848, _1912);
    float _1924 = _1780 * _1916;
    float _1926 = -_1918;
    float _1928 = fma(_1780, _1914, _1926);
    float _1930 = fma(_1892, _1532, _1910);
    float _1932 = _1788 * _1914;
    float _1934 = -_1924;
    float _1936 = fma(_1788, _1908, _1934);
    float _1938 = fma(_1874, _1848, _1906);
    float _1940 = _1928 * _1922;
    float _1942 = -_1932;
    float _1944 = fma(_1774, _1916, _1942);
    float _1946 = _1936 * _1922;
    float _1948 = fma(_1902, _1848, _1930);
    float _1950 = fma(_1916, _1938, _1940);
    float _1952 = _1684 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1954 = _1904 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1956 = _1944 * _1922;
    float _1958 = fma(_1914, _1938, _1946);
    float _1960 = fma(_1788, _1948, _1950);
    float _1962 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1966 = _1920 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1968 = fma(_1908, _1938, _1956);
    float _1970 = fma(_1774, _1948, _1958);
    float _1972 = _1960 * _1962;
    float _1974 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _1976 = _1960 * _1964;
    float _1978 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _1980 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1982 = fma(_1970, _1974, _1972);
    float _1984 = fma(_1780, _1948, _1968);
    float _1986 = fma(_1970, _1978, _1976);
    float _1988 = _1960 * _1980;
    float _1990 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _1992 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _1994 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _1996 = sqrt(_1870);
    float _1998 = fma(_1984, _1990, _1986);
    float _2000 = fma(_1970, _1992, _1988);
    float _2002 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1820);
    float _2004 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _2006 = fma(_1984, _1994, _1982);
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _2010 = fma(_1984, _2004, _2000);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _2014 = sqrt(_2002);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2008);
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[192].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2012);
    float _2022 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2016);
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2020);
    float _2030 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2032 = _1582 + _2024;
    float _2034 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].y, _2022);
    float _2036 = _1588 + _2028;
    float _2038 = fma(_2026, _1996, _2032);
    float _2040 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].y, _2034);
    float _2042 = fma(_2030, _2014, _2036);
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2046 = _2038 + _2044;
    float _2048 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2052 = _2042 + _2050;
    float _2054 = _2046 * _2046;
    float _2056 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2048);
    float _2058 = _2052 * _2052;
    float _2060 = _1570 + _2040;
    float _2062 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2056);
    float _2064 = _2054 + _2058;
    float _2066 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2068 = sqrt(_2064);
    float _2070 = sqrt(_2062);
    bool _2072 = _2068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2074 = fma(_2066, _2070, _2060);
    float _2076 = _2066;
    float _2078 = _2018;
    float _2080 = _2060;
    float _2082 = (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2084 = _2070;
    if (!_2072)
    {
        _2076 = _2058;
    }
    float _2086 = _2076;
    float _2088 = _2086;
    if (!_2072)
    {
        _2078 = _2054;
    }
    float _2090 = _2078;
    float _2092 = _2090;
    if (!_2072)
    {
        _2080 = _2038;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_2072)
    {
        _2082 = _2042;
    }
    float _2098 = _2082;
    float _2100 = _2098;
    if (!_2072)
    {
        _2084 = _2074;
    }
    float _2102 = _2084;
    bool _2104 = !_2072;
    float _2106 = _2102;
    if (!_2104)
    {
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2112 = _2068 + _2110;
        float _2114 = rsqrt(_2064);
        float _2116 = _2112 * _2108;
        float _2118 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = _2116 * 0.15915493667125701904296875;
        float _2122 = _2120 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = fma(_2124, _2118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2132 = _2114 * _2130;
        float _2134 = _2128 + (-1.0);
        float _2136 = _2052 * _2132;
        float _2138 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = _2046 * _2132;
        float _2142 = fma(_2074, _2128, _2138);
        float _2144 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2146 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2148 = _2140 * _2140;
        float _2150 = _2136 * _2136;
        _2106 = _2142;
        _2092 = _2148;
        _2088 = _2150;
        _2096 = _2144;
        _2100 = _2146;
    }
    float _2152 = _2106;
    float _2154 = _2092;
    float _2156 = _2088;
    float _2158 = _2096;
    float _2160 = _2100;
    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2164 = _2152 + _2162;
    out.m_61.x = _1344;
    out.m_61.y = _1338;
    out.m_61.z = _1310;
    out.m_61.w = _1306;
    float _2166 = fma(_2164, _2164, _2154);
    out.m_63.x = _1316;
    out.m_63.y = _1288;
    out.m_63.z = _1324;
    out.m_63.w = _1322;
    float _2168 = _2166 + _2156;
    out.m_65.x = _1280;
    out.m_65.y = _1292;
    float _2170 = sqrt(_2168);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _2172 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2174 = isnan(_2170);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2180 = _2176 || _2178;
    float _2182 = _2164;
    float _2184 = 1.0;
    float _2186 = _2170;
    if (!_2180)
    {
        _2182 = 1.0;
    }
    float _2188 = _2182;
    bool _2190 = !_2180;
    float _2192 = _2188;
    if (!_2190)
    {
        bool _2194 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2196 = isnan(_2170);
        bool _2198 = _2194 || _2196;
        bool _2200 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2202 = _2198 || _2200;
        if (!_2202)
        {
            float _2204 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2206 = _2170 + _2204;
            float _2208 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2210 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2208;
            float _2212 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2216 = 1.0 / _2210;
            float _2218 = _2206 * _2216;
            float _2220 = fma(_2218, _2214, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2192 = _2220;
            _2222 = true;
        }
        else
        {
            bool _2224 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2226 = isnan(_2170);
            bool _2228 = _2224 || _2226;
            bool _2230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2232 = _2228 || _2230;
            if (!_2232)
            {
                float _2234 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2236 = _2170 + _2234;
                float _2238 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2240 = _2238 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2242 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2244 = _2242 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2246 = 1.0 / _2240;
                float _2248 = _2236 * _2246;
                float _2250 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2192 = _2250;
                _2222 = true;
            }
            else
            {
                _2192 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2222 = false;
    float _2252 = _2192;
    float _2254 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2256 = _2152 + _2254;
    float _2258 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2260 = _2158 + _2258;
    float _2262 = fma(_2256, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2264 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2266 = _2160 + _2264;
    float _2268 = fma(_2260, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2262 + _2270;
    float _2274 = fma(_2266, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2278 = _2268 + _2276;
    float _2280 = _2272 * _2272;
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2284 = _2274 + _2282;
    float _2286 = fma(_2278, _2278, _2280);
    float _2288 = fma(_2284, _2284, _2286);
    float _2290 = rsqrt(_2288);
    float _2292 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2294 = _2278 * _2292;
    float _2296 = _2284 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 + _2300;
    float _2304 = sqrt(_2302);
    bool _2306 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2304 + _2308;
    float _2312 = _2284;
    float _2314 = _2286;
    float _2316 = _2310;
    float _2318 = _2294;
    if (_2306)
    {
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2320;
    }
    float _2322 = _2312;
    if (_2306)
    {
        float _2324 = rsqrt(_2302);
        _2314 = _2324;
    }
    float _2326 = _2314;
    float _2328 = _2326;
    if (_2306)
    {
        float _2330 = _2310 * _2322;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2306)
    {
        float _2334 = _2332 * 0.15915493667125701904296875;
        _2184 = _2334;
    }
    float _2336 = _2184;
    float _2338 = _2290;
    float _2340 = _2336;
    if (_2306)
    {
        float _2342 = _2336 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2338 = _2344;
    }
    float _2346 = _2338;
    float _2348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2350 = precise::max(0.0, _2348);
    float _2352 = 1.0;
    float _2354 = _2350;
    float _2356 = _2348;
    if (_2306)
    {
        float _2358 = _2336 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        _2352 = _2360;
    }
    float _2362 = _2352;
    float _2364 = -_2292;
    float _2366 = -_2350;
    float _2368 = fma(_2272, _2364, _2366);
    if (!_2306)
    {
        _2354 = _2296;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (_2306)
    {
        float _2374 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2374;
    }
    float _2376 = _2356;
    float _2378 = sqrt(_2288);
    float _2380 = _2346;
    float _2382 = _2376;
    if (_2306)
    {
        float _2384 = fma(_2346, _2376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = _2386;
    if (_2306)
    {
        float _2390 = _2362 + (-1.0);
        _2382 = _2390;
    }
    float _2392 = _2382;
    float _2394 = _2392;
    if (_2306)
    {
        float _2396 = _2326 * _2386;
        _2186 = _2396;
    }
    float _2398 = _2186;
    if (!_2306)
    {
        _2328 = _2368;
    }
    float _2400 = _2328;
    float _2402 = _2400;
    if (_2306)
    {
        float _2404 = _2392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2340 = _2404;
    }
    float _2406 = _2340;
    if (_2306)
    {
        float _2408 = _2294 * _2398;
        _2318 = _2408;
    }
    float _2410 = _2318;
    if (!_2306)
    {
        _2388 = _2298;
    }
    float _2412 = _2388;
    float _2414 = _2412;
    if (_2306)
    {
        float _2416 = _2296 * _2398;
        _2372 = _2416;
    }
    float _2418 = _2372;
    if (_2306)
    {
        float _2420 = fma(_2368, _2362, _2406);
        _2402 = _2420;
    }
    float _2422 = _2402;
    if (_2306)
    {
        float _2424 = _2410 * _2410;
        _2414 = _2424;
    }
    float _2426 = _2414;
    if (!_2306)
    {
        _2394 = _2300;
    }
    float _2428 = _2394;
    float _2430 = _2428;
    if (_2306)
    {
        float _2432 = _2418 * _2418;
        _2430 = _2432;
    }
    float _2434 = _2430;
    float _2436 = fma(_2422, _2422, _2426);
    float _2438 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2440 = _2436 + _2434;
    float _2442 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2446 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2444);
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2452 = rsqrt(_2440);
    float _2454 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2442);
    float _2456 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2458 = -_2448;
    float _2460 = _2458 + 1.0;
    float _2462 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2466 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2456);
    float _2468 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2438);
    float _2470 = abs(_2460);
    float _2472 = log2(_2470);
    float _2474 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2476 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2478 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2466);
    float _2480 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2482 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2476);
    float _2484 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2486 = _2452 * _2410;
    float _2488 = -_2480;
    float _2490 = fma(_2488, _2450, 1.0);
    float _2492 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2468);
    float _2494 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2496 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2498 = _2452 * _2422;
    float _2500 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2502 = _2452 * _2418;
    float _2504 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2496);
    float _2506 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2508 = -_2500;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2508);
    float _2512 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2514 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2504);
    float _2516 = log2(_2490);
    float _2518 = -_2502;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2510);
    float _2522 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2524 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2514);
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2528 = fma(_2520, -0.5, 0.5);
    float _2530 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2522);
    float _2532 = fma(_2520, 0.5, 0.5);
    float _2534 = exp2(_2506);
    float _2536 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2526);
    float _2538 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2540 = _2498 + 1.0;
    float _2542 = fma(_2532, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2544 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2536);
    float _2546 = 1.0 / _2524;
    float _2548 = fma(_2532, _2542, -0.212114393711090087890625);
    float _2550 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2544);
    float _2552 = _2516 * 0.693147182464599609375;
    float _2554 = fma(_2532, _2548, 1.570728778839111328125);
    float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2558 = sqrt(_2528);
    float _2560 = -_2498;
    float _2562 = fma(_2534, _2540, _2560);
    float _2564 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2538);
    float _2566 = fma(_2562, 0.5, 0.5);
    float _2568 = _2564 * _2546;
    float _2570 = _2550 * _2546;
    float _2572 = fma(_2568, 0.5, 0.5);
    float _2574 = fma(_2570, -0.5, 0.5);
    float _2576 = _2558 * 0.636619746685028076171875;
    float3 _6440 = float3(_2572, _2574, _2556);
    float _2578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6440, float3(0.0), isnan(_6440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6440, float3(0.0), isnan(_6440)), level(0.0)).x;
    float3 _6451 = float3(_2572, _2574, _2556);
    float4 _2581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6451, float3(0.0), isnan(_6451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6451, float3(0.0), isnan(_6451)), level(0.0)).xyzw;
    float _2583 = _2581.x;
    float _2585 = _2581.y;
    float _2587 = _2581.z;
    float _2589 = _2581.w;
    float _2591 = -_2554;
    float _2593 = fma(_2576, _2591, 1.0);
    float2 _6472 = float2(_2593, _2566);
    float3 _2595 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6472, float2(0.0), isnan(_6472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6472, float2(0.0), isnan(_6472)), level(0.0)).xyz;
    float _2597 = _2595.x;
    float _2599 = _2595.y;
    float _2601 = _2595.z;
    float _2603 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2504);
    float _2607 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2609 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2605);
    float _2611 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2607);
    float _2613 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2615 = 1.0 / _2609;
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2611);
    float _2619 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2617);
    float _2621 = exp2(_2613);
    float _2623 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2625 = _2619 * _2615;
    out.m_49.x = _2623;
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2629 = fma(_2524, _2625, _2627);
    float _2631 = -_2621;
    float _2633 = _2631 + 1.0;
    float _2635 = _2524 + _2629;
    out.gl_Position.x = _2564;
    out.gl_Position.y = _2550;
    out.gl_Position.z = _2629;
    out.gl_Position.w = _2524;
    float _2637 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2639 = _2635 * 0.5;
    float _2641 = -_2637;
    float _2643 = _2641 + 1.0;
    out.m_69.z = _2639;
    out.m_69.w = _2524;
    float _2645 = _2637 * _2578;
    float _2647 = _2589 * _2645;
    float _2649 = _2601 * _2645;
    float _2651 = fma(_2597, _2647, _2583);
    float _2653 = fma(_2599, _2647, _2585);
    float _2655 = _2589 * _2643;
    float _2657 = fma(_2589, _2649, _2587);
    out.m_71.x = _2651;
    out.m_71.y = _2653;
    out.m_71.z = _2657;
    out.m_71.w = _2655;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2713 = as_type<float>(_111);
        out.gl_Position.z = _2713;
    }
    if (!_99)
    {
        return out;
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_95);
        _105 = _131;
    }
    float _133 = _105;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    int _145 = 0;
    if (_139)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2783 = as_type<float>(_149);
        out.gl_Position.z = _2783;
    }
    if (_139)
    {
        return out;
    }
    int _151 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _153 = _151;
    int _155 = 0;
    int _157 = _86(_153, _155, (*spvDescriptorSet0.support_buffer));
    float _159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _161 = int(_159);
    float _163 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = float(_95);
    float _167 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _169 = int(_167);
    float _171 = float(_161);
    float _173 = 1.0 / _165;
    float _175 = float(uint(_169));
    float _177 = 1.0 / _171;
    int _179 = ~_169;
    int _181 = _179 + 1;
    float _183 = float(_169);
    int _185 = ~_169;
    int _187 = _185 + 1;
    float _189 = 1.0 / _175;
    float _191 = _127 * _177;
    float _193 = trunc(_191);
    int _195 = int(_193);
    int _197 = as_type<int>(_189) + (-2);
    float _199 = float(uint(_195));
    float _201 = as_type<float>(_197) * _199;
    float _203 = in.m_53.x;
    float _205 = in.m_53.y;
    float _207 = trunc(_201);
    float _209 = precise::max(_207, 0.0);
    uint _212 = uint(_209);
    float _214 = float(_195);
    bool _216 = _214 >= _183;
    bool _218 = isnan(_214);
    bool _220 = _216 || _218;
    bool _222 = isnan(_183);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    int _228 = _181 * int(_212);
    int _230 = _228 + _195;
    float _232 = trunc(_226);
    int _234 = int(_232);
    float _236 = float(uint(_230));
    float _238 = as_type<float>(_197) * _236;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _242 = _240 != 0;
    float _244 = trunc(_238);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    bool _250 = !_242;
    float _252 = _250 ? 7.345489978790283203125 : 1.0;
    bool _254 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _258 = _254 || _256;
    bool _260 = isnan(1.0);
    bool _262 = _258 || _260;
    float _264 = _252 * _203;
    float _266 = floor(_264);
    int _268 = int(_212) + int(_248);
    float _270 = as_type<float>(_187);
    float _272 = _264;
    if (!_262)
    {
        float _274 = _163 * _163;
        float _276 = _274 * 0.5;
        _270 = _276;
    }
    float _278 = _270;
    int _280 = _187 * _268;
    int _282 = _280 + _195;
    float _284 = _278;
    if (!_262)
    {
        float _286 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _286;
    }
    float _288 = _284;
    bool _290 = uint(_282) >= uint(_169);
    float _292 = -_266;
    float _294 = _264 + _292;
    float _296 = _288;
    if (!_262)
    {
        _272 = _163;
    }
    float _298 = _272;
    bool _300 = !_290;
    int _302 = _300 ? 0 : (-1);
    bool _304 = !_262;
    float _306 = _298;
    if (!_304)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = _163 * _310;
        float _320 = 1.0 / _314;
        float _322 = _316 * 0.693147182464599609375;
        float _324 = exp2(_318);
        float _326 = 1.0 / _322;
        float _328 = _324 + (-1.0);
        float _330 = -_328;
        float _332 = fma(_330, _326, _163);
        float _334 = _332 * _320;
        float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _296 = _336;
    }
    float _338 = _296;
    bool _340 = !_262;
    if (!_340)
    {
        float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _344 = log2(_342);
        float _346 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _348 = _346 + 1.0;
        float _350 = 1.0 / _348;
        float _352 = _163 * _344;
        float _354 = exp2(_352);
        float _356 = -_354;
        float _358 = _356 + 1.0;
        float _360 = _358 * _350;
        _306 = _360;
    }
    float _362 = _306;
    int _364 = ~_268;
    int _366 = _364 + _302;
    int _368 = _366 + 1;
    float _370 = _294 * _183;
    float _372 = _127 * _183;
    bool _374 = _169 == 0;
    int _376 = _169 * _368;
    int _378 = _376 + _195;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _382 = _380 != 0;
    float _384 = _372 * _173;
    int _386 = ~_234;
    int _388 = _386 + 1;
    int _390 = _388 + 1;
    float _392 = trunc(_370);
    int _394 = int(_392);
    bool _396 = !_374;
    int _398 = _396 ? _378 : (-1);
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _402 = _400 != 0;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _410 = _408 != 0;
    int _412 = _398 * _390;
    int _414 = _169 + (-1);
    float _416 = trunc(_384);
    int _418 = int(_416);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _422 = _420 != 0;
    bool _424 = !_406;
    int _426 = _424 ? 0 : 1;
    int _428 = _234 * _414;
    int _430 = _428 + _412;
    bool _432 = !_422;
    int _434 = _432 ? 0 : 1;
    bool _436 = !_402;
    int _438 = _436 ? 0 : 1;
    int _440 = abs(_426);
    int _442 = abs(_434);
    bool _444 = !_410;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_438);
    int _450 = _394 * _442;
    int _452 = _450 + _195;
    bool _454 = !_382;
    int _456 = _454 ? 0 : 1;
    int _458 = abs(_446);
    int _460 = _430 * _440;
    int _462 = abs(_456);
    int _464 = _418 * _448;
    int _466 = _464 + _460;
    int _468 = ~_169;
    int _470 = _468 + 1;
    int _472 = _452 * _458;
    int _474 = _472 + _466;
    float _476 = float(uint(_452));
    int _478 = _394 * _462;
    int _480 = _478 + _474;
    float _482 = as_type<float>(_197) * _476;
    float _484 = float(uint(_480));
    float _486 = trunc(_482);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    float _492 = as_type<float>(_197) * _484;
    float _494 = trunc(_492);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    int _500 = ~_169;
    int _502 = _500 + 1;
    int _504 = _470 * int(_498);
    int _506 = _504 + _480;
    float _508 = float(uint(_506));
    int _510 = ~_169;
    int _512 = _510 + 1;
    float _514 = as_type<float>(_197) * _508;
    int _516 = _512 * int(_490);
    int _518 = _516 + _452;
    float _520 = trunc(_514);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    int _526 = int(_498) + int(_524);
    float _528 = float(uint(_518));
    int _530 = _502 * _526;
    int _532 = _530 + _480;
    float _534 = as_type<float>(_197) * _528;
    bool _536 = uint(_532) >= uint(_169);
    float _538 = trunc(_534);
    float _540 = precise::max(_538, 0.0);
    uint _542 = uint(_540);
    bool _544 = !_536;
    int _546 = _544 ? 0 : (-1);
    int _548 = ~_526;
    int _550 = _548 + _546;
    int _552 = _550 + 1;
    int _554 = _169 * _552;
    int _556 = _554 + _480;
    float _558 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _560 = !_374;
    int _562 = _560 ? _556 : (-1);
    float _564 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    int _566 = int(_490) + int(_542);
    int _568 = _562 & 3;
    bool _570 = _568 != 0;
    int _572 = _562 & 3;
    bool _574 = _572 != 0;
    bool _576 = uint(_568) > 1u;
    int _578 = _574 ? 0 : 1;
    int _580 = _562 >> 31;
    int _582 = ~_578;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    int _588 = _580 & 3;
    int _590 = abs(_157);
    int _592 = _562 + _588;
    int _594 = _586;
    if (!_576)
    {
        int _596 = ~_578;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = float(_157);
    int _604 = _592 >> 2;
    float _606 = _564 * _602;
    int _608 = _604 << 4;
    int _610 = _608 + 368;
    float _612 = trunc(_606);
    int _614 = int(_612);
    float _616 = float(uint(_590));
    uint _618 = uint(int(uint(_610) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    float _634 = 1.0 / _616;
    int _636 = abs(_614);
    uint _638 = uint(int(uint(_614) >> uint(31)));
    float _640 = float(uint(_636));
    int _642 = ~int(_638);
    int _644 = _642 + 1;
    int _646 = as_type<int>(_634) + (-2);
    float _648 = as_type<float>(_646) * _640;
    float _650 = trunc(_648);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    int _656 = ~int(_654);
    int _658 = _656 + 1;
    int _660 = _658 * _590;
    int _662 = _660 + _636;
    float _664 = float(uint(_662));
    float _666 = as_type<float>(_646) * _664;
    float _668 = in.m_55.z;
    float _670 = trunc(_666);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    int _676 = int(_654) + int(_674);
    int _678 = ~_676;
    int _680 = _678 + 1;
    float _682 = trunc(_668);
    int _684 = int(_682);
    int _686 = _680 * _590;
    int _688 = _686 + _636;
    bool _690 = uint(_688) >= uint(_590);
    bool _692 = !_690;
    int _694 = _692 ? 0 : (-1);
    bool _696 = _157 == 0;
    int _698 = ~_676;
    int _700 = _698 + _694;
    int _702 = _700 + 1;
    int _704 = _610 + 8;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = _702 * _590;
    int _724 = _722 + _636;
    int _726 = ~_169;
    int _728 = _726 + 1;
    int _730 = _724 ^ _644;
    int _732 = ~_644;
    int _734 = _732 + _730;
    int _736 = _734 + 1;
    int _738 = _728 * _566;
    int _740 = _738 + _452;
    bool _742 = !_696;
    int _744 = _742 ? _736 : (-1);
    int _746 = _744;
    int _748 = 0;
    int _750 = _87(_746, _748, (*spvDescriptorSet0.support_buffer));
    int _752 = _684;
    int _754 = 0;
    int _756 = _87(_752, _754, (*spvDescriptorSet0.support_buffer));
    float3 _760 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_750, _756)), 0).xyw;
    float _762 = _760.x;
    float _764 = _760.y;
    float _766 = _760.z;
    bool _768 = _568 != 3;
    bool _770 = uint(_568) >= 2u;
    int _772 = abs(_600);
    int _774 = _770 ? 0 : 1;
    float _776 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _778 = int(_776);
    int _780 = ~_772;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    bool _786 = uint(_740) >= uint(_169);
    bool _788 = _568 != 3;
    int _790 = _784 * as_type<int>(_632);
    bool _792 = !_570;
    int _794 = _792 ? 0 : 1;
    int _796 = ~_774;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    int _802 = _800;
    if (_768)
    {
        int _804 = ~_774;
        int _806 = _804 + 1;
        _802 = _806;
    }
    int _808 = _802;
    bool _810 = !_786;
    int _812 = _810 ? 0 : (-1);
    bool _814 = !_788;
    int _816 = _814 ? 0 : (-1);
    int _818 = abs(_794);
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _822 = _820 != 0;
    int _824 = abs(_808);
    int _826 = ~_566;
    int _828 = _826 + _812;
    int _830 = _828 + 1;
    int _832 = abs(_816);
    bool _834 = !_822;
    int _836 = _834 ? 0 : 1;
    int _838 = _169 * _830;
    int _840 = _838 + _452;
    int _842 = ~_818;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = abs(_836);
    int _850 = _846 * as_type<int>(_624);
    int _852 = _850 + _790;
    int _854 = ~_824;
    int _856 = _854 + 1;
    int _858 = _856 + 1;
    int _860 = ~_832;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    int _866 = abs(_778);
    int _868 = _858 * as_type<int>(_712);
    int _870 = _868 + _852;
    int _872 = ~_848;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = _864 * as_type<int>(_720);
    int _880 = _878 + _870;
    bool _882 = !_374;
    int _884 = _882 ? _840 : (-1);
    float _886 = float(uint(_866));
    int _888 = _880 * _876;
    float _890 = float(uint(_778));
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _894 = _892 != 0;
    int _896 = _884 * _848;
    int _898 = _896 + _888;
    float _900 = 1.0 / _886;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _904 = _902 != 0;
    int _906 = ~_778;
    int _908 = _906 + 1;
    int _910 = abs(_898);
    float _912 = float(uint(_898));
    float _914 = 1.0 / _890;
    float _916 = float(uint(_910));
    bool _918 = _205 > 0.5;
    bool _920 = _918 && _904;
    bool _922 = _778 == 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _926 = as_type<int>(_900) + (-2);
    float _928 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[78].w, _924);
    float _930 = as_type<float>(_926) * _916;
    int _932 = as_type<int>(_914) + (-2);
    float _934 = trunc(_930);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    int _940 = ~_778;
    int _942 = _940 + 1;
    float _944 = as_type<float>(_932) * _912;
    float _946 = trunc(_944);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = ~int(_938);
    int _954 = _952 + 1;
    int _956 = _954 * _866;
    int _958 = _956 + _910;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _962 = _942 * int(_950);
    int _964 = _962 + _898;
    float _966 = float(uint(_958));
    float _968 = float(uint(_964));
    float _970 = as_type<float>(_926) * _966;
    float _972 = as_type<float>(_932) * _968;
    float _974 = _203 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _976 = trunc(_970);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _984 = -_982;
    float _986 = fma(_974, 2.0, _984);
    float _988 = _205 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _990 = _898 ^ _778;
    float _992 = trunc(_972);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    uint _998 = uint(int(uint(_990) >> uint(31)));
    int _1000 = int(_938) + int(_980);
    float _1002 = in.m_55.x;
    int _1004 = ~_1000;
    int _1006 = _1004 + 1;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1010 = int(_950) + int(_996);
    float _1012 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[78].z, _960);
    float _1014 = as_type<float>(_996);
    float _1016 = as_type<float>(_998);
    if (_894)
    {
        float _1018 = in.m_53.x;
        _1014 = _1018;
    }
    float _1020 = _1014;
    float _1022 = fma(_988, -2.0, _1008);
    int _1024 = _1006 * _866;
    int _1026 = _1024 + _910;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1030 = _908 * _1010;
    int _1032 = _1030 + _898;
    float _1034 = in.m_51.x;
    float _1036 = in.m_51.y;
    float _1038 = in.m_51.z;
    float _1040 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1022);
    float _1042 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1012);
    bool _1044 = uint(_1032) >= uint(_778);
    bool _1046 = !_1044;
    int _1048 = _1046 ? 0 : (-1);
    bool _1050 = uint(_1026) >= uint(_866);
    int _1052 = ~_1010;
    int _1054 = _1052 + _1048;
    int _1056 = _1054 + 1;
    bool _1058 = !_1050;
    int _1060 = _1058 ? 0 : (-1);
    float _1062 = in.m_55.y;
    float _1064 = as_type<float>(_1026);
    if (_894)
    {
        _1064 = _1002;
    }
    float _1066 = _1064;
    int _1068 = _778 * _1056;
    int _1070 = _1068 + _898;
    int _1072 = ~_1060;
    int _1074 = _1000 + _1072;
    int _1076 = _1074 + 1;
    float _1078 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _1080 = _1020 > 0.5;
    bool _1082 = _1080 && _894;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1086 = ~int(_998);
    int _1088 = _1086 + 1;
    float _1090 = fma(_362, _1034, _1078);
    bool _1092 = _778 == 0;
    float _1094 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1096 = _1076 ^ _1088;
    bool _1098 = !_1092;
    int _1100 = _1098 ? _1070 : (-1);
    int _1102 = ~_1088;
    int _1104 = _1102 + _1096;
    int _1106 = _1104 + 1;
    float _1108 = _1066;
    if (_1082)
    {
        float _1110 = -_1066;
        float _1112 = _1110 + 1.0;
        _1108 = _1112;
    }
    float _1114 = _1108;
    if (!_894)
    {
        _1016 = _1002;
    }
    float _1116 = _1016;
    bool _1118 = !_922;
    int _1120 = _1118 ? _1106 : (-1);
    float _1122 = _1116;
    if (_894)
    {
        _1122 = _1114;
    }
    float _1124 = _1122;
    float _1126 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1128 = float(_1100);
    float _1130 = -_127;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[76].x, _986);
    float _1134 = float(_1120);
    float _1136 = fma(_1094, _1124, -0.5);
    float _1138 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1140 = fma(_1094, _1128, _1132);
    float _1142 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _1144 = _744 + 1;
    float _1146 = -_1040;
    float _1148 = fma(_1126, _1134, _1146);
    float _1150 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _928);
    float _1152 = fma(_362, _1036, _1142);
    int _1154 = abs(_1144);
    float _1156 = _1062;
    if (_920)
    {
        float _1158 = -_1062;
        float _1160 = _1158 + 1.0;
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = fma(_1042, _1136, _1140);
    uint _1166 = uint(int(uint(_1144) >> uint(31)));
    float _1168 = float(uint(_1154));
    float _1170 = fma(_1126, _1162, -0.5);
    float _1172 = fma(_362, _1038, _1138);
    int _1174 = ~int(_1166);
    int _1176 = _1174 + 1;
    float _1178 = as_type<float>(_646) * _1168;
    float _1180 = fma(_1150, _1170, _1148);
    float _1182 = trunc(_1178);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    int _1188 = ~int(_1186);
    int _1190 = _1188 + 1;
    int _1192 = _1190 * _590;
    int _1194 = _1192 + _1154;
    float _1196 = float(uint(_1194));
    float _1198 = as_type<float>(_646) * _1196;
    float _1200 = trunc(_1198);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    float _1206 = in.m_46.x;
    float _1208 = in.m_46.y;
    float _1210 = in.m_46.z;
    int _1212 = int(_1186) + int(_1204);
    float _1214 = in.m_57.x;
    float _1216 = in.m_57.y;
    float _1218 = in.m_57.z;
    float _1220 = in.m_57.w;
    int _1222 = ~_1212;
    int _1224 = _1222 + 1;
    int _1226 = _1224 * _590;
    int _1228 = _1226 + _1154;
    bool _1230 = uint(_1228) >= uint(_590);
    bool _1232 = !_1230;
    int _1234 = _1232 ? 0 : (-1);
    int _1236 = ~_1212;
    int _1238 = _1236 + _1234;
    int _1240 = _1238 + 1;
    uint _1242 = as_type<uint>(half2(float2(_766, 0.0)));
    float _1244 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1246 = fma(_1172, _1220, _1210);
    float _1248 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    uint _1250 = extract_bits(_1242, 0u, 8u);
    int _1252 = int(_1250) & 255;
    uint _1254 = extract_bits(_1242, 8u, 8u);
    int _1256 = int(_1254) & 255;
    int _1258 = _1256 << 8;
    int _1260 = _1252 | _1258;
    int _1262 = _1240 * _590;
    int _1264 = _1262 + _1154;
    float _1266 = fma(_1090, _1220, _1206);
    bool _1268 = _1260 >= 32768;
    float _1270 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _1272 = _1260 + (-1024);
    float _1274 = fma(_1152, _1220, _1208);
    int _1276 = _1264 ^ _1176;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1280 = _1164 + 0.5;
    int _1282 = ~_1176;
    int _1284 = _1282 + _1276;
    int _1286 = _1284 + 1;
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1292 = _1180 + 0.5;
    int _1294 = _1272;
    if (_1268)
    {
        int _1296 = ~_1260;
        int _1298 = _1296 + 33792;
        int _1300 = _1298 + 1;
        _1294 = _1300;
    }
    int _1302 = _1294;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1308 = _1302 + 30719;
    float _1310 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1314 = float(_1308);
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1318 = !_696;
    int _1320 = _1318 ? _1286 : (-1);
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1324 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = fma(_1314, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1328 = abs(_1326);
    float _1330 = -_1328;
    float _1332 = _1330 + 1.0;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1336 = as_type<int>(_1332) + (-218103808);
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1340 = uint(_1336) >= 1920991232u;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1346 = !_1340;
    if (!_1346)
    {
        int _1348;
        _84(_1348, out.gl_Position, out.gl_PointSize);
    }
    int _1350 = _1320;
    int _1352 = 0;
    int _1354 = _87(_1350, _1352, (*spvDescriptorSet0.support_buffer));
    int _1356 = _684;
    int _1358 = 0;
    int _1360 = _87(_1356, _1358, (*spvDescriptorSet0.support_buffer));
    float3 _1362 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1354, _1360)), 0).xyw;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = floor(_606);
    float _1372 = -_1370;
    float _1374 = _606 + _1372;
    uint _1376 = as_type<uint>(half2(float2(_1368, 0.0)));
    float _1378 = -_762;
    float _1380 = _1378 + _1364;
    float _1382 = -_764;
    float _1384 = _1382 + _1366;
    uint _1386 = extract_bits(_1376, 0u, 8u);
    int _1388 = int(_1386) & 255;
    uint _1390 = extract_bits(_1376, 8u, 8u);
    int _1392 = int(_1390) & 255;
    int _1394 = _1392 << 8;
    int _1396 = _1388 | _1394;
    float _1398 = fma(_1374, _1380, _762);
    float _1400 = fma(_1374, _1384, _764);
    bool _1402 = _1396 >= 32768;
    int _1404 = _1396 + (-1024);
    int _1406 = _1404;
    if (_1402)
    {
        int _1408 = ~_1396;
        int _1410 = _1408 + 33792;
        int _1412 = _1410 + 1;
        _1406 = _1412;
    }
    int _1414 = _1406;
    int _1416 = _1414 + 30719;
    float _1418 = float(_1416);
    float _1420 = fma(_1418, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1422 = abs(_1420);
    float _1424 = -_1422;
    float _1426 = _1424 + 1.0;
    int _1428 = as_type<int>(_1426) + (-218103808);
    bool _1430 = uint(_1428) >= 1920991232u;
    bool _1432 = !_1430;
    if (!_1432)
    {
        int _1434;
        _84(_1434, out.gl_Position, out.gl_PointSize);
    }
    float _1436 = in.m_53.x;
    float _1438 = in.m_53.y;
    float _1440 = in.m_53.z;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1448 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1450 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1452 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1446);
    float _1454 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1448);
    float _1456 = _1400 * _1400;
    float _1458 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1450);
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1470 = _1468 != 0;
    float _1472 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1474 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1458);
    float _1476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1400);
    float _1478 = _1444 * _127;
    float _1480 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1482 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1490 = _1486 || _1488;
    float _1492 = exp2(_1478);
    bool _1494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1496 = isnan(1.0);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1502 = _1498 || _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1506 = 1.0 + _1504;
    float _1508 = _1440 + _1438;
    float _1510 = _1440 + _1436;
    float _1512 = _1440 + (-0.5);
    float _1514 = _1440 * 2.0;
    float _1516 = _1438 + _1436;
    float _1518 = _1436 * 2.0;
    float _1520 = _1436 + (-0.5);
    float _1522 = fma(_1398, _1398, _1456);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1398);
    float _1526 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1452);
    float _1528 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1454);
    float _1530 = floor(_1514);
    float _1532 = _1472 * _1524;
    float _1534 = _1438 + (-0.5);
    float _1536 = _1438 * 2.0;
    float _1538 = _1508 + (-1.0);
    float _1540 = -_1492;
    float _1542 = _1540 + 1.0;
    float _1544 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1546 = sqrt(_1522);
    float _1548 = _1516 + (-1.0);
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1552 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1544);
    float _1554 = _1510 + (-1.0);
    float _1556 = _1480 * _1476;
    float _1558 = _1490 ? _1542 : 0.0;
    float _1560 = 1.0 / _1506;
    bool _1562 = _1530 > 0.0;
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1566 = !_1462;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = _1528 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1572 = _1530 >= 0.0;
    bool _1574 = isnan(_1530);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan(0.0);
    bool _1580 = _1576 || _1578;
    float _1582 = _1526 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1584 = floor(_1518);
    int _1586 = _1580 ? 0 : 1;
    float _1588 = _1474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1590 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1552);
    float _1592 = floor(_1536);
    if (_1502)
    {
        float _1594 = _1558 * _1560;
        _129 = _1594;
    }
    float _1596 = _129;
    int _1598 = abs(_1568);
    float _1600 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1602 = float(_1598);
    bool _1604 = _1584 > 0.0;
    float _1606 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1608 = -_1546;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _1612 = _1584 >= 0.0;
    bool _1614 = isnan(_1584);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    float _1622 = _1606 * _1610;
    int _1624 = _1620 ? 0 : 1;
    float _1626 = in.m_59.x;
    float _1628 = in.m_59.y;
    float _1630 = in.m_59.z;
    bool _1632 = _1592 > 0.0;
    bool _1634 = _1592 >= 0.0;
    bool _1636 = isnan(_1592);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    float _1644 = sqrt(_1622);
    int _1646 = ~_1586;
    int _1648 = _1646 + 1;
    int _1650 = _1648 + 1;
    int _1652 = _1650;
    if (!_1562)
    {
        int _1654 = ~_1586;
        int _1656 = _1654 + 1;
        _1652 = _1656;
    }
    int _1658 = _1652;
    int _1660 = ~_1624;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    float _1666 = float(_1658);
    int _1668 = _1664;
    if (!_1604)
    {
        int _1670 = ~_1624;
        int _1672 = _1670 + 1;
        _1668 = _1672;
    }
    int _1674 = _1668;
    bool _1676 = !_1470;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = _1602 * _1666;
    int _1682 = _1642 ? 0 : 1;
    float _1684 = rsqrt(_1590);
    int _1686 = abs(_1678);
    float _1688 = -_1570;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1692 = !_1466;
    int _1694 = _1692 ? 0 : 1;
    float _1696 = _1680 * (-2.0);
    int _1698 = ~_1682;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    float _1704 = _1690 * _1690;
    int _1706 = _1702;
    if (!_1632)
    {
        int _1708 = ~_1682;
        int _1710 = _1708 + 1;
        _1706 = _1710;
    }
    int _1712 = _1706;
    float _1714 = -_1582;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1718 = abs(_1694);
    float _1720 = fma(_1696, _1626, _1626);
    float _1722 = -_1588;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = float(_1674);
    float _1728 = fma(_1716, _1716, _1704);
    float _1730 = float(_1718);
    float _1732 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1720);
    float _1734 = float(_1686);
    float _1736 = fma(_1724, _1724, _1728);
    float _1738 = float(_1712);
    float _1740 = _1730 * _1726;
    float _1742 = fma(_1564, _1696, _1564);
    float _1744 = _1740 * (-2.0);
    float _1746 = _1734 * _1738;
    float _1748 = rsqrt(_1736);
    float _1750 = fma(_1742, _1596, _1732);
    float _1752 = fma(_1550, _1744, _1550);
    float _1754 = _1746 * (-2.0);
    float _1756 = fma(_1744, _1628, _1628);
    float _1758 = fma(_1600, _1754, _1600);
    float _1760 = fma(_1754, _1630, _1630);
    float _1762 = _1750 * 0.15915493667125701904296875;
    float _1764 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1766 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    float _1768 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1756);
    float _1770 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1772 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1764);
    float _1774 = _1716 * _1748;
    float _1776 = fma(_1758, _1596, _1766);
    float _1778 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1770);
    float _1780 = _1724 * _1748;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1784 = _1774 * _1782;
    float _1786 = fma(_1752, _1596, _1768);
    float _1788 = _1690 * _1748;
    float _1790 = _1776 * 0.15915493667125701904296875;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = _1780 * _1792;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1798 = -_1784;
    float _1800 = fma(_1780, _1796, _1798);
    float _1802 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1806 = -_1794;
    float _1808 = fma(_1788, _1804, _1806);
    float _1810 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1814 = _1788 * _1812;
    float _1816 = _1800 * _1800;
    float _1818 = _1786 * 0.15915493667125701904296875;
    float _1820 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1802);
    float _1822 = _1762 * 6.283185482025146484375;
    float _1824 = sin(_1822);
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = -_1814;
    float _1830 = fma(_1774, _1826, _1828);
    float _1832 = fma(_1808, _1808, _1816);
    float _1834 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1810);
    float _1836 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1778);
    float _1838 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1772);
    float _1840 = _1762 * 6.283185482025146484375;
    float _1842 = cos(_1840);
    float _1844 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1644);
    float _1848 = _1844 * _1846;
    float _1850 = _1818 * 6.283185482025146484375;
    float _1852 = sin(_1850);
    float _1854 = _1790 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = _1818 * 6.283185482025146484375;
    float _1860 = cos(_1858);
    float _1862 = _1824 * _1852;
    float _1864 = _1790 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = fma(_1830, _1830, _1832);
    float _1870 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1834);
    float _1872 = _1842 * _1852;
    float _1874 = _1852 * _1856;
    float _1876 = rsqrt(_1868);
    float _1878 = _1860 * _1856;
    float _1880 = _1824 * _1860;
    float _1882 = _1842 * _1860;
    float _1884 = _1856 * _1556;
    float _1886 = -_1556;
    float _1888 = _1866 * _1886;
    float _1890 = -_1872;
    float _1892 = fma(_1866, _1880, _1890);
    float _1894 = fma(_1866, _1882, _1862);
    float _1896 = _1842 * _1884;
    float _1898 = -_1880;
    float _1900 = fma(_1866, _1872, _1898);
    float _1902 = fma(_1866, _1862, _1882);
    float _1904 = rsqrt(_1838);
    float _1906 = fma(_1878, _1532, _1888);
    float _1908 = _1830 * _1876;
    float _1910 = _1824 * _1884;
    float _1912 = fma(_1894, _1532, _1896);
    float _1914 = _1808 * _1876;
    float _1916 = _1800 * _1876;
    float _1918 = _1774 * _1908;
    float _1920 = rsqrt(_1836);
    float _1922 = fma(_1900, _1848, _1912);
    float _1924 = _1780 * _1916;
    float _1926 = -_1918;
    float _1928 = fma(_1780, _1914, _1926);
    float _1930 = fma(_1892, _1532, _1910);
    float _1932 = _1788 * _1914;
    float _1934 = -_1924;
    float _1936 = fma(_1788, _1908, _1934);
    float _1938 = fma(_1874, _1848, _1906);
    float _1940 = _1928 * _1922;
    float _1942 = -_1932;
    float _1944 = fma(_1774, _1916, _1942);
    float _1946 = _1936 * _1922;
    float _1948 = fma(_1902, _1848, _1930);
    float _1950 = fma(_1916, _1938, _1940);
    float _1952 = _1684 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1954 = _1904 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1956 = _1944 * _1922;
    float _1958 = fma(_1914, _1938, _1946);
    float _1960 = fma(_1788, _1948, _1950);
    float _1962 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1966 = _1920 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1968 = fma(_1908, _1938, _1956);
    float _1970 = fma(_1774, _1948, _1958);
    float _1972 = _1960 * _1962;
    float _1974 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _1976 = _1960 * _1964;
    float _1978 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _1980 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1982 = fma(_1970, _1974, _1972);
    float _1984 = fma(_1780, _1948, _1968);
    float _1986 = fma(_1970, _1978, _1976);
    float _1988 = _1960 * _1980;
    float _1990 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _1992 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _1994 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _1996 = sqrt(_1870);
    float _1998 = fma(_1984, _1990, _1986);
    float _2000 = fma(_1970, _1992, _1988);
    float _2002 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1820);
    float _2004 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _2006 = fma(_1984, _1994, _1982);
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _2010 = fma(_1984, _2004, _2000);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _2014 = sqrt(_2002);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2008);
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[192].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2012);
    float _2022 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2016);
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2020);
    float _2030 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2032 = _1582 + _2024;
    float _2034 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].y, _2022);
    float _2036 = _1588 + _2028;
    float _2038 = fma(_2026, _1996, _2032);
    float _2040 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].y, _2034);
    float _2042 = fma(_2030, _2014, _2036);
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2046 = _2038 + _2044;
    float _2048 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2052 = _2042 + _2050;
    float _2054 = _2046 * _2046;
    float _2056 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2048);
    float _2058 = _2052 * _2052;
    float _2060 = _1570 + _2040;
    float _2062 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2056);
    float _2064 = _2054 + _2058;
    float _2066 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2068 = sqrt(_2064);
    float _2070 = sqrt(_2062);
    bool _2072 = _2068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2074 = fma(_2066, _2070, _2060);
    float _2076 = _2066;
    float _2078 = _2018;
    float _2080 = _2060;
    float _2082 = (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2084 = _2070;
    if (!_2072)
    {
        _2076 = _2058;
    }
    float _2086 = _2076;
    float _2088 = _2086;
    if (!_2072)
    {
        _2078 = _2054;
    }
    float _2090 = _2078;
    float _2092 = _2090;
    if (!_2072)
    {
        _2080 = _2038;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_2072)
    {
        _2082 = _2042;
    }
    float _2098 = _2082;
    float _2100 = _2098;
    if (!_2072)
    {
        _2084 = _2074;
    }
    float _2102 = _2084;
    bool _2104 = !_2072;
    float _2106 = _2102;
    if (!_2104)
    {
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2112 = _2068 + _2110;
        float _2114 = rsqrt(_2064);
        float _2116 = _2112 * _2108;
        float _2118 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = _2116 * 0.15915493667125701904296875;
        float _2122 = _2120 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = fma(_2124, _2118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2132 = _2114 * _2130;
        float _2134 = _2128 + (-1.0);
        float _2136 = _2052 * _2132;
        float _2138 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = _2046 * _2132;
        float _2142 = fma(_2074, _2128, _2138);
        float _2144 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2146 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2148 = _2140 * _2140;
        float _2150 = _2136 * _2136;
        _2106 = _2142;
        _2092 = _2148;
        _2088 = _2150;
        _2096 = _2144;
        _2100 = _2146;
    }
    float _2152 = _2106;
    float _2154 = _2092;
    float _2156 = _2088;
    float _2158 = _2096;
    float _2160 = _2100;
    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2164 = _2152 + _2162;
    out.m_61.x = _1344;
    out.m_61.y = _1338;
    out.m_61.z = _1310;
    out.m_61.w = _1306;
    float _2166 = fma(_2164, _2164, _2154);
    out.m_63.x = _1316;
    out.m_63.y = _1288;
    out.m_63.z = _1324;
    out.m_63.w = _1322;
    float _2168 = _2166 + _2156;
    out.m_65.x = _1280;
    out.m_65.y = _1292;
    float _2170 = sqrt(_2168);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _2172 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2174 = isnan(_2170);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2180 = _2176 || _2178;
    float _2182 = _2164;
    float _2184 = 1.0;
    float _2186 = _2170;
    if (!_2180)
    {
        _2182 = 1.0;
    }
    float _2188 = _2182;
    bool _2190 = !_2180;
    float _2192 = _2188;
    if (!_2190)
    {
        bool _2194 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2196 = isnan(_2170);
        bool _2198 = _2194 || _2196;
        bool _2200 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2202 = _2198 || _2200;
        if (!_2202)
        {
            float _2204 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2206 = _2170 + _2204;
            float _2208 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2210 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2208;
            float _2212 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2216 = 1.0 / _2210;
            float _2218 = _2206 * _2216;
            float _2220 = fma(_2218, _2214, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2192 = _2220;
            _2222 = true;
        }
        else
        {
            bool _2224 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2226 = isnan(_2170);
            bool _2228 = _2224 || _2226;
            bool _2230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2232 = _2228 || _2230;
            if (!_2232)
            {
                float _2234 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2236 = _2170 + _2234;
                float _2238 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2240 = _2238 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2242 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2244 = _2242 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2246 = 1.0 / _2240;
                float _2248 = _2236 * _2246;
                float _2250 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2192 = _2250;
                _2222 = true;
            }
            else
            {
                _2192 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2222 = false;
    float _2252 = _2192;
    float _2254 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2256 = _2152 + _2254;
    float _2258 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2260 = _2158 + _2258;
    float _2262 = fma(_2256, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2264 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2266 = _2160 + _2264;
    float _2268 = fma(_2260, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2262 + _2270;
    float _2274 = fma(_2266, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2278 = _2268 + _2276;
    float _2280 = _2272 * _2272;
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2284 = _2274 + _2282;
    float _2286 = fma(_2278, _2278, _2280);
    float _2288 = fma(_2284, _2284, _2286);
    float _2290 = rsqrt(_2288);
    float _2292 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2294 = _2278 * _2292;
    float _2296 = _2284 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 + _2300;
    float _2304 = sqrt(_2302);
    bool _2306 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2304 + _2308;
    float _2312 = _2284;
    float _2314 = _2286;
    float _2316 = _2310;
    float _2318 = _2294;
    if (_2306)
    {
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2320;
    }
    float _2322 = _2312;
    if (_2306)
    {
        float _2324 = rsqrt(_2302);
        _2314 = _2324;
    }
    float _2326 = _2314;
    float _2328 = _2326;
    if (_2306)
    {
        float _2330 = _2310 * _2322;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2306)
    {
        float _2334 = _2332 * 0.15915493667125701904296875;
        _2184 = _2334;
    }
    float _2336 = _2184;
    float _2338 = _2290;
    float _2340 = _2336;
    if (_2306)
    {
        float _2342 = _2336 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2338 = _2344;
    }
    float _2346 = _2338;
    float _2348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2350 = precise::max(0.0, _2348);
    float _2352 = 1.0;
    float _2354 = _2350;
    float _2356 = _2348;
    if (_2306)
    {
        float _2358 = _2336 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        _2352 = _2360;
    }
    float _2362 = _2352;
    float _2364 = -_2292;
    float _2366 = -_2350;
    float _2368 = fma(_2272, _2364, _2366);
    if (!_2306)
    {
        _2354 = _2296;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (_2306)
    {
        float _2374 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2374;
    }
    float _2376 = _2356;
    float _2378 = sqrt(_2288);
    float _2380 = _2346;
    float _2382 = _2376;
    if (_2306)
    {
        float _2384 = fma(_2346, _2376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = _2386;
    if (_2306)
    {
        float _2390 = _2362 + (-1.0);
        _2382 = _2390;
    }
    float _2392 = _2382;
    float _2394 = _2392;
    if (_2306)
    {
        float _2396 = _2326 * _2386;
        _2186 = _2396;
    }
    float _2398 = _2186;
    if (!_2306)
    {
        _2328 = _2368;
    }
    float _2400 = _2328;
    float _2402 = _2400;
    if (_2306)
    {
        float _2404 = _2392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2340 = _2404;
    }
    float _2406 = _2340;
    if (_2306)
    {
        float _2408 = _2294 * _2398;
        _2318 = _2408;
    }
    float _2410 = _2318;
    if (!_2306)
    {
        _2388 = _2298;
    }
    float _2412 = _2388;
    float _2414 = _2412;
    if (_2306)
    {
        float _2416 = _2296 * _2398;
        _2372 = _2416;
    }
    float _2418 = _2372;
    if (_2306)
    {
        float _2420 = fma(_2368, _2362, _2406);
        _2402 = _2420;
    }
    float _2422 = _2402;
    if (_2306)
    {
        float _2424 = _2410 * _2410;
        _2414 = _2424;
    }
    float _2426 = _2414;
    if (!_2306)
    {
        _2394 = _2300;
    }
    float _2428 = _2394;
    float _2430 = _2428;
    if (_2306)
    {
        float _2432 = _2418 * _2418;
        _2430 = _2432;
    }
    float _2434 = _2430;
    float _2436 = fma(_2422, _2422, _2426);
    float _2438 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2440 = _2436 + _2434;
    float _2442 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2446 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2444);
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2452 = rsqrt(_2440);
    float _2454 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2442);
    float _2456 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2458 = -_2448;
    float _2460 = _2458 + 1.0;
    float _2462 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2466 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2456);
    float _2468 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2438);
    float _2470 = abs(_2460);
    float _2472 = log2(_2470);
    float _2474 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2476 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2478 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2466);
    float _2480 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2482 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2476);
    float _2484 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2486 = _2452 * _2410;
    float _2488 = -_2480;
    float _2490 = fma(_2488, _2450, 1.0);
    float _2492 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2468);
    float _2494 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2496 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2498 = _2452 * _2422;
    float _2500 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2502 = _2452 * _2418;
    float _2504 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2496);
    float _2506 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2508 = -_2500;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2508);
    float _2512 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2514 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2504);
    float _2516 = log2(_2490);
    float _2518 = -_2502;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2510);
    float _2522 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2524 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2514);
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2528 = fma(_2520, -0.5, 0.5);
    float _2530 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2522);
    float _2532 = fma(_2520, 0.5, 0.5);
    float _2534 = exp2(_2506);
    float _2536 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2526);
    float _2538 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2540 = _2498 + 1.0;
    float _2542 = fma(_2532, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2544 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2536);
    float _2546 = 1.0 / _2524;
    float _2548 = fma(_2532, _2542, -0.212114393711090087890625);
    float _2550 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2544);
    float _2552 = _2516 * 0.693147182464599609375;
    float _2554 = fma(_2532, _2548, 1.570728778839111328125);
    float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2558 = sqrt(_2528);
    float _2560 = -_2498;
    float _2562 = fma(_2534, _2540, _2560);
    float _2564 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2538);
    float _2566 = fma(_2562, 0.5, 0.5);
    float _2568 = _2564 * _2546;
    float _2570 = _2550 * _2546;
    float _2572 = fma(_2568, 0.5, 0.5);
    float _2574 = fma(_2570, -0.5, 0.5);
    float _2576 = _2558 * 0.636619746685028076171875;
    float3 _6440 = float3(_2572, _2574, _2556);
    float _2578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6440, float3(0.0), isnan(_6440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6440, float3(0.0), isnan(_6440)), level(0.0)).x;
    float3 _6451 = float3(_2572, _2574, _2556);
    float4 _2581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6451, float3(0.0), isnan(_6451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6451, float3(0.0), isnan(_6451)), level(0.0)).xyzw;
    float _2583 = _2581.x;
    float _2585 = _2581.y;
    float _2587 = _2581.z;
    float _2589 = _2581.w;
    float _2591 = -_2554;
    float _2593 = fma(_2576, _2591, 1.0);
    float2 _6472 = float2(_2593, _2566);
    float3 _2595 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6472, float2(0.0), isnan(_6472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6472, float2(0.0), isnan(_6472)), level(0.0)).xyz;
    float _2597 = _2595.x;
    float _2599 = _2595.y;
    float _2601 = _2595.z;
    float _2603 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2504);
    float _2607 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2609 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2605);
    float _2611 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2607);
    float _2613 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2615 = 1.0 / _2609;
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2611);
    float _2619 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2617);
    float _2621 = exp2(_2613);
    float _2623 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2625 = _2619 * _2615;
    out.m_49.x = _2623;
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2629 = fma(_2524, _2625, _2627);
    float _2631 = -_2621;
    float _2633 = _2631 + 1.0;
    float _2635 = _2524 + _2629;
    out.gl_Position.x = _2564;
    out.gl_Position.y = _2550;
    out.gl_Position.z = _2629;
    out.gl_Position.w = _2524;
    float _2637 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2639 = _2635 * 0.5;
    float _2641 = -_2637;
    float _2643 = _2641 + 1.0;
    out.m_69.z = _2639;
    out.m_69.w = _2524;
    float _2645 = _2637 * _2578;
    float _2647 = _2589 * _2645;
    float _2649 = _2601 * _2645;
    float _2651 = fma(_2597, _2647, _2583);
    float _2653 = fma(_2599, _2647, _2585);
    float _2655 = _2589 * _2643;
    float _2657 = fma(_2589, _2649, _2587);
    out.m_71.x = _2651;
    out.m_71.y = _2653;
    out.m_71.z = _2657;
    out.m_71.w = _2655;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_46.w;
    float _93 = trunc(_91);
    int _95 = int(_93);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_49.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2713 = as_type<float>(_111);
        out.gl_Position.z = _2713;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_51.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = _127;
    if (_123)
    {
        float _131 = float(_95);
        _105 = _131;
    }
    float _133 = _105;
    bool _135 = _127 >= _133;
    bool _137 = !_123;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    int _145 = 0;
    if (_139)
    {
        float _147 = _143 * 5.0;
        _145 = as_type<int>(_147);
    }
    int _149 = _145;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2783 = as_type<float>(_149);
        out.gl_Position.z = _2783;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    int _151 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _153 = _151;
    int _155 = 0;
    int _157 = _86(_153, _155, (*spvDescriptorSet0.support_buffer));
    float _159 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _161 = int(_159);
    float _163 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _165 = float(_95);
    float _167 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _169 = int(_167);
    float _171 = float(_161);
    float _173 = 1.0 / _165;
    float _175 = float(uint(_169));
    float _177 = 1.0 / _171;
    int _179 = ~_169;
    int _181 = _179 + 1;
    float _183 = float(_169);
    int _185 = ~_169;
    int _187 = _185 + 1;
    float _189 = 1.0 / _175;
    float _191 = _127 * _177;
    float _193 = trunc(_191);
    int _195 = int(_193);
    int _197 = as_type<int>(_189) + (-2);
    float _199 = float(uint(_195));
    float _201 = as_type<float>(_197) * _199;
    float _203 = in.m_53.x;
    float _205 = in.m_53.y;
    float _207 = trunc(_201);
    float _209 = precise::max(_207, 0.0);
    uint _212 = uint(_209);
    float _214 = float(_195);
    bool _216 = _214 >= _183;
    bool _218 = isnan(_214);
    bool _220 = _216 || _218;
    bool _222 = isnan(_183);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    int _228 = _181 * int(_212);
    int _230 = _228 + _195;
    float _232 = trunc(_226);
    int _234 = int(_232);
    float _236 = float(uint(_230));
    float _238 = as_type<float>(_197) * _236;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _242 = _240 != 0;
    float _244 = trunc(_238);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    bool _250 = !_242;
    float _252 = _250 ? 7.345489978790283203125 : 1.0;
    bool _254 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _258 = _254 || _256;
    bool _260 = isnan(1.0);
    bool _262 = _258 || _260;
    float _264 = _252 * _203;
    float _266 = floor(_264);
    int _268 = int(_212) + int(_248);
    float _270 = as_type<float>(_187);
    float _272 = _264;
    if (!_262)
    {
        float _274 = _163 * _163;
        float _276 = _274 * 0.5;
        _270 = _276;
    }
    float _278 = _270;
    int _280 = _187 * _268;
    int _282 = _280 + _195;
    float _284 = _278;
    if (!_262)
    {
        float _286 = _278 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _284 = _286;
    }
    float _288 = _284;
    bool _290 = uint(_282) >= uint(_169);
    float _292 = -_266;
    float _294 = _264 + _292;
    float _296 = _288;
    if (!_262)
    {
        _272 = _163;
    }
    float _298 = _272;
    bool _300 = !_290;
    int _302 = _300 ? 0 : (-1);
    bool _304 = !_262;
    float _306 = _298;
    if (!_304)
    {
        float _308 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _310 = log2(_308);
        float _312 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _314 = _312 + 1.0;
        float _316 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _318 = _163 * _310;
        float _320 = 1.0 / _314;
        float _322 = _316 * 0.693147182464599609375;
        float _324 = exp2(_318);
        float _326 = 1.0 / _322;
        float _328 = _324 + (-1.0);
        float _330 = -_328;
        float _332 = fma(_330, _326, _163);
        float _334 = _332 * _320;
        float _336 = _334 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _296 = _336;
    }
    float _338 = _296;
    bool _340 = !_262;
    if (!_340)
    {
        float _342 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _344 = log2(_342);
        float _346 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _348 = _346 + 1.0;
        float _350 = 1.0 / _348;
        float _352 = _163 * _344;
        float _354 = exp2(_352);
        float _356 = -_354;
        float _358 = _356 + 1.0;
        float _360 = _358 * _350;
        _306 = _360;
    }
    float _362 = _306;
    int _364 = ~_268;
    int _366 = _364 + _302;
    int _368 = _366 + 1;
    float _370 = _294 * _183;
    float _372 = _127 * _183;
    bool _374 = _169 == 0;
    int _376 = _169 * _368;
    int _378 = _376 + _195;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _382 = _380 != 0;
    float _384 = _372 * _173;
    int _386 = ~_234;
    int _388 = _386 + 1;
    int _390 = _388 + 1;
    float _392 = trunc(_370);
    int _394 = int(_392);
    bool _396 = !_374;
    int _398 = _396 ? _378 : (-1);
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _402 = _400 != 0;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _406 = _404 != 0;
    int _408 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _410 = _408 != 0;
    int _412 = _398 * _390;
    int _414 = _169 + (-1);
    float _416 = trunc(_384);
    int _418 = int(_416);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _422 = _420 != 0;
    bool _424 = !_406;
    int _426 = _424 ? 0 : 1;
    int _428 = _234 * _414;
    int _430 = _428 + _412;
    bool _432 = !_422;
    int _434 = _432 ? 0 : 1;
    bool _436 = !_402;
    int _438 = _436 ? 0 : 1;
    int _440 = abs(_426);
    int _442 = abs(_434);
    bool _444 = !_410;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_438);
    int _450 = _394 * _442;
    int _452 = _450 + _195;
    bool _454 = !_382;
    int _456 = _454 ? 0 : 1;
    int _458 = abs(_446);
    int _460 = _430 * _440;
    int _462 = abs(_456);
    int _464 = _418 * _448;
    int _466 = _464 + _460;
    int _468 = ~_169;
    int _470 = _468 + 1;
    int _472 = _452 * _458;
    int _474 = _472 + _466;
    float _476 = float(uint(_452));
    int _478 = _394 * _462;
    int _480 = _478 + _474;
    float _482 = as_type<float>(_197) * _476;
    float _484 = float(uint(_480));
    float _486 = trunc(_482);
    float _488 = precise::max(_486, 0.0);
    uint _490 = uint(_488);
    float _492 = as_type<float>(_197) * _484;
    float _494 = trunc(_492);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    int _500 = ~_169;
    int _502 = _500 + 1;
    int _504 = _470 * int(_498);
    int _506 = _504 + _480;
    float _508 = float(uint(_506));
    int _510 = ~_169;
    int _512 = _510 + 1;
    float _514 = as_type<float>(_197) * _508;
    int _516 = _512 * int(_490);
    int _518 = _516 + _452;
    float _520 = trunc(_514);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    int _526 = int(_498) + int(_524);
    float _528 = float(uint(_518));
    int _530 = _502 * _526;
    int _532 = _530 + _480;
    float _534 = as_type<float>(_197) * _528;
    bool _536 = uint(_532) >= uint(_169);
    float _538 = trunc(_534);
    float _540 = precise::max(_538, 0.0);
    uint _542 = uint(_540);
    bool _544 = !_536;
    int _546 = _544 ? 0 : (-1);
    int _548 = ~_526;
    int _550 = _548 + _546;
    int _552 = _550 + 1;
    int _554 = _169 * _552;
    int _556 = _554 + _480;
    float _558 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    bool _560 = !_374;
    int _562 = _560 ? _556 : (-1);
    float _564 = fma(_558, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].y);
    int _566 = int(_490) + int(_542);
    int _568 = _562 & 3;
    bool _570 = _568 != 0;
    int _572 = _562 & 3;
    bool _574 = _572 != 0;
    bool _576 = uint(_568) > 1u;
    int _578 = _574 ? 0 : 1;
    int _580 = _562 >> 31;
    int _582 = ~_578;
    int _584 = _582 + 1;
    int _586 = _584 + 1;
    int _588 = _580 & 3;
    int _590 = abs(_157);
    int _592 = _562 + _588;
    int _594 = _586;
    if (!_576)
    {
        int _596 = ~_578;
        int _598 = _596 + 1;
        _594 = _598;
    }
    int _600 = _594;
    float _602 = float(_157);
    int _604 = _592 >> 2;
    float _606 = _564 * _602;
    int _608 = _604 << 4;
    int _610 = _608 + 368;
    float _612 = trunc(_606);
    int _614 = int(_612);
    float _616 = float(uint(_590));
    uint _618 = uint(int(uint(_610) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    float _634 = 1.0 / _616;
    int _636 = abs(_614);
    uint _638 = uint(int(uint(_614) >> uint(31)));
    float _640 = float(uint(_636));
    int _642 = ~int(_638);
    int _644 = _642 + 1;
    int _646 = as_type<int>(_634) + (-2);
    float _648 = as_type<float>(_646) * _640;
    float _650 = trunc(_648);
    float _652 = precise::max(_650, 0.0);
    uint _654 = uint(_652);
    int _656 = ~int(_654);
    int _658 = _656 + 1;
    int _660 = _658 * _590;
    int _662 = _660 + _636;
    float _664 = float(uint(_662));
    float _666 = as_type<float>(_646) * _664;
    float _668 = in.m_55.z;
    float _670 = trunc(_666);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    int _676 = int(_654) + int(_674);
    int _678 = ~_676;
    int _680 = _678 + 1;
    float _682 = trunc(_668);
    int _684 = int(_682);
    int _686 = _680 * _590;
    int _688 = _686 + _636;
    bool _690 = uint(_688) >= uint(_590);
    bool _692 = !_690;
    int _694 = _692 ? 0 : (-1);
    bool _696 = _157 == 0;
    int _698 = ~_676;
    int _700 = _698 + _694;
    int _702 = _700 + 1;
    int _704 = _610 + 8;
    uint _706 = uint(int(uint(_704) >> uint(2)));
    uint _708 = uint(int(uint(int(_706)) >> uint(2)));
    int _710 = int(_706) & 3;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[int(_708)][_710];
    int _714 = int(_706) + 1;
    uint _716 = uint(int(uint(_714) >> uint(2)));
    int _718 = _714 & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = _702 * _590;
    int _724 = _722 + _636;
    int _726 = ~_169;
    int _728 = _726 + 1;
    int _730 = _724 ^ _644;
    int _732 = ~_644;
    int _734 = _732 + _730;
    int _736 = _734 + 1;
    int _738 = _728 * _566;
    int _740 = _738 + _452;
    bool _742 = !_696;
    int _744 = _742 ? _736 : (-1);
    int _746 = _744;
    int _748 = 0;
    int _750 = _87(_746, _748, (*spvDescriptorSet0.support_buffer));
    int _752 = _684;
    int _754 = 0;
    int _756 = _87(_752, _754, (*spvDescriptorSet0.support_buffer));
    float3 _760 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_750, _756)), 0).xyw;
    float _762 = _760.x;
    float _764 = _760.y;
    float _766 = _760.z;
    bool _768 = _568 != 3;
    bool _770 = uint(_568) >= 2u;
    int _772 = abs(_600);
    int _774 = _770 ? 0 : 1;
    float _776 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _778 = int(_776);
    int _780 = ~_772;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    bool _786 = uint(_740) >= uint(_169);
    bool _788 = _568 != 3;
    int _790 = _784 * as_type<int>(_632);
    bool _792 = !_570;
    int _794 = _792 ? 0 : 1;
    int _796 = ~_774;
    int _798 = _796 + 1;
    int _800 = _798 + 1;
    int _802 = _800;
    if (_768)
    {
        int _804 = ~_774;
        int _806 = _804 + 1;
        _802 = _806;
    }
    int _808 = _802;
    bool _810 = !_786;
    int _812 = _810 ? 0 : (-1);
    bool _814 = !_788;
    int _816 = _814 ? 0 : (-1);
    int _818 = abs(_794);
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _822 = _820 != 0;
    int _824 = abs(_808);
    int _826 = ~_566;
    int _828 = _826 + _812;
    int _830 = _828 + 1;
    int _832 = abs(_816);
    bool _834 = !_822;
    int _836 = _834 ? 0 : 1;
    int _838 = _169 * _830;
    int _840 = _838 + _452;
    int _842 = ~_818;
    int _844 = _842 + 1;
    int _846 = _844 + 1;
    int _848 = abs(_836);
    int _850 = _846 * as_type<int>(_624);
    int _852 = _850 + _790;
    int _854 = ~_824;
    int _856 = _854 + 1;
    int _858 = _856 + 1;
    int _860 = ~_832;
    int _862 = _860 + 1;
    int _864 = _862 + 1;
    int _866 = abs(_778);
    int _868 = _858 * as_type<int>(_712);
    int _870 = _868 + _852;
    int _872 = ~_848;
    int _874 = _872 + 1;
    int _876 = _874 + 1;
    int _878 = _864 * as_type<int>(_720);
    int _880 = _878 + _870;
    bool _882 = !_374;
    int _884 = _882 ? _840 : (-1);
    float _886 = float(uint(_866));
    int _888 = _880 * _876;
    float _890 = float(uint(_778));
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _894 = _892 != 0;
    int _896 = _884 * _848;
    int _898 = _896 + _888;
    float _900 = 1.0 / _886;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _904 = _902 != 0;
    int _906 = ~_778;
    int _908 = _906 + 1;
    int _910 = abs(_898);
    float _912 = float(uint(_898));
    float _914 = 1.0 / _890;
    float _916 = float(uint(_910));
    bool _918 = _205 > 0.5;
    bool _920 = _918 && _904;
    bool _922 = _778 == 0;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _926 = as_type<int>(_900) + (-2);
    float _928 = fma(_205, (*spvDescriptorSet0.vp_c9)._m0[78].w, _924);
    float _930 = as_type<float>(_926) * _916;
    int _932 = as_type<int>(_914) + (-2);
    float _934 = trunc(_930);
    float _936 = precise::max(_934, 0.0);
    uint _938 = uint(_936);
    int _940 = ~_778;
    int _942 = _940 + 1;
    float _944 = as_type<float>(_932) * _912;
    float _946 = trunc(_944);
    float _948 = precise::max(_946, 0.0);
    uint _950 = uint(_948);
    int _952 = ~int(_938);
    int _954 = _952 + 1;
    int _956 = _954 * _866;
    int _958 = _956 + _910;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _962 = _942 * int(_950);
    int _964 = _962 + _898;
    float _966 = float(uint(_958));
    float _968 = float(uint(_964));
    float _970 = as_type<float>(_926) * _966;
    float _972 = as_type<float>(_932) * _968;
    float _974 = _203 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _976 = trunc(_970);
    float _978 = precise::max(_976, 0.0);
    uint _980 = uint(_978);
    float _982 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _984 = -_982;
    float _986 = fma(_974, 2.0, _984);
    float _988 = _205 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _990 = _898 ^ _778;
    float _992 = trunc(_972);
    float _994 = precise::max(_992, 0.0);
    uint _996 = uint(_994);
    uint _998 = uint(int(uint(_990) >> uint(31)));
    int _1000 = int(_938) + int(_980);
    float _1002 = in.m_55.x;
    int _1004 = ~_1000;
    int _1006 = _1004 + 1;
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1010 = int(_950) + int(_996);
    float _1012 = fma(_203, (*spvDescriptorSet0.vp_c9)._m0[78].z, _960);
    float _1014 = as_type<float>(_996);
    float _1016 = as_type<float>(_998);
    if (_894)
    {
        float _1018 = in.m_53.x;
        _1014 = _1018;
    }
    float _1020 = _1014;
    float _1022 = fma(_988, -2.0, _1008);
    int _1024 = _1006 * _866;
    int _1026 = _1024 + _910;
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1030 = _908 * _1010;
    int _1032 = _1030 + _898;
    float _1034 = in.m_51.x;
    float _1036 = in.m_51.y;
    float _1038 = in.m_51.z;
    float _1040 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1022);
    float _1042 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1012);
    bool _1044 = uint(_1032) >= uint(_778);
    bool _1046 = !_1044;
    int _1048 = _1046 ? 0 : (-1);
    bool _1050 = uint(_1026) >= uint(_866);
    int _1052 = ~_1010;
    int _1054 = _1052 + _1048;
    int _1056 = _1054 + 1;
    bool _1058 = !_1050;
    int _1060 = _1058 ? 0 : (-1);
    float _1062 = in.m_55.y;
    float _1064 = as_type<float>(_1026);
    if (_894)
    {
        _1064 = _1002;
    }
    float _1066 = _1064;
    int _1068 = _778 * _1056;
    int _1070 = _1068 + _898;
    int _1072 = ~_1060;
    int _1074 = _1000 + _1072;
    int _1076 = _1074 + 1;
    float _1078 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _1080 = _1020 > 0.5;
    bool _1082 = _1080 && _894;
    float _1084 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1086 = ~int(_998);
    int _1088 = _1086 + 1;
    float _1090 = fma(_362, _1034, _1078);
    bool _1092 = _778 == 0;
    float _1094 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1096 = _1076 ^ _1088;
    bool _1098 = !_1092;
    int _1100 = _1098 ? _1070 : (-1);
    int _1102 = ~_1088;
    int _1104 = _1102 + _1096;
    int _1106 = _1104 + 1;
    float _1108 = _1066;
    if (_1082)
    {
        float _1110 = -_1066;
        float _1112 = _1110 + 1.0;
        _1108 = _1112;
    }
    float _1114 = _1108;
    if (!_894)
    {
        _1016 = _1002;
    }
    float _1116 = _1016;
    bool _1118 = !_922;
    int _1120 = _1118 ? _1106 : (-1);
    float _1122 = _1116;
    if (_894)
    {
        _1122 = _1114;
    }
    float _1124 = _1122;
    float _1126 = _1084 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1128 = float(_1100);
    float _1130 = -_127;
    float _1132 = fma(_1130, (*spvDescriptorSet0.vp_c9)._m0[76].x, _986);
    float _1134 = float(_1120);
    float _1136 = fma(_1094, _1124, -0.5);
    float _1138 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1140 = fma(_1094, _1128, _1132);
    float _1142 = _338 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _1144 = _744 + 1;
    float _1146 = -_1040;
    float _1148 = fma(_1126, _1134, _1146);
    float _1150 = fma(_127, (*spvDescriptorSet0.vp_c9)._m0[77].w, _928);
    float _1152 = fma(_362, _1036, _1142);
    int _1154 = abs(_1144);
    float _1156 = _1062;
    if (_920)
    {
        float _1158 = -_1062;
        float _1160 = _1158 + 1.0;
        _1156 = _1160;
    }
    float _1162 = _1156;
    float _1164 = fma(_1042, _1136, _1140);
    uint _1166 = uint(int(uint(_1144) >> uint(31)));
    float _1168 = float(uint(_1154));
    float _1170 = fma(_1126, _1162, -0.5);
    float _1172 = fma(_362, _1038, _1138);
    int _1174 = ~int(_1166);
    int _1176 = _1174 + 1;
    float _1178 = as_type<float>(_646) * _1168;
    float _1180 = fma(_1150, _1170, _1148);
    float _1182 = trunc(_1178);
    float _1184 = precise::max(_1182, 0.0);
    uint _1186 = uint(_1184);
    int _1188 = ~int(_1186);
    int _1190 = _1188 + 1;
    int _1192 = _1190 * _590;
    int _1194 = _1192 + _1154;
    float _1196 = float(uint(_1194));
    float _1198 = as_type<float>(_646) * _1196;
    float _1200 = trunc(_1198);
    float _1202 = precise::max(_1200, 0.0);
    uint _1204 = uint(_1202);
    float _1206 = in.m_46.x;
    float _1208 = in.m_46.y;
    float _1210 = in.m_46.z;
    int _1212 = int(_1186) + int(_1204);
    float _1214 = in.m_57.x;
    float _1216 = in.m_57.y;
    float _1218 = in.m_57.z;
    float _1220 = in.m_57.w;
    int _1222 = ~_1212;
    int _1224 = _1222 + 1;
    int _1226 = _1224 * _590;
    int _1228 = _1226 + _1154;
    bool _1230 = uint(_1228) >= uint(_590);
    bool _1232 = !_1230;
    int _1234 = _1232 ? 0 : (-1);
    int _1236 = ~_1212;
    int _1238 = _1236 + _1234;
    int _1240 = _1238 + 1;
    uint _1242 = as_type<uint>(half2(float2(_766, 0.0)));
    float _1244 = _1214 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1246 = fma(_1172, _1220, _1210);
    float _1248 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    uint _1250 = extract_bits(_1242, 0u, 8u);
    int _1252 = int(_1250) & 255;
    uint _1254 = extract_bits(_1242, 8u, 8u);
    int _1256 = int(_1254) & 255;
    int _1258 = _1256 << 8;
    int _1260 = _1252 | _1258;
    int _1262 = _1240 * _590;
    int _1264 = _1262 + _1154;
    float _1266 = fma(_1090, _1220, _1206);
    bool _1268 = _1260 >= 32768;
    float _1270 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    int _1272 = _1260 + (-1024);
    float _1274 = fma(_1152, _1220, _1208);
    int _1276 = _1264 ^ _1176;
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1280 = _1164 + 0.5;
    int _1282 = ~_1176;
    int _1284 = _1282 + _1276;
    int _1286 = _1284 + 1;
    float _1288 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1292 = _1180 + 0.5;
    int _1294 = _1272;
    if (_1268)
    {
        int _1296 = ~_1260;
        int _1298 = _1296 + 33792;
        int _1300 = _1298 + 1;
        _1294 = _1300;
    }
    int _1302 = _1294;
    float _1304 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1306 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _1308 = _1302 + 30719;
    float _1310 = _1290 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1314 = float(_1308);
    float _1316 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1318 = !_696;
    int _1320 = _1318 ? _1286 : (-1);
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1324 = _1312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1326 = fma(_1314, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1328 = abs(_1326);
    float _1330 = -_1328;
    float _1332 = _1330 + 1.0;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    int _1336 = as_type<int>(_1332) + (-218103808);
    float _1338 = _1334 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1340 = uint(_1336) >= 1920991232u;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1346 = !_1340;
    if (!_1346)
    {
        int _1348;
        _84(_1348, out.gl_Position, out.gl_PointSize);
    }
    int _1350 = _1320;
    int _1352 = 0;
    int _1354 = _87(_1350, _1352, (*spvDescriptorSet0.support_buffer));
    int _1356 = _684;
    int _1358 = 0;
    int _1360 = _87(_1356, _1358, (*spvDescriptorSet0.support_buffer));
    float3 _1362 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_1354, _1360)), 0).xyw;
    float _1364 = _1362.x;
    float _1366 = _1362.y;
    float _1368 = _1362.z;
    float _1370 = floor(_606);
    float _1372 = -_1370;
    float _1374 = _606 + _1372;
    uint _1376 = as_type<uint>(half2(float2(_1368, 0.0)));
    float _1378 = -_762;
    float _1380 = _1378 + _1364;
    float _1382 = -_764;
    float _1384 = _1382 + _1366;
    uint _1386 = extract_bits(_1376, 0u, 8u);
    int _1388 = int(_1386) & 255;
    uint _1390 = extract_bits(_1376, 8u, 8u);
    int _1392 = int(_1390) & 255;
    int _1394 = _1392 << 8;
    int _1396 = _1388 | _1394;
    float _1398 = fma(_1374, _1380, _762);
    float _1400 = fma(_1374, _1384, _764);
    bool _1402 = _1396 >= 32768;
    int _1404 = _1396 + (-1024);
    int _1406 = _1404;
    if (_1402)
    {
        int _1408 = ~_1396;
        int _1410 = _1408 + 33792;
        int _1412 = _1410 + 1;
        _1406 = _1412;
    }
    int _1414 = _1406;
    int _1416 = _1414 + 30719;
    float _1418 = float(_1416);
    float _1420 = fma(_1418, -3.2553143682889640331268310546875e-05, 0.999983727931976318359375);
    float _1422 = abs(_1420);
    float _1424 = -_1422;
    float _1426 = _1424 + 1.0;
    int _1428 = as_type<int>(_1426) + (-218103808);
    bool _1430 = uint(_1428) >= 1920991232u;
    bool _1432 = !_1430;
    if (!_1432)
    {
        int _1434;
        _84(_1434, out.gl_Position, out.gl_PointSize);
    }
    float _1436 = in.m_53.x;
    float _1438 = in.m_53.y;
    float _1440 = in.m_53.z;
    float _1442 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1444 = log2(_1442);
    float _1446 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1448 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1450 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1452 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1446);
    float _1454 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1448);
    float _1456 = _1400 * _1400;
    float _1458 = fma(_1266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1450);
    int _1460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1462 = _1460 != 0;
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1466 = _1464 != 0;
    int _1468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1470 = _1468 != 0;
    float _1472 = _1244 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1474 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1458);
    float _1476 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1400);
    float _1478 = _1444 * _127;
    float _1480 = _1248 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1482 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1484 = isnan(0.0);
    bool _1486 = _1482 || _1484;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1490 = _1486 || _1488;
    float _1492 = exp2(_1478);
    bool _1494 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1496 = isnan(1.0);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1502 = _1498 || _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1506 = 1.0 + _1504;
    float _1508 = _1440 + _1438;
    float _1510 = _1440 + _1436;
    float _1512 = _1440 + (-0.5);
    float _1514 = _1440 * 2.0;
    float _1516 = _1438 + _1436;
    float _1518 = _1436 * 2.0;
    float _1520 = _1436 + (-0.5);
    float _1522 = fma(_1398, _1398, _1456);
    float _1524 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1398);
    float _1526 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1452);
    float _1528 = fma(_1246, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1454);
    float _1530 = floor(_1514);
    float _1532 = _1472 * _1524;
    float _1534 = _1438 + (-0.5);
    float _1536 = _1438 * 2.0;
    float _1538 = _1508 + (-1.0);
    float _1540 = -_1492;
    float _1542 = _1540 + 1.0;
    float _1544 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1546 = sqrt(_1522);
    float _1548 = _1516 + (-1.0);
    float _1550 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1552 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _1544);
    float _1554 = _1510 + (-1.0);
    float _1556 = _1480 * _1476;
    float _1558 = _1490 ? _1542 : 0.0;
    float _1560 = 1.0 / _1506;
    bool _1562 = _1530 > 0.0;
    float _1564 = fma(_1548, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1566 = !_1462;
    int _1568 = _1566 ? 0 : 1;
    float _1570 = _1528 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1572 = _1530 >= 0.0;
    bool _1574 = isnan(_1530);
    bool _1576 = _1572 || _1574;
    bool _1578 = isnan(0.0);
    bool _1580 = _1576 || _1578;
    float _1582 = _1526 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1584 = floor(_1518);
    int _1586 = _1580 ? 0 : 1;
    float _1588 = _1474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1590 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _1552);
    float _1592 = floor(_1536);
    if (_1502)
    {
        float _1594 = _1558 * _1560;
        _129 = _1594;
    }
    float _1596 = _129;
    int _1598 = abs(_1568);
    float _1600 = fma(_1554, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1602 = float(_1598);
    bool _1604 = _1584 > 0.0;
    float _1606 = _1546 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1608 = -_1546;
    float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[191].z;
    bool _1612 = _1584 >= 0.0;
    bool _1614 = isnan(_1584);
    bool _1616 = _1612 || _1614;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    float _1622 = _1606 * _1610;
    int _1624 = _1620 ? 0 : 1;
    float _1626 = in.m_59.x;
    float _1628 = in.m_59.y;
    float _1630 = in.m_59.z;
    bool _1632 = _1592 > 0.0;
    bool _1634 = _1592 >= 0.0;
    bool _1636 = isnan(_1592);
    bool _1638 = _1634 || _1636;
    bool _1640 = isnan(0.0);
    bool _1642 = _1638 || _1640;
    float _1644 = sqrt(_1622);
    int _1646 = ~_1586;
    int _1648 = _1646 + 1;
    int _1650 = _1648 + 1;
    int _1652 = _1650;
    if (!_1562)
    {
        int _1654 = ~_1586;
        int _1656 = _1654 + 1;
        _1652 = _1656;
    }
    int _1658 = _1652;
    int _1660 = ~_1624;
    int _1662 = _1660 + 1;
    int _1664 = _1662 + 1;
    float _1666 = float(_1658);
    int _1668 = _1664;
    if (!_1604)
    {
        int _1670 = ~_1624;
        int _1672 = _1670 + 1;
        _1668 = _1672;
    }
    int _1674 = _1668;
    bool _1676 = !_1470;
    int _1678 = _1676 ? 0 : 1;
    float _1680 = _1602 * _1666;
    int _1682 = _1642 ? 0 : 1;
    float _1684 = rsqrt(_1590);
    int _1686 = abs(_1678);
    float _1688 = -_1570;
    float _1690 = _1688 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _1692 = !_1466;
    int _1694 = _1692 ? 0 : 1;
    float _1696 = _1680 * (-2.0);
    int _1698 = ~_1682;
    int _1700 = _1698 + 1;
    int _1702 = _1700 + 1;
    float _1704 = _1690 * _1690;
    int _1706 = _1702;
    if (!_1632)
    {
        int _1708 = ~_1682;
        int _1710 = _1708 + 1;
        _1706 = _1710;
    }
    int _1712 = _1706;
    float _1714 = -_1582;
    float _1716 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    int _1718 = abs(_1694);
    float _1720 = fma(_1696, _1626, _1626);
    float _1722 = -_1588;
    float _1724 = _1722 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = float(_1674);
    float _1728 = fma(_1716, _1716, _1704);
    float _1730 = float(_1718);
    float _1732 = fma(_1520, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1720);
    float _1734 = float(_1686);
    float _1736 = fma(_1724, _1724, _1728);
    float _1738 = float(_1712);
    float _1740 = _1730 * _1726;
    float _1742 = fma(_1564, _1696, _1564);
    float _1744 = _1740 * (-2.0);
    float _1746 = _1734 * _1738;
    float _1748 = rsqrt(_1736);
    float _1750 = fma(_1742, _1596, _1732);
    float _1752 = fma(_1550, _1744, _1550);
    float _1754 = _1746 * (-2.0);
    float _1756 = fma(_1744, _1628, _1628);
    float _1758 = fma(_1600, _1754, _1600);
    float _1760 = fma(_1754, _1630, _1630);
    float _1762 = _1750 * 0.15915493667125701904296875;
    float _1764 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1766 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1760);
    float _1768 = fma(_1534, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1756);
    float _1770 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1772 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _1764);
    float _1774 = _1716 * _1748;
    float _1776 = fma(_1758, _1596, _1766);
    float _1778 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _1770);
    float _1780 = _1724 * _1748;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1784 = _1774 * _1782;
    float _1786 = fma(_1752, _1596, _1768);
    float _1788 = _1690 * _1748;
    float _1790 = _1776 * 0.15915493667125701904296875;
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1794 = _1780 * _1792;
    float _1796 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1798 = -_1784;
    float _1800 = fma(_1780, _1796, _1798);
    float _1802 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1806 = -_1794;
    float _1808 = fma(_1788, _1804, _1806);
    float _1810 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _1812 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1814 = _1788 * _1812;
    float _1816 = _1800 * _1800;
    float _1818 = _1786 * 0.15915493667125701904296875;
    float _1820 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1802);
    float _1822 = _1762 * 6.283185482025146484375;
    float _1824 = sin(_1822);
    float _1826 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1828 = -_1814;
    float _1830 = fma(_1774, _1826, _1828);
    float _1832 = fma(_1808, _1808, _1816);
    float _1834 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1810);
    float _1836 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _1778);
    float _1838 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _1772);
    float _1840 = _1762 * 6.283185482025146484375;
    float _1842 = cos(_1840);
    float _1844 = _1270 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1846 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1644);
    float _1848 = _1844 * _1846;
    float _1850 = _1818 * 6.283185482025146484375;
    float _1852 = sin(_1850);
    float _1854 = _1790 * 6.283185482025146484375;
    float _1856 = cos(_1854);
    float _1858 = _1818 * 6.283185482025146484375;
    float _1860 = cos(_1858);
    float _1862 = _1824 * _1852;
    float _1864 = _1790 * 6.283185482025146484375;
    float _1866 = sin(_1864);
    float _1868 = fma(_1830, _1830, _1832);
    float _1870 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1834);
    float _1872 = _1842 * _1852;
    float _1874 = _1852 * _1856;
    float _1876 = rsqrt(_1868);
    float _1878 = _1860 * _1856;
    float _1880 = _1824 * _1860;
    float _1882 = _1842 * _1860;
    float _1884 = _1856 * _1556;
    float _1886 = -_1556;
    float _1888 = _1866 * _1886;
    float _1890 = -_1872;
    float _1892 = fma(_1866, _1880, _1890);
    float _1894 = fma(_1866, _1882, _1862);
    float _1896 = _1842 * _1884;
    float _1898 = -_1880;
    float _1900 = fma(_1866, _1872, _1898);
    float _1902 = fma(_1866, _1862, _1882);
    float _1904 = rsqrt(_1838);
    float _1906 = fma(_1878, _1532, _1888);
    float _1908 = _1830 * _1876;
    float _1910 = _1824 * _1884;
    float _1912 = fma(_1894, _1532, _1896);
    float _1914 = _1808 * _1876;
    float _1916 = _1800 * _1876;
    float _1918 = _1774 * _1908;
    float _1920 = rsqrt(_1836);
    float _1922 = fma(_1900, _1848, _1912);
    float _1924 = _1780 * _1916;
    float _1926 = -_1918;
    float _1928 = fma(_1780, _1914, _1926);
    float _1930 = fma(_1892, _1532, _1910);
    float _1932 = _1788 * _1914;
    float _1934 = -_1924;
    float _1936 = fma(_1788, _1908, _1934);
    float _1938 = fma(_1874, _1848, _1906);
    float _1940 = _1928 * _1922;
    float _1942 = -_1932;
    float _1944 = fma(_1774, _1916, _1942);
    float _1946 = _1936 * _1922;
    float _1948 = fma(_1902, _1848, _1930);
    float _1950 = fma(_1916, _1938, _1940);
    float _1952 = _1684 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1954 = _1904 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1956 = _1944 * _1922;
    float _1958 = fma(_1914, _1938, _1946);
    float _1960 = fma(_1788, _1948, _1950);
    float _1962 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _1964 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _1966 = _1920 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1968 = fma(_1908, _1938, _1956);
    float _1970 = fma(_1774, _1948, _1958);
    float _1972 = _1960 * _1962;
    float _1974 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].x;
    float _1976 = _1960 * _1964;
    float _1978 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _1980 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _1982 = fma(_1970, _1974, _1972);
    float _1984 = fma(_1780, _1948, _1968);
    float _1986 = fma(_1970, _1978, _1976);
    float _1988 = _1960 * _1980;
    float _1990 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _1992 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].x;
    float _1994 = _1952 * (*spvDescriptorSet0.vp_c10)._m0[18].z;
    float _1996 = sqrt(_1870);
    float _1998 = fma(_1984, _1990, _1986);
    float _2000 = fma(_1970, _1992, _1988);
    float _2002 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1820);
    float _2004 = _1966 * (*spvDescriptorSet0.vp_c10)._m0[20].z;
    float _2006 = fma(_1984, _1994, _1982);
    float _2008 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].x;
    float _2010 = fma(_1984, _2004, _2000);
    float _2012 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _2014 = sqrt(_2002);
    float _2016 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].x, _2008);
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[192].y * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _2020 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].z, _2012);
    float _2022 = _1998 * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _2024 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].x, _2016);
    float _2026 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2028 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].z, _2020);
    float _2030 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2032 = _1582 + _2024;
    float _2034 = fma(_2006, (*spvDescriptorSet0.vp_c10)._m0[18].y, _2022);
    float _2036 = _1588 + _2028;
    float _2038 = fma(_2026, _1996, _2032);
    float _2040 = fma(_2010, (*spvDescriptorSet0.vp_c10)._m0[20].y, _2034);
    float _2042 = fma(_2030, _2014, _2036);
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2046 = _2038 + _2044;
    float _2048 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2050 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2052 = _2042 + _2050;
    float _2054 = _2046 * _2046;
    float _2056 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2048);
    float _2058 = _2052 * _2052;
    float _2060 = _1570 + _2040;
    float _2062 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2056);
    float _2064 = _2054 + _2058;
    float _2066 = _2018 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2068 = sqrt(_2064);
    float _2070 = sqrt(_2062);
    bool _2072 = _2068 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2074 = fma(_2066, _2070, _2060);
    float _2076 = _2066;
    float _2078 = _2018;
    float _2080 = _2060;
    float _2082 = (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2084 = _2070;
    if (!_2072)
    {
        _2076 = _2058;
    }
    float _2086 = _2076;
    float _2088 = _2086;
    if (!_2072)
    {
        _2078 = _2054;
    }
    float _2090 = _2078;
    float _2092 = _2090;
    if (!_2072)
    {
        _2080 = _2038;
    }
    float _2094 = _2080;
    float _2096 = _2094;
    if (!_2072)
    {
        _2082 = _2042;
    }
    float _2098 = _2082;
    float _2100 = _2098;
    if (!_2072)
    {
        _2084 = _2074;
    }
    float _2102 = _2084;
    bool _2104 = !_2072;
    float _2106 = _2102;
    if (!_2104)
    {
        float _2108 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2112 = _2068 + _2110;
        float _2114 = rsqrt(_2064);
        float _2116 = _2112 * _2108;
        float _2118 = _2074 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2120 = _2116 * 0.15915493667125701904296875;
        float _2122 = _2120 * 6.283185482025146484375;
        float _2124 = sin(_2122);
        float _2126 = _2120 * 6.283185482025146484375;
        float _2128 = cos(_2126);
        float _2130 = fma(_2124, _2118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2132 = _2114 * _2130;
        float _2134 = _2128 + (-1.0);
        float _2136 = _2052 * _2132;
        float _2138 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2140 = _2046 * _2132;
        float _2142 = fma(_2074, _2128, _2138);
        float _2144 = _2140 + (*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2146 = _2136 + (*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2148 = _2140 * _2140;
        float _2150 = _2136 * _2136;
        _2106 = _2142;
        _2092 = _2148;
        _2088 = _2150;
        _2096 = _2144;
        _2100 = _2146;
    }
    float _2152 = _2106;
    float _2154 = _2092;
    float _2156 = _2088;
    float _2158 = _2096;
    float _2160 = _2100;
    float _2162 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2164 = _2152 + _2162;
    out.m_61.x = _1344;
    out.m_61.y = _1338;
    out.m_61.z = _1310;
    out.m_61.w = _1306;
    float _2166 = fma(_2164, _2164, _2154);
    out.m_63.x = _1316;
    out.m_63.y = _1288;
    out.m_63.z = _1324;
    out.m_63.w = _1322;
    float _2168 = _2166 + _2156;
    out.m_65.x = _1280;
    out.m_65.y = _1292;
    float _2170 = sqrt(_2168);
    out.m_67.x = 1.0;
    out.m_67.y = 1.0;
    out.m_67.z = 1.0;
    bool _2172 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2174 = isnan(_2170);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2180 = _2176 || _2178;
    float _2182 = _2164;
    float _2184 = 1.0;
    float _2186 = _2170;
    if (!_2180)
    {
        _2182 = 1.0;
    }
    float _2188 = _2182;
    bool _2190 = !_2180;
    float _2192 = _2188;
    if (!_2190)
    {
        bool _2194 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2196 = isnan(_2170);
        bool _2198 = _2194 || _2196;
        bool _2200 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2202 = _2198 || _2200;
        if (!_2202)
        {
            float _2204 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2206 = _2170 + _2204;
            float _2208 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2210 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2208;
            float _2212 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2214 = _2212 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2216 = 1.0 / _2210;
            float _2218 = _2206 * _2216;
            float _2220 = fma(_2218, _2214, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2192 = _2220;
            _2222 = true;
        }
        else
        {
            bool _2224 = _2170 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2226 = isnan(_2170);
            bool _2228 = _2224 || _2226;
            bool _2230 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2232 = _2228 || _2230;
            if (!_2232)
            {
                float _2234 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2236 = _2170 + _2234;
                float _2238 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2240 = _2238 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2242 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2244 = _2242 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2246 = 1.0 / _2240;
                float _2248 = _2236 * _2246;
                float _2250 = fma(_2248, _2244, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2192 = _2250;
                _2222 = true;
            }
            else
            {
                _2192 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2222 = false;
    float _2252 = _2192;
    float _2254 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2256 = _2152 + _2254;
    float _2258 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2260 = _2158 + _2258;
    float _2262 = fma(_2256, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2264 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2266 = _2160 + _2264;
    float _2268 = fma(_2260, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2262 + _2270;
    float _2274 = fma(_2266, _2252, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2276 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2278 = _2268 + _2276;
    float _2280 = _2272 * _2272;
    float _2282 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2284 = _2274 + _2282;
    float _2286 = fma(_2278, _2278, _2280);
    float _2288 = fma(_2284, _2284, _2286);
    float _2290 = rsqrt(_2288);
    float _2292 = _2290 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2294 = _2278 * _2292;
    float _2296 = _2284 * _2292;
    float _2298 = _2294 * _2294;
    float _2300 = _2296 * _2296;
    float _2302 = _2298 + _2300;
    float _2304 = sqrt(_2302);
    bool _2306 = _2304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2310 = _2304 + _2308;
    float _2312 = _2284;
    float _2314 = _2286;
    float _2316 = _2310;
    float _2318 = _2294;
    if (_2306)
    {
        float _2320 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2312 = _2320;
    }
    float _2322 = _2312;
    if (_2306)
    {
        float _2324 = rsqrt(_2302);
        _2314 = _2324;
    }
    float _2326 = _2314;
    float _2328 = _2326;
    if (_2306)
    {
        float _2330 = _2310 * _2322;
        _2316 = _2330;
    }
    float _2332 = _2316;
    if (_2306)
    {
        float _2334 = _2332 * 0.15915493667125701904296875;
        _2184 = _2334;
    }
    float _2336 = _2184;
    float _2338 = _2290;
    float _2340 = _2336;
    if (_2306)
    {
        float _2342 = _2336 * 6.283185482025146484375;
        float _2344 = sin(_2342);
        _2338 = _2344;
    }
    float _2346 = _2338;
    float _2348 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2350 = precise::max(0.0, _2348);
    float _2352 = 1.0;
    float _2354 = _2350;
    float _2356 = _2348;
    if (_2306)
    {
        float _2358 = _2336 * 6.283185482025146484375;
        float _2360 = cos(_2358);
        _2352 = _2360;
    }
    float _2362 = _2352;
    float _2364 = -_2292;
    float _2366 = -_2350;
    float _2368 = fma(_2272, _2364, _2366);
    if (!_2306)
    {
        _2354 = _2296;
    }
    float _2370 = _2354;
    float _2372 = _2370;
    if (_2306)
    {
        float _2374 = _2368 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2356 = _2374;
    }
    float _2376 = _2356;
    float _2378 = sqrt(_2288);
    float _2380 = _2346;
    float _2382 = _2376;
    if (_2306)
    {
        float _2384 = fma(_2346, _2376, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2380 = _2384;
    }
    float _2386 = _2380;
    float _2388 = _2386;
    if (_2306)
    {
        float _2390 = _2362 + (-1.0);
        _2382 = _2390;
    }
    float _2392 = _2382;
    float _2394 = _2392;
    if (_2306)
    {
        float _2396 = _2326 * _2386;
        _2186 = _2396;
    }
    float _2398 = _2186;
    if (!_2306)
    {
        _2328 = _2368;
    }
    float _2400 = _2328;
    float _2402 = _2400;
    if (_2306)
    {
        float _2404 = _2392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2340 = _2404;
    }
    float _2406 = _2340;
    if (_2306)
    {
        float _2408 = _2294 * _2398;
        _2318 = _2408;
    }
    float _2410 = _2318;
    if (!_2306)
    {
        _2388 = _2298;
    }
    float _2412 = _2388;
    float _2414 = _2412;
    if (_2306)
    {
        float _2416 = _2296 * _2398;
        _2372 = _2416;
    }
    float _2418 = _2372;
    if (_2306)
    {
        float _2420 = fma(_2368, _2362, _2406);
        _2402 = _2420;
    }
    float _2422 = _2402;
    if (_2306)
    {
        float _2424 = _2410 * _2410;
        _2414 = _2424;
    }
    float _2426 = _2414;
    if (!_2306)
    {
        _2394 = _2300;
    }
    float _2428 = _2394;
    float _2430 = _2428;
    if (_2306)
    {
        float _2432 = _2418 * _2418;
        _2430 = _2432;
    }
    float _2434 = _2430;
    float _2436 = fma(_2422, _2422, _2426);
    float _2438 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2440 = _2436 + _2434;
    float _2442 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2444 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2446 = fma(_2378, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2444);
    float _2448 = precise::clamp(_2446, 0.0, 1.0);
    float _2450 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2452 = rsqrt(_2440);
    float _2454 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2442);
    float _2456 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2458 = -_2448;
    float _2460 = _2458 + 1.0;
    float _2462 = _2262 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2464 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2454);
    float _2466 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2456);
    float _2468 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2438);
    float _2470 = abs(_2460);
    float _2472 = log2(_2470);
    float _2474 = _2464 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2476 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2462);
    float _2478 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2466);
    float _2480 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2482 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2476);
    float _2484 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2486 = _2452 * _2410;
    float _2488 = -_2480;
    float _2490 = fma(_2488, _2450, 1.0);
    float _2492 = fma(_2274, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2468);
    float _2494 = _2482 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2496 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2498 = _2452 * _2422;
    float _2500 = _2486 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2502 = _2452 * _2418;
    float _2504 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2496);
    float _2506 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2508 = -_2500;
    float _2510 = fma(_2498, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2508);
    float _2512 = _2492 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2514 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2504);
    float _2516 = log2(_2490);
    float _2518 = -_2502;
    float _2520 = fma(_2518, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2510);
    float _2522 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2524 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2514);
    float _2526 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2528 = fma(_2520, -0.5, 0.5);
    float _2530 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2522);
    float _2532 = fma(_2520, 0.5, 0.5);
    float _2534 = exp2(_2506);
    float _2536 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2526);
    float _2538 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2530);
    float _2540 = _2498 + 1.0;
    float _2542 = fma(_2532, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2544 = fma(_2474, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2536);
    float _2546 = 1.0 / _2524;
    float _2548 = fma(_2532, _2542, -0.212114393711090087890625);
    float _2550 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2544);
    float _2552 = _2516 * 0.693147182464599609375;
    float _2554 = fma(_2532, _2548, 1.570728778839111328125);
    float _2556 = _2552 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2558 = sqrt(_2528);
    float _2560 = -_2498;
    float _2562 = fma(_2534, _2540, _2560);
    float _2564 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2538);
    float _2566 = fma(_2562, 0.5, 0.5);
    float _2568 = _2564 * _2546;
    float _2570 = _2550 * _2546;
    float _2572 = fma(_2568, 0.5, 0.5);
    float _2574 = fma(_2570, -0.5, 0.5);
    float _2576 = _2558 * 0.636619746685028076171875;
    float3 _6440 = float3(_2572, _2574, _2556);
    float _2578 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6440, float3(0.0), isnan(_6440)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6440, float3(0.0), isnan(_6440)), level(0.0)).x;
    float3 _6451 = float3(_2572, _2574, _2556);
    float4 _2581 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6451, float3(0.0), isnan(_6451)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6451, float3(0.0), isnan(_6451)), level(0.0)).xyzw;
    float _2583 = _2581.x;
    float _2585 = _2581.y;
    float _2587 = _2581.z;
    float _2589 = _2581.w;
    float _2591 = -_2554;
    float _2593 = fma(_2576, _2591, 1.0);
    float2 _6472 = float2(_2593, _2566);
    float3 _2595 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6472, float2(0.0), isnan(_6472)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6472, float2(0.0), isnan(_6472)), level(0.0)).xyz;
    float _2597 = _2595.x;
    float _2599 = _2595.y;
    float _2601 = _2595.z;
    float _2603 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2605 = fma(_2603, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2504);
    float _2607 = _2484 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2609 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2605);
    float _2611 = fma(_2494, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2607);
    float _2613 = _2472 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2615 = 1.0 / _2609;
    float _2617 = fma(_2603, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2611);
    float _2619 = fma(_2512, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2617);
    float _2621 = exp2(_2613);
    float _2623 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2625 = _2619 * _2615;
    out.m_49.x = _2623;
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _2629 = fma(_2524, _2625, _2627);
    float _2631 = -_2621;
    float _2633 = _2631 + 1.0;
    float _2635 = _2524 + _2629;
    out.gl_Position.x = _2564;
    out.gl_Position.y = _2550;
    out.gl_Position.z = _2629;
    out.gl_Position.w = _2524;
    float _2637 = _2633 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2639 = _2635 * 0.5;
    float _2641 = -_2637;
    float _2643 = _2641 + 1.0;
    out.m_69.z = _2639;
    out.m_69.w = _2524;
    float _2645 = _2637 * _2578;
    float _2647 = _2589 * _2645;
    float _2649 = _2601 * _2645;
    float _2651 = fma(_2597, _2647, _2583);
    float _2653 = fma(_2599, _2647, _2585);
    float _2655 = _2589 * _2643;
    float _2657 = fma(_2589, _2649, _2587);
    out.m_71.x = _2651;
    out.m_71.y = _2653;
    out.m_71.z = _2657;
    out.m_71.w = _2655;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

