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
    bool _1442 = false;
    bool _251 = false;
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
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_101);
        out.gl_Position.z = _2005;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _95;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    int _133 = 0;
    if (_129)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2073 = as_type<float>(_137);
        out.gl_Position.z = _2073;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _147 = _145 != 0;
    int _149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _151 = _149 != 0;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = _143 * _141;
    float _159 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_147;
    int _169 = _167 ? 0 : 1;
    int _171 = abs(_169);
    float _173 = _165 * 6.283185482025146484375;
    float _175 = cos(_173);
    bool _177 = !_155;
    int _179 = _177 ? 0 : 1;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = abs(_179);
    float _185 = -_163;
    float _187 = _159 + _185;
    bool _189 = !_151;
    int _191 = _189 ? 0 : 1;
    int _193 = abs(_191);
    float _195 = -_187;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_171);
    float _201 = fma(_175, 0.5, 0.5);
    bool _203 = _187 < 0.5;
    float _205 = float(_203);
    float _207 = abs(_197);
    float _209 = _199 * _207;
    float _211 = float(_183);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_193);
    float _223 = fma(_211, _215, _209);
    float _225 = abs(_219);
    float _227 = fma(_221, _225, _223);
    bool _229 = !_181;
    float _247;
    float _249;
    if (!_229)
    {
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = float(_85);
        float _237 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _239 = _237 * _231;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _235;
        _249 = _245;
        _251 = true;
    }
    else
    {
        float _253 = float(_85);
        float _255 = 1.0 / _253;
        float _257 = _117 * _255;
        _247 = _253;
        _249 = _257;
    }
    _251 = false;
    float _259 = _247;
    float _261 = _249;
    float _263 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _265 = int(_263);
    float _267 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _271 = int(_269);
    float _273 = float(_265);
    float _275 = 1.0 / _273;
    float _277 = float(uint(_271));
    float _279 = 1.0 / _277;
    float _281 = _117 * _275;
    int _283 = ~_271;
    int _285 = _283 + 1;
    float _287 = trunc(_281);
    int _289 = int(_287);
    int _291 = as_type<int>(_279) + (-2);
    float _293 = float(uint(_289));
    float _295 = float(_289);
    float _297 = as_type<float>(_291) * _293;
    int _299 = ~_271;
    int _301 = _299 + 1;
    float _303 = trunc(_297);
    float _305 = precise::max(_303, 0.0);
    uint _308 = uint(_305);
    float _310 = float(_271);
    int _312 = _301 * int(_308);
    int _314 = _312 + _289;
    float _316 = float(uint(_314));
    float _318 = as_type<float>(_291) * _316;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _322 = _320 != 0;
    float _324 = trunc(_318);
    float _326 = precise::max(_324, 0.0);
    uint _328 = uint(_326);
    bool _330 = !_322;
    float _332 = _330 ? 7.345489978790283203125 : 1.0;
    float _334 = _332 * _139;
    float _336 = floor(_334);
    int _338 = int(_308) + int(_328);
    bool _340 = _295 >= _310;
    bool _342 = isnan(_295);
    bool _344 = _340 || _342;
    bool _346 = isnan(_310);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _259;
    int _354 = _285 * _338;
    int _356 = _354 + _289;
    bool _358 = uint(_356) >= uint(_271);
    float _360 = trunc(_350);
    int _362 = int(_360);
    float _364 = -_336;
    float _366 = _334 + _364;
    bool _368 = !_358;
    int _370 = _368 ? 0 : (-1);
    float _372 = _366 * _310;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _384 = _382 != 0;
    float _386 = _117 * _310;
    int _388 = ~_338;
    int _390 = _388 + _370;
    int _392 = _390 + 1;
    bool _394 = _271 == 0;
    float _396 = _386 * _352;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _400 = _398 != 0;
    int _402 = _271 * _392;
    int _404 = _402 + _289;
    float _406 = trunc(_372);
    int _408 = int(_406);
    int _410 = _271 + (-1);
    int _412 = ~_362;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    bool _418 = !_394;
    int _420 = _418 ? _404 : (-1);
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _424 = _422 != 0;
    int _426 = _420 * _416;
    bool _428 = !_380;
    int _430 = _428 ? 0 : 1;
    float _432 = trunc(_396);
    int _434 = int(_432);
    bool _436 = !_424;
    int _438 = _436 ? 0 : 1;
    int _440 = _362 * _410;
    int _442 = _440 + _426;
    bool _444 = !_376;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_430);
    int _450 = abs(_438);
    bool _452 = !_384;
    int _454 = _452 ? 0 : 1;
    int _456 = abs(_446);
    int _458 = _408 * _450;
    int _460 = _458 + _289;
    bool _462 = !_400;
    int _464 = _462 ? 0 : 1;
    int _466 = abs(_454);
    int _468 = _442 * _448;
    int _470 = abs(_464);
    int _472 = _434 * _456;
    int _474 = _472 + _468;
    int _476 = ~_271;
    int _478 = _476 + 1;
    int _480 = _460 * _466;
    int _482 = _480 + _474;
    int _484 = ~_271;
    int _486 = _484 + 1;
    float _488 = as_type<float>(int(gl_VertexIndex));
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _492 = _490 != 0;
    int _494 = _408 * _470;
    int _496 = _494 + _482;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _500 = _498 != 0;
    float _502 = float(uint(_496));
    float _504 = as_type<float>(_291) * _502;
    float _506 = trunc(_504);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    int _512 = _478 * int(_510);
    int _514 = _512 + _496;
    float _516 = float(uint(_514));
    float _518 = as_type<float>(_291) * _516;
    float _520 = trunc(_518);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    int _526 = int(_510) + int(_524);
    int _528 = ~_271;
    int _530 = _528 + 1;
    int _532 = _486 * _526;
    int _534 = _532 + _496;
    bool _536 = uint(_534) >= uint(_271);
    float _538 = float(uint(_460));
    bool _540 = !_536;
    int _542 = _540 ? 0 : (-1);
    float _544 = as_type<float>(_291) * _538;
    int _546 = ~_526;
    int _548 = _546 + _542;
    int _550 = _548 + 1;
    float _552 = trunc(_544);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    int _558 = _271 * _550;
    int _560 = _558 + _496;
    bool _562 = !_394;
    int _564 = _562 ? _560 : (-1);
    int _566 = _564 >> 31;
    int _568 = _564 & 3;
    bool _570 = _568 != 0;
    int _572 = _566 & 3;
    int _574 = _530 * int(_556);
    int _576 = _574 + _460;
    bool _578 = uint(_568) > 1u;
    int _580 = _564 + _572;
    float _582 = float(uint(_576));
    int _584 = _580 >> 2;
    int _586 = _564 & 3;
    bool _588 = _586 != 0;
    float _590 = as_type<float>(_291) * _582;
    int _592 = _584 << 4;
    int _594 = _592 + 368;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _596;
    int _600 = _588 ? 0 : 1;
    float _602 = trunc(_590);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    uint _608 = uint(int(uint(_594) >> uint(2)));
    uint _610 = uint(int(uint(int(_608)) >> uint(2)));
    int _612 = int(_608) & 3;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[int(_610)][_612];
    int _616 = int(_608) + 1;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    int _620 = _616 & 3;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[int(_618)][_620];
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _626 = _624 != 0;
    bool _628 = uint(_568) >= 2u;
    int _630 = ~_600;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    int _636 = _634;
    if (!_578)
    {
        int _638 = ~_600;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    int _644 = _594 + 8;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[int(_656)][_658];
    float _662 = 1.0 / _598;
    bool _664 = !_570;
    int _666 = _664 ? 0 : 1;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _670 = _261 + _668;
    int _672 = as_type<int>(_488) & 1;
    bool _674 = _672 != 0;
    int _676 = as_type<int>(_488) & 2;
    bool _678 = _676 != 0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _684 = _628 ? 0 : 1;
    bool _686 = _568 != 3;
    float _688 = 1.0 / _682;
    bool _690 = !_686;
    int _692 = _690 ? 0 : (-1);
    bool _694 = _568 != 3;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _698 = ~_271;
    int _700 = _698 + 1;
    float _702 = _670 * _662;
    int _704 = int(_556) + int(_606);
    float _706 = -_696;
    float _708 = fma(_267, 2.0, _706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _712 = _261 + _710;
    int _714 = ~_684;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    int _720 = _700 * _704;
    int _722 = _720 + _460;
    int _724 = abs(_666);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _726;
    int _730 = _718;
    float _732 = _708;
    if (_694)
    {
        int _734 = ~_684;
        int _736 = _734 + 1;
        _730 = _736;
    }
    int _738 = _730;
    float _740 = _712 * _688;
    int _742 = abs(_642);
    float _744 = fma(_728, _702, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _746 = uint(_722) >= uint(_271);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _752 = !_746;
    int _754 = _752 ? 0 : (-1);
    float _756 = fma(_750, _740, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _758 = ~_742;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    int _764 = ~_704;
    int _766 = _764 + _754;
    int _768 = _766 + 1;
    int _770 = abs(_738);
    int _772 = ~_724;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    int _778 = _762 * as_type<int>(_622);
    int _780 = ~_770;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _788 = int(_786);
    int _790 = abs(_692);
    int _792 = _776 * as_type<int>(_614);
    int _794 = _792 + _778;
    int _796 = _271 * _768;
    int _798 = _796 + _460;
    bool _800 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _802 = isnan(_261);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    int _812 = _784 * as_type<int>(_652);
    int _814 = _812 + _794;
    int _816 = ~_790;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _822;
    bool _826 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _828 = isnan(_261);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_810;
    float _840 = _838 + 1.0;
    bool _842 = !_626;
    int _844 = _842 ? 0 : 1;
    int _846 = _820 * as_type<int>(_660);
    int _848 = _846 + _814;
    bool _850 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _852 = isnan(_261);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _836 * _840;
    float _864 = -_836;
    float _866 = _864 + 1.0;
    float _868 = float(uint(_788));
    float _870 = fma(_824, _702, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _872 = abs(_844);
    float _874 = _860 * _866;
    int _876 = abs(_788);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _882 = ~_872;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    float _888 = _744 * _874;
    float _890 = 1.0 / _868;
    float _892 = float(uint(_876));
    float _894 = _870 * _874;
    int _896 = _848 * _886;
    bool _898 = !_394;
    int _900 = _898 ? _798 : (-1);
    float _902 = in.m_56.x;
    float _904 = in.m_56.y;
    float _906 = -_860;
    float _908 = _906 + 1.0;
    float _910 = fma(_880, _740, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _912 = 1.0 / _892;
    int _914 = _900 * _872;
    int _916 = _914 + _896;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[143].y, _894);
    bool _922 = _139 > 0.5;
    float _924 = float(uint(_916));
    float _926 = fma(_756, _862, _918);
    int _928 = as_type<int>(_890) + (-2);
    float _930 = fma(_910, _862, _920);
    int _932 = abs(_916);
    float _934 = in.m_51.y;
    float _936 = as_type<float>(_928) * _924;
    float _938 = float(uint(_932));
    int _940 = as_type<int>(_912) + (-2);
    float _942 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[145].x, _926);
    float _944 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[145].y, _930);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _948 = trunc(_936);
    float _950 = precise::max(_948, 0.0);
    uint _952 = uint(_950);
    float _954 = as_type<float>(_940) * _938;
    float _956 = _944 * _904;
    float _958 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _946);
    float _960 = _942 * _902;
    float _962 = in.m_44.x;
    float _964 = in.m_44.y;
    float _966 = in.m_44.z;
    float _968 = _227 * _956;
    float _970 = trunc(_954);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    int _976 = ~_788;
    int _978 = _976 + 1;
    float _980 = _227 * _960;
    bool _982 = !_678;
    float _984 = _982 ? (-0.5) : 0.5;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _988 = ~_876;
    int _990 = _988 + 1;
    float _992 = _968 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _994 = !_674;
    float _996 = _994 ? (-0.5) : 0.5;
    int _998 = _978 * int(_952);
    int _1000 = _998 + _916;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _984);
    float _1004 = _980 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1006 = _934 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _996);
    float _1010 = float(uint(_1000));
    float _1012 = _992 * _1002;
    float _1014 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1016 = _990 * int(_974);
    int _1018 = _1016 + _932;
    float _1020 = _1004 * _1008;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1024 = fma(_1006, -2.0, _986);
    bool _1026 = _934 > 0.5;
    float _1028 = _964 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1030 = float(uint(_1018));
    float _1032 = as_type<float>(_928) * _1010;
    float _1034 = _964 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1038 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1028);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1022);
    float _1042 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1036);
    float _1046 = as_type<float>(_940) * _1030;
    float _1048 = _964 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1050 = trunc(_1032);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    float _1056 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1038);
    float _1058 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1042);
    float _1060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1040);
    float _1062 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1044);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1072 = trunc(_1046);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1080 = _1064 + _1068;
    float _1082 = _1066 + _1070;
    float _1084 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1048);
    float _1086 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1078);
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1080 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1082 + _1092;
    int _1096 = int(_952) + int(_1054);
    float _1098 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1100 = _1090 * _1090;
    float _1102 = _1094 * _1094;
    int _1104 = ~_788;
    int _1106 = _1104 + 1;
    float _1108 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1098);
    int _1110 = ~_876;
    int _1112 = _1110 + 1;
    float _1114 = _1100 + _1102;
    int _1116 = int(_974) + int(_1076);
    int _1118 = _1106 * _1096;
    int _1120 = _1118 + _916;
    float _1122 = -_996;
    int _1124 = _922 ? as_type<int>(_1122) : as_type<int>(_996);
    float _1126 = sqrt(_1114);
    float _1128 = -_984;
    int _1130 = _1026 ? as_type<int>(_1128) : as_type<int>(_984);
    int _1132 = _1112 * _1116;
    int _1134 = _1132 + _932;
    bool _1136 = uint(_1120) >= uint(_788);
    float _1138 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1084);
    bool _1140 = !_492;
    float _1142 = _1140 ? _996 : as_type<float>(_1124);
    float _1144 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1108);
    bool _1146 = uint(_1134) >= uint(_876);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1150 = !_1136;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1156 = _916 ^ _788;
    float _1158 = -_117;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[76].x, _708);
    bool _1162 = !_500;
    float _1164 = _1162 ? _984 : as_type<float>(_1130);
    bool _1166 = !_1146;
    int _1168 = _1166 ? 0 : (-1);
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1172 = ~_1096;
    int _1174 = _1172 + _1152;
    int _1176 = _1174 + 1;
    bool _1178 = _1126 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _1180 = uint(int(uint(_1156) >> uint(31)));
    int _1182 = ~_1168;
    int _1184 = _1116 + _1182;
    int _1186 = _1184 + 1;
    int _1188 = _788 * _1176;
    int _1190 = _1188 + _916;
    int _1192 = ~int(_1180);
    int _1194 = _1192 + 1;
    float _1196 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1198 = _788 == 0;
    float _1200 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1202 = _1186 ^ _1194;
    float _1204 = _1154 + _1196;
    bool _1206 = !_1198;
    int _1208 = _1206 ? _1190 : (-1);
    bool _1210 = _788 == 0;
    int _1212 = ~_1194;
    int _1214 = _1212 + _1202;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_788);
    float _1220 = as_type<float>(_1194);
    float _1222 = _1196;
    float _1224 = _1100;
    float _1226 = _1164;
    float _1228 = _1064;
    if (!_1178)
    {
        _732 = _1100;
    }
    float _1230 = _732;
    float _1232 = _1230;
    if (!_1178)
    {
        _1218 = _1102;
    }
    float _1234 = _1218;
    float _1236 = _1234;
    if (!_1178)
    {
        _1220 = _1080;
    }
    float _1238 = _1220;
    float _1240 = _1238;
    if (!_1178)
    {
        _1222 = _1082;
    }
    float _1242 = _1222;
    float _1244 = float(_1208);
    float _1246 = _1242;
    if (!_1178)
    {
        _1224 = _1204;
    }
    float _1248 = _1224;
    bool _1250 = !_1178;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1126 + _1256;
        float _1260 = rsqrt(_1114);
        float _1262 = _1258 * _1254;
        float _1264 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1260 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = fma(_1090, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1284 = fma(_1094, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1290 = _1282 + _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1294 = _1284 + _1292;
        float _1296 = fma(_1204, _1274, _1286);
        float _1298 = _1290 * _1290;
        float _1300 = _1294 * _1294;
        _1252 = _1296;
        _1232 = _1298;
        _1236 = _1300;
        _1240 = _1282;
        _1246 = _1284;
    }
    float _1302 = _1252;
    float _1304 = _1232;
    float _1306 = _1236;
    float _1308 = _1240;
    float _1310 = _1246;
    bool _1312 = !_1210;
    int _1314 = _1312 ? _1216 : (-1);
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1318 = _1302 + _1316;
    float _1320 = fma(_1200, _1244, _1160);
    float _1322 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1324 = float(_1314);
    float _1326 = _1142 + 0.5;
    float _1328 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1024);
    float _1330 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _958);
    float _1332 = fma(_1318, _1318, _1304);
    float _1334 = fma(_1200, _1326, _1320);
    float _1336 = -_1328;
    float _1338 = fma(_1322, _1324, _1336);
    float _1340 = _1164 + (-0.5);
    float _1342 = -_1330;
    float _1344 = _1342 + 1.0;
    float _1346 = _1332 + _1306;
    float _1348 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1086);
    float _1350 = -_1322;
    float _1352 = fma(_1350, _1340, _1338);
    float _1354 = -_1344;
    float _1356 = fma(_1142, _1354, _1334);
    float _1358 = -_1348;
    float _1360 = _1358 + 1.0;
    float _1362 = sqrt(_1346);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = fma(_1164, _1360, _1352);
    out.m_58.x = _1374;
    out.m_58.y = _1378;
    out.m_58.z = _1382;
    out.m_58.w = _1380;
    bool _1392 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1362);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    out.m_60.x = _1384;
    out.m_60.y = _1386;
    out.m_60.z = _1388;
    out.m_62.x = _1356;
    out.m_62.y = _1390;
    float _1402 = _1382;
    float _1404 = _1308;
    float _1406 = _1388;
    if (!_1400)
    {
        _1226 = 1.0;
    }
    float _1408 = _1226;
    bool _1410 = !_1400;
    float _1412 = _1408;
    if (!_1410)
    {
        bool _1414 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1416 = isnan(_1362);
        bool _1418 = _1414 || _1416;
        bool _1420 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1422 = _1418 || _1420;
        if (!_1422)
        {
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1426 = _1362 + _1424;
            float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1430 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1428;
            float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1434 = _1432 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1436 = 1.0 / _1430;
            float _1438 = _1426 * _1436;
            float _1440 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1412 = _1440;
            _1442 = true;
        }
        else
        {
            bool _1444 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1446 = isnan(_1362);
            bool _1448 = _1444 || _1446;
            bool _1450 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1452 = _1448 || _1450;
            if (!_1452)
            {
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1456 = _1362 + _1454;
                float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1460 = _1458 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1464 = _1462 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1466 = 1.0 / _1460;
                float _1468 = _1456 * _1466;
                float _1470 = fma(_1468, _1464, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1412 = _1470;
                _1442 = true;
            }
            else
            {
                _1412 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1442 = false;
    float _1472 = _1412;
    float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1476 = _1308 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1480 = _1302 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1484 = _1310 + _1482;
    bool _1486 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.5);
    bool _1494 = _1490 || _1492;
    float _1496 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1498 = fma(_1480, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1500 = fma(_1484, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1502 = _1476;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1494)
    {
        _1502 = _1496;
    }
    float _1506 = _1502;
    float _1508 = _1506;
    if (_1494)
    {
        _1402 = _1498;
    }
    float _1510 = _1402;
    float _1512 = _1510;
    if (_1494)
    {
        _1504 = _1500;
    }
    float _1514 = _1504;
    float _1516 = _1514;
    if (!_1494)
    {
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1520 = _1154 + _1518;
        float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1524 = _1064 + _1522;
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1528 = _1520 * _1520;
        float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1532 = _1066 + _1530;
        float _1534 = fma(_1524, _1524, _1528);
        float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1538 = fma(_1532, _1532, _1534);
        float _1540 = sqrt(_1538);
        float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1544 = precise::min(_1540, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1546 = _1544 * _1536;
        float _1548 = -_1064;
        float _1550 = _1548 + _1496;
        float _1552 = _1542 * _1546;
        float _1554 = -_1154;
        float _1556 = _1554 + _1498;
        float _1558 = -_1066;
        float _1560 = _1558 + _1500;
        float _1562 = fma(_1550, _1552, _1064);
        float _1564 = fma(_1556, _1552, _1154);
        float _1566 = fma(_1560, _1552, _1066);
        _1512 = _1564;
        _1508 = _1562;
        _1516 = _1566;
        _1404 = _1536;
    }
    float _1568 = _1512;
    float _1570 = _1508;
    float _1572 = _1516;
    float _1574 = _1404;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1578 = _1568 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1570 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1572 + _1584;
    float _1588 = _1578 * _1578;
    float _1590 = fma(_1582, _1582, _1588);
    float _1592 = fma(_1586, _1586, _1590);
    float _1594 = rsqrt(_1592);
    float _1596 = sqrt(_1592);
    float _1598 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1600 = _1582 * _1598;
    float _1602 = _1586 * _1598;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 + _1606;
    float _1610 = sqrt(_1608);
    bool _1612 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1610 + _1614;
    float _1618 = _1594;
    float _1620 = _1616;
    float _1622 = _1574;
    float _1624 = _1578;
    float _1626 = _1598;
    float _1628 = _1600;
    if (_1612)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1630;
    }
    float _1632 = _1618;
    if (_1612)
    {
        float _1634 = rsqrt(_1608);
        _1228 = _1634;
    }
    float _1636 = _1228;
    float _1638 = _1636;
    if (_1612)
    {
        float _1640 = _1616 * _1632;
        _1620 = _1640;
    }
    float _1642 = _1620;
    if (_1612)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1622 = _1644;
    }
    float _1646 = _1622;
    float _1648 = _1632;
    if (_1612)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1586;
    float _1662 = _1658;
    if (_1612)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1598;
    float _1672 = -_1658;
    float _1674 = fma(_1578, _1670, _1672);
    if (!_1612)
    {
        _1624 = _1604;
    }
    float _1676 = _1624;
    float _1678 = _1676;
    if (_1612)
    {
        float _1680 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1680;
    }
    float _1682 = _1662;
    float _1684 = _1654;
    float _1686 = _1682;
    if (_1612)
    {
        float _1688 = fma(_1654, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1690;
    if (_1612)
    {
        float _1696 = _1668 + (-1.0);
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1612)
    {
        float _1702 = _1636 * _1690;
        _1406 = _1702;
    }
    float _1704 = _1406;
    if (!_1612)
    {
        _1638 = _1674;
    }
    float _1706 = _1638;
    float _1708 = _1706;
    if (_1612)
    {
        float _1710 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1710;
    }
    float _1712 = _1626;
    if (_1612)
    {
        float _1714 = _1600 * _1704;
        _1628 = _1714;
    }
    float _1716 = _1628;
    if (!_1612)
    {
        _1694 = _1602;
    }
    float _1718 = _1694;
    float _1720 = _1718;
    if (_1612)
    {
        float _1722 = _1602 * _1704;
        _1720 = _1722;
    }
    float _1724 = _1720;
    if (_1612)
    {
        float _1726 = fma(_1674, _1668, _1712);
        _1708 = _1726;
    }
    float _1728 = _1708;
    if (_1612)
    {
        float _1730 = _1716 * _1716;
        _1678 = _1730;
    }
    float _1732 = _1678;
    if (!_1612)
    {
        _1700 = _1606;
    }
    float _1734 = _1700;
    float _1736 = _1734;
    if (_1612)
    {
        float _1738 = _1724 * _1724;
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_1728, _1728, _1732);
    float _1744 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = _1742 + _1740;
    float _1748 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1752 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1750);
    float _1754 = precise::clamp(_1752, 0.0, 1.0);
    float _1756 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1758 = rsqrt(_1746);
    float _1760 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1748);
    float _1762 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1764 = -_1754;
    float _1766 = _1764 + 1.0;
    float _1768 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1770 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1760);
    float _1772 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1762);
    float _1774 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1756);
    float _1776 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1768);
    float _1778 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1772);
    float _1782 = abs(_1766);
    float _1784 = log2(_1782);
    float _1786 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1776);
    float _1788 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = _1758 * _1716;
    float _1796 = _1758 * _1728;
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1800 = _1758 * _1724;
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1804 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1798);
    float _1808 = -_1792;
    float _1810 = fma(_1808, _1692, 1.0);
    float _1812 = -_1802;
    float _1814 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1812);
    float _1816 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1818 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1806);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = -_1800;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1814);
    float _1826 = log2(_1810);
    float _1828 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1830 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1832 = fma(_1824, -0.5, 0.5);
    float _1834 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1816);
    float _1836 = fma(_1824, 0.5, 0.5);
    float _1838 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1830);
    float _1840 = exp2(_1820);
    float _1842 = _1796 + 1.0;
    float _1844 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1834);
    float _1846 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1838);
    float _1848 = fma(_1836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = 1.0 / _1828;
    float _1852 = fma(_1836, _1848, -0.212114393711090087890625);
    float _1854 = fma(_1836, _1852, 1.570728778839111328125);
    float _1856 = sqrt(_1832);
    float _1858 = -_1796;
    float _1860 = fma(_1840, _1842, _1858);
    float _1862 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1864 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1846);
    float _1866 = _1826 * 0.693147182464599609375;
    float _1868 = fma(_1860, 0.5, 0.5);
    float _1870 = _1862 * _1850;
    float _1872 = _1864 * _1850;
    float _1874 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = fma(_1870, 0.5, 0.5);
    float _1878 = fma(_1872, -0.5, 0.5);
    float _1880 = _1856 * 0.636619746685028076171875;
    float3 _4744 = float3(_1876, _1878, _1874);
    float _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4744, float3(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4744, float3(0.0), isnan(_4744)), level(0.0)).x;
    float3 _4755 = float3(_1876, _1878, _1874);
    float4 _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4755, float3(0.0), isnan(_4755)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4755, float3(0.0), isnan(_4755)), level(0.0)).xyzw;
    float _1887 = _1885.x;
    float _1889 = _1885.y;
    float _1891 = _1885.z;
    float _1893 = _1885.w;
    float _1895 = -_1854;
    float _1897 = fma(_1880, _1895, 1.0);
    float2 _4777 = float2(_1897, _1868);
    float3 _1901 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4777, float2(0.0), isnan(_4777)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4777, float2(0.0), isnan(_4777)), level(0.0)).xyz;
    float _1903 = _1901.x;
    float _1905 = _1901.y;
    float _1907 = _1901.z;
    float _1909 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1911 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1913 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1911);
    float _1915 = exp2(_1909);
    float _1917 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1913);
    float _1919 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = _1919 + _1828;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _1919;
    out.gl_Position.w = _1828;
    float _1925 = _1923 * 0.5;
    float _1927 = -_1915;
    float _1929 = _1927 + 1.0;
    out.m_47.x = _1921;
    float _1931 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1925;
    out.m_64.w = _1828;
    float _1933 = _1931 * _1882;
    float _1935 = -_1931;
    float _1937 = _1935 + 1.0;
    float _1939 = _1893 * _1933;
    float _1941 = _1907 * _1933;
    float _1943 = fma(_1903, _1939, _1887);
    float _1945 = fma(_1905, _1939, _1889);
    float _1947 = _1893 * _1937;
    float _1949 = fma(_1893, _1941, _1891);
    out.m_66.x = _1943;
    out.m_66.y = _1945;
    out.m_66.z = _1949;
    out.m_66.w = _1947;
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
    bool _1442 = false;
    bool _251 = false;
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
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_101);
        out.gl_Position.z = _2005;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _95;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    int _133 = 0;
    if (_129)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2073 = as_type<float>(_137);
        out.gl_Position.z = _2073;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _147 = _145 != 0;
    int _149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _151 = _149 != 0;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = _143 * _141;
    float _159 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_147;
    int _169 = _167 ? 0 : 1;
    int _171 = abs(_169);
    float _173 = _165 * 6.283185482025146484375;
    float _175 = cos(_173);
    bool _177 = !_155;
    int _179 = _177 ? 0 : 1;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = abs(_179);
    float _185 = -_163;
    float _187 = _159 + _185;
    bool _189 = !_151;
    int _191 = _189 ? 0 : 1;
    int _193 = abs(_191);
    float _195 = -_187;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_171);
    float _201 = fma(_175, 0.5, 0.5);
    bool _203 = _187 < 0.5;
    float _205 = float(_203);
    float _207 = abs(_197);
    float _209 = _199 * _207;
    float _211 = float(_183);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_193);
    float _223 = fma(_211, _215, _209);
    float _225 = abs(_219);
    float _227 = fma(_221, _225, _223);
    bool _229 = !_181;
    float _247;
    float _249;
    if (!_229)
    {
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = float(_85);
        float _237 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _239 = _237 * _231;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _235;
        _249 = _245;
        _251 = true;
    }
    else
    {
        float _253 = float(_85);
        float _255 = 1.0 / _253;
        float _257 = _117 * _255;
        _247 = _253;
        _249 = _257;
    }
    _251 = false;
    float _259 = _247;
    float _261 = _249;
    float _263 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _265 = int(_263);
    float _267 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _271 = int(_269);
    float _273 = float(_265);
    float _275 = 1.0 / _273;
    float _277 = float(uint(_271));
    float _279 = 1.0 / _277;
    float _281 = _117 * _275;
    int _283 = ~_271;
    int _285 = _283 + 1;
    float _287 = trunc(_281);
    int _289 = int(_287);
    int _291 = as_type<int>(_279) + (-2);
    float _293 = float(uint(_289));
    float _295 = float(_289);
    float _297 = as_type<float>(_291) * _293;
    int _299 = ~_271;
    int _301 = _299 + 1;
    float _303 = trunc(_297);
    float _305 = precise::max(_303, 0.0);
    uint _308 = uint(_305);
    float _310 = float(_271);
    int _312 = _301 * int(_308);
    int _314 = _312 + _289;
    float _316 = float(uint(_314));
    float _318 = as_type<float>(_291) * _316;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _322 = _320 != 0;
    float _324 = trunc(_318);
    float _326 = precise::max(_324, 0.0);
    uint _328 = uint(_326);
    bool _330 = !_322;
    float _332 = _330 ? 7.345489978790283203125 : 1.0;
    float _334 = _332 * _139;
    float _336 = floor(_334);
    int _338 = int(_308) + int(_328);
    bool _340 = _295 >= _310;
    bool _342 = isnan(_295);
    bool _344 = _340 || _342;
    bool _346 = isnan(_310);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _259;
    int _354 = _285 * _338;
    int _356 = _354 + _289;
    bool _358 = uint(_356) >= uint(_271);
    float _360 = trunc(_350);
    int _362 = int(_360);
    float _364 = -_336;
    float _366 = _334 + _364;
    bool _368 = !_358;
    int _370 = _368 ? 0 : (-1);
    float _372 = _366 * _310;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _384 = _382 != 0;
    float _386 = _117 * _310;
    int _388 = ~_338;
    int _390 = _388 + _370;
    int _392 = _390 + 1;
    bool _394 = _271 == 0;
    float _396 = _386 * _352;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _400 = _398 != 0;
    int _402 = _271 * _392;
    int _404 = _402 + _289;
    float _406 = trunc(_372);
    int _408 = int(_406);
    int _410 = _271 + (-1);
    int _412 = ~_362;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    bool _418 = !_394;
    int _420 = _418 ? _404 : (-1);
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _424 = _422 != 0;
    int _426 = _420 * _416;
    bool _428 = !_380;
    int _430 = _428 ? 0 : 1;
    float _432 = trunc(_396);
    int _434 = int(_432);
    bool _436 = !_424;
    int _438 = _436 ? 0 : 1;
    int _440 = _362 * _410;
    int _442 = _440 + _426;
    bool _444 = !_376;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_430);
    int _450 = abs(_438);
    bool _452 = !_384;
    int _454 = _452 ? 0 : 1;
    int _456 = abs(_446);
    int _458 = _408 * _450;
    int _460 = _458 + _289;
    bool _462 = !_400;
    int _464 = _462 ? 0 : 1;
    int _466 = abs(_454);
    int _468 = _442 * _448;
    int _470 = abs(_464);
    int _472 = _434 * _456;
    int _474 = _472 + _468;
    int _476 = ~_271;
    int _478 = _476 + 1;
    int _480 = _460 * _466;
    int _482 = _480 + _474;
    int _484 = ~_271;
    int _486 = _484 + 1;
    float _488 = as_type<float>(int(gl_VertexIndex));
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _492 = _490 != 0;
    int _494 = _408 * _470;
    int _496 = _494 + _482;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _500 = _498 != 0;
    float _502 = float(uint(_496));
    float _504 = as_type<float>(_291) * _502;
    float _506 = trunc(_504);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    int _512 = _478 * int(_510);
    int _514 = _512 + _496;
    float _516 = float(uint(_514));
    float _518 = as_type<float>(_291) * _516;
    float _520 = trunc(_518);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    int _526 = int(_510) + int(_524);
    int _528 = ~_271;
    int _530 = _528 + 1;
    int _532 = _486 * _526;
    int _534 = _532 + _496;
    bool _536 = uint(_534) >= uint(_271);
    float _538 = float(uint(_460));
    bool _540 = !_536;
    int _542 = _540 ? 0 : (-1);
    float _544 = as_type<float>(_291) * _538;
    int _546 = ~_526;
    int _548 = _546 + _542;
    int _550 = _548 + 1;
    float _552 = trunc(_544);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    int _558 = _271 * _550;
    int _560 = _558 + _496;
    bool _562 = !_394;
    int _564 = _562 ? _560 : (-1);
    int _566 = _564 >> 31;
    int _568 = _564 & 3;
    bool _570 = _568 != 0;
    int _572 = _566 & 3;
    int _574 = _530 * int(_556);
    int _576 = _574 + _460;
    bool _578 = uint(_568) > 1u;
    int _580 = _564 + _572;
    float _582 = float(uint(_576));
    int _584 = _580 >> 2;
    int _586 = _564 & 3;
    bool _588 = _586 != 0;
    float _590 = as_type<float>(_291) * _582;
    int _592 = _584 << 4;
    int _594 = _592 + 368;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _596;
    int _600 = _588 ? 0 : 1;
    float _602 = trunc(_590);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    uint _608 = uint(int(uint(_594) >> uint(2)));
    uint _610 = uint(int(uint(int(_608)) >> uint(2)));
    int _612 = int(_608) & 3;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[int(_610)][_612];
    int _616 = int(_608) + 1;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    int _620 = _616 & 3;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[int(_618)][_620];
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _626 = _624 != 0;
    bool _628 = uint(_568) >= 2u;
    int _630 = ~_600;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    int _636 = _634;
    if (!_578)
    {
        int _638 = ~_600;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    int _644 = _594 + 8;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[int(_656)][_658];
    float _662 = 1.0 / _598;
    bool _664 = !_570;
    int _666 = _664 ? 0 : 1;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _670 = _261 + _668;
    int _672 = as_type<int>(_488) & 1;
    bool _674 = _672 != 0;
    int _676 = as_type<int>(_488) & 2;
    bool _678 = _676 != 0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _684 = _628 ? 0 : 1;
    bool _686 = _568 != 3;
    float _688 = 1.0 / _682;
    bool _690 = !_686;
    int _692 = _690 ? 0 : (-1);
    bool _694 = _568 != 3;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _698 = ~_271;
    int _700 = _698 + 1;
    float _702 = _670 * _662;
    int _704 = int(_556) + int(_606);
    float _706 = -_696;
    float _708 = fma(_267, 2.0, _706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _712 = _261 + _710;
    int _714 = ~_684;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    int _720 = _700 * _704;
    int _722 = _720 + _460;
    int _724 = abs(_666);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _726;
    int _730 = _718;
    float _732 = _708;
    if (_694)
    {
        int _734 = ~_684;
        int _736 = _734 + 1;
        _730 = _736;
    }
    int _738 = _730;
    float _740 = _712 * _688;
    int _742 = abs(_642);
    float _744 = fma(_728, _702, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _746 = uint(_722) >= uint(_271);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _752 = !_746;
    int _754 = _752 ? 0 : (-1);
    float _756 = fma(_750, _740, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _758 = ~_742;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    int _764 = ~_704;
    int _766 = _764 + _754;
    int _768 = _766 + 1;
    int _770 = abs(_738);
    int _772 = ~_724;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    int _778 = _762 * as_type<int>(_622);
    int _780 = ~_770;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _788 = int(_786);
    int _790 = abs(_692);
    int _792 = _776 * as_type<int>(_614);
    int _794 = _792 + _778;
    int _796 = _271 * _768;
    int _798 = _796 + _460;
    bool _800 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _802 = isnan(_261);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    int _812 = _784 * as_type<int>(_652);
    int _814 = _812 + _794;
    int _816 = ~_790;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _822;
    bool _826 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _828 = isnan(_261);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_810;
    float _840 = _838 + 1.0;
    bool _842 = !_626;
    int _844 = _842 ? 0 : 1;
    int _846 = _820 * as_type<int>(_660);
    int _848 = _846 + _814;
    bool _850 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _852 = isnan(_261);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _836 * _840;
    float _864 = -_836;
    float _866 = _864 + 1.0;
    float _868 = float(uint(_788));
    float _870 = fma(_824, _702, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _872 = abs(_844);
    float _874 = _860 * _866;
    int _876 = abs(_788);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _882 = ~_872;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    float _888 = _744 * _874;
    float _890 = 1.0 / _868;
    float _892 = float(uint(_876));
    float _894 = _870 * _874;
    int _896 = _848 * _886;
    bool _898 = !_394;
    int _900 = _898 ? _798 : (-1);
    float _902 = in.m_56.x;
    float _904 = in.m_56.y;
    float _906 = -_860;
    float _908 = _906 + 1.0;
    float _910 = fma(_880, _740, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _912 = 1.0 / _892;
    int _914 = _900 * _872;
    int _916 = _914 + _896;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[143].y, _894);
    bool _922 = _139 > 0.5;
    float _924 = float(uint(_916));
    float _926 = fma(_756, _862, _918);
    int _928 = as_type<int>(_890) + (-2);
    float _930 = fma(_910, _862, _920);
    int _932 = abs(_916);
    float _934 = in.m_51.y;
    float _936 = as_type<float>(_928) * _924;
    float _938 = float(uint(_932));
    int _940 = as_type<int>(_912) + (-2);
    float _942 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[145].x, _926);
    float _944 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[145].y, _930);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _948 = trunc(_936);
    float _950 = precise::max(_948, 0.0);
    uint _952 = uint(_950);
    float _954 = as_type<float>(_940) * _938;
    float _956 = _944 * _904;
    float _958 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _946);
    float _960 = _942 * _902;
    float _962 = in.m_44.x;
    float _964 = in.m_44.y;
    float _966 = in.m_44.z;
    float _968 = _227 * _956;
    float _970 = trunc(_954);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    int _976 = ~_788;
    int _978 = _976 + 1;
    float _980 = _227 * _960;
    bool _982 = !_678;
    float _984 = _982 ? (-0.5) : 0.5;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _988 = ~_876;
    int _990 = _988 + 1;
    float _992 = _968 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _994 = !_674;
    float _996 = _994 ? (-0.5) : 0.5;
    int _998 = _978 * int(_952);
    int _1000 = _998 + _916;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _984);
    float _1004 = _980 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1006 = _934 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _996);
    float _1010 = float(uint(_1000));
    float _1012 = _992 * _1002;
    float _1014 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1016 = _990 * int(_974);
    int _1018 = _1016 + _932;
    float _1020 = _1004 * _1008;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1024 = fma(_1006, -2.0, _986);
    bool _1026 = _934 > 0.5;
    float _1028 = _964 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1030 = float(uint(_1018));
    float _1032 = as_type<float>(_928) * _1010;
    float _1034 = _964 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1038 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1028);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1022);
    float _1042 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1036);
    float _1046 = as_type<float>(_940) * _1030;
    float _1048 = _964 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1050 = trunc(_1032);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    float _1056 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1038);
    float _1058 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1042);
    float _1060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1040);
    float _1062 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1044);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1072 = trunc(_1046);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1080 = _1064 + _1068;
    float _1082 = _1066 + _1070;
    float _1084 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1048);
    float _1086 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1078);
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1080 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1082 + _1092;
    int _1096 = int(_952) + int(_1054);
    float _1098 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1100 = _1090 * _1090;
    float _1102 = _1094 * _1094;
    int _1104 = ~_788;
    int _1106 = _1104 + 1;
    float _1108 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1098);
    int _1110 = ~_876;
    int _1112 = _1110 + 1;
    float _1114 = _1100 + _1102;
    int _1116 = int(_974) + int(_1076);
    int _1118 = _1106 * _1096;
    int _1120 = _1118 + _916;
    float _1122 = -_996;
    int _1124 = _922 ? as_type<int>(_1122) : as_type<int>(_996);
    float _1126 = sqrt(_1114);
    float _1128 = -_984;
    int _1130 = _1026 ? as_type<int>(_1128) : as_type<int>(_984);
    int _1132 = _1112 * _1116;
    int _1134 = _1132 + _932;
    bool _1136 = uint(_1120) >= uint(_788);
    float _1138 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1084);
    bool _1140 = !_492;
    float _1142 = _1140 ? _996 : as_type<float>(_1124);
    float _1144 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1108);
    bool _1146 = uint(_1134) >= uint(_876);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1150 = !_1136;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1156 = _916 ^ _788;
    float _1158 = -_117;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[76].x, _708);
    bool _1162 = !_500;
    float _1164 = _1162 ? _984 : as_type<float>(_1130);
    bool _1166 = !_1146;
    int _1168 = _1166 ? 0 : (-1);
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1172 = ~_1096;
    int _1174 = _1172 + _1152;
    int _1176 = _1174 + 1;
    bool _1178 = _1126 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _1180 = uint(int(uint(_1156) >> uint(31)));
    int _1182 = ~_1168;
    int _1184 = _1116 + _1182;
    int _1186 = _1184 + 1;
    int _1188 = _788 * _1176;
    int _1190 = _1188 + _916;
    int _1192 = ~int(_1180);
    int _1194 = _1192 + 1;
    float _1196 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1198 = _788 == 0;
    float _1200 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1202 = _1186 ^ _1194;
    float _1204 = _1154 + _1196;
    bool _1206 = !_1198;
    int _1208 = _1206 ? _1190 : (-1);
    bool _1210 = _788 == 0;
    int _1212 = ~_1194;
    int _1214 = _1212 + _1202;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_788);
    float _1220 = as_type<float>(_1194);
    float _1222 = _1196;
    float _1224 = _1100;
    float _1226 = _1164;
    float _1228 = _1064;
    if (!_1178)
    {
        _732 = _1100;
    }
    float _1230 = _732;
    float _1232 = _1230;
    if (!_1178)
    {
        _1218 = _1102;
    }
    float _1234 = _1218;
    float _1236 = _1234;
    if (!_1178)
    {
        _1220 = _1080;
    }
    float _1238 = _1220;
    float _1240 = _1238;
    if (!_1178)
    {
        _1222 = _1082;
    }
    float _1242 = _1222;
    float _1244 = float(_1208);
    float _1246 = _1242;
    if (!_1178)
    {
        _1224 = _1204;
    }
    float _1248 = _1224;
    bool _1250 = !_1178;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1126 + _1256;
        float _1260 = rsqrt(_1114);
        float _1262 = _1258 * _1254;
        float _1264 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1260 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = fma(_1090, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1284 = fma(_1094, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1290 = _1282 + _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1294 = _1284 + _1292;
        float _1296 = fma(_1204, _1274, _1286);
        float _1298 = _1290 * _1290;
        float _1300 = _1294 * _1294;
        _1252 = _1296;
        _1232 = _1298;
        _1236 = _1300;
        _1240 = _1282;
        _1246 = _1284;
    }
    float _1302 = _1252;
    float _1304 = _1232;
    float _1306 = _1236;
    float _1308 = _1240;
    float _1310 = _1246;
    bool _1312 = !_1210;
    int _1314 = _1312 ? _1216 : (-1);
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1318 = _1302 + _1316;
    float _1320 = fma(_1200, _1244, _1160);
    float _1322 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1324 = float(_1314);
    float _1326 = _1142 + 0.5;
    float _1328 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1024);
    float _1330 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _958);
    float _1332 = fma(_1318, _1318, _1304);
    float _1334 = fma(_1200, _1326, _1320);
    float _1336 = -_1328;
    float _1338 = fma(_1322, _1324, _1336);
    float _1340 = _1164 + (-0.5);
    float _1342 = -_1330;
    float _1344 = _1342 + 1.0;
    float _1346 = _1332 + _1306;
    float _1348 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1086);
    float _1350 = -_1322;
    float _1352 = fma(_1350, _1340, _1338);
    float _1354 = -_1344;
    float _1356 = fma(_1142, _1354, _1334);
    float _1358 = -_1348;
    float _1360 = _1358 + 1.0;
    float _1362 = sqrt(_1346);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = fma(_1164, _1360, _1352);
    out.m_58.x = _1374;
    out.m_58.y = _1378;
    out.m_58.z = _1382;
    out.m_58.w = _1380;
    bool _1392 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1362);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    out.m_60.x = _1384;
    out.m_60.y = _1386;
    out.m_60.z = _1388;
    out.m_62.x = _1356;
    out.m_62.y = _1390;
    float _1402 = _1382;
    float _1404 = _1308;
    float _1406 = _1388;
    if (!_1400)
    {
        _1226 = 1.0;
    }
    float _1408 = _1226;
    bool _1410 = !_1400;
    float _1412 = _1408;
    if (!_1410)
    {
        bool _1414 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1416 = isnan(_1362);
        bool _1418 = _1414 || _1416;
        bool _1420 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1422 = _1418 || _1420;
        if (!_1422)
        {
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1426 = _1362 + _1424;
            float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1430 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1428;
            float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1434 = _1432 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1436 = 1.0 / _1430;
            float _1438 = _1426 * _1436;
            float _1440 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1412 = _1440;
            _1442 = true;
        }
        else
        {
            bool _1444 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1446 = isnan(_1362);
            bool _1448 = _1444 || _1446;
            bool _1450 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1452 = _1448 || _1450;
            if (!_1452)
            {
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1456 = _1362 + _1454;
                float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1460 = _1458 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1464 = _1462 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1466 = 1.0 / _1460;
                float _1468 = _1456 * _1466;
                float _1470 = fma(_1468, _1464, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1412 = _1470;
                _1442 = true;
            }
            else
            {
                _1412 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1442 = false;
    float _1472 = _1412;
    float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1476 = _1308 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1480 = _1302 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1484 = _1310 + _1482;
    bool _1486 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.5);
    bool _1494 = _1490 || _1492;
    float _1496 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1498 = fma(_1480, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1500 = fma(_1484, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1502 = _1476;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1494)
    {
        _1502 = _1496;
    }
    float _1506 = _1502;
    float _1508 = _1506;
    if (_1494)
    {
        _1402 = _1498;
    }
    float _1510 = _1402;
    float _1512 = _1510;
    if (_1494)
    {
        _1504 = _1500;
    }
    float _1514 = _1504;
    float _1516 = _1514;
    if (!_1494)
    {
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1520 = _1154 + _1518;
        float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1524 = _1064 + _1522;
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1528 = _1520 * _1520;
        float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1532 = _1066 + _1530;
        float _1534 = fma(_1524, _1524, _1528);
        float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1538 = fma(_1532, _1532, _1534);
        float _1540 = sqrt(_1538);
        float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1544 = precise::min(_1540, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1546 = _1544 * _1536;
        float _1548 = -_1064;
        float _1550 = _1548 + _1496;
        float _1552 = _1542 * _1546;
        float _1554 = -_1154;
        float _1556 = _1554 + _1498;
        float _1558 = -_1066;
        float _1560 = _1558 + _1500;
        float _1562 = fma(_1550, _1552, _1064);
        float _1564 = fma(_1556, _1552, _1154);
        float _1566 = fma(_1560, _1552, _1066);
        _1512 = _1564;
        _1508 = _1562;
        _1516 = _1566;
        _1404 = _1536;
    }
    float _1568 = _1512;
    float _1570 = _1508;
    float _1572 = _1516;
    float _1574 = _1404;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1578 = _1568 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1570 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1572 + _1584;
    float _1588 = _1578 * _1578;
    float _1590 = fma(_1582, _1582, _1588);
    float _1592 = fma(_1586, _1586, _1590);
    float _1594 = rsqrt(_1592);
    float _1596 = sqrt(_1592);
    float _1598 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1600 = _1582 * _1598;
    float _1602 = _1586 * _1598;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 + _1606;
    float _1610 = sqrt(_1608);
    bool _1612 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1610 + _1614;
    float _1618 = _1594;
    float _1620 = _1616;
    float _1622 = _1574;
    float _1624 = _1578;
    float _1626 = _1598;
    float _1628 = _1600;
    if (_1612)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1630;
    }
    float _1632 = _1618;
    if (_1612)
    {
        float _1634 = rsqrt(_1608);
        _1228 = _1634;
    }
    float _1636 = _1228;
    float _1638 = _1636;
    if (_1612)
    {
        float _1640 = _1616 * _1632;
        _1620 = _1640;
    }
    float _1642 = _1620;
    if (_1612)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1622 = _1644;
    }
    float _1646 = _1622;
    float _1648 = _1632;
    if (_1612)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1586;
    float _1662 = _1658;
    if (_1612)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1598;
    float _1672 = -_1658;
    float _1674 = fma(_1578, _1670, _1672);
    if (!_1612)
    {
        _1624 = _1604;
    }
    float _1676 = _1624;
    float _1678 = _1676;
    if (_1612)
    {
        float _1680 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1680;
    }
    float _1682 = _1662;
    float _1684 = _1654;
    float _1686 = _1682;
    if (_1612)
    {
        float _1688 = fma(_1654, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1690;
    if (_1612)
    {
        float _1696 = _1668 + (-1.0);
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1612)
    {
        float _1702 = _1636 * _1690;
        _1406 = _1702;
    }
    float _1704 = _1406;
    if (!_1612)
    {
        _1638 = _1674;
    }
    float _1706 = _1638;
    float _1708 = _1706;
    if (_1612)
    {
        float _1710 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1710;
    }
    float _1712 = _1626;
    if (_1612)
    {
        float _1714 = _1600 * _1704;
        _1628 = _1714;
    }
    float _1716 = _1628;
    if (!_1612)
    {
        _1694 = _1602;
    }
    float _1718 = _1694;
    float _1720 = _1718;
    if (_1612)
    {
        float _1722 = _1602 * _1704;
        _1720 = _1722;
    }
    float _1724 = _1720;
    if (_1612)
    {
        float _1726 = fma(_1674, _1668, _1712);
        _1708 = _1726;
    }
    float _1728 = _1708;
    if (_1612)
    {
        float _1730 = _1716 * _1716;
        _1678 = _1730;
    }
    float _1732 = _1678;
    if (!_1612)
    {
        _1700 = _1606;
    }
    float _1734 = _1700;
    float _1736 = _1734;
    if (_1612)
    {
        float _1738 = _1724 * _1724;
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_1728, _1728, _1732);
    float _1744 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = _1742 + _1740;
    float _1748 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1752 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1750);
    float _1754 = precise::clamp(_1752, 0.0, 1.0);
    float _1756 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1758 = rsqrt(_1746);
    float _1760 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1748);
    float _1762 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1764 = -_1754;
    float _1766 = _1764 + 1.0;
    float _1768 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1770 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1760);
    float _1772 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1762);
    float _1774 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1756);
    float _1776 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1768);
    float _1778 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1772);
    float _1782 = abs(_1766);
    float _1784 = log2(_1782);
    float _1786 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1776);
    float _1788 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = _1758 * _1716;
    float _1796 = _1758 * _1728;
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1800 = _1758 * _1724;
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1804 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1798);
    float _1808 = -_1792;
    float _1810 = fma(_1808, _1692, 1.0);
    float _1812 = -_1802;
    float _1814 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1812);
    float _1816 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1818 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1806);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = -_1800;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1814);
    float _1826 = log2(_1810);
    float _1828 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1830 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1832 = fma(_1824, -0.5, 0.5);
    float _1834 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1816);
    float _1836 = fma(_1824, 0.5, 0.5);
    float _1838 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1830);
    float _1840 = exp2(_1820);
    float _1842 = _1796 + 1.0;
    float _1844 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1834);
    float _1846 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1838);
    float _1848 = fma(_1836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = 1.0 / _1828;
    float _1852 = fma(_1836, _1848, -0.212114393711090087890625);
    float _1854 = fma(_1836, _1852, 1.570728778839111328125);
    float _1856 = sqrt(_1832);
    float _1858 = -_1796;
    float _1860 = fma(_1840, _1842, _1858);
    float _1862 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1864 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1846);
    float _1866 = _1826 * 0.693147182464599609375;
    float _1868 = fma(_1860, 0.5, 0.5);
    float _1870 = _1862 * _1850;
    float _1872 = _1864 * _1850;
    float _1874 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = fma(_1870, 0.5, 0.5);
    float _1878 = fma(_1872, -0.5, 0.5);
    float _1880 = _1856 * 0.636619746685028076171875;
    float3 _4744 = float3(_1876, _1878, _1874);
    float _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4744, float3(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4744, float3(0.0), isnan(_4744)), level(0.0)).x;
    float3 _4755 = float3(_1876, _1878, _1874);
    float4 _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4755, float3(0.0), isnan(_4755)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4755, float3(0.0), isnan(_4755)), level(0.0)).xyzw;
    float _1887 = _1885.x;
    float _1889 = _1885.y;
    float _1891 = _1885.z;
    float _1893 = _1885.w;
    float _1895 = -_1854;
    float _1897 = fma(_1880, _1895, 1.0);
    float2 _4777 = float2(_1897, _1868);
    float3 _1901 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4777, float2(0.0), isnan(_4777)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4777, float2(0.0), isnan(_4777)), level(0.0)).xyz;
    float _1903 = _1901.x;
    float _1905 = _1901.y;
    float _1907 = _1901.z;
    float _1909 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1911 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1913 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1911);
    float _1915 = exp2(_1909);
    float _1917 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1913);
    float _1919 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = _1919 + _1828;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _1919;
    out.gl_Position.w = _1828;
    float _1925 = _1923 * 0.5;
    float _1927 = -_1915;
    float _1929 = _1927 + 1.0;
    out.m_47.x = _1921;
    float _1931 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1925;
    out.m_64.w = _1828;
    float _1933 = _1931 * _1882;
    float _1935 = -_1931;
    float _1937 = _1935 + 1.0;
    float _1939 = _1893 * _1933;
    float _1941 = _1907 * _1933;
    float _1943 = fma(_1903, _1939, _1887);
    float _1945 = fma(_1905, _1939, _1889);
    float _1947 = _1893 * _1937;
    float _1949 = fma(_1893, _1941, _1891);
    out.m_66.x = _1943;
    out.m_66.y = _1945;
    out.m_66.z = _1949;
    out.m_66.w = _1947;
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
    bool _1442 = false;
    bool _251 = false;
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
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2005 = as_type<float>(_101);
        out.gl_Position.z = _2005;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_49.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _95;
    if (_129)
    {
        out.m_47.x = 0.0;
    }
    int _133 = 0;
    if (_129)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2073 = as_type<float>(_137);
        out.gl_Position.z = _2073;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _147 = _145 != 0;
    int _149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _151 = _149 != 0;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = _143 * _141;
    float _159 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _157);
    float _161 = _159 * 6.283185482025146484375;
    float _163 = floor(_159);
    float _165 = _161 * 0.15915493667125701904296875;
    bool _167 = !_147;
    int _169 = _167 ? 0 : 1;
    int _171 = abs(_169);
    float _173 = _165 * 6.283185482025146484375;
    float _175 = cos(_173);
    bool _177 = !_155;
    int _179 = _177 ? 0 : 1;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _183 = abs(_179);
    float _185 = -_163;
    float _187 = _159 + _185;
    bool _189 = !_151;
    int _191 = _189 ? 0 : 1;
    int _193 = abs(_191);
    float _195 = -_187;
    float _197 = fma(_195, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _199 = float(_171);
    float _201 = fma(_175, 0.5, 0.5);
    bool _203 = _187 < 0.5;
    float _205 = float(_203);
    float _207 = abs(_197);
    float _209 = _199 * _207;
    float _211 = float(_183);
    float _213 = -_201;
    float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _217 = -_205;
    float _219 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _221 = float(_193);
    float _223 = fma(_211, _215, _209);
    float _225 = abs(_219);
    float _227 = fma(_221, _225, _223);
    bool _229 = !_181;
    float _247;
    float _249;
    if (!_229)
    {
        float _231 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _233 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _235 = float(_85);
        float _237 = fma(_233, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _239 = _237 * _231;
        float _241 = floor(_239);
        float _243 = -_241;
        float _245 = _239 + _243;
        _247 = _235;
        _249 = _245;
        _251 = true;
    }
    else
    {
        float _253 = float(_85);
        float _255 = 1.0 / _253;
        float _257 = _117 * _255;
        _247 = _253;
        _249 = _257;
    }
    _251 = false;
    float _259 = _247;
    float _261 = _249;
    float _263 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _265 = int(_263);
    float _267 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _269 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _271 = int(_269);
    float _273 = float(_265);
    float _275 = 1.0 / _273;
    float _277 = float(uint(_271));
    float _279 = 1.0 / _277;
    float _281 = _117 * _275;
    int _283 = ~_271;
    int _285 = _283 + 1;
    float _287 = trunc(_281);
    int _289 = int(_287);
    int _291 = as_type<int>(_279) + (-2);
    float _293 = float(uint(_289));
    float _295 = float(_289);
    float _297 = as_type<float>(_291) * _293;
    int _299 = ~_271;
    int _301 = _299 + 1;
    float _303 = trunc(_297);
    float _305 = precise::max(_303, 0.0);
    uint _308 = uint(_305);
    float _310 = float(_271);
    int _312 = _301 * int(_308);
    int _314 = _312 + _289;
    float _316 = float(uint(_314));
    float _318 = as_type<float>(_291) * _316;
    int _320 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _322 = _320 != 0;
    float _324 = trunc(_318);
    float _326 = precise::max(_324, 0.0);
    uint _328 = uint(_326);
    bool _330 = !_322;
    float _332 = _330 ? 7.345489978790283203125 : 1.0;
    float _334 = _332 * _139;
    float _336 = floor(_334);
    int _338 = int(_308) + int(_328);
    bool _340 = _295 >= _310;
    bool _342 = isnan(_295);
    bool _344 = _340 || _342;
    bool _346 = isnan(_310);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = 1.0 / _259;
    int _354 = _285 * _338;
    int _356 = _354 + _289;
    bool _358 = uint(_356) >= uint(_271);
    float _360 = trunc(_350);
    int _362 = int(_360);
    float _364 = -_336;
    float _366 = _334 + _364;
    bool _368 = !_358;
    int _370 = _368 ? 0 : (-1);
    float _372 = _366 * _310;
    int _374 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _376 = _374 != 0;
    int _378 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _380 = _378 != 0;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _384 = _382 != 0;
    float _386 = _117 * _310;
    int _388 = ~_338;
    int _390 = _388 + _370;
    int _392 = _390 + 1;
    bool _394 = _271 == 0;
    float _396 = _386 * _352;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _400 = _398 != 0;
    int _402 = _271 * _392;
    int _404 = _402 + _289;
    float _406 = trunc(_372);
    int _408 = int(_406);
    int _410 = _271 + (-1);
    int _412 = ~_362;
    int _414 = _412 + 1;
    int _416 = _414 + 1;
    bool _418 = !_394;
    int _420 = _418 ? _404 : (-1);
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _424 = _422 != 0;
    int _426 = _420 * _416;
    bool _428 = !_380;
    int _430 = _428 ? 0 : 1;
    float _432 = trunc(_396);
    int _434 = int(_432);
    bool _436 = !_424;
    int _438 = _436 ? 0 : 1;
    int _440 = _362 * _410;
    int _442 = _440 + _426;
    bool _444 = !_376;
    int _446 = _444 ? 0 : 1;
    int _448 = abs(_430);
    int _450 = abs(_438);
    bool _452 = !_384;
    int _454 = _452 ? 0 : 1;
    int _456 = abs(_446);
    int _458 = _408 * _450;
    int _460 = _458 + _289;
    bool _462 = !_400;
    int _464 = _462 ? 0 : 1;
    int _466 = abs(_454);
    int _468 = _442 * _448;
    int _470 = abs(_464);
    int _472 = _434 * _456;
    int _474 = _472 + _468;
    int _476 = ~_271;
    int _478 = _476 + 1;
    int _480 = _460 * _466;
    int _482 = _480 + _474;
    int _484 = ~_271;
    int _486 = _484 + 1;
    float _488 = as_type<float>(int(gl_VertexIndex));
    int _490 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _492 = _490 != 0;
    int _494 = _408 * _470;
    int _496 = _494 + _482;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _500 = _498 != 0;
    float _502 = float(uint(_496));
    float _504 = as_type<float>(_291) * _502;
    float _506 = trunc(_504);
    float _508 = precise::max(_506, 0.0);
    uint _510 = uint(_508);
    int _512 = _478 * int(_510);
    int _514 = _512 + _496;
    float _516 = float(uint(_514));
    float _518 = as_type<float>(_291) * _516;
    float _520 = trunc(_518);
    float _522 = precise::max(_520, 0.0);
    uint _524 = uint(_522);
    int _526 = int(_510) + int(_524);
    int _528 = ~_271;
    int _530 = _528 + 1;
    int _532 = _486 * _526;
    int _534 = _532 + _496;
    bool _536 = uint(_534) >= uint(_271);
    float _538 = float(uint(_460));
    bool _540 = !_536;
    int _542 = _540 ? 0 : (-1);
    float _544 = as_type<float>(_291) * _538;
    int _546 = ~_526;
    int _548 = _546 + _542;
    int _550 = _548 + 1;
    float _552 = trunc(_544);
    float _554 = precise::max(_552, 0.0);
    uint _556 = uint(_554);
    int _558 = _271 * _550;
    int _560 = _558 + _496;
    bool _562 = !_394;
    int _564 = _562 ? _560 : (-1);
    int _566 = _564 >> 31;
    int _568 = _564 & 3;
    bool _570 = _568 != 0;
    int _572 = _566 & 3;
    int _574 = _530 * int(_556);
    int _576 = _574 + _460;
    bool _578 = uint(_568) > 1u;
    int _580 = _564 + _572;
    float _582 = float(uint(_576));
    int _584 = _580 >> 2;
    int _586 = _564 & 3;
    bool _588 = _586 != 0;
    float _590 = as_type<float>(_291) * _582;
    int _592 = _584 << 4;
    int _594 = _592 + 368;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _596;
    int _600 = _588 ? 0 : 1;
    float _602 = trunc(_590);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    uint _608 = uint(int(uint(_594) >> uint(2)));
    uint _610 = uint(int(uint(int(_608)) >> uint(2)));
    int _612 = int(_608) & 3;
    float _614 = (*spvDescriptorSet0.vp_c9)._m0[int(_610)][_612];
    int _616 = int(_608) + 1;
    uint _618 = uint(int(uint(_616) >> uint(2)));
    int _620 = _616 & 3;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[int(_618)][_620];
    int _624 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _626 = _624 != 0;
    bool _628 = uint(_568) >= 2u;
    int _630 = ~_600;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    int _636 = _634;
    if (!_578)
    {
        int _638 = ~_600;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    int _644 = _594 + 8;
    uint _646 = uint(int(uint(_644) >> uint(2)));
    uint _648 = uint(int(uint(int(_646)) >> uint(2)));
    int _650 = int(_646) & 3;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[int(_648)][_650];
    int _654 = int(_646) + 1;
    uint _656 = uint(int(uint(_654) >> uint(2)));
    int _658 = _654 & 3;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[int(_656)][_658];
    float _662 = 1.0 / _598;
    bool _664 = !_570;
    int _666 = _664 ? 0 : 1;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _670 = _261 + _668;
    int _672 = as_type<int>(_488) & 1;
    bool _674 = _672 != 0;
    int _676 = as_type<int>(_488) & 2;
    bool _678 = _676 != 0;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _682 = _680 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _684 = _628 ? 0 : 1;
    bool _686 = _568 != 3;
    float _688 = 1.0 / _682;
    bool _690 = !_686;
    int _692 = _690 ? 0 : (-1);
    bool _694 = _568 != 3;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _698 = ~_271;
    int _700 = _698 + 1;
    float _702 = _670 * _662;
    int _704 = int(_556) + int(_606);
    float _706 = -_696;
    float _708 = fma(_267, 2.0, _706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _712 = _261 + _710;
    int _714 = ~_684;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    int _720 = _700 * _704;
    int _722 = _720 + _460;
    int _724 = abs(_666);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _726;
    int _730 = _718;
    float _732 = _708;
    if (_694)
    {
        int _734 = ~_684;
        int _736 = _734 + 1;
        _730 = _736;
    }
    int _738 = _730;
    float _740 = _712 * _688;
    int _742 = abs(_642);
    float _744 = fma(_728, _702, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _746 = uint(_722) >= uint(_271);
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _752 = !_746;
    int _754 = _752 ? 0 : (-1);
    float _756 = fma(_750, _740, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    int _758 = ~_742;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    int _764 = ~_704;
    int _766 = _764 + _754;
    int _768 = _766 + 1;
    int _770 = abs(_738);
    int _772 = ~_724;
    int _774 = _772 + 1;
    int _776 = _774 + 1;
    int _778 = _762 * as_type<int>(_622);
    int _780 = ~_770;
    int _782 = _780 + 1;
    int _784 = _782 + 1;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _788 = int(_786);
    int _790 = abs(_692);
    int _792 = _776 * as_type<int>(_614);
    int _794 = _792 + _778;
    int _796 = _271 * _768;
    int _798 = _796 + _460;
    bool _800 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _802 = isnan(_261);
    bool _804 = _800 || _802;
    bool _806 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _808 = _804 || _806;
    float _810 = float(_808);
    int _812 = _784 * as_type<int>(_652);
    int _814 = _812 + _794;
    int _816 = ~_790;
    int _818 = _816 + 1;
    int _820 = _818 + 1;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _822;
    bool _826 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _828 = isnan(_261);
    bool _830 = _826 || _828;
    bool _832 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _834 = _830 || _832;
    float _836 = float(_834);
    float _838 = -_810;
    float _840 = _838 + 1.0;
    bool _842 = !_626;
    int _844 = _842 ? 0 : 1;
    int _846 = _820 * as_type<int>(_660);
    int _848 = _846 + _814;
    bool _850 = _261 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _852 = isnan(_261);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _836 * _840;
    float _864 = -_836;
    float _866 = _864 + 1.0;
    float _868 = float(uint(_788));
    float _870 = fma(_824, _702, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _872 = abs(_844);
    float _874 = _860 * _866;
    int _876 = abs(_788);
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    int _882 = ~_872;
    int _884 = _882 + 1;
    int _886 = _884 + 1;
    float _888 = _744 * _874;
    float _890 = 1.0 / _868;
    float _892 = float(uint(_876));
    float _894 = _870 * _874;
    int _896 = _848 * _886;
    bool _898 = !_394;
    int _900 = _898 ? _798 : (-1);
    float _902 = in.m_56.x;
    float _904 = in.m_56.y;
    float _906 = -_860;
    float _908 = _906 + 1.0;
    float _910 = fma(_880, _740, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _912 = 1.0 / _892;
    int _914 = _900 * _872;
    int _916 = _914 + _896;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[143].x, _888);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[143].y, _894);
    bool _922 = _139 > 0.5;
    float _924 = float(uint(_916));
    float _926 = fma(_756, _862, _918);
    int _928 = as_type<int>(_890) + (-2);
    float _930 = fma(_910, _862, _920);
    int _932 = abs(_916);
    float _934 = in.m_51.y;
    float _936 = as_type<float>(_928) * _924;
    float _938 = float(uint(_932));
    int _940 = as_type<int>(_912) + (-2);
    float _942 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[145].x, _926);
    float _944 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[145].y, _930);
    float _946 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _948 = trunc(_936);
    float _950 = precise::max(_948, 0.0);
    uint _952 = uint(_950);
    float _954 = as_type<float>(_940) * _938;
    float _956 = _944 * _904;
    float _958 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _946);
    float _960 = _942 * _902;
    float _962 = in.m_44.x;
    float _964 = in.m_44.y;
    float _966 = in.m_44.z;
    float _968 = _227 * _956;
    float _970 = trunc(_954);
    float _972 = precise::max(_970, 0.0);
    uint _974 = uint(_972);
    int _976 = ~_788;
    int _978 = _976 + 1;
    float _980 = _227 * _960;
    bool _982 = !_678;
    float _984 = _982 ? (-0.5) : 0.5;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _988 = ~_876;
    int _990 = _988 + 1;
    float _992 = _968 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _994 = !_674;
    float _996 = _994 ? (-0.5) : 0.5;
    int _998 = _978 * int(_952);
    int _1000 = _998 + _916;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _984);
    float _1004 = _980 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1006 = _934 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _996);
    float _1010 = float(uint(_1000));
    float _1012 = _992 * _1002;
    float _1014 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1016 = _990 * int(_974);
    int _1018 = _1016 + _932;
    float _1020 = _1004 * _1008;
    float _1022 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1024 = fma(_1006, -2.0, _986);
    bool _1026 = _934 > 0.5;
    float _1028 = _964 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1030 = float(uint(_1018));
    float _1032 = as_type<float>(_928) * _1010;
    float _1034 = _964 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1036 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1038 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1028);
    float _1040 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1022);
    float _1042 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1034);
    float _1044 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1036);
    float _1046 = as_type<float>(_940) * _1030;
    float _1048 = _964 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1050 = trunc(_1032);
    float _1052 = precise::max(_1050, 0.0);
    uint _1054 = uint(_1052);
    float _1056 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1038);
    float _1058 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1042);
    float _1060 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1040);
    float _1062 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1044);
    float _1064 = _1056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1066 = _1058 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1068 = _1060 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1070 = _1062 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1072 = trunc(_1046);
    float _1074 = precise::max(_1072, 0.0);
    uint _1076 = uint(_1074);
    float _1078 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1080 = _1064 + _1068;
    float _1082 = _1066 + _1070;
    float _1084 = fma(_962, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1048);
    float _1086 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1078);
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1080 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1082 + _1092;
    int _1096 = int(_952) + int(_1054);
    float _1098 = _1012 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1100 = _1090 * _1090;
    float _1102 = _1094 * _1094;
    int _1104 = ~_788;
    int _1106 = _1104 + 1;
    float _1108 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1098);
    int _1110 = ~_876;
    int _1112 = _1110 + 1;
    float _1114 = _1100 + _1102;
    int _1116 = int(_974) + int(_1076);
    int _1118 = _1106 * _1096;
    int _1120 = _1118 + _916;
    float _1122 = -_996;
    int _1124 = _922 ? as_type<int>(_1122) : as_type<int>(_996);
    float _1126 = sqrt(_1114);
    float _1128 = -_984;
    int _1130 = _1026 ? as_type<int>(_1128) : as_type<int>(_984);
    int _1132 = _1112 * _1116;
    int _1134 = _1132 + _932;
    bool _1136 = uint(_1120) >= uint(_788);
    float _1138 = fma(_966, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1084);
    bool _1140 = !_492;
    float _1142 = _1140 ? _996 : as_type<float>(_1124);
    float _1144 = fma(_1014, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1108);
    bool _1146 = uint(_1134) >= uint(_876);
    float _1148 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1150 = !_1136;
    int _1152 = _1150 ? 0 : (-1);
    float _1154 = _1138 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1156 = _916 ^ _788;
    float _1158 = -_117;
    float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[76].x, _708);
    bool _1162 = !_500;
    float _1164 = _1162 ? _984 : as_type<float>(_1130);
    bool _1166 = !_1146;
    int _1168 = _1166 ? 0 : (-1);
    float _1170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1172 = ~_1096;
    int _1174 = _1172 + _1152;
    int _1176 = _1174 + 1;
    bool _1178 = _1126 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _1180 = uint(int(uint(_1156) >> uint(31)));
    int _1182 = ~_1168;
    int _1184 = _1116 + _1182;
    int _1186 = _1184 + 1;
    int _1188 = _788 * _1176;
    int _1190 = _1188 + _916;
    int _1192 = ~int(_1180);
    int _1194 = _1192 + 1;
    float _1196 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1198 = _788 == 0;
    float _1200 = _1148 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1202 = _1186 ^ _1194;
    float _1204 = _1154 + _1196;
    bool _1206 = !_1198;
    int _1208 = _1206 ? _1190 : (-1);
    bool _1210 = _788 == 0;
    int _1212 = ~_1194;
    int _1214 = _1212 + _1202;
    int _1216 = _1214 + 1;
    float _1218 = as_type<float>(_788);
    float _1220 = as_type<float>(_1194);
    float _1222 = _1196;
    float _1224 = _1100;
    float _1226 = _1164;
    float _1228 = _1064;
    if (!_1178)
    {
        _732 = _1100;
    }
    float _1230 = _732;
    float _1232 = _1230;
    if (!_1178)
    {
        _1218 = _1102;
    }
    float _1234 = _1218;
    float _1236 = _1234;
    if (!_1178)
    {
        _1220 = _1080;
    }
    float _1238 = _1220;
    float _1240 = _1238;
    if (!_1178)
    {
        _1222 = _1082;
    }
    float _1242 = _1222;
    float _1244 = float(_1208);
    float _1246 = _1242;
    if (!_1178)
    {
        _1224 = _1204;
    }
    float _1248 = _1224;
    bool _1250 = !_1178;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1126 + _1256;
        float _1260 = rsqrt(_1114);
        float _1262 = _1258 * _1254;
        float _1264 = _1204 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1260 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = fma(_1090, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1284 = fma(_1094, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1286 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1288 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1290 = _1282 + _1288;
        float _1292 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1294 = _1284 + _1292;
        float _1296 = fma(_1204, _1274, _1286);
        float _1298 = _1290 * _1290;
        float _1300 = _1294 * _1294;
        _1252 = _1296;
        _1232 = _1298;
        _1236 = _1300;
        _1240 = _1282;
        _1246 = _1284;
    }
    float _1302 = _1252;
    float _1304 = _1232;
    float _1306 = _1236;
    float _1308 = _1240;
    float _1310 = _1246;
    bool _1312 = !_1210;
    int _1314 = _1312 ? _1216 : (-1);
    float _1316 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1318 = _1302 + _1316;
    float _1320 = fma(_1200, _1244, _1160);
    float _1322 = _1170 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1324 = float(_1314);
    float _1326 = _1142 + 0.5;
    float _1328 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1024);
    float _1330 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _958);
    float _1332 = fma(_1318, _1318, _1304);
    float _1334 = fma(_1200, _1326, _1320);
    float _1336 = -_1328;
    float _1338 = fma(_1322, _1324, _1336);
    float _1340 = _1164 + (-0.5);
    float _1342 = -_1330;
    float _1344 = _1342 + 1.0;
    float _1346 = _1332 + _1306;
    float _1348 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1086);
    float _1350 = -_1322;
    float _1352 = fma(_1350, _1340, _1338);
    float _1354 = -_1344;
    float _1356 = fma(_1142, _1354, _1334);
    float _1358 = -_1348;
    float _1360 = _1358 + 1.0;
    float _1362 = sqrt(_1346);
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1366 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1372 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1374 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1378 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1380 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1382 = _1368 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1384 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1386 = _1372 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1388 = _1376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1390 = fma(_1164, _1360, _1352);
    out.m_58.x = _1374;
    out.m_58.y = _1378;
    out.m_58.z = _1382;
    out.m_58.w = _1380;
    bool _1392 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1394 = isnan(_1362);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1400 = _1396 || _1398;
    out.m_60.x = _1384;
    out.m_60.y = _1386;
    out.m_60.z = _1388;
    out.m_62.x = _1356;
    out.m_62.y = _1390;
    float _1402 = _1382;
    float _1404 = _1308;
    float _1406 = _1388;
    if (!_1400)
    {
        _1226 = 1.0;
    }
    float _1408 = _1226;
    bool _1410 = !_1400;
    float _1412 = _1408;
    if (!_1410)
    {
        bool _1414 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1416 = isnan(_1362);
        bool _1418 = _1414 || _1416;
        bool _1420 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1422 = _1418 || _1420;
        if (!_1422)
        {
            float _1424 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1426 = _1362 + _1424;
            float _1428 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1430 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1428;
            float _1432 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1434 = _1432 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1436 = 1.0 / _1430;
            float _1438 = _1426 * _1436;
            float _1440 = fma(_1438, _1434, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1412 = _1440;
            _1442 = true;
        }
        else
        {
            bool _1444 = _1362 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1446 = isnan(_1362);
            bool _1448 = _1444 || _1446;
            bool _1450 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1452 = _1448 || _1450;
            if (!_1452)
            {
                float _1454 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1456 = _1362 + _1454;
                float _1458 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1460 = _1458 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1462 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1464 = _1462 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1466 = 1.0 / _1460;
                float _1468 = _1456 * _1466;
                float _1470 = fma(_1468, _1464, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1412 = _1470;
                _1442 = true;
            }
            else
            {
                _1412 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1442 = false;
    float _1472 = _1412;
    float _1474 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1476 = _1308 + _1474;
    float _1478 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1480 = _1302 + _1478;
    float _1482 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1484 = _1310 + _1482;
    bool _1486 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1488 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.5);
    bool _1494 = _1490 || _1492;
    float _1496 = fma(_1476, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1498 = fma(_1480, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1500 = fma(_1484, _1472, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1502 = _1476;
    float _1504 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (_1494)
    {
        _1502 = _1496;
    }
    float _1506 = _1502;
    float _1508 = _1506;
    if (_1494)
    {
        _1402 = _1498;
    }
    float _1510 = _1402;
    float _1512 = _1510;
    if (_1494)
    {
        _1504 = _1500;
    }
    float _1514 = _1504;
    float _1516 = _1514;
    if (!_1494)
    {
        float _1518 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1520 = _1154 + _1518;
        float _1522 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1524 = _1064 + _1522;
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1528 = _1520 * _1520;
        float _1530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1532 = _1066 + _1530;
        float _1534 = fma(_1524, _1524, _1528);
        float _1536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1538 = fma(_1532, _1532, _1534);
        float _1540 = sqrt(_1538);
        float _1542 = _1526 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1544 = precise::min(_1540, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1546 = _1544 * _1536;
        float _1548 = -_1064;
        float _1550 = _1548 + _1496;
        float _1552 = _1542 * _1546;
        float _1554 = -_1154;
        float _1556 = _1554 + _1498;
        float _1558 = -_1066;
        float _1560 = _1558 + _1500;
        float _1562 = fma(_1550, _1552, _1064);
        float _1564 = fma(_1556, _1552, _1154);
        float _1566 = fma(_1560, _1552, _1066);
        _1512 = _1564;
        _1508 = _1562;
        _1516 = _1566;
        _1404 = _1536;
    }
    float _1568 = _1512;
    float _1570 = _1508;
    float _1572 = _1516;
    float _1574 = _1404;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1578 = _1568 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1582 = _1570 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1572 + _1584;
    float _1588 = _1578 * _1578;
    float _1590 = fma(_1582, _1582, _1588);
    float _1592 = fma(_1586, _1586, _1590);
    float _1594 = rsqrt(_1592);
    float _1596 = sqrt(_1592);
    float _1598 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1600 = _1582 * _1598;
    float _1602 = _1586 * _1598;
    float _1604 = _1600 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 + _1606;
    float _1610 = sqrt(_1608);
    bool _1612 = _1610 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1614 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = _1610 + _1614;
    float _1618 = _1594;
    float _1620 = _1616;
    float _1622 = _1574;
    float _1624 = _1578;
    float _1626 = _1598;
    float _1628 = _1600;
    if (_1612)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1630;
    }
    float _1632 = _1618;
    if (_1612)
    {
        float _1634 = rsqrt(_1608);
        _1228 = _1634;
    }
    float _1636 = _1228;
    float _1638 = _1636;
    if (_1612)
    {
        float _1640 = _1616 * _1632;
        _1620 = _1640;
    }
    float _1642 = _1620;
    if (_1612)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1622 = _1644;
    }
    float _1646 = _1622;
    float _1648 = _1632;
    if (_1612)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1586;
    float _1662 = _1658;
    if (_1612)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1598;
    float _1672 = -_1658;
    float _1674 = fma(_1578, _1670, _1672);
    if (!_1612)
    {
        _1624 = _1604;
    }
    float _1676 = _1624;
    float _1678 = _1676;
    if (_1612)
    {
        float _1680 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1680;
    }
    float _1682 = _1662;
    float _1684 = _1654;
    float _1686 = _1682;
    if (_1612)
    {
        float _1688 = fma(_1654, _1682, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1684 = _1688;
    }
    float _1690 = _1684;
    float _1692 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1694 = _1690;
    if (_1612)
    {
        float _1696 = _1668 + (-1.0);
        _1686 = _1696;
    }
    float _1698 = _1686;
    float _1700 = _1698;
    if (_1612)
    {
        float _1702 = _1636 * _1690;
        _1406 = _1702;
    }
    float _1704 = _1406;
    if (!_1612)
    {
        _1638 = _1674;
    }
    float _1706 = _1638;
    float _1708 = _1706;
    if (_1612)
    {
        float _1710 = _1698 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1710;
    }
    float _1712 = _1626;
    if (_1612)
    {
        float _1714 = _1600 * _1704;
        _1628 = _1714;
    }
    float _1716 = _1628;
    if (!_1612)
    {
        _1694 = _1602;
    }
    float _1718 = _1694;
    float _1720 = _1718;
    if (_1612)
    {
        float _1722 = _1602 * _1704;
        _1720 = _1722;
    }
    float _1724 = _1720;
    if (_1612)
    {
        float _1726 = fma(_1674, _1668, _1712);
        _1708 = _1726;
    }
    float _1728 = _1708;
    if (_1612)
    {
        float _1730 = _1716 * _1716;
        _1678 = _1730;
    }
    float _1732 = _1678;
    if (!_1612)
    {
        _1700 = _1606;
    }
    float _1734 = _1700;
    float _1736 = _1734;
    if (_1612)
    {
        float _1738 = _1724 * _1724;
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_1728, _1728, _1732);
    float _1744 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1746 = _1742 + _1740;
    float _1748 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1750 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1752 = fma(_1596, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1750);
    float _1754 = precise::clamp(_1752, 0.0, 1.0);
    float _1756 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1744);
    float _1758 = rsqrt(_1746);
    float _1760 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1748);
    float _1762 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1764 = -_1754;
    float _1766 = _1764 + 1.0;
    float _1768 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1770 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1760);
    float _1772 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1762);
    float _1774 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1756);
    float _1776 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1768);
    float _1778 = _1770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1780 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1772);
    float _1782 = abs(_1766);
    float _1784 = log2(_1782);
    float _1786 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1776);
    float _1788 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1790 = _1780 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = _1778 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1794 = _1758 * _1716;
    float _1796 = _1758 * _1728;
    float _1798 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1800 = _1758 * _1724;
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1804 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1798);
    float _1808 = -_1792;
    float _1810 = fma(_1808, _1692, 1.0);
    float _1812 = -_1802;
    float _1814 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1812);
    float _1816 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1818 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1806);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = -_1800;
    float _1824 = fma(_1822, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1814);
    float _1826 = log2(_1810);
    float _1828 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1818);
    float _1830 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1832 = fma(_1824, -0.5, 0.5);
    float _1834 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1816);
    float _1836 = fma(_1824, 0.5, 0.5);
    float _1838 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1830);
    float _1840 = exp2(_1820);
    float _1842 = _1796 + 1.0;
    float _1844 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1834);
    float _1846 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1838);
    float _1848 = fma(_1836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = 1.0 / _1828;
    float _1852 = fma(_1836, _1848, -0.212114393711090087890625);
    float _1854 = fma(_1836, _1852, 1.570728778839111328125);
    float _1856 = sqrt(_1832);
    float _1858 = -_1796;
    float _1860 = fma(_1840, _1842, _1858);
    float _1862 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1864 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1846);
    float _1866 = _1826 * 0.693147182464599609375;
    float _1868 = fma(_1860, 0.5, 0.5);
    float _1870 = _1862 * _1850;
    float _1872 = _1864 * _1850;
    float _1874 = _1866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1876 = fma(_1870, 0.5, 0.5);
    float _1878 = fma(_1872, -0.5, 0.5);
    float _1880 = _1856 * 0.636619746685028076171875;
    float3 _4744 = float3(_1876, _1878, _1874);
    float _1882 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4744, float3(0.0), isnan(_4744)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4744, float3(0.0), isnan(_4744)), level(0.0)).x;
    float3 _4755 = float3(_1876, _1878, _1874);
    float4 _1885 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4755, float3(0.0), isnan(_4755)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4755, float3(0.0), isnan(_4755)), level(0.0)).xyzw;
    float _1887 = _1885.x;
    float _1889 = _1885.y;
    float _1891 = _1885.z;
    float _1893 = _1885.w;
    float _1895 = -_1854;
    float _1897 = fma(_1880, _1895, 1.0);
    float2 _4777 = float2(_1897, _1868);
    float3 _1901 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4777, float2(0.0), isnan(_4777)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4777, float2(0.0), isnan(_4777)), level(0.0)).xyz;
    float _1903 = _1901.x;
    float _1905 = _1901.y;
    float _1907 = _1901.z;
    float _1909 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1911 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1913 = fma(_1788, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1911);
    float _1915 = exp2(_1909);
    float _1917 = fma(_1778, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1913);
    float _1919 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1917);
    float _1921 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1923 = _1919 + _1828;
    out.gl_Position.x = _1862;
    out.gl_Position.y = _1864;
    out.gl_Position.z = _1919;
    out.gl_Position.w = _1828;
    float _1925 = _1923 * 0.5;
    float _1927 = -_1915;
    float _1929 = _1927 + 1.0;
    out.m_47.x = _1921;
    float _1931 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _1925;
    out.m_64.w = _1828;
    float _1933 = _1931 * _1882;
    float _1935 = -_1931;
    float _1937 = _1935 + 1.0;
    float _1939 = _1893 * _1933;
    float _1941 = _1907 * _1933;
    float _1943 = fma(_1903, _1939, _1887);
    float _1945 = fma(_1905, _1939, _1889);
    float _1947 = _1893 * _1937;
    float _1949 = fma(_1893, _1941, _1891);
    out.m_66.x = _1943;
    out.m_66.y = _1945;
    out.m_66.z = _1949;
    out.m_66.w = _1947;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

