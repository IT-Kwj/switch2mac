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
    float4 m_58 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_56 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1400 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2076 = as_type<float>(_101);
        out.gl_Position.z = _2076;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_137);
        out.gl_Position.z = _2144;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _141 = !_139;
    float _161;
    float _163;
    if (!_141)
    {
        float _143 = in.m_51.x;
        float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _147 = float(_85);
        float _149 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _153 = _151 * _145;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _147;
        _163 = _159;
        _165 = true;
    }
    else
    {
        float _167 = float(_85);
        float _169 = 1.0 / _167;
        float _171 = _119 * _169;
        _161 = _167;
        _163 = _171;
    }
    _165 = false;
    float _173 = _161;
    float _175 = _163;
    float _177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _179 = int(_177);
    float _181 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _183 = int(_181);
    float _185 = float(_179);
    float _187 = 1.0 / _185;
    float _189 = float(uint(_183));
    int _191 = ~_183;
    int _193 = _191 + 1;
    float _195 = 1.0 / _189;
    int _197 = ~_183;
    int _199 = _197 + 1;
    float _201 = float(_183);
    bool _203 = _183 == 0;
    int _205 = ~_183;
    int _207 = _205 + 1;
    float _209 = _119 * _187;
    float _211 = in.m_51.x;
    float _213 = in.m_51.y;
    float _215 = trunc(_209);
    int _217 = int(_215);
    int _219 = as_type<int>(_195) + (-2);
    float _221 = float(uint(_217));
    float _223 = as_type<float>(_219) * _221;
    float _225 = trunc(_223);
    float _227 = precise::max(_225, 0.0);
    uint _230 = uint(_227);
    int _232 = _193 * int(_230);
    int _234 = _232 + _217;
    float _236 = float(uint(_234));
    float _238 = as_type<float>(_219) * _236;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _242 = _240 != 0;
    float _244 = trunc(_238);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    float _250 = float(_217);
    bool _252 = !_242;
    float _254 = _252 ? 7.345489978790283203125 : 1.0;
    float _256 = _254 * _211;
    float _258 = 1.0 / _173;
    int _260 = int(_230) + int(_248);
    float _262 = floor(_256);
    bool _264 = _250 >= _201;
    bool _266 = isnan(_250);
    bool _268 = _264 || _266;
    bool _270 = isnan(_201);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    int _276 = _199 * _260;
    int _278 = _276 + _217;
    int _280 = _183 + (-1);
    float _282 = trunc(_274);
    int _284 = int(_282);
    bool _286 = uint(_278) >= uint(_183);
    bool _288 = !_286;
    int _290 = _288 ? 0 : (-1);
    float _292 = -_262;
    float _294 = _256 + _292;
    int _296 = ~_260;
    int _298 = _296 + _290;
    int _300 = _298 + 1;
    float _302 = _294 * _201;
    float _304 = _119 * _201;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _316 = _314 != 0;
    int _318 = _183 * _300;
    int _320 = _318 + _217;
    int _322 = ~_284;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    float _328 = _304 * _258;
    float _330 = trunc(_302);
    int _332 = int(_330);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _336 = _334 != 0;
    bool _338 = !_203;
    int _340 = _338 ? _320 : (-1);
    bool _342 = !_336;
    int _344 = _342 ? 0 : 1;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _348 = _346 != 0;
    int _350 = _340 * _326;
    bool _352 = !_312;
    int _354 = _352 ? 0 : 1;
    float _356 = trunc(_328);
    int _358 = int(_356);
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _362 = _360 != 0;
    int _364 = _284 * _280;
    int _366 = _364 + _350;
    bool _368 = !_308;
    int _370 = _368 ? 0 : 1;
    int _372 = abs(_354);
    int _374 = abs(_344);
    bool _376 = !_316;
    int _378 = _376 ? 0 : 1;
    int _380 = abs(_370);
    bool _382 = !_348;
    int _384 = _382 ? 0 : 1;
    int _386 = abs(_378);
    int _388 = _366 * _372;
    int _390 = _332 * _374;
    int _392 = _390 + _217;
    int _394 = abs(_384);
    int _396 = _358 * _380;
    int _398 = _396 + _388;
    int _400 = ~_183;
    int _402 = _400 + 1;
    int _404 = ~_183;
    int _406 = _404 + 1;
    int _408 = _392 * _386;
    int _410 = _408 + _398;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _414 = _412 != 0;
    int _416 = _332 * _394;
    int _418 = _416 + _410;
    int _420 = ~_183;
    int _422 = _420 + 1;
    float _424 = as_type<float>(int(gl_VertexIndex));
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = float(uint(_418));
    float _432 = as_type<float>(_219) * _430;
    float _434 = trunc(_432);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    int _440 = _422 * int(_438);
    int _442 = _440 + _418;
    float _444 = float(uint(_442));
    float _446 = as_type<float>(_219) * _444;
    float _448 = trunc(_446);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    int _454 = int(_438) + int(_452);
    float _456 = float(uint(_392));
    int _458 = _402 * _454;
    int _460 = _458 + _418;
    bool _462 = uint(_460) >= uint(_183);
    bool _464 = !_462;
    int _466 = _464 ? 0 : (-1);
    int _468 = ~_454;
    int _470 = _468 + _466;
    int _472 = _470 + 1;
    float _474 = as_type<float>(_219) * _456;
    int _476 = _183 * _472;
    int _478 = _476 + _418;
    float _480 = trunc(_474);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _486;
    bool _490 = !_203;
    int _492 = _490 ? _478 : (-1);
    int _494 = _492 >> 31;
    float _496 = 1.0 / _488;
    int _498 = _492 & 3;
    bool _500 = _498 != 0;
    int _502 = _494 & 3;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _508 = _492 + _502;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _510;
    float _514 = 1.0 / _506;
    int _516 = _406 * int(_484);
    int _518 = _516 + _392;
    int _520 = _508 >> 2;
    int _522 = _520 << 4;
    int _524 = _522 + 368;
    float _526 = float(uint(_518));
    float _528 = 1.0 / _512;
    int _530 = _492 & 3;
    bool _532 = _530 != 0;
    uint _534 = uint(int(uint(_524) >> uint(2)));
    uint _536 = uint(int(uint(int(_534)) >> uint(2)));
    int _538 = int(_534) & 3;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[int(_536)][_538];
    int _542 = int(_534) + 1;
    uint _544 = uint(int(uint(_542) >> uint(2)));
    int _546 = _542 & 3;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[int(_544)][_546];
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _552 = _175 + _550;
    float _554 = as_type<float>(_219) * _526;
    bool _556 = uint(_530) > 1u;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _560 = !_532;
    int _562 = _560 ? 0 : 1;
    float _564 = _211 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _566 = _500 ? 0 : 1;
    float _568 = trunc(_554);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    int _574 = as_type<int>(_424) & 1;
    bool _576 = _574 != 0;
    int _578 = as_type<int>(_424) & 2;
    bool _580 = _578 != 0;
    float _582 = -_558;
    float _584 = fma(_564, 2.0, _582);
    int _586 = ~_566;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _594 = _175 + _592;
    float _596 = _552 * _496;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _600 = _175 + _598;
    float _602 = _594 * _528;
    int _604 = _590;
    float _606 = _584;
    if (!_556)
    {
        int _608 = ~_566;
        int _610 = _608 + 1;
        _604 = _610;
    }
    int _612 = _604;
    float _614 = _600 * _514;
    int _616 = _524 + 8;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    bool _634 = uint(_530) >= 2u;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _636;
    int _640 = abs(_612);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _646 = _634 ? 0 : 1;
    float _648 = fma(_638, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _650 = _530 != 3;
    float _652 = fma(_644, _614, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _654 = int(_484) + int(_572);
    bool _656 = !_650;
    int _658 = _656 ? 0 : (-1);
    bool _660 = _530 != 3;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _670 = ~_646;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_664, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _678 = _207 * _654;
    int _680 = _678 + _392;
    int _682 = ~_640;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = fma(_668, _614, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _690 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _692 = isnan(_175);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    int _702 = abs(_562);
    int _704 = _674;
    if (_660)
    {
        int _706 = ~_646;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    bool _712 = uint(_680) >= uint(_183);
    int _714 = _686 * as_type<int>(_548);
    bool _716 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _718 = isnan(_175);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_700;
    float _730 = _728 + 1.0;
    bool _732 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _734 = isnan(_175);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    bool _744 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _746 = isnan(_175);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _726 * _730;
    float _758 = -_726;
    float _760 = _758 + 1.0;
    int _762 = abs(_710);
    float _764 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _766 = int(_764);
    int _768 = ~_702;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _754 * _760;
    float _776 = -_754;
    float _778 = _776 + 1.0;
    int _780 = ~_762;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    bool _786 = !_712;
    int _788 = _786 ? 0 : (-1);
    int _790 = _772 * as_type<int>(_540);
    int _792 = _790 + _714;
    int _794 = abs(_658);
    float _796 = _742 * _778;
    int _798 = ~_654;
    int _800 = _798 + _788;
    int _802 = _800 + 1;
    int _804 = _784 * as_type<int>(_624);
    int _806 = _804 + _792;
    bool _808 = !_362;
    int _810 = _808 ? 0 : 1;
    float _812 = _648 * _796;
    int _814 = ~_794;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    int _820 = _183 * _802;
    int _822 = _820 + _392;
    int _824 = abs(_810);
    float _826 = _676 * _796;
    float _828 = float(uint(_766));
    int _830 = _818 * as_type<int>(_632);
    int _832 = _830 + _806;
    int _834 = abs(_766);
    float _836 = -_742;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _828;
    float _842 = float(uint(_834));
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[143].x, _812);
    int _846 = ~_824;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    float _852 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[143].y, _826);
    bool _854 = !_203;
    int _856 = _854 ? _822 : (-1);
    int _858 = _832 * _850;
    float _860 = 1.0 / _842;
    float _862 = in.m_56.x;
    float _864 = in.m_56.y;
    int _866 = _856 * _824;
    int _868 = _866 + _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _870;
    float _874 = fma(_652, _774, _844);
    float _876 = fma(_688, _774, _852);
    int _878 = as_type<int>(_840) + (-2);
    float _880 = fma(_872, _602, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _882 = abs(_868);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _884;
    float _888 = float(uint(_868));
    float _890 = fma(_880, _756, _874);
    float _892 = fma(_886, _602, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _894 = as_type<float>(_878) * _888;
    int _896 = as_type<int>(_860) + (-2);
    float _898 = fma(_892, _756, _876);
    float _900 = float(uint(_882));
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _904 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].x, _890);
    float _906 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].y, _898);
    bool _908 = _211 > 0.5;
    float _910 = as_type<float>(_896) * _900;
    float _912 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[78].z, _902);
    float _914 = _904 * _862;
    float _916 = _906 * _864;
    float _918 = trunc(_894);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    float _924 = in.m_44.x;
    float _926 = in.m_44.y;
    float _928 = in.m_44.z;
    float _930 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _932 = ~_834;
    int _934 = _932 + 1;
    float _936 = _213 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _938 = !_580;
    float _940 = _938 ? (-0.5) : 0.5;
    float _942 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _944 = trunc(_910);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    int _950 = ~_766;
    int _952 = _950 + 1;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _940);
    bool _956 = !_576;
    float _958 = _956 ? (-0.5) : 0.5;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _962 = _213 > 0.5;
    int _964 = _952 * int(_922);
    int _966 = _964 + _868;
    float _968 = _930 * _954;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _958);
    float _972 = fma(_936, -2.0, _960);
    float _974 = float(uint(_966));
    float _976 = _942 * _970;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _980 = _934 * int(_948);
    int _982 = _980 + _882;
    float _984 = _926 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _986 = _926 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _992 = float(uint(_982));
    float _994 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[4].x, _984);
    float _996 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _998 = as_type<float>(_878) * _974;
    float _1000 = _926 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1002 = as_type<float>(_896) * _992;
    float _1004 = _968 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1006 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[4].z, _994);
    float _1008 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[6].z, _996);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _990);
    float _1012 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1004);
    float _1014 = trunc(_1002);
    float _1016 = precise::max(_1014, 0.0);
    uint _1018 = uint(_1016);
    float _1020 = _1006 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1022 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1024 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1026 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1028 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1000);
    int _1030 = ~_834;
    int _1032 = _1030 + 1;
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = trunc(_998);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = -_940;
    int _1046 = _962 ? as_type<int>(_1044) : as_type<int>(_940);
    float _1048 = _1020 + _1034;
    float _1050 = _1022 + _1026;
    float _1052 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1060 = _1050 + _1058;
    int _1062 = int(_948) + int(_1018);
    float _1064 = _1056 * _1056;
    float _1066 = _1060 * _1060;
    float _1068 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1028);
    float _1070 = -_958;
    int _1072 = _908 ? as_type<int>(_1070) : as_type<int>(_958);
    float _1074 = _1064 + _1066;
    int _1076 = int(_922) + int(_1040);
    int _1078 = _1032 * _1062;
    int _1080 = _1078 + _882;
    int _1082 = ~_766;
    int _1084 = _1082 + 1;
    float _1086 = sqrt(_1074);
    bool _1088 = !_414;
    float _1090 = _1088 ? _958 : as_type<float>(_1072);
    float _1092 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1094 = uint(_1080) >= uint(_834);
    int _1096 = _1084 * _1076;
    int _1098 = _1096 + _868;
    float _1100 = _968 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1102 = !_428;
    float _1104 = _1102 ? _940 : as_type<float>(_1046);
    float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1108 = uint(_1098) >= uint(_766);
    float _1110 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1100);
    int _1112 = _868 ^ _766;
    bool _1114 = !_1108;
    int _1116 = _1114 ? 0 : (-1);
    float _1118 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1110);
    bool _1120 = !_1094;
    int _1122 = _1120 ? 0 : (-1);
    bool _1124 = _1086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1128 = ~_1076;
    int _1130 = _1128 + _1116;
    int _1132 = _1130 + 1;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1136 = uint(int(uint(_1112) >> uint(31)));
    float _1138 = _1092 + _1126;
    int _1140 = ~_1122;
    int _1142 = _1062 + _1140;
    int _1144 = _1142 + 1;
    int _1146 = _766 * _1132;
    int _1148 = _1146 + _868;
    int _1150 = ~int(_1136);
    int _1152 = _1150 + 1;
    float _1154 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1156 = _766 == 0;
    float _1158 = -_119;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[76].x, _584);
    int _1162 = _1144 ^ _1152;
    bool _1164 = !_1156;
    int _1166 = _1164 ? _1148 : (-1);
    bool _1168 = _766 == 0;
    int _1170 = ~_1152;
    int _1172 = _1170 + _1162;
    int _1174 = _1172 + 1;
    float _1176 = as_type<float>(_766);
    float _1178 = as_type<float>(_1152);
    float _1180 = as_type<float>(_1148);
    float _1182 = _1064;
    float _1184 = _1104;
    float _1186 = _1022;
    if (!_1124)
    {
        _1176 = _1066;
    }
    float _1188 = _1176;
    float _1190 = _1188;
    if (!_1124)
    {
        _606 = _1048;
    }
    float _1192 = _606;
    float _1194 = _1192;
    if (!_1124)
    {
        _1178 = _1050;
    }
    float _1196 = _1178;
    float _1198 = float(_1166);
    float _1200 = _1196;
    if (!_1124)
    {
        _1180 = _1138;
    }
    float _1202 = _1180;
    bool _1204 = !_1124;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1086 + _1210;
        float _1214 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1074);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = cos(_1226);
        float _1230 = fma(_1224, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1216 * _1230;
        float _1234 = _1228 + (-1.0);
        float _1236 = fma(_1056, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1238 = fma(_1060, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1240 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1244 = _1236 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1248 = _1238 + _1246;
        float _1250 = fma(_1138, _1228, _1240);
        float _1252 = _1244 * _1244;
        float _1254 = _1248 * _1248;
        _1206 = _1250;
        _1182 = _1252;
        _1190 = _1254;
        _1194 = _1236;
        _1200 = _1238;
    }
    float _1256 = _1206;
    float _1258 = _1182;
    float _1260 = _1190;
    float _1262 = _1194;
    float _1264 = _1200;
    float _1266 = fma(_1154, _1198, _1160);
    bool _1268 = !_1168;
    int _1270 = _1268 ? _1174 : (-1);
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1274 = _1256 + _1272;
    float _1276 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _972);
    float _1280 = float(_1270);
    float _1282 = _1090 + 0.5;
    float _1284 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _1286 = fma(_1274, _1274, _1258);
    float _1288 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1052);
    float _1290 = -_1278;
    float _1292 = fma(_1276, _1280, _1290);
    float _1294 = fma(_1154, _1282, _1266);
    float _1296 = _1104 + (-0.5);
    float _1298 = -_1284;
    float _1300 = _1298 + 1.0;
    float _1302 = _1286 + _1260;
    float _1304 = -_1276;
    float _1306 = fma(_1304, _1296, _1292);
    float _1308 = -_1300;
    float _1310 = fma(_1090, _1308, _1294);
    float _1312 = -_1288;
    float _1314 = _1312 + 1.0;
    float _1316 = sqrt(_1302);
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = fma(_1104, _1314, _1306);
    out.m_58.x = _1332;
    out.m_58.y = _1336;
    out.m_58.z = _1338;
    out.m_58.w = _1330;
    bool _1348 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1350 = isnan(_1316);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1356 = _1352 || _1354;
    out.m_60.x = _1340;
    out.m_60.y = _1342;
    out.m_60.z = _1344;
    out.m_60.w = _1334;
    out.m_62.x = _1310;
    out.m_62.y = _1346;
    float _1358 = _1316;
    float _1360 = _1340;
    float _1362 = _1346;
    float _1364 = _1342;
    if (!_1356)
    {
        _1184 = 1.0;
    }
    float _1366 = _1184;
    bool _1368 = !_1356;
    float _1370 = _1366;
    if (!_1368)
    {
        bool _1372 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1316);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1316 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1316);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1316 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1428;
                _1400 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1370;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _1262 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1438 = _1256 + _1436;
    bool _1440 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.5);
    bool _1448 = _1444 || _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1452 = _1264 + _1450;
    float _1454 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1456 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1458 = fma(_1452, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1460 = _1452;
    float _1462 = _1430;
    if (_1448)
    {
        _1460 = _1454;
    }
    float _1464 = _1460;
    float _1466 = _1464;
    if (_1448)
    {
        _1358 = _1456;
    }
    float _1468 = _1358;
    float _1470 = _1468;
    if (_1448)
    {
        _1462 = _1458;
    }
    float _1472 = _1462;
    float _1474 = _1472;
    if (!_1448)
    {
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1478 = _1092 + _1476;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1482 = _1020 + _1480;
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1486 = -_1022;
        float _1488 = _1486 + _1458;
        float _1490 = _1478 * _1478;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _1022 + _1492;
        float _1496 = fma(_1482, _1482, _1490);
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1500 = fma(_1494, _1494, _1496);
        float _1502 = sqrt(_1500);
        float _1504 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1506 = precise::min(_1502, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1508 = _1506 * _1498;
        float _1510 = -_1020;
        float _1512 = _1510 + _1454;
        float _1514 = -_1092;
        float _1516 = _1514 + _1456;
        float _1518 = _1504 * _1508;
        float _1520 = fma(_1512, _1518, _1020);
        float _1522 = fma(_1516, _1518, _1092);
        float _1524 = fma(_1488, _1518, _1022);
        _1470 = _1522;
        _1466 = _1520;
        _1474 = _1524;
    }
    float _1526 = _1470;
    float _1528 = _1466;
    float _1530 = _1474;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1534 = _1526 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1528 + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1542 = _1530 + _1540;
    float _1544 = _1534 * _1534;
    float _1546 = fma(_1538, _1538, _1544);
    float _1548 = fma(_1542, _1542, _1546);
    float _1550 = rsqrt(_1548);
    float _1552 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1538 * _1552;
    float _1556 = _1542 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1550;
    float _1574 = _1562;
    float _1576 = _1570;
    float _1578 = _1534;
    if (_1566)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1580;
    }
    float _1582 = _1572;
    if (_1566)
    {
        float _1584 = rsqrt(_1562);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1566)
    {
        float _1590 = _1570 * _1582;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1566)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1360 = _1594;
    }
    float _1596 = _1360;
    float _1598 = _1542;
    if (_1566)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1582;
    float _1612 = _1608;
    if (_1566)
    {
        float _1614 = _1596 * 6.283185482025146484375;
        float _1616 = cos(_1614);
        _1610 = _1616;
    }
    float _1618 = _1610;
    float _1620 = -_1552;
    float _1622 = -_1608;
    float _1624 = fma(_1534, _1620, _1622);
    if (_1566)
    {
        float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1626;
    }
    float _1628 = _1578;
    float _1630 = sqrt(_1548);
    float _1632 = _1628;
    float _1634 = _1604;
    if (_1566)
    {
        float _1636 = fma(_1604, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (!_1566)
    {
        _1634 = _1554;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    float _1646 = _1618;
    if (_1566)
    {
        float _1648 = _1618 + (-1.0);
        _1612 = _1648;
    }
    float _1650 = _1612;
    float _1652 = _1650;
    if (_1566)
    {
        float _1654 = _1586 * _1638;
        _1362 = _1654;
    }
    float _1656 = _1362;
    if (!_1566)
    {
        _1640 = _1624;
    }
    float _1658 = _1640;
    float _1660 = _1658;
    if (_1566)
    {
        float _1662 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1662;
    }
    float _1664 = _1364;
    if (_1566)
    {
        float _1666 = _1554 * _1656;
        _1644 = _1666;
    }
    float _1668 = _1644;
    if (!_1566)
    {
        _1652 = _1556;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1566)
    {
        float _1674 = _1556 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (!_1566)
    {
        _1588 = _1558;
    }
    float _1678 = _1588;
    float _1680 = _1678;
    if (_1566)
    {
        float _1682 = fma(_1624, _1618, _1664);
        _1660 = _1682;
    }
    float _1684 = _1660;
    if (_1566)
    {
        float _1686 = _1668 * _1668;
        _1680 = _1686;
    }
    float _1688 = _1680;
    if (!_1566)
    {
        _1646 = _1560;
    }
    float _1690 = _1646;
    float _1692 = _1690;
    if (_1566)
    {
        float _1694 = _1676 * _1676;
        _1692 = _1694;
    }
    float _1696 = _1692;
    float _1698 = fma(_1684, _1684, _1688);
    float _1700 = _1698 + _1696;
    float _1702 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1706 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1704);
    float _1708 = precise::clamp(_1706, 0.0, 1.0);
    float _1710 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1712 = rsqrt(_1700);
    float _1714 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1716 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1718 = -_1708;
    float _1720 = _1718 + 1.0;
    float _1722 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1726 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1716);
    float _1728 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1730 = abs(_1720);
    float _1732 = log2(_1730);
    float _1734 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1736 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1738 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1740 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1728);
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1744 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = _1712 * _1668;
    float _1750 = -_1742;
    float _1752 = fma(_1750, _1710, 1.0);
    float _1754 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1712 * _1684;
    float _1762 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1764 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1712 * _1676;
    float _1770 = -_1762;
    float _1772 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1770);
    float _1774 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1776 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1752);
    float _1780 = -_1768;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1772);
    float _1784 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1790 = fma(_1782, -0.5, 0.5);
    float _1792 = fma(_1782, 0.5, 0.5);
    float _1794 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1796 = exp2(_1774);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1788);
    float _1800 = _1760 + 1.0;
    float _1802 = fma(_1792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1804 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1794);
    float _1806 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1792, _1802, -0.212114393711090087890625);
    float _1810 = 1.0 / _1786;
    float _1812 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = _1778 * 0.693147182464599609375;
    float _1816 = fma(_1792, _1808, 1.570728778839111328125);
    float _1818 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = sqrt(_1790);
    float _1822 = -_1760;
    float _1824 = fma(_1796, _1800, _1822);
    float _1826 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1828 = fma(_1824, 0.5, 0.5);
    float _1830 = _1826 * _1810;
    float _1832 = _1812 * _1810;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1820 * 0.636619746685028076171875;
    float3 _4781 = float3(_1834, _1836, _1818);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4781, float3(0.0), isnan(_4781)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4781, float3(0.0), isnan(_4781)), level(0.0)).x;
    float3 _4792 = float3(_1834, _1836, _1818);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4792, float3(0.0), isnan(_4792)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4792, float3(0.0), isnan(_4792)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1816;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _4814 = float2(_1855, _1828);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4814, float2(0.0), isnan(_4814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4814, float2(0.0), isnan(_4814)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    float _1875 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1877 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1879 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1875);
    float _1881 = exp2(_1871);
    float _1883 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1885 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.5);
    bool _1895 = _1891 || _1893;
    float _1897 = 1.0 / _1883;
    float _1899 = _1885 + _1883;
    float _1901 = -_1881;
    float _1903 = _1901 + 1.0;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1895)
    {
        _1186 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1907 = _1186;
    float _1909 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1911 = _1899 * _1897;
    float _1913 = _1911 * 0.5;
    float _1915 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1917 = _1913;
    float _1919 = _1907;
    float _1921 = _1915;
    if (!_1895)
    {
        float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1925 = fma(_1913, _1907, _1923);
        _1917 = _1925;
    }
    float _1927 = _1917;
    if (!_1895)
    {
        _1919 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1929 = _1919;
    float _1931 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1933 = _1929;
    if (_1895)
    {
        _1921 = 1.0;
    }
    float _1935 = _1921;
    float _1937 = _1935;
    if (!_1895)
    {
        float _1939 = -_1929;
        float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1905 = _1941;
    }
    float _1943 = _1905;
    float _1945 = _1927;
    if (!_1895)
    {
        float _1947 = 1.0 / _1927;
        _1945 = _1947;
    }
    float _1949 = _1945;
    float _1951 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    float _1953 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1955 = _1826 + _1786;
    float _1957 = _1943;
    if (!_1895)
    {
        float _1959 = 1.0 / _1943;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = _1953 + _1786;
    float _1965 = _1955 * 0.5;
    out.gl_Position.x = _1826;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _1953;
    out.gl_Position.w = _1786;
    float _1967 = _1963 * 0.5;
    if (!_1895)
    {
        float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1971 = -_1929;
        float _1973 = fma(_1949, _1969, _1971);
        _1933 = _1973;
    }
    float _1975 = _1933;
    if (!_1895)
    {
        float _1977 = _1975 * _1961;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1937 = _1979;
    }
    float _1981 = _1937;
    float _1983 = _1786 * 0.5;
    float _1985 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1987 = _1981 > 0.0;
    bool _1989 = isnan(_1981);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1812, -0.5, _1983);
    float _1999 = _1985 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _1965;
    out.m_64.y = _1997;
    out.m_64.z = _1967;
    out.m_64.w = _1786;
    out.m_47.x = _1999;
    float _2001 = _1909 * _1840;
    float _2003 = -_1909;
    float _2005 = _2003 + 1.0;
    float _2007 = _1851 * _2001;
    float _2009 = _1851 * _2005;
    float _2011 = _1865 * _2001;
    float _2013 = fma(_1861, _2007, _1845);
    float _2015 = fma(_1863, _2007, _1847);
    float _2017 = fma(_1851, _2011, _1849);
    out.m_66.x = _2013;
    out.m_66.y = _2015;
    out.m_66.z = _2017;
    out.m_66.w = _2009;
    if (_1995)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2019;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1400 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2076 = as_type<float>(_101);
        out.gl_Position.z = _2076;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_137);
        out.gl_Position.z = _2144;
    }
    if (_131)
    {
        return out;
    }
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _141 = !_139;
    float _161;
    float _163;
    if (!_141)
    {
        float _143 = in.m_51.x;
        float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _147 = float(_85);
        float _149 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _153 = _151 * _145;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _147;
        _163 = _159;
        _165 = true;
    }
    else
    {
        float _167 = float(_85);
        float _169 = 1.0 / _167;
        float _171 = _119 * _169;
        _161 = _167;
        _163 = _171;
    }
    _165 = false;
    float _173 = _161;
    float _175 = _163;
    float _177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _179 = int(_177);
    float _181 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _183 = int(_181);
    float _185 = float(_179);
    float _187 = 1.0 / _185;
    float _189 = float(uint(_183));
    int _191 = ~_183;
    int _193 = _191 + 1;
    float _195 = 1.0 / _189;
    int _197 = ~_183;
    int _199 = _197 + 1;
    float _201 = float(_183);
    bool _203 = _183 == 0;
    int _205 = ~_183;
    int _207 = _205 + 1;
    float _209 = _119 * _187;
    float _211 = in.m_51.x;
    float _213 = in.m_51.y;
    float _215 = trunc(_209);
    int _217 = int(_215);
    int _219 = as_type<int>(_195) + (-2);
    float _221 = float(uint(_217));
    float _223 = as_type<float>(_219) * _221;
    float _225 = trunc(_223);
    float _227 = precise::max(_225, 0.0);
    uint _230 = uint(_227);
    int _232 = _193 * int(_230);
    int _234 = _232 + _217;
    float _236 = float(uint(_234));
    float _238 = as_type<float>(_219) * _236;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _242 = _240 != 0;
    float _244 = trunc(_238);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    float _250 = float(_217);
    bool _252 = !_242;
    float _254 = _252 ? 7.345489978790283203125 : 1.0;
    float _256 = _254 * _211;
    float _258 = 1.0 / _173;
    int _260 = int(_230) + int(_248);
    float _262 = floor(_256);
    bool _264 = _250 >= _201;
    bool _266 = isnan(_250);
    bool _268 = _264 || _266;
    bool _270 = isnan(_201);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    int _276 = _199 * _260;
    int _278 = _276 + _217;
    int _280 = _183 + (-1);
    float _282 = trunc(_274);
    int _284 = int(_282);
    bool _286 = uint(_278) >= uint(_183);
    bool _288 = !_286;
    int _290 = _288 ? 0 : (-1);
    float _292 = -_262;
    float _294 = _256 + _292;
    int _296 = ~_260;
    int _298 = _296 + _290;
    int _300 = _298 + 1;
    float _302 = _294 * _201;
    float _304 = _119 * _201;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _316 = _314 != 0;
    int _318 = _183 * _300;
    int _320 = _318 + _217;
    int _322 = ~_284;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    float _328 = _304 * _258;
    float _330 = trunc(_302);
    int _332 = int(_330);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _336 = _334 != 0;
    bool _338 = !_203;
    int _340 = _338 ? _320 : (-1);
    bool _342 = !_336;
    int _344 = _342 ? 0 : 1;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _348 = _346 != 0;
    int _350 = _340 * _326;
    bool _352 = !_312;
    int _354 = _352 ? 0 : 1;
    float _356 = trunc(_328);
    int _358 = int(_356);
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _362 = _360 != 0;
    int _364 = _284 * _280;
    int _366 = _364 + _350;
    bool _368 = !_308;
    int _370 = _368 ? 0 : 1;
    int _372 = abs(_354);
    int _374 = abs(_344);
    bool _376 = !_316;
    int _378 = _376 ? 0 : 1;
    int _380 = abs(_370);
    bool _382 = !_348;
    int _384 = _382 ? 0 : 1;
    int _386 = abs(_378);
    int _388 = _366 * _372;
    int _390 = _332 * _374;
    int _392 = _390 + _217;
    int _394 = abs(_384);
    int _396 = _358 * _380;
    int _398 = _396 + _388;
    int _400 = ~_183;
    int _402 = _400 + 1;
    int _404 = ~_183;
    int _406 = _404 + 1;
    int _408 = _392 * _386;
    int _410 = _408 + _398;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _414 = _412 != 0;
    int _416 = _332 * _394;
    int _418 = _416 + _410;
    int _420 = ~_183;
    int _422 = _420 + 1;
    float _424 = as_type<float>(int(gl_VertexIndex));
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = float(uint(_418));
    float _432 = as_type<float>(_219) * _430;
    float _434 = trunc(_432);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    int _440 = _422 * int(_438);
    int _442 = _440 + _418;
    float _444 = float(uint(_442));
    float _446 = as_type<float>(_219) * _444;
    float _448 = trunc(_446);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    int _454 = int(_438) + int(_452);
    float _456 = float(uint(_392));
    int _458 = _402 * _454;
    int _460 = _458 + _418;
    bool _462 = uint(_460) >= uint(_183);
    bool _464 = !_462;
    int _466 = _464 ? 0 : (-1);
    int _468 = ~_454;
    int _470 = _468 + _466;
    int _472 = _470 + 1;
    float _474 = as_type<float>(_219) * _456;
    int _476 = _183 * _472;
    int _478 = _476 + _418;
    float _480 = trunc(_474);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _486;
    bool _490 = !_203;
    int _492 = _490 ? _478 : (-1);
    int _494 = _492 >> 31;
    float _496 = 1.0 / _488;
    int _498 = _492 & 3;
    bool _500 = _498 != 0;
    int _502 = _494 & 3;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _508 = _492 + _502;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _510;
    float _514 = 1.0 / _506;
    int _516 = _406 * int(_484);
    int _518 = _516 + _392;
    int _520 = _508 >> 2;
    int _522 = _520 << 4;
    int _524 = _522 + 368;
    float _526 = float(uint(_518));
    float _528 = 1.0 / _512;
    int _530 = _492 & 3;
    bool _532 = _530 != 0;
    uint _534 = uint(int(uint(_524) >> uint(2)));
    uint _536 = uint(int(uint(int(_534)) >> uint(2)));
    int _538 = int(_534) & 3;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[int(_536)][_538];
    int _542 = int(_534) + 1;
    uint _544 = uint(int(uint(_542) >> uint(2)));
    int _546 = _542 & 3;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[int(_544)][_546];
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _552 = _175 + _550;
    float _554 = as_type<float>(_219) * _526;
    bool _556 = uint(_530) > 1u;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _560 = !_532;
    int _562 = _560 ? 0 : 1;
    float _564 = _211 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _566 = _500 ? 0 : 1;
    float _568 = trunc(_554);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    int _574 = as_type<int>(_424) & 1;
    bool _576 = _574 != 0;
    int _578 = as_type<int>(_424) & 2;
    bool _580 = _578 != 0;
    float _582 = -_558;
    float _584 = fma(_564, 2.0, _582);
    int _586 = ~_566;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _594 = _175 + _592;
    float _596 = _552 * _496;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _600 = _175 + _598;
    float _602 = _594 * _528;
    int _604 = _590;
    float _606 = _584;
    if (!_556)
    {
        int _608 = ~_566;
        int _610 = _608 + 1;
        _604 = _610;
    }
    int _612 = _604;
    float _614 = _600 * _514;
    int _616 = _524 + 8;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    bool _634 = uint(_530) >= 2u;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _636;
    int _640 = abs(_612);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _646 = _634 ? 0 : 1;
    float _648 = fma(_638, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _650 = _530 != 3;
    float _652 = fma(_644, _614, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _654 = int(_484) + int(_572);
    bool _656 = !_650;
    int _658 = _656 ? 0 : (-1);
    bool _660 = _530 != 3;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _670 = ~_646;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_664, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _678 = _207 * _654;
    int _680 = _678 + _392;
    int _682 = ~_640;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = fma(_668, _614, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _690 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _692 = isnan(_175);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    int _702 = abs(_562);
    int _704 = _674;
    if (_660)
    {
        int _706 = ~_646;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    bool _712 = uint(_680) >= uint(_183);
    int _714 = _686 * as_type<int>(_548);
    bool _716 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _718 = isnan(_175);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_700;
    float _730 = _728 + 1.0;
    bool _732 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _734 = isnan(_175);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    bool _744 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _746 = isnan(_175);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _726 * _730;
    float _758 = -_726;
    float _760 = _758 + 1.0;
    int _762 = abs(_710);
    float _764 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _766 = int(_764);
    int _768 = ~_702;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _754 * _760;
    float _776 = -_754;
    float _778 = _776 + 1.0;
    int _780 = ~_762;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    bool _786 = !_712;
    int _788 = _786 ? 0 : (-1);
    int _790 = _772 * as_type<int>(_540);
    int _792 = _790 + _714;
    int _794 = abs(_658);
    float _796 = _742 * _778;
    int _798 = ~_654;
    int _800 = _798 + _788;
    int _802 = _800 + 1;
    int _804 = _784 * as_type<int>(_624);
    int _806 = _804 + _792;
    bool _808 = !_362;
    int _810 = _808 ? 0 : 1;
    float _812 = _648 * _796;
    int _814 = ~_794;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    int _820 = _183 * _802;
    int _822 = _820 + _392;
    int _824 = abs(_810);
    float _826 = _676 * _796;
    float _828 = float(uint(_766));
    int _830 = _818 * as_type<int>(_632);
    int _832 = _830 + _806;
    int _834 = abs(_766);
    float _836 = -_742;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _828;
    float _842 = float(uint(_834));
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[143].x, _812);
    int _846 = ~_824;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    float _852 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[143].y, _826);
    bool _854 = !_203;
    int _856 = _854 ? _822 : (-1);
    int _858 = _832 * _850;
    float _860 = 1.0 / _842;
    float _862 = in.m_56.x;
    float _864 = in.m_56.y;
    int _866 = _856 * _824;
    int _868 = _866 + _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _870;
    float _874 = fma(_652, _774, _844);
    float _876 = fma(_688, _774, _852);
    int _878 = as_type<int>(_840) + (-2);
    float _880 = fma(_872, _602, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _882 = abs(_868);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _884;
    float _888 = float(uint(_868));
    float _890 = fma(_880, _756, _874);
    float _892 = fma(_886, _602, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _894 = as_type<float>(_878) * _888;
    int _896 = as_type<int>(_860) + (-2);
    float _898 = fma(_892, _756, _876);
    float _900 = float(uint(_882));
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _904 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].x, _890);
    float _906 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].y, _898);
    bool _908 = _211 > 0.5;
    float _910 = as_type<float>(_896) * _900;
    float _912 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[78].z, _902);
    float _914 = _904 * _862;
    float _916 = _906 * _864;
    float _918 = trunc(_894);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    float _924 = in.m_44.x;
    float _926 = in.m_44.y;
    float _928 = in.m_44.z;
    float _930 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _932 = ~_834;
    int _934 = _932 + 1;
    float _936 = _213 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _938 = !_580;
    float _940 = _938 ? (-0.5) : 0.5;
    float _942 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _944 = trunc(_910);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    int _950 = ~_766;
    int _952 = _950 + 1;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _940);
    bool _956 = !_576;
    float _958 = _956 ? (-0.5) : 0.5;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _962 = _213 > 0.5;
    int _964 = _952 * int(_922);
    int _966 = _964 + _868;
    float _968 = _930 * _954;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _958);
    float _972 = fma(_936, -2.0, _960);
    float _974 = float(uint(_966));
    float _976 = _942 * _970;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _980 = _934 * int(_948);
    int _982 = _980 + _882;
    float _984 = _926 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _986 = _926 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _992 = float(uint(_982));
    float _994 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[4].x, _984);
    float _996 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _998 = as_type<float>(_878) * _974;
    float _1000 = _926 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1002 = as_type<float>(_896) * _992;
    float _1004 = _968 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1006 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[4].z, _994);
    float _1008 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[6].z, _996);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _990);
    float _1012 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1004);
    float _1014 = trunc(_1002);
    float _1016 = precise::max(_1014, 0.0);
    uint _1018 = uint(_1016);
    float _1020 = _1006 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1022 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1024 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1026 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1028 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1000);
    int _1030 = ~_834;
    int _1032 = _1030 + 1;
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = trunc(_998);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = -_940;
    int _1046 = _962 ? as_type<int>(_1044) : as_type<int>(_940);
    float _1048 = _1020 + _1034;
    float _1050 = _1022 + _1026;
    float _1052 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1060 = _1050 + _1058;
    int _1062 = int(_948) + int(_1018);
    float _1064 = _1056 * _1056;
    float _1066 = _1060 * _1060;
    float _1068 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1028);
    float _1070 = -_958;
    int _1072 = _908 ? as_type<int>(_1070) : as_type<int>(_958);
    float _1074 = _1064 + _1066;
    int _1076 = int(_922) + int(_1040);
    int _1078 = _1032 * _1062;
    int _1080 = _1078 + _882;
    int _1082 = ~_766;
    int _1084 = _1082 + 1;
    float _1086 = sqrt(_1074);
    bool _1088 = !_414;
    float _1090 = _1088 ? _958 : as_type<float>(_1072);
    float _1092 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1094 = uint(_1080) >= uint(_834);
    int _1096 = _1084 * _1076;
    int _1098 = _1096 + _868;
    float _1100 = _968 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1102 = !_428;
    float _1104 = _1102 ? _940 : as_type<float>(_1046);
    float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1108 = uint(_1098) >= uint(_766);
    float _1110 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1100);
    int _1112 = _868 ^ _766;
    bool _1114 = !_1108;
    int _1116 = _1114 ? 0 : (-1);
    float _1118 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1110);
    bool _1120 = !_1094;
    int _1122 = _1120 ? 0 : (-1);
    bool _1124 = _1086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1128 = ~_1076;
    int _1130 = _1128 + _1116;
    int _1132 = _1130 + 1;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1136 = uint(int(uint(_1112) >> uint(31)));
    float _1138 = _1092 + _1126;
    int _1140 = ~_1122;
    int _1142 = _1062 + _1140;
    int _1144 = _1142 + 1;
    int _1146 = _766 * _1132;
    int _1148 = _1146 + _868;
    int _1150 = ~int(_1136);
    int _1152 = _1150 + 1;
    float _1154 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1156 = _766 == 0;
    float _1158 = -_119;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[76].x, _584);
    int _1162 = _1144 ^ _1152;
    bool _1164 = !_1156;
    int _1166 = _1164 ? _1148 : (-1);
    bool _1168 = _766 == 0;
    int _1170 = ~_1152;
    int _1172 = _1170 + _1162;
    int _1174 = _1172 + 1;
    float _1176 = as_type<float>(_766);
    float _1178 = as_type<float>(_1152);
    float _1180 = as_type<float>(_1148);
    float _1182 = _1064;
    float _1184 = _1104;
    float _1186 = _1022;
    if (!_1124)
    {
        _1176 = _1066;
    }
    float _1188 = _1176;
    float _1190 = _1188;
    if (!_1124)
    {
        _606 = _1048;
    }
    float _1192 = _606;
    float _1194 = _1192;
    if (!_1124)
    {
        _1178 = _1050;
    }
    float _1196 = _1178;
    float _1198 = float(_1166);
    float _1200 = _1196;
    if (!_1124)
    {
        _1180 = _1138;
    }
    float _1202 = _1180;
    bool _1204 = !_1124;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1086 + _1210;
        float _1214 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1074);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = cos(_1226);
        float _1230 = fma(_1224, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1216 * _1230;
        float _1234 = _1228 + (-1.0);
        float _1236 = fma(_1056, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1238 = fma(_1060, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1240 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1244 = _1236 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1248 = _1238 + _1246;
        float _1250 = fma(_1138, _1228, _1240);
        float _1252 = _1244 * _1244;
        float _1254 = _1248 * _1248;
        _1206 = _1250;
        _1182 = _1252;
        _1190 = _1254;
        _1194 = _1236;
        _1200 = _1238;
    }
    float _1256 = _1206;
    float _1258 = _1182;
    float _1260 = _1190;
    float _1262 = _1194;
    float _1264 = _1200;
    float _1266 = fma(_1154, _1198, _1160);
    bool _1268 = !_1168;
    int _1270 = _1268 ? _1174 : (-1);
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1274 = _1256 + _1272;
    float _1276 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _972);
    float _1280 = float(_1270);
    float _1282 = _1090 + 0.5;
    float _1284 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _1286 = fma(_1274, _1274, _1258);
    float _1288 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1052);
    float _1290 = -_1278;
    float _1292 = fma(_1276, _1280, _1290);
    float _1294 = fma(_1154, _1282, _1266);
    float _1296 = _1104 + (-0.5);
    float _1298 = -_1284;
    float _1300 = _1298 + 1.0;
    float _1302 = _1286 + _1260;
    float _1304 = -_1276;
    float _1306 = fma(_1304, _1296, _1292);
    float _1308 = -_1300;
    float _1310 = fma(_1090, _1308, _1294);
    float _1312 = -_1288;
    float _1314 = _1312 + 1.0;
    float _1316 = sqrt(_1302);
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = fma(_1104, _1314, _1306);
    out.m_58.x = _1332;
    out.m_58.y = _1336;
    out.m_58.z = _1338;
    out.m_58.w = _1330;
    bool _1348 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1350 = isnan(_1316);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1356 = _1352 || _1354;
    out.m_60.x = _1340;
    out.m_60.y = _1342;
    out.m_60.z = _1344;
    out.m_60.w = _1334;
    out.m_62.x = _1310;
    out.m_62.y = _1346;
    float _1358 = _1316;
    float _1360 = _1340;
    float _1362 = _1346;
    float _1364 = _1342;
    if (!_1356)
    {
        _1184 = 1.0;
    }
    float _1366 = _1184;
    bool _1368 = !_1356;
    float _1370 = _1366;
    if (!_1368)
    {
        bool _1372 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1316);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1316 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1316);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1316 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1428;
                _1400 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1370;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _1262 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1438 = _1256 + _1436;
    bool _1440 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.5);
    bool _1448 = _1444 || _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1452 = _1264 + _1450;
    float _1454 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1456 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1458 = fma(_1452, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1460 = _1452;
    float _1462 = _1430;
    if (_1448)
    {
        _1460 = _1454;
    }
    float _1464 = _1460;
    float _1466 = _1464;
    if (_1448)
    {
        _1358 = _1456;
    }
    float _1468 = _1358;
    float _1470 = _1468;
    if (_1448)
    {
        _1462 = _1458;
    }
    float _1472 = _1462;
    float _1474 = _1472;
    if (!_1448)
    {
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1478 = _1092 + _1476;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1482 = _1020 + _1480;
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1486 = -_1022;
        float _1488 = _1486 + _1458;
        float _1490 = _1478 * _1478;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _1022 + _1492;
        float _1496 = fma(_1482, _1482, _1490);
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1500 = fma(_1494, _1494, _1496);
        float _1502 = sqrt(_1500);
        float _1504 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1506 = precise::min(_1502, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1508 = _1506 * _1498;
        float _1510 = -_1020;
        float _1512 = _1510 + _1454;
        float _1514 = -_1092;
        float _1516 = _1514 + _1456;
        float _1518 = _1504 * _1508;
        float _1520 = fma(_1512, _1518, _1020);
        float _1522 = fma(_1516, _1518, _1092);
        float _1524 = fma(_1488, _1518, _1022);
        _1470 = _1522;
        _1466 = _1520;
        _1474 = _1524;
    }
    float _1526 = _1470;
    float _1528 = _1466;
    float _1530 = _1474;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1534 = _1526 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1528 + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1542 = _1530 + _1540;
    float _1544 = _1534 * _1534;
    float _1546 = fma(_1538, _1538, _1544);
    float _1548 = fma(_1542, _1542, _1546);
    float _1550 = rsqrt(_1548);
    float _1552 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1538 * _1552;
    float _1556 = _1542 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1550;
    float _1574 = _1562;
    float _1576 = _1570;
    float _1578 = _1534;
    if (_1566)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1580;
    }
    float _1582 = _1572;
    if (_1566)
    {
        float _1584 = rsqrt(_1562);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1566)
    {
        float _1590 = _1570 * _1582;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1566)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1360 = _1594;
    }
    float _1596 = _1360;
    float _1598 = _1542;
    if (_1566)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1582;
    float _1612 = _1608;
    if (_1566)
    {
        float _1614 = _1596 * 6.283185482025146484375;
        float _1616 = cos(_1614);
        _1610 = _1616;
    }
    float _1618 = _1610;
    float _1620 = -_1552;
    float _1622 = -_1608;
    float _1624 = fma(_1534, _1620, _1622);
    if (_1566)
    {
        float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1626;
    }
    float _1628 = _1578;
    float _1630 = sqrt(_1548);
    float _1632 = _1628;
    float _1634 = _1604;
    if (_1566)
    {
        float _1636 = fma(_1604, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (!_1566)
    {
        _1634 = _1554;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    float _1646 = _1618;
    if (_1566)
    {
        float _1648 = _1618 + (-1.0);
        _1612 = _1648;
    }
    float _1650 = _1612;
    float _1652 = _1650;
    if (_1566)
    {
        float _1654 = _1586 * _1638;
        _1362 = _1654;
    }
    float _1656 = _1362;
    if (!_1566)
    {
        _1640 = _1624;
    }
    float _1658 = _1640;
    float _1660 = _1658;
    if (_1566)
    {
        float _1662 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1662;
    }
    float _1664 = _1364;
    if (_1566)
    {
        float _1666 = _1554 * _1656;
        _1644 = _1666;
    }
    float _1668 = _1644;
    if (!_1566)
    {
        _1652 = _1556;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1566)
    {
        float _1674 = _1556 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (!_1566)
    {
        _1588 = _1558;
    }
    float _1678 = _1588;
    float _1680 = _1678;
    if (_1566)
    {
        float _1682 = fma(_1624, _1618, _1664);
        _1660 = _1682;
    }
    float _1684 = _1660;
    if (_1566)
    {
        float _1686 = _1668 * _1668;
        _1680 = _1686;
    }
    float _1688 = _1680;
    if (!_1566)
    {
        _1646 = _1560;
    }
    float _1690 = _1646;
    float _1692 = _1690;
    if (_1566)
    {
        float _1694 = _1676 * _1676;
        _1692 = _1694;
    }
    float _1696 = _1692;
    float _1698 = fma(_1684, _1684, _1688);
    float _1700 = _1698 + _1696;
    float _1702 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1706 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1704);
    float _1708 = precise::clamp(_1706, 0.0, 1.0);
    float _1710 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1712 = rsqrt(_1700);
    float _1714 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1716 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1718 = -_1708;
    float _1720 = _1718 + 1.0;
    float _1722 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1726 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1716);
    float _1728 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1730 = abs(_1720);
    float _1732 = log2(_1730);
    float _1734 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1736 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1738 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1740 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1728);
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1744 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = _1712 * _1668;
    float _1750 = -_1742;
    float _1752 = fma(_1750, _1710, 1.0);
    float _1754 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1712 * _1684;
    float _1762 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1764 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1712 * _1676;
    float _1770 = -_1762;
    float _1772 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1770);
    float _1774 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1776 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1752);
    float _1780 = -_1768;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1772);
    float _1784 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1790 = fma(_1782, -0.5, 0.5);
    float _1792 = fma(_1782, 0.5, 0.5);
    float _1794 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1796 = exp2(_1774);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1788);
    float _1800 = _1760 + 1.0;
    float _1802 = fma(_1792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1804 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1794);
    float _1806 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1792, _1802, -0.212114393711090087890625);
    float _1810 = 1.0 / _1786;
    float _1812 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = _1778 * 0.693147182464599609375;
    float _1816 = fma(_1792, _1808, 1.570728778839111328125);
    float _1818 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = sqrt(_1790);
    float _1822 = -_1760;
    float _1824 = fma(_1796, _1800, _1822);
    float _1826 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1828 = fma(_1824, 0.5, 0.5);
    float _1830 = _1826 * _1810;
    float _1832 = _1812 * _1810;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1820 * 0.636619746685028076171875;
    float3 _4781 = float3(_1834, _1836, _1818);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4781, float3(0.0), isnan(_4781)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4781, float3(0.0), isnan(_4781)), level(0.0)).x;
    float3 _4792 = float3(_1834, _1836, _1818);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4792, float3(0.0), isnan(_4792)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4792, float3(0.0), isnan(_4792)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1816;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _4814 = float2(_1855, _1828);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4814, float2(0.0), isnan(_4814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4814, float2(0.0), isnan(_4814)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    float _1875 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1877 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1879 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1875);
    float _1881 = exp2(_1871);
    float _1883 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1885 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.5);
    bool _1895 = _1891 || _1893;
    float _1897 = 1.0 / _1883;
    float _1899 = _1885 + _1883;
    float _1901 = -_1881;
    float _1903 = _1901 + 1.0;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1895)
    {
        _1186 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1907 = _1186;
    float _1909 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1911 = _1899 * _1897;
    float _1913 = _1911 * 0.5;
    float _1915 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1917 = _1913;
    float _1919 = _1907;
    float _1921 = _1915;
    if (!_1895)
    {
        float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1925 = fma(_1913, _1907, _1923);
        _1917 = _1925;
    }
    float _1927 = _1917;
    if (!_1895)
    {
        _1919 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1929 = _1919;
    float _1931 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1933 = _1929;
    if (_1895)
    {
        _1921 = 1.0;
    }
    float _1935 = _1921;
    float _1937 = _1935;
    if (!_1895)
    {
        float _1939 = -_1929;
        float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1905 = _1941;
    }
    float _1943 = _1905;
    float _1945 = _1927;
    if (!_1895)
    {
        float _1947 = 1.0 / _1927;
        _1945 = _1947;
    }
    float _1949 = _1945;
    float _1951 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    float _1953 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1955 = _1826 + _1786;
    float _1957 = _1943;
    if (!_1895)
    {
        float _1959 = 1.0 / _1943;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = _1953 + _1786;
    float _1965 = _1955 * 0.5;
    out.gl_Position.x = _1826;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _1953;
    out.gl_Position.w = _1786;
    float _1967 = _1963 * 0.5;
    if (!_1895)
    {
        float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1971 = -_1929;
        float _1973 = fma(_1949, _1969, _1971);
        _1933 = _1973;
    }
    float _1975 = _1933;
    if (!_1895)
    {
        float _1977 = _1975 * _1961;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1937 = _1979;
    }
    float _1981 = _1937;
    float _1983 = _1786 * 0.5;
    float _1985 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1987 = _1981 > 0.0;
    bool _1989 = isnan(_1981);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1812, -0.5, _1983);
    float _1999 = _1985 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _1965;
    out.m_64.y = _1997;
    out.m_64.z = _1967;
    out.m_64.w = _1786;
    out.m_47.x = _1999;
    float _2001 = _1909 * _1840;
    float _2003 = -_1909;
    float _2005 = _2003 + 1.0;
    float _2007 = _1851 * _2001;
    float _2009 = _1851 * _2005;
    float _2011 = _1865 * _2001;
    float _2013 = fma(_1861, _2007, _1845);
    float _2015 = fma(_1863, _2007, _1847);
    float _2017 = fma(_1851, _2011, _1849);
    out.m_66.x = _2013;
    out.m_66.y = _2015;
    out.m_66.z = _2017;
    out.m_66.w = _2009;
    if (_1995)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2019;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1400 = false;
    bool _165 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2076 = as_type<float>(_101);
        out.gl_Position.z = _2076;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2144 = as_type<float>(_137);
        out.gl_Position.z = _2144;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _139 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _141 = !_139;
    float _161;
    float _163;
    if (!_141)
    {
        float _143 = in.m_51.x;
        float _145 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _147 = float(_85);
        float _149 = _143 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _151 = fma(_149, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _153 = _151 * _145;
        float _155 = floor(_153);
        float _157 = -_155;
        float _159 = _153 + _157;
        _161 = _147;
        _163 = _159;
        _165 = true;
    }
    else
    {
        float _167 = float(_85);
        float _169 = 1.0 / _167;
        float _171 = _119 * _169;
        _161 = _167;
        _163 = _171;
    }
    _165 = false;
    float _173 = _161;
    float _175 = _163;
    float _177 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _179 = int(_177);
    float _181 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _183 = int(_181);
    float _185 = float(_179);
    float _187 = 1.0 / _185;
    float _189 = float(uint(_183));
    int _191 = ~_183;
    int _193 = _191 + 1;
    float _195 = 1.0 / _189;
    int _197 = ~_183;
    int _199 = _197 + 1;
    float _201 = float(_183);
    bool _203 = _183 == 0;
    int _205 = ~_183;
    int _207 = _205 + 1;
    float _209 = _119 * _187;
    float _211 = in.m_51.x;
    float _213 = in.m_51.y;
    float _215 = trunc(_209);
    int _217 = int(_215);
    int _219 = as_type<int>(_195) + (-2);
    float _221 = float(uint(_217));
    float _223 = as_type<float>(_219) * _221;
    float _225 = trunc(_223);
    float _227 = precise::max(_225, 0.0);
    uint _230 = uint(_227);
    int _232 = _193 * int(_230);
    int _234 = _232 + _217;
    float _236 = float(uint(_234));
    float _238 = as_type<float>(_219) * _236;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _242 = _240 != 0;
    float _244 = trunc(_238);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    float _250 = float(_217);
    bool _252 = !_242;
    float _254 = _252 ? 7.345489978790283203125 : 1.0;
    float _256 = _254 * _211;
    float _258 = 1.0 / _173;
    int _260 = int(_230) + int(_248);
    float _262 = floor(_256);
    bool _264 = _250 >= _201;
    bool _266 = isnan(_250);
    bool _268 = _264 || _266;
    bool _270 = isnan(_201);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    int _276 = _199 * _260;
    int _278 = _276 + _217;
    int _280 = _183 + (-1);
    float _282 = trunc(_274);
    int _284 = int(_282);
    bool _286 = uint(_278) >= uint(_183);
    bool _288 = !_286;
    int _290 = _288 ? 0 : (-1);
    float _292 = -_262;
    float _294 = _256 + _292;
    int _296 = ~_260;
    int _298 = _296 + _290;
    int _300 = _298 + 1;
    float _302 = _294 * _201;
    float _304 = _119 * _201;
    int _306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _308 = _306 != 0;
    int _310 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _312 = _310 != 0;
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _316 = _314 != 0;
    int _318 = _183 * _300;
    int _320 = _318 + _217;
    int _322 = ~_284;
    int _324 = _322 + 1;
    int _326 = _324 + 1;
    float _328 = _304 * _258;
    float _330 = trunc(_302);
    int _332 = int(_330);
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _336 = _334 != 0;
    bool _338 = !_203;
    int _340 = _338 ? _320 : (-1);
    bool _342 = !_336;
    int _344 = _342 ? 0 : 1;
    int _346 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _348 = _346 != 0;
    int _350 = _340 * _326;
    bool _352 = !_312;
    int _354 = _352 ? 0 : 1;
    float _356 = trunc(_328);
    int _358 = int(_356);
    int _360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _362 = _360 != 0;
    int _364 = _284 * _280;
    int _366 = _364 + _350;
    bool _368 = !_308;
    int _370 = _368 ? 0 : 1;
    int _372 = abs(_354);
    int _374 = abs(_344);
    bool _376 = !_316;
    int _378 = _376 ? 0 : 1;
    int _380 = abs(_370);
    bool _382 = !_348;
    int _384 = _382 ? 0 : 1;
    int _386 = abs(_378);
    int _388 = _366 * _372;
    int _390 = _332 * _374;
    int _392 = _390 + _217;
    int _394 = abs(_384);
    int _396 = _358 * _380;
    int _398 = _396 + _388;
    int _400 = ~_183;
    int _402 = _400 + 1;
    int _404 = ~_183;
    int _406 = _404 + 1;
    int _408 = _392 * _386;
    int _410 = _408 + _398;
    int _412 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _414 = _412 != 0;
    int _416 = _332 * _394;
    int _418 = _416 + _410;
    int _420 = ~_183;
    int _422 = _420 + 1;
    float _424 = as_type<float>(int(gl_VertexIndex));
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = float(uint(_418));
    float _432 = as_type<float>(_219) * _430;
    float _434 = trunc(_432);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    int _440 = _422 * int(_438);
    int _442 = _440 + _418;
    float _444 = float(uint(_442));
    float _446 = as_type<float>(_219) * _444;
    float _448 = trunc(_446);
    float _450 = precise::max(_448, 0.0);
    uint _452 = uint(_450);
    int _454 = int(_438) + int(_452);
    float _456 = float(uint(_392));
    int _458 = _402 * _454;
    int _460 = _458 + _418;
    bool _462 = uint(_460) >= uint(_183);
    bool _464 = !_462;
    int _466 = _464 ? 0 : (-1);
    int _468 = ~_454;
    int _470 = _468 + _466;
    int _472 = _470 + 1;
    float _474 = as_type<float>(_219) * _456;
    int _476 = _183 * _472;
    int _478 = _476 + _418;
    float _480 = trunc(_474);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _486;
    bool _490 = !_203;
    int _492 = _490 ? _478 : (-1);
    int _494 = _492 >> 31;
    float _496 = 1.0 / _488;
    int _498 = _492 & 3;
    bool _500 = _498 != 0;
    int _502 = _494 & 3;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _508 = _492 + _502;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _510;
    float _514 = 1.0 / _506;
    int _516 = _406 * int(_484);
    int _518 = _516 + _392;
    int _520 = _508 >> 2;
    int _522 = _520 << 4;
    int _524 = _522 + 368;
    float _526 = float(uint(_518));
    float _528 = 1.0 / _512;
    int _530 = _492 & 3;
    bool _532 = _530 != 0;
    uint _534 = uint(int(uint(_524) >> uint(2)));
    uint _536 = uint(int(uint(int(_534)) >> uint(2)));
    int _538 = int(_534) & 3;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[int(_536)][_538];
    int _542 = int(_534) + 1;
    uint _544 = uint(int(uint(_542) >> uint(2)));
    int _546 = _542 & 3;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[int(_544)][_546];
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _552 = _175 + _550;
    float _554 = as_type<float>(_219) * _526;
    bool _556 = uint(_530) > 1u;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _560 = !_532;
    int _562 = _560 ? 0 : 1;
    float _564 = _211 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _566 = _500 ? 0 : 1;
    float _568 = trunc(_554);
    float _570 = precise::max(_568, 0.0);
    uint _572 = uint(_570);
    int _574 = as_type<int>(_424) & 1;
    bool _576 = _574 != 0;
    int _578 = as_type<int>(_424) & 2;
    bool _580 = _578 != 0;
    float _582 = -_558;
    float _584 = fma(_564, 2.0, _582);
    int _586 = ~_566;
    int _588 = _586 + 1;
    int _590 = _588 + 1;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _594 = _175 + _592;
    float _596 = _552 * _496;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _600 = _175 + _598;
    float _602 = _594 * _528;
    int _604 = _590;
    float _606 = _584;
    if (!_556)
    {
        int _608 = ~_566;
        int _610 = _608 + 1;
        _604 = _610;
    }
    int _612 = _604;
    float _614 = _600 * _514;
    int _616 = _524 + 8;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    uint _620 = uint(int(uint(int(_618)) >> uint(2)));
    int _622 = int(_618) & 3;
    float _624 = (*spvDescriptorSet0.vp_c9)._m0[int(_620)][_622];
    int _626 = int(_618) + 1;
    uint _628 = uint(int(uint(_626) >> uint(2)));
    int _630 = _626 & 3;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[int(_628)][_630];
    bool _634 = uint(_530) >= 2u;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _636;
    int _640 = abs(_612);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _646 = _634 ? 0 : 1;
    float _648 = fma(_638, _596, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _650 = _530 != 3;
    float _652 = fma(_644, _614, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _654 = int(_484) + int(_572);
    bool _656 = !_650;
    int _658 = _656 ? 0 : (-1);
    bool _660 = _530 != 3;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _662;
    float _666 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _668 = _666 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _670 = ~_646;
    int _672 = _670 + 1;
    int _674 = _672 + 1;
    float _676 = fma(_664, _596, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _678 = _207 * _654;
    int _680 = _678 + _392;
    int _682 = ~_640;
    int _684 = _682 + 1;
    int _686 = _684 + 1;
    float _688 = fma(_668, _614, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    bool _690 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _692 = isnan(_175);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _698 = _694 || _696;
    float _700 = float(_698);
    int _702 = abs(_562);
    int _704 = _674;
    if (_660)
    {
        int _706 = ~_646;
        int _708 = _706 + 1;
        _704 = _708;
    }
    int _710 = _704;
    bool _712 = uint(_680) >= uint(_183);
    int _714 = _686 * as_type<int>(_548);
    bool _716 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _718 = isnan(_175);
    bool _720 = _716 || _718;
    bool _722 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _724 = _720 || _722;
    float _726 = float(_724);
    float _728 = -_700;
    float _730 = _728 + 1.0;
    bool _732 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _734 = isnan(_175);
    bool _736 = _732 || _734;
    bool _738 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _740 = _736 || _738;
    float _742 = float(_740);
    bool _744 = _175 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _746 = isnan(_175);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = _726 * _730;
    float _758 = -_726;
    float _760 = _758 + 1.0;
    int _762 = abs(_710);
    float _764 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _766 = int(_764);
    int _768 = ~_702;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _754 * _760;
    float _776 = -_754;
    float _778 = _776 + 1.0;
    int _780 = ~_762;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    bool _786 = !_712;
    int _788 = _786 ? 0 : (-1);
    int _790 = _772 * as_type<int>(_540);
    int _792 = _790 + _714;
    int _794 = abs(_658);
    float _796 = _742 * _778;
    int _798 = ~_654;
    int _800 = _798 + _788;
    int _802 = _800 + 1;
    int _804 = _784 * as_type<int>(_624);
    int _806 = _804 + _792;
    bool _808 = !_362;
    int _810 = _808 ? 0 : 1;
    float _812 = _648 * _796;
    int _814 = ~_794;
    int _816 = _814 + 1;
    int _818 = _816 + 1;
    int _820 = _183 * _802;
    int _822 = _820 + _392;
    int _824 = abs(_810);
    float _826 = _676 * _796;
    float _828 = float(uint(_766));
    int _830 = _818 * as_type<int>(_632);
    int _832 = _830 + _806;
    int _834 = abs(_766);
    float _836 = -_742;
    float _838 = _836 + 1.0;
    float _840 = 1.0 / _828;
    float _842 = float(uint(_834));
    float _844 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[143].x, _812);
    int _846 = ~_824;
    int _848 = _846 + 1;
    int _850 = _848 + 1;
    float _852 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[143].y, _826);
    bool _854 = !_203;
    int _856 = _854 ? _822 : (-1);
    int _858 = _832 * _850;
    float _860 = 1.0 / _842;
    float _862 = in.m_56.x;
    float _864 = in.m_56.y;
    int _866 = _856 * _824;
    int _868 = _866 + _858;
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _870;
    float _874 = fma(_652, _774, _844);
    float _876 = fma(_688, _774, _852);
    int _878 = as_type<int>(_840) + (-2);
    float _880 = fma(_872, _602, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    int _882 = abs(_868);
    float _884 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _884;
    float _888 = float(uint(_868));
    float _890 = fma(_880, _756, _874);
    float _892 = fma(_886, _602, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _894 = as_type<float>(_878) * _888;
    int _896 = as_type<int>(_860) + (-2);
    float _898 = fma(_892, _756, _876);
    float _900 = float(uint(_882));
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _904 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].x, _890);
    float _906 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[146].y, _898);
    bool _908 = _211 > 0.5;
    float _910 = as_type<float>(_896) * _900;
    float _912 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[78].z, _902);
    float _914 = _904 * _862;
    float _916 = _906 * _864;
    float _918 = trunc(_894);
    float _920 = precise::max(_918, 0.0);
    uint _922 = uint(_920);
    float _924 = in.m_44.x;
    float _926 = in.m_44.y;
    float _928 = in.m_44.z;
    float _930 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _932 = ~_834;
    int _934 = _932 + 1;
    float _936 = _213 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _938 = !_580;
    float _940 = _938 ? (-0.5) : 0.5;
    float _942 = _914 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _944 = trunc(_910);
    float _946 = precise::max(_944, 0.0);
    uint _948 = uint(_946);
    int _950 = ~_766;
    int _952 = _950 + 1;
    float _954 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _940);
    bool _956 = !_576;
    float _958 = _956 ? (-0.5) : 0.5;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _962 = _213 > 0.5;
    int _964 = _952 * int(_922);
    int _966 = _964 + _868;
    float _968 = _930 * _954;
    float _970 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _958);
    float _972 = fma(_936, -2.0, _960);
    float _974 = float(uint(_966));
    float _976 = _942 * _970;
    float _978 = _968 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _980 = _934 * int(_948);
    int _982 = _980 + _882;
    float _984 = _926 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _986 = _926 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _988 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[26].x, _978);
    float _992 = float(uint(_982));
    float _994 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[4].x, _984);
    float _996 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[6].x, _986);
    float _998 = as_type<float>(_878) * _974;
    float _1000 = _926 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1002 = as_type<float>(_896) * _992;
    float _1004 = _968 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1006 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[4].z, _994);
    float _1008 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[6].z, _996);
    float _1010 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _990);
    float _1012 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1004);
    float _1014 = trunc(_1002);
    float _1016 = precise::max(_1014, 0.0);
    uint _1018 = uint(_1016);
    float _1020 = _1006 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1022 = _1008 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1024 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1012);
    float _1026 = _1010 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1028 = fma(_924, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1000);
    int _1030 = ~_834;
    int _1032 = _1030 + 1;
    float _1034 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1036 = trunc(_998);
    float _1038 = precise::max(_1036, 0.0);
    uint _1040 = uint(_1038);
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1044 = -_940;
    int _1046 = _962 ? as_type<int>(_1044) : as_type<int>(_940);
    float _1048 = _1020 + _1034;
    float _1050 = _1022 + _1026;
    float _1052 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1042);
    float _1054 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1056 = _1048 + _1054;
    float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1060 = _1050 + _1058;
    int _1062 = int(_948) + int(_1018);
    float _1064 = _1056 * _1056;
    float _1066 = _1060 * _1060;
    float _1068 = fma(_928, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1028);
    float _1070 = -_958;
    int _1072 = _908 ? as_type<int>(_1070) : as_type<int>(_958);
    float _1074 = _1064 + _1066;
    int _1076 = int(_922) + int(_1040);
    int _1078 = _1032 * _1062;
    int _1080 = _1078 + _882;
    int _1082 = ~_766;
    int _1084 = _1082 + 1;
    float _1086 = sqrt(_1074);
    bool _1088 = !_414;
    float _1090 = _1088 ? _958 : as_type<float>(_1072);
    float _1092 = _1068 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1094 = uint(_1080) >= uint(_834);
    int _1096 = _1084 * _1076;
    int _1098 = _1096 + _868;
    float _1100 = _968 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _1102 = !_428;
    float _1104 = _1102 ? _940 : as_type<float>(_1046);
    float _1106 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1108 = uint(_1098) >= uint(_766);
    float _1110 = fma(_976, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1100);
    int _1112 = _868 ^ _766;
    bool _1114 = !_1108;
    int _1116 = _1114 ? 0 : (-1);
    float _1118 = fma(_988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1110);
    bool _1120 = !_1094;
    int _1122 = _1120 ? 0 : (-1);
    bool _1124 = _1086 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _1128 = ~_1076;
    int _1130 = _1128 + _1116;
    int _1132 = _1130 + 1;
    float _1134 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _1136 = uint(int(uint(_1112) >> uint(31)));
    float _1138 = _1092 + _1126;
    int _1140 = ~_1122;
    int _1142 = _1062 + _1140;
    int _1144 = _1142 + 1;
    int _1146 = _766 * _1132;
    int _1148 = _1146 + _868;
    int _1150 = ~int(_1136);
    int _1152 = _1150 + 1;
    float _1154 = _1106 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1156 = _766 == 0;
    float _1158 = -_119;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[76].x, _584);
    int _1162 = _1144 ^ _1152;
    bool _1164 = !_1156;
    int _1166 = _1164 ? _1148 : (-1);
    bool _1168 = _766 == 0;
    int _1170 = ~_1152;
    int _1172 = _1170 + _1162;
    int _1174 = _1172 + 1;
    float _1176 = as_type<float>(_766);
    float _1178 = as_type<float>(_1152);
    float _1180 = as_type<float>(_1148);
    float _1182 = _1064;
    float _1184 = _1104;
    float _1186 = _1022;
    if (!_1124)
    {
        _1176 = _1066;
    }
    float _1188 = _1176;
    float _1190 = _1188;
    if (!_1124)
    {
        _606 = _1048;
    }
    float _1192 = _606;
    float _1194 = _1192;
    if (!_1124)
    {
        _1178 = _1050;
    }
    float _1196 = _1178;
    float _1198 = float(_1166);
    float _1200 = _1196;
    if (!_1124)
    {
        _1180 = _1138;
    }
    float _1202 = _1180;
    bool _1204 = !_1124;
    float _1206 = _1202;
    if (!_1204)
    {
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1212 = _1086 + _1210;
        float _1214 = _1138 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1216 = rsqrt(_1074);
        float _1218 = _1212 * _1208;
        float _1220 = _1218 * 0.15915493667125701904296875;
        float _1222 = _1220 * 6.283185482025146484375;
        float _1224 = sin(_1222);
        float _1226 = _1220 * 6.283185482025146484375;
        float _1228 = cos(_1226);
        float _1230 = fma(_1224, _1214, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1232 = _1216 * _1230;
        float _1234 = _1228 + (-1.0);
        float _1236 = fma(_1056, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1238 = fma(_1060, _1232, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1240 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1242 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1244 = _1236 + _1242;
        float _1246 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1248 = _1238 + _1246;
        float _1250 = fma(_1138, _1228, _1240);
        float _1252 = _1244 * _1244;
        float _1254 = _1248 * _1248;
        _1206 = _1250;
        _1182 = _1252;
        _1190 = _1254;
        _1194 = _1236;
        _1200 = _1238;
    }
    float _1256 = _1206;
    float _1258 = _1182;
    float _1260 = _1190;
    float _1262 = _1194;
    float _1264 = _1200;
    float _1266 = fma(_1154, _1198, _1160);
    bool _1268 = !_1168;
    int _1270 = _1268 ? _1174 : (-1);
    float _1272 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1274 = _1256 + _1272;
    float _1276 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1278 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _972);
    float _1280 = float(_1270);
    float _1282 = _1090 + 0.5;
    float _1284 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _912);
    float _1286 = fma(_1274, _1274, _1258);
    float _1288 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1052);
    float _1290 = -_1278;
    float _1292 = fma(_1276, _1280, _1290);
    float _1294 = fma(_1154, _1282, _1266);
    float _1296 = _1104 + (-0.5);
    float _1298 = -_1284;
    float _1300 = _1298 + 1.0;
    float _1302 = _1286 + _1260;
    float _1304 = -_1276;
    float _1306 = fma(_1304, _1296, _1292);
    float _1308 = -_1300;
    float _1310 = fma(_1090, _1308, _1294);
    float _1312 = -_1288;
    float _1314 = _1312 + 1.0;
    float _1316 = sqrt(_1302);
    float _1318 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1320 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1322 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1326 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1328 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1330 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1332 = _1318 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1336 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1338 = _1322 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1342 = _1326 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1344 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1346 = fma(_1104, _1314, _1306);
    out.m_58.x = _1332;
    out.m_58.y = _1336;
    out.m_58.z = _1338;
    out.m_58.w = _1330;
    bool _1348 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1350 = isnan(_1316);
    bool _1352 = _1348 || _1350;
    bool _1354 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1356 = _1352 || _1354;
    out.m_60.x = _1340;
    out.m_60.y = _1342;
    out.m_60.z = _1344;
    out.m_60.w = _1334;
    out.m_62.x = _1310;
    out.m_62.y = _1346;
    float _1358 = _1316;
    float _1360 = _1340;
    float _1362 = _1346;
    float _1364 = _1342;
    if (!_1356)
    {
        _1184 = 1.0;
    }
    float _1366 = _1184;
    bool _1368 = !_1356;
    float _1370 = _1366;
    if (!_1368)
    {
        bool _1372 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1374 = isnan(_1316);
        bool _1376 = _1372 || _1374;
        bool _1378 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1380 = _1376 || _1378;
        if (!_1380)
        {
            float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1384 = _1316 + _1382;
            float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1388 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1386;
            float _1390 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1392 = _1390 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1394 = 1.0 / _1388;
            float _1396 = _1384 * _1394;
            float _1398 = fma(_1396, _1392, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1370 = _1398;
            _1400 = true;
        }
        else
        {
            bool _1402 = _1316 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1404 = isnan(_1316);
            bool _1406 = _1402 || _1404;
            bool _1408 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1410 = _1406 || _1408;
            if (!_1410)
            {
                float _1412 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1414 = _1316 + _1412;
                float _1416 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1418 = _1416 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1420 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1422 = _1420 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1424 = 1.0 / _1418;
                float _1426 = _1414 * _1424;
                float _1428 = fma(_1426, _1422, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1370 = _1428;
                _1400 = true;
            }
            else
            {
                _1370 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1400 = false;
    float _1430 = _1370;
    float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1434 = _1262 + _1432;
    float _1436 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1438 = _1256 + _1436;
    bool _1440 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1442 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(0.5);
    bool _1448 = _1444 || _1446;
    float _1450 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1452 = _1264 + _1450;
    float _1454 = fma(_1434, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1456 = fma(_1438, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1458 = fma(_1452, _1430, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1460 = _1452;
    float _1462 = _1430;
    if (_1448)
    {
        _1460 = _1454;
    }
    float _1464 = _1460;
    float _1466 = _1464;
    if (_1448)
    {
        _1358 = _1456;
    }
    float _1468 = _1358;
    float _1470 = _1468;
    if (_1448)
    {
        _1462 = _1458;
    }
    float _1472 = _1462;
    float _1474 = _1472;
    if (!_1448)
    {
        float _1476 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1478 = _1092 + _1476;
        float _1480 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1482 = _1020 + _1480;
        float _1484 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1486 = -_1022;
        float _1488 = _1486 + _1458;
        float _1490 = _1478 * _1478;
        float _1492 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1494 = _1022 + _1492;
        float _1496 = fma(_1482, _1482, _1490);
        float _1498 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1500 = fma(_1494, _1494, _1496);
        float _1502 = sqrt(_1500);
        float _1504 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1506 = precise::min(_1502, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1508 = _1506 * _1498;
        float _1510 = -_1020;
        float _1512 = _1510 + _1454;
        float _1514 = -_1092;
        float _1516 = _1514 + _1456;
        float _1518 = _1504 * _1508;
        float _1520 = fma(_1512, _1518, _1020);
        float _1522 = fma(_1516, _1518, _1092);
        float _1524 = fma(_1488, _1518, _1022);
        _1470 = _1522;
        _1466 = _1520;
        _1474 = _1524;
    }
    float _1526 = _1470;
    float _1528 = _1466;
    float _1530 = _1474;
    float _1532 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1534 = _1526 + _1532;
    float _1536 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1538 = _1528 + _1536;
    float _1540 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1542 = _1530 + _1540;
    float _1544 = _1534 * _1534;
    float _1546 = fma(_1538, _1538, _1544);
    float _1548 = fma(_1542, _1542, _1546);
    float _1550 = rsqrt(_1548);
    float _1552 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1554 = _1538 * _1552;
    float _1556 = _1542 * _1552;
    float _1558 = _1554 * _1554;
    float _1560 = _1556 * _1556;
    float _1562 = _1558 + _1560;
    float _1564 = sqrt(_1562);
    bool _1566 = _1564 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1568 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1570 = _1564 + _1568;
    float _1572 = _1550;
    float _1574 = _1562;
    float _1576 = _1570;
    float _1578 = _1534;
    if (_1566)
    {
        float _1580 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1572 = _1580;
    }
    float _1582 = _1572;
    if (_1566)
    {
        float _1584 = rsqrt(_1562);
        _1574 = _1584;
    }
    float _1586 = _1574;
    float _1588 = _1586;
    if (_1566)
    {
        float _1590 = _1570 * _1582;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1566)
    {
        float _1594 = _1592 * 0.15915493667125701904296875;
        _1360 = _1594;
    }
    float _1596 = _1360;
    float _1598 = _1542;
    if (_1566)
    {
        float _1600 = _1596 * 6.283185482025146484375;
        float _1602 = sin(_1600);
        _1598 = _1602;
    }
    float _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1608 = precise::max(0.0, _1606);
    float _1610 = _1582;
    float _1612 = _1608;
    if (_1566)
    {
        float _1614 = _1596 * 6.283185482025146484375;
        float _1616 = cos(_1614);
        _1610 = _1616;
    }
    float _1618 = _1610;
    float _1620 = -_1552;
    float _1622 = -_1608;
    float _1624 = fma(_1534, _1620, _1622);
    if (_1566)
    {
        float _1626 = _1624 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1626;
    }
    float _1628 = _1578;
    float _1630 = sqrt(_1548);
    float _1632 = _1628;
    float _1634 = _1604;
    if (_1566)
    {
        float _1636 = fma(_1604, _1628, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1632 = _1636;
    }
    float _1638 = _1632;
    float _1640 = _1638;
    if (!_1566)
    {
        _1634 = _1554;
    }
    float _1642 = _1634;
    float _1644 = _1642;
    float _1646 = _1618;
    if (_1566)
    {
        float _1648 = _1618 + (-1.0);
        _1612 = _1648;
    }
    float _1650 = _1612;
    float _1652 = _1650;
    if (_1566)
    {
        float _1654 = _1586 * _1638;
        _1362 = _1654;
    }
    float _1656 = _1362;
    if (!_1566)
    {
        _1640 = _1624;
    }
    float _1658 = _1640;
    float _1660 = _1658;
    if (_1566)
    {
        float _1662 = _1650 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1662;
    }
    float _1664 = _1364;
    if (_1566)
    {
        float _1666 = _1554 * _1656;
        _1644 = _1666;
    }
    float _1668 = _1644;
    if (!_1566)
    {
        _1652 = _1556;
    }
    float _1670 = _1652;
    float _1672 = _1670;
    if (_1566)
    {
        float _1674 = _1556 * _1656;
        _1672 = _1674;
    }
    float _1676 = _1672;
    if (!_1566)
    {
        _1588 = _1558;
    }
    float _1678 = _1588;
    float _1680 = _1678;
    if (_1566)
    {
        float _1682 = fma(_1624, _1618, _1664);
        _1660 = _1682;
    }
    float _1684 = _1660;
    if (_1566)
    {
        float _1686 = _1668 * _1668;
        _1680 = _1686;
    }
    float _1688 = _1680;
    if (!_1566)
    {
        _1646 = _1560;
    }
    float _1690 = _1646;
    float _1692 = _1690;
    if (_1566)
    {
        float _1694 = _1676 * _1676;
        _1692 = _1694;
    }
    float _1696 = _1692;
    float _1698 = fma(_1684, _1684, _1688);
    float _1700 = _1698 + _1696;
    float _1702 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1704 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1706 = fma(_1630, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1704);
    float _1708 = precise::clamp(_1706, 0.0, 1.0);
    float _1710 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1712 = rsqrt(_1700);
    float _1714 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1702);
    float _1716 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1718 = -_1708;
    float _1720 = _1718 + 1.0;
    float _1722 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1714);
    float _1726 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1716);
    float _1728 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1730 = abs(_1720);
    float _1732 = log2(_1730);
    float _1734 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1736 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1722);
    float _1738 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1726);
    float _1740 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1728);
    float _1742 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1744 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1736);
    float _1746 = _1738 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1748 = _1712 * _1668;
    float _1750 = -_1742;
    float _1752 = fma(_1750, _1710, 1.0);
    float _1754 = fma(_1530, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1740);
    float _1756 = _1744 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1758 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1760 = _1712 * _1684;
    float _1762 = _1748 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1764 = _1754 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1766 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1758);
    float _1768 = _1712 * _1676;
    float _1770 = -_1762;
    float _1772 = fma(_1760, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1770);
    float _1774 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1776 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1766);
    float _1778 = log2(_1752);
    float _1780 = -_1768;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1772);
    float _1784 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1786 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1776);
    float _1788 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1790 = fma(_1782, -0.5, 0.5);
    float _1792 = fma(_1782, 0.5, 0.5);
    float _1794 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1784);
    float _1796 = exp2(_1774);
    float _1798 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1788);
    float _1800 = _1760 + 1.0;
    float _1802 = fma(_1792, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1804 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1794);
    float _1806 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1798);
    float _1808 = fma(_1792, _1802, -0.212114393711090087890625);
    float _1810 = 1.0 / _1786;
    float _1812 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1806);
    float _1814 = _1778 * 0.693147182464599609375;
    float _1816 = fma(_1792, _1808, 1.570728778839111328125);
    float _1818 = _1814 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1820 = sqrt(_1790);
    float _1822 = -_1760;
    float _1824 = fma(_1796, _1800, _1822);
    float _1826 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1804);
    float _1828 = fma(_1824, 0.5, 0.5);
    float _1830 = _1826 * _1810;
    float _1832 = _1812 * _1810;
    float _1834 = fma(_1830, 0.5, 0.5);
    float _1836 = fma(_1832, -0.5, 0.5);
    float _1838 = _1820 * 0.636619746685028076171875;
    float3 _4781 = float3(_1834, _1836, _1818);
    float _1840 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4781, float3(0.0), isnan(_4781)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4781, float3(0.0), isnan(_4781)), level(0.0)).x;
    float3 _4792 = float3(_1834, _1836, _1818);
    float4 _1843 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4792, float3(0.0), isnan(_4792)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4792, float3(0.0), isnan(_4792)), level(0.0)).xyzw;
    float _1845 = _1843.x;
    float _1847 = _1843.y;
    float _1849 = _1843.z;
    float _1851 = _1843.w;
    float _1853 = -_1816;
    float _1855 = fma(_1838, _1853, 1.0);
    float2 _4814 = float2(_1855, _1828);
    float3 _1859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4814, float2(0.0), isnan(_4814)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4814, float2(0.0), isnan(_4814)), level(0.0)).xyz;
    float _1861 = _1859.x;
    float _1863 = _1859.y;
    float _1865 = _1859.z;
    float _1867 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1869 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1871 = _1732 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1873 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1867);
    float _1875 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1869);
    float _1877 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1873);
    float _1879 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1875);
    float _1881 = exp2(_1871);
    float _1883 = _1877 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1885 = _1879 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1887 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1889 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1891 = _1887 || _1889;
    bool _1893 = isnan(0.5);
    bool _1895 = _1891 || _1893;
    float _1897 = 1.0 / _1883;
    float _1899 = _1885 + _1883;
    float _1901 = -_1881;
    float _1903 = _1901 + 1.0;
    float _1905 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (!_1895)
    {
        _1186 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1907 = _1186;
    float _1909 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1911 = _1899 * _1897;
    float _1913 = _1911 * 0.5;
    float _1915 = _1746 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1917 = _1913;
    float _1919 = _1907;
    float _1921 = _1915;
    if (!_1895)
    {
        float _1923 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1925 = fma(_1913, _1907, _1923);
        _1917 = _1925;
    }
    float _1927 = _1917;
    if (!_1895)
    {
        _1919 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1929 = _1919;
    float _1931 = fma(_1756, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1915);
    float _1933 = _1929;
    if (_1895)
    {
        _1921 = 1.0;
    }
    float _1935 = _1921;
    float _1937 = _1935;
    if (!_1895)
    {
        float _1939 = -_1929;
        float _1941 = _1939 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1905 = _1941;
    }
    float _1943 = _1905;
    float _1945 = _1927;
    if (!_1895)
    {
        float _1947 = 1.0 / _1927;
        _1945 = _1947;
    }
    float _1949 = _1945;
    float _1951 = fma(_1734, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1931);
    float _1953 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1951);
    float _1955 = _1826 + _1786;
    float _1957 = _1943;
    if (!_1895)
    {
        float _1959 = 1.0 / _1943;
        _1957 = _1959;
    }
    float _1961 = _1957;
    float _1963 = _1953 + _1786;
    float _1965 = _1955 * 0.5;
    out.gl_Position.x = _1826;
    out.gl_Position.y = _1812;
    out.gl_Position.z = _1953;
    out.gl_Position.w = _1786;
    float _1967 = _1963 * 0.5;
    if (!_1895)
    {
        float _1969 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1971 = -_1929;
        float _1973 = fma(_1949, _1969, _1971);
        _1933 = _1973;
    }
    float _1975 = _1933;
    if (!_1895)
    {
        float _1977 = _1975 * _1961;
        float _1979 = precise::clamp(_1977, 0.0, 1.0);
        _1937 = _1979;
    }
    float _1981 = _1937;
    float _1983 = _1786 * 0.5;
    float _1985 = _1981 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1987 = _1981 > 0.0;
    bool _1989 = isnan(_1981);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan(0.0);
    bool _1995 = _1991 || _1993;
    float _1997 = fma(_1812, -0.5, _1983);
    float _1999 = _1985 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_64.x = _1965;
    out.m_64.y = _1997;
    out.m_64.z = _1967;
    out.m_64.w = _1786;
    out.m_47.x = _1999;
    float _2001 = _1909 * _1840;
    float _2003 = -_1909;
    float _2005 = _2003 + 1.0;
    float _2007 = _1851 * _2001;
    float _2009 = _1851 * _2005;
    float _2011 = _1865 * _2001;
    float _2013 = fma(_1861, _2007, _1845);
    float _2015 = fma(_1863, _2007, _1847);
    float _2017 = fma(_1851, _2011, _1849);
    out.m_66.x = _2013;
    out.m_66.y = _2015;
    out.m_66.z = _2017;
    out.m_66.w = _2009;
    if (_1995)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2019 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2019;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

