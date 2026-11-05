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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_68 [[user(locn0)]];
    float4 m_70 [[user(locn1)]];
    float4 m_74 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_76 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_58 [[attribute(3)]];
    float4 m_72 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_56 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1634 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
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
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_111);
        out.gl_Position.z = _2308;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_149);
        out.gl_Position.z = _2378;
    }
    if (_141)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _153 = int(_151);
    float _155 = in.m_51.x;
    float _157 = in.m_51.y;
    float _159 = float(_95);
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _175 = int(_173);
    float _177 = float(_153);
    float _179 = 1.0 / _159;
    float _181 = float(uint(_175));
    float _183 = 1.0 / _177;
    int _185 = ~_175;
    int _187 = _185 + 1;
    int _189 = ~_175;
    int _191 = _189 + 1;
    float _193 = float(_175);
    float _195 = 1.0 / _181;
    float _197 = _183 * _129;
    float _199 = trunc(_197);
    int _201 = int(_199);
    int _203 = as_type<int>(_195) + (-2);
    float _205 = float(uint(_201));
    float _207 = as_type<float>(_203) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _214 = uint(_211);
    int _216 = _187 * int(_214);
    int _218 = _216 + _201;
    float _220 = float(uint(_218));
    float _222 = as_type<float>(_203) * _220;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _226 = _224 != 0;
    float _228 = trunc(_222);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    bool _234 = !_226;
    float _236 = _234 ? 7.345489978790283203125 : 1.0;
    float _238 = _236 * _155;
    int _240 = int(_214) + int(_232);
    float _242 = floor(_238);
    float _244 = float(_201);
    int _246 = _191 * _240;
    int _248 = _246 + _201;
    bool _250 = _244 >= _193;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan(_193);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    bool _262 = uint(_248) >= uint(_175);
    float _264 = trunc(_260);
    int _266 = int(_264);
    bool _268 = !_262;
    int _270 = _268 ? 0 : (-1);
    int _272 = as_type<int>(_161) & 1;
    bool _274 = _272 != 0;
    int _276 = as_type<int>(_161) & 2;
    bool _278 = _276 != 0;
    int _280 = ~_240;
    int _282 = _280 + _270;
    int _284 = _282 + 1;
    float _286 = -_242;
    float _288 = _238 + _286;
    float _290 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _292 = _175 * _284;
    int _294 = _292 + _201;
    bool _296 = _175 == 0;
    float _298 = 0.0;
    float _300 = _290;
    if (!_171)
    {
        float _302 = _290 * _290;
        float _304 = _302 * 0.5;
        _298 = _304;
    }
    float _306 = _298;
    bool _308 = !_274;
    float _310 = _308 ? (-0.5) : 0.5;
    bool _312 = !_278;
    float _314 = _312 ? (-0.5) : 0.5;
    float _316 = _306;
    if (!_171)
    {
        float _318 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _316 = _318;
    }
    float _320 = _316;
    int _322 = ~_266;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    bool _328 = !_296;
    int _330 = _328 ? _294 : (-1);
    bool _332 = !_171;
    float _334 = _320;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _290 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _290);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _364;
    }
    float _366 = _334;
    bool _368 = !_171;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _290 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _300 = _388;
    }
    float _390 = _300;
    float _392 = _288 * _193;
    float _394 = _193 * _129;
    int _396 = _330 * _326;
    float _398 = in.m_56.w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _402 = _400 != 0;
    float _404 = _394 * _179;
    float _406 = trunc(_392);
    int _408 = int(_406);
    int _410 = _175 + (-1);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _422 = _420 != 0;
    bool _424 = !_402;
    int _426 = _424 ? 0 : 1;
    int _428 = _266 * _410;
    int _430 = _428 + _396;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _434 = _432 != 0;
    float _436 = trunc(_404);
    int _438 = int(_436);
    bool _440 = !_418;
    int _442 = _440 ? 0 : 1;
    bool _444 = !_414;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_442);
    bool _450 = !_422;
    int _452 = _450 ? 0 : 1;
    int _454 = abs(_446);
    int _456 = _430 * _448;
    int _458 = abs(_426);
    bool _460 = !_434;
    int _462 = _460 ? 0 : 1;
    int _464 = abs(_452);
    int _466 = _408 * _458;
    int _468 = _466 + _201;
    int _470 = abs(_462);
    int _472 = _438 * _454;
    int _474 = _472 + _456;
    float _476 = in.m_51.z;
    float _478 = float(uint(_468));
    int _480 = _468 * _464;
    int _482 = _480 + _474;
    int _484 = ~_175;
    int _486 = _484 + 1;
    int _488 = _408 * _470;
    int _490 = _488 + _482;
    int _492 = ~_175;
    int _494 = _492 + 1;
    float _496 = as_type<float>(_203) * _478;
    int _498 = ~_175;
    int _500 = _498 + 1;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _504 = float(uint(_490));
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _508 = _506 != 0;
    float _510 = trunc(_496);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    float _516 = as_type<float>(_203) * _504;
    bool _518 = !_508;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _524 = _522 != 0;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _528 = trunc(_516);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _540 = 1.0 + _538;
    float _542 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].w, _536);
    int _544 = _494 * int(_532);
    int _546 = _544 + _490;
    float _548 = 1.0 / _540;
    float _550 = float(uint(_546));
    float _552 = as_type<float>(_203) * _550;
    float _554 = trunc(_552);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    int _560 = int(_532) + int(_558);
    int _562 = _486 * int(_514);
    int _564 = _562 + _468;
    int _566 = _500 * _560;
    int _568 = _566 + _490;
    float _570 = float(uint(_564));
    bool _572 = uint(_568) >= uint(_175);
    float _574 = as_type<float>(_203) * _570;
    bool _576 = !_572;
    int _578 = _576 ? 0 : (-1);
    float _580 = trunc(_574);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _588 = _586 != 0;
    int _590 = ~_560;
    int _592 = _590 + _578;
    int _594 = _592 + 1;
    int _596 = _175 * _594;
    int _598 = _596 + _490;
    float _600 = _155 * 2.0;
    float _602 = _157 * 2.0;
    bool _604 = !_296;
    int _606 = _604 ? _598 : (-1);
    float _608 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _610 = floor(_600);
    int _612 = int(_514) + int(_584);
    float _614 = -_526;
    float _616 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[77].x, _614);
    int _618 = _606 & 3;
    bool _620 = _618 != 0;
    float _622 = fma(_608, -2.0, _502);
    int _624 = ~_175;
    int _626 = _624 + 1;
    float _628 = _155 + _157;
    bool _630 = uint(_618) > 1u;
    float _632 = floor(_602);
    int _634 = _606 & 3;
    bool _636 = _634 != 0;
    int _638 = _626 * _612;
    int _640 = _638 + _468;
    bool _642 = _618 != 3;
    float _644 = _628 + (-1.0);
    int _646 = _636 ? 0 : 1;
    float _648 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _622);
    bool _650 = uint(_640) >= uint(_175);
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    int _656 = ~_646;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _664 = !_650;
    int _666 = _664 ? 0 : (-1);
    int _668 = _660;
    if (!_630)
    {
        int _670 = ~_646;
        int _672 = _670 + 1;
        _668 = _672;
    }
    int _674 = _668;
    float _676 = _157 + _476;
    bool _678 = uint(_618) >= 2u;
    int _680 = ~_612;
    int _682 = _680 + _666;
    int _684 = _682 + 1;
    float _686 = _676 + (-1.0);
    int _688 = _678 ? 0 : 1;
    int _690 = _606 >> 31;
    int _692 = _175 * _684;
    int _694 = _692 + _468;
    int _696 = ~_688;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _704 = _700;
    if (_642)
    {
        int _706 = ~_688;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = _476 * 2.0;
    bool _714 = _155 > 0.5;
    float _716 = in.m_49.x;
    float _718 = in.m_49.y;
    float _720 = in.m_49.z;
    int _722 = _690 & 3;
    float _724 = floor(_712);
    float _726 = -_310;
    int _728 = _714 ? as_type<int>(_726) : as_type<int>(_310);
    int _730 = _606 + _722;
    bool _732 = !_588;
    float _734 = _732 ? _310 : as_type<float>(_728);
    bool _736 = !_296;
    int _738 = _736 ? _694 : (-1);
    bool _740 = _632 > 0.0;
    bool _742 = _632 >= 0.0;
    bool _744 = isnan(_632);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _654 * _129;
    int _754 = _730 >> 2;
    bool _756 = _157 > 0.5;
    float _758 = exp2(_752);
    int _760 = _754 << 4;
    int _762 = _760 + 368;
    float _764 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _766 = -_314;
    int _768 = _756 ? as_type<int>(_766) : as_type<int>(_314);
    uint _770 = uint(int(uint(_762) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[int(_780)][_782];
    bool _786 = _618 != 3;
    float _788 = fma(_390, _716, _764);
    bool _790 = _610 > 0.0;
    float _792 = in.m_44.x;
    float _794 = in.m_44.y;
    float _796 = in.m_44.z;
    bool _798 = _610 >= 0.0;
    bool _800 = isnan(_610);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    bool _808 = !_524;
    float _810 = _808 ? _314 : as_type<float>(_768);
    int _812 = _762 + 8;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    bool _830 = !_620;
    int _832 = _830 ? 0 : 1;
    float _834 = in.m_58.x;
    float _836 = in.m_58.y;
    float _838 = in.m_58.z;
    bool _840 = !_786;
    int _842 = _840 ? 0 : (-1);
    float _844 = -_758;
    float _846 = _844 + 1.0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _858 = _856 != 0;
    int _860 = _806 ? 0 : 1;
    float _862 = in.m_60.x;
    float _864 = in.m_60.y;
    float _866 = in.m_60.z;
    bool _868 = _724 > 0.0;
    bool _870 = !_854;
    int _872 = _870 ? 0 : 1;
    bool _874 = _724 >= 0.0;
    bool _876 = isnan(_724);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = in.m_62.x;
    float _886 = in.m_62.y;
    float _888 = in.m_62.z;
    bool _890 = !_858;
    int _892 = _890 ? 0 : 1;
    bool _894 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _902 = _898 || _900;
    float _904 = fma(_788, _398, _792);
    int _906 = abs(_710);
    float _908 = _902 ? _846 : 0.0;
    float _910 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _912 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _914 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(1.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = fma(_390, _718, _910);
    float _926 = fma(_390, _720, _912);
    int _928 = abs(_832);
    float _930 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _534);
    float _932 = fma(_924, _398, _794);
    int _934 = abs(_674);
    float _936 = fma(_926, _398, _796);
    int _938 = ~_928;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    float _944 = _932 * _864;
    float _946 = _932 * _836;
    float _948 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _930);
    float _950 = _932 * _886;
    float _952 = fma(_904, _862, _944);
    float _954 = fma(_904, _834, _946);
    float _956 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _542);
    float _958 = fma(_904, _884, _950);
    int _960 = ~_934;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = fma(_936, _866, _952);
    float _968 = fma(_936, _888, _958);
    float _970 = fma(_936, _838, _954);
    int _972 = _964 * as_type<int>(_784);
    int _974 = ~_906;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = _810 + (-0.5);
    int _982 = abs(_520);
    int _984 = _942 * as_type<int>(_776);
    int _986 = _984 + _972;
    float _988 = _968 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _990 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _992 = abs(_842);
    int _994 = _978 * as_type<int>(_820);
    int _996 = _994 + _986;
    float _998 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1002 = _988 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1006 = _990 + _1004;
    int _1008 = ~_992;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1016 = _998 + _1014;
    int _1018 = ~_982;
    int _1020 = _1018 + 1;
    int _1022 = _1020 + 1;
    float _1024 = -_980;
    float _1026 = -_648;
    float _1028 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1026);
    float _1030 = -_956;
    float _1032 = _1030 + 1.0;
    float _1034 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1036 = _1012 * as_type<int>(_828);
    int _1038 = _1036 + _996;
    bool _1040 = !_850;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = -_129;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[76].x, _616);
    float _1048 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1034);
    int _1050 = _1038 * _1022;
    float _1052 = _734 + 0.5;
    float _1054 = -_948;
    float _1056 = _1054 + 1.0;
    float _1058 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1048);
    int _1060 = _738 * _982;
    int _1062 = _1060 + _1050;
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1046);
    bool _1066 = _1058 >= 0.0;
    float _1068 = fma(_810, _1032, _1028);
    float _1070 = _1016 * _1016;
    float _1072 = -_1056;
    float _1074 = fma(_734, _1072, _1064);
    float _1076 = fma(_1002, _1002, _1070);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1080 = fma(_1006, _1006, _1076);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1088 = rsqrt(_1080);
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_1066)
    {
        _1090 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1092 = _1090;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1100 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1106 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1108 = as_type<int>(_1092);
    if (_1066)
    {
        float _1110 = _1092 * 5.0;
        _1108 = as_type<int>(_1110);
    }
    int _1112 = _1108;
    float _1114 = float(_1062);
    float _1116 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1074;
    out.m_64.y = _1068;
    float _1120 = _1116;
    float _1122 = _1118;
    if (_922)
    {
        float _1124 = _908 * _548;
        _131 = _1124;
    }
    float _1126 = _131;
    float _1128 = _1016 * _1088;
    if (_1066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3789 = as_type<float>(_1112);
        out.gl_Position.z = _3789;
    }
    float _1130 = _1002 * _1088;
    out.m_66.x = _1114;
    out.m_68.x = _1102;
    out.m_68.y = _1104;
    out.m_68.z = _1100;
    out.m_68.w = _1084;
    out.m_70.x = _1106;
    out.m_70.y = _1116;
    out.m_70.z = _1118;
    if (_1066)
    {
        out.m_47.x = 0.0;
    }
    if (_1066)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1132 = -_1128;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1136 = -_1130;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    int _1140 = _882 ? 0 : 1;
    float _1142 = -_1128;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1016);
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1134 + _1146;
    int _1150 = ~_860;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = _157 + (-0.5);
    int _1158 = _1154;
    int _1160 = as_type<int>(_1144);
    if (!_790)
    {
        int _1162 = ~_860;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1170 = _1138 + _1168;
    float _1172 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1174 = ~_1140;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = -_1130;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    int _1184 = _1178;
    if (!_868)
    {
        int _1186 = ~_1140;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1172);
    float _1194 = in.m_72.x;
    float _1196 = in.m_72.y;
    float _1198 = in.m_72.z;
    float _1200 = _1006 * _1088;
    int _1202 = abs(_1042);
    int _1204 = abs(_872);
    float _1206 = -_1200;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1210 = float(_1190);
    float _1212 = float(_1202);
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1208 + _1214;
    int _1218 = _750 ? 0 : 1;
    float _1220 = float(_1166);
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1192);
    float _1224 = _1212 * _1210;
    int _1226 = ~_1218;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (!_740)
    {
        int _1234 = ~_1218;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    bool _1240 = _1222 >= 0.0;
    float _1242 = _1224 * (-2.0);
    float _1244 = float(_1204);
    float _1246 = _155 + (-0.5);
    int _1248 = abs(_892);
    float _1250 = fma(_1242, _1194, _1194);
    float _1252 = float(_1238);
    float _1254 = _1244 * _1220;
    float _1256 = float(_1248);
    float _1258 = fma(_662, _1242, _662);
    float _1260 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1250);
    float _1262 = _1254 * (-2.0);
    float _1264 = _155 + _476;
    float _1266 = _1256 * _1252;
    float _1268 = fma(_1258, _1126, _1260);
    float _1270 = fma(_1262, _1196, _1196);
    float _1272 = _1256;
    if (_1240)
    {
        _1272 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1274 = _1272;
    float _1276 = fma(_702, _1262, _702);
    float _1278 = _1268 * 0.15915493667125701904296875;
    float _1280 = _1144 * _1144;
    float _1282 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1270);
    if (_1240)
    {
        float _1284 = _1274 * 5.0;
        _1160 = as_type<int>(_1284);
    }
    int _1286 = _1160;
    float _1288 = _1278 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = fma(_1276, _1126, _1282);
    if (_1240)
    {
        out.m_47.x = 0.0;
    }
    float _1294 = fma(_1182, _1182, _1280);
    float _1296 = _1264 + (-1.0);
    if (_1240)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_1286);
        out.gl_Position.z = _4068;
    }
    float _1298 = _1278 * 6.283185482025146484375;
    float _1300 = sin(_1298);
    float _1302 = _1292 * 0.15915493667125701904296875;
    if (_1240)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1304 = in.m_56.y;
    float _1306 = -_1200;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1310 = _1266 * (-2.0);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1314 = in.m_56.x;
    float _1316 = fma(_1308, _1308, _1294);
    float _1318 = fma(_1310, _1198, _1198);
    float _1320 = _476 + (-0.5);
    float _1322 = fma(_1312, _1310, _1312);
    float _1324 = sqrt(_1316);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _314);
    float _1328 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1318);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _310);
    float _1332 = fma(_1322, _1126, _1328);
    float _1334 = _1302 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1332 * 0.15915493667125701904296875;
    float _1340 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1342 = _1302 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = _1088 * _1324;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1350 = _1346 * _1348;
    float _1352 = _1338 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1358 = _1326 * _1350;
    float _1360 = _1356 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1362 = _1300 * _1336;
    float _1364 = _1338 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1346 * _1360;
    float _1370 = _1290 * _1344;
    float _1372 = _1290 * _1336;
    float _1374 = _1330 * _1368;
    float _1376 = _1354 * _1358;
    float _1378 = _1336 * _1354;
    float _1380 = _1344 * _1354;
    float _1382 = _1290 * _1376;
    float _1384 = _1300 * _1344;
    float _1386 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1388 = _1386 * 0.5;
    float _1390 = _1300 * _1376;
    float _1392 = fma(_1366, _1370, _1362);
    float _1394 = -_1358;
    float _1396 = _1366 * _1394;
    float _1398 = fma(_1366, _1362, _1370);
    float _1400 = fma(_1392, _1374, _1382);
    float _1402 = -_1384;
    float _1404 = fma(_1366, _1372, _1402);
    float _1406 = -_1372;
    float _1408 = fma(_1366, _1384, _1406);
    float _1410 = fma(_1380, _1374, _1396);
    float _1412 = fma(_1404, _1388, _1400);
    float _1414 = fma(_1408, _1374, _1390);
    float _1416 = fma(_1378, _1388, _1410);
    float _1418 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = fma(_1398, _1388, _1414);
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1418);
    float _1428 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1424);
    float _1432 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1426);
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1428);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    float _1438 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1442 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1444 = precise::clamp(_1442, 0.0, 1.0);
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1448 = _988 + _1438;
    float _1450 = _990 + _1440;
    float _1452 = fma(_1444, -0.64999997615814208984375, 1.0);
    float _1454 = _998 + _1446;
    float _1456 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1458 = _1448 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1462 = _1450 + _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1466 = _1454 + _1464;
    float _1468 = fma(_1458, _1452, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1470 = fma(_1462, _1452, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1472 = fma(_1466, _1452, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1476 = _1468 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1480 = _1470 + _1478;
    float _1482 = _1476 * _1476;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = _1466;
    float _1494 = _1436;
    float _1496 = _1452;
    float _1498 = _1470;
    float _1500 = _1468;
    if (!_1490)
    {
        _1492 = _1470;
    }
    float _1502 = _1492;
    float _1504 = _1502;
    if (!_1490)
    {
        _1494 = _1484;
    }
    float _1506 = _1494;
    float _1508 = _1506;
    if (!_1490)
    {
        _1496 = _1482;
    }
    float _1510 = _1496;
    float _1512 = _1510;
    if (!_1490)
    {
        _1498 = _1472;
    }
    float _1514 = _1498;
    bool _1516 = !_1490;
    float _1518 = _1514;
    if (!_1516)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1524 = _1488 + _1522;
        float _1526 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = rsqrt(_1486);
        float _1530 = _1524 * _1520;
        float _1532 = _1530 * 0.15915493667125701904296875;
        float _1534 = _1532 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 * 6.283185482025146484375;
        float _1540 = cos(_1538);
        float _1542 = fma(_1536, _1526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1544 = _1528 * _1542;
        float _1546 = _1540 + (-1.0);
        float _1548 = fma(_1476, _1544, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1550 = fma(_1480, _1544, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1552 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1556 = _1548 + _1554;
        float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1560 = _1550 + _1558;
        float _1562 = fma(_1472, _1540, _1552);
        float _1564 = _1556 * _1556;
        float _1566 = _1560 * _1560;
        _1518 = _1562;
        _1512 = _1564;
        _1508 = _1566;
        _1500 = _1548;
        _1504 = _1550;
    }
    float _1568 = _1518;
    float _1570 = _1512;
    float _1572 = _1508;
    float _1574 = _1500;
    float _1576 = _1504;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1580 = _1568 + _1578;
    out.m_68.x = _1102;
    out.m_68.y = _1104;
    out.m_68.z = _1100;
    out.m_68.w = _1084;
    float _1582 = fma(_1580, _1580, _1570);
    out.m_70.x = _1106;
    out.m_70.y = _1116;
    out.m_70.z = _1118;
    float _1584 = _1582 + _1572;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1590 = isnan(_1586);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1596 = _1592 || _1594;
    float _1598 = _1570;
    if (!_1596)
    {
        _1598 = 1.0;
    }
    float _1600 = _1598;
    bool _1602 = !_1596;
    float _1604 = _1600;
    if (!_1602)
    {
        bool _1606 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1608 = isnan(_1586);
        bool _1610 = _1606 || _1608;
        bool _1612 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1614 = _1610 || _1612;
        if (!_1614)
        {
            float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1618 = _1586 + _1616;
            float _1620 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1622 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1620;
            float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1626 = _1624 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1628 = 1.0 / _1622;
            float _1630 = _1618 * _1628;
            float _1632 = fma(_1630, _1626, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1604 = _1632;
            _1634 = true;
        }
        else
        {
            bool _1636 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1638 = isnan(_1586);
            bool _1640 = _1636 || _1638;
            bool _1642 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1644 = _1640 || _1642;
            if (!_1644)
            {
                float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1648 = _1586 + _1646;
                float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1652 = _1650 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1656 = _1654 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1658 = 1.0 / _1652;
                float _1660 = _1648 * _1658;
                float _1662 = fma(_1660, _1656, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1604 = _1662;
                _1634 = true;
            }
            else
            {
                _1604 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1634 = false;
    float _1664 = _1604;
    float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1668 = _1568 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1672 = _1574 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1676 = _1576 + _1674;
    float _1678 = fma(_1668, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1680 = fma(_1672, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1682 = fma(_1676, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1684 = -_1128;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1688 = -_1130;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1692 = -_1200;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1686 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1694 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = fma(_1702, _1702, _1708);
    float _1712 = fma(_1706, _1706, _1710);
    float _1714 = rsqrt(_1712);
    float _1716 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1718 = _1702 * _1716;
    float _1720 = _1706 * _1716;
    float _1722 = _1718 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 + _1724;
    float _1728 = sqrt(_1726);
    bool _1730 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1728 + _1732;
    float _1736 = _1714;
    float _1738 = _1734;
    float _1740 = _1664;
    float _1742 = _1698;
    float _1744 = _1716;
    float _1746 = _1718;
    if (_1730)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1748;
    }
    float _1750 = _1736;
    if (_1730)
    {
        float _1752 = rsqrt(_1726);
        _1120 = _1752;
    }
    float _1754 = _1120;
    float _1756 = _1754;
    if (_1730)
    {
        float _1758 = _1734 * _1750;
        _1738 = _1758;
    }
    float _1760 = _1738;
    if (_1730)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1740 = _1762;
    }
    float _1764 = _1740;
    float _1766 = _1750;
    if (_1730)
    {
        float _1768 = _1764 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1776 = precise::max(0.0, _1774);
    float _1778 = _1706;
    float _1780 = _1776;
    if (_1730)
    {
        float _1782 = _1764 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        _1778 = _1784;
    }
    float _1786 = _1778;
    float _1788 = -_1716;
    float _1790 = -_1776;
    float _1792 = fma(_1698, _1788, _1790);
    if (!_1730)
    {
        _1742 = _1720;
    }
    float _1794 = _1742;
    float _1796 = _1794;
    if (_1730)
    {
        float _1798 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1798;
    }
    float _1800 = _1780;
    float _1802 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = _1772;
    float _1806 = _1800;
    if (_1730)
    {
        float _1808 = fma(_1772, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1808;
    }
    float _1810 = _1122;
    if (!_1730)
    {
        _1804 = _1792;
    }
    float _1812 = _1804;
    float _1814 = _1812;
    float _1816 = _1786;
    if (_1730)
    {
        float _1818 = _1786 + (-1.0);
        _1806 = _1818;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1730)
    {
        float _1824 = _1754 * _1810;
        _1744 = _1824;
    }
    float _1826 = _1744;
    float _1828 = sqrt(_1712);
    if (_1730)
    {
        float _1830 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1830;
    }
    float _1832 = _1756;
    if (_1730)
    {
        float _1834 = _1718 * _1826;
        _1746 = _1834;
    }
    float _1836 = _1746;
    if (!_1730)
    {
        _1822 = _1722;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1730)
    {
        float _1842 = _1720 * _1826;
        _1796 = _1842;
    }
    float _1844 = _1796;
    if (_1730)
    {
        float _1846 = fma(_1792, _1786, _1832);
        _1814 = _1846;
    }
    float _1848 = _1814;
    if (_1730)
    {
        float _1850 = _1836 * _1836;
        _1840 = _1850;
    }
    float _1852 = _1840;
    if (!_1730)
    {
        _1816 = _1724;
    }
    float _1854 = _1816;
    float _1856 = _1854;
    if (_1730)
    {
        float _1858 = _1844 * _1844;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = fma(_1848, _1848, _1852);
    float _1864 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1866 = _1862 + _1860;
    float _1868 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1864);
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = rsqrt(_1866);
    float _1880 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1882 = -_1874;
    float _1884 = _1882 + 1.0;
    float _1886 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1890 = _1880 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1894 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1886);
    float _1896 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1888);
    float _1898 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1900 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1902 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1894);
    float _1904 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1906 = -_1898;
    float _1908 = fma(_1906, _1892, 1.0);
    float _1910 = abs(_1884);
    float _1912 = log2(_1910);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1918 = _1878 * _1836;
    float _1920 = _1878 * _1848;
    float _1922 = _1878 * _1844;
    float _1924 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1916);
    float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1900);
    float _1930 = log2(_1908);
    float _1932 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1924);
    float _1934 = -_1926;
    float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1934);
    float _1938 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1940 = -_1922;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1936);
    float _1944 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1948 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1950 = fma(_1942, -0.5, 0.5);
    float _1952 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1954 = 1.0 / _1946;
    float _1956 = fma(_1942, 0.5, 0.5);
    float _1958 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1948);
    float _1960 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1952);
    float _1962 = _1920 + 1.0;
    float _1964 = fma(_1956, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1968 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = exp2(_1944);
    float _1972 = fma(_1956, _1964, -0.212114393711090087890625);
    float _1974 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1966);
    float _1976 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1978 = _1930 * 0.693147182464599609375;
    float _1980 = fma(_1956, _1972, 1.570728778839111328125);
    float _1982 = sqrt(_1950);
    float _1984 = _1974 * _1954;
    float _1986 = fma(_1984, 0.5, 0.5);
    float _1988 = -_1920;
    float _1990 = fma(_1970, _1962, _1988);
    float _1992 = _1976 * _1954;
    float _1994 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1996 = fma(_1990, 0.5, 0.5);
    float _1998 = fma(_1992, -0.5, 0.5);
    float _2000 = _1982 * 0.636619746685028076171875;
    float _2002 = -_1980;
    float _2004 = fma(_2000, _2002, 1.0);
    float3 _5256 = float3(_1986, _1998, _1994);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5256, float3(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5256, float3(0.0), isnan(_5256)), level(0.0)).x;
    float3 _5267 = float3(_1986, _1998, _1994);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5267, float3(0.0), isnan(_5267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5267, float3(0.0), isnan(_5267)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float2 _5284 = float2(_2004, _1996);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5284, float2(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5284, float2(0.0), isnan(_5284)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2033 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2035 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2037 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2031);
    float _2039 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2041 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2035);
    float _2043 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2037);
    float _2045 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2047 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2049 = 1.0 / _2045;
    float _2051 = _2047 + _2045;
    float _2053 = _2051 * _2049;
    float _2055 = _2053 * 0.5;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2059 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2057);
    float _2061 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2063 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2067 = _2063 || _2065;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    float _2073 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2039);
    float _2075 = exp2(_2061);
    float _2077 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2073);
    float _2079 = 1.0 / _2059;
    float _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2083 = _1938;
    if (_2071)
    {
        _2081 = 1.0;
    }
    float _2085 = _2081;
    float _2087 = _2085;
    if (_2071)
    {
        _2083 = 1.0;
    }
    float _2089 = _2083;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2093 = _2079 * _2091;
    float _2095 = _2089;
    if (!_2071)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2101 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2099;
        float _2103 = _2097 * 0.15915493667125701904296875;
        float _2105 = _2103 * 6.283185482025146484375;
        float _2107 = cos(_2105);
        float _2109 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2111 = _2109 * 0.15915493667125701904296875;
        float _2113 = _2103 * 6.283185482025146484375;
        float _2115 = sin(_2113);
        float _2117 = 1.0 / _2107;
        float _2119 = _2111 * 6.283185482025146484375;
        float _2121 = cos(_2119);
        float _2123 = _2115 * _2117;
        float _2125 = _2111 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        float _2129 = _2121 * _2123;
        float _2131 = 1.0 / _2101;
        float _2133 = 1.0 / _2129;
        float _2135 = _2127 * _2133;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2139 = fma(_2093, _2135, _2137);
        float _2141 = _2139 * _2131;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2087 = _2143;
    }
    float _2145 = _2087;
    if (!_2071)
    {
        float _2147 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2149 = _2147 * 0.15915493667125701904296875;
        float _2151 = _2149 * 6.283185482025146484375;
        float _2153 = cos(_2151);
        float _2155 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2157 = _2155 * 0.15915493667125701904296875;
        float _2159 = _2149 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        float _2163 = 1.0 / _2153;
        float _2165 = _2157 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = _2161 * _2163;
        float _2171 = _2157 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2177 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2175;
        float _2179 = _2167 * _2169;
        float _2181 = 1.0 / _2179;
        float _2183 = 1.0 / _2177;
        float _2185 = _2173 * _2181;
        float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2189 = fma(_2093, _2185, _2187);
        float _2191 = _2189 * _2183;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = -_2193;
        float _2197 = _2195 + 1.0;
        _2095 = _2197;
    }
    float _2199 = _2095;
    float _2201 = _2077 + _1946;
    float _2203 = -_2075;
    float _2205 = _2203 + 1.0;
    float _2207 = _2145 * _2199;
    bool _2209 = _2145 > 0.0;
    bool _2211 = isnan(_2145);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan(0.0);
    bool _2217 = _2213 || _2215;
    float _2219 = _2201 * 0.5;
    float _2221 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2223 = _2207 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2225 = _2199 <= 0.0;
    bool _2227 = !_2217;
    bool _2229 = _2225 || _2227;
    float _2231 = _2221 * _2006;
    float _2233 = -_2221;
    float _2235 = _2233 + 1.0;
    float _2237 = _2017 * _2231;
    float _2239 = _2027 * _2231;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1976;
    out.gl_Position.z = _2077;
    out.gl_Position.w = _1946;
    float _2241 = _2017 * _2235;
    float _2243 = _2223 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = fma(_2023, _2237, _2011);
    float _2247 = fma(_2025, _2237, _2013);
    float _2249 = fma(_2017, _2239, _2015);
    out.m_74.z = _2219;
    out.m_74.w = _1946;
    out.m_47.x = _2243;
    out.m_76.x = _2245;
    out.m_76.y = _2247;
    out.m_76.z = _2249;
    out.m_76.w = _2241;
    if (!_2229)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2251;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1634 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
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
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_111);
        out.gl_Position.z = _2308;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_149);
        out.gl_Position.z = _2378;
    }
    if (_141)
    {
        return out;
    }
    float _151 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _153 = int(_151);
    float _155 = in.m_51.x;
    float _157 = in.m_51.y;
    float _159 = float(_95);
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _175 = int(_173);
    float _177 = float(_153);
    float _179 = 1.0 / _159;
    float _181 = float(uint(_175));
    float _183 = 1.0 / _177;
    int _185 = ~_175;
    int _187 = _185 + 1;
    int _189 = ~_175;
    int _191 = _189 + 1;
    float _193 = float(_175);
    float _195 = 1.0 / _181;
    float _197 = _183 * _129;
    float _199 = trunc(_197);
    int _201 = int(_199);
    int _203 = as_type<int>(_195) + (-2);
    float _205 = float(uint(_201));
    float _207 = as_type<float>(_203) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _214 = uint(_211);
    int _216 = _187 * int(_214);
    int _218 = _216 + _201;
    float _220 = float(uint(_218));
    float _222 = as_type<float>(_203) * _220;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _226 = _224 != 0;
    float _228 = trunc(_222);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    bool _234 = !_226;
    float _236 = _234 ? 7.345489978790283203125 : 1.0;
    float _238 = _236 * _155;
    int _240 = int(_214) + int(_232);
    float _242 = floor(_238);
    float _244 = float(_201);
    int _246 = _191 * _240;
    int _248 = _246 + _201;
    bool _250 = _244 >= _193;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan(_193);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    bool _262 = uint(_248) >= uint(_175);
    float _264 = trunc(_260);
    int _266 = int(_264);
    bool _268 = !_262;
    int _270 = _268 ? 0 : (-1);
    int _272 = as_type<int>(_161) & 1;
    bool _274 = _272 != 0;
    int _276 = as_type<int>(_161) & 2;
    bool _278 = _276 != 0;
    int _280 = ~_240;
    int _282 = _280 + _270;
    int _284 = _282 + 1;
    float _286 = -_242;
    float _288 = _238 + _286;
    float _290 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _292 = _175 * _284;
    int _294 = _292 + _201;
    bool _296 = _175 == 0;
    float _298 = 0.0;
    float _300 = _290;
    if (!_171)
    {
        float _302 = _290 * _290;
        float _304 = _302 * 0.5;
        _298 = _304;
    }
    float _306 = _298;
    bool _308 = !_274;
    float _310 = _308 ? (-0.5) : 0.5;
    bool _312 = !_278;
    float _314 = _312 ? (-0.5) : 0.5;
    float _316 = _306;
    if (!_171)
    {
        float _318 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _316 = _318;
    }
    float _320 = _316;
    int _322 = ~_266;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    bool _328 = !_296;
    int _330 = _328 ? _294 : (-1);
    bool _332 = !_171;
    float _334 = _320;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _290 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _290);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _364;
    }
    float _366 = _334;
    bool _368 = !_171;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _290 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _300 = _388;
    }
    float _390 = _300;
    float _392 = _288 * _193;
    float _394 = _193 * _129;
    int _396 = _330 * _326;
    float _398 = in.m_56.w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _402 = _400 != 0;
    float _404 = _394 * _179;
    float _406 = trunc(_392);
    int _408 = int(_406);
    int _410 = _175 + (-1);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _422 = _420 != 0;
    bool _424 = !_402;
    int _426 = _424 ? 0 : 1;
    int _428 = _266 * _410;
    int _430 = _428 + _396;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _434 = _432 != 0;
    float _436 = trunc(_404);
    int _438 = int(_436);
    bool _440 = !_418;
    int _442 = _440 ? 0 : 1;
    bool _444 = !_414;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_442);
    bool _450 = !_422;
    int _452 = _450 ? 0 : 1;
    int _454 = abs(_446);
    int _456 = _430 * _448;
    int _458 = abs(_426);
    bool _460 = !_434;
    int _462 = _460 ? 0 : 1;
    int _464 = abs(_452);
    int _466 = _408 * _458;
    int _468 = _466 + _201;
    int _470 = abs(_462);
    int _472 = _438 * _454;
    int _474 = _472 + _456;
    float _476 = in.m_51.z;
    float _478 = float(uint(_468));
    int _480 = _468 * _464;
    int _482 = _480 + _474;
    int _484 = ~_175;
    int _486 = _484 + 1;
    int _488 = _408 * _470;
    int _490 = _488 + _482;
    int _492 = ~_175;
    int _494 = _492 + 1;
    float _496 = as_type<float>(_203) * _478;
    int _498 = ~_175;
    int _500 = _498 + 1;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _504 = float(uint(_490));
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _508 = _506 != 0;
    float _510 = trunc(_496);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    float _516 = as_type<float>(_203) * _504;
    bool _518 = !_508;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _524 = _522 != 0;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _528 = trunc(_516);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _540 = 1.0 + _538;
    float _542 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].w, _536);
    int _544 = _494 * int(_532);
    int _546 = _544 + _490;
    float _548 = 1.0 / _540;
    float _550 = float(uint(_546));
    float _552 = as_type<float>(_203) * _550;
    float _554 = trunc(_552);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    int _560 = int(_532) + int(_558);
    int _562 = _486 * int(_514);
    int _564 = _562 + _468;
    int _566 = _500 * _560;
    int _568 = _566 + _490;
    float _570 = float(uint(_564));
    bool _572 = uint(_568) >= uint(_175);
    float _574 = as_type<float>(_203) * _570;
    bool _576 = !_572;
    int _578 = _576 ? 0 : (-1);
    float _580 = trunc(_574);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _588 = _586 != 0;
    int _590 = ~_560;
    int _592 = _590 + _578;
    int _594 = _592 + 1;
    int _596 = _175 * _594;
    int _598 = _596 + _490;
    float _600 = _155 * 2.0;
    float _602 = _157 * 2.0;
    bool _604 = !_296;
    int _606 = _604 ? _598 : (-1);
    float _608 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _610 = floor(_600);
    int _612 = int(_514) + int(_584);
    float _614 = -_526;
    float _616 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[77].x, _614);
    int _618 = _606 & 3;
    bool _620 = _618 != 0;
    float _622 = fma(_608, -2.0, _502);
    int _624 = ~_175;
    int _626 = _624 + 1;
    float _628 = _155 + _157;
    bool _630 = uint(_618) > 1u;
    float _632 = floor(_602);
    int _634 = _606 & 3;
    bool _636 = _634 != 0;
    int _638 = _626 * _612;
    int _640 = _638 + _468;
    bool _642 = _618 != 3;
    float _644 = _628 + (-1.0);
    int _646 = _636 ? 0 : 1;
    float _648 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _622);
    bool _650 = uint(_640) >= uint(_175);
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    int _656 = ~_646;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _664 = !_650;
    int _666 = _664 ? 0 : (-1);
    int _668 = _660;
    if (!_630)
    {
        int _670 = ~_646;
        int _672 = _670 + 1;
        _668 = _672;
    }
    int _674 = _668;
    float _676 = _157 + _476;
    bool _678 = uint(_618) >= 2u;
    int _680 = ~_612;
    int _682 = _680 + _666;
    int _684 = _682 + 1;
    float _686 = _676 + (-1.0);
    int _688 = _678 ? 0 : 1;
    int _690 = _606 >> 31;
    int _692 = _175 * _684;
    int _694 = _692 + _468;
    int _696 = ~_688;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _704 = _700;
    if (_642)
    {
        int _706 = ~_688;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = _476 * 2.0;
    bool _714 = _155 > 0.5;
    float _716 = in.m_49.x;
    float _718 = in.m_49.y;
    float _720 = in.m_49.z;
    int _722 = _690 & 3;
    float _724 = floor(_712);
    float _726 = -_310;
    int _728 = _714 ? as_type<int>(_726) : as_type<int>(_310);
    int _730 = _606 + _722;
    bool _732 = !_588;
    float _734 = _732 ? _310 : as_type<float>(_728);
    bool _736 = !_296;
    int _738 = _736 ? _694 : (-1);
    bool _740 = _632 > 0.0;
    bool _742 = _632 >= 0.0;
    bool _744 = isnan(_632);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _654 * _129;
    int _754 = _730 >> 2;
    bool _756 = _157 > 0.5;
    float _758 = exp2(_752);
    int _760 = _754 << 4;
    int _762 = _760 + 368;
    float _764 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _766 = -_314;
    int _768 = _756 ? as_type<int>(_766) : as_type<int>(_314);
    uint _770 = uint(int(uint(_762) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[int(_780)][_782];
    bool _786 = _618 != 3;
    float _788 = fma(_390, _716, _764);
    bool _790 = _610 > 0.0;
    float _792 = in.m_44.x;
    float _794 = in.m_44.y;
    float _796 = in.m_44.z;
    bool _798 = _610 >= 0.0;
    bool _800 = isnan(_610);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    bool _808 = !_524;
    float _810 = _808 ? _314 : as_type<float>(_768);
    int _812 = _762 + 8;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    bool _830 = !_620;
    int _832 = _830 ? 0 : 1;
    float _834 = in.m_58.x;
    float _836 = in.m_58.y;
    float _838 = in.m_58.z;
    bool _840 = !_786;
    int _842 = _840 ? 0 : (-1);
    float _844 = -_758;
    float _846 = _844 + 1.0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _858 = _856 != 0;
    int _860 = _806 ? 0 : 1;
    float _862 = in.m_60.x;
    float _864 = in.m_60.y;
    float _866 = in.m_60.z;
    bool _868 = _724 > 0.0;
    bool _870 = !_854;
    int _872 = _870 ? 0 : 1;
    bool _874 = _724 >= 0.0;
    bool _876 = isnan(_724);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = in.m_62.x;
    float _886 = in.m_62.y;
    float _888 = in.m_62.z;
    bool _890 = !_858;
    int _892 = _890 ? 0 : 1;
    bool _894 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _902 = _898 || _900;
    float _904 = fma(_788, _398, _792);
    int _906 = abs(_710);
    float _908 = _902 ? _846 : 0.0;
    float _910 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _912 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _914 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(1.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = fma(_390, _718, _910);
    float _926 = fma(_390, _720, _912);
    int _928 = abs(_832);
    float _930 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _534);
    float _932 = fma(_924, _398, _794);
    int _934 = abs(_674);
    float _936 = fma(_926, _398, _796);
    int _938 = ~_928;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    float _944 = _932 * _864;
    float _946 = _932 * _836;
    float _948 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _930);
    float _950 = _932 * _886;
    float _952 = fma(_904, _862, _944);
    float _954 = fma(_904, _834, _946);
    float _956 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _542);
    float _958 = fma(_904, _884, _950);
    int _960 = ~_934;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = fma(_936, _866, _952);
    float _968 = fma(_936, _888, _958);
    float _970 = fma(_936, _838, _954);
    int _972 = _964 * as_type<int>(_784);
    int _974 = ~_906;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = _810 + (-0.5);
    int _982 = abs(_520);
    int _984 = _942 * as_type<int>(_776);
    int _986 = _984 + _972;
    float _988 = _968 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _990 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _992 = abs(_842);
    int _994 = _978 * as_type<int>(_820);
    int _996 = _994 + _986;
    float _998 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1002 = _988 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1006 = _990 + _1004;
    int _1008 = ~_992;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1016 = _998 + _1014;
    int _1018 = ~_982;
    int _1020 = _1018 + 1;
    int _1022 = _1020 + 1;
    float _1024 = -_980;
    float _1026 = -_648;
    float _1028 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1026);
    float _1030 = -_956;
    float _1032 = _1030 + 1.0;
    float _1034 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1036 = _1012 * as_type<int>(_828);
    int _1038 = _1036 + _996;
    bool _1040 = !_850;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = -_129;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[76].x, _616);
    float _1048 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1034);
    int _1050 = _1038 * _1022;
    float _1052 = _734 + 0.5;
    float _1054 = -_948;
    float _1056 = _1054 + 1.0;
    float _1058 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1048);
    int _1060 = _738 * _982;
    int _1062 = _1060 + _1050;
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1046);
    bool _1066 = _1058 >= 0.0;
    float _1068 = fma(_810, _1032, _1028);
    float _1070 = _1016 * _1016;
    float _1072 = -_1056;
    float _1074 = fma(_734, _1072, _1064);
    float _1076 = fma(_1002, _1002, _1070);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1080 = fma(_1006, _1006, _1076);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1088 = rsqrt(_1080);
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_1066)
    {
        _1090 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1092 = _1090;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1100 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1106 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1108 = as_type<int>(_1092);
    if (_1066)
    {
        float _1110 = _1092 * 5.0;
        _1108 = as_type<int>(_1110);
    }
    int _1112 = _1108;
    float _1114 = float(_1062);
    float _1116 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1074;
    out.m_64.y = _1068;
    float _1120 = _1116;
    float _1122 = _1118;
    if (_922)
    {
        float _1124 = _908 * _548;
        _131 = _1124;
    }
    float _1126 = _131;
    float _1128 = _1016 * _1088;
    if (_1066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3789 = as_type<float>(_1112);
        out.gl_Position.z = _3789;
    }
    float _1130 = _1002 * _1088;
    out.m_66.x = _1114;
    out.m_68.x = _1102;
    out.m_68.y = _1104;
    out.m_68.z = _1100;
    out.m_68.w = _1084;
    out.m_70.x = _1106;
    out.m_70.y = _1116;
    out.m_70.z = _1118;
    if (_1066)
    {
        out.m_47.x = 0.0;
    }
    if (_1066)
    {
        return out;
    }
    float _1132 = -_1128;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1136 = -_1130;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    int _1140 = _882 ? 0 : 1;
    float _1142 = -_1128;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1016);
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1134 + _1146;
    int _1150 = ~_860;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = _157 + (-0.5);
    int _1158 = _1154;
    int _1160 = as_type<int>(_1144);
    if (!_790)
    {
        int _1162 = ~_860;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1170 = _1138 + _1168;
    float _1172 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1174 = ~_1140;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = -_1130;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    int _1184 = _1178;
    if (!_868)
    {
        int _1186 = ~_1140;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1172);
    float _1194 = in.m_72.x;
    float _1196 = in.m_72.y;
    float _1198 = in.m_72.z;
    float _1200 = _1006 * _1088;
    int _1202 = abs(_1042);
    int _1204 = abs(_872);
    float _1206 = -_1200;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1210 = float(_1190);
    float _1212 = float(_1202);
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1208 + _1214;
    int _1218 = _750 ? 0 : 1;
    float _1220 = float(_1166);
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1192);
    float _1224 = _1212 * _1210;
    int _1226 = ~_1218;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (!_740)
    {
        int _1234 = ~_1218;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    bool _1240 = _1222 >= 0.0;
    float _1242 = _1224 * (-2.0);
    float _1244 = float(_1204);
    float _1246 = _155 + (-0.5);
    int _1248 = abs(_892);
    float _1250 = fma(_1242, _1194, _1194);
    float _1252 = float(_1238);
    float _1254 = _1244 * _1220;
    float _1256 = float(_1248);
    float _1258 = fma(_662, _1242, _662);
    float _1260 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1250);
    float _1262 = _1254 * (-2.0);
    float _1264 = _155 + _476;
    float _1266 = _1256 * _1252;
    float _1268 = fma(_1258, _1126, _1260);
    float _1270 = fma(_1262, _1196, _1196);
    float _1272 = _1256;
    if (_1240)
    {
        _1272 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1274 = _1272;
    float _1276 = fma(_702, _1262, _702);
    float _1278 = _1268 * 0.15915493667125701904296875;
    float _1280 = _1144 * _1144;
    float _1282 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1270);
    if (_1240)
    {
        float _1284 = _1274 * 5.0;
        _1160 = as_type<int>(_1284);
    }
    int _1286 = _1160;
    float _1288 = _1278 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = fma(_1276, _1126, _1282);
    if (_1240)
    {
        out.m_47.x = 0.0;
    }
    float _1294 = fma(_1182, _1182, _1280);
    float _1296 = _1264 + (-1.0);
    if (_1240)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_1286);
        out.gl_Position.z = _4068;
    }
    float _1298 = _1278 * 6.283185482025146484375;
    float _1300 = sin(_1298);
    float _1302 = _1292 * 0.15915493667125701904296875;
    if (_1240)
    {
        return out;
    }
    float _1304 = in.m_56.y;
    float _1306 = -_1200;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1310 = _1266 * (-2.0);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1314 = in.m_56.x;
    float _1316 = fma(_1308, _1308, _1294);
    float _1318 = fma(_1310, _1198, _1198);
    float _1320 = _476 + (-0.5);
    float _1322 = fma(_1312, _1310, _1312);
    float _1324 = sqrt(_1316);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _314);
    float _1328 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1318);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _310);
    float _1332 = fma(_1322, _1126, _1328);
    float _1334 = _1302 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1332 * 0.15915493667125701904296875;
    float _1340 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1342 = _1302 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = _1088 * _1324;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1350 = _1346 * _1348;
    float _1352 = _1338 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1358 = _1326 * _1350;
    float _1360 = _1356 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1362 = _1300 * _1336;
    float _1364 = _1338 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1346 * _1360;
    float _1370 = _1290 * _1344;
    float _1372 = _1290 * _1336;
    float _1374 = _1330 * _1368;
    float _1376 = _1354 * _1358;
    float _1378 = _1336 * _1354;
    float _1380 = _1344 * _1354;
    float _1382 = _1290 * _1376;
    float _1384 = _1300 * _1344;
    float _1386 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1388 = _1386 * 0.5;
    float _1390 = _1300 * _1376;
    float _1392 = fma(_1366, _1370, _1362);
    float _1394 = -_1358;
    float _1396 = _1366 * _1394;
    float _1398 = fma(_1366, _1362, _1370);
    float _1400 = fma(_1392, _1374, _1382);
    float _1402 = -_1384;
    float _1404 = fma(_1366, _1372, _1402);
    float _1406 = -_1372;
    float _1408 = fma(_1366, _1384, _1406);
    float _1410 = fma(_1380, _1374, _1396);
    float _1412 = fma(_1404, _1388, _1400);
    float _1414 = fma(_1408, _1374, _1390);
    float _1416 = fma(_1378, _1388, _1410);
    float _1418 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = fma(_1398, _1388, _1414);
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1418);
    float _1428 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1424);
    float _1432 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1426);
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1428);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    float _1438 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1442 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1444 = precise::clamp(_1442, 0.0, 1.0);
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1448 = _988 + _1438;
    float _1450 = _990 + _1440;
    float _1452 = fma(_1444, -0.64999997615814208984375, 1.0);
    float _1454 = _998 + _1446;
    float _1456 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1458 = _1448 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1462 = _1450 + _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1466 = _1454 + _1464;
    float _1468 = fma(_1458, _1452, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1470 = fma(_1462, _1452, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1472 = fma(_1466, _1452, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1476 = _1468 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1480 = _1470 + _1478;
    float _1482 = _1476 * _1476;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = _1466;
    float _1494 = _1436;
    float _1496 = _1452;
    float _1498 = _1470;
    float _1500 = _1468;
    if (!_1490)
    {
        _1492 = _1470;
    }
    float _1502 = _1492;
    float _1504 = _1502;
    if (!_1490)
    {
        _1494 = _1484;
    }
    float _1506 = _1494;
    float _1508 = _1506;
    if (!_1490)
    {
        _1496 = _1482;
    }
    float _1510 = _1496;
    float _1512 = _1510;
    if (!_1490)
    {
        _1498 = _1472;
    }
    float _1514 = _1498;
    bool _1516 = !_1490;
    float _1518 = _1514;
    if (!_1516)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1524 = _1488 + _1522;
        float _1526 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = rsqrt(_1486);
        float _1530 = _1524 * _1520;
        float _1532 = _1530 * 0.15915493667125701904296875;
        float _1534 = _1532 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 * 6.283185482025146484375;
        float _1540 = cos(_1538);
        float _1542 = fma(_1536, _1526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1544 = _1528 * _1542;
        float _1546 = _1540 + (-1.0);
        float _1548 = fma(_1476, _1544, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1550 = fma(_1480, _1544, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1552 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1556 = _1548 + _1554;
        float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1560 = _1550 + _1558;
        float _1562 = fma(_1472, _1540, _1552);
        float _1564 = _1556 * _1556;
        float _1566 = _1560 * _1560;
        _1518 = _1562;
        _1512 = _1564;
        _1508 = _1566;
        _1500 = _1548;
        _1504 = _1550;
    }
    float _1568 = _1518;
    float _1570 = _1512;
    float _1572 = _1508;
    float _1574 = _1500;
    float _1576 = _1504;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1580 = _1568 + _1578;
    out.m_68.x = _1102;
    out.m_68.y = _1104;
    out.m_68.z = _1100;
    out.m_68.w = _1084;
    float _1582 = fma(_1580, _1580, _1570);
    out.m_70.x = _1106;
    out.m_70.y = _1116;
    out.m_70.z = _1118;
    float _1584 = _1582 + _1572;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1590 = isnan(_1586);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1596 = _1592 || _1594;
    float _1598 = _1570;
    if (!_1596)
    {
        _1598 = 1.0;
    }
    float _1600 = _1598;
    bool _1602 = !_1596;
    float _1604 = _1600;
    if (!_1602)
    {
        bool _1606 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1608 = isnan(_1586);
        bool _1610 = _1606 || _1608;
        bool _1612 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1614 = _1610 || _1612;
        if (!_1614)
        {
            float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1618 = _1586 + _1616;
            float _1620 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1622 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1620;
            float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1626 = _1624 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1628 = 1.0 / _1622;
            float _1630 = _1618 * _1628;
            float _1632 = fma(_1630, _1626, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1604 = _1632;
            _1634 = true;
        }
        else
        {
            bool _1636 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1638 = isnan(_1586);
            bool _1640 = _1636 || _1638;
            bool _1642 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1644 = _1640 || _1642;
            if (!_1644)
            {
                float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1648 = _1586 + _1646;
                float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1652 = _1650 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1656 = _1654 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1658 = 1.0 / _1652;
                float _1660 = _1648 * _1658;
                float _1662 = fma(_1660, _1656, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1604 = _1662;
                _1634 = true;
            }
            else
            {
                _1604 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1634 = false;
    float _1664 = _1604;
    float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1668 = _1568 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1672 = _1574 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1676 = _1576 + _1674;
    float _1678 = fma(_1668, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1680 = fma(_1672, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1682 = fma(_1676, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1684 = -_1128;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1688 = -_1130;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1692 = -_1200;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1686 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1694 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = fma(_1702, _1702, _1708);
    float _1712 = fma(_1706, _1706, _1710);
    float _1714 = rsqrt(_1712);
    float _1716 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1718 = _1702 * _1716;
    float _1720 = _1706 * _1716;
    float _1722 = _1718 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 + _1724;
    float _1728 = sqrt(_1726);
    bool _1730 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1728 + _1732;
    float _1736 = _1714;
    float _1738 = _1734;
    float _1740 = _1664;
    float _1742 = _1698;
    float _1744 = _1716;
    float _1746 = _1718;
    if (_1730)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1748;
    }
    float _1750 = _1736;
    if (_1730)
    {
        float _1752 = rsqrt(_1726);
        _1120 = _1752;
    }
    float _1754 = _1120;
    float _1756 = _1754;
    if (_1730)
    {
        float _1758 = _1734 * _1750;
        _1738 = _1758;
    }
    float _1760 = _1738;
    if (_1730)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1740 = _1762;
    }
    float _1764 = _1740;
    float _1766 = _1750;
    if (_1730)
    {
        float _1768 = _1764 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1776 = precise::max(0.0, _1774);
    float _1778 = _1706;
    float _1780 = _1776;
    if (_1730)
    {
        float _1782 = _1764 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        _1778 = _1784;
    }
    float _1786 = _1778;
    float _1788 = -_1716;
    float _1790 = -_1776;
    float _1792 = fma(_1698, _1788, _1790);
    if (!_1730)
    {
        _1742 = _1720;
    }
    float _1794 = _1742;
    float _1796 = _1794;
    if (_1730)
    {
        float _1798 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1798;
    }
    float _1800 = _1780;
    float _1802 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = _1772;
    float _1806 = _1800;
    if (_1730)
    {
        float _1808 = fma(_1772, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1808;
    }
    float _1810 = _1122;
    if (!_1730)
    {
        _1804 = _1792;
    }
    float _1812 = _1804;
    float _1814 = _1812;
    float _1816 = _1786;
    if (_1730)
    {
        float _1818 = _1786 + (-1.0);
        _1806 = _1818;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1730)
    {
        float _1824 = _1754 * _1810;
        _1744 = _1824;
    }
    float _1826 = _1744;
    float _1828 = sqrt(_1712);
    if (_1730)
    {
        float _1830 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1830;
    }
    float _1832 = _1756;
    if (_1730)
    {
        float _1834 = _1718 * _1826;
        _1746 = _1834;
    }
    float _1836 = _1746;
    if (!_1730)
    {
        _1822 = _1722;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1730)
    {
        float _1842 = _1720 * _1826;
        _1796 = _1842;
    }
    float _1844 = _1796;
    if (_1730)
    {
        float _1846 = fma(_1792, _1786, _1832);
        _1814 = _1846;
    }
    float _1848 = _1814;
    if (_1730)
    {
        float _1850 = _1836 * _1836;
        _1840 = _1850;
    }
    float _1852 = _1840;
    if (!_1730)
    {
        _1816 = _1724;
    }
    float _1854 = _1816;
    float _1856 = _1854;
    if (_1730)
    {
        float _1858 = _1844 * _1844;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = fma(_1848, _1848, _1852);
    float _1864 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1866 = _1862 + _1860;
    float _1868 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1864);
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = rsqrt(_1866);
    float _1880 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1882 = -_1874;
    float _1884 = _1882 + 1.0;
    float _1886 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1890 = _1880 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1894 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1886);
    float _1896 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1888);
    float _1898 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1900 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1902 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1894);
    float _1904 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1906 = -_1898;
    float _1908 = fma(_1906, _1892, 1.0);
    float _1910 = abs(_1884);
    float _1912 = log2(_1910);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1918 = _1878 * _1836;
    float _1920 = _1878 * _1848;
    float _1922 = _1878 * _1844;
    float _1924 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1916);
    float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1900);
    float _1930 = log2(_1908);
    float _1932 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1924);
    float _1934 = -_1926;
    float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1934);
    float _1938 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1940 = -_1922;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1936);
    float _1944 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1948 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1950 = fma(_1942, -0.5, 0.5);
    float _1952 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1954 = 1.0 / _1946;
    float _1956 = fma(_1942, 0.5, 0.5);
    float _1958 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1948);
    float _1960 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1952);
    float _1962 = _1920 + 1.0;
    float _1964 = fma(_1956, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1968 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = exp2(_1944);
    float _1972 = fma(_1956, _1964, -0.212114393711090087890625);
    float _1974 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1966);
    float _1976 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1978 = _1930 * 0.693147182464599609375;
    float _1980 = fma(_1956, _1972, 1.570728778839111328125);
    float _1982 = sqrt(_1950);
    float _1984 = _1974 * _1954;
    float _1986 = fma(_1984, 0.5, 0.5);
    float _1988 = -_1920;
    float _1990 = fma(_1970, _1962, _1988);
    float _1992 = _1976 * _1954;
    float _1994 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1996 = fma(_1990, 0.5, 0.5);
    float _1998 = fma(_1992, -0.5, 0.5);
    float _2000 = _1982 * 0.636619746685028076171875;
    float _2002 = -_1980;
    float _2004 = fma(_2000, _2002, 1.0);
    float3 _5256 = float3(_1986, _1998, _1994);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5256, float3(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5256, float3(0.0), isnan(_5256)), level(0.0)).x;
    float3 _5267 = float3(_1986, _1998, _1994);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5267, float3(0.0), isnan(_5267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5267, float3(0.0), isnan(_5267)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float2 _5284 = float2(_2004, _1996);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5284, float2(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5284, float2(0.0), isnan(_5284)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2033 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2035 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2037 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2031);
    float _2039 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2041 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2035);
    float _2043 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2037);
    float _2045 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2047 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2049 = 1.0 / _2045;
    float _2051 = _2047 + _2045;
    float _2053 = _2051 * _2049;
    float _2055 = _2053 * 0.5;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2059 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2057);
    float _2061 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2063 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2067 = _2063 || _2065;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    float _2073 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2039);
    float _2075 = exp2(_2061);
    float _2077 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2073);
    float _2079 = 1.0 / _2059;
    float _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2083 = _1938;
    if (_2071)
    {
        _2081 = 1.0;
    }
    float _2085 = _2081;
    float _2087 = _2085;
    if (_2071)
    {
        _2083 = 1.0;
    }
    float _2089 = _2083;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2093 = _2079 * _2091;
    float _2095 = _2089;
    if (!_2071)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2101 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2099;
        float _2103 = _2097 * 0.15915493667125701904296875;
        float _2105 = _2103 * 6.283185482025146484375;
        float _2107 = cos(_2105);
        float _2109 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2111 = _2109 * 0.15915493667125701904296875;
        float _2113 = _2103 * 6.283185482025146484375;
        float _2115 = sin(_2113);
        float _2117 = 1.0 / _2107;
        float _2119 = _2111 * 6.283185482025146484375;
        float _2121 = cos(_2119);
        float _2123 = _2115 * _2117;
        float _2125 = _2111 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        float _2129 = _2121 * _2123;
        float _2131 = 1.0 / _2101;
        float _2133 = 1.0 / _2129;
        float _2135 = _2127 * _2133;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2139 = fma(_2093, _2135, _2137);
        float _2141 = _2139 * _2131;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2087 = _2143;
    }
    float _2145 = _2087;
    if (!_2071)
    {
        float _2147 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2149 = _2147 * 0.15915493667125701904296875;
        float _2151 = _2149 * 6.283185482025146484375;
        float _2153 = cos(_2151);
        float _2155 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2157 = _2155 * 0.15915493667125701904296875;
        float _2159 = _2149 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        float _2163 = 1.0 / _2153;
        float _2165 = _2157 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = _2161 * _2163;
        float _2171 = _2157 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2177 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2175;
        float _2179 = _2167 * _2169;
        float _2181 = 1.0 / _2179;
        float _2183 = 1.0 / _2177;
        float _2185 = _2173 * _2181;
        float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2189 = fma(_2093, _2185, _2187);
        float _2191 = _2189 * _2183;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = -_2193;
        float _2197 = _2195 + 1.0;
        _2095 = _2197;
    }
    float _2199 = _2095;
    float _2201 = _2077 + _1946;
    float _2203 = -_2075;
    float _2205 = _2203 + 1.0;
    float _2207 = _2145 * _2199;
    bool _2209 = _2145 > 0.0;
    bool _2211 = isnan(_2145);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan(0.0);
    bool _2217 = _2213 || _2215;
    float _2219 = _2201 * 0.5;
    float _2221 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2223 = _2207 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2225 = _2199 <= 0.0;
    bool _2227 = !_2217;
    bool _2229 = _2225 || _2227;
    float _2231 = _2221 * _2006;
    float _2233 = -_2221;
    float _2235 = _2233 + 1.0;
    float _2237 = _2017 * _2231;
    float _2239 = _2027 * _2231;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1976;
    out.gl_Position.z = _2077;
    out.gl_Position.w = _1946;
    float _2241 = _2017 * _2235;
    float _2243 = _2223 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = fma(_2023, _2237, _2011);
    float _2247 = fma(_2025, _2237, _2013);
    float _2249 = fma(_2017, _2239, _2015);
    out.m_74.z = _2219;
    out.m_74.w = _1946;
    out.m_47.x = _2243;
    out.m_76.x = _2245;
    out.m_76.y = _2247;
    out.m_76.z = _2249;
    out.m_76.w = _2241;
    if (!_2229)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2251;
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
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1634 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_44.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
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
        out.m_47.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2308 = as_type<float>(_111);
        out.gl_Position.z = _2308;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_49.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = _129;
    if (_125)
    {
        float _133 = float(_95);
        _105 = _133;
    }
    float _135 = _105;
    bool _137 = _129 >= _135;
    bool _139 = !_125;
    bool _141 = _137 || _139;
    float _143 = _135;
    if (_141)
    {
        _143 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _143;
    if (_141)
    {
        out.m_47.x = 0.0;
    }
    if (_141)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_141)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2378 = as_type<float>(_149);
        out.gl_Position.z = _2378;
    }
    if (_141)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _153 = int(_151);
    float _155 = in.m_51.x;
    float _157 = in.m_51.y;
    float _159 = float(_95);
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _165 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _167 = _163 || _165;
    bool _169 = isnan(1.0);
    bool _171 = _167 || _169;
    float _173 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _175 = int(_173);
    float _177 = float(_153);
    float _179 = 1.0 / _159;
    float _181 = float(uint(_175));
    float _183 = 1.0 / _177;
    int _185 = ~_175;
    int _187 = _185 + 1;
    int _189 = ~_175;
    int _191 = _189 + 1;
    float _193 = float(_175);
    float _195 = 1.0 / _181;
    float _197 = _183 * _129;
    float _199 = trunc(_197);
    int _201 = int(_199);
    int _203 = as_type<int>(_195) + (-2);
    float _205 = float(uint(_201));
    float _207 = as_type<float>(_203) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _214 = uint(_211);
    int _216 = _187 * int(_214);
    int _218 = _216 + _201;
    float _220 = float(uint(_218));
    float _222 = as_type<float>(_203) * _220;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _226 = _224 != 0;
    float _228 = trunc(_222);
    float _230 = precise::max(_228, 0.0);
    uint _232 = uint(_230);
    bool _234 = !_226;
    float _236 = _234 ? 7.345489978790283203125 : 1.0;
    float _238 = _236 * _155;
    int _240 = int(_214) + int(_232);
    float _242 = floor(_238);
    float _244 = float(_201);
    int _246 = _191 * _240;
    int _248 = _246 + _201;
    bool _250 = _244 >= _193;
    bool _252 = isnan(_244);
    bool _254 = _250 || _252;
    bool _256 = isnan(_193);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    bool _262 = uint(_248) >= uint(_175);
    float _264 = trunc(_260);
    int _266 = int(_264);
    bool _268 = !_262;
    int _270 = _268 ? 0 : (-1);
    int _272 = as_type<int>(_161) & 1;
    bool _274 = _272 != 0;
    int _276 = as_type<int>(_161) & 2;
    bool _278 = _276 != 0;
    int _280 = ~_240;
    int _282 = _280 + _270;
    int _284 = _282 + 1;
    float _286 = -_242;
    float _288 = _238 + _286;
    float _290 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _292 = _175 * _284;
    int _294 = _292 + _201;
    bool _296 = _175 == 0;
    float _298 = 0.0;
    float _300 = _290;
    if (!_171)
    {
        float _302 = _290 * _290;
        float _304 = _302 * 0.5;
        _298 = _304;
    }
    float _306 = _298;
    bool _308 = !_274;
    float _310 = _308 ? (-0.5) : 0.5;
    bool _312 = !_278;
    float _314 = _312 ? (-0.5) : 0.5;
    float _316 = _306;
    if (!_171)
    {
        float _318 = _306 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _316 = _318;
    }
    float _320 = _316;
    int _322 = ~_266;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    bool _328 = !_296;
    int _330 = _328 ? _294 : (-1);
    bool _332 = !_171;
    float _334 = _320;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _290 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _290);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _334 = _364;
    }
    float _366 = _334;
    bool _368 = !_171;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _290 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _300 = _388;
    }
    float _390 = _300;
    float _392 = _288 * _193;
    float _394 = _193 * _129;
    int _396 = _330 * _326;
    float _398 = in.m_56.w;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _402 = _400 != 0;
    float _404 = _394 * _179;
    float _406 = trunc(_392);
    int _408 = int(_406);
    int _410 = _175 + (-1);
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _414 = _412 != 0;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _422 = _420 != 0;
    bool _424 = !_402;
    int _426 = _424 ? 0 : 1;
    int _428 = _266 * _410;
    int _430 = _428 + _396;
    int _432 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _434 = _432 != 0;
    float _436 = trunc(_404);
    int _438 = int(_436);
    bool _440 = !_418;
    int _442 = _440 ? 0 : 1;
    bool _444 = !_414;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_442);
    bool _450 = !_422;
    int _452 = _450 ? 0 : 1;
    int _454 = abs(_446);
    int _456 = _430 * _448;
    int _458 = abs(_426);
    bool _460 = !_434;
    int _462 = _460 ? 0 : 1;
    int _464 = abs(_452);
    int _466 = _408 * _458;
    int _468 = _466 + _201;
    int _470 = abs(_462);
    int _472 = _438 * _454;
    int _474 = _472 + _456;
    float _476 = in.m_51.z;
    float _478 = float(uint(_468));
    int _480 = _468 * _464;
    int _482 = _480 + _474;
    int _484 = ~_175;
    int _486 = _484 + 1;
    int _488 = _408 * _470;
    int _490 = _488 + _482;
    int _492 = ~_175;
    int _494 = _492 + 1;
    float _496 = as_type<float>(_203) * _478;
    int _498 = ~_175;
    int _500 = _498 + 1;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _504 = float(uint(_490));
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _508 = _506 != 0;
    float _510 = trunc(_496);
    float _512 = precise::max(_510, 0.0);
    uint _514 = uint(_512);
    float _516 = as_type<float>(_203) * _504;
    bool _518 = !_508;
    int _520 = _518 ? 0 : 1;
    int _522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _524 = _522 != 0;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _528 = trunc(_516);
    float _530 = precise::max(_528, 0.0);
    uint _532 = uint(_530);
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _540 = 1.0 + _538;
    float _542 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].w, _536);
    int _544 = _494 * int(_532);
    int _546 = _544 + _490;
    float _548 = 1.0 / _540;
    float _550 = float(uint(_546));
    float _552 = as_type<float>(_203) * _550;
    float _554 = trunc(_552);
    float _556 = precise::max(_554, 0.0);
    uint _558 = uint(_556);
    int _560 = int(_532) + int(_558);
    int _562 = _486 * int(_514);
    int _564 = _562 + _468;
    int _566 = _500 * _560;
    int _568 = _566 + _490;
    float _570 = float(uint(_564));
    bool _572 = uint(_568) >= uint(_175);
    float _574 = as_type<float>(_203) * _570;
    bool _576 = !_572;
    int _578 = _576 ? 0 : (-1);
    float _580 = trunc(_574);
    float _582 = precise::max(_580, 0.0);
    uint _584 = uint(_582);
    int _586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _588 = _586 != 0;
    int _590 = ~_560;
    int _592 = _590 + _578;
    int _594 = _592 + 1;
    int _596 = _175 * _594;
    int _598 = _596 + _490;
    float _600 = _155 * 2.0;
    float _602 = _157 * 2.0;
    bool _604 = !_296;
    int _606 = _604 ? _598 : (-1);
    float _608 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _610 = floor(_600);
    int _612 = int(_514) + int(_584);
    float _614 = -_526;
    float _616 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[77].x, _614);
    int _618 = _606 & 3;
    bool _620 = _618 != 0;
    float _622 = fma(_608, -2.0, _502);
    int _624 = ~_175;
    int _626 = _624 + 1;
    float _628 = _155 + _157;
    bool _630 = uint(_618) > 1u;
    float _632 = floor(_602);
    int _634 = _606 & 3;
    bool _636 = _634 != 0;
    int _638 = _626 * _612;
    int _640 = _638 + _468;
    bool _642 = _618 != 3;
    float _644 = _628 + (-1.0);
    int _646 = _636 ? 0 : 1;
    float _648 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _622);
    bool _650 = uint(_640) >= uint(_175);
    float _652 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _654 = log2(_652);
    int _656 = ~_646;
    int _658 = _656 + 1;
    int _660 = _658 + 1;
    float _662 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _664 = !_650;
    int _666 = _664 ? 0 : (-1);
    int _668 = _660;
    if (!_630)
    {
        int _670 = ~_646;
        int _672 = _670 + 1;
        _668 = _672;
    }
    int _674 = _668;
    float _676 = _157 + _476;
    bool _678 = uint(_618) >= 2u;
    int _680 = ~_612;
    int _682 = _680 + _666;
    int _684 = _682 + 1;
    float _686 = _676 + (-1.0);
    int _688 = _678 ? 0 : 1;
    int _690 = _606 >> 31;
    int _692 = _175 * _684;
    int _694 = _692 + _468;
    int _696 = ~_688;
    int _698 = _696 + 1;
    int _700 = _698 + 1;
    float _702 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _704 = _700;
    if (_642)
    {
        int _706 = ~_688;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    float _712 = _476 * 2.0;
    bool _714 = _155 > 0.5;
    float _716 = in.m_49.x;
    float _718 = in.m_49.y;
    float _720 = in.m_49.z;
    int _722 = _690 & 3;
    float _724 = floor(_712);
    float _726 = -_310;
    int _728 = _714 ? as_type<int>(_726) : as_type<int>(_310);
    int _730 = _606 + _722;
    bool _732 = !_588;
    float _734 = _732 ? _310 : as_type<float>(_728);
    bool _736 = !_296;
    int _738 = _736 ? _694 : (-1);
    bool _740 = _632 > 0.0;
    bool _742 = _632 >= 0.0;
    bool _744 = isnan(_632);
    bool _746 = _742 || _744;
    bool _748 = isnan(0.0);
    bool _750 = _746 || _748;
    float _752 = _654 * _129;
    int _754 = _730 >> 2;
    bool _756 = _157 > 0.5;
    float _758 = exp2(_752);
    int _760 = _754 << 4;
    int _762 = _760 + 368;
    float _764 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _766 = -_314;
    int _768 = _756 ? as_type<int>(_766) : as_type<int>(_314);
    uint _770 = uint(int(uint(_762) >> uint(2)));
    uint _772 = uint(int(uint(int(_770)) >> uint(2)));
    int _774 = int(_770) & 3;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[int(_772)][_774];
    int _778 = int(_770) + 1;
    uint _780 = uint(int(uint(_778) >> uint(2)));
    int _782 = _778 & 3;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[int(_780)][_782];
    bool _786 = _618 != 3;
    float _788 = fma(_390, _716, _764);
    bool _790 = _610 > 0.0;
    float _792 = in.m_44.x;
    float _794 = in.m_44.y;
    float _796 = in.m_44.z;
    bool _798 = _610 >= 0.0;
    bool _800 = isnan(_610);
    bool _802 = _798 || _800;
    bool _804 = isnan(0.0);
    bool _806 = _802 || _804;
    bool _808 = !_524;
    float _810 = _808 ? _314 : as_type<float>(_768);
    int _812 = _762 + 8;
    uint _814 = uint(int(uint(_812) >> uint(2)));
    uint _816 = uint(int(uint(int(_814)) >> uint(2)));
    int _818 = int(_814) & 3;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[int(_816)][_818];
    int _822 = int(_814) + 1;
    uint _824 = uint(int(uint(_822) >> uint(2)));
    int _826 = _822 & 3;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[int(_824)][_826];
    bool _830 = !_620;
    int _832 = _830 ? 0 : 1;
    float _834 = in.m_58.x;
    float _836 = in.m_58.y;
    float _838 = in.m_58.z;
    bool _840 = !_786;
    int _842 = _840 ? 0 : (-1);
    float _844 = -_758;
    float _846 = _844 + 1.0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _854 = _852 != 0;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _858 = _856 != 0;
    int _860 = _806 ? 0 : 1;
    float _862 = in.m_60.x;
    float _864 = in.m_60.y;
    float _866 = in.m_60.z;
    bool _868 = _724 > 0.0;
    bool _870 = !_854;
    int _872 = _870 ? 0 : 1;
    bool _874 = _724 >= 0.0;
    bool _876 = isnan(_724);
    bool _878 = _874 || _876;
    bool _880 = isnan(0.0);
    bool _882 = _878 || _880;
    float _884 = in.m_62.x;
    float _886 = in.m_62.y;
    float _888 = in.m_62.z;
    bool _890 = !_858;
    int _892 = _890 ? 0 : 1;
    bool _894 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _896 = isnan(0.0);
    bool _898 = _894 || _896;
    bool _900 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _902 = _898 || _900;
    float _904 = fma(_788, _398, _792);
    int _906 = abs(_710);
    float _908 = _902 ? _846 : 0.0;
    float _910 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _912 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _914 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _916 = isnan(1.0);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _922 = _918 || _920;
    float _924 = fma(_390, _718, _910);
    float _926 = fma(_390, _720, _912);
    int _928 = abs(_832);
    float _930 = fma(_155, (*spvDescriptorSet0.vp_c9)._m0[78].z, _534);
    float _932 = fma(_924, _398, _794);
    int _934 = abs(_674);
    float _936 = fma(_926, _398, _796);
    int _938 = ~_928;
    int _940 = _938 + 1;
    int _942 = _940 + 1;
    float _944 = _932 * _864;
    float _946 = _932 * _836;
    float _948 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _930);
    float _950 = _932 * _886;
    float _952 = fma(_904, _862, _944);
    float _954 = fma(_904, _834, _946);
    float _956 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _542);
    float _958 = fma(_904, _884, _950);
    int _960 = ~_934;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = fma(_936, _866, _952);
    float _968 = fma(_936, _888, _958);
    float _970 = fma(_936, _838, _954);
    int _972 = _964 * as_type<int>(_784);
    int _974 = ~_906;
    int _976 = _974 + 1;
    int _978 = _976 + 1;
    float _980 = _810 + (-0.5);
    int _982 = abs(_520);
    int _984 = _942 * as_type<int>(_776);
    int _986 = _984 + _972;
    float _988 = _968 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _990 = _970 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _992 = abs(_842);
    int _994 = _978 * as_type<int>(_820);
    int _996 = _994 + _986;
    float _998 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1000 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1002 = _988 + _1000;
    float _1004 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1006 = _990 + _1004;
    int _1008 = ~_992;
    int _1010 = _1008 + 1;
    int _1012 = _1010 + 1;
    float _1014 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1016 = _998 + _1014;
    int _1018 = ~_982;
    int _1020 = _1018 + 1;
    int _1022 = _1020 + 1;
    float _1024 = -_980;
    float _1026 = -_648;
    float _1028 = fma(_1024, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1026);
    float _1030 = -_956;
    float _1032 = _1030 + 1.0;
    float _1034 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1036 = _1012 * as_type<int>(_828);
    int _1038 = _1036 + _996;
    bool _1040 = !_850;
    int _1042 = _1040 ? 0 : 1;
    float _1044 = -_129;
    float _1046 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[76].x, _616);
    float _1048 = fma(_1002, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1034);
    int _1050 = _1038 * _1022;
    float _1052 = _734 + 0.5;
    float _1054 = -_948;
    float _1056 = _1054 + 1.0;
    float _1058 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1048);
    int _1060 = _738 * _982;
    int _1062 = _1060 + _1050;
    float _1064 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1046);
    bool _1066 = _1058 >= 0.0;
    float _1068 = fma(_810, _1032, _1028);
    float _1070 = _1016 * _1016;
    float _1072 = -_1056;
    float _1074 = fma(_734, _1072, _1064);
    float _1076 = fma(_1002, _1002, _1070);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1080 = fma(_1006, _1006, _1076);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1084 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1086 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1088 = rsqrt(_1080);
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[115].x;
    if (_1066)
    {
        _1090 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1092 = _1090;
    float _1094 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1100 = _1078 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1102 = _1094 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1104 = _1096 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1106 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1108 = as_type<int>(_1092);
    if (_1066)
    {
        float _1110 = _1092 * 5.0;
        _1108 = as_type<int>(_1110);
    }
    int _1112 = _1108;
    float _1114 = float(_1062);
    float _1116 = _1086 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_64.x = _1074;
    out.m_64.y = _1068;
    float _1120 = _1116;
    float _1122 = _1118;
    if (_922)
    {
        float _1124 = _908 * _548;
        _131 = _1124;
    }
    float _1126 = _131;
    float _1128 = _1016 * _1088;
    if (_1066)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3789 = as_type<float>(_1112);
        out.gl_Position.z = _3789;
    }
    float _1130 = _1002 * _1088;
    out.m_66.x = _1114;
    out.m_68.x = _1102;
    out.m_68.y = _1104;
    out.m_68.z = _1100;
    out.m_68.w = _1084;
    out.m_70.x = _1106;
    out.m_70.y = _1116;
    out.m_70.z = _1118;
    if (_1066)
    {
        out.m_47.x = 0.0;
    }
    if (_1066)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1132 = -_1128;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _998);
    float _1136 = -_1130;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _988);
    int _1140 = _882 ? 0 : 1;
    float _1142 = -_1128;
    float _1144 = fma(_1142, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1016);
    float _1146 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1148 = _1134 + _1146;
    int _1150 = ~_860;
    int _1152 = _1150 + 1;
    int _1154 = _1152 + 1;
    float _1156 = _157 + (-0.5);
    int _1158 = _1154;
    int _1160 = as_type<int>(_1144);
    if (!_790)
    {
        int _1162 = ~_860;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    float _1168 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1170 = _1138 + _1168;
    float _1172 = _1148 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1174 = ~_1140;
    int _1176 = _1174 + 1;
    int _1178 = _1176 + 1;
    float _1180 = -_1130;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1002);
    int _1184 = _1178;
    if (!_868)
    {
        int _1186 = ~_1140;
        int _1188 = _1186 + 1;
        _1184 = _1188;
    }
    int _1190 = _1184;
    float _1192 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1172);
    float _1194 = in.m_72.x;
    float _1196 = in.m_72.y;
    float _1198 = in.m_72.z;
    float _1200 = _1006 * _1088;
    int _1202 = abs(_1042);
    int _1204 = abs(_872);
    float _1206 = -_1200;
    float _1208 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[18].w, _990);
    float _1210 = float(_1190);
    float _1212 = float(_1202);
    float _1214 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1216 = _1208 + _1214;
    int _1218 = _750 ? 0 : 1;
    float _1220 = float(_1166);
    float _1222 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1192);
    float _1224 = _1212 * _1210;
    int _1226 = ~_1218;
    int _1228 = _1226 + 1;
    int _1230 = _1228 + 1;
    int _1232 = _1230;
    if (!_740)
    {
        int _1234 = ~_1218;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    bool _1240 = _1222 >= 0.0;
    float _1242 = _1224 * (-2.0);
    float _1244 = float(_1204);
    float _1246 = _155 + (-0.5);
    int _1248 = abs(_892);
    float _1250 = fma(_1242, _1194, _1194);
    float _1252 = float(_1238);
    float _1254 = _1244 * _1220;
    float _1256 = float(_1248);
    float _1258 = fma(_662, _1242, _662);
    float _1260 = fma(_1246, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1250);
    float _1262 = _1254 * (-2.0);
    float _1264 = _155 + _476;
    float _1266 = _1256 * _1252;
    float _1268 = fma(_1258, _1126, _1260);
    float _1270 = fma(_1262, _1196, _1196);
    float _1272 = _1256;
    if (_1240)
    {
        _1272 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1274 = _1272;
    float _1276 = fma(_702, _1262, _702);
    float _1278 = _1268 * 0.15915493667125701904296875;
    float _1280 = _1144 * _1144;
    float _1282 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1270);
    if (_1240)
    {
        float _1284 = _1274 * 5.0;
        _1160 = as_type<int>(_1284);
    }
    int _1286 = _1160;
    float _1288 = _1278 * 6.283185482025146484375;
    float _1290 = cos(_1288);
    float _1292 = fma(_1276, _1126, _1282);
    if (_1240)
    {
        out.m_47.x = 0.0;
    }
    float _1294 = fma(_1182, _1182, _1280);
    float _1296 = _1264 + (-1.0);
    if (_1240)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4068 = as_type<float>(_1286);
        out.gl_Position.z = _4068;
    }
    float _1298 = _1278 * 6.283185482025146484375;
    float _1300 = sin(_1298);
    float _1302 = _1292 * 0.15915493667125701904296875;
    if (_1240)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1304 = in.m_56.y;
    float _1306 = -_1200;
    float _1308 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1006);
    float _1310 = _1266 * (-2.0);
    float _1312 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1314 = in.m_56.x;
    float _1316 = fma(_1308, _1308, _1294);
    float _1318 = fma(_1310, _1198, _1198);
    float _1320 = _476 + (-0.5);
    float _1322 = fma(_1312, _1310, _1312);
    float _1324 = sqrt(_1316);
    float _1326 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _314);
    float _1328 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1318);
    float _1330 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _310);
    float _1332 = fma(_1322, _1126, _1328);
    float _1334 = _1302 * 6.283185482025146484375;
    float _1336 = sin(_1334);
    float _1338 = _1332 * 0.15915493667125701904296875;
    float _1340 = _1304 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1342 = _1302 * 6.283185482025146484375;
    float _1344 = cos(_1342);
    float _1346 = _1088 * _1324;
    float _1348 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1350 = _1346 * _1348;
    float _1352 = _1338 * 6.283185482025146484375;
    float _1354 = cos(_1352);
    float _1356 = _1314 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1358 = _1326 * _1350;
    float _1360 = _1356 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1362 = _1300 * _1336;
    float _1364 = _1338 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1346 * _1360;
    float _1370 = _1290 * _1344;
    float _1372 = _1290 * _1336;
    float _1374 = _1330 * _1368;
    float _1376 = _1354 * _1358;
    float _1378 = _1336 * _1354;
    float _1380 = _1344 * _1354;
    float _1382 = _1290 * _1376;
    float _1384 = _1300 * _1344;
    float _1386 = _1346 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1388 = _1386 * 0.5;
    float _1390 = _1300 * _1376;
    float _1392 = fma(_1366, _1370, _1362);
    float _1394 = -_1358;
    float _1396 = _1366 * _1394;
    float _1398 = fma(_1366, _1362, _1370);
    float _1400 = fma(_1392, _1374, _1382);
    float _1402 = -_1384;
    float _1404 = fma(_1366, _1372, _1402);
    float _1406 = -_1372;
    float _1408 = fma(_1366, _1384, _1406);
    float _1410 = fma(_1380, _1374, _1396);
    float _1412 = fma(_1404, _1388, _1400);
    float _1414 = fma(_1408, _1374, _1390);
    float _1416 = fma(_1378, _1388, _1410);
    float _1418 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1420 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = fma(_1398, _1388, _1414);
    float _1424 = _1412 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1426 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1418);
    float _1428 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1430 = fma(_1416, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1424);
    float _1432 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1426);
    float _1434 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1428);
    float _1436 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    float _1438 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1440 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1442 = 0.0 + (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1444 = precise::clamp(_1442, 0.0, 1.0);
    float _1446 = _1436 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1448 = _988 + _1438;
    float _1450 = _990 + _1440;
    float _1452 = fma(_1444, -0.64999997615814208984375, 1.0);
    float _1454 = _998 + _1446;
    float _1456 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1458 = _1448 + _1456;
    float _1460 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1462 = _1450 + _1460;
    float _1464 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1466 = _1454 + _1464;
    float _1468 = fma(_1458, _1452, (*spvDescriptorSet0.vp_c10)._m0[8].w);
    float _1470 = fma(_1462, _1452, (*spvDescriptorSet0.vp_c10)._m0[10].w);
    float _1472 = fma(_1466, _1452, (*spvDescriptorSet0.vp_c10)._m0[9].w);
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1476 = _1468 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1480 = _1470 + _1478;
    float _1482 = _1476 * _1476;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = _1466;
    float _1494 = _1436;
    float _1496 = _1452;
    float _1498 = _1470;
    float _1500 = _1468;
    if (!_1490)
    {
        _1492 = _1470;
    }
    float _1502 = _1492;
    float _1504 = _1502;
    if (!_1490)
    {
        _1494 = _1484;
    }
    float _1506 = _1494;
    float _1508 = _1506;
    if (!_1490)
    {
        _1496 = _1482;
    }
    float _1510 = _1496;
    float _1512 = _1510;
    if (!_1490)
    {
        _1498 = _1472;
    }
    float _1514 = _1498;
    bool _1516 = !_1490;
    float _1518 = _1514;
    if (!_1516)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1524 = _1488 + _1522;
        float _1526 = _1472 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = rsqrt(_1486);
        float _1530 = _1524 * _1520;
        float _1532 = _1530 * 0.15915493667125701904296875;
        float _1534 = _1532 * 6.283185482025146484375;
        float _1536 = sin(_1534);
        float _1538 = _1532 * 6.283185482025146484375;
        float _1540 = cos(_1538);
        float _1542 = fma(_1536, _1526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1544 = _1528 * _1542;
        float _1546 = _1540 + (-1.0);
        float _1548 = fma(_1476, _1544, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1550 = fma(_1480, _1544, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1552 = _1546 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1556 = _1548 + _1554;
        float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1560 = _1550 + _1558;
        float _1562 = fma(_1472, _1540, _1552);
        float _1564 = _1556 * _1556;
        float _1566 = _1560 * _1560;
        _1518 = _1562;
        _1512 = _1564;
        _1508 = _1566;
        _1500 = _1548;
        _1504 = _1550;
    }
    float _1568 = _1518;
    float _1570 = _1512;
    float _1572 = _1508;
    float _1574 = _1500;
    float _1576 = _1504;
    float _1578 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1580 = _1568 + _1578;
    out.m_68.x = _1102;
    out.m_68.y = _1104;
    out.m_68.z = _1100;
    out.m_68.w = _1084;
    float _1582 = fma(_1580, _1580, _1570);
    out.m_70.x = _1106;
    out.m_70.y = _1116;
    out.m_70.z = _1118;
    float _1584 = _1582 + _1572;
    float _1586 = sqrt(_1584);
    bool _1588 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1590 = isnan(_1586);
    bool _1592 = _1588 || _1590;
    bool _1594 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1596 = _1592 || _1594;
    float _1598 = _1570;
    if (!_1596)
    {
        _1598 = 1.0;
    }
    float _1600 = _1598;
    bool _1602 = !_1596;
    float _1604 = _1600;
    if (!_1602)
    {
        bool _1606 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1608 = isnan(_1586);
        bool _1610 = _1606 || _1608;
        bool _1612 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1614 = _1610 || _1612;
        if (!_1614)
        {
            float _1616 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1618 = _1586 + _1616;
            float _1620 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1622 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1620;
            float _1624 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1626 = _1624 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1628 = 1.0 / _1622;
            float _1630 = _1618 * _1628;
            float _1632 = fma(_1630, _1626, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1604 = _1632;
            _1634 = true;
        }
        else
        {
            bool _1636 = _1586 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1638 = isnan(_1586);
            bool _1640 = _1636 || _1638;
            bool _1642 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1644 = _1640 || _1642;
            if (!_1644)
            {
                float _1646 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1648 = _1586 + _1646;
                float _1650 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1652 = _1650 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1654 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1656 = _1654 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1658 = 1.0 / _1652;
                float _1660 = _1648 * _1658;
                float _1662 = fma(_1660, _1656, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1604 = _1662;
                _1634 = true;
            }
            else
            {
                _1604 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1634 = false;
    float _1664 = _1604;
    float _1666 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1668 = _1568 + _1666;
    float _1670 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1672 = _1574 + _1670;
    float _1674 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1676 = _1576 + _1674;
    float _1678 = fma(_1668, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1680 = fma(_1672, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1682 = fma(_1676, _1664, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1684 = -_1128;
    float _1686 = fma(_1684, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1678);
    float _1688 = -_1130;
    float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1680);
    float _1692 = -_1200;
    float _1694 = fma(_1692, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1682);
    float _1696 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1698 = _1686 + _1696;
    float _1700 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1702 = _1690 + _1700;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1694 + _1704;
    float _1708 = _1698 * _1698;
    float _1710 = fma(_1702, _1702, _1708);
    float _1712 = fma(_1706, _1706, _1710);
    float _1714 = rsqrt(_1712);
    float _1716 = _1714 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1718 = _1702 * _1716;
    float _1720 = _1706 * _1716;
    float _1722 = _1718 * _1718;
    float _1724 = _1720 * _1720;
    float _1726 = _1722 + _1724;
    float _1728 = sqrt(_1726);
    bool _1730 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1732 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1734 = _1728 + _1732;
    float _1736 = _1714;
    float _1738 = _1734;
    float _1740 = _1664;
    float _1742 = _1698;
    float _1744 = _1716;
    float _1746 = _1718;
    if (_1730)
    {
        float _1748 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1736 = _1748;
    }
    float _1750 = _1736;
    if (_1730)
    {
        float _1752 = rsqrt(_1726);
        _1120 = _1752;
    }
    float _1754 = _1120;
    float _1756 = _1754;
    if (_1730)
    {
        float _1758 = _1734 * _1750;
        _1738 = _1758;
    }
    float _1760 = _1738;
    if (_1730)
    {
        float _1762 = _1760 * 0.15915493667125701904296875;
        _1740 = _1762;
    }
    float _1764 = _1740;
    float _1766 = _1750;
    if (_1730)
    {
        float _1768 = _1764 * 6.283185482025146484375;
        float _1770 = sin(_1768);
        _1766 = _1770;
    }
    float _1772 = _1766;
    float _1774 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1776 = precise::max(0.0, _1774);
    float _1778 = _1706;
    float _1780 = _1776;
    if (_1730)
    {
        float _1782 = _1764 * 6.283185482025146484375;
        float _1784 = cos(_1782);
        _1778 = _1784;
    }
    float _1786 = _1778;
    float _1788 = -_1716;
    float _1790 = -_1776;
    float _1792 = fma(_1698, _1788, _1790);
    if (!_1730)
    {
        _1742 = _1720;
    }
    float _1794 = _1742;
    float _1796 = _1794;
    if (_1730)
    {
        float _1798 = _1792 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1780 = _1798;
    }
    float _1800 = _1780;
    float _1802 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1804 = _1772;
    float _1806 = _1800;
    if (_1730)
    {
        float _1808 = fma(_1772, _1800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1122 = _1808;
    }
    float _1810 = _1122;
    if (!_1730)
    {
        _1804 = _1792;
    }
    float _1812 = _1804;
    float _1814 = _1812;
    float _1816 = _1786;
    if (_1730)
    {
        float _1818 = _1786 + (-1.0);
        _1806 = _1818;
    }
    float _1820 = _1806;
    float _1822 = _1820;
    if (_1730)
    {
        float _1824 = _1754 * _1810;
        _1744 = _1824;
    }
    float _1826 = _1744;
    float _1828 = sqrt(_1712);
    if (_1730)
    {
        float _1830 = _1820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1756 = _1830;
    }
    float _1832 = _1756;
    if (_1730)
    {
        float _1834 = _1718 * _1826;
        _1746 = _1834;
    }
    float _1836 = _1746;
    if (!_1730)
    {
        _1822 = _1722;
    }
    float _1838 = _1822;
    float _1840 = _1838;
    if (_1730)
    {
        float _1842 = _1720 * _1826;
        _1796 = _1842;
    }
    float _1844 = _1796;
    if (_1730)
    {
        float _1846 = fma(_1792, _1786, _1832);
        _1814 = _1846;
    }
    float _1848 = _1814;
    if (_1730)
    {
        float _1850 = _1836 * _1836;
        _1840 = _1850;
    }
    float _1852 = _1840;
    if (!_1730)
    {
        _1816 = _1724;
    }
    float _1854 = _1816;
    float _1856 = _1854;
    if (_1730)
    {
        float _1858 = _1844 * _1844;
        _1856 = _1858;
    }
    float _1860 = _1856;
    float _1862 = fma(_1848, _1848, _1852);
    float _1864 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1866 = _1862 + _1860;
    float _1868 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1864);
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1872 = fma(_1828, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1870);
    float _1874 = precise::clamp(_1872, 0.0, 1.0);
    float _1876 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = rsqrt(_1866);
    float _1880 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1868);
    float _1882 = -_1874;
    float _1884 = _1882 + 1.0;
    float _1886 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1890 = _1880 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1892 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1894 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1886);
    float _1896 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1888);
    float _1898 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1900 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1802);
    float _1902 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1894);
    float _1904 = _1896 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1906 = -_1898;
    float _1908 = fma(_1906, _1892, 1.0);
    float _1910 = abs(_1884);
    float _1912 = log2(_1910);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1916 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1918 = _1878 * _1836;
    float _1920 = _1878 * _1848;
    float _1922 = _1878 * _1844;
    float _1924 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1916);
    float _1926 = _1918 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1928 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1900);
    float _1930 = log2(_1908);
    float _1932 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1924);
    float _1934 = -_1926;
    float _1936 = fma(_1920, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1934);
    float _1938 = _1928 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1940 = -_1922;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1936);
    float _1944 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1932);
    float _1948 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1950 = fma(_1942, -0.5, 0.5);
    float _1952 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1954 = 1.0 / _1946;
    float _1956 = fma(_1942, 0.5, 0.5);
    float _1958 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1948);
    float _1960 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1952);
    float _1962 = _1920 + 1.0;
    float _1964 = fma(_1956, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1966 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1958);
    float _1968 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1960);
    float _1970 = exp2(_1944);
    float _1972 = fma(_1956, _1964, -0.212114393711090087890625);
    float _1974 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1966);
    float _1976 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1978 = _1930 * 0.693147182464599609375;
    float _1980 = fma(_1956, _1972, 1.570728778839111328125);
    float _1982 = sqrt(_1950);
    float _1984 = _1974 * _1954;
    float _1986 = fma(_1984, 0.5, 0.5);
    float _1988 = -_1920;
    float _1990 = fma(_1970, _1962, _1988);
    float _1992 = _1976 * _1954;
    float _1994 = _1978 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1996 = fma(_1990, 0.5, 0.5);
    float _1998 = fma(_1992, -0.5, 0.5);
    float _2000 = _1982 * 0.636619746685028076171875;
    float _2002 = -_1980;
    float _2004 = fma(_2000, _2002, 1.0);
    float3 _5256 = float3(_1986, _1998, _1994);
    float _2006 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5256, float3(0.0), isnan(_5256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5256, float3(0.0), isnan(_5256)), level(0.0)).x;
    float3 _5267 = float3(_1986, _1998, _1994);
    float4 _2009 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5267, float3(0.0), isnan(_5267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5267, float3(0.0), isnan(_5267)), level(0.0)).xyzw;
    float _2011 = _2009.x;
    float _2013 = _2009.y;
    float _2015 = _2009.z;
    float _2017 = _2009.w;
    float2 _5284 = float2(_2004, _1996);
    float3 _2021 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5284, float2(0.0), isnan(_5284)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5284, float2(0.0), isnan(_5284)), level(0.0)).xyz;
    float _2023 = _2021.x;
    float _2025 = _2021.y;
    float _2027 = _2021.z;
    float _2029 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2031 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2033 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2035 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2029);
    float _2037 = fma(_1138, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2031);
    float _2039 = fma(_1914, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2033);
    float _2041 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2035);
    float _2043 = fma(_1208, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2037);
    float _2045 = _2041 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2047 = _2043 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2049 = 1.0 / _2045;
    float _2051 = _2047 + _2045;
    float _2053 = _2051 * _2049;
    float _2055 = _2053 * 0.5;
    float _2057 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2059 = fma(_2055, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2057);
    float _2061 = _1912 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2063 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2065 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2067 = _2063 || _2065;
    bool _2069 = isnan(0.5);
    bool _2071 = _2067 || _2069;
    float _2073 = fma(_1890, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2039);
    float _2075 = exp2(_2061);
    float _2077 = fma(_1938, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2073);
    float _2079 = 1.0 / _2059;
    float _2081 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2083 = _1938;
    if (_2071)
    {
        _2081 = 1.0;
    }
    float _2085 = _2081;
    float _2087 = _2085;
    if (_2071)
    {
        _2083 = 1.0;
    }
    float _2089 = _2083;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2093 = _2079 * _2091;
    float _2095 = _2089;
    if (!_2071)
    {
        float _2097 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2101 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2099;
        float _2103 = _2097 * 0.15915493667125701904296875;
        float _2105 = _2103 * 6.283185482025146484375;
        float _2107 = cos(_2105);
        float _2109 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2111 = _2109 * 0.15915493667125701904296875;
        float _2113 = _2103 * 6.283185482025146484375;
        float _2115 = sin(_2113);
        float _2117 = 1.0 / _2107;
        float _2119 = _2111 * 6.283185482025146484375;
        float _2121 = cos(_2119);
        float _2123 = _2115 * _2117;
        float _2125 = _2111 * 6.283185482025146484375;
        float _2127 = sin(_2125);
        float _2129 = _2121 * _2123;
        float _2131 = 1.0 / _2101;
        float _2133 = 1.0 / _2129;
        float _2135 = _2127 * _2133;
        float _2137 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2139 = fma(_2093, _2135, _2137);
        float _2141 = _2139 * _2131;
        float _2143 = precise::clamp(_2141, 0.0, 1.0);
        _2087 = _2143;
    }
    float _2145 = _2087;
    if (!_2071)
    {
        float _2147 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2149 = _2147 * 0.15915493667125701904296875;
        float _2151 = _2149 * 6.283185482025146484375;
        float _2153 = cos(_2151);
        float _2155 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2157 = _2155 * 0.15915493667125701904296875;
        float _2159 = _2149 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        float _2163 = 1.0 / _2153;
        float _2165 = _2157 * 6.283185482025146484375;
        float _2167 = cos(_2165);
        float _2169 = _2161 * _2163;
        float _2171 = _2157 * 6.283185482025146484375;
        float _2173 = sin(_2171);
        float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2177 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2175;
        float _2179 = _2167 * _2169;
        float _2181 = 1.0 / _2179;
        float _2183 = 1.0 / _2177;
        float _2185 = _2173 * _2181;
        float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2189 = fma(_2093, _2185, _2187);
        float _2191 = _2189 * _2183;
        float _2193 = precise::clamp(_2191, 0.0, 1.0);
        float _2195 = -_2193;
        float _2197 = _2195 + 1.0;
        _2095 = _2197;
    }
    float _2199 = _2095;
    float _2201 = _2077 + _1946;
    float _2203 = -_2075;
    float _2205 = _2203 + 1.0;
    float _2207 = _2145 * _2199;
    bool _2209 = _2145 > 0.0;
    bool _2211 = isnan(_2145);
    bool _2213 = _2209 || _2211;
    bool _2215 = isnan(0.0);
    bool _2217 = _2213 || _2215;
    float _2219 = _2201 * 0.5;
    float _2221 = _2205 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2223 = _2207 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2225 = _2199 <= 0.0;
    bool _2227 = !_2217;
    bool _2229 = _2225 || _2227;
    float _2231 = _2221 * _2006;
    float _2233 = -_2221;
    float _2235 = _2233 + 1.0;
    float _2237 = _2017 * _2231;
    float _2239 = _2027 * _2231;
    out.gl_Position.x = _1974;
    out.gl_Position.y = _1976;
    out.gl_Position.z = _2077;
    out.gl_Position.w = _1946;
    float _2241 = _2017 * _2235;
    float _2243 = _2223 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2245 = fma(_2023, _2237, _2011);
    float _2247 = fma(_2025, _2237, _2013);
    float _2249 = fma(_2017, _2239, _2015);
    out.m_74.z = _2219;
    out.m_74.w = _1946;
    out.m_47.x = _2243;
    out.m_76.x = _2245;
    out.m_76.y = _2247;
    out.m_76.z = _2249;
    out.m_76.w = _2241;
    if (!_2229)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2251 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2251;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

