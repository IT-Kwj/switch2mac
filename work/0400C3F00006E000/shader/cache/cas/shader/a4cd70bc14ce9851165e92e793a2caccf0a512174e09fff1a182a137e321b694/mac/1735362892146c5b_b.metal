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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_10 [[id(6)]];
    sampler vp_t_tcb_10Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_10Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_72 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_68 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1480 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_46.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3264 = as_type<float>(_107);
        out.gl_Position.z = _3264;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_51.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3333 = as_type<float>(_145);
        out.gl_Position.z = _3333;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _149 = int(_147);
    float _151 = float(_91);
    float _153 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _155 = int(_153);
    float _157 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _159 = float(_149);
    float _161 = 1.0 / _151;
    float _163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _165 = float(uint(_155));
    float _167 = 1.0 / _159;
    int _169 = ~_155;
    int _171 = _169 + 1;
    bool _173 = _155 == 0;
    int _175 = ~_155;
    int _177 = _175 + 1;
    float _179 = 1.0 / _165;
    float _181 = _167 * _125;
    float _183 = trunc(_181);
    int _185 = int(_183);
    int _187 = as_type<int>(_179) + (-2);
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _191 = _189 != 0;
    float _193 = float(uint(_185));
    float _195 = as_type<float>(_187) * _193;
    int _197 = ~_155;
    int _199 = _197 + 1;
    float _201 = trunc(_195);
    float _203 = precise::max(_201, 0.0);
    uint _206 = uint(_203);
    float _208 = float(_155);
    int _210 = _199 * int(_206);
    int _212 = _210 + _185;
    float _214 = in.m_53.x;
    float _216 = in.m_53.y;
    float _218 = float(uint(_212));
    float _220 = as_type<float>(_187) * _218;
    float _222 = float(_185);
    float _224 = trunc(_220);
    float _226 = precise::max(_224, 0.0);
    uint _228 = uint(_226);
    int _230 = int(_206) + int(_228);
    bool _232 = _222 >= _208;
    bool _234 = isnan(_222);
    bool _236 = _232 || _234;
    bool _238 = isnan(_208);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    bool _244 = !_191;
    float _246 = _244 ? 7.345489978790283203125 : 1.0;
    int _248 = _171 * _230;
    int _250 = _248 + _185;
    float _252 = trunc(_242);
    int _254 = int(_252);
    float _256 = _246 * _214;
    bool _258 = uint(_250) >= uint(_155);
    bool _260 = !_258;
    int _262 = _260 ? 0 : (-1);
    float _264 = floor(_256);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _276 = _274 != 0;
    int _278 = ~_230;
    int _280 = _278 + _262;
    int _282 = _280 + 1;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _290 = _288 != 0;
    int _292 = _155 * _282;
    int _294 = _292 + _185;
    int _296 = ~_254;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _304 = _302 != 0;
    bool _306 = !_173;
    int _308 = _306 ? _294 : (-1);
    float _310 = -_264;
    float _312 = _256 + _310;
    bool _314 = !_272;
    int _316 = _314 ? 0 : 1;
    int _318 = _308 * _300;
    int _320 = _155 + (-1);
    float _322 = _312 * _208;
    float _324 = _208 * _125;
    bool _326 = !_286;
    int _328 = _326 ? 0 : 1;
    float _330 = trunc(_322);
    int _332 = int(_330);
    float _334 = _324 * _161;
    int _336 = _254 * _320;
    int _338 = _336 + _318;
    bool _340 = !_268;
    int _342 = _340 ? 0 : 1;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _346 = _344 != 0;
    int _348 = abs(_342);
    float _350 = trunc(_334);
    int _352 = int(_350);
    int _354 = abs(_316);
    bool _356 = !_276;
    int _358 = _356 ? 0 : 1;
    int _360 = abs(_328);
    int _362 = _338 * _354;
    bool _364 = !_346;
    int _366 = _364 ? 0 : 1;
    float _368 = as_type<float>(int(gl_VertexIndex));
    int _370 = abs(_358);
    int _372 = _332 * _360;
    int _374 = _372 + _185;
    int _376 = abs(_366);
    int _378 = _352 * _348;
    int _380 = _378 + _362;
    int _382 = ~_155;
    int _384 = _382 + 1;
    int _386 = _374 * _370;
    int _388 = _386 + _380;
    float _390 = float(uint(_374));
    bool _392 = _155 == 0;
    int _394 = _332 * _376;
    int _396 = _394 + _388;
    int _398 = ~_155;
    int _400 = _398 + 1;
    float _402 = as_type<float>(_187) * _390;
    int _404 = ~_155;
    int _406 = _404 + 1;
    float _408 = float(uint(_396));
    float _410 = trunc(_402);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    float _416 = as_type<float>(_187) * _408;
    float _418 = trunc(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    int _424 = _406 * int(_414);
    int _426 = _424 + _374;
    float _428 = float(uint(_426));
    int _430 = _400 * int(_422);
    int _432 = _430 + _396;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _436 = float(uint(_432));
    float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = as_type<float>(_187) * _436;
    float _442 = trunc(_440);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    int _448 = int(_422) + int(_446);
    int _450 = _384 * _448;
    int _452 = _450 + _396;
    bool _454 = uint(_452) >= uint(_155);
    bool _456 = !_454;
    int _458 = _456 ? 0 : (-1);
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _462 = _460 != 0;
    int _464 = ~_448;
    int _466 = _464 + _458;
    int _468 = _466 + 1;
    float _470 = in.m_46.x;
    float _472 = in.m_46.y;
    float _474 = in.m_46.z;
    bool _476 = !_462;
    int _478 = _476 ? 0 : 1;
    int _480 = _155 * _468;
    int _482 = _480 + _396;
    float _484 = as_type<float>(_187) * _428;
    float _486 = _216 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _488 = !_392;
    int _490 = _488 ? _482 : (-1);
    float _492 = _214 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _494 = trunc(_484);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    float _500 = fma(_486, -2.0, _163);
    int _502 = _490 & 3;
    bool _504 = _502 != 0;
    float _506 = -_157;
    float _508 = fma(_492, 2.0, _506);
    int _510 = _490 & 3;
    bool _512 = _510 != 0;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _516 = uint(_502) > 1u;
    float _518 = -_125;
    float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _508);
    int _522 = _512 ? 0 : 1;
    float _524 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _526 = as_type<int>(_368) & 1;
    bool _528 = _526 != 0;
    int _530 = as_type<int>(_368) & 2;
    bool _532 = _530 != 0;
    int _534 = ~_522;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = _472 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _542 = _472 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _544 = _472 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = _214 * 2.0;
    int _548 = int(_414) + int(_498);
    float _550 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
    int _552 = _538;
    if (!_516)
    {
        int _554 = ~_522;
        int _556 = _554 + 1;
        _552 = _556;
    }
    int _558 = _552;
    float _560 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
    bool _562 = uint(_502) >= 2u;
    float _564 = in.m_53.z;
    float _566 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _568 = _214 + _216;
    int _570 = _562 ? 0 : 1;
    float _572 = floor(_546);
    bool _574 = _502 != 3;
    int _576 = _177 * _548;
    int _578 = _576 + _374;
    int _580 = ~_570;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _568 + (-1.0);
    float _588 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
    float _590 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _594 = _490 >> 31;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _600 = _584;
    if (_574)
    {
        int _602 = ~_570;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _614 = uint(_578) >= uint(_155);
    float _616 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _618 = _594 & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _622 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _624 = !_528;
    float _626 = _624 ? (-0.5) : 0.5;
    float _628 = _564 * 2.0;
    int _630 = _490 + _618;
    float _632 = _620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _608;
    out.m_58.y = _612;
    out.m_58.z = _622;
    out.m_58.w = _610;
    bool _634 = _572 > 0.0;
    float _636 = floor(_628);
    int _638 = _630 >> 2;
    out.m_60.x = _438;
    out.m_60.y = _632;
    out.m_60.z = _524;
    bool _640 = !_532;
    float _642 = _640 ? (-0.5) : 0.5;
    bool _644 = _214 > 0.5;
    bool _646 = !_614;
    int _648 = _646 ? 0 : (-1);
    float _650 = _216 * 2.0;
    bool _652 = _572 >= 0.0;
    bool _654 = isnan(_572);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = _216 + _564;
    int _664 = _638 << 4;
    int _666 = _664 + 368;
    float _668 = floor(_650);
    float _670 = _662 + (-1.0);
    int _672 = ~_548;
    int _674 = _672 + _648;
    int _676 = _674 + 1;
    uint _678 = uint(int(uint(_666) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    float _694 = -_626;
    int _696 = _644 ? as_type<int>(_694) : as_type<int>(_626);
    float _698 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _700 = _216 > 0.5;
    int _702 = _155 * _676;
    int _704 = _702 + _374;
    int _706 = _660 ? 0 : 1;
    float _708 = -_642;
    int _710 = _700 ? as_type<int>(_708) : as_type<int>(_642);
    int _712 = _666 + 8;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[int(_724)][_726];
    bool _730 = !_290;
    float _732 = _730 ? _626 : as_type<float>(_696);
    bool _734 = !_304;
    float _736 = _734 ? _642 : as_type<float>(_710);
    bool _738 = _668 > 0.0;
    bool _740 = _668 >= 0.0;
    bool _742 = isnan(_668);
    bool _744 = _740 || _742;
    bool _746 = isnan(0.0);
    bool _748 = _744 || _746;
    bool _750 = _502 != 3;
    int _752 = ~_706;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    int _758 = _756;
    float _760 = _732;
    if (!_634)
    {
        int _762 = ~_706;
        int _764 = _762 + 1;
        _758 = _764;
    }
    int _766 = _758;
    float _768 = _732 + 0.5;
    bool _770 = !_392;
    int _772 = _770 ? _704 : (-1);
    bool _774 = !_504;
    int _776 = _774 ? 0 : 1;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _788 = _786 != 0;
    float _790 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    int _792 = abs(_558);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[80].x, _520);
    bool _796 = !_750;
    int _798 = _796 ? 0 : (-1);
    float _800 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _802 = _636 > 0.0;
    float _804 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _500);
    bool _806 = _636 >= 0.0;
    bool _808 = isnan(_636);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _736 + (-0.5);
    int _818 = abs(_776);
    float _820 = _790 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _822 = abs(_606);
    float _824 = -_816;
    float _826 = -_804;
    float _828 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[80].y, _826);
    int _830 = ~_792;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _838 = _800 + _836;
    int _840 = ~_818;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    float _846 = _590 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = _820 + _848;
    int _852 = abs(_798);
    int _854 = _834 * as_type<int>(_692);
    int _856 = ~_822;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _838 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _864 = abs(_478);
    int _866 = _844 * as_type<int>(_684);
    int _868 = _866 + _854;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _846 + _870;
    int _874 = _860 * as_type<int>(_720);
    int _876 = _874 + _868;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _880 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _882 = log2(_880);
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _886 = ~_852;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    float _892 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _862);
    float _894 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[78].z, _878);
    float _896 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[78].w, _884);
    int _898 = ~_864;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    float _904 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    int _906 = _890 * as_type<int>(_728);
    int _908 = _906 + _876;
    float _910 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _894);
    float _912 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _914 = _838 * _838;
    int _916 = _748 ? 0 : 1;
    int _918 = _908 * _902;
    bool _920 = _904 >= 0.0;
    float _922 = -_910;
    float _924 = _922 + 1.0;
    float _926 = -_912;
    float _928 = _926 + 1.0;
    float _930 = _882 * _125;
    int _932 = _814 ? 0 : 1;
    float _934 = fma(_850, _850, _914);
    int _936 = _772 * _864;
    int _938 = _936 + _918;
    int _940 = ~_916;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = -_924;
    float _948 = fma(_732, _946, _794);
    int _950 = _944;
    float _952 = _850;
    float _954 = _800;
    if (!_738)
    {
        int _956 = ~_916;
        int _958 = _956 + 1;
        _950 = _958;
    }
    int _960 = _950;
    float _962 = fma(_736, _928, _828);
    int _964 = ~_932;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = fma(_872, _872, _934);
    float _972 = exp2(_930);
    int _974 = _968;
    if (!_802)
    {
        int _976 = ~_932;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = in.m_62.x;
    float _984 = in.m_62.y;
    float _986 = in.m_62.z;
    if (_920)
    {
        _760 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _988 = _760;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = rsqrt(_970);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    int _1006 = as_type<int>(_988);
    if (_920)
    {
        float _1008 = _988 * 5.0;
        _1006 = as_type<int>(_1008);
    }
    int _1010 = _1006;
    float _1012 = float(_938);
    out.m_64.x = _948;
    out.m_64.y = _962;
    bool _1014 = !_784;
    int _1016 = _1014 ? 0 : 1;
    bool _1018 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(0.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / _1004;
    if (_920)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4621 = as_type<float>(_1010);
        out.gl_Position.z = _4621;
    }
    float _1030 = -_972;
    float _1032 = _1030 + 1.0;
    int _1034 = abs(_1016);
    out.m_66.x = _1012;
    float _1036 = _1026 ? _1032 : 0.0;
    float _1038 = _850 * _1000;
    if (_920)
    {
        out.m_49.x = 0.0;
    }
    bool _1040 = !_788;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _838 * _1000;
    bool _1046 = !_780;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = abs(_1042);
    int _1052 = abs(_1048);
    if (_920)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1054 = -_1044;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _800);
    float _1058 = _872 * _1000;
    float _1060 = -_1038;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _820);
    float _1064 = float(_1052);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1056 + _1066;
    float _1070 = float(_980);
    if (_998)
    {
        float _1072 = _1036 * _1028;
        _129 = _1072;
    }
    float _1074 = _129;
    float _1076 = float(_766);
    float _1078 = -_1058;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _1082 = float(_960);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1062 + _1084;
    float _1088 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = _1064 * _1070;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1094 = _1080 + _1092;
    float _1096 = float(_1034);
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1100 = _1090 * (-2.0);
    float _1102 = _214 + (-0.5);
    float _1104 = _216 + (-0.5);
    float _1106 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1098);
    float _1108 = _1096 * _1076;
    float _1110 = fma(_1100, _982, _982);
    float _1112 = fma(_616, _1100, _616);
    float _1114 = -_1044;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    bool _1118 = _1106 >= 0.0;
    float _1120 = _1108 * (-2.0);
    float _1122 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1110);
    float _1124 = _1116 * _1116;
    float _1126 = float(_1050);
    float _1128 = fma(_1120, _984, _984);
    float _1130 = fma(_1112, _1074, _1122);
    float _1132 = fma(_698, _1120, _698);
    float _1134 = _214 + _564;
    float _1136 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    float _1138 = _1130 * 0.15915493667125701904296875;
    float _1140 = -_1038;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    if (_1118)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1144 = _952;
    float _1146 = fma(_1132, _1074, _1136);
    float _1148 = _1138 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    int _1152 = as_type<int>(_1144);
    if (_1118)
    {
        out.m_49.x = 0.0;
    }
    float _1154 = _1126 * _1082;
    if (_1118)
    {
        float _1156 = _1144 * 5.0;
        _1152 = as_type<int>(_1156);
    }
    int _1158 = _1152;
    float _1160 = fma(_1142, _1142, _1124);
    float _1162 = _1134 + (-1.0);
    float _1164 = _1146 * 0.15915493667125701904296875;
    float _1166 = _1138 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    if (_1118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4856 = as_type<float>(_1158);
        out.gl_Position.z = _4856;
    }
    if (_1118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1170 = in.m_68.x;
    float _1172 = in.m_68.y;
    float _1174 = -_1058;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1178 = _1154 * (-2.0);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = _564 + (-0.5);
    float _1184 = fma(_1176, _1176, _1160);
    float _1186 = fma(_1178, _986, _986);
    float _1188 = fma(_1180, _1178, _1180);
    float _1190 = _1164 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _642);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1186);
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _1200 = fma(_1188, _1074, _1196);
    float _1202 = sqrt(_1184);
    float _1204 = _1200 * 0.15915493667125701904296875;
    float _1206 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1208 = _1164 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1216 = _1000 * _1202;
    float _1218 = _1204 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1216 * _1214;
    float _1224 = _1194 * _1222;
    float _1226 = _1204 * 6.283185482025146484375;
    float _1228 = cos(_1226);
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1232 = _1150 * _1192;
    float _1234 = _1168 * _1210;
    float _1236 = _1216 * _1230;
    float _1238 = fma(_1220, _1234, _1232);
    float _1240 = _1198 * _1236;
    float _1242 = _1168 * _1192;
    float _1244 = _1228 * _1224;
    float _1246 = _1192 * _1228;
    float _1248 = _1210 * _1228;
    float _1250 = _1150 * _1210;
    float _1252 = _1168 * _1244;
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1256 = _1254 * 0.5;
    float _1258 = -_1224;
    float _1260 = _1220 * _1258;
    float _1262 = _1150 * _1244;
    float _1264 = fma(_1238, _1240, _1252);
    float _1266 = -_1250;
    float _1268 = fma(_1220, _1242, _1266);
    float _1270 = -_1242;
    float _1272 = fma(_1220, _1250, _1270);
    float _1274 = fma(_1248, _1240, _1260);
    float _1276 = fma(_1220, _1232, _1234);
    float _1278 = fma(_1268, _1256, _1264);
    float _1280 = fma(_1272, _1240, _1262);
    float _1282 = fma(_1246, _1256, _1274);
    float _1284 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1288 = fma(_1276, _1256, _1280);
    float _1290 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1284);
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1286);
    float _1294 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1290);
    float _1296 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1292);
    float _1298 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1300 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1302 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1304 = _820 + _1298;
    float _1306 = _846 + _1300;
    float _1308 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1302);
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1312 = _1304 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1316 = _1306 + _1314;
    float _1318 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1308);
    float _1320 = _1312 * _1312;
    float _1322 = _1316 * _1316;
    float _1324 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1326 = _1320 + _1322;
    float _1328 = _800 + _1324;
    float _1330 = sqrt(_1326);
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1324;
    float _1336 = _1320;
    float _1338 = _1318;
    float _1340 = _1288;
    float _1342 = _1322;
    float _1344 = _1304;
    float _1346 = _1328;
    if (!_1332)
    {
        _1334 = _1320;
    }
    float _1348 = _1334;
    float _1350 = _1348;
    if (!_1332)
    {
        _1336 = _1304;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (!_1332)
    {
        _1338 = _1306;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (!_1332)
    {
        _1340 = _1328;
    }
    float _1360 = _1340;
    bool _1362 = !_1332;
    float _1364 = _1360;
    if (!_1362)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1370 = _1330 + _1368;
        float _1372 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = rsqrt(_1326);
        float _1376 = _1370 * _1366;
        float _1378 = _1376 * 0.15915493667125701904296875;
        float _1380 = _1378 * 6.283185482025146484375;
        float _1382 = sin(_1380);
        float _1384 = _1378 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = fma(_1382, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1390 = _1374 * _1388;
        float _1392 = _1386 + (-1.0);
        float _1394 = fma(_1312, _1390, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1396 = fma(_1316, _1390, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1398 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1402 = _1394 + _1400;
        float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1406 = _1396 + _1404;
        float _1408 = fma(_1328, _1386, _1398);
        float _1410 = _1402 * _1402;
        float _1412 = _1406 * _1406;
        _1364 = _1408;
        _1350 = _1410;
        _1342 = _1412;
        _1354 = _1394;
        _1358 = _1396;
    }
    float _1414 = _1364;
    float _1416 = _1350;
    float _1418 = _1342;
    float _1420 = _1354;
    float _1422 = _1358;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1414 + _1424;
    float _1428 = fma(_1426, _1426, _1416);
    float _1430 = _1428 + _1418;
    float _1432 = sqrt(_1430);
    bool _1434 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1436 = isnan(_1432);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1442 = _1438 || _1440;
    float _1444 = _1416;
    if (!_1442)
    {
        _1444 = 1.0;
    }
    float _1446 = _1444;
    bool _1448 = !_1442;
    float _1450 = _1446;
    if (!_1448)
    {
        bool _1452 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1454 = isnan(_1432);
        bool _1456 = _1452 || _1454;
        bool _1458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1460 = _1456 || _1458;
        if (!_1460)
        {
            float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1464 = _1432 + _1462;
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1474 = 1.0 / _1468;
            float _1476 = _1464 * _1474;
            float _1478 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1450 = _1478;
            _1344 = _1474;
            _1480 = true;
        }
        else
        {
            bool _1482 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1484 = isnan(_1432);
            bool _1486 = _1482 || _1484;
            bool _1488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1490 = _1486 || _1488;
            if (!_1490)
            {
                float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1494 = _1432 + _1492;
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1496 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1504 = 1.0 / _1498;
                float _1506 = _1494 * _1504;
                float _1508 = fma(_1506, _1502, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1450 = _1508;
                _1344 = _1504;
                _1480 = true;
            }
            else
            {
                _1450 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1480 = false;
    float _1510 = _1450;
    float _1512 = _1344;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1420 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1520 = _1414 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1524 = _1422 + _1522;
    bool _1526 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.5);
    bool _1534 = _1530 || _1532;
    float _1536 = fma(_1516, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1538 = fma(_1520, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = fma(_1524, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1542 = -_1038;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1546 = -_1044;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = -_1058;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1554 = _1548;
    float _1556 = _1544;
    float _1558 = _1552;
    float _1560 = _1512;
    if (!_1534)
    {
        float _1562 = _1068 * _1068;
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1566 = -_800;
        float _1568 = _1566 + _1538;
        float _1570 = -_846;
        float _1572 = _1570 + _1540;
        float _1574 = fma(_1086, _1086, _1562);
        float _1576 = fma(_1094, _1094, _1574);
        float _1578 = 1.0 / _1216;
        float _1580 = sqrt(_1576);
        float _1582 = precise::min(_1580, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1584 = _1582 * _1564;
        float _1586 = -_820;
        float _1588 = _1586 + _1536;
        float _1590 = _1584 * _1578;
        float _1592 = fma(_1588, _1590, _1062);
        float _1594 = fma(_1568, _1590, _1056);
        float _1596 = fma(_1572, _1590, _1080);
        _1554 = _1594;
        _1556 = _1592;
        _1558 = _1596;
        _954 = _1568;
    }
    float _1598 = _1554;
    float _1600 = _1556;
    float _1602 = _1558;
    float _1604 = _954;
    float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1608 = _1598 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1600 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1616 = _1602 + _1614;
    float _1618 = _1608 * _1608;
    float _1620 = fma(_1612, _1612, _1618);
    float _1622 = fma(_1616, _1616, _1620);
    float _1624 = rsqrt(_1622);
    float _1626 = sqrt(_1622);
    float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1630 = _1612 * _1628;
    float _1632 = _1616 * _1628;
    float _1634 = _1630 * _1630;
    float _1636 = _1632 * _1632;
    float _1638 = _1634 + _1636;
    float _1640 = sqrt(_1638);
    bool _1642 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = _1640 + _1644;
    float _1648 = _1624;
    float _1650 = _1638;
    float _1652 = _1646;
    float _1654 = _1608;
    float _1656 = _1604;
    if (_1642)
    {
        float _1658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1648 = _1658;
    }
    float _1660 = _1648;
    if (_1642)
    {
        float _1662 = rsqrt(_1638);
        _1650 = _1662;
    }
    float _1664 = _1650;
    if (_1642)
    {
        float _1666 = _1646 * _1660;
        _1652 = _1666;
    }
    float _1668 = _1652;
    if (_1642)
    {
        float _1670 = _1668 * 0.15915493667125701904296875;
        _1346 = _1670;
    }
    float _1672 = _1346;
    float _1674 = _1616;
    if (_1642)
    {
        float _1676 = _1672 * 6.283185482025146484375;
        float _1678 = sin(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1684 = precise::max(0.0, _1682);
    float _1686 = _1660;
    float _1688 = _1684;
    if (_1642)
    {
        float _1690 = _1672 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        _1686 = _1692;
    }
    float _1694 = _1686;
    float _1696 = -_1628;
    float _1698 = -_1684;
    float _1700 = fma(_1608, _1696, _1698);
    if (_1642)
    {
        float _1702 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1702;
    }
    float _1704 = _1654;
    float _1706 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1708 = _1680;
    float _1710 = _1704;
    if (_1642)
    {
        float _1712 = fma(_1680, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1560 = _1712;
    }
    float _1714 = _1560;
    float _1716 = _1714;
    if (!_1642)
    {
        _1708 = _1630;
    }
    float _1718 = _1708;
    float _1720 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1706);
    float _1722 = _1718;
    if (!_1642)
    {
        _1710 = _1700;
    }
    float _1724 = _1710;
    float _1726 = _1724;
    float _1728 = _1694;
    if (_1642)
    {
        float _1730 = _1694 + (-1.0);
        _1688 = _1730;
    }
    float _1732 = _1688;
    float _1734 = _1732;
    if (_1642)
    {
        float _1736 = _1664 * _1714;
        _1716 = _1736;
    }
    float _1738 = _1716;
    float _1740 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1742 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    if (_1642)
    {
        float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1744;
    }
    float _1746 = _1656;
    float _1748 = _1746;
    if (_1642)
    {
        float _1750 = _1630 * _1738;
        _1722 = _1750;
    }
    float _1752 = _1722;
    if (!_1642)
    {
        _1734 = _1632;
    }
    float _1754 = _1734;
    float _1756 = _1754;
    if (_1642)
    {
        float _1758 = _1632 * _1738;
        _1756 = _1758;
    }
    float _1760 = _1756;
    if (_1642)
    {
        float _1762 = fma(_1700, _1694, _1746);
        _1726 = _1762;
    }
    float _1764 = _1726;
    if (!_1642)
    {
        _1748 = _1634;
    }
    float _1766 = _1748;
    float _1768 = _1766;
    if (_1642)
    {
        float _1770 = _1752 * _1752;
        _1768 = _1770;
    }
    float _1772 = _1768;
    if (!_1642)
    {
        _1728 = _1636;
    }
    float _1774 = _1728;
    float _1776 = _1774;
    if (_1642)
    {
        float _1778 = _1760 * _1760;
        _1776 = _1778;
    }
    float _1780 = _1776;
    float _1782 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1740);
    float _1784 = fma(_1764, _1764, _1772);
    float _1786 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1788 = _1784 + _1780;
    float _1790 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1782);
    float _1792 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1626, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = rsqrt(_1788);
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1804 = _1792 * 0.5;
    float _1806 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1808 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1786);
    float _1810 = fma(_1802, -0.5, _1804);
    float _1812 = -_1798;
    float _1814 = _1812 + 1.0;
    float _1816 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1818 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1806);
    float _1822 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1808);
    float _1824 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1816);
    float _1826 = abs(_1814);
    float _1828 = log2(_1826);
    float _1830 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1832 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1820);
    float _1834 = _1800 * _1752;
    float _1836 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1824);
    float _1838 = _1800 * _1764;
    float _1840 = _1800 * _1760;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1844 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1846 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1848 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = -_1842;
    float _1852 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1850);
    float _1854 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1856 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1858 = -_1840;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1852);
    float _1862 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1854);
    float _1866 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1868 = fma(_1860, -0.5, 0.5);
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1864);
    float _1872 = exp2(_1862);
    float _1874 = fma(_1860, 0.5, 0.5);
    float _1876 = _1838 + 1.0;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1870);
    float _1880 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1882 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1884 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1810);
    float _1888 = sqrt(_1868);
    float _1890 = fma(_1874, _1882, -0.212114393711090087890625);
    float _1892 = -_1884;
    float _1894 = fma(_1892, _1880, 1.0);
    float _1896 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1900 = fma(_1874, _1890, 1.570728778839111328125);
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1904 = _1810 + _1902;
    float _1906 = _1810 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1908 = -_1838;
    float _1910 = fma(_1872, _1876, _1908);
    float _1912 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1914 = 1.0 / _1878;
    float _1916 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1918 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1898);
    float _1920 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1912);
    float _1922 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1810);
    float _1924 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1916);
    float _1926 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1918);
    float _1928 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1920);
    float _1930 = 1.0 / _1792;
    float _1932 = _1888 * 0.636619746685028076171875;
    float _1934 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1924);
    float _1936 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1938 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1926);
    float _1940 = -_1900;
    float _1942 = fma(_1932, _1940, 1.0);
    float _1944 = fma(_1910, 0.5, 0.5);
    float _1946 = _1936 + _1792;
    float _1948 = _1934 * _1914;
    float _1950 = _1938 * _1914;
    float _1952 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1810);
    float _1954 = _1946 * 0.5;
    float _1956 = fma(_1948, 0.5, 0.5);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1810);
    float _1962 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1810);
    float _1964 = _1810 * _1930;
    float _1966 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1810);
    float _1968 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1810);
    float _1970 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1810);
    float _1972 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1810);
    float _1974 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1810);
    float _1976 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1810);
    float _1978 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1810);
    float _1980 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1810);
    float _1982 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1810);
    float _1984 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1810);
    float _1986 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1810);
    float _1988 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1810);
    float _1990 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1810);
    float _1992 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1810);
    float _1994 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1810);
    float _1996 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1810);
    float _1998 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1810);
    float _2000 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1954);
    float _2002 = _1960 * _1930;
    float _2004 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1954);
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2008 = _1954 + _2006;
    float _2010 = _2000 * _1930;
    float _2012 = _1886 * _1930;
    float _2014 = _2004 * _1930;
    float _2016 = _2008 * _1930;
    float _2018 = _1904 * _1930;
    float _2020 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1954);
    float2 _6299 = float2(_2010, _2002);
    float _2022 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6299, float2(0.0), isnan(_6299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6299, float2(0.0), isnan(_6299)), level(0.0)).x;
    float2 _6309 = float2(_2014, _2012);
    float _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6309, float2(0.0), isnan(_6309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6309, float2(0.0), isnan(_6309)), level(0.0)).x;
    float _2026 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1954);
    float2 _6321 = float2(_2016, _1964);
    float _2028 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6321, float2(0.0), isnan(_6321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6321, float2(0.0), isnan(_6321)), level(0.0)).x;
    float _2030 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1954);
    float _2032 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1954);
    float _2034 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1954);
    float _2036 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1954);
    float _2038 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1954);
    float _2040 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1954);
    float _2042 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1954);
    float _2044 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1954);
    float _2046 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1954);
    float _2048 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1954);
    float _2050 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1954);
    float _2052 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1954);
    float _2054 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1954);
    float _2056 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1954);
    float _2058 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1954);
    float _2060 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1954);
    float _2062 = _1954 * _1930;
    float _2064 = _1906 * _1930;
    float _2066 = _1922 * _1930;
    float _2068 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float2 _6406 = float2(_2062, _2018);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6406, float2(0.0), isnan(_6406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6406, float2(0.0), isnan(_6406)), level(0.0)).x;
    float _2072 = _2020 * _1930;
    float _2074 = _1952 * _1930;
    float2 _6420 = float2(_2062, _2064);
    float _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6420, float2(0.0), isnan(_6420)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6420, float2(0.0), isnan(_6420)), level(0.0)).x;
    float2 _6428 = float2(_2014, _2066);
    float _2078 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0)).x;
    float _2080 = _2068 * _1930;
    float _2082 = _2026 * _1930;
    float _2084 = _1962 * _1930;
    float _2086 = _2030 * _1930;
    float _2088 = _1966 * _1930;
    float _2090 = log2(_1894);
    float2 _6453 = float2(_2080, _1964);
    float _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6453, float2(0.0), isnan(_6453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6453, float2(0.0), isnan(_6453)), level(0.0)).x;
    float2 _6461 = float2(_2072, _2074);
    float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6461, float2(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6461, float2(0.0), isnan(_6461)), level(0.0)).x;
    float2 _6469 = float2(_2082, _2084);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6469, float2(0.0), isnan(_6469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6469, float2(0.0), isnan(_6469)), level(0.0)).x;
    float2 _6477 = float2(_2086, _1964);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6477, float2(0.0), isnan(_6477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6477, float2(0.0), isnan(_6477)), level(0.0)).x;
    float _2100 = _2032 * _1930;
    float _2102 = _1994 * _1930;
    float _2104 = _1968 * _1930;
    float _2106 = _2034 * _1930;
    float2 _6497 = float2(_2100, _2088);
    float _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6497, float2(0.0), isnan(_6497)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6497, float2(0.0), isnan(_6497)), level(0.0)).x;
    float2 _6505 = float2(_2062, _2002);
    float _2110 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6505, float2(0.0), isnan(_6505)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6505, float2(0.0), isnan(_6505)), level(0.0)).x;
    float _2112 = _1970 * _1930;
    float _2114 = _1998 * _1930;
    float _2116 = _2036 * _1930;
    float _2118 = _1972 * _1930;
    float _2120 = _1974 * _1930;
    float _2122 = _2090 * 0.693147182464599609375;
    float _2124 = _1996 * _1930;
    float _2126 = _2038 * _1930;
    float2 _6537 = float2(_2062, _2074);
    float _2128 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6537, float2(0.0), isnan(_6537)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6537, float2(0.0), isnan(_6537)), level(0.0)).x;
    float2 _6545 = float2(_2100, _2104);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).x;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = _2040 * _1930;
    float2 _6560 = float2(_2014, _1964);
    float _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6560, float2(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6560, float2(0.0), isnan(_6560)), level(0.0)).x;
    float2 _6568 = float2(_2106, _2112);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6568, float2(0.0), isnan(_6568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6568, float2(0.0), isnan(_6568)), level(0.0)).x;
    float _2140 = _1978 * _1930;
    float _2142 = _1976 * _1930;
    float _2144 = _1980 * _1930;
    float _2146 = _1992 * _1930;
    float _2148 = _2042 * _1930;
    float2 _6591 = float2(_2116, _2118);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).x;
    float2 _6599 = float2(_2126, _1964);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6599, float2(0.0), isnan(_6599)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6599, float2(0.0), isnan(_6599)), level(0.0)).x;
    float2 _6607 = float2(_2134, _2120);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6607, float2(0.0), isnan(_6607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6607, float2(0.0), isnan(_6607)), level(0.0)).x;
    float2 _6615 = float2(_2062, _2142);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6615, float2(0.0), isnan(_6615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6615, float2(0.0), isnan(_6615)), level(0.0)).x;
    float2 _6623 = float2(_2062, _2140);
    float _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6623, float2(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6623, float2(0.0), isnan(_6623)), level(0.0)).x;
    float2 _6631 = float2(_2134, _2144);
    float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6631, float2(0.0), isnan(_6631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6631, float2(0.0), isnan(_6631)), level(0.0)).x;
    float2 _6639 = float2(_2148, _1964);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6639, float2(0.0), isnan(_6639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6639, float2(0.0), isnan(_6639)), level(0.0)).x;
    float _2164 = _2044 * _1930;
    float _2166 = _2046 * _1930;
    float _2168 = _1982 * _1930;
    float _2170 = _2048 * _1930;
    float _2172 = _1984 * _1930;
    float _2174 = _2050 * _1930;
    float _2176 = _1986 * _1930;
    float _2178 = _2052 * _1930;
    float _2180 = _1988 * _1930;
    float _2182 = _2054 * _1930;
    float _2184 = _1990 * _1930;
    float _2186 = _2056 * _1930;
    float2 _6683 = float2(_2164, _2168);
    float _2188 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6683, float2(0.0), isnan(_6683)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6683, float2(0.0), isnan(_6683)), level(0.0)).x;
    float2 _6691 = float2(_2166, _2172);
    float _2190 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6691, float2(0.0), isnan(_6691)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6691, float2(0.0), isnan(_6691)), level(0.0)).x;
    float2 _6699 = float2(_2170, _2176);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6699, float2(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6699, float2(0.0), isnan(_6699)), level(0.0)).x;
    float2 _6707 = float2(_2174, _2180);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6707, float2(0.0), isnan(_6707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6707, float2(0.0), isnan(_6707)), level(0.0)).x;
    float2 _6715 = float2(_2178, _2184);
    float _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).x;
    float2 _6723 = float2(_2182, _2146);
    float _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6723, float2(0.0), isnan(_6723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6723, float2(0.0), isnan(_6723)), level(0.0)).x;
    float2 _6731 = float2(_2186, _2102);
    float _2200 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6731, float2(0.0), isnan(_6731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6731, float2(0.0), isnan(_6731)), level(0.0)).x;
    float _2202 = _2058 * _1930;
    float _2204 = _2060 * _1930;
    float2 _6745 = float2(_2202, _2124);
    float _2206 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6745, float2(0.0), isnan(_6745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6745, float2(0.0), isnan(_6745)), level(0.0)).x;
    float2 _6753 = float2(_2204, _2114);
    float _2208 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6753, float2(0.0), isnan(_6753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6753, float2(0.0), isnan(_6753)), level(0.0)).x;
    float2 _6761 = float2(_2062, _1964);
    float _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6761, float2(0.0), isnan(_6761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6761, float2(0.0), isnan(_6761)), level(0.0)).x;
    float3 _6770 = float3(_1956, _1958, _2132);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6770, float3(0.0), isnan(_6770)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6770, float3(0.0), isnan(_6770)), level(0.0)).x;
    float3 _6781 = float3(_1956, _1958, _2132);
    float4 _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6781, float3(0.0), isnan(_6781)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6781, float3(0.0), isnan(_6781)), level(0.0)).xyzw;
    float _2217 = _2215.x;
    float _2219 = _2215.y;
    float _2221 = _2215.z;
    float _2223 = _2215.w;
    float2 _6797 = float2(_1942, _1944);
    float3 _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6797, float2(0.0), isnan(_6797)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6797, float2(0.0), isnan(_6797)), level(0.0)).xyz;
    float _2229 = _2227.x;
    float _2231 = _2227.y;
    float _2233 = _2227.z;
    float _2235 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2237 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2239 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2235);
    float _2241 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2237);
    float _2243 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2239);
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2247 = _2245 + _1792;
    float _2249 = _2247 * _1930;
    float _2251 = _2249 * 0.5;
    float _2253 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2255 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2253);
    float _2257 = 1.0 / _2255;
    float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2261 = _2257 * _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2265 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2263);
    float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2269 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2267);
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2265;
    float _2277 = 1.0 / _2273;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2281 = -_2261;
    float _2283 = fma(_2275, _2279, _2281);
    float _2285 = 1.0 / _2269;
    float _2287 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2289 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2287);
    bool _2291 = _2283 >= 0.0;
    bool _2293 = isnan(_2283);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan(0.0);
    bool _2299 = _2295 || _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2303 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2301);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2307 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2305);
    float _2309 = 1.0 / _2289;
    float _2311 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2313 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2311);
    float _2315 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2317 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2315);
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2321 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2319);
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2325 = -_2261;
    float _2327 = fma(_2285, _2323, _2325);
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    float _2333 = 1.0 / _2313;
    bool _2335 = _2327 >= 0.0;
    bool _2337 = isnan(_2327);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.0);
    bool _2343 = _2339 || _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2347 = -_2261;
    float _2349 = fma(_2277, _2345, _2347);
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2353 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2351);
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2357 = -_2261;
    float _2359 = fma(_2309, _2355, _2357);
    bool _2361 = !_2343;
    float _2363 = _2361 ? 0.0 : 2.0;
    float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2367 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2365);
    bool _2369 = _2349 >= 0.0;
    bool _2371 = isnan(_2349);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    float _2381 = 1.0 / _2331;
    bool _2383 = !_2299;
    float _2385 = _2383 ? 0.0 : 2.0;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2389 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2387);
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2393 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2391);
    float _2395 = _2385 + _2379;
    bool _2397 = _2359 >= 0.0;
    bool _2399 = isnan(_2359);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = float(_2405);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2411 = -_2261;
    float _2413 = fma(_2333, _2409, _2411);
    float _2415 = 1.0 / _2367;
    float _2417 = _2395 + _2363;
    float _2419 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2421 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2419);
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2425 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2423);
    bool _2427 = _2413 >= 0.0;
    bool _2429 = isnan(_2413);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(0.0);
    bool _2435 = _2431 || _2433;
    float _2437 = float(_2435);
    float _2439 = _2417 + _2407;
    float _2441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2443 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2441);
    float _2445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2447 = -_2261;
    float _2449 = fma(_2381, _2445, _2447);
    float _2451 = 1.0 / _2303;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2459 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2457);
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2463 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2461);
    float _2465 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2467 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2465);
    float _2469 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2471 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2469);
    float _2473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2475 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2473);
    float _2477 = 1.0 / _2455;
    float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2481 = -_2261;
    float _2483 = fma(_2451, _2479, _2481);
    float _2485 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2487 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2485);
    float _2489 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2491 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2489);
    float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2495 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2493);
    float _2497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2499 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2497);
    bool _2501 = _2483 >= 0.0;
    bool _2503 = isnan(_2483);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    float _2511 = float(_2509);
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2515 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2513);
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2519 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2517);
    float _2521 = 1.0 / _2475;
    float _2523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2525 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2523);
    float _2527 = _2439 + _2511;
    float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2531 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2529);
    float _2533 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2535 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2533);
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2539 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2537);
    float _2541 = 1.0 / _2307;
    float _2543 = 1.0 / _2539;
    float _2545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2547 = -_2261;
    float _2549 = fma(_2541, _2545, _2547);
    bool _2551 = _2549 >= 0.0;
    bool _2553 = isnan(_2549);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    bool _2561 = !_2559;
    float _2563 = _2561 ? 0.0 : 2.0;
    float _2565 = _2527 + _2563;
    float _2567 = 1.0 / _2317;
    float _2569 = _2565 + _2437;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = -_2261;
    float _2575 = fma(_2567, _2571, _2573);
    bool _2577 = _2575 >= 0.0;
    bool _2579 = isnan(_2575);
    bool _2581 = _2577 || _2579;
    bool _2583 = isnan(0.0);
    bool _2585 = _2581 || _2583;
    float _2587 = 1.0 / _2321;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2591 = -_2261;
    float _2593 = fma(_2587, _2589, _2591);
    bool _2595 = _2593 >= 0.0;
    bool _2597 = isnan(_2593);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    bool _2605 = !_2585;
    float _2607 = _2605 ? 0.0 : 2.0;
    bool _2609 = !_2603;
    float _2611 = _2609 ? 0.0 : 2.0;
    float _2613 = _2569 + _2607;
    bool _2615 = _2449 >= 0.0;
    bool _2617 = isnan(_2449);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan(0.0);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2629 = -_2261;
    float _2631 = fma(_2415, _2627, _2629);
    float _2633 = _2613 + _2611;
    float _2635 = 1.0 / _2389;
    float _2637 = _2633 + _2625;
    float _2639 = 1.0 / _2353;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = -_2261;
    float _2645 = fma(_2635, _2641, _2643);
    bool _2647 = _2631 >= 0.0;
    bool _2649 = isnan(_2631);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = float(_2655);
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2661 = -_2261;
    float _2663 = fma(_2639, _2659, _2661);
    bool _2665 = _2663 >= 0.0;
    bool _2667 = isnan(_2663);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan(0.0);
    bool _2673 = _2669 || _2671;
    bool _2675 = !_2673;
    float _2677 = _2675 ? 0.0 : 2.0;
    float _2679 = _2637 + _2677;
    bool _2681 = _2645 >= 0.0;
    bool _2683 = isnan(_2645);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.0);
    bool _2689 = _2685 || _2687;
    float _2691 = float(_2689);
    float _2693 = _2679 + _2657;
    float _2695 = 1.0 / _2425;
    float _2697 = _2693 + _2691;
    float _2699 = 1.0 / _2393;
    float _2701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2703 = -_2261;
    float _2705 = fma(_2695, _2701, _2703);
    bool _2707 = _2705 >= 0.0;
    bool _2709 = isnan(_2705);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan(0.0);
    bool _2715 = _2711 || _2713;
    float _2717 = float(_2715);
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2721 = -_2261;
    float _2723 = fma(_2477, _2719, _2721);
    float _2725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2727 = -_2261;
    float _2729 = fma(_2699, _2725, _2727);
    bool _2731 = _2729 >= 0.0;
    bool _2733 = isnan(_2729);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan(0.0);
    bool _2739 = _2735 || _2737;
    bool _2741 = !_2739;
    float _2743 = _2741 ? 0.0 : 2.0;
    float _2745 = _2697 + _2743;
    float _2747 = 1.0 / _2421;
    float _2749 = _2745 + _2717;
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2753 = -_2261;
    float _2755 = fma(_2747, _2751, _2753);
    bool _2757 = _2755 >= 0.0;
    bool _2759 = isnan(_2755);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan(0.0);
    bool _2765 = _2761 || _2763;
    float _2767 = 1.0 / _2443;
    float _2769 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2771 = -_2261;
    float _2773 = fma(_2767, _2769, _2771);
    bool _2775 = _2773 >= 0.0;
    bool _2777 = isnan(_2773);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    bool _2785 = !_2765;
    float _2787 = _2785 ? 0.0 : 2.0;
    bool _2789 = !_2783;
    float _2791 = _2789 ? 0.0 : 2.0;
    float _2793 = _2749 + _2787;
    bool _2795 = _2723 >= 0.0;
    bool _2797 = isnan(_2723);
    bool _2799 = _2795 || _2797;
    bool _2801 = isnan(0.0);
    bool _2803 = _2799 || _2801;
    float _2805 = float(_2803);
    float _2807 = _2793 + _2791;
    float _2809 = _2807 + _2805;
    float _2811 = 1.0 / _2459;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2815 = -_2261;
    float _2817 = fma(_2811, _2813, _2815);
    bool _2819 = _2817 >= 0.0;
    bool _2821 = isnan(_2817);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan(0.0);
    bool _2827 = _2823 || _2825;
    float _2829 = 1.0 / _2463;
    float _2831 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2833 = -_2261;
    float _2835 = fma(_2829, _2831, _2833);
    bool _2837 = !_2827;
    float _2839 = _2837 ? 0.0 : 2.0;
    bool _2841 = _2835 >= 0.0;
    bool _2843 = isnan(_2835);
    bool _2845 = _2841 || _2843;
    bool _2847 = isnan(0.0);
    bool _2849 = _2845 || _2847;
    float _2851 = float(_2849);
    float _2853 = _2809 + _2839;
    float _2855 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2857 = -_2261;
    float _2859 = fma(_2521, _2855, _2857);
    float _2861 = 1.0 / _2467;
    float _2863 = _2853 + _2851;
    bool _2865 = _2859 >= 0.0;
    bool _2867 = isnan(_2859);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan(0.0);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = -_2261;
    float _2881 = fma(_2861, _2877, _2879);
    bool _2883 = _2881 >= 0.0;
    bool _2885 = isnan(_2881);
    bool _2887 = _2883 || _2885;
    bool _2889 = isnan(0.0);
    bool _2891 = _2887 || _2889;
    float _2893 = float(_2891);
    float _2895 = _2863 + _2893;
    float _2897 = 1.0 / _2471;
    float _2899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2901 = -_2261;
    float _2903 = fma(_2897, _2899, _2901);
    bool _2905 = _2903 >= 0.0;
    bool _2907 = isnan(_2903);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan(0.0);
    bool _2913 = _2909 || _2911;
    bool _2915 = !_2913;
    float _2917 = _2915 ? 0.0 : 2.0;
    float _2919 = _2895 + _2917;
    float _2921 = 1.0 / _2487;
    float _2923 = _2919 + _2875;
    float _2925 = 1.0 / _2525;
    float _2927 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2929 = -_2261;
    float _2931 = fma(_2921, _2927, _2929);
    bool _2933 = _2931 >= 0.0;
    bool _2935 = isnan(_2931);
    bool _2937 = _2933 || _2935;
    bool _2939 = isnan(0.0);
    bool _2941 = _2937 || _2939;
    float _2943 = 1.0 / _2491;
    float _2945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2947 = -_2261;
    float _2949 = fma(_2925, _2945, _2947);
    float _2951 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2953 = -_2261;
    float _2955 = fma(_2943, _2951, _2953);
    bool _2957 = _2955 >= 0.0;
    bool _2959 = isnan(_2955);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan(0.0);
    bool _2965 = _2961 || _2963;
    float _2967 = 1.0 / _2495;
    float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2971 = -_2261;
    float _2973 = fma(_2967, _2969, _2971);
    bool _2975 = _2973 >= 0.0;
    bool _2977 = isnan(_2973);
    bool _2979 = _2975 || _2977;
    bool _2981 = isnan(0.0);
    bool _2983 = _2979 || _2981;
    float _2985 = 1.0 / _2499;
    bool _2987 = !_2983;
    float _2989 = _2987 ? 0.0 : 3.0;
    float _2991 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2993 = -_2261;
    float _2995 = fma(_2985, _2991, _2993);
    bool _2997 = _2995 >= 0.0;
    bool _2999 = isnan(_2995);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    float _3007 = 1.0 / _2515;
    bool _3009 = !_3005;
    float _3011 = _3009 ? 0.0 : 3.0;
    float _3013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3015 = -_2261;
    float _3017 = fma(_3007, _3013, _3015);
    bool _3019 = _3017 >= 0.0;
    bool _3021 = isnan(_3017);
    bool _3023 = _3019 || _3021;
    bool _3025 = isnan(0.0);
    bool _3027 = _3023 || _3025;
    float _3029 = 1.0 / _2519;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3033 = -_2261;
    float _3035 = fma(_3029, _3031, _3033);
    bool _3037 = _3035 >= 0.0;
    bool _3039 = isnan(_3035);
    bool _3041 = _3037 || _3039;
    bool _3043 = isnan(0.0);
    bool _3045 = _3041 || _3043;
    bool _3047 = !_2965;
    float _3049 = _3047 ? 0.0 : 3.0;
    bool _3051 = _2949 >= 0.0;
    bool _3053 = isnan(_2949);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    bool _3061 = !_3045;
    float _3063 = _3061 ? 0.0 : 3.0;
    float _3065 = _3049 + _2989;
    bool _3067 = !_3027;
    float _3069 = _3067 ? 0.0 : 3.0;
    bool _3071 = !_3059;
    float _3073 = _3071 ? 0.0 : 3.0;
    float _3075 = _3065 + _3011;
    float _3077 = _3075 + _3069;
    bool _3079 = !_2941;
    float _3081 = _3079 ? 0.0 : 2.0;
    float _3083 = _3077 + _3063;
    float _3085 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3087 = _2923 + _3081;
    float _3089 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2241);
    float _3091 = _3083 + _3073;
    float _3093 = 1.0 / _2531;
    float _3095 = _3087 * 0.02857142873108386993408203125;
    float _3097 = precise::clamp(_3095, 0.0, 1.0);
    float _3099 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3089);
    float _3101 = _3099 + _1878;
    out.gl_Position.x = _1934;
    out.gl_Position.y = _1938;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _1878;
    float _3103 = 1.0 / _2535;
    float _3105 = _3101 * 0.5;
    out.m_70.z = _3105;
    out.m_70.w = _1878;
    float _3107 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3109 = -_2261;
    float _3111 = fma(_3093, _3107, _3109);
    float _3113 = exp2(_3085);
    bool _3115 = _3111 >= 0.0;
    bool _3117 = isnan(_3111);
    bool _3119 = _3115 || _3117;
    bool _3121 = isnan(0.0);
    bool _3123 = _3119 || _3121;
    float _3125 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3127 = -_2261;
    float _3129 = fma(_3103, _3125, _3127);
    float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3133 = -_2261;
    float _3135 = fma(_2543, _3131, _3133);
    bool _3137 = !_3123;
    float _3139 = _3137 ? 0.0 : 3.0;
    bool _3141 = _3129 >= 0.0;
    bool _3143 = isnan(_3129);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    bool _3151 = _3135 >= 0.0;
    bool _3153 = isnan(_3135);
    bool _3155 = _3151 || _3153;
    bool _3157 = isnan(0.0);
    bool _3159 = _3155 || _3157;
    float _3161 = _3091 + _3139;
    bool _3163 = !_3149;
    float _3165 = _3163 ? 0.0 : 3.0;
    float _3167 = -_3113;
    float _3169 = _3167 + 1.0;
    bool _3171 = !_3159;
    float _3173 = _3171 ? 0.0 : 5.0;
    float _3175 = _3161 + _3165;
    float _3177 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3179 = _3175 + _3173;
    float _3181 = _3177 * _2212;
    float _3183 = -_3177;
    float _3185 = _3183 + 1.0;
    float _3187 = _3179 * 0.14285714924335479736328125;
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = _2223 * _3181;
    float _3193 = _2233 * _3181;
    float _3195 = _3097 * _3189;
    float _3197 = fma(_2229, _3191, _2217);
    float _3199 = fma(_2231, _3191, _2219);
    float _3201 = _2223 * _3185;
    float _3203 = _3195 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3205 = fma(_2223, _3193, _2221);
    float _3207 = _3203 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _3197;
    out.m_72.y = _3199;
    out.m_72.z = _3205;
    out.m_72.w = _3201;
    out.m_49.x = _3207;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1480 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_46.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3264 = as_type<float>(_107);
        out.gl_Position.z = _3264;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_51.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3333 = as_type<float>(_145);
        out.gl_Position.z = _3333;
    }
    if (_139)
    {
        return out;
    }
    float _147 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _149 = int(_147);
    float _151 = float(_91);
    float _153 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _155 = int(_153);
    float _157 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _159 = float(_149);
    float _161 = 1.0 / _151;
    float _163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _165 = float(uint(_155));
    float _167 = 1.0 / _159;
    int _169 = ~_155;
    int _171 = _169 + 1;
    bool _173 = _155 == 0;
    int _175 = ~_155;
    int _177 = _175 + 1;
    float _179 = 1.0 / _165;
    float _181 = _167 * _125;
    float _183 = trunc(_181);
    int _185 = int(_183);
    int _187 = as_type<int>(_179) + (-2);
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _191 = _189 != 0;
    float _193 = float(uint(_185));
    float _195 = as_type<float>(_187) * _193;
    int _197 = ~_155;
    int _199 = _197 + 1;
    float _201 = trunc(_195);
    float _203 = precise::max(_201, 0.0);
    uint _206 = uint(_203);
    float _208 = float(_155);
    int _210 = _199 * int(_206);
    int _212 = _210 + _185;
    float _214 = in.m_53.x;
    float _216 = in.m_53.y;
    float _218 = float(uint(_212));
    float _220 = as_type<float>(_187) * _218;
    float _222 = float(_185);
    float _224 = trunc(_220);
    float _226 = precise::max(_224, 0.0);
    uint _228 = uint(_226);
    int _230 = int(_206) + int(_228);
    bool _232 = _222 >= _208;
    bool _234 = isnan(_222);
    bool _236 = _232 || _234;
    bool _238 = isnan(_208);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    bool _244 = !_191;
    float _246 = _244 ? 7.345489978790283203125 : 1.0;
    int _248 = _171 * _230;
    int _250 = _248 + _185;
    float _252 = trunc(_242);
    int _254 = int(_252);
    float _256 = _246 * _214;
    bool _258 = uint(_250) >= uint(_155);
    bool _260 = !_258;
    int _262 = _260 ? 0 : (-1);
    float _264 = floor(_256);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _276 = _274 != 0;
    int _278 = ~_230;
    int _280 = _278 + _262;
    int _282 = _280 + 1;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _290 = _288 != 0;
    int _292 = _155 * _282;
    int _294 = _292 + _185;
    int _296 = ~_254;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _304 = _302 != 0;
    bool _306 = !_173;
    int _308 = _306 ? _294 : (-1);
    float _310 = -_264;
    float _312 = _256 + _310;
    bool _314 = !_272;
    int _316 = _314 ? 0 : 1;
    int _318 = _308 * _300;
    int _320 = _155 + (-1);
    float _322 = _312 * _208;
    float _324 = _208 * _125;
    bool _326 = !_286;
    int _328 = _326 ? 0 : 1;
    float _330 = trunc(_322);
    int _332 = int(_330);
    float _334 = _324 * _161;
    int _336 = _254 * _320;
    int _338 = _336 + _318;
    bool _340 = !_268;
    int _342 = _340 ? 0 : 1;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _346 = _344 != 0;
    int _348 = abs(_342);
    float _350 = trunc(_334);
    int _352 = int(_350);
    int _354 = abs(_316);
    bool _356 = !_276;
    int _358 = _356 ? 0 : 1;
    int _360 = abs(_328);
    int _362 = _338 * _354;
    bool _364 = !_346;
    int _366 = _364 ? 0 : 1;
    float _368 = as_type<float>(int(gl_VertexIndex));
    int _370 = abs(_358);
    int _372 = _332 * _360;
    int _374 = _372 + _185;
    int _376 = abs(_366);
    int _378 = _352 * _348;
    int _380 = _378 + _362;
    int _382 = ~_155;
    int _384 = _382 + 1;
    int _386 = _374 * _370;
    int _388 = _386 + _380;
    float _390 = float(uint(_374));
    bool _392 = _155 == 0;
    int _394 = _332 * _376;
    int _396 = _394 + _388;
    int _398 = ~_155;
    int _400 = _398 + 1;
    float _402 = as_type<float>(_187) * _390;
    int _404 = ~_155;
    int _406 = _404 + 1;
    float _408 = float(uint(_396));
    float _410 = trunc(_402);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    float _416 = as_type<float>(_187) * _408;
    float _418 = trunc(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    int _424 = _406 * int(_414);
    int _426 = _424 + _374;
    float _428 = float(uint(_426));
    int _430 = _400 * int(_422);
    int _432 = _430 + _396;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _436 = float(uint(_432));
    float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = as_type<float>(_187) * _436;
    float _442 = trunc(_440);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    int _448 = int(_422) + int(_446);
    int _450 = _384 * _448;
    int _452 = _450 + _396;
    bool _454 = uint(_452) >= uint(_155);
    bool _456 = !_454;
    int _458 = _456 ? 0 : (-1);
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _462 = _460 != 0;
    int _464 = ~_448;
    int _466 = _464 + _458;
    int _468 = _466 + 1;
    float _470 = in.m_46.x;
    float _472 = in.m_46.y;
    float _474 = in.m_46.z;
    bool _476 = !_462;
    int _478 = _476 ? 0 : 1;
    int _480 = _155 * _468;
    int _482 = _480 + _396;
    float _484 = as_type<float>(_187) * _428;
    float _486 = _216 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _488 = !_392;
    int _490 = _488 ? _482 : (-1);
    float _492 = _214 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _494 = trunc(_484);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    float _500 = fma(_486, -2.0, _163);
    int _502 = _490 & 3;
    bool _504 = _502 != 0;
    float _506 = -_157;
    float _508 = fma(_492, 2.0, _506);
    int _510 = _490 & 3;
    bool _512 = _510 != 0;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _516 = uint(_502) > 1u;
    float _518 = -_125;
    float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _508);
    int _522 = _512 ? 0 : 1;
    float _524 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _526 = as_type<int>(_368) & 1;
    bool _528 = _526 != 0;
    int _530 = as_type<int>(_368) & 2;
    bool _532 = _530 != 0;
    int _534 = ~_522;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = _472 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _542 = _472 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _544 = _472 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = _214 * 2.0;
    int _548 = int(_414) + int(_498);
    float _550 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
    int _552 = _538;
    if (!_516)
    {
        int _554 = ~_522;
        int _556 = _554 + 1;
        _552 = _556;
    }
    int _558 = _552;
    float _560 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
    bool _562 = uint(_502) >= 2u;
    float _564 = in.m_53.z;
    float _566 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _568 = _214 + _216;
    int _570 = _562 ? 0 : 1;
    float _572 = floor(_546);
    bool _574 = _502 != 3;
    int _576 = _177 * _548;
    int _578 = _576 + _374;
    int _580 = ~_570;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _568 + (-1.0);
    float _588 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
    float _590 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _594 = _490 >> 31;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _600 = _584;
    if (_574)
    {
        int _602 = ~_570;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _614 = uint(_578) >= uint(_155);
    float _616 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _618 = _594 & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _622 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _624 = !_528;
    float _626 = _624 ? (-0.5) : 0.5;
    float _628 = _564 * 2.0;
    int _630 = _490 + _618;
    float _632 = _620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _608;
    out.m_58.y = _612;
    out.m_58.z = _622;
    out.m_58.w = _610;
    bool _634 = _572 > 0.0;
    float _636 = floor(_628);
    int _638 = _630 >> 2;
    out.m_60.x = _438;
    out.m_60.y = _632;
    out.m_60.z = _524;
    bool _640 = !_532;
    float _642 = _640 ? (-0.5) : 0.5;
    bool _644 = _214 > 0.5;
    bool _646 = !_614;
    int _648 = _646 ? 0 : (-1);
    float _650 = _216 * 2.0;
    bool _652 = _572 >= 0.0;
    bool _654 = isnan(_572);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = _216 + _564;
    int _664 = _638 << 4;
    int _666 = _664 + 368;
    float _668 = floor(_650);
    float _670 = _662 + (-1.0);
    int _672 = ~_548;
    int _674 = _672 + _648;
    int _676 = _674 + 1;
    uint _678 = uint(int(uint(_666) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    float _694 = -_626;
    int _696 = _644 ? as_type<int>(_694) : as_type<int>(_626);
    float _698 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _700 = _216 > 0.5;
    int _702 = _155 * _676;
    int _704 = _702 + _374;
    int _706 = _660 ? 0 : 1;
    float _708 = -_642;
    int _710 = _700 ? as_type<int>(_708) : as_type<int>(_642);
    int _712 = _666 + 8;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[int(_724)][_726];
    bool _730 = !_290;
    float _732 = _730 ? _626 : as_type<float>(_696);
    bool _734 = !_304;
    float _736 = _734 ? _642 : as_type<float>(_710);
    bool _738 = _668 > 0.0;
    bool _740 = _668 >= 0.0;
    bool _742 = isnan(_668);
    bool _744 = _740 || _742;
    bool _746 = isnan(0.0);
    bool _748 = _744 || _746;
    bool _750 = _502 != 3;
    int _752 = ~_706;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    int _758 = _756;
    float _760 = _732;
    if (!_634)
    {
        int _762 = ~_706;
        int _764 = _762 + 1;
        _758 = _764;
    }
    int _766 = _758;
    float _768 = _732 + 0.5;
    bool _770 = !_392;
    int _772 = _770 ? _704 : (-1);
    bool _774 = !_504;
    int _776 = _774 ? 0 : 1;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _788 = _786 != 0;
    float _790 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    int _792 = abs(_558);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[80].x, _520);
    bool _796 = !_750;
    int _798 = _796 ? 0 : (-1);
    float _800 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _802 = _636 > 0.0;
    float _804 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _500);
    bool _806 = _636 >= 0.0;
    bool _808 = isnan(_636);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _736 + (-0.5);
    int _818 = abs(_776);
    float _820 = _790 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _822 = abs(_606);
    float _824 = -_816;
    float _826 = -_804;
    float _828 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[80].y, _826);
    int _830 = ~_792;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _838 = _800 + _836;
    int _840 = ~_818;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    float _846 = _590 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = _820 + _848;
    int _852 = abs(_798);
    int _854 = _834 * as_type<int>(_692);
    int _856 = ~_822;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _838 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _864 = abs(_478);
    int _866 = _844 * as_type<int>(_684);
    int _868 = _866 + _854;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _846 + _870;
    int _874 = _860 * as_type<int>(_720);
    int _876 = _874 + _868;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _880 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _882 = log2(_880);
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _886 = ~_852;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    float _892 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _862);
    float _894 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[78].z, _878);
    float _896 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[78].w, _884);
    int _898 = ~_864;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    float _904 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    int _906 = _890 * as_type<int>(_728);
    int _908 = _906 + _876;
    float _910 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _894);
    float _912 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _914 = _838 * _838;
    int _916 = _748 ? 0 : 1;
    int _918 = _908 * _902;
    bool _920 = _904 >= 0.0;
    float _922 = -_910;
    float _924 = _922 + 1.0;
    float _926 = -_912;
    float _928 = _926 + 1.0;
    float _930 = _882 * _125;
    int _932 = _814 ? 0 : 1;
    float _934 = fma(_850, _850, _914);
    int _936 = _772 * _864;
    int _938 = _936 + _918;
    int _940 = ~_916;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = -_924;
    float _948 = fma(_732, _946, _794);
    int _950 = _944;
    float _952 = _850;
    float _954 = _800;
    if (!_738)
    {
        int _956 = ~_916;
        int _958 = _956 + 1;
        _950 = _958;
    }
    int _960 = _950;
    float _962 = fma(_736, _928, _828);
    int _964 = ~_932;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = fma(_872, _872, _934);
    float _972 = exp2(_930);
    int _974 = _968;
    if (!_802)
    {
        int _976 = ~_932;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = in.m_62.x;
    float _984 = in.m_62.y;
    float _986 = in.m_62.z;
    if (_920)
    {
        _760 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _988 = _760;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = rsqrt(_970);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    int _1006 = as_type<int>(_988);
    if (_920)
    {
        float _1008 = _988 * 5.0;
        _1006 = as_type<int>(_1008);
    }
    int _1010 = _1006;
    float _1012 = float(_938);
    out.m_64.x = _948;
    out.m_64.y = _962;
    bool _1014 = !_784;
    int _1016 = _1014 ? 0 : 1;
    bool _1018 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(0.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / _1004;
    if (_920)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4621 = as_type<float>(_1010);
        out.gl_Position.z = _4621;
    }
    float _1030 = -_972;
    float _1032 = _1030 + 1.0;
    int _1034 = abs(_1016);
    out.m_66.x = _1012;
    float _1036 = _1026 ? _1032 : 0.0;
    float _1038 = _850 * _1000;
    if (_920)
    {
        out.m_49.x = 0.0;
    }
    bool _1040 = !_788;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _838 * _1000;
    bool _1046 = !_780;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = abs(_1042);
    int _1052 = abs(_1048);
    if (_920)
    {
        return out;
    }
    float _1054 = -_1044;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _800);
    float _1058 = _872 * _1000;
    float _1060 = -_1038;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _820);
    float _1064 = float(_1052);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1056 + _1066;
    float _1070 = float(_980);
    if (_998)
    {
        float _1072 = _1036 * _1028;
        _129 = _1072;
    }
    float _1074 = _129;
    float _1076 = float(_766);
    float _1078 = -_1058;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _1082 = float(_960);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1062 + _1084;
    float _1088 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = _1064 * _1070;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1094 = _1080 + _1092;
    float _1096 = float(_1034);
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1100 = _1090 * (-2.0);
    float _1102 = _214 + (-0.5);
    float _1104 = _216 + (-0.5);
    float _1106 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1098);
    float _1108 = _1096 * _1076;
    float _1110 = fma(_1100, _982, _982);
    float _1112 = fma(_616, _1100, _616);
    float _1114 = -_1044;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    bool _1118 = _1106 >= 0.0;
    float _1120 = _1108 * (-2.0);
    float _1122 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1110);
    float _1124 = _1116 * _1116;
    float _1126 = float(_1050);
    float _1128 = fma(_1120, _984, _984);
    float _1130 = fma(_1112, _1074, _1122);
    float _1132 = fma(_698, _1120, _698);
    float _1134 = _214 + _564;
    float _1136 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    float _1138 = _1130 * 0.15915493667125701904296875;
    float _1140 = -_1038;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    if (_1118)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1144 = _952;
    float _1146 = fma(_1132, _1074, _1136);
    float _1148 = _1138 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    int _1152 = as_type<int>(_1144);
    if (_1118)
    {
        out.m_49.x = 0.0;
    }
    float _1154 = _1126 * _1082;
    if (_1118)
    {
        float _1156 = _1144 * 5.0;
        _1152 = as_type<int>(_1156);
    }
    int _1158 = _1152;
    float _1160 = fma(_1142, _1142, _1124);
    float _1162 = _1134 + (-1.0);
    float _1164 = _1146 * 0.15915493667125701904296875;
    float _1166 = _1138 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    if (_1118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4856 = as_type<float>(_1158);
        out.gl_Position.z = _4856;
    }
    if (_1118)
    {
        return out;
    }
    float _1170 = in.m_68.x;
    float _1172 = in.m_68.y;
    float _1174 = -_1058;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1178 = _1154 * (-2.0);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = _564 + (-0.5);
    float _1184 = fma(_1176, _1176, _1160);
    float _1186 = fma(_1178, _986, _986);
    float _1188 = fma(_1180, _1178, _1180);
    float _1190 = _1164 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _642);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1186);
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _1200 = fma(_1188, _1074, _1196);
    float _1202 = sqrt(_1184);
    float _1204 = _1200 * 0.15915493667125701904296875;
    float _1206 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1208 = _1164 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1216 = _1000 * _1202;
    float _1218 = _1204 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1216 * _1214;
    float _1224 = _1194 * _1222;
    float _1226 = _1204 * 6.283185482025146484375;
    float _1228 = cos(_1226);
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1232 = _1150 * _1192;
    float _1234 = _1168 * _1210;
    float _1236 = _1216 * _1230;
    float _1238 = fma(_1220, _1234, _1232);
    float _1240 = _1198 * _1236;
    float _1242 = _1168 * _1192;
    float _1244 = _1228 * _1224;
    float _1246 = _1192 * _1228;
    float _1248 = _1210 * _1228;
    float _1250 = _1150 * _1210;
    float _1252 = _1168 * _1244;
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1256 = _1254 * 0.5;
    float _1258 = -_1224;
    float _1260 = _1220 * _1258;
    float _1262 = _1150 * _1244;
    float _1264 = fma(_1238, _1240, _1252);
    float _1266 = -_1250;
    float _1268 = fma(_1220, _1242, _1266);
    float _1270 = -_1242;
    float _1272 = fma(_1220, _1250, _1270);
    float _1274 = fma(_1248, _1240, _1260);
    float _1276 = fma(_1220, _1232, _1234);
    float _1278 = fma(_1268, _1256, _1264);
    float _1280 = fma(_1272, _1240, _1262);
    float _1282 = fma(_1246, _1256, _1274);
    float _1284 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1288 = fma(_1276, _1256, _1280);
    float _1290 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1284);
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1286);
    float _1294 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1290);
    float _1296 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1292);
    float _1298 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1300 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1302 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1304 = _820 + _1298;
    float _1306 = _846 + _1300;
    float _1308 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1302);
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1312 = _1304 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1316 = _1306 + _1314;
    float _1318 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1308);
    float _1320 = _1312 * _1312;
    float _1322 = _1316 * _1316;
    float _1324 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1326 = _1320 + _1322;
    float _1328 = _800 + _1324;
    float _1330 = sqrt(_1326);
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1324;
    float _1336 = _1320;
    float _1338 = _1318;
    float _1340 = _1288;
    float _1342 = _1322;
    float _1344 = _1304;
    float _1346 = _1328;
    if (!_1332)
    {
        _1334 = _1320;
    }
    float _1348 = _1334;
    float _1350 = _1348;
    if (!_1332)
    {
        _1336 = _1304;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (!_1332)
    {
        _1338 = _1306;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (!_1332)
    {
        _1340 = _1328;
    }
    float _1360 = _1340;
    bool _1362 = !_1332;
    float _1364 = _1360;
    if (!_1362)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1370 = _1330 + _1368;
        float _1372 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = rsqrt(_1326);
        float _1376 = _1370 * _1366;
        float _1378 = _1376 * 0.15915493667125701904296875;
        float _1380 = _1378 * 6.283185482025146484375;
        float _1382 = sin(_1380);
        float _1384 = _1378 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = fma(_1382, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1390 = _1374 * _1388;
        float _1392 = _1386 + (-1.0);
        float _1394 = fma(_1312, _1390, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1396 = fma(_1316, _1390, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1398 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1402 = _1394 + _1400;
        float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1406 = _1396 + _1404;
        float _1408 = fma(_1328, _1386, _1398);
        float _1410 = _1402 * _1402;
        float _1412 = _1406 * _1406;
        _1364 = _1408;
        _1350 = _1410;
        _1342 = _1412;
        _1354 = _1394;
        _1358 = _1396;
    }
    float _1414 = _1364;
    float _1416 = _1350;
    float _1418 = _1342;
    float _1420 = _1354;
    float _1422 = _1358;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1414 + _1424;
    float _1428 = fma(_1426, _1426, _1416);
    float _1430 = _1428 + _1418;
    float _1432 = sqrt(_1430);
    bool _1434 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1436 = isnan(_1432);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1442 = _1438 || _1440;
    float _1444 = _1416;
    if (!_1442)
    {
        _1444 = 1.0;
    }
    float _1446 = _1444;
    bool _1448 = !_1442;
    float _1450 = _1446;
    if (!_1448)
    {
        bool _1452 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1454 = isnan(_1432);
        bool _1456 = _1452 || _1454;
        bool _1458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1460 = _1456 || _1458;
        if (!_1460)
        {
            float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1464 = _1432 + _1462;
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1474 = 1.0 / _1468;
            float _1476 = _1464 * _1474;
            float _1478 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1450 = _1478;
            _1344 = _1474;
            _1480 = true;
        }
        else
        {
            bool _1482 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1484 = isnan(_1432);
            bool _1486 = _1482 || _1484;
            bool _1488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1490 = _1486 || _1488;
            if (!_1490)
            {
                float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1494 = _1432 + _1492;
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1496 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1504 = 1.0 / _1498;
                float _1506 = _1494 * _1504;
                float _1508 = fma(_1506, _1502, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1450 = _1508;
                _1344 = _1504;
                _1480 = true;
            }
            else
            {
                _1450 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1480 = false;
    float _1510 = _1450;
    float _1512 = _1344;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1420 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1520 = _1414 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1524 = _1422 + _1522;
    bool _1526 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.5);
    bool _1534 = _1530 || _1532;
    float _1536 = fma(_1516, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1538 = fma(_1520, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = fma(_1524, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1542 = -_1038;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1546 = -_1044;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = -_1058;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1554 = _1548;
    float _1556 = _1544;
    float _1558 = _1552;
    float _1560 = _1512;
    if (!_1534)
    {
        float _1562 = _1068 * _1068;
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1566 = -_800;
        float _1568 = _1566 + _1538;
        float _1570 = -_846;
        float _1572 = _1570 + _1540;
        float _1574 = fma(_1086, _1086, _1562);
        float _1576 = fma(_1094, _1094, _1574);
        float _1578 = 1.0 / _1216;
        float _1580 = sqrt(_1576);
        float _1582 = precise::min(_1580, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1584 = _1582 * _1564;
        float _1586 = -_820;
        float _1588 = _1586 + _1536;
        float _1590 = _1584 * _1578;
        float _1592 = fma(_1588, _1590, _1062);
        float _1594 = fma(_1568, _1590, _1056);
        float _1596 = fma(_1572, _1590, _1080);
        _1554 = _1594;
        _1556 = _1592;
        _1558 = _1596;
        _954 = _1568;
    }
    float _1598 = _1554;
    float _1600 = _1556;
    float _1602 = _1558;
    float _1604 = _954;
    float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1608 = _1598 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1600 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1616 = _1602 + _1614;
    float _1618 = _1608 * _1608;
    float _1620 = fma(_1612, _1612, _1618);
    float _1622 = fma(_1616, _1616, _1620);
    float _1624 = rsqrt(_1622);
    float _1626 = sqrt(_1622);
    float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1630 = _1612 * _1628;
    float _1632 = _1616 * _1628;
    float _1634 = _1630 * _1630;
    float _1636 = _1632 * _1632;
    float _1638 = _1634 + _1636;
    float _1640 = sqrt(_1638);
    bool _1642 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = _1640 + _1644;
    float _1648 = _1624;
    float _1650 = _1638;
    float _1652 = _1646;
    float _1654 = _1608;
    float _1656 = _1604;
    if (_1642)
    {
        float _1658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1648 = _1658;
    }
    float _1660 = _1648;
    if (_1642)
    {
        float _1662 = rsqrt(_1638);
        _1650 = _1662;
    }
    float _1664 = _1650;
    if (_1642)
    {
        float _1666 = _1646 * _1660;
        _1652 = _1666;
    }
    float _1668 = _1652;
    if (_1642)
    {
        float _1670 = _1668 * 0.15915493667125701904296875;
        _1346 = _1670;
    }
    float _1672 = _1346;
    float _1674 = _1616;
    if (_1642)
    {
        float _1676 = _1672 * 6.283185482025146484375;
        float _1678 = sin(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1684 = precise::max(0.0, _1682);
    float _1686 = _1660;
    float _1688 = _1684;
    if (_1642)
    {
        float _1690 = _1672 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        _1686 = _1692;
    }
    float _1694 = _1686;
    float _1696 = -_1628;
    float _1698 = -_1684;
    float _1700 = fma(_1608, _1696, _1698);
    if (_1642)
    {
        float _1702 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1702;
    }
    float _1704 = _1654;
    float _1706 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1708 = _1680;
    float _1710 = _1704;
    if (_1642)
    {
        float _1712 = fma(_1680, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1560 = _1712;
    }
    float _1714 = _1560;
    float _1716 = _1714;
    if (!_1642)
    {
        _1708 = _1630;
    }
    float _1718 = _1708;
    float _1720 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1706);
    float _1722 = _1718;
    if (!_1642)
    {
        _1710 = _1700;
    }
    float _1724 = _1710;
    float _1726 = _1724;
    float _1728 = _1694;
    if (_1642)
    {
        float _1730 = _1694 + (-1.0);
        _1688 = _1730;
    }
    float _1732 = _1688;
    float _1734 = _1732;
    if (_1642)
    {
        float _1736 = _1664 * _1714;
        _1716 = _1736;
    }
    float _1738 = _1716;
    float _1740 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1742 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    if (_1642)
    {
        float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1744;
    }
    float _1746 = _1656;
    float _1748 = _1746;
    if (_1642)
    {
        float _1750 = _1630 * _1738;
        _1722 = _1750;
    }
    float _1752 = _1722;
    if (!_1642)
    {
        _1734 = _1632;
    }
    float _1754 = _1734;
    float _1756 = _1754;
    if (_1642)
    {
        float _1758 = _1632 * _1738;
        _1756 = _1758;
    }
    float _1760 = _1756;
    if (_1642)
    {
        float _1762 = fma(_1700, _1694, _1746);
        _1726 = _1762;
    }
    float _1764 = _1726;
    if (!_1642)
    {
        _1748 = _1634;
    }
    float _1766 = _1748;
    float _1768 = _1766;
    if (_1642)
    {
        float _1770 = _1752 * _1752;
        _1768 = _1770;
    }
    float _1772 = _1768;
    if (!_1642)
    {
        _1728 = _1636;
    }
    float _1774 = _1728;
    float _1776 = _1774;
    if (_1642)
    {
        float _1778 = _1760 * _1760;
        _1776 = _1778;
    }
    float _1780 = _1776;
    float _1782 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1740);
    float _1784 = fma(_1764, _1764, _1772);
    float _1786 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1788 = _1784 + _1780;
    float _1790 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1782);
    float _1792 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1626, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = rsqrt(_1788);
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1804 = _1792 * 0.5;
    float _1806 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1808 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1786);
    float _1810 = fma(_1802, -0.5, _1804);
    float _1812 = -_1798;
    float _1814 = _1812 + 1.0;
    float _1816 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1818 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1806);
    float _1822 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1808);
    float _1824 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1816);
    float _1826 = abs(_1814);
    float _1828 = log2(_1826);
    float _1830 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1832 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1820);
    float _1834 = _1800 * _1752;
    float _1836 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1824);
    float _1838 = _1800 * _1764;
    float _1840 = _1800 * _1760;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1844 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1846 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1848 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = -_1842;
    float _1852 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1850);
    float _1854 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1856 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1858 = -_1840;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1852);
    float _1862 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1854);
    float _1866 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1868 = fma(_1860, -0.5, 0.5);
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1864);
    float _1872 = exp2(_1862);
    float _1874 = fma(_1860, 0.5, 0.5);
    float _1876 = _1838 + 1.0;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1870);
    float _1880 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1882 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1884 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1810);
    float _1888 = sqrt(_1868);
    float _1890 = fma(_1874, _1882, -0.212114393711090087890625);
    float _1892 = -_1884;
    float _1894 = fma(_1892, _1880, 1.0);
    float _1896 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1900 = fma(_1874, _1890, 1.570728778839111328125);
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1904 = _1810 + _1902;
    float _1906 = _1810 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1908 = -_1838;
    float _1910 = fma(_1872, _1876, _1908);
    float _1912 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1914 = 1.0 / _1878;
    float _1916 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1918 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1898);
    float _1920 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1912);
    float _1922 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1810);
    float _1924 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1916);
    float _1926 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1918);
    float _1928 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1920);
    float _1930 = 1.0 / _1792;
    float _1932 = _1888 * 0.636619746685028076171875;
    float _1934 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1924);
    float _1936 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1938 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1926);
    float _1940 = -_1900;
    float _1942 = fma(_1932, _1940, 1.0);
    float _1944 = fma(_1910, 0.5, 0.5);
    float _1946 = _1936 + _1792;
    float _1948 = _1934 * _1914;
    float _1950 = _1938 * _1914;
    float _1952 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1810);
    float _1954 = _1946 * 0.5;
    float _1956 = fma(_1948, 0.5, 0.5);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1810);
    float _1962 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1810);
    float _1964 = _1810 * _1930;
    float _1966 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1810);
    float _1968 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1810);
    float _1970 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1810);
    float _1972 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1810);
    float _1974 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1810);
    float _1976 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1810);
    float _1978 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1810);
    float _1980 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1810);
    float _1982 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1810);
    float _1984 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1810);
    float _1986 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1810);
    float _1988 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1810);
    float _1990 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1810);
    float _1992 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1810);
    float _1994 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1810);
    float _1996 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1810);
    float _1998 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1810);
    float _2000 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1954);
    float _2002 = _1960 * _1930;
    float _2004 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1954);
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2008 = _1954 + _2006;
    float _2010 = _2000 * _1930;
    float _2012 = _1886 * _1930;
    float _2014 = _2004 * _1930;
    float _2016 = _2008 * _1930;
    float _2018 = _1904 * _1930;
    float _2020 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1954);
    float2 _6299 = float2(_2010, _2002);
    float _2022 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6299, float2(0.0), isnan(_6299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6299, float2(0.0), isnan(_6299)), level(0.0)).x;
    float2 _6309 = float2(_2014, _2012);
    float _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6309, float2(0.0), isnan(_6309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6309, float2(0.0), isnan(_6309)), level(0.0)).x;
    float _2026 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1954);
    float2 _6321 = float2(_2016, _1964);
    float _2028 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6321, float2(0.0), isnan(_6321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6321, float2(0.0), isnan(_6321)), level(0.0)).x;
    float _2030 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1954);
    float _2032 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1954);
    float _2034 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1954);
    float _2036 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1954);
    float _2038 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1954);
    float _2040 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1954);
    float _2042 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1954);
    float _2044 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1954);
    float _2046 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1954);
    float _2048 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1954);
    float _2050 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1954);
    float _2052 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1954);
    float _2054 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1954);
    float _2056 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1954);
    float _2058 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1954);
    float _2060 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1954);
    float _2062 = _1954 * _1930;
    float _2064 = _1906 * _1930;
    float _2066 = _1922 * _1930;
    float _2068 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float2 _6406 = float2(_2062, _2018);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6406, float2(0.0), isnan(_6406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6406, float2(0.0), isnan(_6406)), level(0.0)).x;
    float _2072 = _2020 * _1930;
    float _2074 = _1952 * _1930;
    float2 _6420 = float2(_2062, _2064);
    float _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6420, float2(0.0), isnan(_6420)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6420, float2(0.0), isnan(_6420)), level(0.0)).x;
    float2 _6428 = float2(_2014, _2066);
    float _2078 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0)).x;
    float _2080 = _2068 * _1930;
    float _2082 = _2026 * _1930;
    float _2084 = _1962 * _1930;
    float _2086 = _2030 * _1930;
    float _2088 = _1966 * _1930;
    float _2090 = log2(_1894);
    float2 _6453 = float2(_2080, _1964);
    float _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6453, float2(0.0), isnan(_6453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6453, float2(0.0), isnan(_6453)), level(0.0)).x;
    float2 _6461 = float2(_2072, _2074);
    float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6461, float2(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6461, float2(0.0), isnan(_6461)), level(0.0)).x;
    float2 _6469 = float2(_2082, _2084);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6469, float2(0.0), isnan(_6469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6469, float2(0.0), isnan(_6469)), level(0.0)).x;
    float2 _6477 = float2(_2086, _1964);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6477, float2(0.0), isnan(_6477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6477, float2(0.0), isnan(_6477)), level(0.0)).x;
    float _2100 = _2032 * _1930;
    float _2102 = _1994 * _1930;
    float _2104 = _1968 * _1930;
    float _2106 = _2034 * _1930;
    float2 _6497 = float2(_2100, _2088);
    float _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6497, float2(0.0), isnan(_6497)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6497, float2(0.0), isnan(_6497)), level(0.0)).x;
    float2 _6505 = float2(_2062, _2002);
    float _2110 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6505, float2(0.0), isnan(_6505)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6505, float2(0.0), isnan(_6505)), level(0.0)).x;
    float _2112 = _1970 * _1930;
    float _2114 = _1998 * _1930;
    float _2116 = _2036 * _1930;
    float _2118 = _1972 * _1930;
    float _2120 = _1974 * _1930;
    float _2122 = _2090 * 0.693147182464599609375;
    float _2124 = _1996 * _1930;
    float _2126 = _2038 * _1930;
    float2 _6537 = float2(_2062, _2074);
    float _2128 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6537, float2(0.0), isnan(_6537)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6537, float2(0.0), isnan(_6537)), level(0.0)).x;
    float2 _6545 = float2(_2100, _2104);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).x;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = _2040 * _1930;
    float2 _6560 = float2(_2014, _1964);
    float _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6560, float2(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6560, float2(0.0), isnan(_6560)), level(0.0)).x;
    float2 _6568 = float2(_2106, _2112);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6568, float2(0.0), isnan(_6568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6568, float2(0.0), isnan(_6568)), level(0.0)).x;
    float _2140 = _1978 * _1930;
    float _2142 = _1976 * _1930;
    float _2144 = _1980 * _1930;
    float _2146 = _1992 * _1930;
    float _2148 = _2042 * _1930;
    float2 _6591 = float2(_2116, _2118);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).x;
    float2 _6599 = float2(_2126, _1964);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6599, float2(0.0), isnan(_6599)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6599, float2(0.0), isnan(_6599)), level(0.0)).x;
    float2 _6607 = float2(_2134, _2120);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6607, float2(0.0), isnan(_6607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6607, float2(0.0), isnan(_6607)), level(0.0)).x;
    float2 _6615 = float2(_2062, _2142);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6615, float2(0.0), isnan(_6615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6615, float2(0.0), isnan(_6615)), level(0.0)).x;
    float2 _6623 = float2(_2062, _2140);
    float _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6623, float2(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6623, float2(0.0), isnan(_6623)), level(0.0)).x;
    float2 _6631 = float2(_2134, _2144);
    float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6631, float2(0.0), isnan(_6631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6631, float2(0.0), isnan(_6631)), level(0.0)).x;
    float2 _6639 = float2(_2148, _1964);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6639, float2(0.0), isnan(_6639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6639, float2(0.0), isnan(_6639)), level(0.0)).x;
    float _2164 = _2044 * _1930;
    float _2166 = _2046 * _1930;
    float _2168 = _1982 * _1930;
    float _2170 = _2048 * _1930;
    float _2172 = _1984 * _1930;
    float _2174 = _2050 * _1930;
    float _2176 = _1986 * _1930;
    float _2178 = _2052 * _1930;
    float _2180 = _1988 * _1930;
    float _2182 = _2054 * _1930;
    float _2184 = _1990 * _1930;
    float _2186 = _2056 * _1930;
    float2 _6683 = float2(_2164, _2168);
    float _2188 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6683, float2(0.0), isnan(_6683)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6683, float2(0.0), isnan(_6683)), level(0.0)).x;
    float2 _6691 = float2(_2166, _2172);
    float _2190 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6691, float2(0.0), isnan(_6691)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6691, float2(0.0), isnan(_6691)), level(0.0)).x;
    float2 _6699 = float2(_2170, _2176);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6699, float2(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6699, float2(0.0), isnan(_6699)), level(0.0)).x;
    float2 _6707 = float2(_2174, _2180);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6707, float2(0.0), isnan(_6707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6707, float2(0.0), isnan(_6707)), level(0.0)).x;
    float2 _6715 = float2(_2178, _2184);
    float _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).x;
    float2 _6723 = float2(_2182, _2146);
    float _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6723, float2(0.0), isnan(_6723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6723, float2(0.0), isnan(_6723)), level(0.0)).x;
    float2 _6731 = float2(_2186, _2102);
    float _2200 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6731, float2(0.0), isnan(_6731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6731, float2(0.0), isnan(_6731)), level(0.0)).x;
    float _2202 = _2058 * _1930;
    float _2204 = _2060 * _1930;
    float2 _6745 = float2(_2202, _2124);
    float _2206 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6745, float2(0.0), isnan(_6745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6745, float2(0.0), isnan(_6745)), level(0.0)).x;
    float2 _6753 = float2(_2204, _2114);
    float _2208 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6753, float2(0.0), isnan(_6753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6753, float2(0.0), isnan(_6753)), level(0.0)).x;
    float2 _6761 = float2(_2062, _1964);
    float _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6761, float2(0.0), isnan(_6761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6761, float2(0.0), isnan(_6761)), level(0.0)).x;
    float3 _6770 = float3(_1956, _1958, _2132);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6770, float3(0.0), isnan(_6770)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6770, float3(0.0), isnan(_6770)), level(0.0)).x;
    float3 _6781 = float3(_1956, _1958, _2132);
    float4 _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6781, float3(0.0), isnan(_6781)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6781, float3(0.0), isnan(_6781)), level(0.0)).xyzw;
    float _2217 = _2215.x;
    float _2219 = _2215.y;
    float _2221 = _2215.z;
    float _2223 = _2215.w;
    float2 _6797 = float2(_1942, _1944);
    float3 _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6797, float2(0.0), isnan(_6797)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6797, float2(0.0), isnan(_6797)), level(0.0)).xyz;
    float _2229 = _2227.x;
    float _2231 = _2227.y;
    float _2233 = _2227.z;
    float _2235 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2237 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2239 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2235);
    float _2241 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2237);
    float _2243 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2239);
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2247 = _2245 + _1792;
    float _2249 = _2247 * _1930;
    float _2251 = _2249 * 0.5;
    float _2253 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2255 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2253);
    float _2257 = 1.0 / _2255;
    float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2261 = _2257 * _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2265 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2263);
    float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2269 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2267);
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2265;
    float _2277 = 1.0 / _2273;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2281 = -_2261;
    float _2283 = fma(_2275, _2279, _2281);
    float _2285 = 1.0 / _2269;
    float _2287 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2289 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2287);
    bool _2291 = _2283 >= 0.0;
    bool _2293 = isnan(_2283);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan(0.0);
    bool _2299 = _2295 || _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2303 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2301);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2307 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2305);
    float _2309 = 1.0 / _2289;
    float _2311 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2313 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2311);
    float _2315 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2317 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2315);
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2321 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2319);
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2325 = -_2261;
    float _2327 = fma(_2285, _2323, _2325);
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    float _2333 = 1.0 / _2313;
    bool _2335 = _2327 >= 0.0;
    bool _2337 = isnan(_2327);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.0);
    bool _2343 = _2339 || _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2347 = -_2261;
    float _2349 = fma(_2277, _2345, _2347);
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2353 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2351);
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2357 = -_2261;
    float _2359 = fma(_2309, _2355, _2357);
    bool _2361 = !_2343;
    float _2363 = _2361 ? 0.0 : 2.0;
    float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2367 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2365);
    bool _2369 = _2349 >= 0.0;
    bool _2371 = isnan(_2349);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    float _2381 = 1.0 / _2331;
    bool _2383 = !_2299;
    float _2385 = _2383 ? 0.0 : 2.0;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2389 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2387);
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2393 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2391);
    float _2395 = _2385 + _2379;
    bool _2397 = _2359 >= 0.0;
    bool _2399 = isnan(_2359);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = float(_2405);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2411 = -_2261;
    float _2413 = fma(_2333, _2409, _2411);
    float _2415 = 1.0 / _2367;
    float _2417 = _2395 + _2363;
    float _2419 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2421 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2419);
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2425 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2423);
    bool _2427 = _2413 >= 0.0;
    bool _2429 = isnan(_2413);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(0.0);
    bool _2435 = _2431 || _2433;
    float _2437 = float(_2435);
    float _2439 = _2417 + _2407;
    float _2441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2443 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2441);
    float _2445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2447 = -_2261;
    float _2449 = fma(_2381, _2445, _2447);
    float _2451 = 1.0 / _2303;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2459 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2457);
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2463 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2461);
    float _2465 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2467 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2465);
    float _2469 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2471 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2469);
    float _2473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2475 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2473);
    float _2477 = 1.0 / _2455;
    float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2481 = -_2261;
    float _2483 = fma(_2451, _2479, _2481);
    float _2485 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2487 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2485);
    float _2489 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2491 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2489);
    float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2495 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2493);
    float _2497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2499 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2497);
    bool _2501 = _2483 >= 0.0;
    bool _2503 = isnan(_2483);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    float _2511 = float(_2509);
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2515 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2513);
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2519 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2517);
    float _2521 = 1.0 / _2475;
    float _2523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2525 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2523);
    float _2527 = _2439 + _2511;
    float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2531 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2529);
    float _2533 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2535 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2533);
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2539 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2537);
    float _2541 = 1.0 / _2307;
    float _2543 = 1.0 / _2539;
    float _2545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2547 = -_2261;
    float _2549 = fma(_2541, _2545, _2547);
    bool _2551 = _2549 >= 0.0;
    bool _2553 = isnan(_2549);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    bool _2561 = !_2559;
    float _2563 = _2561 ? 0.0 : 2.0;
    float _2565 = _2527 + _2563;
    float _2567 = 1.0 / _2317;
    float _2569 = _2565 + _2437;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = -_2261;
    float _2575 = fma(_2567, _2571, _2573);
    bool _2577 = _2575 >= 0.0;
    bool _2579 = isnan(_2575);
    bool _2581 = _2577 || _2579;
    bool _2583 = isnan(0.0);
    bool _2585 = _2581 || _2583;
    float _2587 = 1.0 / _2321;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2591 = -_2261;
    float _2593 = fma(_2587, _2589, _2591);
    bool _2595 = _2593 >= 0.0;
    bool _2597 = isnan(_2593);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    bool _2605 = !_2585;
    float _2607 = _2605 ? 0.0 : 2.0;
    bool _2609 = !_2603;
    float _2611 = _2609 ? 0.0 : 2.0;
    float _2613 = _2569 + _2607;
    bool _2615 = _2449 >= 0.0;
    bool _2617 = isnan(_2449);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan(0.0);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2629 = -_2261;
    float _2631 = fma(_2415, _2627, _2629);
    float _2633 = _2613 + _2611;
    float _2635 = 1.0 / _2389;
    float _2637 = _2633 + _2625;
    float _2639 = 1.0 / _2353;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = -_2261;
    float _2645 = fma(_2635, _2641, _2643);
    bool _2647 = _2631 >= 0.0;
    bool _2649 = isnan(_2631);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = float(_2655);
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2661 = -_2261;
    float _2663 = fma(_2639, _2659, _2661);
    bool _2665 = _2663 >= 0.0;
    bool _2667 = isnan(_2663);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan(0.0);
    bool _2673 = _2669 || _2671;
    bool _2675 = !_2673;
    float _2677 = _2675 ? 0.0 : 2.0;
    float _2679 = _2637 + _2677;
    bool _2681 = _2645 >= 0.0;
    bool _2683 = isnan(_2645);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.0);
    bool _2689 = _2685 || _2687;
    float _2691 = float(_2689);
    float _2693 = _2679 + _2657;
    float _2695 = 1.0 / _2425;
    float _2697 = _2693 + _2691;
    float _2699 = 1.0 / _2393;
    float _2701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2703 = -_2261;
    float _2705 = fma(_2695, _2701, _2703);
    bool _2707 = _2705 >= 0.0;
    bool _2709 = isnan(_2705);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan(0.0);
    bool _2715 = _2711 || _2713;
    float _2717 = float(_2715);
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2721 = -_2261;
    float _2723 = fma(_2477, _2719, _2721);
    float _2725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2727 = -_2261;
    float _2729 = fma(_2699, _2725, _2727);
    bool _2731 = _2729 >= 0.0;
    bool _2733 = isnan(_2729);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan(0.0);
    bool _2739 = _2735 || _2737;
    bool _2741 = !_2739;
    float _2743 = _2741 ? 0.0 : 2.0;
    float _2745 = _2697 + _2743;
    float _2747 = 1.0 / _2421;
    float _2749 = _2745 + _2717;
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2753 = -_2261;
    float _2755 = fma(_2747, _2751, _2753);
    bool _2757 = _2755 >= 0.0;
    bool _2759 = isnan(_2755);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan(0.0);
    bool _2765 = _2761 || _2763;
    float _2767 = 1.0 / _2443;
    float _2769 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2771 = -_2261;
    float _2773 = fma(_2767, _2769, _2771);
    bool _2775 = _2773 >= 0.0;
    bool _2777 = isnan(_2773);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    bool _2785 = !_2765;
    float _2787 = _2785 ? 0.0 : 2.0;
    bool _2789 = !_2783;
    float _2791 = _2789 ? 0.0 : 2.0;
    float _2793 = _2749 + _2787;
    bool _2795 = _2723 >= 0.0;
    bool _2797 = isnan(_2723);
    bool _2799 = _2795 || _2797;
    bool _2801 = isnan(0.0);
    bool _2803 = _2799 || _2801;
    float _2805 = float(_2803);
    float _2807 = _2793 + _2791;
    float _2809 = _2807 + _2805;
    float _2811 = 1.0 / _2459;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2815 = -_2261;
    float _2817 = fma(_2811, _2813, _2815);
    bool _2819 = _2817 >= 0.0;
    bool _2821 = isnan(_2817);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan(0.0);
    bool _2827 = _2823 || _2825;
    float _2829 = 1.0 / _2463;
    float _2831 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2833 = -_2261;
    float _2835 = fma(_2829, _2831, _2833);
    bool _2837 = !_2827;
    float _2839 = _2837 ? 0.0 : 2.0;
    bool _2841 = _2835 >= 0.0;
    bool _2843 = isnan(_2835);
    bool _2845 = _2841 || _2843;
    bool _2847 = isnan(0.0);
    bool _2849 = _2845 || _2847;
    float _2851 = float(_2849);
    float _2853 = _2809 + _2839;
    float _2855 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2857 = -_2261;
    float _2859 = fma(_2521, _2855, _2857);
    float _2861 = 1.0 / _2467;
    float _2863 = _2853 + _2851;
    bool _2865 = _2859 >= 0.0;
    bool _2867 = isnan(_2859);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan(0.0);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = -_2261;
    float _2881 = fma(_2861, _2877, _2879);
    bool _2883 = _2881 >= 0.0;
    bool _2885 = isnan(_2881);
    bool _2887 = _2883 || _2885;
    bool _2889 = isnan(0.0);
    bool _2891 = _2887 || _2889;
    float _2893 = float(_2891);
    float _2895 = _2863 + _2893;
    float _2897 = 1.0 / _2471;
    float _2899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2901 = -_2261;
    float _2903 = fma(_2897, _2899, _2901);
    bool _2905 = _2903 >= 0.0;
    bool _2907 = isnan(_2903);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan(0.0);
    bool _2913 = _2909 || _2911;
    bool _2915 = !_2913;
    float _2917 = _2915 ? 0.0 : 2.0;
    float _2919 = _2895 + _2917;
    float _2921 = 1.0 / _2487;
    float _2923 = _2919 + _2875;
    float _2925 = 1.0 / _2525;
    float _2927 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2929 = -_2261;
    float _2931 = fma(_2921, _2927, _2929);
    bool _2933 = _2931 >= 0.0;
    bool _2935 = isnan(_2931);
    bool _2937 = _2933 || _2935;
    bool _2939 = isnan(0.0);
    bool _2941 = _2937 || _2939;
    float _2943 = 1.0 / _2491;
    float _2945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2947 = -_2261;
    float _2949 = fma(_2925, _2945, _2947);
    float _2951 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2953 = -_2261;
    float _2955 = fma(_2943, _2951, _2953);
    bool _2957 = _2955 >= 0.0;
    bool _2959 = isnan(_2955);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan(0.0);
    bool _2965 = _2961 || _2963;
    float _2967 = 1.0 / _2495;
    float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2971 = -_2261;
    float _2973 = fma(_2967, _2969, _2971);
    bool _2975 = _2973 >= 0.0;
    bool _2977 = isnan(_2973);
    bool _2979 = _2975 || _2977;
    bool _2981 = isnan(0.0);
    bool _2983 = _2979 || _2981;
    float _2985 = 1.0 / _2499;
    bool _2987 = !_2983;
    float _2989 = _2987 ? 0.0 : 3.0;
    float _2991 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2993 = -_2261;
    float _2995 = fma(_2985, _2991, _2993);
    bool _2997 = _2995 >= 0.0;
    bool _2999 = isnan(_2995);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    float _3007 = 1.0 / _2515;
    bool _3009 = !_3005;
    float _3011 = _3009 ? 0.0 : 3.0;
    float _3013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3015 = -_2261;
    float _3017 = fma(_3007, _3013, _3015);
    bool _3019 = _3017 >= 0.0;
    bool _3021 = isnan(_3017);
    bool _3023 = _3019 || _3021;
    bool _3025 = isnan(0.0);
    bool _3027 = _3023 || _3025;
    float _3029 = 1.0 / _2519;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3033 = -_2261;
    float _3035 = fma(_3029, _3031, _3033);
    bool _3037 = _3035 >= 0.0;
    bool _3039 = isnan(_3035);
    bool _3041 = _3037 || _3039;
    bool _3043 = isnan(0.0);
    bool _3045 = _3041 || _3043;
    bool _3047 = !_2965;
    float _3049 = _3047 ? 0.0 : 3.0;
    bool _3051 = _2949 >= 0.0;
    bool _3053 = isnan(_2949);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    bool _3061 = !_3045;
    float _3063 = _3061 ? 0.0 : 3.0;
    float _3065 = _3049 + _2989;
    bool _3067 = !_3027;
    float _3069 = _3067 ? 0.0 : 3.0;
    bool _3071 = !_3059;
    float _3073 = _3071 ? 0.0 : 3.0;
    float _3075 = _3065 + _3011;
    float _3077 = _3075 + _3069;
    bool _3079 = !_2941;
    float _3081 = _3079 ? 0.0 : 2.0;
    float _3083 = _3077 + _3063;
    float _3085 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3087 = _2923 + _3081;
    float _3089 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2241);
    float _3091 = _3083 + _3073;
    float _3093 = 1.0 / _2531;
    float _3095 = _3087 * 0.02857142873108386993408203125;
    float _3097 = precise::clamp(_3095, 0.0, 1.0);
    float _3099 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3089);
    float _3101 = _3099 + _1878;
    out.gl_Position.x = _1934;
    out.gl_Position.y = _1938;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _1878;
    float _3103 = 1.0 / _2535;
    float _3105 = _3101 * 0.5;
    out.m_70.z = _3105;
    out.m_70.w = _1878;
    float _3107 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3109 = -_2261;
    float _3111 = fma(_3093, _3107, _3109);
    float _3113 = exp2(_3085);
    bool _3115 = _3111 >= 0.0;
    bool _3117 = isnan(_3111);
    bool _3119 = _3115 || _3117;
    bool _3121 = isnan(0.0);
    bool _3123 = _3119 || _3121;
    float _3125 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3127 = -_2261;
    float _3129 = fma(_3103, _3125, _3127);
    float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3133 = -_2261;
    float _3135 = fma(_2543, _3131, _3133);
    bool _3137 = !_3123;
    float _3139 = _3137 ? 0.0 : 3.0;
    bool _3141 = _3129 >= 0.0;
    bool _3143 = isnan(_3129);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    bool _3151 = _3135 >= 0.0;
    bool _3153 = isnan(_3135);
    bool _3155 = _3151 || _3153;
    bool _3157 = isnan(0.0);
    bool _3159 = _3155 || _3157;
    float _3161 = _3091 + _3139;
    bool _3163 = !_3149;
    float _3165 = _3163 ? 0.0 : 3.0;
    float _3167 = -_3113;
    float _3169 = _3167 + 1.0;
    bool _3171 = !_3159;
    float _3173 = _3171 ? 0.0 : 5.0;
    float _3175 = _3161 + _3165;
    float _3177 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3179 = _3175 + _3173;
    float _3181 = _3177 * _2212;
    float _3183 = -_3177;
    float _3185 = _3183 + 1.0;
    float _3187 = _3179 * 0.14285714924335479736328125;
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = _2223 * _3181;
    float _3193 = _2233 * _3181;
    float _3195 = _3097 * _3189;
    float _3197 = fma(_2229, _3191, _2217);
    float _3199 = fma(_2231, _3191, _2219);
    float _3201 = _2223 * _3185;
    float _3203 = _3195 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3205 = fma(_2223, _3193, _2221);
    float _3207 = _3203 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _3197;
    out.m_72.y = _3199;
    out.m_72.z = _3205;
    out.m_72.w = _3201;
    out.m_49.x = _3207;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1480 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_46.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_49.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3264 = as_type<float>(_107);
        out.gl_Position.z = _3264;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_51.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = _125;
    if (_121)
    {
        float _131 = float(_91);
        _127 = _131;
    }
    float _133 = _127;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    if (_139)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _101;
    if (_139)
    {
        out.m_49.x = 0.0;
    }
    if (_139)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3333 = as_type<float>(_145);
        out.gl_Position.z = _3333;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _149 = int(_147);
    float _151 = float(_91);
    float _153 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _155 = int(_153);
    float _157 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _159 = float(_149);
    float _161 = 1.0 / _151;
    float _163 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _165 = float(uint(_155));
    float _167 = 1.0 / _159;
    int _169 = ~_155;
    int _171 = _169 + 1;
    bool _173 = _155 == 0;
    int _175 = ~_155;
    int _177 = _175 + 1;
    float _179 = 1.0 / _165;
    float _181 = _167 * _125;
    float _183 = trunc(_181);
    int _185 = int(_183);
    int _187 = as_type<int>(_179) + (-2);
    int _189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _191 = _189 != 0;
    float _193 = float(uint(_185));
    float _195 = as_type<float>(_187) * _193;
    int _197 = ~_155;
    int _199 = _197 + 1;
    float _201 = trunc(_195);
    float _203 = precise::max(_201, 0.0);
    uint _206 = uint(_203);
    float _208 = float(_155);
    int _210 = _199 * int(_206);
    int _212 = _210 + _185;
    float _214 = in.m_53.x;
    float _216 = in.m_53.y;
    float _218 = float(uint(_212));
    float _220 = as_type<float>(_187) * _218;
    float _222 = float(_185);
    float _224 = trunc(_220);
    float _226 = precise::max(_224, 0.0);
    uint _228 = uint(_226);
    int _230 = int(_206) + int(_228);
    bool _232 = _222 >= _208;
    bool _234 = isnan(_222);
    bool _236 = _232 || _234;
    bool _238 = isnan(_208);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    bool _244 = !_191;
    float _246 = _244 ? 7.345489978790283203125 : 1.0;
    int _248 = _171 * _230;
    int _250 = _248 + _185;
    float _252 = trunc(_242);
    int _254 = int(_252);
    float _256 = _246 * _214;
    bool _258 = uint(_250) >= uint(_155);
    bool _260 = !_258;
    int _262 = _260 ? 0 : (-1);
    float _264 = floor(_256);
    int _266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _268 = _266 != 0;
    int _270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _272 = _270 != 0;
    int _274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _276 = _274 != 0;
    int _278 = ~_230;
    int _280 = _278 + _262;
    int _282 = _280 + 1;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _290 = _288 != 0;
    int _292 = _155 * _282;
    int _294 = _292 + _185;
    int _296 = ~_254;
    int _298 = _296 + 1;
    int _300 = _298 + 1;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _304 = _302 != 0;
    bool _306 = !_173;
    int _308 = _306 ? _294 : (-1);
    float _310 = -_264;
    float _312 = _256 + _310;
    bool _314 = !_272;
    int _316 = _314 ? 0 : 1;
    int _318 = _308 * _300;
    int _320 = _155 + (-1);
    float _322 = _312 * _208;
    float _324 = _208 * _125;
    bool _326 = !_286;
    int _328 = _326 ? 0 : 1;
    float _330 = trunc(_322);
    int _332 = int(_330);
    float _334 = _324 * _161;
    int _336 = _254 * _320;
    int _338 = _336 + _318;
    bool _340 = !_268;
    int _342 = _340 ? 0 : 1;
    int _344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _346 = _344 != 0;
    int _348 = abs(_342);
    float _350 = trunc(_334);
    int _352 = int(_350);
    int _354 = abs(_316);
    bool _356 = !_276;
    int _358 = _356 ? 0 : 1;
    int _360 = abs(_328);
    int _362 = _338 * _354;
    bool _364 = !_346;
    int _366 = _364 ? 0 : 1;
    float _368 = as_type<float>(int(gl_VertexIndex));
    int _370 = abs(_358);
    int _372 = _332 * _360;
    int _374 = _372 + _185;
    int _376 = abs(_366);
    int _378 = _352 * _348;
    int _380 = _378 + _362;
    int _382 = ~_155;
    int _384 = _382 + 1;
    int _386 = _374 * _370;
    int _388 = _386 + _380;
    float _390 = float(uint(_374));
    bool _392 = _155 == 0;
    int _394 = _332 * _376;
    int _396 = _394 + _388;
    int _398 = ~_155;
    int _400 = _398 + 1;
    float _402 = as_type<float>(_187) * _390;
    int _404 = ~_155;
    int _406 = _404 + 1;
    float _408 = float(uint(_396));
    float _410 = trunc(_402);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    float _416 = as_type<float>(_187) * _408;
    float _418 = trunc(_416);
    float _420 = precise::max(_418, 0.0);
    uint _422 = uint(_420);
    int _424 = _406 * int(_414);
    int _426 = _424 + _374;
    float _428 = float(uint(_426));
    int _430 = _400 * int(_422);
    int _432 = _430 + _396;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _436 = float(uint(_432));
    float _438 = _434 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _440 = as_type<float>(_187) * _436;
    float _442 = trunc(_440);
    float _444 = precise::max(_442, 0.0);
    uint _446 = uint(_444);
    int _448 = int(_422) + int(_446);
    int _450 = _384 * _448;
    int _452 = _450 + _396;
    bool _454 = uint(_452) >= uint(_155);
    bool _456 = !_454;
    int _458 = _456 ? 0 : (-1);
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _462 = _460 != 0;
    int _464 = ~_448;
    int _466 = _464 + _458;
    int _468 = _466 + 1;
    float _470 = in.m_46.x;
    float _472 = in.m_46.y;
    float _474 = in.m_46.z;
    bool _476 = !_462;
    int _478 = _476 ? 0 : 1;
    int _480 = _155 * _468;
    int _482 = _480 + _396;
    float _484 = as_type<float>(_187) * _428;
    float _486 = _216 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _488 = !_392;
    int _490 = _488 ? _482 : (-1);
    float _492 = _214 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _494 = trunc(_484);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    float _500 = fma(_486, -2.0, _163);
    int _502 = _490 & 3;
    bool _504 = _502 != 0;
    float _506 = -_157;
    float _508 = fma(_492, 2.0, _506);
    int _510 = _490 & 3;
    bool _512 = _510 != 0;
    float _514 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _516 = uint(_502) > 1u;
    float _518 = -_125;
    float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[76].x, _508);
    int _522 = _512 ? 0 : 1;
    float _524 = _514 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _526 = as_type<int>(_368) & 1;
    bool _528 = _526 != 0;
    int _530 = as_type<int>(_368) & 2;
    bool _532 = _530 != 0;
    int _534 = ~_522;
    int _536 = _534 + 1;
    int _538 = _536 + 1;
    float _540 = _472 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _542 = _472 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _544 = _472 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = _214 * 2.0;
    int _548 = int(_414) + int(_498);
    float _550 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
    int _552 = _538;
    if (!_516)
    {
        int _554 = ~_522;
        int _556 = _554 + 1;
        _552 = _556;
    }
    int _558 = _552;
    float _560 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _542);
    bool _562 = uint(_502) >= 2u;
    float _564 = in.m_53.z;
    float _566 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _568 = _214 + _216;
    int _570 = _562 ? 0 : 1;
    float _572 = floor(_546);
    bool _574 = _502 != 3;
    int _576 = _177 * _548;
    int _578 = _576 + _374;
    int _580 = ~_570;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _568 + (-1.0);
    float _588 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[5].z, _560);
    float _590 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[6].z, _566);
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _594 = _490 >> 31;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _600 = _584;
    if (_574)
    {
        int _602 = ~_570;
        int _604 = _602 + 1;
        _600 = _604;
    }
    int _606 = _600;
    float _608 = _592 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _612 = _596 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _614 = uint(_578) >= uint(_155);
    float _616 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _618 = _594 & 3;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _622 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _624 = !_528;
    float _626 = _624 ? (-0.5) : 0.5;
    float _628 = _564 * 2.0;
    int _630 = _490 + _618;
    float _632 = _620 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _608;
    out.m_58.y = _612;
    out.m_58.z = _622;
    out.m_58.w = _610;
    bool _634 = _572 > 0.0;
    float _636 = floor(_628);
    int _638 = _630 >> 2;
    out.m_60.x = _438;
    out.m_60.y = _632;
    out.m_60.z = _524;
    bool _640 = !_532;
    float _642 = _640 ? (-0.5) : 0.5;
    bool _644 = _214 > 0.5;
    bool _646 = !_614;
    int _648 = _646 ? 0 : (-1);
    float _650 = _216 * 2.0;
    bool _652 = _572 >= 0.0;
    bool _654 = isnan(_572);
    bool _656 = _652 || _654;
    bool _658 = isnan(0.0);
    bool _660 = _656 || _658;
    float _662 = _216 + _564;
    int _664 = _638 << 4;
    int _666 = _664 + 368;
    float _668 = floor(_650);
    float _670 = _662 + (-1.0);
    int _672 = ~_548;
    int _674 = _672 + _648;
    int _676 = _674 + 1;
    uint _678 = uint(int(uint(_666) >> uint(2)));
    uint _680 = uint(int(uint(int(_678)) >> uint(2)));
    int _682 = int(_678) & 3;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[int(_680)][_682];
    int _686 = int(_678) + 1;
    uint _688 = uint(int(uint(_686) >> uint(2)));
    int _690 = _686 & 3;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[int(_688)][_690];
    float _694 = -_626;
    int _696 = _644 ? as_type<int>(_694) : as_type<int>(_626);
    float _698 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _700 = _216 > 0.5;
    int _702 = _155 * _676;
    int _704 = _702 + _374;
    int _706 = _660 ? 0 : 1;
    float _708 = -_642;
    int _710 = _700 ? as_type<int>(_708) : as_type<int>(_642);
    int _712 = _666 + 8;
    uint _714 = uint(int(uint(_712) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[int(_724)][_726];
    bool _730 = !_290;
    float _732 = _730 ? _626 : as_type<float>(_696);
    bool _734 = !_304;
    float _736 = _734 ? _642 : as_type<float>(_710);
    bool _738 = _668 > 0.0;
    bool _740 = _668 >= 0.0;
    bool _742 = isnan(_668);
    bool _744 = _740 || _742;
    bool _746 = isnan(0.0);
    bool _748 = _744 || _746;
    bool _750 = _502 != 3;
    int _752 = ~_706;
    int _754 = _752 + 1;
    int _756 = _754 + 1;
    int _758 = _756;
    float _760 = _732;
    if (!_634)
    {
        int _762 = ~_706;
        int _764 = _762 + 1;
        _758 = _764;
    }
    int _766 = _758;
    float _768 = _732 + 0.5;
    bool _770 = !_392;
    int _772 = _770 ? _704 : (-1);
    bool _774 = !_504;
    int _776 = _774 ? 0 : 1;
    int _778 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _780 = _778 != 0;
    int _782 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _784 = _782 != 0;
    int _786 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _788 = _786 != 0;
    float _790 = fma(_474, (*spvDescriptorSet0.vp_c10)._m0[4].z, _550);
    int _792 = abs(_558);
    float _794 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[80].x, _520);
    bool _796 = !_750;
    int _798 = _796 ? 0 : (-1);
    float _800 = _588 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _802 = _636 > 0.0;
    float _804 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _500);
    bool _806 = _636 >= 0.0;
    bool _808 = isnan(_636);
    bool _810 = _806 || _808;
    bool _812 = isnan(0.0);
    bool _814 = _810 || _812;
    float _816 = _736 + (-0.5);
    int _818 = abs(_776);
    float _820 = _790 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _822 = abs(_606);
    float _824 = -_816;
    float _826 = -_804;
    float _828 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[80].y, _826);
    int _830 = ~_792;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _838 = _800 + _836;
    int _840 = ~_818;
    int _842 = _840 + 1;
    int _844 = _842 + 1;
    float _846 = _590 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _850 = _820 + _848;
    int _852 = abs(_798);
    int _854 = _834 * as_type<int>(_692);
    int _856 = ~_822;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    float _862 = _838 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _864 = abs(_478);
    int _866 = _844 * as_type<int>(_684);
    int _868 = _866 + _854;
    float _870 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _872 = _846 + _870;
    int _874 = _860 * as_type<int>(_720);
    int _876 = _874 + _868;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _880 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _882 = log2(_880);
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _886 = ~_852;
    int _888 = _886 + 1;
    int _890 = _888 + 1;
    float _892 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[28].x, _862);
    float _894 = fma(_214, (*spvDescriptorSet0.vp_c9)._m0[78].z, _878);
    float _896 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[78].w, _884);
    int _898 = ~_864;
    int _900 = _898 + 1;
    int _902 = _900 + 1;
    float _904 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[28].z, _892);
    int _906 = _890 * as_type<int>(_728);
    int _908 = _906 + _876;
    float _910 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _894);
    float _912 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _896);
    float _914 = _838 * _838;
    int _916 = _748 ? 0 : 1;
    int _918 = _908 * _902;
    bool _920 = _904 >= 0.0;
    float _922 = -_910;
    float _924 = _922 + 1.0;
    float _926 = -_912;
    float _928 = _926 + 1.0;
    float _930 = _882 * _125;
    int _932 = _814 ? 0 : 1;
    float _934 = fma(_850, _850, _914);
    int _936 = _772 * _864;
    int _938 = _936 + _918;
    int _940 = ~_916;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = -_924;
    float _948 = fma(_732, _946, _794);
    int _950 = _944;
    float _952 = _850;
    float _954 = _800;
    if (!_738)
    {
        int _956 = ~_916;
        int _958 = _956 + 1;
        _950 = _958;
    }
    int _960 = _950;
    float _962 = fma(_736, _928, _828);
    int _964 = ~_932;
    int _966 = _964 + 1;
    int _968 = _966 + 1;
    float _970 = fma(_872, _872, _934);
    float _972 = exp2(_930);
    int _974 = _968;
    if (!_802)
    {
        int _976 = ~_932;
        int _978 = _976 + 1;
        _974 = _978;
    }
    int _980 = _974;
    float _982 = in.m_62.x;
    float _984 = in.m_62.y;
    float _986 = in.m_62.z;
    if (_920)
    {
        _760 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _988 = _760;
    bool _990 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _992 = isnan(1.0);
    bool _994 = _990 || _992;
    bool _996 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _998 = _994 || _996;
    float _1000 = rsqrt(_970);
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1004 = 1.0 + _1002;
    int _1006 = as_type<int>(_988);
    if (_920)
    {
        float _1008 = _988 * 5.0;
        _1006 = as_type<int>(_1008);
    }
    int _1010 = _1006;
    float _1012 = float(_938);
    out.m_64.x = _948;
    out.m_64.y = _962;
    bool _1014 = !_784;
    int _1016 = _1014 ? 0 : 1;
    bool _1018 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1020 = isnan(0.0);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1026 = _1022 || _1024;
    float _1028 = 1.0 / _1004;
    if (_920)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4621 = as_type<float>(_1010);
        out.gl_Position.z = _4621;
    }
    float _1030 = -_972;
    float _1032 = _1030 + 1.0;
    int _1034 = abs(_1016);
    out.m_66.x = _1012;
    float _1036 = _1026 ? _1032 : 0.0;
    float _1038 = _850 * _1000;
    if (_920)
    {
        out.m_49.x = 0.0;
    }
    bool _1040 = !_788;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = _838 * _1000;
    bool _1046 = !_780;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = abs(_1042);
    int _1052 = abs(_1048);
    if (_920)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1054 = -_1044;
    float _1056 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[18].w, _800);
    float _1058 = _872 * _1000;
    float _1060 = -_1038;
    float _1062 = fma(_1060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _820);
    float _1064 = float(_1052);
    float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1068 = _1056 + _1066;
    float _1070 = float(_980);
    if (_998)
    {
        float _1072 = _1036 * _1028;
        _129 = _1072;
    }
    float _1074 = _129;
    float _1076 = float(_766);
    float _1078 = -_1058;
    float _1080 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[18].w, _846);
    float _1082 = float(_960);
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1062 + _1084;
    float _1088 = _1068 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1090 = _1064 * _1070;
    float _1092 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1094 = _1080 + _1092;
    float _1096 = float(_1034);
    float _1098 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1088);
    float _1100 = _1090 * (-2.0);
    float _1102 = _214 + (-0.5);
    float _1104 = _216 + (-0.5);
    float _1106 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1098);
    float _1108 = _1096 * _1076;
    float _1110 = fma(_1100, _982, _982);
    float _1112 = fma(_616, _1100, _616);
    float _1114 = -_1044;
    float _1116 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[18].w, _838);
    bool _1118 = _1106 >= 0.0;
    float _1120 = _1108 * (-2.0);
    float _1122 = fma(_1102, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1110);
    float _1124 = _1116 * _1116;
    float _1126 = float(_1050);
    float _1128 = fma(_1120, _984, _984);
    float _1130 = fma(_1112, _1074, _1122);
    float _1132 = fma(_698, _1120, _698);
    float _1134 = _214 + _564;
    float _1136 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1128);
    float _1138 = _1130 * 0.15915493667125701904296875;
    float _1140 = -_1038;
    float _1142 = fma(_1140, (*spvDescriptorSet0.vp_c9)._m0[18].w, _850);
    if (_1118)
    {
        _952 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1144 = _952;
    float _1146 = fma(_1132, _1074, _1136);
    float _1148 = _1138 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    int _1152 = as_type<int>(_1144);
    if (_1118)
    {
        out.m_49.x = 0.0;
    }
    float _1154 = _1126 * _1082;
    if (_1118)
    {
        float _1156 = _1144 * 5.0;
        _1152 = as_type<int>(_1156);
    }
    int _1158 = _1152;
    float _1160 = fma(_1142, _1142, _1124);
    float _1162 = _1134 + (-1.0);
    float _1164 = _1146 * 0.15915493667125701904296875;
    float _1166 = _1138 * 6.283185482025146484375;
    float _1168 = cos(_1166);
    if (_1118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4856 = as_type<float>(_1158);
        out.gl_Position.z = _4856;
    }
    if (_1118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1170 = in.m_68.x;
    float _1172 = in.m_68.y;
    float _1174 = -_1058;
    float _1176 = fma(_1174, (*spvDescriptorSet0.vp_c9)._m0[18].w, _872);
    float _1178 = _1154 * (-2.0);
    float _1180 = fma(_1162, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1182 = _564 + (-0.5);
    float _1184 = fma(_1176, _1176, _1160);
    float _1186 = fma(_1178, _986, _986);
    float _1188 = fma(_1180, _1178, _1180);
    float _1190 = _1164 * 6.283185482025146484375;
    float _1192 = sin(_1190);
    float _1194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _642);
    float _1196 = fma(_1182, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1186);
    float _1198 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _626);
    float _1200 = fma(_1188, _1074, _1196);
    float _1202 = sqrt(_1184);
    float _1204 = _1200 * 0.15915493667125701904296875;
    float _1206 = _1172 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1208 = _1164 * 6.283185482025146484375;
    float _1210 = cos(_1208);
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1214 = _1206 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1216 = _1000 * _1202;
    float _1218 = _1204 * 6.283185482025146484375;
    float _1220 = sin(_1218);
    float _1222 = _1216 * _1214;
    float _1224 = _1194 * _1222;
    float _1226 = _1204 * 6.283185482025146484375;
    float _1228 = cos(_1226);
    float _1230 = _1212 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1232 = _1150 * _1192;
    float _1234 = _1168 * _1210;
    float _1236 = _1216 * _1230;
    float _1238 = fma(_1220, _1234, _1232);
    float _1240 = _1198 * _1236;
    float _1242 = _1168 * _1192;
    float _1244 = _1228 * _1224;
    float _1246 = _1192 * _1228;
    float _1248 = _1210 * _1228;
    float _1250 = _1150 * _1210;
    float _1252 = _1168 * _1244;
    float _1254 = _1216 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1256 = _1254 * 0.5;
    float _1258 = -_1224;
    float _1260 = _1220 * _1258;
    float _1262 = _1150 * _1244;
    float _1264 = fma(_1238, _1240, _1252);
    float _1266 = -_1250;
    float _1268 = fma(_1220, _1242, _1266);
    float _1270 = -_1242;
    float _1272 = fma(_1220, _1250, _1270);
    float _1274 = fma(_1248, _1240, _1260);
    float _1276 = fma(_1220, _1232, _1234);
    float _1278 = fma(_1268, _1256, _1264);
    float _1280 = fma(_1272, _1240, _1262);
    float _1282 = fma(_1246, _1256, _1274);
    float _1284 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1286 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1288 = fma(_1276, _1256, _1280);
    float _1290 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1284);
    float _1292 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1286);
    float _1294 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1290);
    float _1296 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1292);
    float _1298 = _1294 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1300 = _1296 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1302 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1304 = _820 + _1298;
    float _1306 = _846 + _1300;
    float _1308 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1302);
    float _1310 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1312 = _1304 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1316 = _1306 + _1314;
    float _1318 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1308);
    float _1320 = _1312 * _1312;
    float _1322 = _1316 * _1316;
    float _1324 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1326 = _1320 + _1322;
    float _1328 = _800 + _1324;
    float _1330 = sqrt(_1326);
    bool _1332 = _1330 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1334 = _1324;
    float _1336 = _1320;
    float _1338 = _1318;
    float _1340 = _1288;
    float _1342 = _1322;
    float _1344 = _1304;
    float _1346 = _1328;
    if (!_1332)
    {
        _1334 = _1320;
    }
    float _1348 = _1334;
    float _1350 = _1348;
    if (!_1332)
    {
        _1336 = _1304;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (!_1332)
    {
        _1338 = _1306;
    }
    float _1356 = _1338;
    float _1358 = _1356;
    if (!_1332)
    {
        _1340 = _1328;
    }
    float _1360 = _1340;
    bool _1362 = !_1332;
    float _1364 = _1360;
    if (!_1362)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1368 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1370 = _1330 + _1368;
        float _1372 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = rsqrt(_1326);
        float _1376 = _1370 * _1366;
        float _1378 = _1376 * 0.15915493667125701904296875;
        float _1380 = _1378 * 6.283185482025146484375;
        float _1382 = sin(_1380);
        float _1384 = _1378 * 6.283185482025146484375;
        float _1386 = cos(_1384);
        float _1388 = fma(_1382, _1372, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1390 = _1374 * _1388;
        float _1392 = _1386 + (-1.0);
        float _1394 = fma(_1312, _1390, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1396 = fma(_1316, _1390, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1398 = _1392 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1400 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1402 = _1394 + _1400;
        float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1406 = _1396 + _1404;
        float _1408 = fma(_1328, _1386, _1398);
        float _1410 = _1402 * _1402;
        float _1412 = _1406 * _1406;
        _1364 = _1408;
        _1350 = _1410;
        _1342 = _1412;
        _1354 = _1394;
        _1358 = _1396;
    }
    float _1414 = _1364;
    float _1416 = _1350;
    float _1418 = _1342;
    float _1420 = _1354;
    float _1422 = _1358;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1426 = _1414 + _1424;
    float _1428 = fma(_1426, _1426, _1416);
    float _1430 = _1428 + _1418;
    float _1432 = sqrt(_1430);
    bool _1434 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1436 = isnan(_1432);
    bool _1438 = _1434 || _1436;
    bool _1440 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1442 = _1438 || _1440;
    float _1444 = _1416;
    if (!_1442)
    {
        _1444 = 1.0;
    }
    float _1446 = _1444;
    bool _1448 = !_1442;
    float _1450 = _1446;
    if (!_1448)
    {
        bool _1452 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1454 = isnan(_1432);
        bool _1456 = _1452 || _1454;
        bool _1458 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1460 = _1456 || _1458;
        if (!_1460)
        {
            float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1464 = _1432 + _1462;
            float _1466 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1468 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1466;
            float _1470 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1472 = _1470 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1474 = 1.0 / _1468;
            float _1476 = _1464 * _1474;
            float _1478 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1450 = _1478;
            _1344 = _1474;
            _1480 = true;
        }
        else
        {
            bool _1482 = _1432 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1484 = isnan(_1432);
            bool _1486 = _1482 || _1484;
            bool _1488 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1490 = _1486 || _1488;
            if (!_1490)
            {
                float _1492 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1494 = _1432 + _1492;
                float _1496 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1498 = _1496 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1500 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1502 = _1500 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1504 = 1.0 / _1498;
                float _1506 = _1494 * _1504;
                float _1508 = fma(_1506, _1502, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1450 = _1508;
                _1344 = _1504;
                _1480 = true;
            }
            else
            {
                _1450 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1480 = false;
    float _1510 = _1450;
    float _1512 = _1344;
    float _1514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1516 = _1420 + _1514;
    float _1518 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1520 = _1414 + _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1524 = _1422 + _1522;
    bool _1526 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan(0.5);
    bool _1534 = _1530 || _1532;
    float _1536 = fma(_1516, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1538 = fma(_1520, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1540 = fma(_1524, _1510, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1542 = -_1038;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1536);
    float _1546 = -_1044;
    float _1548 = fma(_1546, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1538);
    float _1550 = -_1058;
    float _1552 = fma(_1550, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1540);
    float _1554 = _1548;
    float _1556 = _1544;
    float _1558 = _1552;
    float _1560 = _1512;
    if (!_1534)
    {
        float _1562 = _1068 * _1068;
        float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1566 = -_800;
        float _1568 = _1566 + _1538;
        float _1570 = -_846;
        float _1572 = _1570 + _1540;
        float _1574 = fma(_1086, _1086, _1562);
        float _1576 = fma(_1094, _1094, _1574);
        float _1578 = 1.0 / _1216;
        float _1580 = sqrt(_1576);
        float _1582 = precise::min(_1580, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1584 = _1582 * _1564;
        float _1586 = -_820;
        float _1588 = _1586 + _1536;
        float _1590 = _1584 * _1578;
        float _1592 = fma(_1588, _1590, _1062);
        float _1594 = fma(_1568, _1590, _1056);
        float _1596 = fma(_1572, _1590, _1080);
        _1554 = _1594;
        _1556 = _1592;
        _1558 = _1596;
        _954 = _1568;
    }
    float _1598 = _1554;
    float _1600 = _1556;
    float _1602 = _1558;
    float _1604 = _954;
    float _1606 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1608 = _1598 + _1606;
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1600 + _1610;
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1616 = _1602 + _1614;
    float _1618 = _1608 * _1608;
    float _1620 = fma(_1612, _1612, _1618);
    float _1622 = fma(_1616, _1616, _1620);
    float _1624 = rsqrt(_1622);
    float _1626 = sqrt(_1622);
    float _1628 = _1624 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1630 = _1612 * _1628;
    float _1632 = _1616 * _1628;
    float _1634 = _1630 * _1630;
    float _1636 = _1632 * _1632;
    float _1638 = _1634 + _1636;
    float _1640 = sqrt(_1638);
    bool _1642 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1644 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = _1640 + _1644;
    float _1648 = _1624;
    float _1650 = _1638;
    float _1652 = _1646;
    float _1654 = _1608;
    float _1656 = _1604;
    if (_1642)
    {
        float _1658 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1648 = _1658;
    }
    float _1660 = _1648;
    if (_1642)
    {
        float _1662 = rsqrt(_1638);
        _1650 = _1662;
    }
    float _1664 = _1650;
    if (_1642)
    {
        float _1666 = _1646 * _1660;
        _1652 = _1666;
    }
    float _1668 = _1652;
    if (_1642)
    {
        float _1670 = _1668 * 0.15915493667125701904296875;
        _1346 = _1670;
    }
    float _1672 = _1346;
    float _1674 = _1616;
    if (_1642)
    {
        float _1676 = _1672 * 6.283185482025146484375;
        float _1678 = sin(_1676);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1684 = precise::max(0.0, _1682);
    float _1686 = _1660;
    float _1688 = _1684;
    if (_1642)
    {
        float _1690 = _1672 * 6.283185482025146484375;
        float _1692 = cos(_1690);
        _1686 = _1692;
    }
    float _1694 = _1686;
    float _1696 = -_1628;
    float _1698 = -_1684;
    float _1700 = fma(_1608, _1696, _1698);
    if (_1642)
    {
        float _1702 = _1700 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1654 = _1702;
    }
    float _1704 = _1654;
    float _1706 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1708 = _1680;
    float _1710 = _1704;
    if (_1642)
    {
        float _1712 = fma(_1680, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1560 = _1712;
    }
    float _1714 = _1560;
    float _1716 = _1714;
    if (!_1642)
    {
        _1708 = _1630;
    }
    float _1718 = _1708;
    float _1720 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1706);
    float _1722 = _1718;
    if (!_1642)
    {
        _1710 = _1700;
    }
    float _1724 = _1710;
    float _1726 = _1724;
    float _1728 = _1694;
    if (_1642)
    {
        float _1730 = _1694 + (-1.0);
        _1688 = _1730;
    }
    float _1732 = _1688;
    float _1734 = _1732;
    if (_1642)
    {
        float _1736 = _1664 * _1714;
        _1716 = _1736;
    }
    float _1738 = _1716;
    float _1740 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[9].y;
    float _1742 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1720);
    if (_1642)
    {
        float _1744 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1744;
    }
    float _1746 = _1656;
    float _1748 = _1746;
    if (_1642)
    {
        float _1750 = _1630 * _1738;
        _1722 = _1750;
    }
    float _1752 = _1722;
    if (!_1642)
    {
        _1734 = _1632;
    }
    float _1754 = _1734;
    float _1756 = _1754;
    if (_1642)
    {
        float _1758 = _1632 * _1738;
        _1756 = _1758;
    }
    float _1760 = _1756;
    if (_1642)
    {
        float _1762 = fma(_1700, _1694, _1746);
        _1726 = _1762;
    }
    float _1764 = _1726;
    if (!_1642)
    {
        _1748 = _1634;
    }
    float _1766 = _1748;
    float _1768 = _1766;
    if (_1642)
    {
        float _1770 = _1752 * _1752;
        _1768 = _1770;
    }
    float _1772 = _1768;
    if (!_1642)
    {
        _1728 = _1636;
    }
    float _1774 = _1728;
    float _1776 = _1774;
    if (_1642)
    {
        float _1778 = _1760 * _1760;
        _1776 = _1778;
    }
    float _1780 = _1776;
    float _1782 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[9].x, _1740);
    float _1784 = fma(_1764, _1764, _1772);
    float _1786 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1788 = _1784 + _1780;
    float _1790 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[9].z, _1782);
    float _1792 = _1742 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1794 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1796 = fma(_1626, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1794);
    float _1798 = precise::clamp(_1796, 0.0, 1.0);
    float _1800 = rsqrt(_1788);
    float _1802 = _1790 + (*spvDescriptorSet0.vp_c8)._m0[9].w;
    float _1804 = _1792 * 0.5;
    float _1806 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1808 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1786);
    float _1810 = fma(_1802, -0.5, _1804);
    float _1812 = -_1798;
    float _1814 = _1812 + 1.0;
    float _1816 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1818 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1820 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1806);
    float _1822 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1808);
    float _1824 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1816);
    float _1826 = abs(_1814);
    float _1828 = log2(_1826);
    float _1830 = fma(_1600, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1818);
    float _1832 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1820);
    float _1834 = _1800 * _1752;
    float _1836 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1824);
    float _1838 = _1800 * _1764;
    float _1840 = _1800 * _1760;
    float _1842 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1844 = _1836 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1846 = fma(_1602, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1830);
    float _1848 = _1832 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1850 = -_1842;
    float _1852 = fma(_1838, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1850);
    float _1854 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1856 = _1822 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1858 = -_1840;
    float _1860 = fma(_1858, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1852);
    float _1862 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1854);
    float _1866 = _1846 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1868 = fma(_1860, -0.5, 0.5);
    float _1870 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1864);
    float _1872 = exp2(_1862);
    float _1874 = fma(_1860, 0.5, 0.5);
    float _1876 = _1838 + 1.0;
    float _1878 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1870);
    float _1880 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1882 = fma(_1874, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1884 = _1856 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1886 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1810);
    float _1888 = sqrt(_1868);
    float _1890 = fma(_1874, _1882, -0.212114393711090087890625);
    float _1892 = -_1884;
    float _1894 = fma(_1892, _1880, 1.0);
    float _1896 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1898 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1900 = fma(_1874, _1890, 1.570728778839111328125);
    float _1902 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1904 = _1810 + _1902;
    float _1906 = _1810 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _1908 = -_1838;
    float _1910 = fma(_1872, _1876, _1908);
    float _1912 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[8].y;
    float _1914 = 1.0 / _1878;
    float _1916 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1896);
    float _1918 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1898);
    float _1920 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[8].x, _1912);
    float _1922 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1810);
    float _1924 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1916);
    float _1926 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1918);
    float _1928 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[8].z, _1920);
    float _1930 = 1.0 / _1792;
    float _1932 = _1888 * 0.636619746685028076171875;
    float _1934 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1924);
    float _1936 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[8].w;
    float _1938 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1926);
    float _1940 = -_1900;
    float _1942 = fma(_1932, _1940, 1.0);
    float _1944 = fma(_1910, 0.5, 0.5);
    float _1946 = _1936 + _1792;
    float _1948 = _1934 * _1914;
    float _1950 = _1938 * _1914;
    float _1952 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1810);
    float _1954 = _1946 * 0.5;
    float _1956 = fma(_1948, 0.5, 0.5);
    float _1958 = fma(_1950, -0.5, 0.5);
    float _1960 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1810);
    float _1962 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4899999797344207763671875, _1810);
    float _1964 = _1810 * _1930;
    float _1966 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1810);
    float _1968 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1810);
    float _1970 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1810);
    float _1972 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.2800000011920928955078125, _1810);
    float _1974 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1810);
    float _1976 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1810);
    float _1978 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1810);
    float _1980 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1810);
    float _1982 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1810);
    float _1984 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1810);
    float _1986 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1810);
    float _1988 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1810);
    float _1990 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1810);
    float _1992 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1810);
    float _1994 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1810);
    float _1996 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1810);
    float _1998 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1810);
    float _2000 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.800000011920928955078125, _1954);
    float _2002 = _1960 * _1930;
    float _2004 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.699999988079071044921875, _1954);
    float _2006 = -(*spvDescriptorSet0.vp_c9)._m0[139].y;
    float _2008 = _1954 + _2006;
    float _2010 = _2000 * _1930;
    float _2012 = _1886 * _1930;
    float _2014 = _2004 * _1930;
    float _2016 = _2008 * _1930;
    float _2018 = _1904 * _1930;
    float _2020 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.800000011920928955078125, _1954);
    float2 _6299 = float2(_2010, _2002);
    float _2022 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6299, float2(0.0), isnan(_6299)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6299, float2(0.0), isnan(_6299)), level(0.0)).x;
    float2 _6309 = float2(_2014, _2012);
    float _2024 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6309, float2(0.0), isnan(_6309)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6309, float2(0.0), isnan(_6309)), level(0.0)).x;
    float _2026 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.560000002384185791015625, _1954);
    float2 _6321 = float2(_2016, _1964);
    float _2028 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6321, float2(0.0), isnan(_6321)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6321, float2(0.0), isnan(_6321)), level(0.0)).x;
    float _2030 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.699999988079071044921875, _1954);
    float _2032 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4899999797344207763671875, _1954);
    float _2034 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.560000002384185791015625, _1954);
    float _2036 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.319999992847442626953125, _1954);
    float _2038 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4000000059604644775390625, _1954);
    float _2040 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.2800000011920928955078125, _1954);
    float _2042 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4000000059604644775390625, _1954);
    float _2044 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.319999992847442626953125, _1954);
    float _2046 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.23999999463558197021484375, _1954);
    float _2048 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.23999999463558197021484375, _1954);
    float _2050 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.4799999892711639404296875, _1954);
    float _2052 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.4799999892711639404296875, _1954);
    float _2054 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.100000001490116119384765625, _1954);
    float _2056 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.100000001490116119384765625, _1954);
    float _2058 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, 0.20000000298023223876953125, _1954);
    float _2060 = fma((*spvDescriptorSet0.vp_c9)._m0[139].y, -0.20000000298023223876953125, _1954);
    float _2062 = _1954 * _1930;
    float _2064 = _1906 * _1930;
    float _2066 = _1922 * _1930;
    float _2068 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[139].y;
    float2 _6406 = float2(_2062, _2018);
    float _2070 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6406, float2(0.0), isnan(_6406)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6406, float2(0.0), isnan(_6406)), level(0.0)).x;
    float _2072 = _2020 * _1930;
    float _2074 = _1952 * _1930;
    float2 _6420 = float2(_2062, _2064);
    float _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6420, float2(0.0), isnan(_6420)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6420, float2(0.0), isnan(_6420)), level(0.0)).x;
    float2 _6428 = float2(_2014, _2066);
    float _2078 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6428, float2(0.0), isnan(_6428)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6428, float2(0.0), isnan(_6428)), level(0.0)).x;
    float _2080 = _2068 * _1930;
    float _2082 = _2026 * _1930;
    float _2084 = _1962 * _1930;
    float _2086 = _2030 * _1930;
    float _2088 = _1966 * _1930;
    float _2090 = log2(_1894);
    float2 _6453 = float2(_2080, _1964);
    float _2092 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6453, float2(0.0), isnan(_6453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6453, float2(0.0), isnan(_6453)), level(0.0)).x;
    float2 _6461 = float2(_2072, _2074);
    float _2094 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6461, float2(0.0), isnan(_6461)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6461, float2(0.0), isnan(_6461)), level(0.0)).x;
    float2 _6469 = float2(_2082, _2084);
    float _2096 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6469, float2(0.0), isnan(_6469)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6469, float2(0.0), isnan(_6469)), level(0.0)).x;
    float2 _6477 = float2(_2086, _1964);
    float _2098 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6477, float2(0.0), isnan(_6477)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6477, float2(0.0), isnan(_6477)), level(0.0)).x;
    float _2100 = _2032 * _1930;
    float _2102 = _1994 * _1930;
    float _2104 = _1968 * _1930;
    float _2106 = _2034 * _1930;
    float2 _6497 = float2(_2100, _2088);
    float _2108 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6497, float2(0.0), isnan(_6497)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6497, float2(0.0), isnan(_6497)), level(0.0)).x;
    float2 _6505 = float2(_2062, _2002);
    float _2110 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6505, float2(0.0), isnan(_6505)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6505, float2(0.0), isnan(_6505)), level(0.0)).x;
    float _2112 = _1970 * _1930;
    float _2114 = _1998 * _1930;
    float _2116 = _2036 * _1930;
    float _2118 = _1972 * _1930;
    float _2120 = _1974 * _1930;
    float _2122 = _2090 * 0.693147182464599609375;
    float _2124 = _1996 * _1930;
    float _2126 = _2038 * _1930;
    float2 _6537 = float2(_2062, _2074);
    float _2128 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6537, float2(0.0), isnan(_6537)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6537, float2(0.0), isnan(_6537)), level(0.0)).x;
    float2 _6545 = float2(_2100, _2104);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6545, float2(0.0), isnan(_6545)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6545, float2(0.0), isnan(_6545)), level(0.0)).x;
    float _2132 = _2122 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2134 = _2040 * _1930;
    float2 _6560 = float2(_2014, _1964);
    float _2136 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6560, float2(0.0), isnan(_6560)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6560, float2(0.0), isnan(_6560)), level(0.0)).x;
    float2 _6568 = float2(_2106, _2112);
    float _2138 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6568, float2(0.0), isnan(_6568)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6568, float2(0.0), isnan(_6568)), level(0.0)).x;
    float _2140 = _1978 * _1930;
    float _2142 = _1976 * _1930;
    float _2144 = _1980 * _1930;
    float _2146 = _1992 * _1930;
    float _2148 = _2042 * _1930;
    float2 _6591 = float2(_2116, _2118);
    float _2150 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6591, float2(0.0), isnan(_6591)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6591, float2(0.0), isnan(_6591)), level(0.0)).x;
    float2 _6599 = float2(_2126, _1964);
    float _2152 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6599, float2(0.0), isnan(_6599)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6599, float2(0.0), isnan(_6599)), level(0.0)).x;
    float2 _6607 = float2(_2134, _2120);
    float _2154 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6607, float2(0.0), isnan(_6607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6607, float2(0.0), isnan(_6607)), level(0.0)).x;
    float2 _6615 = float2(_2062, _2142);
    float _2156 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6615, float2(0.0), isnan(_6615)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6615, float2(0.0), isnan(_6615)), level(0.0)).x;
    float2 _6623 = float2(_2062, _2140);
    float _2158 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6623, float2(0.0), isnan(_6623)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6623, float2(0.0), isnan(_6623)), level(0.0)).x;
    float2 _6631 = float2(_2134, _2144);
    float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6631, float2(0.0), isnan(_6631)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6631, float2(0.0), isnan(_6631)), level(0.0)).x;
    float2 _6639 = float2(_2148, _1964);
    float _2162 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6639, float2(0.0), isnan(_6639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6639, float2(0.0), isnan(_6639)), level(0.0)).x;
    float _2164 = _2044 * _1930;
    float _2166 = _2046 * _1930;
    float _2168 = _1982 * _1930;
    float _2170 = _2048 * _1930;
    float _2172 = _1984 * _1930;
    float _2174 = _2050 * _1930;
    float _2176 = _1986 * _1930;
    float _2178 = _2052 * _1930;
    float _2180 = _1988 * _1930;
    float _2182 = _2054 * _1930;
    float _2184 = _1990 * _1930;
    float _2186 = _2056 * _1930;
    float2 _6683 = float2(_2164, _2168);
    float _2188 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6683, float2(0.0), isnan(_6683)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6683, float2(0.0), isnan(_6683)), level(0.0)).x;
    float2 _6691 = float2(_2166, _2172);
    float _2190 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6691, float2(0.0), isnan(_6691)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6691, float2(0.0), isnan(_6691)), level(0.0)).x;
    float2 _6699 = float2(_2170, _2176);
    float _2192 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6699, float2(0.0), isnan(_6699)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6699, float2(0.0), isnan(_6699)), level(0.0)).x;
    float2 _6707 = float2(_2174, _2180);
    float _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6707, float2(0.0), isnan(_6707)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6707, float2(0.0), isnan(_6707)), level(0.0)).x;
    float2 _6715 = float2(_2178, _2184);
    float _2196 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6715, float2(0.0), isnan(_6715)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6715, float2(0.0), isnan(_6715)), level(0.0)).x;
    float2 _6723 = float2(_2182, _2146);
    float _2198 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6723, float2(0.0), isnan(_6723)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6723, float2(0.0), isnan(_6723)), level(0.0)).x;
    float2 _6731 = float2(_2186, _2102);
    float _2200 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6731, float2(0.0), isnan(_6731)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6731, float2(0.0), isnan(_6731)), level(0.0)).x;
    float _2202 = _2058 * _1930;
    float _2204 = _2060 * _1930;
    float2 _6745 = float2(_2202, _2124);
    float _2206 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6745, float2(0.0), isnan(_6745)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6745, float2(0.0), isnan(_6745)), level(0.0)).x;
    float2 _6753 = float2(_2204, _2114);
    float _2208 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6753, float2(0.0), isnan(_6753)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6753, float2(0.0), isnan(_6753)), level(0.0)).x;
    float2 _6761 = float2(_2062, _1964);
    float _2210 = dm_bs(spvDescriptorSet0.vp_t_tcb_10.sample(spvDescriptorSet0.vp_t_tcb_10Smplr, select(_6761, float2(0.0), isnan(_6761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_10, spvDescriptorSet0.vp_t_tcb_10Smplr_w, select(_6761, float2(0.0), isnan(_6761)), level(0.0)).x;
    float3 _6770 = float3(_1956, _1958, _2132);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6770, float3(0.0), isnan(_6770)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6770, float3(0.0), isnan(_6770)), level(0.0)).x;
    float3 _6781 = float3(_1956, _1958, _2132);
    float4 _2215 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6781, float3(0.0), isnan(_6781)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6781, float3(0.0), isnan(_6781)), level(0.0)).xyzw;
    float _2217 = _2215.x;
    float _2219 = _2215.y;
    float _2221 = _2215.z;
    float _2223 = _2215.w;
    float2 _6797 = float2(_1942, _1944);
    float3 _2227 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6797, float2(0.0), isnan(_6797)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6797, float2(0.0), isnan(_6797)), level(0.0)).xyz;
    float _2229 = _2227.x;
    float _2231 = _2227.y;
    float _2233 = _2227.z;
    float _2235 = _1056 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2237 = _1844 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2239 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2235);
    float _2241 = fma(_1848, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2237);
    float _2243 = fma(_1080, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2239);
    float _2245 = _2243 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2247 = _2245 + _1792;
    float _2249 = _2247 * _1930;
    float _2251 = _2249 * 0.5;
    float _2253 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2255 = fma(_2251, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2253);
    float _2257 = 1.0 / _2255;
    float _2259 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2261 = _2257 * _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2265 = fma(_2022, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2263);
    float _2267 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2269 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2267);
    float _2271 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2273 = fma(_2028, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2271);
    float _2275 = 1.0 / _2265;
    float _2277 = 1.0 / _2273;
    float _2279 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2281 = -_2261;
    float _2283 = fma(_2275, _2279, _2281);
    float _2285 = 1.0 / _2269;
    float _2287 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2289 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2287);
    bool _2291 = _2283 >= 0.0;
    bool _2293 = isnan(_2283);
    bool _2295 = _2291 || _2293;
    bool _2297 = isnan(0.0);
    bool _2299 = _2295 || _2297;
    float _2301 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2303 = fma(_2076, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2301);
    float _2305 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2307 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2305);
    float _2309 = 1.0 / _2289;
    float _2311 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2313 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2311);
    float _2315 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2317 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2315);
    float _2319 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2321 = fma(_2096, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2319);
    float _2323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2325 = -_2261;
    float _2327 = fma(_2285, _2323, _2325);
    float _2329 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2331 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2329);
    float _2333 = 1.0 / _2313;
    bool _2335 = _2327 >= 0.0;
    bool _2337 = isnan(_2327);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.0);
    bool _2343 = _2339 || _2341;
    float _2345 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2347 = -_2261;
    float _2349 = fma(_2277, _2345, _2347);
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2353 = fma(_2108, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2351);
    float _2355 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2357 = -_2261;
    float _2359 = fma(_2309, _2355, _2357);
    bool _2361 = !_2343;
    float _2363 = _2361 ? 0.0 : 2.0;
    float _2365 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2367 = fma(_2110, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2365);
    bool _2369 = _2349 >= 0.0;
    bool _2371 = isnan(_2349);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(0.0);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    float _2381 = 1.0 / _2331;
    bool _2383 = !_2299;
    float _2385 = _2383 ? 0.0 : 2.0;
    float _2387 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2389 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2387);
    float _2391 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2393 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2391);
    float _2395 = _2385 + _2379;
    bool _2397 = _2359 >= 0.0;
    bool _2399 = isnan(_2359);
    bool _2401 = _2397 || _2399;
    bool _2403 = isnan(0.0);
    bool _2405 = _2401 || _2403;
    float _2407 = float(_2405);
    float _2409 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2411 = -_2261;
    float _2413 = fma(_2333, _2409, _2411);
    float _2415 = 1.0 / _2367;
    float _2417 = _2395 + _2363;
    float _2419 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2421 = fma(_2138, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2419);
    float _2423 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2425 = fma(_2136, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2423);
    bool _2427 = _2413 >= 0.0;
    bool _2429 = isnan(_2413);
    bool _2431 = _2427 || _2429;
    bool _2433 = isnan(0.0);
    bool _2435 = _2431 || _2433;
    float _2437 = float(_2435);
    float _2439 = _2417 + _2407;
    float _2441 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2443 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2441);
    float _2445 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2447 = -_2261;
    float _2449 = fma(_2381, _2445, _2447);
    float _2451 = 1.0 / _2303;
    float _2453 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2455 = fma(_2152, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2453);
    float _2457 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2459 = fma(_2154, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2457);
    float _2461 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2463 = fma(_2156, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2461);
    float _2465 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2467 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2465);
    float _2469 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2471 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2469);
    float _2473 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2475 = fma(_2162, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2473);
    float _2477 = 1.0 / _2455;
    float _2479 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2481 = -_2261;
    float _2483 = fma(_2451, _2479, _2481);
    float _2485 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2487 = fma(_2188, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2485);
    float _2489 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2491 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2489);
    float _2493 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2495 = fma(_2192, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2493);
    float _2497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2499 = fma(_2194, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2497);
    bool _2501 = _2483 >= 0.0;
    bool _2503 = isnan(_2483);
    bool _2505 = _2501 || _2503;
    bool _2507 = isnan(0.0);
    bool _2509 = _2505 || _2507;
    float _2511 = float(_2509);
    float _2513 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2515 = fma(_2196, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2513);
    float _2517 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2519 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2517);
    float _2521 = 1.0 / _2475;
    float _2523 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2525 = fma(_2200, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2523);
    float _2527 = _2439 + _2511;
    float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2531 = fma(_2206, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2529);
    float _2533 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2535 = fma(_2208, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2533);
    float _2537 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2539 = fma(_2210, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2537);
    float _2541 = 1.0 / _2307;
    float _2543 = 1.0 / _2539;
    float _2545 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2547 = -_2261;
    float _2549 = fma(_2541, _2545, _2547);
    bool _2551 = _2549 >= 0.0;
    bool _2553 = isnan(_2549);
    bool _2555 = _2551 || _2553;
    bool _2557 = isnan(0.0);
    bool _2559 = _2555 || _2557;
    bool _2561 = !_2559;
    float _2563 = _2561 ? 0.0 : 2.0;
    float _2565 = _2527 + _2563;
    float _2567 = 1.0 / _2317;
    float _2569 = _2565 + _2437;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = -_2261;
    float _2575 = fma(_2567, _2571, _2573);
    bool _2577 = _2575 >= 0.0;
    bool _2579 = isnan(_2575);
    bool _2581 = _2577 || _2579;
    bool _2583 = isnan(0.0);
    bool _2585 = _2581 || _2583;
    float _2587 = 1.0 / _2321;
    float _2589 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2591 = -_2261;
    float _2593 = fma(_2587, _2589, _2591);
    bool _2595 = _2593 >= 0.0;
    bool _2597 = isnan(_2593);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan(0.0);
    bool _2603 = _2599 || _2601;
    bool _2605 = !_2585;
    float _2607 = _2605 ? 0.0 : 2.0;
    bool _2609 = !_2603;
    float _2611 = _2609 ? 0.0 : 2.0;
    float _2613 = _2569 + _2607;
    bool _2615 = _2449 >= 0.0;
    bool _2617 = isnan(_2449);
    bool _2619 = _2615 || _2617;
    bool _2621 = isnan(0.0);
    bool _2623 = _2619 || _2621;
    float _2625 = float(_2623);
    float _2627 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2629 = -_2261;
    float _2631 = fma(_2415, _2627, _2629);
    float _2633 = _2613 + _2611;
    float _2635 = 1.0 / _2389;
    float _2637 = _2633 + _2625;
    float _2639 = 1.0 / _2353;
    float _2641 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2643 = -_2261;
    float _2645 = fma(_2635, _2641, _2643);
    bool _2647 = _2631 >= 0.0;
    bool _2649 = isnan(_2631);
    bool _2651 = _2647 || _2649;
    bool _2653 = isnan(0.0);
    bool _2655 = _2651 || _2653;
    float _2657 = float(_2655);
    float _2659 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2661 = -_2261;
    float _2663 = fma(_2639, _2659, _2661);
    bool _2665 = _2663 >= 0.0;
    bool _2667 = isnan(_2663);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan(0.0);
    bool _2673 = _2669 || _2671;
    bool _2675 = !_2673;
    float _2677 = _2675 ? 0.0 : 2.0;
    float _2679 = _2637 + _2677;
    bool _2681 = _2645 >= 0.0;
    bool _2683 = isnan(_2645);
    bool _2685 = _2681 || _2683;
    bool _2687 = isnan(0.0);
    bool _2689 = _2685 || _2687;
    float _2691 = float(_2689);
    float _2693 = _2679 + _2657;
    float _2695 = 1.0 / _2425;
    float _2697 = _2693 + _2691;
    float _2699 = 1.0 / _2393;
    float _2701 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2703 = -_2261;
    float _2705 = fma(_2695, _2701, _2703);
    bool _2707 = _2705 >= 0.0;
    bool _2709 = isnan(_2705);
    bool _2711 = _2707 || _2709;
    bool _2713 = isnan(0.0);
    bool _2715 = _2711 || _2713;
    float _2717 = float(_2715);
    float _2719 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2721 = -_2261;
    float _2723 = fma(_2477, _2719, _2721);
    float _2725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2727 = -_2261;
    float _2729 = fma(_2699, _2725, _2727);
    bool _2731 = _2729 >= 0.0;
    bool _2733 = isnan(_2729);
    bool _2735 = _2731 || _2733;
    bool _2737 = isnan(0.0);
    bool _2739 = _2735 || _2737;
    bool _2741 = !_2739;
    float _2743 = _2741 ? 0.0 : 2.0;
    float _2745 = _2697 + _2743;
    float _2747 = 1.0 / _2421;
    float _2749 = _2745 + _2717;
    float _2751 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2753 = -_2261;
    float _2755 = fma(_2747, _2751, _2753);
    bool _2757 = _2755 >= 0.0;
    bool _2759 = isnan(_2755);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan(0.0);
    bool _2765 = _2761 || _2763;
    float _2767 = 1.0 / _2443;
    float _2769 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2771 = -_2261;
    float _2773 = fma(_2767, _2769, _2771);
    bool _2775 = _2773 >= 0.0;
    bool _2777 = isnan(_2773);
    bool _2779 = _2775 || _2777;
    bool _2781 = isnan(0.0);
    bool _2783 = _2779 || _2781;
    bool _2785 = !_2765;
    float _2787 = _2785 ? 0.0 : 2.0;
    bool _2789 = !_2783;
    float _2791 = _2789 ? 0.0 : 2.0;
    float _2793 = _2749 + _2787;
    bool _2795 = _2723 >= 0.0;
    bool _2797 = isnan(_2723);
    bool _2799 = _2795 || _2797;
    bool _2801 = isnan(0.0);
    bool _2803 = _2799 || _2801;
    float _2805 = float(_2803);
    float _2807 = _2793 + _2791;
    float _2809 = _2807 + _2805;
    float _2811 = 1.0 / _2459;
    float _2813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2815 = -_2261;
    float _2817 = fma(_2811, _2813, _2815);
    bool _2819 = _2817 >= 0.0;
    bool _2821 = isnan(_2817);
    bool _2823 = _2819 || _2821;
    bool _2825 = isnan(0.0);
    bool _2827 = _2823 || _2825;
    float _2829 = 1.0 / _2463;
    float _2831 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2833 = -_2261;
    float _2835 = fma(_2829, _2831, _2833);
    bool _2837 = !_2827;
    float _2839 = _2837 ? 0.0 : 2.0;
    bool _2841 = _2835 >= 0.0;
    bool _2843 = isnan(_2835);
    bool _2845 = _2841 || _2843;
    bool _2847 = isnan(0.0);
    bool _2849 = _2845 || _2847;
    float _2851 = float(_2849);
    float _2853 = _2809 + _2839;
    float _2855 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2857 = -_2261;
    float _2859 = fma(_2521, _2855, _2857);
    float _2861 = 1.0 / _2467;
    float _2863 = _2853 + _2851;
    bool _2865 = _2859 >= 0.0;
    bool _2867 = isnan(_2859);
    bool _2869 = _2865 || _2867;
    bool _2871 = isnan(0.0);
    bool _2873 = _2869 || _2871;
    float _2875 = float(_2873);
    float _2877 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2879 = -_2261;
    float _2881 = fma(_2861, _2877, _2879);
    bool _2883 = _2881 >= 0.0;
    bool _2885 = isnan(_2881);
    bool _2887 = _2883 || _2885;
    bool _2889 = isnan(0.0);
    bool _2891 = _2887 || _2889;
    float _2893 = float(_2891);
    float _2895 = _2863 + _2893;
    float _2897 = 1.0 / _2471;
    float _2899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2901 = -_2261;
    float _2903 = fma(_2897, _2899, _2901);
    bool _2905 = _2903 >= 0.0;
    bool _2907 = isnan(_2903);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan(0.0);
    bool _2913 = _2909 || _2911;
    bool _2915 = !_2913;
    float _2917 = _2915 ? 0.0 : 2.0;
    float _2919 = _2895 + _2917;
    float _2921 = 1.0 / _2487;
    float _2923 = _2919 + _2875;
    float _2925 = 1.0 / _2525;
    float _2927 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2929 = -_2261;
    float _2931 = fma(_2921, _2927, _2929);
    bool _2933 = _2931 >= 0.0;
    bool _2935 = isnan(_2931);
    bool _2937 = _2933 || _2935;
    bool _2939 = isnan(0.0);
    bool _2941 = _2937 || _2939;
    float _2943 = 1.0 / _2491;
    float _2945 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2947 = -_2261;
    float _2949 = fma(_2925, _2945, _2947);
    float _2951 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2953 = -_2261;
    float _2955 = fma(_2943, _2951, _2953);
    bool _2957 = _2955 >= 0.0;
    bool _2959 = isnan(_2955);
    bool _2961 = _2957 || _2959;
    bool _2963 = isnan(0.0);
    bool _2965 = _2961 || _2963;
    float _2967 = 1.0 / _2495;
    float _2969 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2971 = -_2261;
    float _2973 = fma(_2967, _2969, _2971);
    bool _2975 = _2973 >= 0.0;
    bool _2977 = isnan(_2973);
    bool _2979 = _2975 || _2977;
    bool _2981 = isnan(0.0);
    bool _2983 = _2979 || _2981;
    float _2985 = 1.0 / _2499;
    bool _2987 = !_2983;
    float _2989 = _2987 ? 0.0 : 3.0;
    float _2991 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2993 = -_2261;
    float _2995 = fma(_2985, _2991, _2993);
    bool _2997 = _2995 >= 0.0;
    bool _2999 = isnan(_2995);
    bool _3001 = _2997 || _2999;
    bool _3003 = isnan(0.0);
    bool _3005 = _3001 || _3003;
    float _3007 = 1.0 / _2515;
    bool _3009 = !_3005;
    float _3011 = _3009 ? 0.0 : 3.0;
    float _3013 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3015 = -_2261;
    float _3017 = fma(_3007, _3013, _3015);
    bool _3019 = _3017 >= 0.0;
    bool _3021 = isnan(_3017);
    bool _3023 = _3019 || _3021;
    bool _3025 = isnan(0.0);
    bool _3027 = _3023 || _3025;
    float _3029 = 1.0 / _2519;
    float _3031 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3033 = -_2261;
    float _3035 = fma(_3029, _3031, _3033);
    bool _3037 = _3035 >= 0.0;
    bool _3039 = isnan(_3035);
    bool _3041 = _3037 || _3039;
    bool _3043 = isnan(0.0);
    bool _3045 = _3041 || _3043;
    bool _3047 = !_2965;
    float _3049 = _3047 ? 0.0 : 3.0;
    bool _3051 = _2949 >= 0.0;
    bool _3053 = isnan(_2949);
    bool _3055 = _3051 || _3053;
    bool _3057 = isnan(0.0);
    bool _3059 = _3055 || _3057;
    bool _3061 = !_3045;
    float _3063 = _3061 ? 0.0 : 3.0;
    float _3065 = _3049 + _2989;
    bool _3067 = !_3027;
    float _3069 = _3067 ? 0.0 : 3.0;
    bool _3071 = !_3059;
    float _3073 = _3071 ? 0.0 : 3.0;
    float _3075 = _3065 + _3011;
    float _3077 = _3075 + _3069;
    bool _3079 = !_2941;
    float _3081 = _3079 ? 0.0 : 2.0;
    float _3083 = _3077 + _3063;
    float _3085 = _1828 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3087 = _2923 + _3081;
    float _3089 = fma(_1856, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2241);
    float _3091 = _3083 + _3073;
    float _3093 = 1.0 / _2531;
    float _3095 = _3087 * 0.02857142873108386993408203125;
    float _3097 = precise::clamp(_3095, 0.0, 1.0);
    float _3099 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3089);
    float _3101 = _3099 + _1878;
    out.gl_Position.x = _1934;
    out.gl_Position.y = _1938;
    out.gl_Position.z = _3099;
    out.gl_Position.w = _1878;
    float _3103 = 1.0 / _2535;
    float _3105 = _3101 * 0.5;
    out.m_70.z = _3105;
    out.m_70.w = _1878;
    float _3107 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3109 = -_2261;
    float _3111 = fma(_3093, _3107, _3109);
    float _3113 = exp2(_3085);
    bool _3115 = _3111 >= 0.0;
    bool _3117 = isnan(_3111);
    bool _3119 = _3115 || _3117;
    bool _3121 = isnan(0.0);
    bool _3123 = _3119 || _3121;
    float _3125 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3127 = -_2261;
    float _3129 = fma(_3103, _3125, _3127);
    float _3131 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3133 = -_2261;
    float _3135 = fma(_2543, _3131, _3133);
    bool _3137 = !_3123;
    float _3139 = _3137 ? 0.0 : 3.0;
    bool _3141 = _3129 >= 0.0;
    bool _3143 = isnan(_3129);
    bool _3145 = _3141 || _3143;
    bool _3147 = isnan(0.0);
    bool _3149 = _3145 || _3147;
    bool _3151 = _3135 >= 0.0;
    bool _3153 = isnan(_3135);
    bool _3155 = _3151 || _3153;
    bool _3157 = isnan(0.0);
    bool _3159 = _3155 || _3157;
    float _3161 = _3091 + _3139;
    bool _3163 = !_3149;
    float _3165 = _3163 ? 0.0 : 3.0;
    float _3167 = -_3113;
    float _3169 = _3167 + 1.0;
    bool _3171 = !_3159;
    float _3173 = _3171 ? 0.0 : 5.0;
    float _3175 = _3161 + _3165;
    float _3177 = _3169 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3179 = _3175 + _3173;
    float _3181 = _3177 * _2212;
    float _3183 = -_3177;
    float _3185 = _3183 + 1.0;
    float _3187 = _3179 * 0.14285714924335479736328125;
    float _3189 = precise::clamp(_3187, 0.0, 1.0);
    float _3191 = _2223 * _3181;
    float _3193 = _2233 * _3181;
    float _3195 = _3097 * _3189;
    float _3197 = fma(_2229, _3191, _2217);
    float _3199 = fma(_2231, _3191, _2219);
    float _3201 = _2223 * _3185;
    float _3203 = _3195 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3205 = fma(_2223, _3193, _2221);
    float _3207 = _3203 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_72.x = _3197;
    out.m_72.y = _3199;
    out.m_72.z = _3205;
    out.m_72.w = _3201;
    out.m_49.x = _3207;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

