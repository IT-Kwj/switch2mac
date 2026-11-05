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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
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
    float4 m_62 [[user(locn0)]];
    float4 m_64 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_84 [[user(locn3)]];
    float4 m_74 [[user(locn4)]];
    float4 m_90 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_70 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_86 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_53 [[user(locn13)]];
    float4 m_66 [[user(locn14)]];
    float4 m_60 [[user(locn15)]];
    float4 m_76 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5105 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5352 = as_type<float>(_125);
        out.gl_Position.z = _5352;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5425 = as_type<float>(_163);
        out.gl_Position.z = _5425;
    }
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _167 = int(_165);
    float _169 = in.m_51.y;
    float _171 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_51.z;
    float _175 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _177 = int(_175);
    float _179 = float(_167);
    float _181 = 1.0 / _179;
    float _183 = float(uint(_177));
    int _185 = ~_177;
    int _187 = _185 + 1;
    int _189 = ~_177;
    int _191 = _189 + 1;
    float _193 = 1.0 / _183;
    float _195 = _145 * _181;
    float _197 = as_type<float>(int(gl_VertexIndex));
    float _199 = trunc(_195);
    int _201 = int(_199);
    int _203 = as_type<int>(_193) + (-2);
    float _205 = float(uint(_201));
    float _207 = as_type<float>(_203) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _214 = uint(_211);
    int _216 = _187 * int(_214);
    int _218 = _216 + _201;
    float _220 = float(uint(_218));
    float _222 = as_type<float>(_203) * _220;
    bool _224 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.0);
    bool _232 = _228 || _230;
    float _234 = trunc(_222);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    int _240 = as_type<int>(_197) & 1;
    bool _242 = _240 != 0;
    int _244 = as_type<int>(_197) & 2;
    bool _246 = _244 != 0;
    bool _248 = _173 > 0.5;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _252 = _250 != 0;
    bool _254 = !_242;
    float _256 = _254 ? (-0.5) : 0.5;
    int _258 = int(_214) + int(_238);
    float _260 = as_type<float>(_214);
    float _262 = _171;
    if (!_232)
    {
        float _264 = _171 * _171;
        float _266 = _264 * 0.5;
        _260 = _266;
    }
    float _268 = _260;
    bool _270 = !_246;
    float _272 = _270 ? (-0.5) : 0.5;
    float _274 = _268;
    if (!_232)
    {
        float _276 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _276;
    }
    float _278 = _274;
    bool _280 = !_232;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _171 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _171);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_232;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _171 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _262 = _336;
    }
    float _338 = _262;
    float _340 = 0.0;
    if (!_232)
    {
        float _342 = _145 * _145;
        float _344 = _342 * 0.5;
        _340 = _344;
    }
    float _346 = _340;
    float _348 = 0.0;
    float _350 = _346;
    if (!_232)
    {
        _348 = _145;
    }
    float _352 = _348;
    int _354 = _191 * _258;
    int _356 = _354 + _201;
    bool _358 = !_252;
    int _360 = _358 ? 0 : 1;
    float _362 = _352;
    if (!_232)
    {
        float _364 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _350 = _364;
    }
    float _366 = _350;
    bool _368 = !_232;
    float _370 = _366;
    if (!_368)
    {
        float _372 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _374 = log2(_372);
        float _376 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _378 = _376 + 1.0;
        float _380 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _382 = _145 * _374;
        float _384 = 1.0 / _378;
        float _386 = _380 * 0.693147182464599609375;
        float _388 = exp2(_382);
        float _390 = 1.0 / _386;
        float _392 = _388 + (-1.0);
        float _394 = -_392;
        float _396 = fma(_394, _390, _145);
        float _398 = _396 * _384;
        float _400 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _370 = _400;
    }
    float _402 = _370;
    bool _404 = !_232;
    if (!_404)
    {
        float _406 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = log2(_406);
        float _410 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _412 = _410 + 1.0;
        float _414 = 1.0 / _412;
        float _416 = _145 * _408;
        float _418 = exp2(_416);
        float _420 = -_418;
        float _422 = _420 + 1.0;
        float _424 = _422 * _414;
        _362 = _424;
    }
    float _426 = _362;
    bool _428 = _169 > 0.5;
    float _430 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _432 = int(_430);
    float _434 = -_272;
    int _436 = _248 ? as_type<int>(_434) : as_type<int>(_272);
    float _438 = in.m_51.w;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _450 = _448 != 0;
    float _452 = _131 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _454 = -_256;
    int _456 = _428 ? as_type<int>(_454) : as_type<int>(_256);
    float _458 = _173 * 2.0;
    bool _460 = uint(_356) >= uint(_177);
    float _462 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _464 = log2(_462);
    float _466 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    bool _468 = !_446;
    float _470 = _468 ? _256 : as_type<float>(_456);
    float _472 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _474 = !_450;
    float _476 = _474 ? _272 : as_type<float>(_436);
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _480 = _478 != 0;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _488 = _486 != 0;
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _492 = float(_109);
    bool _494 = !_484;
    int _496 = _494 ? 0 : 1;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = _145 * _464;
    float _504 = float(_177);
    float _506 = 1.0 / _492;
    float _508 = float(_201);
    bool _510 = !_460;
    int _512 = _510 ? 0 : (-1);
    bool _514 = _508 >= _504;
    bool _516 = isnan(_508);
    bool _518 = _514 || _516;
    bool _520 = isnan(_504);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _472 * _490;
    int _528 = ~_258;
    int _530 = _528 + _512;
    int _532 = _530 + 1;
    float _534 = exp2(_502);
    bool _536 = _177 == 0;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_500)
    {
        _538 = 1.0;
    }
    float _540 = _538;
    float _542 = _540;
    if (!_500)
    {
        _542 = 7.345489978790283203125;
    }
    float _544 = _542;
    bool _546 = !_480;
    int _548 = _546 ? 0 : 1;
    float _550 = trunc(_524);
    int _552 = int(_550);
    int _554 = abs(_360);
    float _556 = _544 * _131;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _560 = _558 != 0;
    float _562 = floor(_556);
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _570 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _568);
    float _572 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _578 = -_562;
    float _580 = _556 + _578;
    float _582 = _145 * _506;
    int _584 = _177 + (-1);
    float _586 = 1.0 / _576;
    float _588 = _580 * _504;
    int _590 = _177 * _532;
    int _592 = _590 + _201;
    float _594 = _504 * _582;
    int _596 = ~_552;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _602;
    bool _606 = !_536;
    int _608 = _606 ? _592 : (-1);
    float _610 = trunc(_588);
    int _612 = int(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _618 = _608 * _600;
    int _620 = abs(_548);
    bool _622 = !_560;
    int _624 = _622 ? 0 : 1;
    float _626 = trunc(_594);
    int _628 = int(_626);
    int _630 = _552 * _584;
    int _632 = _630 + _618;
    int _634 = abs(_496);
    bool _636 = !_488;
    int _638 = _636 ? 0 : 1;
    int _640 = _632 * _634;
    int _642 = abs(_638);
    float _644 = 1.0 / _616;
    int _646 = _612 * _554;
    int _648 = _646 + _201;
    int _650 = abs(_624);
    int _652 = _628 * _620;
    int _654 = _652 + _640;
    int _656 = ~_177;
    int _658 = _656 + 1;
    int _660 = ~_177;
    int _662 = _660 + 1;
    int _664 = _648 * _642;
    int _666 = _664 + _654;
    bool _668 = _177 == 0;
    int _670 = ~_432;
    int _672 = _670 + 1;
    int _674 = _612 * _650;
    int _676 = _674 + _666;
    float _678 = _604 * _644;
    float _680 = _131 + _169;
    float _682 = float(uint(_676));
    float _684 = _680 + (-1.0);
    float _686 = as_type<float>(_203) * _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _692;
    float _696 = trunc(_686);
    float _698 = precise::max(_696, 0.0);
    uint _700 = uint(_698);
    int _702 = _658 * int(_700);
    int _704 = _702 + _676;
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_203) * _706;
    float _710 = trunc(_708);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    int _716 = int(_700) + int(_714);
    int _718 = _662 * _716;
    int _720 = _718 + _676;
    float _722 = float(uint(_432));
    bool _724 = uint(_720) >= uint(_177);
    bool _726 = !_724;
    int _728 = _726 ? 0 : (-1);
    int _730 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _732 = _730 != 0;
    int _734 = ~_716;
    int _736 = _734 + _728;
    int _738 = _736 + 1;
    bool _740 = !_732;
    int _742 = _740 ? 0 : 1;
    int _744 = _177 * _738;
    int _746 = _744 + _676;
    bool _748 = !_668;
    int _750 = _748 ? _746 : (-1);
    int _752 = _750 & 3;
    bool _754 = _752 != 0;
    int _756 = _750 & 3;
    bool _758 = _756 != 0;
    int _760 = _754 ? 0 : 1;
    bool _762 = uint(_756) >= 2u;
    int _764 = ~_760;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    int _770 = _762 ? 0 : 1;
    bool _772 = uint(_756) > 1u;
    int _774 = ~_770;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    int _780 = _768;
    int _782 = _778;
    if (!_772)
    {
        int _784 = ~_760;
        int _786 = _784 + 1;
        _780 = _786;
    }
    int _788 = _780;
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _792 = int(_790);
    bool _794 = _756 != 3;
    int _796 = abs(_788);
    if (_794)
    {
        int _798 = ~_770;
        int _800 = _798 + 1;
        _782 = _800;
    }
    int _802 = _782;
    float _804 = float(_792);
    float _806 = 1.0 / _722;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _810 = _808 != 0;
    bool _812 = !_810;
    int _814 = _812 ? 0 : 1;
    bool _816 = _438 > 0.5;
    float _818 = 1.0 / _804;
    float _820 = fma(_438, 2.0, -1.0);
    float _822 = -_272;
    int _824 = _816 ? as_type<int>(_822) : as_type<int>(_272);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _832 = _830 != 0;
    bool _834 = !_442;
    float _836 = _834 ? _272 : as_type<float>(_824);
    int _838 = as_type<int>(_806) + (-2);
    bool _840 = !_828;
    int _842 = _840 ? 0 : 1;
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    int _848 = abs(_842);
    float _850 = _145 * _818;
    int _852 = abs(_846);
    float _854 = trunc(_850);
    int _856 = int(_854);
    int _858 = ~_432;
    int _860 = _858 + 1;
    float _862 = float(uint(_856));
    float _864 = as_type<float>(_838) * _862;
    float _866 = trunc(_864);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    int _872 = _672 * int(_870);
    int _874 = _872 + _856;
    float _876 = float(uint(_874));
    float _878 = as_type<float>(_838) * _876;
    float _880 = trunc(_878);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    int _886 = int(_870) + int(_884);
    int _888 = ~_177;
    int _890 = _888 + 1;
    int _892 = _860 * _886;
    int _894 = _892 + _856;
    bool _896 = uint(_894) >= uint(_432);
    float _898 = float(uint(_648));
    bool _900 = !_896;
    int _902 = _900 ? 0 : (-1);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _906 = _904 != 0;
    float _908 = as_type<float>(_203) * _898;
    int _910 = ~_886;
    int _912 = _910 + _902;
    int _914 = _912 + 1;
    bool _916 = !_906;
    int _918 = _916 ? 0 : 1;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _934 = _932 != 0;
    float _936 = trunc(_908);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = _432 * _914;
    int _944 = _942 + _856;
    int _946 = abs(_918);
    bool _948 = !_922;
    int _950 = _948 ? 0 : 1;
    bool _952 = !_926;
    int _954 = _952 ? 0 : 1;
    bool _956 = !_930;
    int _958 = _956 ? 0 : 1;
    int _960 = abs(_954);
    int _962 = _890 * int(_940);
    int _964 = _962 + _648;
    float _966 = float(uint(_964));
    int _968 = ~_177;
    int _970 = _968 + 1;
    float _972 = as_type<float>(_203) * _966;
    float _974 = trunc(_972);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    float _980 = float(_856);
    int _982 = int(_940) + int(_978);
    float _984 = as_type<float>(_940);
    float _986 = as_type<float>(_982);
    float _988 = as_type<float>(_946);
    if (_500)
    {
        _984 = 1.0;
    }
    float _990 = _984;
    float _992 = _990;
    if (!_500)
    {
        _992 = 1.2345600128173828125;
    }
    float _994 = _992;
    int _996 = _970 * _982;
    int _998 = _996 + _648;
    float _1000 = float(_432);
    bool _1002 = uint(_998) >= uint(_177);
    float _1004 = _1000 * _582;
    float _1006 = as_type<float>(_998);
    if (_500)
    {
        _1006 = _131;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_500)
    {
        _1010 = _169;
    }
    float _1012 = _1010;
    bool _1014 = _980 >= _1000;
    bool _1016 = isnan(_980);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_1000);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = trunc(_1004);
    int _1028 = int(_1026);
    bool _1030 = !_1002;
    int _1032 = _1030 ? 0 : (-1);
    float _1034 = _994 * _1012;
    bool _1036 = _432 == 0;
    int _1038 = ~_982;
    int _1040 = _1038 + _1032;
    int _1042 = _1040 + 1;
    float _1044 = floor(_1034);
    float _1046 = trunc(_1024);
    int _1048 = int(_1046);
    float _1050 = -_1044;
    float _1052 = _1034 + _1050;
    bool _1054 = !_1036;
    int _1056 = _1054 ? _944 : (-1);
    float _1058 = _1052 * _1000;
    int _1060 = _432 + (-1);
    bool _1062 = !_934;
    int _1064 = _1062 ? 0 : 1;
    float _1066 = -_452;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    int _1070 = ~_1048;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    float _1076 = trunc(_1058);
    int _1078 = int(_1076);
    float _1080 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _1082 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(0.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    int _1092 = _1056 * _1074;
    int _1094 = abs(_958);
    float _1096 = _1090 ? _566 : 0.0;
    int _1098 = _1048 * _1060;
    int _1100 = _1098 + _1092;
    int _1102 = abs(_950);
    int _1104 = _1100 * _960;
    int _1106 = abs(_1064);
    int _1108 = _1078 * _946;
    int _1110 = _1108 + _856;
    int _1112 = _1028 * _1102;
    int _1114 = _1112 + _1104;
    int _1116 = ~_432;
    int _1118 = _1116 + 1;
    int _1120 = _177 * _1042;
    int _1122 = _1120 + _648;
    int _1124 = _1110 * _1094;
    int _1126 = _1124 + _1114;
    bool _1128 = !_668;
    int _1130 = _1128 ? _1122 : (-1);
    int _1132 = _1078 * _1106;
    int _1134 = _1132 + _1126;
    int _1136 = ~_432;
    int _1138 = _1136 + 1;
    float _1140 = float(uint(_1134));
    float _1142 = as_type<float>(_838) * _1140;
    float _1144 = trunc(_1142);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    int _1150 = _1138 * int(_1148);
    int _1152 = _1150 + _1134;
    float _1154 = float(uint(_1152));
    float _1156 = as_type<float>(_838) * _1154;
    float _1158 = trunc(_1156);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = ~_432;
    int _1166 = _1164 + 1;
    int _1168 = int(_1148) + int(_1162);
    float _1170 = float(uint(_1110));
    int _1172 = _1118 * _1168;
    int _1174 = _1172 + _1134;
    float _1176 = as_type<float>(_838) * _1170;
    int _1178 = as_type<int>(_1170);
    float _1180 = as_type<float>(_1102);
    float _1182 = _1080;
    if (_500)
    {
        _1178 = 0;
    }
    int _1184 = _1178;
    bool _1186 = uint(_1174) >= uint(_432);
    float _1188 = trunc(_1176);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    int _1194 = _1184;
    if (!_500)
    {
        _1194 = 1;
    }
    int _1196 = _1194;
    bool _1198 = !_1186;
    int _1200 = _1198 ? 0 : (-1);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    int _1206 = ~_1168;
    int _1208 = _1206 + _1200;
    int _1210 = _1208 + 1;
    int _1212 = _1200;
    if (_500)
    {
        _1212 = 0;
    }
    int _1214 = _1212;
    float _1216 = in.m_58.w;
    int _1218 = _1214;
    if (!_500)
    {
        _1218 = 2;
    }
    int _1220 = _1218;
    int _1222 = _432 * _1210;
    int _1224 = _1222 + _1134;
    int _1226 = _1166 * int(_1192);
    int _1228 = _1226 + _1110;
    bool _1230 = !_1036;
    int _1232 = _1230 ? _1224 : (-1);
    bool _1234 = !_1204;
    int _1236 = _1234 ? 0 : 1;
    int _1238 = _1232 & 3;
    bool _1240 = _1238 != 0;
    int _1242 = _1232 & 3;
    bool _1244 = _1242 != 0;
    float _1246 = float(uint(_1228));
    int _1248 = _1240 ? 0 : 1;
    bool _1250 = uint(_1242) > 1u;
    float _1252 = as_type<float>(_838) * _1246;
    int _1254 = ~_1248;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    int _1260 = ~_432;
    int _1262 = _1260 + 1;
    float _1264 = trunc(_1252);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    bool _1270 = !_1244;
    int _1272 = _1270 ? 0 : 1;
    bool _1274 = _1242 != 3;
    int _1276 = _1258;
    if (!_1250)
    {
        int _1278 = ~_1248;
        int _1280 = _1278 + 1;
        _1276 = _1280;
    }
    int _1282 = _1276;
    bool _1284 = uint(_1242) >= 2u;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = _1242 != 3;
    int _1290 = int(_1192) + int(_1268);
    float _1292 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    int _1294 = ~_1286;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    float _1300 = 1.0 / _1292;
    int _1302 = _1262 * _1290;
    int _1304 = _1302 + _1110;
    int _1306 = _1298;
    if (_1288)
    {
        int _1308 = ~_1286;
        int _1310 = _1308 + 1;
        _1306 = _1310;
    }
    int _1312 = _1306;
    bool _1314 = uint(_1304) >= uint(_432);
    int _1316 = abs(_1312);
    bool _1318 = !_1314;
    int _1320 = _1318 ? 0 : (-1);
    bool _1322 = _1196 != 1;
    float _1324 = in.m_49.x;
    float _1326 = in.m_49.y;
    float _1328 = in.m_49.z;
    int _1330 = ~_1290;
    int _1332 = _1330 + _1320;
    int _1334 = _1332 + 1;
    float _1336 = _131 * 2.0;
    int _1338 = _432 * _1334;
    int _1340 = _1338 + _1110;
    float _1342 = floor(_1336);
    if (!_1322)
    {
        _1180 = _169;
    }
    float _1344 = _1180;
    float _1346 = _1344;
    if (!_1322)
    {
        _986 = _173;
    }
    float _1348 = _986;
    float _1350 = 0.0;
    float _1352 = _1348;
    if (!_1322)
    {
        _1350 = _1344;
    }
    float _1354 = _1350;
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _1358 = 0.0;
    float _1360 = _1354;
    if (!_1322)
    {
        _1358 = _173;
    }
    float _1362 = _1358;
    float _1364 = _1362;
    if (_1322)
    {
        _1360 = _131;
    }
    float _1366 = _1360;
    if (_1322)
    {
        _1346 = _131;
    }
    float _1368 = _1346;
    if (_1322)
    {
        _1352 = _169;
    }
    float _1370 = _1352;
    float _1372 = fma(_338, _1328, _1080);
    float _1374 = _1328;
    float _1376 = _1328;
    if (_1322)
    {
        _1364 = _169;
    }
    float _1378 = _1364;
    bool _1380 = _1220 != 2;
    float _1382 = in.m_44.x;
    float _1384 = in.m_44.y;
    float _1386 = in.m_44.z;
    bool _1388 = _1342 >= 0.0;
    bool _1390 = isnan(_1342);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan(0.0);
    bool _1396 = _1392 || _1394;
    float _1398 = _466 * _1356;
    bool _1400 = !_1274;
    int _1402 = _1400 ? 0 : (-1);
    float _1404 = 0.0;
    if (_1380)
    {
        _1404 = _131;
    }
    float _1406 = _1404;
    float _1408 = _1406;
    if (_1380)
    {
        _988 = _169;
    }
    float _1410 = _988;
    float _1412 = _1410;
    if (!_1380)
    {
        _1408 = _173;
    }
    float _1414 = _1408;
    if (!_1380)
    {
        _1412 = _131;
    }
    float _1416 = _1412;
    bool _1418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1420 = fma(_1372, _1216, _1386);
    float _1422 = -_1420;
    float _1424 = precise::max(0.0, _1422);
    float _1426 = as_type<float>(_1042);
    if (_1418)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = precise::min(_1292, _1424);
    float _1434 = _1432 * _1300;
    float _1436 = _1432;
    if (_1418)
    {
        float _1438 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = _1440;
    if (_1418)
    {
        float _1444 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1434);
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = 0.0;
    float _1450 = _1446;
    if (!_1418)
    {
        _1448 = _1434;
    }
    float _1452 = _1448;
    out.m_60.x = _1434;
    float _1454 = _1452;
    if (_1418)
    {
        float _1456 = _1446 * _1430;
        _1450 = _1456;
    }
    float _1458 = _1450;
    float _1460 = _1430;
    if (_1418)
    {
        float _1462 = floor(_1458);
        _1460 = _1462;
    }
    float _1464 = _1460;
    if (_1418)
    {
        float _1466 = -_1464;
        float _1468 = _1458 + _1466;
        _1454 = _1468;
    }
    float _1470 = _1454;
    bool _1472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1474 = floor(_458);
    bool _1476 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1478 = isnan(_1470);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = _458 + (-1.0);
    float _1490 = _1292;
    if (_1472)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1490 = _1492;
    }
    float _1494 = _1490;
    if (_1472)
    {
        float _1496 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1182 = _1496;
    }
    float _1498 = _1182;
    float _1500 = 0.0;
    float _1502 = _1498;
    if (!_1472)
    {
        _1500 = _1434;
    }
    float _1504 = _1500;
    float _1506 = _1504;
    if (_1472)
    {
        float _1508 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1434);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = _1510;
    if (_1472)
    {
        float _1514 = _1510 * _1494;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1494;
    if (_1472)
    {
        float _1520 = floor(_1516);
        _1518 = _1520;
    }
    float _1522 = _1518;
    if (_1472)
    {
        float _1524 = -_1522;
        float _1526 = _1516 + _1524;
        _1506 = _1526;
    }
    float _1528 = _1506;
    bool _1530 = _1474 > 0.0;
    bool _1532 = !_1036;
    int _1534 = _1532 ? _1340 : (-1);
    bool _1536 = _1474 >= 0.0;
    bool _1538 = isnan(_1474);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    bool _1546 = !_758;
    int _1548 = _1546 ? 0 : 1;
    int _1550 = _1544 ? 0 : 1;
    bool _1552 = _1342 > 0.0;
    float _1554 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1556 = ~_1550;
    int _1558 = _1556 + 1;
    int _1560 = _1558 + 1;
    int _1562 = _1560;
    if (!_1530)
    {
        int _1564 = ~_1550;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    bool _1570 = _756 != 3;
    int _1572 = _1396 ? 0 : 1;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1580 = _1578 != 0;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1584 = _1582 != 0;
    float _1586 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1588 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1590 = _1588 != 0;
    int _1592 = ~_1572;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    int _1598 = _1596;
    if (!_1552)
    {
        int _1600 = ~_1572;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1608 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1610 = _1608 != 0;
    float _1612 = fma(_1554, -2.0, _1606);
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1616 = !_1570;
    int _1618 = _1616 ? 0 : (-1);
    float _1620 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1612);
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1624 = _1622 != 0;
    float _1626 = -_1614;
    float _1628 = fma(_1586, 2.0, _1626);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1638 = 1.0 / _1632;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1644 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1646 = isnan(_1528);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1660 = !_1576;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = 1.0 / _1636;
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1668 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _1670 = !_1580;
    int _1672 = _1670 ? 0 : 1;
    bool _1674 = _173 > 0.5;
    int _1676 = abs(_1672);
    float _1678 = 1.0 / _1642;
    float _1680 = -_1666;
    float _1682 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1680);
    float _1684 = -_1668;
    float _1686 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1688 = -_572;
    float _1690 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1688);
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1696;
    float _1700 = 1.0 / _1658;
    float _1702 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1708 = _1698 * _1638;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1710;
    float _1714 = -_1702;
    float _1716 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1714);
    float _1718 = _1706 * _1664;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1724 = _169 * 2.0;
    float _1726 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1728 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1734 = floor(_1724);
    float _1736 = -_1726;
    float _1738 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1736);
    float _1740 = -_1728;
    float _1742 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1740);
    float _1744 = _1694 * _1678;
    float _1746 = _1732 * _1700;
    float _1748 = _1712 * _586;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1754 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _526);
    float _1756 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1760 = 1.0 + _1758;
    float _1762 = 1.0 / _1752;
    float _1764 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1766 = -_1756;
    float _1768 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1766);
    float _1770 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1772 = _1734 >= 0.0;
    bool _1774 = isnan(_1734);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    float _1782 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1784 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1786 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _1788 = _1780 ? 0 : 1;
    float _1790 = _131 + _173;
    bool _1792 = _1734 > 0.0;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1796 = 1.0 / _1760;
    float _1798 = _1790 + (-1.0);
    float _1800 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1802 = _173 + _169;
    float _1804 = _1722 * _1762;
    float _1806 = _1794 * 0.15915493667125701904296875;
    float _1808 = _1802 + (-1.0);
    float _1810 = floor(_1754);
    float _1812 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1814 = 1.0 + _1812;
    float _1816 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1818 = -_1764;
    float _1820 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1818);
    float _1822 = -_1770;
    float _1824 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1826 = -_1782;
    float _1828 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1830 = -_1784;
    float _1832 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1830);
    float _1834 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1836 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1398);
    int _1838 = ~_1788;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    float _1844 = -_1786;
    float _1846 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1844);
    int _1848 = _1842;
    if (!_1792)
    {
        int _1850 = ~_1788;
        int _1852 = _1850 + 1;
        _1848 = _1852;
    }
    int _1854 = _1848;
    float _1856 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1858 = floor(_1836);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1862 = 1.0 + _1860;
    float _1864 = -_1810;
    float _1866 = _1754 + _1864;
    float _1868 = _1754 * 6.283185482025146484375;
    float _1870 = _1096 * _1796;
    float _1872 = _1856 * _1862;
    float _1874 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1832);
    float _1876 = _1868 * 0.15915493667125701904296875;
    float _1878 = _1806 * 6.283185482025146484375;
    float _1880 = cos(_1878);
    float _1882 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = -_1872;
    float _1886 = _1856 + _1884;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1824);
    bool _1890 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1892 = isnan(1.0);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1898 = _1894 || _1896;
    float _1900 = fma(_1886, _169, _1872);
    float _1902 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1846);
    float _1904 = _1806 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = -_1858;
    float _1910 = _1836 + _1908;
    float _1912 = -_1882;
    float _1914 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1912);
    float _1916 = _1836 * 6.283185482025146484375;
    float _1918 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1768);
    float _1920 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1914);
    float _1922 = _1876 * 6.283185482025146484375;
    float _1924 = cos(_1922);
    float _1926 = _1880 * _1880;
    float _1928 = _1916 * 0.15915493667125701904296875;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1932 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1828);
    float _1934 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1820);
    float _1936 = fma(_1906, _1906, _1926);
    bool _1938 = _1866 < 0.5;
    float _1940 = float(_1938);
    float _1942 = _1928 * 6.283185482025146484375;
    float _1944 = cos(_1942);
    float _1946 = -_1866;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1958 = -_1940;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1962 = float(_1676);
    float _1964 = fma(_1924, 0.5, 0.5);
    bool _1966 = !_1584;
    int _1968 = _1966 ? 0 : 1;
    float _1970 = rsqrt(_1936);
    bool _1972 = _1910 < 0.5;
    float _1974 = float(_1972);
    float _1976 = -_1964;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1980 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1984 = -_1910;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1988 = -_1974;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1992 = -_1980;
    float _1994 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1992);
    float _1996 = -_1930;
    float _1998 = fma(_1982, 2.0, _1996);
    float _2000 = fma(_1944, 0.5, 0.5);
    float _2002 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1994);
    float _2004 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2006 = -_2000;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2012 = _1906 * _1970;
    float _2014 = _1880 * _1970;
    float _2016 = fma(_338, _1324, _2004);
    float _2018 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2022 = fma(_338, _1326, _2018);
    float _2024 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2028 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2020);
    float _2030 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2032 = -_1920;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2002);
    float _2036 = -_2026;
    float _2038 = fma(_2024, 2.0, _2036);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2044 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2046 = fma(_2016, _1216, _1382);
    float _2048 = fma(_2022, _1216, _1384);
    float _2050 = fma(_2030, -2.0, _2040);
    float _2052 = fma(_2044, -2.0, _2042);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2062 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2010);
    float _2064 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2066 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2074 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2082 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2088 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2064);
    float _2090 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2066);
    out.m_62.x = _2074;
    out.m_62.y = _2076;
    out.m_62.z = _2078;
    float _2092 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2080);
    float _2094 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_64.x = _2082;
    out.m_64.y = _2084;
    out.m_64.z = _2086;
    float _2098 = -_145;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1998);
    float _2102 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2088);
    float _2104 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2090);
    float _2106 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2108 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2092);
    float _2110 = float(_1854);
    float _2112 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2114 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _2116 = _470 + 0.5;
    float _2118 = fma(_426, _1324, _2106);
    float _2120 = fma(_426, _1326, _2112);
    float _2122 = fma(_426, _1328, _2114);
    float _2124 = fma(_2094, _2116, _2100);
    float _2126 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2052);
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2130 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2134 = _476 + (-0.5);
    float _2136 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2128);
    float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _2138;
    float _2142 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2132);
    float _2144 = -_2130;
    float _2146 = -_2126;
    float _2148 = fma(_2144, _2134, _2146);
    float _2150 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2156 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2142);
    float _2158 = -_2150;
    float _2160 = _2158 + 1.0;
    float _2162 = -_2120;
    float _2164 = _2022 + _2162;
    float _2166 = -_2156;
    float _2168 = _2166 + 1.0;
    float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2172 = -_2160;
    float _2174 = fma(_470, _2172, _2124);
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _2176;
    float _2180 = fma(_476, _2168, _2148);
    float _2182 = -_2118;
    float _2184 = _2016 + _2182;
    float _2186 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2188 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2190 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_66.x = _2174;
    out.m_66.y = _2180;
    float _2192 = 1.0 / _2178;
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2186);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2188);
    float _2198 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2190);
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2204 = _2108 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2206 = -_145;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2038);
    float _2210 = 1.0 / _2140;
    int _2212 = abs(_742);
    float _2214 = _1068 * _1434;
    float _2216 = float(_2212);
    float _2218 = float(_848);
    float _2220 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[193].y, _570);
    float _2222 = precise::max(0.0, _2214);
    float _2224 = 1.0 / _2154;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2228 = _1470 + _2226;
    float _2230 = abs(_1948);
    float _2232 = _2218 * _2230;
    float _2234 = abs(_1986);
    float _2236 = _2218 * _2234;
    float _2238 = precise::min(_2222, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2242 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _2240;
    float _2244 = float(_852);
    float _2246 = fma(_2216, _1978, _2232);
    float _2248 = fma(_2216, _2008, _2236);
    float _2250 = _2238 * _2170;
    float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2254 = _1470 + _2252;
    float _2256 = abs(_1960);
    float _2258 = fma(_2244, _2256, _2246);
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2262 = _1470 + _2260;
    float _2264 = 1.0 / _2202;
    float _2266 = fma(_1744, _2254, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2270 = _1470 + _2268;
    float _2272 = fma(_1746, _2262, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2274 = _2220 * 0.15915493667125701904296875;
    float _2276 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2278 = _1470 + _2276;
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2282 = _1470 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2286 = _2284 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2288 = 1.0 / _2242;
    float _2290 = fma(_1708, _2228, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2292 = fma(_1748, _2278, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2294 = fma(_1804, _2270, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2296 = fma(_1718, _2282, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2300 = _1528 + _2298;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2304 = _1528 + _2302;
    float _2306 = _2274 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = abs(_1990);
    float _2312 = fma(_2244, _2310, _2248);
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2316 = _1470 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _2318;
    float _2322 = _2300 * _2210;
    float _2324 = _2304 * _2224;
    float _2326 = fma(_678, _2316, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2330 = _1528 + _2328;
    float _2332 = 1.0 / _2286;
    float _2334 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2336 = _1528 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2340 = _1528 + _2338;
    float _2342 = _2330 * _2264;
    float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _2344;
    float _2348 = _2336 * _2288;
    float _2350 = _2340 * _2192;
    float _2352 = -_1900;
    float _2354 = _2012 * _2352;
    float _2356 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2358 = 1.0 / _2320;
    float _2360 = -_1900;
    float _2362 = _2014 * _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2368 = _2012 * _2356;
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2372 = _1528 + _2370;
    float _2374 = fma(_1068, _2362, _2368);
    float _2376 = fma(_1956, _2324, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2378 = fma(_2366, _2324, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    float _2380 = -_2356;
    float _2382 = _2014 * _2380;
    float _2384 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2384;
    bool _2388 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2390 = isnan(_1470);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2396 = _2392 || _2394;
    float _2398 = float(_2396);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _2400;
    float _2404 = _2372 * _2332;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    bool _2414 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2416 = isnan(_1470);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2422 = _2418 || _2420;
    float _2424 = float(_2422);
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2428 = _1528 + _2426;
    float _2430 = fma(_1068, _2354, _2382);
    float _2432 = fma(_1952, _2322, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2434 = fma(_2346, _2322, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _2436 = fma(_2386, _2350, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2438 = fma(_2402, _2350, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2440;
    float _2444 = -_2398;
    float _2446 = _2444 + 1.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _2448;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2456 = fma(_2408, _2342, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2458 = fma(_2412, _2342, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    bool _2464 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2466 = isnan(_1470);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2472 = _2468 || _2470;
    float _2474 = float(_2472);
    float _2476 = _2428 * _2358;
    float _2478 = -_2424;
    float _2480 = _2478 + 1.0;
    float _2482 = _2424 * _2446;
    bool _2484 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2486 = isnan(_1470);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = fma(_2454, _2404, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2498 = fma(_2462, _2404, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    float _2500 = _2474 * _2480;
    float _2502 = -_2474;
    float _2504 = _2502 + 1.0;
    bool _2506 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2508 = isnan(_1470);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2514 = _2510 || _2512;
    float _2516 = float(_2514);
    float _2518 = -_2494;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2442, _2348, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2524 = _2494 * _2504;
    bool _2526 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2528 = isnan(_1470);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    float _2538 = _2516 * _2520;
    float _2540 = -_2516;
    float _2542 = _2540 + 1.0;
    bool _2544 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2546 = isnan(_1528);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2450, _2348, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    bool _2558 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2560 = isnan(_1470);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2566 = _2562 || _2564;
    float _2568 = float(_2566);
    float _2570 = _2536 * _2542;
    float _2572 = -_2536;
    float _2574 = _2572 + 1.0;
    bool _2576 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2578 = isnan(_1528);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2584 = _2580 || _2582;
    float _2586 = float(_2584);
    float _2588 = -_2554;
    float _2590 = _2588 + 1.0;
    float _2592 = -_2568;
    float _2594 = _2592 + 1.0;
    float _2596 = _2568 * _2574;
    float _2598 = fma(_690, _2476, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2600 = _2586 * _2590;
    float _2602 = -_2586;
    float _2604 = _2602 + 1.0;
    bool _2606 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2608 = isnan(_1528);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    float _2618 = abs(_2250);
    float _2620 = log2(_2618);
    float _2622 = fma(_694, _2476, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    float _2624 = _1486 * _2594;
    float _2626 = -_1654;
    float _2628 = _2626 + 1.0;
    float _2630 = _1654 * _2604;
    bool _2632 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2634 = isnan(_1528);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = _2266 * _2624;
    float _2646 = -_2616;
    float _2648 = _2646 + 1.0;
    float _2650 = _2616 * _2628;
    bool _2652 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2654 = isnan(_1528);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2660 = _2656 || _2658;
    float _2662 = float(_2660);
    float _2664 = _1434 * _2374;
    float _2666 = float(_1604);
    float _2668 = -_2642;
    float _2670 = _2668 + 1.0;
    float _2672 = float(_1568);
    float _2674 = _2642 * _2648;
    bool _2676 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2678 = isnan(_1528);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2690 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2692 = isnan(_1528);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = _1962 * _2666;
    int _2704 = abs(_1662);
    float _2706 = -_2662;
    float _2708 = _2706 + 1.0;
    float _2710 = exp2(_2688);
    float _2712 = _2662 * _2670;
    int _2714 = abs(_1968);
    float _2716 = _2700 * _2708;
    float _2718 = -_2700;
    float _2720 = _2718 + 1.0;
    float _2722 = _2702 * (-2.0);
    float _2724 = -_1486;
    float _2726 = _2724 + 1.0;
    float _2728 = _2686 * _2720;
    float _2730 = float(_2704);
    float _2732 = -_2686;
    float _2734 = _2732 + 1.0;
    float _2736 = fma(_2726, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2644);
    float _2738 = _2434 * _2728;
    float _2740 = _2432 * _2728;
    float _2742 = in.m_68.x;
    float _2744 = in.m_68.y;
    float _2746 = in.m_68.z;
    float _2748 = float(_2714);
    float _2750 = _2104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2752 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2754 = _2730 * _2672;
    float _2756 = fma(_2734, (*spvDescriptorSet0.vp_c9)._m0[175].z, _2738);
    float _2758 = _2748 * _2110;
    float _2760 = _1434 * _2430;
    float _2762 = -_2014;
    float _2764 = fma(_2762, _2752, _2664);
    float _2766 = fma(_2734, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2740);
    float _2768 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2750);
    float _2770 = -_2012;
    float _2772 = fma(_2770, _2752, _2760);
    float _2774 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2764);
    float _2776 = fma(_2376, _2716, _2766);
    float _2778 = _2754 * (-2.0);
    float _2780 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2772);
    float _2782 = _2102 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2784 = fma(_1800, _2778, _1800);
    float _2786 = fma(_2378, _2716, _2756);
    float _2788 = _2774 + _2204;
    float _2790 = _2780 + _2782;
    float _2792 = _2758 * (-2.0);
    float _2794 = fma(_2436, _2712, _2776);
    float _2796 = fma(_2778, _2742, _2742);
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2800 = -_2768;
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _2804 = !_1898;
    float _2806 = _2804 ? _145 : _1870;
    float _2808 = -_2790;
    float _2810 = _2808 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2812 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2798);
    float _2814 = _2802 * _2802;
    float _2816 = -_2788;
    float _2818 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2820 = fma(_1816, _2792, _1816);
    float _2822 = fma(_2792, _2746, _2746);
    float _2824 = fma(_2810, _2810, _2814);
    bool _2826 = _131 > 0.5;
    float _2828 = _173 + (-0.5);
    float _2830 = _131 + (-0.5);
    float _2832 = fma(_2818, _2818, _2824);
    float _2834 = fma(_2722, _2744, _2744);
    float _2836 = fma(_2828, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2822);
    float _2838 = fma(_2830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2796);
    float _2840 = fma(_2438, _2712, _2786);
    float _2842 = rsqrt(_2832);
    float _2844 = fma(_2806, _2784, _2838);
    float _2846 = fma(_1834, _2722, _1834);
    float _2848 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2850 = in.m_58.x;
    float _2852 = _2844 * 0.15915493667125701904296875;
    float _2854 = fma(_2272, _2596, _2736);
    float _2856 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2848);
    float _2858 = _169 + (-0.5);
    float _2860 = fma(_2456, _2674, _2794);
    float _2862 = fma(_2290, _2570, _2854);
    float _2864 = fma(_2458, _2674, _2840);
    float _2866 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2834);
    float _2868 = _2852 * 6.283185482025146484375;
    float _2870 = sin(_2868);
    float _2872 = fma(_2296, _2538, _2862);
    float _2874 = fma(_2522, _2650, _2860);
    float _2876 = _2810 * _2842;
    float _2878 = _2818 * _2842;
    float _2880 = fma(_2806, _2846, _2866);
    float _2882 = fma(_2806, _2820, _2836);
    float _2884 = _2876 * _2876;
    float _2886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2888 = _2768 + _2886;
    float _2890 = fma(_2292, _2524, _2872);
    float _2892 = _2852 * 6.283185482025146484375;
    float _2894 = cos(_2892);
    float _2896 = fma(_2878, _2878, _2884);
    float _2898 = _2888 * _2888;
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2902 = _2790 + _2900;
    float _2904 = -_1434;
    float _2906 = _2904 + 1.0;
    float _2908 = _2802 * _2842;
    float _2910 = fma(_2496, _2630, _2874);
    float _2912 = fma(_2902, _2902, _2898);
    float _2914 = rsqrt(_2896);
    float _2916 = fma(_2294, _2500, _2890);
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2920 = _2788 + _2918;
    bool _2922 = _2906 >= 0.001000000047497451305389404296875;
    bool _2924 = isnan(_2906);
    bool _2926 = _2922 || _2924;
    bool _2928 = isnan(0.001000000047497451305389404296875);
    bool _2930 = _2926 || _2928;
    float _2932 = float(_2930);
    float _2934 = fma(_2556, _2650, _2864);
    float _2936 = fma(_2326, _2482, _2916);
    float _2938 = fma(_2920, _2920, _2912);
    float _2940 = _2850 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2942 = fma(_2598, _2600, _2910);
    float _2944 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2936);
    float _2946 = sqrt(_2938);
    float _2948 = _2880 * 0.15915493667125701904296875;
    float _2950 = _2882 * 0.15915493667125701904296875;
    float _2952 = _2940 * _2944;
    int _2954 = _1232 >> 31;
    float _2956 = fma(_2498, _2630, _2934);
    float _2958 = _2878 * _2914;
    float _2960 = _2876 * _2914;
    float _2962 = _2952 * _2932;
    float _2964 = _2948 * 6.283185482025146484375;
    float _2966 = sin(_2964);
    float _2968 = -_2958;
    float _2970 = _2878 * _2968;
    float _2972 = _2908 * _2960;
    float _2974 = _2258 * _2962;
    int _2976 = _2954 & 3;
    float _2978 = -_2970;
    float _2980 = fma(_2876, _2960, _2978);
    float _2982 = -_2958;
    float _2984 = _2908 * _2982;
    float _2986 = _2974 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2988 = _2948 * 6.283185482025146484375;
    float _2990 = cos(_2988);
    float _2992 = _2980 * _2980;
    float _2994 = _2946 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2996 = _2986 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2998 = fma(_2622, _2600, _2956);
    float _3000 = fma(_2972, _2972, _2992);
    int _3002 = _750 >> 31;
    float _3004 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2942);
    float _3006 = _2950 * 6.283185482025146484375;
    float _3008 = cos(_3006);
    float _3010 = fma(_2984, _2984, _3000);
    int _3012 = _3002 & 3;
    float _3014 = _2894 * _2966;
    float _3016 = precise::min(_2996, _2994);
    float _3018 = in.m_58.y;
    int _3020 = _750 + _3012;
    float _3022 = _2870 * _2966;
    float _3024 = rsqrt(_2938);
    int _3026 = _1232 + _2976;
    float _3028 = _2894 * _2990;
    int _3030 = _3020 >> 2;
    float _3032 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[182].z, _2998);
    int _3034 = _3026 >> 2;
    float _3036 = _2870 * _2990;
    int _3038 = _3030 << 4;
    int _3040 = _3038 + 368;
    float _3042 = rsqrt(_3010);
    int _3044 = _3034 << 4;
    int _3046 = _3044 + 512;
    float _3048 = _2894 * _3008;
    uint _3050 = uint(int(uint(_3040) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[int(_3060)][_3062];
    float _3066 = _2870 * _3008;
    float _3068 = _2990 * _3008;
    float _3070 = _2966 * _3008;
    out.m_70.w = _3016;
    float _3072 = _2950 * 6.283185482025146484375;
    float _3074 = sin(_3072);
    float _3076 = _3024 * _3016;
    bool _3078 = _169 > 0.5;
    uint _3080 = uint(int(uint(_3046) >> uint(2)));
    uint _3082 = uint(int(uint(int(_3080)) >> uint(2)));
    int _3084 = int(_3080) & 3;
    float _3086 = (*spvDescriptorSet0.vp_c9)._m0[int(_3082)][_3084];
    int _3088 = int(_3080) + 1;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    int _3092 = _3088 & 3;
    float _3094 = (*spvDescriptorSet0.vp_c9)._m0[int(_3090)][_3092];
    float _3096 = _3004 + 1.0;
    float _3098 = _2888 * _3076;
    float _3100 = _2902 * _3076;
    float _3102 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2812);
    float _3104 = 1.0 / _2034;
    float _3106 = -_3098;
    float _3108 = _2888 + _3106;
    float _3110 = _2980 * _3042;
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    int _3114 = _3040 + 8;
    uint _3116 = uint(int(uint(_3114) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = _2354 * _3096;
    float _3134 = _3108 * _3108;
    float _3136 = -_3112;
    float _3138 = _3136 + 1.0;
    float _3140 = -_3102;
    float _3142 = _3140 + 1.0;
    float _3144 = fma(_3074, _3028, _3022);
    float _3146 = fma(_3074, _3022, _3028);
    float _3148 = -_3100;
    float _3150 = _2902 + _3148;
    float _3152 = _2920 * _3076;
    float _3154 = -_3014;
    float _3156 = fma(_3074, _3036, _3154);
    float _3158 = -_3036;
    float _3160 = fma(_3074, _3014, _3158);
    float _3162 = fma(_3150, _3150, _3134);
    float _3164 = -_3152;
    float _3166 = _2920 + _3164;
    float _3168 = fma(_1934, _3104, -1.0);
    float _3170 = _3138 * _3104;
    int _3172 = abs(_1272);
    float _3174 = fma(_3166, _3166, _3162);
    float _3176 = fma(_3138, _3168, 1.0);
    int _3178 = abs(_1548);
    float _3180 = _1918 * _3170;
    float _3182 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3184 = _3176 * _3176;
    int _3186 = abs(_802);
    float _3188 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3190 = int(_3188);
    float _3192 = _3182 * _2944;
    float _3194 = fma(_3180, _3180, _3184);
    float _3196 = _1932 * _3170;
    int _3198 = _3046 + 8;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    uint _3202 = uint(int(uint(int(_3200)) >> uint(2)));
    int _3204 = int(_3200) & 3;
    float _3206 = (*spvDescriptorSet0.vp_c9)._m0[int(_3202)][_3204];
    int _3208 = int(_3200) + 1;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    int _3212 = _3208 & 3;
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[int(_3210)][_3212];
    int _3216 = abs(_1282);
    float _3218 = _3192 * _2932;
    float _3220 = fma(_3196, _3196, _3194);
    int _3222 = ~_3216;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    float _3228 = _2312 * _3218;
    int _3230 = ~_796;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    float _3236 = rsqrt(_3220);
    int _3238 = ~_3178;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _3228 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _3246 = ~_3172;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3234 * as_type<int>(_3064);
    int _3254 = _3226 * as_type<int>(_3094);
    int _3256 = _3242 * as_type<int>(_3056);
    int _3258 = _3256 + _3252;
    int _3260 = ~_3186;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    int _3266 = _3250 * as_type<int>(_3086);
    int _3268 = _3266 + _3254;
    int _3270 = abs(_1618);
    float _3272 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3274 = int(_3272);
    float _3276 = float(uint(_3190));
    int _3278 = _3264 * as_type<int>(_3122);
    int _3280 = _3278 + _3258;
    float _3282 = _3180 * _3236;
    int _3284 = abs(_3190);
    float _3286 = _3176 * _3236;
    int _3288 = ~_3270;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = 1.0 / _3276;
    int _3296 = abs(_814);
    float _3298 = _3196 * _3236;
    int _3300 = _3292 * as_type<int>(_3130);
    int _3302 = _3300 + _3280;
    int _3304 = abs(_1402);
    int _3306 = ~_3296;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    float _3312 = float(uint(_3284));
    int _3314 = ~_1316;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = _3302 * _3310;
    float _3322 = 1.0 / _3312;
    float _3324 = float(uint(_3274));
    int _3326 = _3318 * as_type<int>(_3206);
    int _3328 = _3326 + _3268;
    int _3330 = ~_3304;
    int _3332 = _3330 + 1;
    int _3334 = _3332 + 1;
    int _3336 = _1130 * _3296;
    int _3338 = _3336 + _3320;
    float _3340 = -_3298;
    float _3342 = _2876 * _3340;
    int _3344 = as_type<int>(_3294) + (-2);
    float _3346 = -_3282;
    float _3348 = _2908 * _3346;
    int _3350 = _3334 * as_type<int>(_3214);
    int _3352 = _3350 + _3328;
    float _3354 = float(uint(_3338));
    float _3356 = -_3282;
    float _3358 = -_3342;
    float _3360 = fma(_2878, _3356, _3358);
    int _3362 = abs(_3338);
    float _3364 = 1.0 / _3324;
    int _3366 = abs(_1236);
    float _3368 = as_type<float>(_3344) * _3354;
    int _3370 = as_type<int>(_3322) + (-2);
    float _3372 = _2878 * _3286;
    float _3374 = float(uint(_3362));
    float _3376 = _3360 * _3360;
    int _3378 = ~_3366;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    float _3384 = trunc(_3368);
    float _3386 = precise::max(_3384, 0.0);
    uint _3388 = uint(_3386);
    int _3390 = abs(_3274);
    float _3392 = -_3298;
    float _3394 = -_3372;
    float _3396 = fma(_2908, _3392, _3394);
    float _3398 = -_3348;
    float _3400 = fma(_2876, _3286, _3398);
    int _3402 = _3352 * _3382;
    int _3404 = ~_3190;
    int _3406 = _3404 + 1;
    float _3408 = float(uint(_3390));
    float _3410 = sqrt(_3174);
    int _3412 = _1534 * _3366;
    int _3414 = _3412 + _3402;
    int _3416 = as_type<int>(_3364) + (-2);
    int _3418 = ~_3284;
    int _3420 = _3418 + 1;
    float _3422 = float(uint(_3414));
    int _3424 = _3406 * int(_3388);
    int _3426 = _3424 + _3338;
    float _3428 = as_type<float>(_3370) * _3374;
    float _3430 = 1.0 / _3408;
    float _3432 = fma(_3396, _3396, _3376);
    float _3434 = as_type<float>(_3416) * _3422;
    float _3436 = float(uint(_3426));
    float _3438 = fma(_3400, _3400, _3432);
    float _3440 = _3024 * _3410;
    int _3442 = _3414 ^ _3274;
    float _3444 = trunc(_3428);
    float _3446 = precise::max(_3444, 0.0);
    uint _3448 = uint(_3446);
    float _3450 = as_type<float>(_3344) * _3436;
    int _3452 = ~_3274;
    int _3454 = _3452 + 1;
    float _3456 = _2986 * _3440;
    float _3458 = _3244 * _3440;
    float _3460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    uint _3462 = uint(int(uint(_3442) >> uint(31)));
    float _3464 = rsqrt(_3438);
    out.m_72.x = _3456;
    int _3466 = ~int(_3462);
    int _3468 = _3466 + 1;
    int _3470 = _3420 * int(_3448);
    int _3472 = _3470 + _3362;
    float _3474 = trunc(_3434);
    float _3476 = precise::max(_3474, 0.0);
    uint _3478 = uint(_3476);
    float _3480 = float(uint(_3472));
    int _3482 = abs(_3414);
    float _3484 = _3396 * _3464;
    float _3486 = trunc(_3450);
    float _3488 = precise::max(_3486, 0.0);
    uint _3490 = uint(_3488);
    float _3492 = as_type<float>(_3370) * _3480;
    float _3494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    int _3496 = as_type<int>(_3430) + (-2);
    float _3498 = _3360 * _3464;
    float _3500 = float(uint(_3482));
    float _3502 = _3400 * _3464;
    int _3504 = _3454 * int(_3478);
    int _3506 = _3504 + _3414;
    float _3508 = _3456 * _3460;
    float _3510 = trunc(_3492);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    float _3516 = as_type<float>(_3496) * _3500;
    int _3518 = ~_3390;
    int _3520 = _3518 + 1;
    float _3522 = _3458 * _3494;
    float _3524 = float(uint(_3506));
    float _3526 = _2878 * _3484;
    int _3528 = int(_3388) + int(_3490);
    float _3530 = _2908 * _3502;
    float _3532 = trunc(_3516);
    float _3534 = precise::max(_3532, 0.0);
    uint _3536 = uint(_3534);
    int _3538 = ~_3190;
    int _3540 = _3538 + 1;
    float _3542 = -_3526;
    float _3544 = fma(_2876, _3502, _3542);
    float _3546 = as_type<float>(_3416) * _3524;
    float _3548 = -_3530;
    float _3550 = fma(_2878, _3498, _3548);
    int _3552 = _3540 * _3528;
    int _3554 = _3552 + _3338;
    float _3556 = _2876 * _3498;
    int _3558 = int(_3448) + int(_3514);
    float _3560 = trunc(_3546);
    float _3562 = precise::max(_3560, 0.0);
    uint _3564 = uint(_3562);
    int _3566 = ~_3284;
    int _3568 = _3566 + 1;
    float _3570 = -_3556;
    float _3572 = fma(_2908, _3484, _3570);
    int _3574 = _3520 * int(_3536);
    int _3576 = _3574 + _3482;
    float _3578 = -_256;
    int _3580 = _1674 ? as_type<int>(_3578) : as_type<int>(_256);
    int _3582 = _3568 * _3558;
    int _3584 = _3582 + _3362;
    bool _3586 = uint(_3554) >= uint(_3190);
    float _3588 = float(uint(_3576));
    float _3590 = _3544 * _3544;
    bool _3592 = !_3586;
    int _3594 = _3592 ? 0 : (-1);
    bool _3596 = uint(_3584) >= uint(_3284);
    float _3598 = fma(_3550, _3550, _3590);
    float _3600 = as_type<float>(_3496) * _3588;
    int _3602 = ~_3528;
    int _3604 = _3602 + _3594;
    int _3606 = _3604 + 1;
    float _3608 = -_3522;
    float _3610 = _3074 * _3608;
    float _3612 = fma(_3572, _3572, _3598);
    float _3614 = trunc(_3600);
    float _3616 = precise::max(_3614, 0.0);
    uint _3618 = uint(_3616);
    int _3620 = int(_3478) + int(_3564);
    float _3622 = _3048 * _3522;
    int _3624 = ~_3274;
    int _3626 = _3624 + 1;
    float _3628 = _3066 * _3522;
    bool _3630 = !_3596;
    int _3632 = _3630 ? 0 : (-1);
    int _3634 = _3190 * _3606;
    int _3636 = _3634 + _3338;
    bool _3638 = _3190 == 0;
    float _3640 = rsqrt(_3612);
    int _3642 = ~_3390;
    int _3644 = _3642 + 1;
    int _3646 = _3626 * _3620;
    int _3648 = _3646 + _3414;
    bool _3650 = !_3638;
    int _3652 = _3650 ? _3636 : (-1);
    float _3654 = fma(_3068, _3508, _3610);
    float _3656 = fma(_3144, _3508, _3622);
    bool _3658 = uint(_3648) >= uint(_3274);
    float _3660 = fma(_3156, _3508, _3628);
    int _3662 = int(_3536) + int(_3618);
    int _3664 = _3338 ^ _3190;
    bool _3666 = !_3658;
    int _3668 = _3666 ? 0 : (-1);
    int _3670 = _3644 * _3662;
    int _3672 = _3670 + _3482;
    float _3674 = -_256;
    int _3676 = _2826 ? as_type<int>(_3674) : as_type<int>(_256);
    float _3678 = _3550 * _3640;
    float _3680 = _3544 * _3640;
    float _3682 = _3572 * _3640;
    int _3684 = ~_3620;
    int _3686 = _3684 + _3668;
    int _3688 = _3686 + 1;
    float _3690 = _3048 * _3678;
    bool _3692 = uint(_3672) >= uint(_3390);
    float _3694 = _2876 * _3682;
    float _3696 = _2878 * _3680;
    float _3698 = _2908 * _3678;
    bool _3700 = _3190 == 0;
    float _3702 = _3144 * _3678;
    float _3704 = _3144 * _3680;
    float _3706 = _3048 * _3680;
    float _3708 = _3144 * _3682;
    float _3710 = _3048 * _3682;
    float _3712 = _3160 * _3682;
    float _3714 = -_3694;
    float _3716 = fma(_2878, _3678, _3714);
    float _3718 = -_3696;
    float _3720 = fma(_2908, _3682, _3718);
    float _3722 = _3656 * _3682;
    float _3724 = -_3698;
    float _3726 = fma(_2876, _3680, _3724);
    bool _3728 = !_1610;
    float _3730 = _3728 ? _256 : as_type<float>(_3676);
    int _3732 = _3274 * _3688;
    int _3734 = _3732 + _3414;
    bool _3736 = !_3692;
    int _3738 = _3736 ? 0 : (-1);
    float _3740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3742 = _3274 == 0;
    float _3744 = _3160 * _3678;
    bool _3746 = _3274 == 0;
    float _3748 = _3716 * _3716;
    float _3750 = _3656 * _3678;
    float _3752 = _3656 * _3680;
    int _3754 = ~_3632;
    int _3756 = _3558 + _3754;
    int _3758 = _3756 + 1;
    float _3760 = fma(_3720, _3720, _3748);
    uint _3762 = uint(int(uint(_3664) >> uint(31)));
    float _3764 = _3160 * _3680;
    int _3766 = ~_3738;
    int _3768 = _3662 + _3766;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3726, _3726, _3760);
    float _3774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3776 = ~int(_3762);
    int _3778 = _3776 + 1;
    float _3780 = -_145;
    float _3782 = fma(_3780, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1628);
    float _3784 = float(_3652);
    float _3786 = _3740 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3788 = _3758 ^ _3778;
    int _3790 = _3770 ^ _3468;
    float _3792 = rsqrt(_3772);
    float _3794 = fma(_3786, _3784, _3782);
    float _3796 = _3730 + 0.5;
    int _3798 = ~_3778;
    int _3800 = _3798 + _3788;
    int _3802 = _3800 + 1;
    bool _3804 = !_3742;
    int _3806 = _3804 ? _3734 : (-1);
    float _3808 = fma(_3786, _3796, _3794);
    int _3810 = ~_3468;
    int _3812 = _3810 + _3790;
    int _3814 = _3812 + 1;
    float _3816 = _3774 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3818 = float(_3806);
    float _3820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3822 = !_1624;
    float _3824 = _3822 ? _256 : as_type<float>(_3580);
    bool _3826 = !_3746;
    int _3828 = _3826 ? _3814 : (-1);
    float _3830 = fma(_3816, _3818, _2208);
    float _3832 = _3726 * _3792;
    float _3834 = _3720 * _3792;
    float _3836 = _3824 + 0.5;
    float _3838 = _3716 * _3792;
    float _3840 = fma(_3654, _3832, _3722);
    float _3842 = fma(_3654, _3834, _3750);
    float _3844 = fma(_3816, _3836, _3830);
    bool _3846 = !_3700;
    int _3848 = _3846 ? _3802 : (-1);
    float _3850 = fma(_2878, _3660, _3840);
    float _3852 = fma(_2876, _3660, _3842);
    float _3854 = -_3074;
    float _3856 = fma(_3854, _3834, _3690);
    float _3858 = fma(_3068, _3834, _3702);
    float _3860 = _2788 + _3850;
    float _3862 = -_3074;
    float _3864 = fma(_3862, _3838, _3706);
    float _3866 = float(_3848);
    float _3868 = fma(_3068, _3838, _3704);
    float _3870 = -_3074;
    float _3872 = fma(_3870, _3832, _3710);
    float _3874 = fma(_3070, _3838, _3764);
    float _3876 = fma(_3070, _3832, _3712);
    float _3878 = _3820 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3880 = fma(_3654, _3838, _3752);
    float _3882 = _2790 + _3852;
    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3886 = _3860 + _3884;
    float _3888 = fma(_3066, _2876, _3856);
    float _3890 = fma(_3066, _2908, _3864);
    float _3892 = -_1620;
    float _3894 = fma(_3878, _3866, _3892);
    float _3896 = fma(_3066, _2878, _3872);
    float _3898 = fma(_3068, _3832, _3708);
    float _3900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3902 = _3882 + _3900;
    float _3904 = _3886 * _3886;
    float _3906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3908 = fma(_3070, _3834, _3744);
    float _3910 = fma(_2908, _3660, _3880);
    float _3912 = fma(_3902, _3902, _3904);
    float _3914 = -_272;
    int _3916 = _3078 ? as_type<int>(_3914) : as_type<int>(_272);
    float _3918 = fma(_3156, _2876, _3858);
    float _3920 = float(_3828);
    float _3922 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2050);
    float _3924 = sqrt(_3912);
    bool _3926 = !_1590;
    float _3928 = _3926 ? _272 : as_type<float>(_3916);
    float _3930 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3932 = fma(_3146, _2876, _3908);
    float _3934 = fma(_3156, _2908, _3868);
    float _3936 = fma(_3156, _2878, _3898);
    float _3938 = _3928 + (-0.5);
    float _3940 = _3930 * _3890;
    float _3942 = _3906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3944 = _3930 * _3896;
    float _3946 = -_3878;
    float _3948 = fma(_3946, _3938, _3894);
    float _3950 = fma(_3930, _3930, 1.0);
    float _3952 = -_3922;
    float _3954 = fma(_3942, _3920, _3952);
    float _3956 = _836 + (-0.5);
    float _3958 = _2768 + _3910;
    float _3960 = fma(_3146, _2908, _3874);
    bool _3962 = _3924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3964 = -_3942;
    float _3966 = fma(_3964, _3956, _3954);
    float _3968 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3970 = rsqrt(_3950);
    float _3972 = _3930 * _3888;
    out.m_74.x = _3918;
    out.m_74.y = _3934;
    out.m_74.z = _3936;
    float _3974 = fma(_3968, _3934, _3940);
    float _3976 = fma(_3968, _3936, _3944);
    float _3978 = fma(_3968, _3918, _3972);
    float _3980 = fma(_3146, _2878, _3876);
    float _3982 = _3968;
    float _3984 = _3940;
    float _3986 = _3942;
    if (!_3962)
    {
        _3982 = _3882;
    }
    float _3988 = _3982;
    float _3990 = _3988;
    if (!_3962)
    {
        _3984 = _3860;
    }
    float _3992 = _3984;
    float _3994 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2062);
    float _3996 = _3992;
    if (!_3962)
    {
        _3986 = _3958;
    }
    float _3998 = _3986;
    bool _4000 = !_3962;
    float _4002 = _3998;
    if (!_4000)
    {
        float _4004 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4008 = _3924 + _4006;
        float _4010 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4012 = rsqrt(_3912);
        float _4014 = _4008 * _4004;
        float _4016 = _4014 * 0.15915493667125701904296875;
        float _4018 = _4016 * 6.283185482025146484375;
        float _4020 = cos(_4018);
        float _4022 = _4016 * 6.283185482025146484375;
        float _4024 = sin(_4022);
        float _4026 = _4020 + (-1.0);
        float _4028 = fma(_4024, _4010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4030 = _4026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4032 = _4012 * _4028;
        float _4034 = fma(_3958, _4020, _4030);
        float _4036 = fma(_3902, _4032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4038 = fma(_3886, _4032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4002 = _4034;
        _3990 = _4036;
        _3996 = _4038;
    }
    float _4040 = _4002;
    float _4042 = _3990;
    float _4044 = _3996;
    float _4046 = -_2768;
    float _4048 = _4046 + _4040;
    float _4050 = -_3142;
    float _4052 = fma(_3730, _4050, _3808);
    float _4054 = -_2790;
    float _4056 = _4054 + _4042;
    float _4058 = -_2788;
    float _4060 = _4058 + _4044;
    float _4062 = _4048 * _4048;
    float _4064 = -_3994;
    float _4066 = _4064 + 1.0;
    float _4068 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2028);
    float _4070 = _3930 * _3970;
    float _4072 = fma(_4056, _4056, _4062);
    float _4074 = -_4066;
    float _4076 = fma(_3824, _4074, _3844);
    float _4078 = -_4068;
    float _4080 = _4078 + 1.0;
    float _4082 = -_3932;
    float _4084 = _4070 * _4082;
    float _4086 = fma(_4060, _4060, _4072);
    float _4088 = -_3960;
    float _4090 = _4070 * _4088;
    float _4092 = -_3980;
    float _4094 = _4070 * _4092;
    float _4096 = fma(_836, _4080, _3966);
    float _4098 = sqrt(_4086);
    float _4100 = fma(_3970, _3888, _4084);
    float _4102 = fma(_3970, _3890, _4090);
    float _4104 = fma(_3970, _3896, _4094);
    float _4106 = _3932 + _3978;
    float _4108 = _3960 + _3974;
    float _4110 = _3980 + _3976;
    float _4112 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2856);
    out.m_76.x = _4100;
    out.m_76.y = _4102;
    out.m_76.z = _4104;
    float _4114 = -_2122;
    float _4116 = _1372 + _4114;
    float _4118 = _3032 + 1.0;
    float _4120 = -_4112;
    float _4122 = _4120 + 1.0;
    out.m_78.x = _4106;
    out.m_78.y = _4108;
    out.m_78.z = _4110;
    float _4124 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2194);
    float _4126 = -_3152;
    float _4128 = _4126 + _4044;
    float _4130 = fma(_3928, _4122, _3948);
    bool _4132 = _4098 > 0.0;
    float _4134 = _2362 * _4118;
    float _4136 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2198);
    out.m_80.x = _4052;
    out.m_80.y = _4130;
    out.m_80.z = _4076;
    out.m_80.w = _4096;
    float _4138 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2196);
    float _4140 = fma(_3132, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4124);
    float _4142 = fma(_4134, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4136);
    float _4144 = -_3100;
    float _4146 = _4144 + _4042;
    float _4148 = -_3100;
    float _4150 = _2790 + _4148;
    float _4152 = -_3152;
    float _4154 = _2788 + _4152;
    float _4156 = _4124;
    float _4158 = _4116;
    float _4160 = _4104;
    float _4162 = _4102;
    float _4164 = _4100;
    float _4166 = _4130;
    float _4168 = _4052;
    float _4170 = _4146;
    float _4172 = _4100;
    if (!_4132)
    {
        _4156 = _4128;
    }
    float _4174 = _4156;
    float _4176 = -_3098;
    float _4178 = _4176 + _4040;
    float _4180 = -_3098;
    float _4182 = _2768 + _4180;
    float _4184 = _4174;
    float _4186 = _4174;
    float _4188 = _4174;
    if (!_4132)
    {
        _4158 = _4178;
    }
    float _4190 = _4158;
    bool _4192 = !_4132;
    float _4194 = _4190;
    float _4196 = _4190;
    if (!_4192)
    {
        bool _4198 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4200 = _4134;
        if (_4198)
        {
            float _4202 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4200 = _4202;
        }
        float _4204 = _4200;
        if (_4198)
        {
            _4160 = _4140;
        }
        float _4206 = _4160;
        float _4208 = _4206;
        if (_4198)
        {
            _4162 = _4138;
        }
        float _4210 = _4162;
        float _4212 = _4210;
        if (_4198)
        {
            _4164 = _4142;
        }
        float _4214 = _4164;
        float _4216 = _4204;
        float _4218 = _4214;
        if (_4198)
        {
            float _4220 = _4140 * _4204;
            _4166 = _4220;
        }
        float _4222 = _4166;
        float _4224 = _4222;
        if (_4198)
        {
            float _4226 = _4138 * _4204;
            _4168 = _4226;
        }
        float _4228 = _4168;
        float _4230 = _4228;
        if (_4198)
        {
            float _4232 = _4142 * _4204;
            _4216 = _4232;
        }
        float _4234 = _4216;
        float _4236 = _4234;
        if (!_4198)
        {
            bool _4238 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4240 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4242 = _4238 || _4240;
            bool _4244 = isnan(1.0);
            bool _4246 = _4242 || _4244;
            float _4248 = _145 + 1.0;
            float _4250 = _4248;
            if (!_4246)
            {
                float _4252 = _4248 * _4248;
                float _4254 = _4252 * 0.5;
                _4184 = _4254;
            }
            float _4256 = _4184;
            float _4258 = _4256;
            if (!_4246)
            {
                float _4260 = _4256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4258 = _4260;
            }
            float _4262 = _4258;
            bool _4264 = !_4246;
            float _4266 = _4262;
            if (!_4264)
            {
                float _4268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4270 = log2(_4268);
                float _4272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4274 = _4272 + 1.0;
                float _4276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4278 = _4270 * _4248;
                float _4280 = exp2(_4278);
                float _4282 = _4276 * 0.693147182464599609375;
                float _4284 = 1.0 / _4282;
                float _4286 = 1.0 / _4274;
                float _4288 = _4280 + (-1.0);
                float _4290 = -_4288;
                float _4292 = fma(_4290, _4284, _4248);
                float _4294 = _4292 * _4286;
                float _4296 = _4294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4266 = _4296;
            }
            float _4298 = _4266;
            float _4300 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4302 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4304 = !_4246;
            _4194 = _4302;
            if (!_4304)
            {
                float _4306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4308 = log2(_4306);
                float _4310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4312 = _4310 + 1.0;
                float _4314 = 1.0 / _4312;
                float _4316 = _4308 * _4248;
                float _4318 = exp2(_4316);
                float _4320 = -_4318;
                float _4322 = _4320 + 1.0;
                float _4324 = _4322 * _4314;
                _4250 = _4324;
            }
            float _4326 = _4250;
            float _4328 = fma(_4326, _1326, _4302);
            float _4330 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4332 = fma(_4326, _1324, _4300);
            float _4334 = -_2120;
            float _4336 = _4334 + _4328;
            float _4338 = fma(_4326, _1328, _4330);
            float _4340 = -_2118;
            float _4342 = _4340 + _4332;
            float _4344 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4346 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4348 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4350 = -_2122;
            float _4352 = _4350 + _4338;
            float _4354 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4344);
            float _4356 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4346);
            float _4358 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4348);
            float _4360 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4354);
            float _4362 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4356);
            float _4364 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4358);
            _4212 = _4362;
            _4208 = _4360;
            _4218 = _4364;
            _4224 = _4360;
            _4230 = _4362;
            _4236 = _4364;
            _4186 = _4330;
            _1374 = _4356;
        }
        float _4366 = _4212;
        float _4368 = _4208;
        float _4370 = _4218;
        float _4372 = _4224;
        float _4374 = _4230;
        float _4376 = _4236;
        float _4378 = _4194;
        float _4380 = _4186;
        float _4382 = _1374;
        float _4384 = _4366 * _4366;
        float _4386 = fma(_4368, _4368, _4384);
        float _4388 = fma(_4370, _4370, _4386);
        float _4390 = rsqrt(_4086);
        float _4392 = sqrt(_4388);
        float _4394 = _4056 * _4390;
        float _4396 = _4048 * _4390;
        float _4398 = _4060 * _4390;
        bool _4400 = _4392 > 0.0;
        float _4402 = _4378;
        float _4404 = _4380;
        _1376 = _4382;
        _4172 = _4370;
        if (!_4400)
        {
            _4402 = _4178;
        }
        float _4406 = _4402;
        _4196 = _4406;
        if (!_4400)
        {
            _4404 = _4128;
        }
        float _4408 = _4404;
        bool _4410 = !_4400;
        _4188 = _4408;
        if (!_4410)
        {
            float _4412 = rsqrt(_4388);
            float _4414 = _4412 * _4366;
            float _4416 = _4412 * _4368;
            float _4418 = _4412 * _4370;
            float _4420 = _4396 * _4414;
            float _4422 = fma(_4394, _4416, _4420);
            float _4424 = fma(_4398, _4418, _4422);
            float _4426 = _4424 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4428 = fma(_4372, _4426, _4146);
            float _4430 = fma(_4374, _4426, _4178);
            float _4432 = fma(_4376, _4426, _4128);
            _4170 = _4428;
            _4196 = _4430;
            _4188 = _4432;
            _1376 = _4414;
        }
    }
    float _4434 = _4170;
    float _4436 = _4196;
    float _4438 = _4188;
    float _4440 = _1376;
    float _4442 = _4172;
    float _4444 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4446 = fma(_4150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4444);
    float _4448 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4450 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4452 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4454 = _4450 || _4452;
    bool _4456 = isnan(0.5);
    bool _4458 = _4454 || _4456;
    float _4460 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4446);
    float _4462 = fma(_4150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4448);
    float _4464 = _4460 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4466 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4462);
    bool _4468 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4470 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4472 = _4468 || _4470;
    bool _4474 = isnan(0.5);
    bool _4476 = _4472 || _4474;
    float _4478 = 1.0 / _4464;
    float _4480 = _4466 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4482 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4484 = _4480;
    float _4486 = _4440;
    float _4488 = _4434;
    float _4490 = _4460;
    if (_4458)
    {
        _4482 = _4434;
    }
    float _4492 = _4482;
    float _4494 = _4480 + _4464;
    float _4496 = _4492;
    if (_4458)
    {
        _4484 = _4436;
    }
    float _4498 = _4484;
    float _4500 = _4498;
    if (_4458)
    {
        _4486 = _4438;
    }
    float _4502 = _4486;
    float _4504 = _4502;
    if (!_4458)
    {
        float _4506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4508 = _4182 + _4506;
        float _4510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4512 = _4150 + _4510;
        float _4514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4516 = -_4150;
        float _4518 = _4516 + _4434;
        float _4520 = _4508 * _4508;
        float _4522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4524 = _4154 + _4522;
        float _4526 = -_4182;
        float _4528 = _4526 + _4436;
        float _4530 = -_4154;
        float _4532 = _4530 + _4438;
        float _4534 = fma(_4512, _4512, _4520);
        float _4536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4538 = fma(_4524, _4524, _4534);
        float _4540 = sqrt(_4538);
        float _4542 = _4514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4544 = precise::min(_4540, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4546 = _4544 * _4536;
        float _4548 = _4542 * _4546;
        float _4550 = fma(_4518, _4548, _4150);
        float _4552 = fma(_4528, _4548, _4182);
        float _4554 = fma(_4532, _4548, _4154);
        _4500 = _4552;
        _4496 = _4550;
        _4504 = _4554;
        _4488 = _4518;
        _4490 = _4548;
    }
    float _4556 = _4500;
    float _4558 = _4496;
    float _4560 = _4504;
    float _4562 = _4488;
    float _4564 = _4490;
    float _4566 = _4564;
    float _4568 = _4562;
    if (_4476)
    {
        _4566 = 1.0;
    }
    float _4570 = _4566;
    float _4572 = _4494 * _4478;
    float _4574 = _4572 * 0.5;
    float _4576 = _4570;
    float _4578 = _4574;
    if (!_4476)
    {
        float _4580 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4584 = fma(_4574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4582);
        float _4586 = _4580 * 0.15915493667125701904296875;
        float _4588 = _4586 * 6.283185482025146484375;
        float _4590 = cos(_4588);
        float _4592 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4594 = _4592 * 0.15915493667125701904296875;
        float _4596 = _4586 * 6.283185482025146484375;
        float _4598 = sin(_4596);
        float _4600 = 1.0 / _4590;
        float _4602 = _4594 * 6.283185482025146484375;
        float _4604 = cos(_4602);
        float _4606 = _4598 * _4600;
        float _4608 = 1.0 / _4584;
        float _4610 = _4604 * _4606;
        float _4612 = _4594 * 6.283185482025146484375;
        float _4614 = sin(_4612);
        float _4616 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4618 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4616;
        float _4620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4622 = _4608 * _4620;
        float _4624 = 1.0 / _4610;
        float _4626 = 1.0 / _4618;
        float _4628 = _4614 * _4624;
        float _4630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4632 = fma(_4628, _4622, _4630);
        float _4634 = _4632 * _4626;
        float _4636 = precise::clamp(_4634, 0.0, 1.0);
        _4568 = _4594;
        _4576 = _4636;
    }
    float _4638 = _4568;
    float _4640 = _4576;
    float _4642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4644 = _4556 + _4642;
    float _4646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4648 = _4558 + _4646;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4652 = _4560 + _4650;
    float _4654 = _4644 * _4644;
    float _4656 = fma(_4648, _4648, _4654);
    float _4658 = fma(_4652, _4652, _4656);
    float _4660 = rsqrt(_4658);
    float _4662 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4664 = _4648 * _4662;
    float _4666 = _4652 * _4662;
    float _4668 = _4664 * _4664;
    float _4670 = _4666 * _4666;
    float _4672 = _4668 + _4670;
    float _4674 = sqrt(_4672);
    bool _4676 = _4674 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4678 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4680 = _4674 + _4678;
    float _4682 = _4442;
    float _4684 = _4672;
    float _4686 = _4680;
    float _4688 = _4644;
    float _4690 = _4662;
    float _4692 = _4664;
    if (_4676)
    {
        float _4694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4682 = _4694;
    }
    float _4696 = _4682;
    if (_4676)
    {
        float _4698 = rsqrt(_4672);
        _4684 = _4698;
    }
    float _4700 = _4684;
    float _4702 = _4696;
    float _4704 = _4700;
    if (_4676)
    {
        float _4706 = _4680 * _4696;
        _4686 = _4706;
    }
    float _4708 = _4686;
    if (_4676)
    {
        float _4710 = _4708 * 0.15915493667125701904296875;
        _4578 = _4710;
    }
    float _4712 = _4578;
    float _4714 = _4652;
    if (_4676)
    {
        float _4716 = _4712 * 6.283185482025146484375;
        float _4718 = sin(_4716);
        _4714 = _4718;
    }
    float _4720 = _4714;
    float _4722 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4724 = precise::max(0.0, _4722);
    float _4726 = _4638;
    float _4728 = _4724;
    if (_4676)
    {
        float _4730 = _4712 * 6.283185482025146484375;
        float _4732 = cos(_4730);
        _4726 = _4732;
    }
    float _4734 = _4726;
    float _4736 = -_4662;
    float _4738 = -_4724;
    float _4740 = fma(_4644, _4736, _4738);
    if (_4676)
    {
        float _4742 = _4740 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4688 = _4742;
    }
    float _4744 = _4688;
    float _4746 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4748 = _4720;
    float _4750 = _4744;
    if (_4676)
    {
        float _4752 = fma(_4720, _4744, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4748 = _4752;
    }
    float _4754 = _4748;
    float _4756 = _4754;
    if (!_4676)
    {
        _4750 = _4666;
    }
    float _4758 = _4750;
    float _4760 = _4758;
    float _4762 = _4734;
    if (_4676)
    {
        float _4764 = _4734 + (-1.0);
        _4728 = _4764;
    }
    float _4766 = _4728;
    if (_4676)
    {
        float _4768 = _4700 * _4754;
        _4690 = _4768;
    }
    float _4770 = _4690;
    if (!_4676)
    {
        _4756 = _4740;
    }
    float _4772 = _4756;
    float _4774 = _4772;
    if (_4676)
    {
        float _4776 = _4766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4702 = _4776;
    }
    float _4778 = _4702;
    if (_4676)
    {
        float _4780 = _4664 * _4770;
        _4692 = _4780;
    }
    float _4782 = _4692;
    if (!_4676)
    {
        _4704 = _4668;
    }
    float _4784 = _4704;
    float _4786 = _4784;
    if (_4676)
    {
        float _4788 = _4666 * _4770;
        _4760 = _4788;
    }
    float _4790 = _4760;
    if (_4676)
    {
        float _4792 = fma(_4740, _4734, _4778);
        _4774 = _4792;
    }
    float _4794 = _4774;
    if (_4676)
    {
        float _4796 = _4782 * _4782;
        _4786 = _4796;
    }
    float _4798 = _4786;
    float _4800 = sqrt(_4658);
    if (!_4676)
    {
        _4762 = _4670;
    }
    float _4802 = _4762;
    float _4804 = _4802;
    if (_4676)
    {
        float _4806 = _4790 * _4790;
        _4804 = _4806;
    }
    float _4808 = _4804;
    float _4810 = fma(_4794, _4794, _4798);
    float _4812 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4814 = _4810 + _4808;
    float _4816 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4746);
    float _4818 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4820 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4812);
    float _4822 = rsqrt(_4814);
    float _4824 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4816);
    float _4826 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4828 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4818);
    float _4830 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4834 = fma(_4800, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4832);
    float _4836 = precise::clamp(_4834, 0.0, 1.0);
    float _4838 = _4824 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4840 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4826);
    float _4842 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4828);
    float _4844 = -_4836;
    float _4846 = _4844 + 1.0;
    float _4848 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4850 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4840);
    float _4852 = _4842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4854 = abs(_4846);
    float _4856 = log2(_4854);
    float _4858 = -_4848;
    float _4860 = fma(_4858, _4830, 1.0);
    float _4862 = _4850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4864 = _4822 * _4782;
    float _4866 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4868 = _4822 * _4794;
    float _4870 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4820);
    float _4872 = _4864 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4874 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4866);
    float _4876 = _4822 * _4790;
    float _4878 = _4870 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4880 = -_4872;
    float _4882 = fma(_4868, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4880);
    float _4884 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4874);
    float _4886 = log2(_4860);
    float _4888 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4890 = -_4876;
    float _4892 = fma(_4890, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4882);
    float _4894 = _4856 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4896 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4884);
    float _4898 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4900 = fma(_4892, -0.5, 0.5);
    float _4902 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4888);
    float _4904 = exp2(_4894);
    float _4906 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4898);
    float _4908 = fma(_4892, 0.5, 0.5);
    float _4910 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4902);
    float _4912 = _4868 + 1.0;
    float _4914 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4906);
    float _4916 = fma(_4908, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4918 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4910);
    float _4920 = 1.0 / _4896;
    float _4922 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4914);
    float _4924 = fma(_4908, _4916, -0.212114393711090087890625);
    float _4926 = _4886 * 0.693147182464599609375;
    float _4928 = fma(_4908, _4924, 1.570728778839111328125);
    float _4930 = sqrt(_4900);
    float _4932 = -_4868;
    float _4934 = fma(_4904, _4912, _4932);
    float _4936 = _4926 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4938 = fma(_4934, 0.5, 0.5);
    float _4940 = _4922 * _4920;
    float _4942 = _4918 * _4920;
    float _4944 = fma(_4940, 0.5, 0.5);
    float _4946 = fma(_4942, -0.5, 0.5);
    float _4948 = _4930 * 0.636619746685028076171875;
    float3 _12632 = float3(_4944, _4946, _4936);
    float _4950 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12632, float3(0.0), isnan(_12632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12632, float3(0.0), isnan(_12632)), level(0.0)).x;
    float3 _12643 = float3(_4944, _4946, _4936);
    float4 _4953 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12643, float3(0.0), isnan(_12643)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12643, float3(0.0), isnan(_12643)), level(0.0)).xyzw;
    float _4955 = _4953.x;
    float _4957 = _4953.y;
    float _4959 = _4953.z;
    float _4961 = _4953.w;
    float _4963 = -_4928;
    float _4965 = fma(_4948, _4963, 1.0);
    float2 _12665 = float2(_4965, _4938);
    float3 _4969 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12665, float2(0.0), isnan(_12665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12665, float2(0.0), isnan(_12665)), level(0.0)).xyz;
    float _4971 = _4969.x;
    float _4973 = _4969.y;
    float _4975 = _4969.z;
    float _4977 = _4856 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4979 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4981 = _4896 * 0.5;
    out.m_82.x = _4150;
    out.m_82.y = _4182;
    out.m_82.z = _4154;
    bool _4983 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4985 = isnan(_4800);
    bool _4987 = _4983 || _4985;
    bool _4989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4991 = _4987 || _4989;
    float _4993 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4979);
    float _4995 = exp2(_4977);
    out.m_84.x = _4558;
    out.m_84.y = _4556;
    out.m_84.z = _4560;
    float _4997 = _4922 + _4896;
    float _4999 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4993);
    float _5001 = fma(_4918, -0.5, _4981);
    float _5003 = _4997 * 0.5;
    float _5005 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4999);
    float _5007 = _5005 + _4896;
    out.gl_Position.x = _4922;
    out.gl_Position.y = _4918;
    out.gl_Position.z = _5005;
    out.gl_Position.w = _4896;
    float _5009 = _5007 * 0.5;
    float _5011 = -_4995;
    float _5013 = _5011 + 1.0;
    float _5015 = _5013 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _5003;
    out.m_86.y = _5001;
    out.m_86.z = _5009;
    out.m_86.w = _4896;
    float _5017 = -_5015;
    float _5019 = _5017 + 1.0;
    float _5021 = _4640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5023 = _5009;
    float _5025 = _5001;
    float _5027 = _5003;
    if (!_4991)
    {
        _5023 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5029 = _5023;
    float _5031 = _5029;
    float _5033 = _5029;
    if (!_4991)
    {
        _5025 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5035 = _5025;
    float _5037 = _5035;
    float _5039 = _5035;
    if (!_4991)
    {
        _5027 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5041 = _5027;
    float _5043 = _5015 * _4950;
    float _5045 = _4961 * _5043;
    float _5047 = _4961 * _5019;
    float _5049 = _4975 * _5043;
    float _5051 = fma(_4971, _5045, _4955);
    float _5053 = fma(_4973, _5045, _4957);
    float _5055 = fma(_4961, _5049, _4959);
    out.m_88.x = _5051;
    out.m_88.y = _5053;
    out.m_88.z = _5055;
    out.m_88.w = _5047;
    bool _5057 = !_4991;
    float _5059 = _5041;
    float _5061 = _5041;
    if (!_5057)
    {
        bool _5063 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5065 = isnan(_4800);
        bool _5067 = _5063 || _5065;
        bool _5069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5071 = _5067 || _5069;
        if (!_5071)
        {
            float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5075 = _4800 + _5073;
            float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5079 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5077;
            float _5081 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5089 = 1.0 / _5079;
            float _5091 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5093 = _5091 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5095 = _5075 * _5089;
            float _5097 = precise::clamp(_5095, 0.0, 1.0);
            float _5099 = fma(_5097, _5083, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5101 = fma(_5097, _5087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5103 = fma(_5097, _5093, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5039 = _5101;
            _5033 = _5099;
            _5061 = _5103;
            _5105 = true;
        }
        else
        {
            bool _5107 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5109 = isnan(_4800);
            bool _5111 = _5107 || _5109;
            bool _5113 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5115 = _5111 || _5113;
            if (!_5115)
            {
                _5031 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5117 = _5031;
            _5033 = _5117;
            if (!_5115)
            {
                _5037 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5119 = _5037;
            _5039 = _5119;
            if (!_5115)
            {
                _5059 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5121 = _5059;
            bool _5123 = !_5115;
            _5061 = _5121;
            if (!_5123)
            {
                bool _5125 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5127 = isnan(_4800);
                bool _5129 = _5125 || _5127;
                bool _5131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5133 = _5129 || _5131;
                if (!_5133)
                {
                    float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5137 = _4800 + _5135;
                    float _5139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5141 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5139;
                    float _5143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5145 = _5143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5147 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5151 = 1.0 / _5141;
                    float _5153 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5155 = _5153 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5157 = _5137 * _5151;
                    float _5159 = precise::clamp(_5157, 0.0, 1.0);
                    float _5161 = fma(_5159, _5145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5163 = fma(_5159, _5149, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5165 = fma(_5159, _5155, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5039 = _5163;
                    _5033 = _5161;
                    _5061 = _5165;
                    _5105 = true;
                }
                else
                {
                    _5039 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5033 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5061 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5105 = false;
    float _5167 = _5039;
    float _5169 = _5033;
    float _5171 = _5061;
    float _5173 = _5021 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5175 = _5167 * 0.586610972881317138671875;
    bool _5177 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5173;
    float _5179 = fma(_5169, 0.298911988735198974609375, _5175);
    bool _5181 = _4640 > 0.0;
    bool _5183 = isnan(_4640);
    bool _5185 = _5181 || _5183;
    bool _5187 = isnan(0.0);
    bool _5189 = _5185 || _5187;
    float _5191 = fma(_5171, 0.114477999508380889892578125, _5179);
    float _5193 = -_5191;
    float _5195 = _5193 + _5169;
    float _5197 = -_5191;
    float _5199 = _5197 + _5167;
    float _5201 = -_5191;
    float _5203 = _5201 + _5171;
    float _5205 = fma(_5195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    float _5207 = fma(_5199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    float _5209 = fma(_5203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    bool _5211 = !_5177;
    if (!_5211)
    {
        float _5213 = -_4556;
        float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5217 = -_4558;
        float _5219 = _5217 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5221 = -_4560;
        float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5225 = _5215 * _5215;
        float _5227 = fma(_5219, _5219, _5225);
        float _5229 = fma(_5223, _5223, _5227);
        float _5231 = sqrt(_5229);
        float _5233 = rsqrt(_5229);
        float _5235 = -_5231;
        float _5237 = _5235 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5239 = _5237 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5241 = precise::clamp(_5239, 0.0, 1.0);
        float _5243 = _5219 * _5233;
        float _5245 = _5215 * _5233;
        float _5247 = abs(_5241);
        float _5249 = log2(_5247);
        float _5251 = _5223 * _5233;
        float _5253 = _5243 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5255 = _4108 * _5245;
        float _5257 = -_5245;
        float _5259 = -_5253;
        float _5261 = fma(_5257, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5259);
        float _5263 = fma(_4106, _5243, _5255);
        float _5265 = -_5251;
        float _5267 = fma(_5265, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5261);
        float _5269 = fma(_4110, _5251, _5263);
        float _5271 = precise::clamp(_5269, 0.0, 1.0);
        float _5273 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5275 = _5267 + _5273;
        float _5277 = _5249 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5279 = _5275 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5281 = precise::clamp(_5279, 0.0, 1.0);
        float _5283 = exp2(_5277);
        float _5285 = _5283 * _5281;
        float _5287 = _5271 * _5285;
        float _5289 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5291 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5293 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5289;
        out.m_90.y = _5291;
        out.m_90.z = _5293;
    }
    out.m_70.x = _5205;
    out.m_70.y = _5207;
    out.m_70.z = _5209;
    if (_5189)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5295 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5295;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5105 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5352 = as_type<float>(_125);
        out.gl_Position.z = _5352;
    }
    if (!_113)
    {
        return out;
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5425 = as_type<float>(_163);
        out.gl_Position.z = _5425;
    }
    if (_155)
    {
        return out;
    }
    float _165 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _167 = int(_165);
    float _169 = in.m_51.y;
    float _171 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_51.z;
    float _175 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _177 = int(_175);
    float _179 = float(_167);
    float _181 = 1.0 / _179;
    float _183 = float(uint(_177));
    int _185 = ~_177;
    int _187 = _185 + 1;
    int _189 = ~_177;
    int _191 = _189 + 1;
    float _193 = 1.0 / _183;
    float _195 = _145 * _181;
    float _197 = as_type<float>(int(gl_VertexIndex));
    float _199 = trunc(_195);
    int _201 = int(_199);
    int _203 = as_type<int>(_193) + (-2);
    float _205 = float(uint(_201));
    float _207 = as_type<float>(_203) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _214 = uint(_211);
    int _216 = _187 * int(_214);
    int _218 = _216 + _201;
    float _220 = float(uint(_218));
    float _222 = as_type<float>(_203) * _220;
    bool _224 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.0);
    bool _232 = _228 || _230;
    float _234 = trunc(_222);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    int _240 = as_type<int>(_197) & 1;
    bool _242 = _240 != 0;
    int _244 = as_type<int>(_197) & 2;
    bool _246 = _244 != 0;
    bool _248 = _173 > 0.5;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _252 = _250 != 0;
    bool _254 = !_242;
    float _256 = _254 ? (-0.5) : 0.5;
    int _258 = int(_214) + int(_238);
    float _260 = as_type<float>(_214);
    float _262 = _171;
    if (!_232)
    {
        float _264 = _171 * _171;
        float _266 = _264 * 0.5;
        _260 = _266;
    }
    float _268 = _260;
    bool _270 = !_246;
    float _272 = _270 ? (-0.5) : 0.5;
    float _274 = _268;
    if (!_232)
    {
        float _276 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _276;
    }
    float _278 = _274;
    bool _280 = !_232;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _171 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _171);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_232;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _171 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _262 = _336;
    }
    float _338 = _262;
    float _340 = 0.0;
    if (!_232)
    {
        float _342 = _145 * _145;
        float _344 = _342 * 0.5;
        _340 = _344;
    }
    float _346 = _340;
    float _348 = 0.0;
    float _350 = _346;
    if (!_232)
    {
        _348 = _145;
    }
    float _352 = _348;
    int _354 = _191 * _258;
    int _356 = _354 + _201;
    bool _358 = !_252;
    int _360 = _358 ? 0 : 1;
    float _362 = _352;
    if (!_232)
    {
        float _364 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _350 = _364;
    }
    float _366 = _350;
    bool _368 = !_232;
    float _370 = _366;
    if (!_368)
    {
        float _372 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _374 = log2(_372);
        float _376 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _378 = _376 + 1.0;
        float _380 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _382 = _145 * _374;
        float _384 = 1.0 / _378;
        float _386 = _380 * 0.693147182464599609375;
        float _388 = exp2(_382);
        float _390 = 1.0 / _386;
        float _392 = _388 + (-1.0);
        float _394 = -_392;
        float _396 = fma(_394, _390, _145);
        float _398 = _396 * _384;
        float _400 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _370 = _400;
    }
    float _402 = _370;
    bool _404 = !_232;
    if (!_404)
    {
        float _406 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = log2(_406);
        float _410 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _412 = _410 + 1.0;
        float _414 = 1.0 / _412;
        float _416 = _145 * _408;
        float _418 = exp2(_416);
        float _420 = -_418;
        float _422 = _420 + 1.0;
        float _424 = _422 * _414;
        _362 = _424;
    }
    float _426 = _362;
    bool _428 = _169 > 0.5;
    float _430 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _432 = int(_430);
    float _434 = -_272;
    int _436 = _248 ? as_type<int>(_434) : as_type<int>(_272);
    float _438 = in.m_51.w;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _450 = _448 != 0;
    float _452 = _131 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _454 = -_256;
    int _456 = _428 ? as_type<int>(_454) : as_type<int>(_256);
    float _458 = _173 * 2.0;
    bool _460 = uint(_356) >= uint(_177);
    float _462 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _464 = log2(_462);
    float _466 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    bool _468 = !_446;
    float _470 = _468 ? _256 : as_type<float>(_456);
    float _472 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _474 = !_450;
    float _476 = _474 ? _272 : as_type<float>(_436);
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _480 = _478 != 0;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _488 = _486 != 0;
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _492 = float(_109);
    bool _494 = !_484;
    int _496 = _494 ? 0 : 1;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = _145 * _464;
    float _504 = float(_177);
    float _506 = 1.0 / _492;
    float _508 = float(_201);
    bool _510 = !_460;
    int _512 = _510 ? 0 : (-1);
    bool _514 = _508 >= _504;
    bool _516 = isnan(_508);
    bool _518 = _514 || _516;
    bool _520 = isnan(_504);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _472 * _490;
    int _528 = ~_258;
    int _530 = _528 + _512;
    int _532 = _530 + 1;
    float _534 = exp2(_502);
    bool _536 = _177 == 0;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_500)
    {
        _538 = 1.0;
    }
    float _540 = _538;
    float _542 = _540;
    if (!_500)
    {
        _542 = 7.345489978790283203125;
    }
    float _544 = _542;
    bool _546 = !_480;
    int _548 = _546 ? 0 : 1;
    float _550 = trunc(_524);
    int _552 = int(_550);
    int _554 = abs(_360);
    float _556 = _544 * _131;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _560 = _558 != 0;
    float _562 = floor(_556);
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _570 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _568);
    float _572 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _578 = -_562;
    float _580 = _556 + _578;
    float _582 = _145 * _506;
    int _584 = _177 + (-1);
    float _586 = 1.0 / _576;
    float _588 = _580 * _504;
    int _590 = _177 * _532;
    int _592 = _590 + _201;
    float _594 = _504 * _582;
    int _596 = ~_552;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _602;
    bool _606 = !_536;
    int _608 = _606 ? _592 : (-1);
    float _610 = trunc(_588);
    int _612 = int(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _618 = _608 * _600;
    int _620 = abs(_548);
    bool _622 = !_560;
    int _624 = _622 ? 0 : 1;
    float _626 = trunc(_594);
    int _628 = int(_626);
    int _630 = _552 * _584;
    int _632 = _630 + _618;
    int _634 = abs(_496);
    bool _636 = !_488;
    int _638 = _636 ? 0 : 1;
    int _640 = _632 * _634;
    int _642 = abs(_638);
    float _644 = 1.0 / _616;
    int _646 = _612 * _554;
    int _648 = _646 + _201;
    int _650 = abs(_624);
    int _652 = _628 * _620;
    int _654 = _652 + _640;
    int _656 = ~_177;
    int _658 = _656 + 1;
    int _660 = ~_177;
    int _662 = _660 + 1;
    int _664 = _648 * _642;
    int _666 = _664 + _654;
    bool _668 = _177 == 0;
    int _670 = ~_432;
    int _672 = _670 + 1;
    int _674 = _612 * _650;
    int _676 = _674 + _666;
    float _678 = _604 * _644;
    float _680 = _131 + _169;
    float _682 = float(uint(_676));
    float _684 = _680 + (-1.0);
    float _686 = as_type<float>(_203) * _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _692;
    float _696 = trunc(_686);
    float _698 = precise::max(_696, 0.0);
    uint _700 = uint(_698);
    int _702 = _658 * int(_700);
    int _704 = _702 + _676;
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_203) * _706;
    float _710 = trunc(_708);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    int _716 = int(_700) + int(_714);
    int _718 = _662 * _716;
    int _720 = _718 + _676;
    float _722 = float(uint(_432));
    bool _724 = uint(_720) >= uint(_177);
    bool _726 = !_724;
    int _728 = _726 ? 0 : (-1);
    int _730 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _732 = _730 != 0;
    int _734 = ~_716;
    int _736 = _734 + _728;
    int _738 = _736 + 1;
    bool _740 = !_732;
    int _742 = _740 ? 0 : 1;
    int _744 = _177 * _738;
    int _746 = _744 + _676;
    bool _748 = !_668;
    int _750 = _748 ? _746 : (-1);
    int _752 = _750 & 3;
    bool _754 = _752 != 0;
    int _756 = _750 & 3;
    bool _758 = _756 != 0;
    int _760 = _754 ? 0 : 1;
    bool _762 = uint(_756) >= 2u;
    int _764 = ~_760;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    int _770 = _762 ? 0 : 1;
    bool _772 = uint(_756) > 1u;
    int _774 = ~_770;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    int _780 = _768;
    int _782 = _778;
    if (!_772)
    {
        int _784 = ~_760;
        int _786 = _784 + 1;
        _780 = _786;
    }
    int _788 = _780;
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _792 = int(_790);
    bool _794 = _756 != 3;
    int _796 = abs(_788);
    if (_794)
    {
        int _798 = ~_770;
        int _800 = _798 + 1;
        _782 = _800;
    }
    int _802 = _782;
    float _804 = float(_792);
    float _806 = 1.0 / _722;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _810 = _808 != 0;
    bool _812 = !_810;
    int _814 = _812 ? 0 : 1;
    bool _816 = _438 > 0.5;
    float _818 = 1.0 / _804;
    float _820 = fma(_438, 2.0, -1.0);
    float _822 = -_272;
    int _824 = _816 ? as_type<int>(_822) : as_type<int>(_272);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _832 = _830 != 0;
    bool _834 = !_442;
    float _836 = _834 ? _272 : as_type<float>(_824);
    int _838 = as_type<int>(_806) + (-2);
    bool _840 = !_828;
    int _842 = _840 ? 0 : 1;
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    int _848 = abs(_842);
    float _850 = _145 * _818;
    int _852 = abs(_846);
    float _854 = trunc(_850);
    int _856 = int(_854);
    int _858 = ~_432;
    int _860 = _858 + 1;
    float _862 = float(uint(_856));
    float _864 = as_type<float>(_838) * _862;
    float _866 = trunc(_864);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    int _872 = _672 * int(_870);
    int _874 = _872 + _856;
    float _876 = float(uint(_874));
    float _878 = as_type<float>(_838) * _876;
    float _880 = trunc(_878);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    int _886 = int(_870) + int(_884);
    int _888 = ~_177;
    int _890 = _888 + 1;
    int _892 = _860 * _886;
    int _894 = _892 + _856;
    bool _896 = uint(_894) >= uint(_432);
    float _898 = float(uint(_648));
    bool _900 = !_896;
    int _902 = _900 ? 0 : (-1);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _906 = _904 != 0;
    float _908 = as_type<float>(_203) * _898;
    int _910 = ~_886;
    int _912 = _910 + _902;
    int _914 = _912 + 1;
    bool _916 = !_906;
    int _918 = _916 ? 0 : 1;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _934 = _932 != 0;
    float _936 = trunc(_908);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = _432 * _914;
    int _944 = _942 + _856;
    int _946 = abs(_918);
    bool _948 = !_922;
    int _950 = _948 ? 0 : 1;
    bool _952 = !_926;
    int _954 = _952 ? 0 : 1;
    bool _956 = !_930;
    int _958 = _956 ? 0 : 1;
    int _960 = abs(_954);
    int _962 = _890 * int(_940);
    int _964 = _962 + _648;
    float _966 = float(uint(_964));
    int _968 = ~_177;
    int _970 = _968 + 1;
    float _972 = as_type<float>(_203) * _966;
    float _974 = trunc(_972);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    float _980 = float(_856);
    int _982 = int(_940) + int(_978);
    float _984 = as_type<float>(_940);
    float _986 = as_type<float>(_982);
    float _988 = as_type<float>(_946);
    if (_500)
    {
        _984 = 1.0;
    }
    float _990 = _984;
    float _992 = _990;
    if (!_500)
    {
        _992 = 1.2345600128173828125;
    }
    float _994 = _992;
    int _996 = _970 * _982;
    int _998 = _996 + _648;
    float _1000 = float(_432);
    bool _1002 = uint(_998) >= uint(_177);
    float _1004 = _1000 * _582;
    float _1006 = as_type<float>(_998);
    if (_500)
    {
        _1006 = _131;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_500)
    {
        _1010 = _169;
    }
    float _1012 = _1010;
    bool _1014 = _980 >= _1000;
    bool _1016 = isnan(_980);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_1000);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = trunc(_1004);
    int _1028 = int(_1026);
    bool _1030 = !_1002;
    int _1032 = _1030 ? 0 : (-1);
    float _1034 = _994 * _1012;
    bool _1036 = _432 == 0;
    int _1038 = ~_982;
    int _1040 = _1038 + _1032;
    int _1042 = _1040 + 1;
    float _1044 = floor(_1034);
    float _1046 = trunc(_1024);
    int _1048 = int(_1046);
    float _1050 = -_1044;
    float _1052 = _1034 + _1050;
    bool _1054 = !_1036;
    int _1056 = _1054 ? _944 : (-1);
    float _1058 = _1052 * _1000;
    int _1060 = _432 + (-1);
    bool _1062 = !_934;
    int _1064 = _1062 ? 0 : 1;
    float _1066 = -_452;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    int _1070 = ~_1048;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    float _1076 = trunc(_1058);
    int _1078 = int(_1076);
    float _1080 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _1082 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(0.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    int _1092 = _1056 * _1074;
    int _1094 = abs(_958);
    float _1096 = _1090 ? _566 : 0.0;
    int _1098 = _1048 * _1060;
    int _1100 = _1098 + _1092;
    int _1102 = abs(_950);
    int _1104 = _1100 * _960;
    int _1106 = abs(_1064);
    int _1108 = _1078 * _946;
    int _1110 = _1108 + _856;
    int _1112 = _1028 * _1102;
    int _1114 = _1112 + _1104;
    int _1116 = ~_432;
    int _1118 = _1116 + 1;
    int _1120 = _177 * _1042;
    int _1122 = _1120 + _648;
    int _1124 = _1110 * _1094;
    int _1126 = _1124 + _1114;
    bool _1128 = !_668;
    int _1130 = _1128 ? _1122 : (-1);
    int _1132 = _1078 * _1106;
    int _1134 = _1132 + _1126;
    int _1136 = ~_432;
    int _1138 = _1136 + 1;
    float _1140 = float(uint(_1134));
    float _1142 = as_type<float>(_838) * _1140;
    float _1144 = trunc(_1142);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    int _1150 = _1138 * int(_1148);
    int _1152 = _1150 + _1134;
    float _1154 = float(uint(_1152));
    float _1156 = as_type<float>(_838) * _1154;
    float _1158 = trunc(_1156);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = ~_432;
    int _1166 = _1164 + 1;
    int _1168 = int(_1148) + int(_1162);
    float _1170 = float(uint(_1110));
    int _1172 = _1118 * _1168;
    int _1174 = _1172 + _1134;
    float _1176 = as_type<float>(_838) * _1170;
    int _1178 = as_type<int>(_1170);
    float _1180 = as_type<float>(_1102);
    float _1182 = _1080;
    if (_500)
    {
        _1178 = 0;
    }
    int _1184 = _1178;
    bool _1186 = uint(_1174) >= uint(_432);
    float _1188 = trunc(_1176);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    int _1194 = _1184;
    if (!_500)
    {
        _1194 = 1;
    }
    int _1196 = _1194;
    bool _1198 = !_1186;
    int _1200 = _1198 ? 0 : (-1);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    int _1206 = ~_1168;
    int _1208 = _1206 + _1200;
    int _1210 = _1208 + 1;
    int _1212 = _1200;
    if (_500)
    {
        _1212 = 0;
    }
    int _1214 = _1212;
    float _1216 = in.m_58.w;
    int _1218 = _1214;
    if (!_500)
    {
        _1218 = 2;
    }
    int _1220 = _1218;
    int _1222 = _432 * _1210;
    int _1224 = _1222 + _1134;
    int _1226 = _1166 * int(_1192);
    int _1228 = _1226 + _1110;
    bool _1230 = !_1036;
    int _1232 = _1230 ? _1224 : (-1);
    bool _1234 = !_1204;
    int _1236 = _1234 ? 0 : 1;
    int _1238 = _1232 & 3;
    bool _1240 = _1238 != 0;
    int _1242 = _1232 & 3;
    bool _1244 = _1242 != 0;
    float _1246 = float(uint(_1228));
    int _1248 = _1240 ? 0 : 1;
    bool _1250 = uint(_1242) > 1u;
    float _1252 = as_type<float>(_838) * _1246;
    int _1254 = ~_1248;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    int _1260 = ~_432;
    int _1262 = _1260 + 1;
    float _1264 = trunc(_1252);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    bool _1270 = !_1244;
    int _1272 = _1270 ? 0 : 1;
    bool _1274 = _1242 != 3;
    int _1276 = _1258;
    if (!_1250)
    {
        int _1278 = ~_1248;
        int _1280 = _1278 + 1;
        _1276 = _1280;
    }
    int _1282 = _1276;
    bool _1284 = uint(_1242) >= 2u;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = _1242 != 3;
    int _1290 = int(_1192) + int(_1268);
    float _1292 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    int _1294 = ~_1286;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    float _1300 = 1.0 / _1292;
    int _1302 = _1262 * _1290;
    int _1304 = _1302 + _1110;
    int _1306 = _1298;
    if (_1288)
    {
        int _1308 = ~_1286;
        int _1310 = _1308 + 1;
        _1306 = _1310;
    }
    int _1312 = _1306;
    bool _1314 = uint(_1304) >= uint(_432);
    int _1316 = abs(_1312);
    bool _1318 = !_1314;
    int _1320 = _1318 ? 0 : (-1);
    bool _1322 = _1196 != 1;
    float _1324 = in.m_49.x;
    float _1326 = in.m_49.y;
    float _1328 = in.m_49.z;
    int _1330 = ~_1290;
    int _1332 = _1330 + _1320;
    int _1334 = _1332 + 1;
    float _1336 = _131 * 2.0;
    int _1338 = _432 * _1334;
    int _1340 = _1338 + _1110;
    float _1342 = floor(_1336);
    if (!_1322)
    {
        _1180 = _169;
    }
    float _1344 = _1180;
    float _1346 = _1344;
    if (!_1322)
    {
        _986 = _173;
    }
    float _1348 = _986;
    float _1350 = 0.0;
    float _1352 = _1348;
    if (!_1322)
    {
        _1350 = _1344;
    }
    float _1354 = _1350;
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _1358 = 0.0;
    float _1360 = _1354;
    if (!_1322)
    {
        _1358 = _173;
    }
    float _1362 = _1358;
    float _1364 = _1362;
    if (_1322)
    {
        _1360 = _131;
    }
    float _1366 = _1360;
    if (_1322)
    {
        _1346 = _131;
    }
    float _1368 = _1346;
    if (_1322)
    {
        _1352 = _169;
    }
    float _1370 = _1352;
    float _1372 = fma(_338, _1328, _1080);
    float _1374 = _1328;
    float _1376 = _1328;
    if (_1322)
    {
        _1364 = _169;
    }
    float _1378 = _1364;
    bool _1380 = _1220 != 2;
    float _1382 = in.m_44.x;
    float _1384 = in.m_44.y;
    float _1386 = in.m_44.z;
    bool _1388 = _1342 >= 0.0;
    bool _1390 = isnan(_1342);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan(0.0);
    bool _1396 = _1392 || _1394;
    float _1398 = _466 * _1356;
    bool _1400 = !_1274;
    int _1402 = _1400 ? 0 : (-1);
    float _1404 = 0.0;
    if (_1380)
    {
        _1404 = _131;
    }
    float _1406 = _1404;
    float _1408 = _1406;
    if (_1380)
    {
        _988 = _169;
    }
    float _1410 = _988;
    float _1412 = _1410;
    if (!_1380)
    {
        _1408 = _173;
    }
    float _1414 = _1408;
    if (!_1380)
    {
        _1412 = _131;
    }
    float _1416 = _1412;
    bool _1418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1420 = fma(_1372, _1216, _1386);
    float _1422 = -_1420;
    float _1424 = precise::max(0.0, _1422);
    float _1426 = as_type<float>(_1042);
    if (_1418)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = precise::min(_1292, _1424);
    float _1434 = _1432 * _1300;
    float _1436 = _1432;
    if (_1418)
    {
        float _1438 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = _1440;
    if (_1418)
    {
        float _1444 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1434);
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = 0.0;
    float _1450 = _1446;
    if (!_1418)
    {
        _1448 = _1434;
    }
    float _1452 = _1448;
    out.m_60.x = _1434;
    float _1454 = _1452;
    if (_1418)
    {
        float _1456 = _1446 * _1430;
        _1450 = _1456;
    }
    float _1458 = _1450;
    float _1460 = _1430;
    if (_1418)
    {
        float _1462 = floor(_1458);
        _1460 = _1462;
    }
    float _1464 = _1460;
    if (_1418)
    {
        float _1466 = -_1464;
        float _1468 = _1458 + _1466;
        _1454 = _1468;
    }
    float _1470 = _1454;
    bool _1472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1474 = floor(_458);
    bool _1476 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1478 = isnan(_1470);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = _458 + (-1.0);
    float _1490 = _1292;
    if (_1472)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1490 = _1492;
    }
    float _1494 = _1490;
    if (_1472)
    {
        float _1496 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1182 = _1496;
    }
    float _1498 = _1182;
    float _1500 = 0.0;
    float _1502 = _1498;
    if (!_1472)
    {
        _1500 = _1434;
    }
    float _1504 = _1500;
    float _1506 = _1504;
    if (_1472)
    {
        float _1508 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1434);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = _1510;
    if (_1472)
    {
        float _1514 = _1510 * _1494;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1494;
    if (_1472)
    {
        float _1520 = floor(_1516);
        _1518 = _1520;
    }
    float _1522 = _1518;
    if (_1472)
    {
        float _1524 = -_1522;
        float _1526 = _1516 + _1524;
        _1506 = _1526;
    }
    float _1528 = _1506;
    bool _1530 = _1474 > 0.0;
    bool _1532 = !_1036;
    int _1534 = _1532 ? _1340 : (-1);
    bool _1536 = _1474 >= 0.0;
    bool _1538 = isnan(_1474);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    bool _1546 = !_758;
    int _1548 = _1546 ? 0 : 1;
    int _1550 = _1544 ? 0 : 1;
    bool _1552 = _1342 > 0.0;
    float _1554 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1556 = ~_1550;
    int _1558 = _1556 + 1;
    int _1560 = _1558 + 1;
    int _1562 = _1560;
    if (!_1530)
    {
        int _1564 = ~_1550;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    bool _1570 = _756 != 3;
    int _1572 = _1396 ? 0 : 1;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1580 = _1578 != 0;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1584 = _1582 != 0;
    float _1586 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1588 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1590 = _1588 != 0;
    int _1592 = ~_1572;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    int _1598 = _1596;
    if (!_1552)
    {
        int _1600 = ~_1572;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1608 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1610 = _1608 != 0;
    float _1612 = fma(_1554, -2.0, _1606);
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1616 = !_1570;
    int _1618 = _1616 ? 0 : (-1);
    float _1620 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1612);
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1624 = _1622 != 0;
    float _1626 = -_1614;
    float _1628 = fma(_1586, 2.0, _1626);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1638 = 1.0 / _1632;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1644 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1646 = isnan(_1528);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1660 = !_1576;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = 1.0 / _1636;
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1668 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _1670 = !_1580;
    int _1672 = _1670 ? 0 : 1;
    bool _1674 = _173 > 0.5;
    int _1676 = abs(_1672);
    float _1678 = 1.0 / _1642;
    float _1680 = -_1666;
    float _1682 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1680);
    float _1684 = -_1668;
    float _1686 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1688 = -_572;
    float _1690 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1688);
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1696;
    float _1700 = 1.0 / _1658;
    float _1702 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1708 = _1698 * _1638;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1710;
    float _1714 = -_1702;
    float _1716 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1714);
    float _1718 = _1706 * _1664;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1724 = _169 * 2.0;
    float _1726 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1728 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1734 = floor(_1724);
    float _1736 = -_1726;
    float _1738 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1736);
    float _1740 = -_1728;
    float _1742 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1740);
    float _1744 = _1694 * _1678;
    float _1746 = _1732 * _1700;
    float _1748 = _1712 * _586;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1754 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _526);
    float _1756 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1760 = 1.0 + _1758;
    float _1762 = 1.0 / _1752;
    float _1764 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1766 = -_1756;
    float _1768 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1766);
    float _1770 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1772 = _1734 >= 0.0;
    bool _1774 = isnan(_1734);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    float _1782 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1784 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1786 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _1788 = _1780 ? 0 : 1;
    float _1790 = _131 + _173;
    bool _1792 = _1734 > 0.0;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1796 = 1.0 / _1760;
    float _1798 = _1790 + (-1.0);
    float _1800 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1802 = _173 + _169;
    float _1804 = _1722 * _1762;
    float _1806 = _1794 * 0.15915493667125701904296875;
    float _1808 = _1802 + (-1.0);
    float _1810 = floor(_1754);
    float _1812 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1814 = 1.0 + _1812;
    float _1816 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1818 = -_1764;
    float _1820 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1818);
    float _1822 = -_1770;
    float _1824 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1826 = -_1782;
    float _1828 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1830 = -_1784;
    float _1832 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1830);
    float _1834 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1836 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1398);
    int _1838 = ~_1788;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    float _1844 = -_1786;
    float _1846 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1844);
    int _1848 = _1842;
    if (!_1792)
    {
        int _1850 = ~_1788;
        int _1852 = _1850 + 1;
        _1848 = _1852;
    }
    int _1854 = _1848;
    float _1856 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1858 = floor(_1836);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1862 = 1.0 + _1860;
    float _1864 = -_1810;
    float _1866 = _1754 + _1864;
    float _1868 = _1754 * 6.283185482025146484375;
    float _1870 = _1096 * _1796;
    float _1872 = _1856 * _1862;
    float _1874 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1832);
    float _1876 = _1868 * 0.15915493667125701904296875;
    float _1878 = _1806 * 6.283185482025146484375;
    float _1880 = cos(_1878);
    float _1882 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = -_1872;
    float _1886 = _1856 + _1884;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1824);
    bool _1890 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1892 = isnan(1.0);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1898 = _1894 || _1896;
    float _1900 = fma(_1886, _169, _1872);
    float _1902 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1846);
    float _1904 = _1806 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = -_1858;
    float _1910 = _1836 + _1908;
    float _1912 = -_1882;
    float _1914 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1912);
    float _1916 = _1836 * 6.283185482025146484375;
    float _1918 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1768);
    float _1920 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1914);
    float _1922 = _1876 * 6.283185482025146484375;
    float _1924 = cos(_1922);
    float _1926 = _1880 * _1880;
    float _1928 = _1916 * 0.15915493667125701904296875;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1932 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1828);
    float _1934 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1820);
    float _1936 = fma(_1906, _1906, _1926);
    bool _1938 = _1866 < 0.5;
    float _1940 = float(_1938);
    float _1942 = _1928 * 6.283185482025146484375;
    float _1944 = cos(_1942);
    float _1946 = -_1866;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1958 = -_1940;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1962 = float(_1676);
    float _1964 = fma(_1924, 0.5, 0.5);
    bool _1966 = !_1584;
    int _1968 = _1966 ? 0 : 1;
    float _1970 = rsqrt(_1936);
    bool _1972 = _1910 < 0.5;
    float _1974 = float(_1972);
    float _1976 = -_1964;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1980 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1984 = -_1910;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1988 = -_1974;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1992 = -_1980;
    float _1994 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1992);
    float _1996 = -_1930;
    float _1998 = fma(_1982, 2.0, _1996);
    float _2000 = fma(_1944, 0.5, 0.5);
    float _2002 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1994);
    float _2004 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2006 = -_2000;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2012 = _1906 * _1970;
    float _2014 = _1880 * _1970;
    float _2016 = fma(_338, _1324, _2004);
    float _2018 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2022 = fma(_338, _1326, _2018);
    float _2024 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2028 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2020);
    float _2030 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2032 = -_1920;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2002);
    float _2036 = -_2026;
    float _2038 = fma(_2024, 2.0, _2036);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2044 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2046 = fma(_2016, _1216, _1382);
    float _2048 = fma(_2022, _1216, _1384);
    float _2050 = fma(_2030, -2.0, _2040);
    float _2052 = fma(_2044, -2.0, _2042);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2062 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2010);
    float _2064 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2066 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2074 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2082 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2088 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2064);
    float _2090 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2066);
    out.m_62.x = _2074;
    out.m_62.y = _2076;
    out.m_62.z = _2078;
    float _2092 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2080);
    float _2094 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_64.x = _2082;
    out.m_64.y = _2084;
    out.m_64.z = _2086;
    float _2098 = -_145;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1998);
    float _2102 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2088);
    float _2104 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2090);
    float _2106 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2108 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2092);
    float _2110 = float(_1854);
    float _2112 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2114 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _2116 = _470 + 0.5;
    float _2118 = fma(_426, _1324, _2106);
    float _2120 = fma(_426, _1326, _2112);
    float _2122 = fma(_426, _1328, _2114);
    float _2124 = fma(_2094, _2116, _2100);
    float _2126 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2052);
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2130 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2134 = _476 + (-0.5);
    float _2136 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2128);
    float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _2138;
    float _2142 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2132);
    float _2144 = -_2130;
    float _2146 = -_2126;
    float _2148 = fma(_2144, _2134, _2146);
    float _2150 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2156 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2142);
    float _2158 = -_2150;
    float _2160 = _2158 + 1.0;
    float _2162 = -_2120;
    float _2164 = _2022 + _2162;
    float _2166 = -_2156;
    float _2168 = _2166 + 1.0;
    float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2172 = -_2160;
    float _2174 = fma(_470, _2172, _2124);
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _2176;
    float _2180 = fma(_476, _2168, _2148);
    float _2182 = -_2118;
    float _2184 = _2016 + _2182;
    float _2186 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2188 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2190 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_66.x = _2174;
    out.m_66.y = _2180;
    float _2192 = 1.0 / _2178;
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2186);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2188);
    float _2198 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2190);
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2204 = _2108 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2206 = -_145;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2038);
    float _2210 = 1.0 / _2140;
    int _2212 = abs(_742);
    float _2214 = _1068 * _1434;
    float _2216 = float(_2212);
    float _2218 = float(_848);
    float _2220 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[193].y, _570);
    float _2222 = precise::max(0.0, _2214);
    float _2224 = 1.0 / _2154;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2228 = _1470 + _2226;
    float _2230 = abs(_1948);
    float _2232 = _2218 * _2230;
    float _2234 = abs(_1986);
    float _2236 = _2218 * _2234;
    float _2238 = precise::min(_2222, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2242 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _2240;
    float _2244 = float(_852);
    float _2246 = fma(_2216, _1978, _2232);
    float _2248 = fma(_2216, _2008, _2236);
    float _2250 = _2238 * _2170;
    float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2254 = _1470 + _2252;
    float _2256 = abs(_1960);
    float _2258 = fma(_2244, _2256, _2246);
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2262 = _1470 + _2260;
    float _2264 = 1.0 / _2202;
    float _2266 = fma(_1744, _2254, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2270 = _1470 + _2268;
    float _2272 = fma(_1746, _2262, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2274 = _2220 * 0.15915493667125701904296875;
    float _2276 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2278 = _1470 + _2276;
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2282 = _1470 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2286 = _2284 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2288 = 1.0 / _2242;
    float _2290 = fma(_1708, _2228, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2292 = fma(_1748, _2278, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2294 = fma(_1804, _2270, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2296 = fma(_1718, _2282, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2300 = _1528 + _2298;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2304 = _1528 + _2302;
    float _2306 = _2274 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = abs(_1990);
    float _2312 = fma(_2244, _2310, _2248);
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2316 = _1470 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _2318;
    float _2322 = _2300 * _2210;
    float _2324 = _2304 * _2224;
    float _2326 = fma(_678, _2316, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2330 = _1528 + _2328;
    float _2332 = 1.0 / _2286;
    float _2334 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2336 = _1528 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2340 = _1528 + _2338;
    float _2342 = _2330 * _2264;
    float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _2344;
    float _2348 = _2336 * _2288;
    float _2350 = _2340 * _2192;
    float _2352 = -_1900;
    float _2354 = _2012 * _2352;
    float _2356 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2358 = 1.0 / _2320;
    float _2360 = -_1900;
    float _2362 = _2014 * _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2368 = _2012 * _2356;
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2372 = _1528 + _2370;
    float _2374 = fma(_1068, _2362, _2368);
    float _2376 = fma(_1956, _2324, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2378 = fma(_2366, _2324, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    float _2380 = -_2356;
    float _2382 = _2014 * _2380;
    float _2384 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2384;
    bool _2388 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2390 = isnan(_1470);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2396 = _2392 || _2394;
    float _2398 = float(_2396);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _2400;
    float _2404 = _2372 * _2332;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    bool _2414 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2416 = isnan(_1470);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2422 = _2418 || _2420;
    float _2424 = float(_2422);
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2428 = _1528 + _2426;
    float _2430 = fma(_1068, _2354, _2382);
    float _2432 = fma(_1952, _2322, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2434 = fma(_2346, _2322, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _2436 = fma(_2386, _2350, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2438 = fma(_2402, _2350, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2440;
    float _2444 = -_2398;
    float _2446 = _2444 + 1.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _2448;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2456 = fma(_2408, _2342, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2458 = fma(_2412, _2342, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    bool _2464 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2466 = isnan(_1470);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2472 = _2468 || _2470;
    float _2474 = float(_2472);
    float _2476 = _2428 * _2358;
    float _2478 = -_2424;
    float _2480 = _2478 + 1.0;
    float _2482 = _2424 * _2446;
    bool _2484 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2486 = isnan(_1470);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = fma(_2454, _2404, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2498 = fma(_2462, _2404, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    float _2500 = _2474 * _2480;
    float _2502 = -_2474;
    float _2504 = _2502 + 1.0;
    bool _2506 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2508 = isnan(_1470);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2514 = _2510 || _2512;
    float _2516 = float(_2514);
    float _2518 = -_2494;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2442, _2348, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2524 = _2494 * _2504;
    bool _2526 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2528 = isnan(_1470);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    float _2538 = _2516 * _2520;
    float _2540 = -_2516;
    float _2542 = _2540 + 1.0;
    bool _2544 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2546 = isnan(_1528);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2450, _2348, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    bool _2558 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2560 = isnan(_1470);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2566 = _2562 || _2564;
    float _2568 = float(_2566);
    float _2570 = _2536 * _2542;
    float _2572 = -_2536;
    float _2574 = _2572 + 1.0;
    bool _2576 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2578 = isnan(_1528);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2584 = _2580 || _2582;
    float _2586 = float(_2584);
    float _2588 = -_2554;
    float _2590 = _2588 + 1.0;
    float _2592 = -_2568;
    float _2594 = _2592 + 1.0;
    float _2596 = _2568 * _2574;
    float _2598 = fma(_690, _2476, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2600 = _2586 * _2590;
    float _2602 = -_2586;
    float _2604 = _2602 + 1.0;
    bool _2606 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2608 = isnan(_1528);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    float _2618 = abs(_2250);
    float _2620 = log2(_2618);
    float _2622 = fma(_694, _2476, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    float _2624 = _1486 * _2594;
    float _2626 = -_1654;
    float _2628 = _2626 + 1.0;
    float _2630 = _1654 * _2604;
    bool _2632 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2634 = isnan(_1528);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = _2266 * _2624;
    float _2646 = -_2616;
    float _2648 = _2646 + 1.0;
    float _2650 = _2616 * _2628;
    bool _2652 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2654 = isnan(_1528);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2660 = _2656 || _2658;
    float _2662 = float(_2660);
    float _2664 = _1434 * _2374;
    float _2666 = float(_1604);
    float _2668 = -_2642;
    float _2670 = _2668 + 1.0;
    float _2672 = float(_1568);
    float _2674 = _2642 * _2648;
    bool _2676 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2678 = isnan(_1528);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2690 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2692 = isnan(_1528);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = _1962 * _2666;
    int _2704 = abs(_1662);
    float _2706 = -_2662;
    float _2708 = _2706 + 1.0;
    float _2710 = exp2(_2688);
    float _2712 = _2662 * _2670;
    int _2714 = abs(_1968);
    float _2716 = _2700 * _2708;
    float _2718 = -_2700;
    float _2720 = _2718 + 1.0;
    float _2722 = _2702 * (-2.0);
    float _2724 = -_1486;
    float _2726 = _2724 + 1.0;
    float _2728 = _2686 * _2720;
    float _2730 = float(_2704);
    float _2732 = -_2686;
    float _2734 = _2732 + 1.0;
    float _2736 = fma(_2726, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2644);
    float _2738 = _2434 * _2728;
    float _2740 = _2432 * _2728;
    float _2742 = in.m_68.x;
    float _2744 = in.m_68.y;
    float _2746 = in.m_68.z;
    float _2748 = float(_2714);
    float _2750 = _2104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2752 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2754 = _2730 * _2672;
    float _2756 = fma(_2734, (*spvDescriptorSet0.vp_c9)._m0[175].z, _2738);
    float _2758 = _2748 * _2110;
    float _2760 = _1434 * _2430;
    float _2762 = -_2014;
    float _2764 = fma(_2762, _2752, _2664);
    float _2766 = fma(_2734, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2740);
    float _2768 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2750);
    float _2770 = -_2012;
    float _2772 = fma(_2770, _2752, _2760);
    float _2774 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2764);
    float _2776 = fma(_2376, _2716, _2766);
    float _2778 = _2754 * (-2.0);
    float _2780 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2772);
    float _2782 = _2102 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2784 = fma(_1800, _2778, _1800);
    float _2786 = fma(_2378, _2716, _2756);
    float _2788 = _2774 + _2204;
    float _2790 = _2780 + _2782;
    float _2792 = _2758 * (-2.0);
    float _2794 = fma(_2436, _2712, _2776);
    float _2796 = fma(_2778, _2742, _2742);
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2800 = -_2768;
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _2804 = !_1898;
    float _2806 = _2804 ? _145 : _1870;
    float _2808 = -_2790;
    float _2810 = _2808 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2812 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2798);
    float _2814 = _2802 * _2802;
    float _2816 = -_2788;
    float _2818 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2820 = fma(_1816, _2792, _1816);
    float _2822 = fma(_2792, _2746, _2746);
    float _2824 = fma(_2810, _2810, _2814);
    bool _2826 = _131 > 0.5;
    float _2828 = _173 + (-0.5);
    float _2830 = _131 + (-0.5);
    float _2832 = fma(_2818, _2818, _2824);
    float _2834 = fma(_2722, _2744, _2744);
    float _2836 = fma(_2828, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2822);
    float _2838 = fma(_2830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2796);
    float _2840 = fma(_2438, _2712, _2786);
    float _2842 = rsqrt(_2832);
    float _2844 = fma(_2806, _2784, _2838);
    float _2846 = fma(_1834, _2722, _1834);
    float _2848 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2850 = in.m_58.x;
    float _2852 = _2844 * 0.15915493667125701904296875;
    float _2854 = fma(_2272, _2596, _2736);
    float _2856 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2848);
    float _2858 = _169 + (-0.5);
    float _2860 = fma(_2456, _2674, _2794);
    float _2862 = fma(_2290, _2570, _2854);
    float _2864 = fma(_2458, _2674, _2840);
    float _2866 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2834);
    float _2868 = _2852 * 6.283185482025146484375;
    float _2870 = sin(_2868);
    float _2872 = fma(_2296, _2538, _2862);
    float _2874 = fma(_2522, _2650, _2860);
    float _2876 = _2810 * _2842;
    float _2878 = _2818 * _2842;
    float _2880 = fma(_2806, _2846, _2866);
    float _2882 = fma(_2806, _2820, _2836);
    float _2884 = _2876 * _2876;
    float _2886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2888 = _2768 + _2886;
    float _2890 = fma(_2292, _2524, _2872);
    float _2892 = _2852 * 6.283185482025146484375;
    float _2894 = cos(_2892);
    float _2896 = fma(_2878, _2878, _2884);
    float _2898 = _2888 * _2888;
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2902 = _2790 + _2900;
    float _2904 = -_1434;
    float _2906 = _2904 + 1.0;
    float _2908 = _2802 * _2842;
    float _2910 = fma(_2496, _2630, _2874);
    float _2912 = fma(_2902, _2902, _2898);
    float _2914 = rsqrt(_2896);
    float _2916 = fma(_2294, _2500, _2890);
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2920 = _2788 + _2918;
    bool _2922 = _2906 >= 0.001000000047497451305389404296875;
    bool _2924 = isnan(_2906);
    bool _2926 = _2922 || _2924;
    bool _2928 = isnan(0.001000000047497451305389404296875);
    bool _2930 = _2926 || _2928;
    float _2932 = float(_2930);
    float _2934 = fma(_2556, _2650, _2864);
    float _2936 = fma(_2326, _2482, _2916);
    float _2938 = fma(_2920, _2920, _2912);
    float _2940 = _2850 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2942 = fma(_2598, _2600, _2910);
    float _2944 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2936);
    float _2946 = sqrt(_2938);
    float _2948 = _2880 * 0.15915493667125701904296875;
    float _2950 = _2882 * 0.15915493667125701904296875;
    float _2952 = _2940 * _2944;
    int _2954 = _1232 >> 31;
    float _2956 = fma(_2498, _2630, _2934);
    float _2958 = _2878 * _2914;
    float _2960 = _2876 * _2914;
    float _2962 = _2952 * _2932;
    float _2964 = _2948 * 6.283185482025146484375;
    float _2966 = sin(_2964);
    float _2968 = -_2958;
    float _2970 = _2878 * _2968;
    float _2972 = _2908 * _2960;
    float _2974 = _2258 * _2962;
    int _2976 = _2954 & 3;
    float _2978 = -_2970;
    float _2980 = fma(_2876, _2960, _2978);
    float _2982 = -_2958;
    float _2984 = _2908 * _2982;
    float _2986 = _2974 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2988 = _2948 * 6.283185482025146484375;
    float _2990 = cos(_2988);
    float _2992 = _2980 * _2980;
    float _2994 = _2946 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2996 = _2986 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2998 = fma(_2622, _2600, _2956);
    float _3000 = fma(_2972, _2972, _2992);
    int _3002 = _750 >> 31;
    float _3004 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2942);
    float _3006 = _2950 * 6.283185482025146484375;
    float _3008 = cos(_3006);
    float _3010 = fma(_2984, _2984, _3000);
    int _3012 = _3002 & 3;
    float _3014 = _2894 * _2966;
    float _3016 = precise::min(_2996, _2994);
    float _3018 = in.m_58.y;
    int _3020 = _750 + _3012;
    float _3022 = _2870 * _2966;
    float _3024 = rsqrt(_2938);
    int _3026 = _1232 + _2976;
    float _3028 = _2894 * _2990;
    int _3030 = _3020 >> 2;
    float _3032 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[182].z, _2998);
    int _3034 = _3026 >> 2;
    float _3036 = _2870 * _2990;
    int _3038 = _3030 << 4;
    int _3040 = _3038 + 368;
    float _3042 = rsqrt(_3010);
    int _3044 = _3034 << 4;
    int _3046 = _3044 + 512;
    float _3048 = _2894 * _3008;
    uint _3050 = uint(int(uint(_3040) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[int(_3060)][_3062];
    float _3066 = _2870 * _3008;
    float _3068 = _2990 * _3008;
    float _3070 = _2966 * _3008;
    out.m_70.w = _3016;
    float _3072 = _2950 * 6.283185482025146484375;
    float _3074 = sin(_3072);
    float _3076 = _3024 * _3016;
    bool _3078 = _169 > 0.5;
    uint _3080 = uint(int(uint(_3046) >> uint(2)));
    uint _3082 = uint(int(uint(int(_3080)) >> uint(2)));
    int _3084 = int(_3080) & 3;
    float _3086 = (*spvDescriptorSet0.vp_c9)._m0[int(_3082)][_3084];
    int _3088 = int(_3080) + 1;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    int _3092 = _3088 & 3;
    float _3094 = (*spvDescriptorSet0.vp_c9)._m0[int(_3090)][_3092];
    float _3096 = _3004 + 1.0;
    float _3098 = _2888 * _3076;
    float _3100 = _2902 * _3076;
    float _3102 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2812);
    float _3104 = 1.0 / _2034;
    float _3106 = -_3098;
    float _3108 = _2888 + _3106;
    float _3110 = _2980 * _3042;
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    int _3114 = _3040 + 8;
    uint _3116 = uint(int(uint(_3114) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = _2354 * _3096;
    float _3134 = _3108 * _3108;
    float _3136 = -_3112;
    float _3138 = _3136 + 1.0;
    float _3140 = -_3102;
    float _3142 = _3140 + 1.0;
    float _3144 = fma(_3074, _3028, _3022);
    float _3146 = fma(_3074, _3022, _3028);
    float _3148 = -_3100;
    float _3150 = _2902 + _3148;
    float _3152 = _2920 * _3076;
    float _3154 = -_3014;
    float _3156 = fma(_3074, _3036, _3154);
    float _3158 = -_3036;
    float _3160 = fma(_3074, _3014, _3158);
    float _3162 = fma(_3150, _3150, _3134);
    float _3164 = -_3152;
    float _3166 = _2920 + _3164;
    float _3168 = fma(_1934, _3104, -1.0);
    float _3170 = _3138 * _3104;
    int _3172 = abs(_1272);
    float _3174 = fma(_3166, _3166, _3162);
    float _3176 = fma(_3138, _3168, 1.0);
    int _3178 = abs(_1548);
    float _3180 = _1918 * _3170;
    float _3182 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3184 = _3176 * _3176;
    int _3186 = abs(_802);
    float _3188 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3190 = int(_3188);
    float _3192 = _3182 * _2944;
    float _3194 = fma(_3180, _3180, _3184);
    float _3196 = _1932 * _3170;
    int _3198 = _3046 + 8;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    uint _3202 = uint(int(uint(int(_3200)) >> uint(2)));
    int _3204 = int(_3200) & 3;
    float _3206 = (*spvDescriptorSet0.vp_c9)._m0[int(_3202)][_3204];
    int _3208 = int(_3200) + 1;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    int _3212 = _3208 & 3;
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[int(_3210)][_3212];
    int _3216 = abs(_1282);
    float _3218 = _3192 * _2932;
    float _3220 = fma(_3196, _3196, _3194);
    int _3222 = ~_3216;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    float _3228 = _2312 * _3218;
    int _3230 = ~_796;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    float _3236 = rsqrt(_3220);
    int _3238 = ~_3178;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _3228 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _3246 = ~_3172;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3234 * as_type<int>(_3064);
    int _3254 = _3226 * as_type<int>(_3094);
    int _3256 = _3242 * as_type<int>(_3056);
    int _3258 = _3256 + _3252;
    int _3260 = ~_3186;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    int _3266 = _3250 * as_type<int>(_3086);
    int _3268 = _3266 + _3254;
    int _3270 = abs(_1618);
    float _3272 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3274 = int(_3272);
    float _3276 = float(uint(_3190));
    int _3278 = _3264 * as_type<int>(_3122);
    int _3280 = _3278 + _3258;
    float _3282 = _3180 * _3236;
    int _3284 = abs(_3190);
    float _3286 = _3176 * _3236;
    int _3288 = ~_3270;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = 1.0 / _3276;
    int _3296 = abs(_814);
    float _3298 = _3196 * _3236;
    int _3300 = _3292 * as_type<int>(_3130);
    int _3302 = _3300 + _3280;
    int _3304 = abs(_1402);
    int _3306 = ~_3296;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    float _3312 = float(uint(_3284));
    int _3314 = ~_1316;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = _3302 * _3310;
    float _3322 = 1.0 / _3312;
    float _3324 = float(uint(_3274));
    int _3326 = _3318 * as_type<int>(_3206);
    int _3328 = _3326 + _3268;
    int _3330 = ~_3304;
    int _3332 = _3330 + 1;
    int _3334 = _3332 + 1;
    int _3336 = _1130 * _3296;
    int _3338 = _3336 + _3320;
    float _3340 = -_3298;
    float _3342 = _2876 * _3340;
    int _3344 = as_type<int>(_3294) + (-2);
    float _3346 = -_3282;
    float _3348 = _2908 * _3346;
    int _3350 = _3334 * as_type<int>(_3214);
    int _3352 = _3350 + _3328;
    float _3354 = float(uint(_3338));
    float _3356 = -_3282;
    float _3358 = -_3342;
    float _3360 = fma(_2878, _3356, _3358);
    int _3362 = abs(_3338);
    float _3364 = 1.0 / _3324;
    int _3366 = abs(_1236);
    float _3368 = as_type<float>(_3344) * _3354;
    int _3370 = as_type<int>(_3322) + (-2);
    float _3372 = _2878 * _3286;
    float _3374 = float(uint(_3362));
    float _3376 = _3360 * _3360;
    int _3378 = ~_3366;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    float _3384 = trunc(_3368);
    float _3386 = precise::max(_3384, 0.0);
    uint _3388 = uint(_3386);
    int _3390 = abs(_3274);
    float _3392 = -_3298;
    float _3394 = -_3372;
    float _3396 = fma(_2908, _3392, _3394);
    float _3398 = -_3348;
    float _3400 = fma(_2876, _3286, _3398);
    int _3402 = _3352 * _3382;
    int _3404 = ~_3190;
    int _3406 = _3404 + 1;
    float _3408 = float(uint(_3390));
    float _3410 = sqrt(_3174);
    int _3412 = _1534 * _3366;
    int _3414 = _3412 + _3402;
    int _3416 = as_type<int>(_3364) + (-2);
    int _3418 = ~_3284;
    int _3420 = _3418 + 1;
    float _3422 = float(uint(_3414));
    int _3424 = _3406 * int(_3388);
    int _3426 = _3424 + _3338;
    float _3428 = as_type<float>(_3370) * _3374;
    float _3430 = 1.0 / _3408;
    float _3432 = fma(_3396, _3396, _3376);
    float _3434 = as_type<float>(_3416) * _3422;
    float _3436 = float(uint(_3426));
    float _3438 = fma(_3400, _3400, _3432);
    float _3440 = _3024 * _3410;
    int _3442 = _3414 ^ _3274;
    float _3444 = trunc(_3428);
    float _3446 = precise::max(_3444, 0.0);
    uint _3448 = uint(_3446);
    float _3450 = as_type<float>(_3344) * _3436;
    int _3452 = ~_3274;
    int _3454 = _3452 + 1;
    float _3456 = _2986 * _3440;
    float _3458 = _3244 * _3440;
    float _3460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    uint _3462 = uint(int(uint(_3442) >> uint(31)));
    float _3464 = rsqrt(_3438);
    out.m_72.x = _3456;
    int _3466 = ~int(_3462);
    int _3468 = _3466 + 1;
    int _3470 = _3420 * int(_3448);
    int _3472 = _3470 + _3362;
    float _3474 = trunc(_3434);
    float _3476 = precise::max(_3474, 0.0);
    uint _3478 = uint(_3476);
    float _3480 = float(uint(_3472));
    int _3482 = abs(_3414);
    float _3484 = _3396 * _3464;
    float _3486 = trunc(_3450);
    float _3488 = precise::max(_3486, 0.0);
    uint _3490 = uint(_3488);
    float _3492 = as_type<float>(_3370) * _3480;
    float _3494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    int _3496 = as_type<int>(_3430) + (-2);
    float _3498 = _3360 * _3464;
    float _3500 = float(uint(_3482));
    float _3502 = _3400 * _3464;
    int _3504 = _3454 * int(_3478);
    int _3506 = _3504 + _3414;
    float _3508 = _3456 * _3460;
    float _3510 = trunc(_3492);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    float _3516 = as_type<float>(_3496) * _3500;
    int _3518 = ~_3390;
    int _3520 = _3518 + 1;
    float _3522 = _3458 * _3494;
    float _3524 = float(uint(_3506));
    float _3526 = _2878 * _3484;
    int _3528 = int(_3388) + int(_3490);
    float _3530 = _2908 * _3502;
    float _3532 = trunc(_3516);
    float _3534 = precise::max(_3532, 0.0);
    uint _3536 = uint(_3534);
    int _3538 = ~_3190;
    int _3540 = _3538 + 1;
    float _3542 = -_3526;
    float _3544 = fma(_2876, _3502, _3542);
    float _3546 = as_type<float>(_3416) * _3524;
    float _3548 = -_3530;
    float _3550 = fma(_2878, _3498, _3548);
    int _3552 = _3540 * _3528;
    int _3554 = _3552 + _3338;
    float _3556 = _2876 * _3498;
    int _3558 = int(_3448) + int(_3514);
    float _3560 = trunc(_3546);
    float _3562 = precise::max(_3560, 0.0);
    uint _3564 = uint(_3562);
    int _3566 = ~_3284;
    int _3568 = _3566 + 1;
    float _3570 = -_3556;
    float _3572 = fma(_2908, _3484, _3570);
    int _3574 = _3520 * int(_3536);
    int _3576 = _3574 + _3482;
    float _3578 = -_256;
    int _3580 = _1674 ? as_type<int>(_3578) : as_type<int>(_256);
    int _3582 = _3568 * _3558;
    int _3584 = _3582 + _3362;
    bool _3586 = uint(_3554) >= uint(_3190);
    float _3588 = float(uint(_3576));
    float _3590 = _3544 * _3544;
    bool _3592 = !_3586;
    int _3594 = _3592 ? 0 : (-1);
    bool _3596 = uint(_3584) >= uint(_3284);
    float _3598 = fma(_3550, _3550, _3590);
    float _3600 = as_type<float>(_3496) * _3588;
    int _3602 = ~_3528;
    int _3604 = _3602 + _3594;
    int _3606 = _3604 + 1;
    float _3608 = -_3522;
    float _3610 = _3074 * _3608;
    float _3612 = fma(_3572, _3572, _3598);
    float _3614 = trunc(_3600);
    float _3616 = precise::max(_3614, 0.0);
    uint _3618 = uint(_3616);
    int _3620 = int(_3478) + int(_3564);
    float _3622 = _3048 * _3522;
    int _3624 = ~_3274;
    int _3626 = _3624 + 1;
    float _3628 = _3066 * _3522;
    bool _3630 = !_3596;
    int _3632 = _3630 ? 0 : (-1);
    int _3634 = _3190 * _3606;
    int _3636 = _3634 + _3338;
    bool _3638 = _3190 == 0;
    float _3640 = rsqrt(_3612);
    int _3642 = ~_3390;
    int _3644 = _3642 + 1;
    int _3646 = _3626 * _3620;
    int _3648 = _3646 + _3414;
    bool _3650 = !_3638;
    int _3652 = _3650 ? _3636 : (-1);
    float _3654 = fma(_3068, _3508, _3610);
    float _3656 = fma(_3144, _3508, _3622);
    bool _3658 = uint(_3648) >= uint(_3274);
    float _3660 = fma(_3156, _3508, _3628);
    int _3662 = int(_3536) + int(_3618);
    int _3664 = _3338 ^ _3190;
    bool _3666 = !_3658;
    int _3668 = _3666 ? 0 : (-1);
    int _3670 = _3644 * _3662;
    int _3672 = _3670 + _3482;
    float _3674 = -_256;
    int _3676 = _2826 ? as_type<int>(_3674) : as_type<int>(_256);
    float _3678 = _3550 * _3640;
    float _3680 = _3544 * _3640;
    float _3682 = _3572 * _3640;
    int _3684 = ~_3620;
    int _3686 = _3684 + _3668;
    int _3688 = _3686 + 1;
    float _3690 = _3048 * _3678;
    bool _3692 = uint(_3672) >= uint(_3390);
    float _3694 = _2876 * _3682;
    float _3696 = _2878 * _3680;
    float _3698 = _2908 * _3678;
    bool _3700 = _3190 == 0;
    float _3702 = _3144 * _3678;
    float _3704 = _3144 * _3680;
    float _3706 = _3048 * _3680;
    float _3708 = _3144 * _3682;
    float _3710 = _3048 * _3682;
    float _3712 = _3160 * _3682;
    float _3714 = -_3694;
    float _3716 = fma(_2878, _3678, _3714);
    float _3718 = -_3696;
    float _3720 = fma(_2908, _3682, _3718);
    float _3722 = _3656 * _3682;
    float _3724 = -_3698;
    float _3726 = fma(_2876, _3680, _3724);
    bool _3728 = !_1610;
    float _3730 = _3728 ? _256 : as_type<float>(_3676);
    int _3732 = _3274 * _3688;
    int _3734 = _3732 + _3414;
    bool _3736 = !_3692;
    int _3738 = _3736 ? 0 : (-1);
    float _3740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3742 = _3274 == 0;
    float _3744 = _3160 * _3678;
    bool _3746 = _3274 == 0;
    float _3748 = _3716 * _3716;
    float _3750 = _3656 * _3678;
    float _3752 = _3656 * _3680;
    int _3754 = ~_3632;
    int _3756 = _3558 + _3754;
    int _3758 = _3756 + 1;
    float _3760 = fma(_3720, _3720, _3748);
    uint _3762 = uint(int(uint(_3664) >> uint(31)));
    float _3764 = _3160 * _3680;
    int _3766 = ~_3738;
    int _3768 = _3662 + _3766;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3726, _3726, _3760);
    float _3774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3776 = ~int(_3762);
    int _3778 = _3776 + 1;
    float _3780 = -_145;
    float _3782 = fma(_3780, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1628);
    float _3784 = float(_3652);
    float _3786 = _3740 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3788 = _3758 ^ _3778;
    int _3790 = _3770 ^ _3468;
    float _3792 = rsqrt(_3772);
    float _3794 = fma(_3786, _3784, _3782);
    float _3796 = _3730 + 0.5;
    int _3798 = ~_3778;
    int _3800 = _3798 + _3788;
    int _3802 = _3800 + 1;
    bool _3804 = !_3742;
    int _3806 = _3804 ? _3734 : (-1);
    float _3808 = fma(_3786, _3796, _3794);
    int _3810 = ~_3468;
    int _3812 = _3810 + _3790;
    int _3814 = _3812 + 1;
    float _3816 = _3774 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3818 = float(_3806);
    float _3820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3822 = !_1624;
    float _3824 = _3822 ? _256 : as_type<float>(_3580);
    bool _3826 = !_3746;
    int _3828 = _3826 ? _3814 : (-1);
    float _3830 = fma(_3816, _3818, _2208);
    float _3832 = _3726 * _3792;
    float _3834 = _3720 * _3792;
    float _3836 = _3824 + 0.5;
    float _3838 = _3716 * _3792;
    float _3840 = fma(_3654, _3832, _3722);
    float _3842 = fma(_3654, _3834, _3750);
    float _3844 = fma(_3816, _3836, _3830);
    bool _3846 = !_3700;
    int _3848 = _3846 ? _3802 : (-1);
    float _3850 = fma(_2878, _3660, _3840);
    float _3852 = fma(_2876, _3660, _3842);
    float _3854 = -_3074;
    float _3856 = fma(_3854, _3834, _3690);
    float _3858 = fma(_3068, _3834, _3702);
    float _3860 = _2788 + _3850;
    float _3862 = -_3074;
    float _3864 = fma(_3862, _3838, _3706);
    float _3866 = float(_3848);
    float _3868 = fma(_3068, _3838, _3704);
    float _3870 = -_3074;
    float _3872 = fma(_3870, _3832, _3710);
    float _3874 = fma(_3070, _3838, _3764);
    float _3876 = fma(_3070, _3832, _3712);
    float _3878 = _3820 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3880 = fma(_3654, _3838, _3752);
    float _3882 = _2790 + _3852;
    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3886 = _3860 + _3884;
    float _3888 = fma(_3066, _2876, _3856);
    float _3890 = fma(_3066, _2908, _3864);
    float _3892 = -_1620;
    float _3894 = fma(_3878, _3866, _3892);
    float _3896 = fma(_3066, _2878, _3872);
    float _3898 = fma(_3068, _3832, _3708);
    float _3900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3902 = _3882 + _3900;
    float _3904 = _3886 * _3886;
    float _3906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3908 = fma(_3070, _3834, _3744);
    float _3910 = fma(_2908, _3660, _3880);
    float _3912 = fma(_3902, _3902, _3904);
    float _3914 = -_272;
    int _3916 = _3078 ? as_type<int>(_3914) : as_type<int>(_272);
    float _3918 = fma(_3156, _2876, _3858);
    float _3920 = float(_3828);
    float _3922 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2050);
    float _3924 = sqrt(_3912);
    bool _3926 = !_1590;
    float _3928 = _3926 ? _272 : as_type<float>(_3916);
    float _3930 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3932 = fma(_3146, _2876, _3908);
    float _3934 = fma(_3156, _2908, _3868);
    float _3936 = fma(_3156, _2878, _3898);
    float _3938 = _3928 + (-0.5);
    float _3940 = _3930 * _3890;
    float _3942 = _3906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3944 = _3930 * _3896;
    float _3946 = -_3878;
    float _3948 = fma(_3946, _3938, _3894);
    float _3950 = fma(_3930, _3930, 1.0);
    float _3952 = -_3922;
    float _3954 = fma(_3942, _3920, _3952);
    float _3956 = _836 + (-0.5);
    float _3958 = _2768 + _3910;
    float _3960 = fma(_3146, _2908, _3874);
    bool _3962 = _3924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3964 = -_3942;
    float _3966 = fma(_3964, _3956, _3954);
    float _3968 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3970 = rsqrt(_3950);
    float _3972 = _3930 * _3888;
    out.m_74.x = _3918;
    out.m_74.y = _3934;
    out.m_74.z = _3936;
    float _3974 = fma(_3968, _3934, _3940);
    float _3976 = fma(_3968, _3936, _3944);
    float _3978 = fma(_3968, _3918, _3972);
    float _3980 = fma(_3146, _2878, _3876);
    float _3982 = _3968;
    float _3984 = _3940;
    float _3986 = _3942;
    if (!_3962)
    {
        _3982 = _3882;
    }
    float _3988 = _3982;
    float _3990 = _3988;
    if (!_3962)
    {
        _3984 = _3860;
    }
    float _3992 = _3984;
    float _3994 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2062);
    float _3996 = _3992;
    if (!_3962)
    {
        _3986 = _3958;
    }
    float _3998 = _3986;
    bool _4000 = !_3962;
    float _4002 = _3998;
    if (!_4000)
    {
        float _4004 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4008 = _3924 + _4006;
        float _4010 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4012 = rsqrt(_3912);
        float _4014 = _4008 * _4004;
        float _4016 = _4014 * 0.15915493667125701904296875;
        float _4018 = _4016 * 6.283185482025146484375;
        float _4020 = cos(_4018);
        float _4022 = _4016 * 6.283185482025146484375;
        float _4024 = sin(_4022);
        float _4026 = _4020 + (-1.0);
        float _4028 = fma(_4024, _4010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4030 = _4026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4032 = _4012 * _4028;
        float _4034 = fma(_3958, _4020, _4030);
        float _4036 = fma(_3902, _4032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4038 = fma(_3886, _4032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4002 = _4034;
        _3990 = _4036;
        _3996 = _4038;
    }
    float _4040 = _4002;
    float _4042 = _3990;
    float _4044 = _3996;
    float _4046 = -_2768;
    float _4048 = _4046 + _4040;
    float _4050 = -_3142;
    float _4052 = fma(_3730, _4050, _3808);
    float _4054 = -_2790;
    float _4056 = _4054 + _4042;
    float _4058 = -_2788;
    float _4060 = _4058 + _4044;
    float _4062 = _4048 * _4048;
    float _4064 = -_3994;
    float _4066 = _4064 + 1.0;
    float _4068 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2028);
    float _4070 = _3930 * _3970;
    float _4072 = fma(_4056, _4056, _4062);
    float _4074 = -_4066;
    float _4076 = fma(_3824, _4074, _3844);
    float _4078 = -_4068;
    float _4080 = _4078 + 1.0;
    float _4082 = -_3932;
    float _4084 = _4070 * _4082;
    float _4086 = fma(_4060, _4060, _4072);
    float _4088 = -_3960;
    float _4090 = _4070 * _4088;
    float _4092 = -_3980;
    float _4094 = _4070 * _4092;
    float _4096 = fma(_836, _4080, _3966);
    float _4098 = sqrt(_4086);
    float _4100 = fma(_3970, _3888, _4084);
    float _4102 = fma(_3970, _3890, _4090);
    float _4104 = fma(_3970, _3896, _4094);
    float _4106 = _3932 + _3978;
    float _4108 = _3960 + _3974;
    float _4110 = _3980 + _3976;
    float _4112 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2856);
    out.m_76.x = _4100;
    out.m_76.y = _4102;
    out.m_76.z = _4104;
    float _4114 = -_2122;
    float _4116 = _1372 + _4114;
    float _4118 = _3032 + 1.0;
    float _4120 = -_4112;
    float _4122 = _4120 + 1.0;
    out.m_78.x = _4106;
    out.m_78.y = _4108;
    out.m_78.z = _4110;
    float _4124 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2194);
    float _4126 = -_3152;
    float _4128 = _4126 + _4044;
    float _4130 = fma(_3928, _4122, _3948);
    bool _4132 = _4098 > 0.0;
    float _4134 = _2362 * _4118;
    float _4136 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2198);
    out.m_80.x = _4052;
    out.m_80.y = _4130;
    out.m_80.z = _4076;
    out.m_80.w = _4096;
    float _4138 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2196);
    float _4140 = fma(_3132, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4124);
    float _4142 = fma(_4134, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4136);
    float _4144 = -_3100;
    float _4146 = _4144 + _4042;
    float _4148 = -_3100;
    float _4150 = _2790 + _4148;
    float _4152 = -_3152;
    float _4154 = _2788 + _4152;
    float _4156 = _4124;
    float _4158 = _4116;
    float _4160 = _4104;
    float _4162 = _4102;
    float _4164 = _4100;
    float _4166 = _4130;
    float _4168 = _4052;
    float _4170 = _4146;
    float _4172 = _4100;
    if (!_4132)
    {
        _4156 = _4128;
    }
    float _4174 = _4156;
    float _4176 = -_3098;
    float _4178 = _4176 + _4040;
    float _4180 = -_3098;
    float _4182 = _2768 + _4180;
    float _4184 = _4174;
    float _4186 = _4174;
    float _4188 = _4174;
    if (!_4132)
    {
        _4158 = _4178;
    }
    float _4190 = _4158;
    bool _4192 = !_4132;
    float _4194 = _4190;
    float _4196 = _4190;
    if (!_4192)
    {
        bool _4198 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4200 = _4134;
        if (_4198)
        {
            float _4202 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4200 = _4202;
        }
        float _4204 = _4200;
        if (_4198)
        {
            _4160 = _4140;
        }
        float _4206 = _4160;
        float _4208 = _4206;
        if (_4198)
        {
            _4162 = _4138;
        }
        float _4210 = _4162;
        float _4212 = _4210;
        if (_4198)
        {
            _4164 = _4142;
        }
        float _4214 = _4164;
        float _4216 = _4204;
        float _4218 = _4214;
        if (_4198)
        {
            float _4220 = _4140 * _4204;
            _4166 = _4220;
        }
        float _4222 = _4166;
        float _4224 = _4222;
        if (_4198)
        {
            float _4226 = _4138 * _4204;
            _4168 = _4226;
        }
        float _4228 = _4168;
        float _4230 = _4228;
        if (_4198)
        {
            float _4232 = _4142 * _4204;
            _4216 = _4232;
        }
        float _4234 = _4216;
        float _4236 = _4234;
        if (!_4198)
        {
            bool _4238 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4240 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4242 = _4238 || _4240;
            bool _4244 = isnan(1.0);
            bool _4246 = _4242 || _4244;
            float _4248 = _145 + 1.0;
            float _4250 = _4248;
            if (!_4246)
            {
                float _4252 = _4248 * _4248;
                float _4254 = _4252 * 0.5;
                _4184 = _4254;
            }
            float _4256 = _4184;
            float _4258 = _4256;
            if (!_4246)
            {
                float _4260 = _4256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4258 = _4260;
            }
            float _4262 = _4258;
            bool _4264 = !_4246;
            float _4266 = _4262;
            if (!_4264)
            {
                float _4268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4270 = log2(_4268);
                float _4272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4274 = _4272 + 1.0;
                float _4276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4278 = _4270 * _4248;
                float _4280 = exp2(_4278);
                float _4282 = _4276 * 0.693147182464599609375;
                float _4284 = 1.0 / _4282;
                float _4286 = 1.0 / _4274;
                float _4288 = _4280 + (-1.0);
                float _4290 = -_4288;
                float _4292 = fma(_4290, _4284, _4248);
                float _4294 = _4292 * _4286;
                float _4296 = _4294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4266 = _4296;
            }
            float _4298 = _4266;
            float _4300 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4302 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4304 = !_4246;
            _4194 = _4302;
            if (!_4304)
            {
                float _4306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4308 = log2(_4306);
                float _4310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4312 = _4310 + 1.0;
                float _4314 = 1.0 / _4312;
                float _4316 = _4308 * _4248;
                float _4318 = exp2(_4316);
                float _4320 = -_4318;
                float _4322 = _4320 + 1.0;
                float _4324 = _4322 * _4314;
                _4250 = _4324;
            }
            float _4326 = _4250;
            float _4328 = fma(_4326, _1326, _4302);
            float _4330 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4332 = fma(_4326, _1324, _4300);
            float _4334 = -_2120;
            float _4336 = _4334 + _4328;
            float _4338 = fma(_4326, _1328, _4330);
            float _4340 = -_2118;
            float _4342 = _4340 + _4332;
            float _4344 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4346 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4348 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4350 = -_2122;
            float _4352 = _4350 + _4338;
            float _4354 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4344);
            float _4356 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4346);
            float _4358 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4348);
            float _4360 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4354);
            float _4362 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4356);
            float _4364 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4358);
            _4212 = _4362;
            _4208 = _4360;
            _4218 = _4364;
            _4224 = _4360;
            _4230 = _4362;
            _4236 = _4364;
            _4186 = _4330;
            _1374 = _4356;
        }
        float _4366 = _4212;
        float _4368 = _4208;
        float _4370 = _4218;
        float _4372 = _4224;
        float _4374 = _4230;
        float _4376 = _4236;
        float _4378 = _4194;
        float _4380 = _4186;
        float _4382 = _1374;
        float _4384 = _4366 * _4366;
        float _4386 = fma(_4368, _4368, _4384);
        float _4388 = fma(_4370, _4370, _4386);
        float _4390 = rsqrt(_4086);
        float _4392 = sqrt(_4388);
        float _4394 = _4056 * _4390;
        float _4396 = _4048 * _4390;
        float _4398 = _4060 * _4390;
        bool _4400 = _4392 > 0.0;
        float _4402 = _4378;
        float _4404 = _4380;
        _1376 = _4382;
        _4172 = _4370;
        if (!_4400)
        {
            _4402 = _4178;
        }
        float _4406 = _4402;
        _4196 = _4406;
        if (!_4400)
        {
            _4404 = _4128;
        }
        float _4408 = _4404;
        bool _4410 = !_4400;
        _4188 = _4408;
        if (!_4410)
        {
            float _4412 = rsqrt(_4388);
            float _4414 = _4412 * _4366;
            float _4416 = _4412 * _4368;
            float _4418 = _4412 * _4370;
            float _4420 = _4396 * _4414;
            float _4422 = fma(_4394, _4416, _4420);
            float _4424 = fma(_4398, _4418, _4422);
            float _4426 = _4424 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4428 = fma(_4372, _4426, _4146);
            float _4430 = fma(_4374, _4426, _4178);
            float _4432 = fma(_4376, _4426, _4128);
            _4170 = _4428;
            _4196 = _4430;
            _4188 = _4432;
            _1376 = _4414;
        }
    }
    float _4434 = _4170;
    float _4436 = _4196;
    float _4438 = _4188;
    float _4440 = _1376;
    float _4442 = _4172;
    float _4444 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4446 = fma(_4150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4444);
    float _4448 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4450 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4452 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4454 = _4450 || _4452;
    bool _4456 = isnan(0.5);
    bool _4458 = _4454 || _4456;
    float _4460 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4446);
    float _4462 = fma(_4150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4448);
    float _4464 = _4460 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4466 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4462);
    bool _4468 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4470 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4472 = _4468 || _4470;
    bool _4474 = isnan(0.5);
    bool _4476 = _4472 || _4474;
    float _4478 = 1.0 / _4464;
    float _4480 = _4466 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4482 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4484 = _4480;
    float _4486 = _4440;
    float _4488 = _4434;
    float _4490 = _4460;
    if (_4458)
    {
        _4482 = _4434;
    }
    float _4492 = _4482;
    float _4494 = _4480 + _4464;
    float _4496 = _4492;
    if (_4458)
    {
        _4484 = _4436;
    }
    float _4498 = _4484;
    float _4500 = _4498;
    if (_4458)
    {
        _4486 = _4438;
    }
    float _4502 = _4486;
    float _4504 = _4502;
    if (!_4458)
    {
        float _4506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4508 = _4182 + _4506;
        float _4510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4512 = _4150 + _4510;
        float _4514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4516 = -_4150;
        float _4518 = _4516 + _4434;
        float _4520 = _4508 * _4508;
        float _4522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4524 = _4154 + _4522;
        float _4526 = -_4182;
        float _4528 = _4526 + _4436;
        float _4530 = -_4154;
        float _4532 = _4530 + _4438;
        float _4534 = fma(_4512, _4512, _4520);
        float _4536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4538 = fma(_4524, _4524, _4534);
        float _4540 = sqrt(_4538);
        float _4542 = _4514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4544 = precise::min(_4540, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4546 = _4544 * _4536;
        float _4548 = _4542 * _4546;
        float _4550 = fma(_4518, _4548, _4150);
        float _4552 = fma(_4528, _4548, _4182);
        float _4554 = fma(_4532, _4548, _4154);
        _4500 = _4552;
        _4496 = _4550;
        _4504 = _4554;
        _4488 = _4518;
        _4490 = _4548;
    }
    float _4556 = _4500;
    float _4558 = _4496;
    float _4560 = _4504;
    float _4562 = _4488;
    float _4564 = _4490;
    float _4566 = _4564;
    float _4568 = _4562;
    if (_4476)
    {
        _4566 = 1.0;
    }
    float _4570 = _4566;
    float _4572 = _4494 * _4478;
    float _4574 = _4572 * 0.5;
    float _4576 = _4570;
    float _4578 = _4574;
    if (!_4476)
    {
        float _4580 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4584 = fma(_4574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4582);
        float _4586 = _4580 * 0.15915493667125701904296875;
        float _4588 = _4586 * 6.283185482025146484375;
        float _4590 = cos(_4588);
        float _4592 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4594 = _4592 * 0.15915493667125701904296875;
        float _4596 = _4586 * 6.283185482025146484375;
        float _4598 = sin(_4596);
        float _4600 = 1.0 / _4590;
        float _4602 = _4594 * 6.283185482025146484375;
        float _4604 = cos(_4602);
        float _4606 = _4598 * _4600;
        float _4608 = 1.0 / _4584;
        float _4610 = _4604 * _4606;
        float _4612 = _4594 * 6.283185482025146484375;
        float _4614 = sin(_4612);
        float _4616 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4618 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4616;
        float _4620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4622 = _4608 * _4620;
        float _4624 = 1.0 / _4610;
        float _4626 = 1.0 / _4618;
        float _4628 = _4614 * _4624;
        float _4630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4632 = fma(_4628, _4622, _4630);
        float _4634 = _4632 * _4626;
        float _4636 = precise::clamp(_4634, 0.0, 1.0);
        _4568 = _4594;
        _4576 = _4636;
    }
    float _4638 = _4568;
    float _4640 = _4576;
    float _4642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4644 = _4556 + _4642;
    float _4646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4648 = _4558 + _4646;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4652 = _4560 + _4650;
    float _4654 = _4644 * _4644;
    float _4656 = fma(_4648, _4648, _4654);
    float _4658 = fma(_4652, _4652, _4656);
    float _4660 = rsqrt(_4658);
    float _4662 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4664 = _4648 * _4662;
    float _4666 = _4652 * _4662;
    float _4668 = _4664 * _4664;
    float _4670 = _4666 * _4666;
    float _4672 = _4668 + _4670;
    float _4674 = sqrt(_4672);
    bool _4676 = _4674 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4678 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4680 = _4674 + _4678;
    float _4682 = _4442;
    float _4684 = _4672;
    float _4686 = _4680;
    float _4688 = _4644;
    float _4690 = _4662;
    float _4692 = _4664;
    if (_4676)
    {
        float _4694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4682 = _4694;
    }
    float _4696 = _4682;
    if (_4676)
    {
        float _4698 = rsqrt(_4672);
        _4684 = _4698;
    }
    float _4700 = _4684;
    float _4702 = _4696;
    float _4704 = _4700;
    if (_4676)
    {
        float _4706 = _4680 * _4696;
        _4686 = _4706;
    }
    float _4708 = _4686;
    if (_4676)
    {
        float _4710 = _4708 * 0.15915493667125701904296875;
        _4578 = _4710;
    }
    float _4712 = _4578;
    float _4714 = _4652;
    if (_4676)
    {
        float _4716 = _4712 * 6.283185482025146484375;
        float _4718 = sin(_4716);
        _4714 = _4718;
    }
    float _4720 = _4714;
    float _4722 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4724 = precise::max(0.0, _4722);
    float _4726 = _4638;
    float _4728 = _4724;
    if (_4676)
    {
        float _4730 = _4712 * 6.283185482025146484375;
        float _4732 = cos(_4730);
        _4726 = _4732;
    }
    float _4734 = _4726;
    float _4736 = -_4662;
    float _4738 = -_4724;
    float _4740 = fma(_4644, _4736, _4738);
    if (_4676)
    {
        float _4742 = _4740 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4688 = _4742;
    }
    float _4744 = _4688;
    float _4746 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4748 = _4720;
    float _4750 = _4744;
    if (_4676)
    {
        float _4752 = fma(_4720, _4744, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4748 = _4752;
    }
    float _4754 = _4748;
    float _4756 = _4754;
    if (!_4676)
    {
        _4750 = _4666;
    }
    float _4758 = _4750;
    float _4760 = _4758;
    float _4762 = _4734;
    if (_4676)
    {
        float _4764 = _4734 + (-1.0);
        _4728 = _4764;
    }
    float _4766 = _4728;
    if (_4676)
    {
        float _4768 = _4700 * _4754;
        _4690 = _4768;
    }
    float _4770 = _4690;
    if (!_4676)
    {
        _4756 = _4740;
    }
    float _4772 = _4756;
    float _4774 = _4772;
    if (_4676)
    {
        float _4776 = _4766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4702 = _4776;
    }
    float _4778 = _4702;
    if (_4676)
    {
        float _4780 = _4664 * _4770;
        _4692 = _4780;
    }
    float _4782 = _4692;
    if (!_4676)
    {
        _4704 = _4668;
    }
    float _4784 = _4704;
    float _4786 = _4784;
    if (_4676)
    {
        float _4788 = _4666 * _4770;
        _4760 = _4788;
    }
    float _4790 = _4760;
    if (_4676)
    {
        float _4792 = fma(_4740, _4734, _4778);
        _4774 = _4792;
    }
    float _4794 = _4774;
    if (_4676)
    {
        float _4796 = _4782 * _4782;
        _4786 = _4796;
    }
    float _4798 = _4786;
    float _4800 = sqrt(_4658);
    if (!_4676)
    {
        _4762 = _4670;
    }
    float _4802 = _4762;
    float _4804 = _4802;
    if (_4676)
    {
        float _4806 = _4790 * _4790;
        _4804 = _4806;
    }
    float _4808 = _4804;
    float _4810 = fma(_4794, _4794, _4798);
    float _4812 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4814 = _4810 + _4808;
    float _4816 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4746);
    float _4818 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4820 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4812);
    float _4822 = rsqrt(_4814);
    float _4824 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4816);
    float _4826 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4828 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4818);
    float _4830 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4834 = fma(_4800, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4832);
    float _4836 = precise::clamp(_4834, 0.0, 1.0);
    float _4838 = _4824 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4840 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4826);
    float _4842 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4828);
    float _4844 = -_4836;
    float _4846 = _4844 + 1.0;
    float _4848 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4850 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4840);
    float _4852 = _4842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4854 = abs(_4846);
    float _4856 = log2(_4854);
    float _4858 = -_4848;
    float _4860 = fma(_4858, _4830, 1.0);
    float _4862 = _4850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4864 = _4822 * _4782;
    float _4866 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4868 = _4822 * _4794;
    float _4870 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4820);
    float _4872 = _4864 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4874 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4866);
    float _4876 = _4822 * _4790;
    float _4878 = _4870 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4880 = -_4872;
    float _4882 = fma(_4868, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4880);
    float _4884 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4874);
    float _4886 = log2(_4860);
    float _4888 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4890 = -_4876;
    float _4892 = fma(_4890, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4882);
    float _4894 = _4856 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4896 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4884);
    float _4898 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4900 = fma(_4892, -0.5, 0.5);
    float _4902 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4888);
    float _4904 = exp2(_4894);
    float _4906 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4898);
    float _4908 = fma(_4892, 0.5, 0.5);
    float _4910 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4902);
    float _4912 = _4868 + 1.0;
    float _4914 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4906);
    float _4916 = fma(_4908, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4918 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4910);
    float _4920 = 1.0 / _4896;
    float _4922 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4914);
    float _4924 = fma(_4908, _4916, -0.212114393711090087890625);
    float _4926 = _4886 * 0.693147182464599609375;
    float _4928 = fma(_4908, _4924, 1.570728778839111328125);
    float _4930 = sqrt(_4900);
    float _4932 = -_4868;
    float _4934 = fma(_4904, _4912, _4932);
    float _4936 = _4926 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4938 = fma(_4934, 0.5, 0.5);
    float _4940 = _4922 * _4920;
    float _4942 = _4918 * _4920;
    float _4944 = fma(_4940, 0.5, 0.5);
    float _4946 = fma(_4942, -0.5, 0.5);
    float _4948 = _4930 * 0.636619746685028076171875;
    float3 _12632 = float3(_4944, _4946, _4936);
    float _4950 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12632, float3(0.0), isnan(_12632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12632, float3(0.0), isnan(_12632)), level(0.0)).x;
    float3 _12643 = float3(_4944, _4946, _4936);
    float4 _4953 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12643, float3(0.0), isnan(_12643)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12643, float3(0.0), isnan(_12643)), level(0.0)).xyzw;
    float _4955 = _4953.x;
    float _4957 = _4953.y;
    float _4959 = _4953.z;
    float _4961 = _4953.w;
    float _4963 = -_4928;
    float _4965 = fma(_4948, _4963, 1.0);
    float2 _12665 = float2(_4965, _4938);
    float3 _4969 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12665, float2(0.0), isnan(_12665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12665, float2(0.0), isnan(_12665)), level(0.0)).xyz;
    float _4971 = _4969.x;
    float _4973 = _4969.y;
    float _4975 = _4969.z;
    float _4977 = _4856 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4979 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4981 = _4896 * 0.5;
    out.m_82.x = _4150;
    out.m_82.y = _4182;
    out.m_82.z = _4154;
    bool _4983 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4985 = isnan(_4800);
    bool _4987 = _4983 || _4985;
    bool _4989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4991 = _4987 || _4989;
    float _4993 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4979);
    float _4995 = exp2(_4977);
    out.m_84.x = _4558;
    out.m_84.y = _4556;
    out.m_84.z = _4560;
    float _4997 = _4922 + _4896;
    float _4999 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4993);
    float _5001 = fma(_4918, -0.5, _4981);
    float _5003 = _4997 * 0.5;
    float _5005 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4999);
    float _5007 = _5005 + _4896;
    out.gl_Position.x = _4922;
    out.gl_Position.y = _4918;
    out.gl_Position.z = _5005;
    out.gl_Position.w = _4896;
    float _5009 = _5007 * 0.5;
    float _5011 = -_4995;
    float _5013 = _5011 + 1.0;
    float _5015 = _5013 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _5003;
    out.m_86.y = _5001;
    out.m_86.z = _5009;
    out.m_86.w = _4896;
    float _5017 = -_5015;
    float _5019 = _5017 + 1.0;
    float _5021 = _4640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5023 = _5009;
    float _5025 = _5001;
    float _5027 = _5003;
    if (!_4991)
    {
        _5023 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5029 = _5023;
    float _5031 = _5029;
    float _5033 = _5029;
    if (!_4991)
    {
        _5025 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5035 = _5025;
    float _5037 = _5035;
    float _5039 = _5035;
    if (!_4991)
    {
        _5027 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5041 = _5027;
    float _5043 = _5015 * _4950;
    float _5045 = _4961 * _5043;
    float _5047 = _4961 * _5019;
    float _5049 = _4975 * _5043;
    float _5051 = fma(_4971, _5045, _4955);
    float _5053 = fma(_4973, _5045, _4957);
    float _5055 = fma(_4961, _5049, _4959);
    out.m_88.x = _5051;
    out.m_88.y = _5053;
    out.m_88.z = _5055;
    out.m_88.w = _5047;
    bool _5057 = !_4991;
    float _5059 = _5041;
    float _5061 = _5041;
    if (!_5057)
    {
        bool _5063 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5065 = isnan(_4800);
        bool _5067 = _5063 || _5065;
        bool _5069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5071 = _5067 || _5069;
        if (!_5071)
        {
            float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5075 = _4800 + _5073;
            float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5079 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5077;
            float _5081 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5089 = 1.0 / _5079;
            float _5091 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5093 = _5091 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5095 = _5075 * _5089;
            float _5097 = precise::clamp(_5095, 0.0, 1.0);
            float _5099 = fma(_5097, _5083, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5101 = fma(_5097, _5087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5103 = fma(_5097, _5093, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5039 = _5101;
            _5033 = _5099;
            _5061 = _5103;
            _5105 = true;
        }
        else
        {
            bool _5107 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5109 = isnan(_4800);
            bool _5111 = _5107 || _5109;
            bool _5113 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5115 = _5111 || _5113;
            if (!_5115)
            {
                _5031 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5117 = _5031;
            _5033 = _5117;
            if (!_5115)
            {
                _5037 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5119 = _5037;
            _5039 = _5119;
            if (!_5115)
            {
                _5059 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5121 = _5059;
            bool _5123 = !_5115;
            _5061 = _5121;
            if (!_5123)
            {
                bool _5125 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5127 = isnan(_4800);
                bool _5129 = _5125 || _5127;
                bool _5131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5133 = _5129 || _5131;
                if (!_5133)
                {
                    float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5137 = _4800 + _5135;
                    float _5139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5141 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5139;
                    float _5143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5145 = _5143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5147 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5151 = 1.0 / _5141;
                    float _5153 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5155 = _5153 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5157 = _5137 * _5151;
                    float _5159 = precise::clamp(_5157, 0.0, 1.0);
                    float _5161 = fma(_5159, _5145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5163 = fma(_5159, _5149, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5165 = fma(_5159, _5155, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5039 = _5163;
                    _5033 = _5161;
                    _5061 = _5165;
                    _5105 = true;
                }
                else
                {
                    _5039 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5033 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5061 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5105 = false;
    float _5167 = _5039;
    float _5169 = _5033;
    float _5171 = _5061;
    float _5173 = _5021 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5175 = _5167 * 0.586610972881317138671875;
    bool _5177 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5173;
    float _5179 = fma(_5169, 0.298911988735198974609375, _5175);
    bool _5181 = _4640 > 0.0;
    bool _5183 = isnan(_4640);
    bool _5185 = _5181 || _5183;
    bool _5187 = isnan(0.0);
    bool _5189 = _5185 || _5187;
    float _5191 = fma(_5171, 0.114477999508380889892578125, _5179);
    float _5193 = -_5191;
    float _5195 = _5193 + _5169;
    float _5197 = -_5191;
    float _5199 = _5197 + _5167;
    float _5201 = -_5191;
    float _5203 = _5201 + _5171;
    float _5205 = fma(_5195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    float _5207 = fma(_5199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    float _5209 = fma(_5203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    bool _5211 = !_5177;
    if (!_5211)
    {
        float _5213 = -_4556;
        float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5217 = -_4558;
        float _5219 = _5217 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5221 = -_4560;
        float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5225 = _5215 * _5215;
        float _5227 = fma(_5219, _5219, _5225);
        float _5229 = fma(_5223, _5223, _5227);
        float _5231 = sqrt(_5229);
        float _5233 = rsqrt(_5229);
        float _5235 = -_5231;
        float _5237 = _5235 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5239 = _5237 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5241 = precise::clamp(_5239, 0.0, 1.0);
        float _5243 = _5219 * _5233;
        float _5245 = _5215 * _5233;
        float _5247 = abs(_5241);
        float _5249 = log2(_5247);
        float _5251 = _5223 * _5233;
        float _5253 = _5243 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5255 = _4108 * _5245;
        float _5257 = -_5245;
        float _5259 = -_5253;
        float _5261 = fma(_5257, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5259);
        float _5263 = fma(_4106, _5243, _5255);
        float _5265 = -_5251;
        float _5267 = fma(_5265, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5261);
        float _5269 = fma(_4110, _5251, _5263);
        float _5271 = precise::clamp(_5269, 0.0, 1.0);
        float _5273 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5275 = _5267 + _5273;
        float _5277 = _5249 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5279 = _5275 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5281 = precise::clamp(_5279, 0.0, 1.0);
        float _5283 = exp2(_5277);
        float _5285 = _5283 * _5281;
        float _5287 = _5271 * _5285;
        float _5289 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5291 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5293 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5289;
        out.m_90.y = _5291;
        out.m_90.z = _5293;
    }
    out.m_70.x = _5205;
    out.m_70.y = _5207;
    out.m_70.z = _5209;
    if (_5189)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5295 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5295;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5105 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_44.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    float _119 = _117;
    if (!_113)
    {
        out.m_47.x = 0.0;
    }
    int _121 = 0;
    if (!_113)
    {
        float _123 = _117 * 5.0;
        _121 = as_type<int>(_123);
    }
    int _125 = _121;
    int _127 = _125;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5352 = as_type<float>(_125);
        out.gl_Position.z = _5352;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _129 = in.m_49.w;
    float _131 = in.m_51.x;
    bool _133 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_129);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = -_129;
    float _145 = _143 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.x = _131;
    if (_141)
    {
        float _147 = float(_109);
        _119 = _147;
    }
    float _149 = _119;
    bool _151 = _145 >= _149;
    bool _153 = !_141;
    bool _155 = _151 || _153;
    float _157 = _149;
    if (_155)
    {
        _157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _159 = _157;
    if (_155)
    {
        out.m_47.x = 0.0;
    }
    if (_155)
    {
        float _161 = _159 * 5.0;
        _127 = as_type<int>(_161);
    }
    int _163 = _127;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5425 = as_type<float>(_163);
        out.gl_Position.z = _5425;
    }
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _167 = int(_165);
    float _169 = in.m_51.y;
    float _171 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _173 = in.m_51.z;
    float _175 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _177 = int(_175);
    float _179 = float(_167);
    float _181 = 1.0 / _179;
    float _183 = float(uint(_177));
    int _185 = ~_177;
    int _187 = _185 + 1;
    int _189 = ~_177;
    int _191 = _189 + 1;
    float _193 = 1.0 / _183;
    float _195 = _145 * _181;
    float _197 = as_type<float>(int(gl_VertexIndex));
    float _199 = trunc(_195);
    int _201 = int(_199);
    int _203 = as_type<int>(_193) + (-2);
    float _205 = float(uint(_201));
    float _207 = as_type<float>(_203) * _205;
    float _209 = trunc(_207);
    float _211 = precise::max(_209, 0.0);
    uint _214 = uint(_211);
    int _216 = _187 * int(_214);
    int _218 = _216 + _201;
    float _220 = float(uint(_218));
    float _222 = as_type<float>(_203) * _220;
    bool _224 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _226 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _228 = _224 || _226;
    bool _230 = isnan(1.0);
    bool _232 = _228 || _230;
    float _234 = trunc(_222);
    float _236 = precise::max(_234, 0.0);
    uint _238 = uint(_236);
    int _240 = as_type<int>(_197) & 1;
    bool _242 = _240 != 0;
    int _244 = as_type<int>(_197) & 2;
    bool _246 = _244 != 0;
    bool _248 = _173 > 0.5;
    int _250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _252 = _250 != 0;
    bool _254 = !_242;
    float _256 = _254 ? (-0.5) : 0.5;
    int _258 = int(_214) + int(_238);
    float _260 = as_type<float>(_214);
    float _262 = _171;
    if (!_232)
    {
        float _264 = _171 * _171;
        float _266 = _264 * 0.5;
        _260 = _266;
    }
    float _268 = _260;
    bool _270 = !_246;
    float _272 = _270 ? (-0.5) : 0.5;
    float _274 = _268;
    if (!_232)
    {
        float _276 = _268 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _274 = _276;
    }
    float _278 = _274;
    bool _280 = !_232;
    float _282 = _278;
    if (!_280)
    {
        float _284 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _286 = log2(_284);
        float _288 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _290 = _288 + 1.0;
        float _292 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _294 = _171 * _286;
        float _296 = 1.0 / _290;
        float _298 = _292 * 0.693147182464599609375;
        float _300 = exp2(_294);
        float _302 = 1.0 / _298;
        float _304 = _300 + (-1.0);
        float _306 = -_304;
        float _308 = fma(_306, _302, _171);
        float _310 = _308 * _296;
        float _312 = _310 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _282 = _312;
    }
    float _314 = _282;
    bool _316 = !_232;
    if (!_316)
    {
        float _318 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _320 = log2(_318);
        float _322 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _324 = _322 + 1.0;
        float _326 = 1.0 / _324;
        float _328 = _171 * _320;
        float _330 = exp2(_328);
        float _332 = -_330;
        float _334 = _332 + 1.0;
        float _336 = _334 * _326;
        _262 = _336;
    }
    float _338 = _262;
    float _340 = 0.0;
    if (!_232)
    {
        float _342 = _145 * _145;
        float _344 = _342 * 0.5;
        _340 = _344;
    }
    float _346 = _340;
    float _348 = 0.0;
    float _350 = _346;
    if (!_232)
    {
        _348 = _145;
    }
    float _352 = _348;
    int _354 = _191 * _258;
    int _356 = _354 + _201;
    bool _358 = !_252;
    int _360 = _358 ? 0 : 1;
    float _362 = _352;
    if (!_232)
    {
        float _364 = _346 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _350 = _364;
    }
    float _366 = _350;
    bool _368 = !_232;
    float _370 = _366;
    if (!_368)
    {
        float _372 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _374 = log2(_372);
        float _376 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _378 = _376 + 1.0;
        float _380 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _382 = _145 * _374;
        float _384 = 1.0 / _378;
        float _386 = _380 * 0.693147182464599609375;
        float _388 = exp2(_382);
        float _390 = 1.0 / _386;
        float _392 = _388 + (-1.0);
        float _394 = -_392;
        float _396 = fma(_394, _390, _145);
        float _398 = _396 * _384;
        float _400 = _398 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _370 = _400;
    }
    float _402 = _370;
    bool _404 = !_232;
    if (!_404)
    {
        float _406 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _408 = log2(_406);
        float _410 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _412 = _410 + 1.0;
        float _414 = 1.0 / _412;
        float _416 = _145 * _408;
        float _418 = exp2(_416);
        float _420 = -_418;
        float _422 = _420 + 1.0;
        float _424 = _422 * _414;
        _362 = _424;
    }
    float _426 = _362;
    bool _428 = _169 > 0.5;
    float _430 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _432 = int(_430);
    float _434 = -_272;
    int _436 = _248 ? as_type<int>(_434) : as_type<int>(_272);
    float _438 = in.m_51.w;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _442 = _440 != 0;
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _446 = _444 != 0;
    int _448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _450 = _448 != 0;
    float _452 = _131 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _454 = -_256;
    int _456 = _428 ? as_type<int>(_454) : as_type<int>(_256);
    float _458 = _173 * 2.0;
    bool _460 = uint(_356) >= uint(_177);
    float _462 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _464 = log2(_462);
    float _466 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    bool _468 = !_446;
    float _470 = _468 ? _256 : as_type<float>(_456);
    float _472 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _474 = !_450;
    float _476 = _474 ? _272 : as_type<float>(_436);
    int _478 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _480 = _478 != 0;
    int _482 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _484 = _482 != 0;
    int _486 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _488 = _486 != 0;
    float _490 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _492 = float(_109);
    bool _494 = !_484;
    int _496 = _494 ? 0 : 1;
    int _498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _500 = _498 != 0;
    float _502 = _145 * _464;
    float _504 = float(_177);
    float _506 = 1.0 / _492;
    float _508 = float(_201);
    bool _510 = !_460;
    int _512 = _510 ? 0 : (-1);
    bool _514 = _508 >= _504;
    bool _516 = isnan(_508);
    bool _518 = _514 || _516;
    bool _520 = isnan(_504);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = _472 * _490;
    int _528 = ~_258;
    int _530 = _528 + _512;
    int _532 = _530 + 1;
    float _534 = exp2(_502);
    bool _536 = _177 == 0;
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_500)
    {
        _538 = 1.0;
    }
    float _540 = _538;
    float _542 = _540;
    if (!_500)
    {
        _542 = 7.345489978790283203125;
    }
    float _544 = _542;
    bool _546 = !_480;
    int _548 = _546 ? 0 : 1;
    float _550 = trunc(_524);
    int _552 = int(_550);
    int _554 = abs(_360);
    float _556 = _544 * _131;
    int _558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _560 = _558 != 0;
    float _562 = floor(_556);
    float _564 = -_534;
    float _566 = _564 + 1.0;
    float _568 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _570 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _568);
    float _572 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _576 = _574 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _578 = -_562;
    float _580 = _556 + _578;
    float _582 = _145 * _506;
    int _584 = _177 + (-1);
    float _586 = 1.0 / _576;
    float _588 = _580 * _504;
    int _590 = _177 * _532;
    int _592 = _590 + _201;
    float _594 = _504 * _582;
    int _596 = ~_552;
    int _598 = _596 + 1;
    int _600 = _598 + 1;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _602;
    bool _606 = !_536;
    int _608 = _606 ? _592 : (-1);
    float _610 = trunc(_588);
    int _612 = int(_610);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _618 = _608 * _600;
    int _620 = abs(_548);
    bool _622 = !_560;
    int _624 = _622 ? 0 : 1;
    float _626 = trunc(_594);
    int _628 = int(_626);
    int _630 = _552 * _584;
    int _632 = _630 + _618;
    int _634 = abs(_496);
    bool _636 = !_488;
    int _638 = _636 ? 0 : 1;
    int _640 = _632 * _634;
    int _642 = abs(_638);
    float _644 = 1.0 / _616;
    int _646 = _612 * _554;
    int _648 = _646 + _201;
    int _650 = abs(_624);
    int _652 = _628 * _620;
    int _654 = _652 + _640;
    int _656 = ~_177;
    int _658 = _656 + 1;
    int _660 = ~_177;
    int _662 = _660 + 1;
    int _664 = _648 * _642;
    int _666 = _664 + _654;
    bool _668 = _177 == 0;
    int _670 = ~_432;
    int _672 = _670 + 1;
    int _674 = _612 * _650;
    int _676 = _674 + _666;
    float _678 = _604 * _644;
    float _680 = _131 + _169;
    float _682 = float(uint(_676));
    float _684 = _680 + (-1.0);
    float _686 = as_type<float>(_203) * _682;
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _688;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _692;
    float _696 = trunc(_686);
    float _698 = precise::max(_696, 0.0);
    uint _700 = uint(_698);
    int _702 = _658 * int(_700);
    int _704 = _702 + _676;
    float _706 = float(uint(_704));
    float _708 = as_type<float>(_203) * _706;
    float _710 = trunc(_708);
    float _712 = precise::max(_710, 0.0);
    uint _714 = uint(_712);
    int _716 = int(_700) + int(_714);
    int _718 = _662 * _716;
    int _720 = _718 + _676;
    float _722 = float(uint(_432));
    bool _724 = uint(_720) >= uint(_177);
    bool _726 = !_724;
    int _728 = _726 ? 0 : (-1);
    int _730 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _732 = _730 != 0;
    int _734 = ~_716;
    int _736 = _734 + _728;
    int _738 = _736 + 1;
    bool _740 = !_732;
    int _742 = _740 ? 0 : 1;
    int _744 = _177 * _738;
    int _746 = _744 + _676;
    bool _748 = !_668;
    int _750 = _748 ? _746 : (-1);
    int _752 = _750 & 3;
    bool _754 = _752 != 0;
    int _756 = _750 & 3;
    bool _758 = _756 != 0;
    int _760 = _754 ? 0 : 1;
    bool _762 = uint(_756) >= 2u;
    int _764 = ~_760;
    int _766 = _764 + 1;
    int _768 = _766 + 1;
    int _770 = _762 ? 0 : 1;
    bool _772 = uint(_756) > 1u;
    int _774 = ~_770;
    int _776 = _774 + 1;
    int _778 = _776 + 1;
    int _780 = _768;
    int _782 = _778;
    if (!_772)
    {
        int _784 = ~_760;
        int _786 = _784 + 1;
        _780 = _786;
    }
    int _788 = _780;
    float _790 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _792 = int(_790);
    bool _794 = _756 != 3;
    int _796 = abs(_788);
    if (_794)
    {
        int _798 = ~_770;
        int _800 = _798 + 1;
        _782 = _800;
    }
    int _802 = _782;
    float _804 = float(_792);
    float _806 = 1.0 / _722;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _810 = _808 != 0;
    bool _812 = !_810;
    int _814 = _812 ? 0 : 1;
    bool _816 = _438 > 0.5;
    float _818 = 1.0 / _804;
    float _820 = fma(_438, 2.0, -1.0);
    float _822 = -_272;
    int _824 = _816 ? as_type<int>(_822) : as_type<int>(_272);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _828 = _826 != 0;
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _832 = _830 != 0;
    bool _834 = !_442;
    float _836 = _834 ? _272 : as_type<float>(_824);
    int _838 = as_type<int>(_806) + (-2);
    bool _840 = !_828;
    int _842 = _840 ? 0 : 1;
    bool _844 = !_832;
    int _846 = _844 ? 0 : 1;
    int _848 = abs(_842);
    float _850 = _145 * _818;
    int _852 = abs(_846);
    float _854 = trunc(_850);
    int _856 = int(_854);
    int _858 = ~_432;
    int _860 = _858 + 1;
    float _862 = float(uint(_856));
    float _864 = as_type<float>(_838) * _862;
    float _866 = trunc(_864);
    float _868 = precise::max(_866, 0.0);
    uint _870 = uint(_868);
    int _872 = _672 * int(_870);
    int _874 = _872 + _856;
    float _876 = float(uint(_874));
    float _878 = as_type<float>(_838) * _876;
    float _880 = trunc(_878);
    float _882 = precise::max(_880, 0.0);
    uint _884 = uint(_882);
    int _886 = int(_870) + int(_884);
    int _888 = ~_177;
    int _890 = _888 + 1;
    int _892 = _860 * _886;
    int _894 = _892 + _856;
    bool _896 = uint(_894) >= uint(_432);
    float _898 = float(uint(_648));
    bool _900 = !_896;
    int _902 = _900 ? 0 : (-1);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _906 = _904 != 0;
    float _908 = as_type<float>(_203) * _898;
    int _910 = ~_886;
    int _912 = _910 + _902;
    int _914 = _912 + 1;
    bool _916 = !_906;
    int _918 = _916 ? 0 : 1;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _922 = _920 != 0;
    int _924 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _926 = _924 != 0;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _934 = _932 != 0;
    float _936 = trunc(_908);
    float _938 = precise::max(_936, 0.0);
    uint _940 = uint(_938);
    int _942 = _432 * _914;
    int _944 = _942 + _856;
    int _946 = abs(_918);
    bool _948 = !_922;
    int _950 = _948 ? 0 : 1;
    bool _952 = !_926;
    int _954 = _952 ? 0 : 1;
    bool _956 = !_930;
    int _958 = _956 ? 0 : 1;
    int _960 = abs(_954);
    int _962 = _890 * int(_940);
    int _964 = _962 + _648;
    float _966 = float(uint(_964));
    int _968 = ~_177;
    int _970 = _968 + 1;
    float _972 = as_type<float>(_203) * _966;
    float _974 = trunc(_972);
    float _976 = precise::max(_974, 0.0);
    uint _978 = uint(_976);
    float _980 = float(_856);
    int _982 = int(_940) + int(_978);
    float _984 = as_type<float>(_940);
    float _986 = as_type<float>(_982);
    float _988 = as_type<float>(_946);
    if (_500)
    {
        _984 = 1.0;
    }
    float _990 = _984;
    float _992 = _990;
    if (!_500)
    {
        _992 = 1.2345600128173828125;
    }
    float _994 = _992;
    int _996 = _970 * _982;
    int _998 = _996 + _648;
    float _1000 = float(_432);
    bool _1002 = uint(_998) >= uint(_177);
    float _1004 = _1000 * _582;
    float _1006 = as_type<float>(_998);
    if (_500)
    {
        _1006 = _131;
    }
    float _1008 = _1006;
    float _1010 = _1008;
    if (!_500)
    {
        _1010 = _169;
    }
    float _1012 = _1010;
    bool _1014 = _980 >= _1000;
    bool _1016 = isnan(_980);
    bool _1018 = _1014 || _1016;
    bool _1020 = isnan(_1000);
    bool _1022 = _1018 || _1020;
    float _1024 = float(_1022);
    float _1026 = trunc(_1004);
    int _1028 = int(_1026);
    bool _1030 = !_1002;
    int _1032 = _1030 ? 0 : (-1);
    float _1034 = _994 * _1012;
    bool _1036 = _432 == 0;
    int _1038 = ~_982;
    int _1040 = _1038 + _1032;
    int _1042 = _1040 + 1;
    float _1044 = floor(_1034);
    float _1046 = trunc(_1024);
    int _1048 = int(_1046);
    float _1050 = -_1044;
    float _1052 = _1034 + _1050;
    bool _1054 = !_1036;
    int _1056 = _1054 ? _944 : (-1);
    float _1058 = _1052 * _1000;
    int _1060 = _432 + (-1);
    bool _1062 = !_934;
    int _1064 = _1062 ? 0 : 1;
    float _1066 = -_452;
    float _1068 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    int _1070 = ~_1048;
    int _1072 = _1070 + 1;
    int _1074 = _1072 + 1;
    float _1076 = trunc(_1058);
    int _1078 = int(_1076);
    float _1080 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _1082 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1084 = isnan(0.0);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1090 = _1086 || _1088;
    int _1092 = _1056 * _1074;
    int _1094 = abs(_958);
    float _1096 = _1090 ? _566 : 0.0;
    int _1098 = _1048 * _1060;
    int _1100 = _1098 + _1092;
    int _1102 = abs(_950);
    int _1104 = _1100 * _960;
    int _1106 = abs(_1064);
    int _1108 = _1078 * _946;
    int _1110 = _1108 + _856;
    int _1112 = _1028 * _1102;
    int _1114 = _1112 + _1104;
    int _1116 = ~_432;
    int _1118 = _1116 + 1;
    int _1120 = _177 * _1042;
    int _1122 = _1120 + _648;
    int _1124 = _1110 * _1094;
    int _1126 = _1124 + _1114;
    bool _1128 = !_668;
    int _1130 = _1128 ? _1122 : (-1);
    int _1132 = _1078 * _1106;
    int _1134 = _1132 + _1126;
    int _1136 = ~_432;
    int _1138 = _1136 + 1;
    float _1140 = float(uint(_1134));
    float _1142 = as_type<float>(_838) * _1140;
    float _1144 = trunc(_1142);
    float _1146 = precise::max(_1144, 0.0);
    uint _1148 = uint(_1146);
    int _1150 = _1138 * int(_1148);
    int _1152 = _1150 + _1134;
    float _1154 = float(uint(_1152));
    float _1156 = as_type<float>(_838) * _1154;
    float _1158 = trunc(_1156);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = ~_432;
    int _1166 = _1164 + 1;
    int _1168 = int(_1148) + int(_1162);
    float _1170 = float(uint(_1110));
    int _1172 = _1118 * _1168;
    int _1174 = _1172 + _1134;
    float _1176 = as_type<float>(_838) * _1170;
    int _1178 = as_type<int>(_1170);
    float _1180 = as_type<float>(_1102);
    float _1182 = _1080;
    if (_500)
    {
        _1178 = 0;
    }
    int _1184 = _1178;
    bool _1186 = uint(_1174) >= uint(_432);
    float _1188 = trunc(_1176);
    float _1190 = precise::max(_1188, 0.0);
    uint _1192 = uint(_1190);
    int _1194 = _1184;
    if (!_500)
    {
        _1194 = 1;
    }
    int _1196 = _1194;
    bool _1198 = !_1186;
    int _1200 = _1198 ? 0 : (-1);
    int _1202 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1204 = _1202 != 0;
    int _1206 = ~_1168;
    int _1208 = _1206 + _1200;
    int _1210 = _1208 + 1;
    int _1212 = _1200;
    if (_500)
    {
        _1212 = 0;
    }
    int _1214 = _1212;
    float _1216 = in.m_58.w;
    int _1218 = _1214;
    if (!_500)
    {
        _1218 = 2;
    }
    int _1220 = _1218;
    int _1222 = _432 * _1210;
    int _1224 = _1222 + _1134;
    int _1226 = _1166 * int(_1192);
    int _1228 = _1226 + _1110;
    bool _1230 = !_1036;
    int _1232 = _1230 ? _1224 : (-1);
    bool _1234 = !_1204;
    int _1236 = _1234 ? 0 : 1;
    int _1238 = _1232 & 3;
    bool _1240 = _1238 != 0;
    int _1242 = _1232 & 3;
    bool _1244 = _1242 != 0;
    float _1246 = float(uint(_1228));
    int _1248 = _1240 ? 0 : 1;
    bool _1250 = uint(_1242) > 1u;
    float _1252 = as_type<float>(_838) * _1246;
    int _1254 = ~_1248;
    int _1256 = _1254 + 1;
    int _1258 = _1256 + 1;
    int _1260 = ~_432;
    int _1262 = _1260 + 1;
    float _1264 = trunc(_1252);
    float _1266 = precise::max(_1264, 0.0);
    uint _1268 = uint(_1266);
    bool _1270 = !_1244;
    int _1272 = _1270 ? 0 : 1;
    bool _1274 = _1242 != 3;
    int _1276 = _1258;
    if (!_1250)
    {
        int _1278 = ~_1248;
        int _1280 = _1278 + 1;
        _1276 = _1280;
    }
    int _1282 = _1276;
    bool _1284 = uint(_1242) >= 2u;
    int _1286 = _1284 ? 0 : 1;
    bool _1288 = _1242 != 3;
    int _1290 = int(_1192) + int(_1268);
    float _1292 = _1068 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    int _1294 = ~_1286;
    int _1296 = _1294 + 1;
    int _1298 = _1296 + 1;
    float _1300 = 1.0 / _1292;
    int _1302 = _1262 * _1290;
    int _1304 = _1302 + _1110;
    int _1306 = _1298;
    if (_1288)
    {
        int _1308 = ~_1286;
        int _1310 = _1308 + 1;
        _1306 = _1310;
    }
    int _1312 = _1306;
    bool _1314 = uint(_1304) >= uint(_432);
    int _1316 = abs(_1312);
    bool _1318 = !_1314;
    int _1320 = _1318 ? 0 : (-1);
    bool _1322 = _1196 != 1;
    float _1324 = in.m_49.x;
    float _1326 = in.m_49.y;
    float _1328 = in.m_49.z;
    int _1330 = ~_1290;
    int _1332 = _1330 + _1320;
    int _1334 = _1332 + 1;
    float _1336 = _131 * 2.0;
    int _1338 = _432 * _1334;
    int _1340 = _1338 + _1110;
    float _1342 = floor(_1336);
    if (!_1322)
    {
        _1180 = _169;
    }
    float _1344 = _1180;
    float _1346 = _1344;
    if (!_1322)
    {
        _986 = _173;
    }
    float _1348 = _986;
    float _1350 = 0.0;
    float _1352 = _1348;
    if (!_1322)
    {
        _1350 = _1344;
    }
    float _1354 = _1350;
    float _1356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _1358 = 0.0;
    float _1360 = _1354;
    if (!_1322)
    {
        _1358 = _173;
    }
    float _1362 = _1358;
    float _1364 = _1362;
    if (_1322)
    {
        _1360 = _131;
    }
    float _1366 = _1360;
    if (_1322)
    {
        _1346 = _131;
    }
    float _1368 = _1346;
    if (_1322)
    {
        _1352 = _169;
    }
    float _1370 = _1352;
    float _1372 = fma(_338, _1328, _1080);
    float _1374 = _1328;
    float _1376 = _1328;
    if (_1322)
    {
        _1364 = _169;
    }
    float _1378 = _1364;
    bool _1380 = _1220 != 2;
    float _1382 = in.m_44.x;
    float _1384 = in.m_44.y;
    float _1386 = in.m_44.z;
    bool _1388 = _1342 >= 0.0;
    bool _1390 = isnan(_1342);
    bool _1392 = _1388 || _1390;
    bool _1394 = isnan(0.0);
    bool _1396 = _1392 || _1394;
    float _1398 = _466 * _1356;
    bool _1400 = !_1274;
    int _1402 = _1400 ? 0 : (-1);
    float _1404 = 0.0;
    if (_1380)
    {
        _1404 = _131;
    }
    float _1406 = _1404;
    float _1408 = _1406;
    if (_1380)
    {
        _988 = _169;
    }
    float _1410 = _988;
    float _1412 = _1410;
    if (!_1380)
    {
        _1408 = _173;
    }
    float _1414 = _1408;
    if (!_1380)
    {
        _1412 = _131;
    }
    float _1416 = _1412;
    bool _1418 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1420 = fma(_1372, _1216, _1386);
    float _1422 = -_1420;
    float _1424 = precise::max(0.0, _1422);
    float _1426 = as_type<float>(_1042);
    if (_1418)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1426 = _1428;
    }
    float _1430 = _1426;
    float _1432 = precise::min(_1292, _1424);
    float _1434 = _1432 * _1300;
    float _1436 = _1432;
    if (_1418)
    {
        float _1438 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1436 = _1438;
    }
    float _1440 = _1436;
    float _1442 = _1440;
    if (_1418)
    {
        float _1444 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1434);
        _1442 = _1444;
    }
    float _1446 = _1442;
    float _1448 = 0.0;
    float _1450 = _1446;
    if (!_1418)
    {
        _1448 = _1434;
    }
    float _1452 = _1448;
    out.m_60.x = _1434;
    float _1454 = _1452;
    if (_1418)
    {
        float _1456 = _1446 * _1430;
        _1450 = _1456;
    }
    float _1458 = _1450;
    float _1460 = _1430;
    if (_1418)
    {
        float _1462 = floor(_1458);
        _1460 = _1462;
    }
    float _1464 = _1460;
    if (_1418)
    {
        float _1466 = -_1464;
        float _1468 = _1458 + _1466;
        _1454 = _1468;
    }
    float _1470 = _1454;
    bool _1472 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1474 = floor(_458);
    bool _1476 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1478 = isnan(_1470);
    bool _1480 = _1476 || _1478;
    bool _1482 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1484 = _1480 || _1482;
    float _1486 = float(_1484);
    float _1488 = _458 + (-1.0);
    float _1490 = _1292;
    if (_1472)
    {
        float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1490 = _1492;
    }
    float _1494 = _1490;
    if (_1472)
    {
        float _1496 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1182 = _1496;
    }
    float _1498 = _1182;
    float _1500 = 0.0;
    float _1502 = _1498;
    if (!_1472)
    {
        _1500 = _1434;
    }
    float _1504 = _1500;
    float _1506 = _1504;
    if (_1472)
    {
        float _1508 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1434);
        _1502 = _1508;
    }
    float _1510 = _1502;
    float _1512 = _1510;
    if (_1472)
    {
        float _1514 = _1510 * _1494;
        _1512 = _1514;
    }
    float _1516 = _1512;
    float _1518 = _1494;
    if (_1472)
    {
        float _1520 = floor(_1516);
        _1518 = _1520;
    }
    float _1522 = _1518;
    if (_1472)
    {
        float _1524 = -_1522;
        float _1526 = _1516 + _1524;
        _1506 = _1526;
    }
    float _1528 = _1506;
    bool _1530 = _1474 > 0.0;
    bool _1532 = !_1036;
    int _1534 = _1532 ? _1340 : (-1);
    bool _1536 = _1474 >= 0.0;
    bool _1538 = isnan(_1474);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan(0.0);
    bool _1544 = _1540 || _1542;
    bool _1546 = !_758;
    int _1548 = _1546 ? 0 : 1;
    int _1550 = _1544 ? 0 : 1;
    bool _1552 = _1342 > 0.0;
    float _1554 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1556 = ~_1550;
    int _1558 = _1556 + 1;
    int _1560 = _1558 + 1;
    int _1562 = _1560;
    if (!_1530)
    {
        int _1564 = ~_1550;
        int _1566 = _1564 + 1;
        _1562 = _1566;
    }
    int _1568 = _1562;
    bool _1570 = _756 != 3;
    int _1572 = _1396 ? 0 : 1;
    int _1574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1576 = _1574 != 0;
    int _1578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1580 = _1578 != 0;
    int _1582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1584 = _1582 != 0;
    float _1586 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1588 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1590 = _1588 != 0;
    int _1592 = ~_1572;
    int _1594 = _1592 + 1;
    int _1596 = _1594 + 1;
    int _1598 = _1596;
    if (!_1552)
    {
        int _1600 = ~_1572;
        int _1602 = _1600 + 1;
        _1598 = _1602;
    }
    int _1604 = _1598;
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1608 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1610 = _1608 != 0;
    float _1612 = fma(_1554, -2.0, _1606);
    float _1614 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1616 = !_1570;
    int _1618 = _1616 ? 0 : (-1);
    float _1620 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1612);
    int _1622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1624 = _1622 != 0;
    float _1626 = -_1614;
    float _1628 = fma(_1586, 2.0, _1626);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1634 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1636 = _1634 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1638 = 1.0 / _1632;
    float _1640 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1642 = _1640 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1644 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1646 = isnan(_1528);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1660 = !_1576;
    int _1662 = _1660 ? 0 : 1;
    float _1664 = 1.0 / _1636;
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1668 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    bool _1670 = !_1580;
    int _1672 = _1670 ? 0 : 1;
    bool _1674 = _173 > 0.5;
    int _1676 = abs(_1672);
    float _1678 = 1.0 / _1642;
    float _1680 = -_1666;
    float _1682 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1680);
    float _1684 = -_1668;
    float _1686 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1684);
    float _1688 = -_572;
    float _1690 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1688);
    float _1692 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1694 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1692;
    float _1696 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1698 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1696;
    float _1700 = 1.0 / _1658;
    float _1702 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1704 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1706 = _1704 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1708 = _1698 * _1638;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1712 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1710;
    float _1714 = -_1702;
    float _1716 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1714);
    float _1718 = _1706 * _1664;
    float _1720 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1722 = _1720 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1724 = _169 * 2.0;
    float _1726 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1728 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1730 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1732 = _1730 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1734 = floor(_1724);
    float _1736 = -_1726;
    float _1738 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1736);
    float _1740 = -_1728;
    float _1742 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1740);
    float _1744 = _1694 * _1678;
    float _1746 = _1732 * _1700;
    float _1748 = _1712 * _586;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1754 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _526);
    float _1756 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1760 = 1.0 + _1758;
    float _1762 = 1.0 / _1752;
    float _1764 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1766 = -_1756;
    float _1768 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1766);
    float _1770 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    bool _1772 = _1734 >= 0.0;
    bool _1774 = isnan(_1734);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan(0.0);
    bool _1780 = _1776 || _1778;
    float _1782 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1784 = _1716 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1786 = _1742 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    int _1788 = _1780 ? 0 : 1;
    float _1790 = _131 + _173;
    bool _1792 = _1734 > 0.0;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1796 = 1.0 / _1760;
    float _1798 = _1790 + (-1.0);
    float _1800 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1802 = _173 + _169;
    float _1804 = _1722 * _1762;
    float _1806 = _1794 * 0.15915493667125701904296875;
    float _1808 = _1802 + (-1.0);
    float _1810 = floor(_1754);
    float _1812 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1814 = 1.0 + _1812;
    float _1816 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1818 = -_1764;
    float _1820 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1818);
    float _1822 = -_1770;
    float _1824 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1822);
    float _1826 = -_1782;
    float _1828 = fma(_1716, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1826);
    float _1830 = -_1784;
    float _1832 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1830);
    float _1834 = fma(_1808, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1836 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1398);
    int _1838 = ~_1788;
    int _1840 = _1838 + 1;
    int _1842 = _1840 + 1;
    float _1844 = -_1786;
    float _1846 = fma(_1738, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1844);
    int _1848 = _1842;
    if (!_1792)
    {
        int _1850 = ~_1788;
        int _1852 = _1850 + 1;
        _1848 = _1852;
    }
    int _1854 = _1848;
    float _1856 = _1814 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1858 = floor(_1836);
    float _1860 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1862 = 1.0 + _1860;
    float _1864 = -_1810;
    float _1866 = _1754 + _1864;
    float _1868 = _1754 * 6.283185482025146484375;
    float _1870 = _1096 * _1796;
    float _1872 = _1856 * _1862;
    float _1874 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1832);
    float _1876 = _1868 * 0.15915493667125701904296875;
    float _1878 = _1806 * 6.283185482025146484375;
    float _1880 = cos(_1878);
    float _1882 = _1686 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1884 = -_1872;
    float _1886 = _1856 + _1884;
    float _1888 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1824);
    bool _1890 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1892 = isnan(1.0);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1898 = _1894 || _1896;
    float _1900 = fma(_1886, _169, _1872);
    float _1902 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1846);
    float _1904 = _1806 * 6.283185482025146484375;
    float _1906 = sin(_1904);
    float _1908 = -_1858;
    float _1910 = _1836 + _1908;
    float _1912 = -_1882;
    float _1914 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1912);
    float _1916 = _1836 * 6.283185482025146484375;
    float _1918 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1768);
    float _1920 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1914);
    float _1922 = _1876 * 6.283185482025146484375;
    float _1924 = cos(_1922);
    float _1926 = _1880 * _1880;
    float _1928 = _1916 * 0.15915493667125701904296875;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1932 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1828);
    float _1934 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1820);
    float _1936 = fma(_1906, _1906, _1926);
    bool _1938 = _1866 < 0.5;
    float _1940 = float(_1938);
    float _1942 = _1928 * 6.283185482025146484375;
    float _1944 = cos(_1942);
    float _1946 = -_1866;
    float _1948 = fma(_1946, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1950 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1952 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1950;
    float _1954 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1956 = _1954 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1958 = -_1940;
    float _1960 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1962 = float(_1676);
    float _1964 = fma(_1924, 0.5, 0.5);
    bool _1966 = !_1584;
    int _1968 = _1966 ? 0 : 1;
    float _1970 = rsqrt(_1936);
    bool _1972 = _1910 < 0.5;
    float _1974 = float(_1972);
    float _1976 = -_1964;
    float _1978 = fma(_1976, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1980 = _1902 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1982 = _1414 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1984 = -_1910;
    float _1986 = fma(_1984, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1988 = -_1974;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1992 = -_1980;
    float _1994 = fma(_1874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1992);
    float _1996 = -_1930;
    float _1998 = fma(_1982, 2.0, _1996);
    float _2000 = fma(_1944, 0.5, 0.5);
    float _2002 = fma(_1888, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1994);
    float _2004 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2006 = -_2000;
    float _2008 = fma(_2006, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2012 = _1906 * _1970;
    float _2014 = _1880 * _1970;
    float _2016 = fma(_338, _1324, _2004);
    float _2018 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2022 = fma(_338, _1326, _2018);
    float _2024 = _1366 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2028 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2020);
    float _2030 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2032 = -_1920;
    float _2034 = fma(_2032, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2002);
    float _2036 = -_2026;
    float _2038 = fma(_2024, 2.0, _2036);
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2044 = _1416 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2046 = fma(_2016, _1216, _1382);
    float _2048 = fma(_2022, _1216, _1384);
    float _2050 = fma(_2030, -2.0, _2040);
    float _2052 = fma(_2044, -2.0, _2042);
    float _2054 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2056 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2058 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2060 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2062 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2010);
    float _2064 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2066 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2068 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2070 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2072 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2074 = _2056 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2076 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2078 = _2060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = _2048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2082 = _2068 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2084 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2086 = _2072 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2088 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2064);
    float _2090 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2066);
    out.m_62.x = _2074;
    out.m_62.y = _2076;
    out.m_62.z = _2078;
    float _2092 = fma(_2046, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2080);
    float _2094 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    out.m_64.x = _2082;
    out.m_64.y = _2084;
    out.m_64.z = _2086;
    float _2098 = -_145;
    float _2100 = fma(_2098, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1998);
    float _2102 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2088);
    float _2104 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2090);
    float _2106 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2108 = fma(_1420, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2092);
    float _2110 = float(_1854);
    float _2112 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2114 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _2116 = _470 + 0.5;
    float _2118 = fma(_426, _1324, _2106);
    float _2120 = fma(_426, _1326, _2112);
    float _2122 = fma(_426, _1328, _2114);
    float _2124 = fma(_2094, _2116, _2100);
    float _2126 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2052);
    float _2128 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2130 = _2096 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2134 = _476 + (-0.5);
    float _2136 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2128);
    float _2138 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2140 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _2138;
    float _2142 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2132);
    float _2144 = -_2130;
    float _2146 = -_2126;
    float _2148 = fma(_2144, _2134, _2146);
    float _2150 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2136);
    float _2152 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2154 = _2152 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2156 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2142);
    float _2158 = -_2150;
    float _2160 = _2158 + 1.0;
    float _2162 = -_2120;
    float _2164 = _2022 + _2162;
    float _2166 = -_2156;
    float _2168 = _2166 + 1.0;
    float _2170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2172 = -_2160;
    float _2174 = fma(_470, _2172, _2124);
    float _2176 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2178 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _2176;
    float _2180 = fma(_476, _2168, _2148);
    float _2182 = -_2118;
    float _2184 = _2016 + _2182;
    float _2186 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2188 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2190 = _2164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    out.m_66.x = _2174;
    out.m_66.y = _2180;
    float _2192 = 1.0 / _2178;
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2186);
    float _2196 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2188);
    float _2198 = fma(_2184, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2190);
    float _2200 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2202 = _2200 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2204 = _2108 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2206 = -_145;
    float _2208 = fma(_2206, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2038);
    float _2210 = 1.0 / _2140;
    int _2212 = abs(_742);
    float _2214 = _1068 * _1434;
    float _2216 = float(_2212);
    float _2218 = float(_848);
    float _2220 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[193].y, _570);
    float _2222 = precise::max(0.0, _2214);
    float _2224 = 1.0 / _2154;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2228 = _1470 + _2226;
    float _2230 = abs(_1948);
    float _2232 = _2218 * _2230;
    float _2234 = abs(_1986);
    float _2236 = _2218 * _2234;
    float _2238 = precise::min(_2222, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2240 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2242 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _2240;
    float _2244 = float(_852);
    float _2246 = fma(_2216, _1978, _2232);
    float _2248 = fma(_2216, _2008, _2236);
    float _2250 = _2238 * _2170;
    float _2252 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2254 = _1470 + _2252;
    float _2256 = abs(_1960);
    float _2258 = fma(_2244, _2256, _2246);
    float _2260 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2262 = _1470 + _2260;
    float _2264 = 1.0 / _2202;
    float _2266 = fma(_1744, _2254, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2270 = _1470 + _2268;
    float _2272 = fma(_1746, _2262, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2274 = _2220 * 0.15915493667125701904296875;
    float _2276 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2278 = _1470 + _2276;
    float _2280 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2282 = _1470 + _2280;
    float _2284 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2286 = _2284 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2288 = 1.0 / _2242;
    float _2290 = fma(_1708, _2228, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2292 = fma(_1748, _2278, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2294 = fma(_1804, _2270, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2296 = fma(_1718, _2282, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2298 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2300 = _1528 + _2298;
    float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2304 = _1528 + _2302;
    float _2306 = _2274 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = abs(_1990);
    float _2312 = fma(_2244, _2310, _2248);
    float _2314 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2316 = _1470 + _2314;
    float _2318 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2320 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _2318;
    float _2322 = _2300 * _2210;
    float _2324 = _2304 * _2224;
    float _2326 = fma(_678, _2316, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2328 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2330 = _1528 + _2328;
    float _2332 = 1.0 / _2286;
    float _2334 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2336 = _1528 + _2334;
    float _2338 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2340 = _1528 + _2338;
    float _2342 = _2330 * _2264;
    float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _2346 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _2344;
    float _2348 = _2336 * _2288;
    float _2350 = _2340 * _2192;
    float _2352 = -_1900;
    float _2354 = _2012 * _2352;
    float _2356 = _2308 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2358 = 1.0 / _2320;
    float _2360 = -_1900;
    float _2362 = _2014 * _2360;
    float _2364 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _2366 = _2364 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2368 = _2012 * _2356;
    float _2370 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2372 = _1528 + _2370;
    float _2374 = fma(_1068, _2362, _2368);
    float _2376 = fma(_1956, _2324, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2378 = fma(_2366, _2324, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    float _2380 = -_2356;
    float _2382 = _2014 * _2380;
    float _2384 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2384;
    bool _2388 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2390 = isnan(_1470);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2396 = _2392 || _2394;
    float _2398 = float(_2396);
    float _2400 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2402 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _2400;
    float _2404 = _2372 * _2332;
    float _2406 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2408 = _2406 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2410 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _2412 = _2410 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    bool _2414 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2416 = isnan(_1470);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2422 = _2418 || _2420;
    float _2424 = float(_2422);
    float _2426 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2428 = _1528 + _2426;
    float _2430 = fma(_1068, _2354, _2382);
    float _2432 = fma(_1952, _2322, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2434 = fma(_2346, _2322, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _2436 = fma(_2386, _2350, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2438 = fma(_2402, _2350, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _2440 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2442 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2440;
    float _2444 = -_2398;
    float _2446 = _2444 + 1.0;
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _2448;
    float _2452 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2454 = _2452 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2456 = fma(_2408, _2342, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2458 = fma(_2412, _2342, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _2460 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _2462 = _2460 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    bool _2464 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2466 = isnan(_1470);
    bool _2468 = _2464 || _2466;
    bool _2470 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2472 = _2468 || _2470;
    float _2474 = float(_2472);
    float _2476 = _2428 * _2358;
    float _2478 = -_2424;
    float _2480 = _2478 + 1.0;
    float _2482 = _2424 * _2446;
    bool _2484 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2486 = isnan(_1470);
    bool _2488 = _2484 || _2486;
    bool _2490 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2492 = _2488 || _2490;
    float _2494 = float(_2492);
    float _2496 = fma(_2454, _2404, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2498 = fma(_2462, _2404, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    float _2500 = _2474 * _2480;
    float _2502 = -_2474;
    float _2504 = _2502 + 1.0;
    bool _2506 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2508 = isnan(_1470);
    bool _2510 = _2506 || _2508;
    bool _2512 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2514 = _2510 || _2512;
    float _2516 = float(_2514);
    float _2518 = -_2494;
    float _2520 = _2518 + 1.0;
    float _2522 = fma(_2442, _2348, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2524 = _2494 * _2504;
    bool _2526 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2528 = isnan(_1470);
    bool _2530 = _2526 || _2528;
    bool _2532 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2534 = _2530 || _2532;
    float _2536 = float(_2534);
    float _2538 = _2516 * _2520;
    float _2540 = -_2516;
    float _2542 = _2540 + 1.0;
    bool _2544 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2546 = isnan(_1528);
    bool _2548 = _2544 || _2546;
    bool _2550 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2552 = _2548 || _2550;
    float _2554 = float(_2552);
    float _2556 = fma(_2450, _2348, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    bool _2558 = _1470 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2560 = isnan(_1470);
    bool _2562 = _2558 || _2560;
    bool _2564 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2566 = _2562 || _2564;
    float _2568 = float(_2566);
    float _2570 = _2536 * _2542;
    float _2572 = -_2536;
    float _2574 = _2572 + 1.0;
    bool _2576 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2578 = isnan(_1528);
    bool _2580 = _2576 || _2578;
    bool _2582 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2584 = _2580 || _2582;
    float _2586 = float(_2584);
    float _2588 = -_2554;
    float _2590 = _2588 + 1.0;
    float _2592 = -_2568;
    float _2594 = _2592 + 1.0;
    float _2596 = _2568 * _2574;
    float _2598 = fma(_690, _2476, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2600 = _2586 * _2590;
    float _2602 = -_2586;
    float _2604 = _2602 + 1.0;
    bool _2606 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2608 = isnan(_1528);
    bool _2610 = _2606 || _2608;
    bool _2612 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2614 = _2610 || _2612;
    float _2616 = float(_2614);
    float _2618 = abs(_2250);
    float _2620 = log2(_2618);
    float _2622 = fma(_694, _2476, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    float _2624 = _1486 * _2594;
    float _2626 = -_1654;
    float _2628 = _2626 + 1.0;
    float _2630 = _1654 * _2604;
    bool _2632 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2634 = isnan(_1528);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = _2266 * _2624;
    float _2646 = -_2616;
    float _2648 = _2646 + 1.0;
    float _2650 = _2616 * _2628;
    bool _2652 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2654 = isnan(_1528);
    bool _2656 = _2652 || _2654;
    bool _2658 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2660 = _2656 || _2658;
    float _2662 = float(_2660);
    float _2664 = _1434 * _2374;
    float _2666 = float(_1604);
    float _2668 = -_2642;
    float _2670 = _2668 + 1.0;
    float _2672 = float(_1568);
    float _2674 = _2642 * _2648;
    bool _2676 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2678 = isnan(_1528);
    bool _2680 = _2676 || _2678;
    bool _2682 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2684 = _2680 || _2682;
    float _2686 = float(_2684);
    float _2688 = _2620 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2690 = _1528 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2692 = isnan(_1528);
    bool _2694 = _2690 || _2692;
    bool _2696 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2698 = _2694 || _2696;
    float _2700 = float(_2698);
    float _2702 = _1962 * _2666;
    int _2704 = abs(_1662);
    float _2706 = -_2662;
    float _2708 = _2706 + 1.0;
    float _2710 = exp2(_2688);
    float _2712 = _2662 * _2670;
    int _2714 = abs(_1968);
    float _2716 = _2700 * _2708;
    float _2718 = -_2700;
    float _2720 = _2718 + 1.0;
    float _2722 = _2702 * (-2.0);
    float _2724 = -_1486;
    float _2726 = _2724 + 1.0;
    float _2728 = _2686 * _2720;
    float _2730 = float(_2704);
    float _2732 = -_2686;
    float _2734 = _2732 + 1.0;
    float _2736 = fma(_2726, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2644);
    float _2738 = _2434 * _2728;
    float _2740 = _2432 * _2728;
    float _2742 = in.m_68.x;
    float _2744 = in.m_68.y;
    float _2746 = in.m_68.z;
    float _2748 = float(_2714);
    float _2750 = _2104 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2752 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2754 = _2730 * _2672;
    float _2756 = fma(_2734, (*spvDescriptorSet0.vp_c9)._m0[175].z, _2738);
    float _2758 = _2748 * _2110;
    float _2760 = _1434 * _2430;
    float _2762 = -_2014;
    float _2764 = fma(_2762, _2752, _2664);
    float _2766 = fma(_2734, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2740);
    float _2768 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2750);
    float _2770 = -_2012;
    float _2772 = fma(_2770, _2752, _2760);
    float _2774 = fma(_820, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2764);
    float _2776 = fma(_2376, _2716, _2766);
    float _2778 = _2754 * (-2.0);
    float _2780 = fma(_1488, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2772);
    float _2782 = _2102 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2784 = fma(_1800, _2778, _1800);
    float _2786 = fma(_2378, _2716, _2756);
    float _2788 = _2774 + _2204;
    float _2790 = _2780 + _2782;
    float _2792 = _2758 * (-2.0);
    float _2794 = fma(_2436, _2712, _2776);
    float _2796 = fma(_2778, _2742, _2742);
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2800 = -_2768;
    float _2802 = _2800 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    bool _2804 = !_1898;
    float _2806 = _2804 ? _145 : _1870;
    float _2808 = -_2790;
    float _2810 = _2808 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2812 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2798);
    float _2814 = _2802 * _2802;
    float _2816 = -_2788;
    float _2818 = _2816 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2820 = fma(_1816, _2792, _1816);
    float _2822 = fma(_2792, _2746, _2746);
    float _2824 = fma(_2810, _2810, _2814);
    bool _2826 = _131 > 0.5;
    float _2828 = _173 + (-0.5);
    float _2830 = _131 + (-0.5);
    float _2832 = fma(_2818, _2818, _2824);
    float _2834 = fma(_2722, _2744, _2744);
    float _2836 = fma(_2828, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2822);
    float _2838 = fma(_2830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2796);
    float _2840 = fma(_2438, _2712, _2786);
    float _2842 = rsqrt(_2832);
    float _2844 = fma(_2806, _2784, _2838);
    float _2846 = fma(_1834, _2722, _1834);
    float _2848 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2850 = in.m_58.x;
    float _2852 = _2844 * 0.15915493667125701904296875;
    float _2854 = fma(_2272, _2596, _2736);
    float _2856 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2848);
    float _2858 = _169 + (-0.5);
    float _2860 = fma(_2456, _2674, _2794);
    float _2862 = fma(_2290, _2570, _2854);
    float _2864 = fma(_2458, _2674, _2840);
    float _2866 = fma(_2858, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2834);
    float _2868 = _2852 * 6.283185482025146484375;
    float _2870 = sin(_2868);
    float _2872 = fma(_2296, _2538, _2862);
    float _2874 = fma(_2522, _2650, _2860);
    float _2876 = _2810 * _2842;
    float _2878 = _2818 * _2842;
    float _2880 = fma(_2806, _2846, _2866);
    float _2882 = fma(_2806, _2820, _2836);
    float _2884 = _2876 * _2876;
    float _2886 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2888 = _2768 + _2886;
    float _2890 = fma(_2292, _2524, _2872);
    float _2892 = _2852 * 6.283185482025146484375;
    float _2894 = cos(_2892);
    float _2896 = fma(_2878, _2878, _2884);
    float _2898 = _2888 * _2888;
    float _2900 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2902 = _2790 + _2900;
    float _2904 = -_1434;
    float _2906 = _2904 + 1.0;
    float _2908 = _2802 * _2842;
    float _2910 = fma(_2496, _2630, _2874);
    float _2912 = fma(_2902, _2902, _2898);
    float _2914 = rsqrt(_2896);
    float _2916 = fma(_2294, _2500, _2890);
    float _2918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2920 = _2788 + _2918;
    bool _2922 = _2906 >= 0.001000000047497451305389404296875;
    bool _2924 = isnan(_2906);
    bool _2926 = _2922 || _2924;
    bool _2928 = isnan(0.001000000047497451305389404296875);
    bool _2930 = _2926 || _2928;
    float _2932 = float(_2930);
    float _2934 = fma(_2556, _2650, _2864);
    float _2936 = fma(_2326, _2482, _2916);
    float _2938 = fma(_2920, _2920, _2912);
    float _2940 = _2850 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2942 = fma(_2598, _2600, _2910);
    float _2944 = fma(_2398, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2936);
    float _2946 = sqrt(_2938);
    float _2948 = _2880 * 0.15915493667125701904296875;
    float _2950 = _2882 * 0.15915493667125701904296875;
    float _2952 = _2940 * _2944;
    int _2954 = _1232 >> 31;
    float _2956 = fma(_2498, _2630, _2934);
    float _2958 = _2878 * _2914;
    float _2960 = _2876 * _2914;
    float _2962 = _2952 * _2932;
    float _2964 = _2948 * 6.283185482025146484375;
    float _2966 = sin(_2964);
    float _2968 = -_2958;
    float _2970 = _2878 * _2968;
    float _2972 = _2908 * _2960;
    float _2974 = _2258 * _2962;
    int _2976 = _2954 & 3;
    float _2978 = -_2970;
    float _2980 = fma(_2876, _2960, _2978);
    float _2982 = -_2958;
    float _2984 = _2908 * _2982;
    float _2986 = _2974 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2988 = _2948 * 6.283185482025146484375;
    float _2990 = cos(_2988);
    float _2992 = _2980 * _2980;
    float _2994 = _2946 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2996 = _2986 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _2998 = fma(_2622, _2600, _2956);
    float _3000 = fma(_2972, _2972, _2992);
    int _3002 = _750 >> 31;
    float _3004 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2942);
    float _3006 = _2950 * 6.283185482025146484375;
    float _3008 = cos(_3006);
    float _3010 = fma(_2984, _2984, _3000);
    int _3012 = _3002 & 3;
    float _3014 = _2894 * _2966;
    float _3016 = precise::min(_2996, _2994);
    float _3018 = in.m_58.y;
    int _3020 = _750 + _3012;
    float _3022 = _2870 * _2966;
    float _3024 = rsqrt(_2938);
    int _3026 = _1232 + _2976;
    float _3028 = _2894 * _2990;
    int _3030 = _3020 >> 2;
    float _3032 = fma(_2554, (*spvDescriptorSet0.vp_c9)._m0[182].z, _2998);
    int _3034 = _3026 >> 2;
    float _3036 = _2870 * _2990;
    int _3038 = _3030 << 4;
    int _3040 = _3038 + 368;
    float _3042 = rsqrt(_3010);
    int _3044 = _3034 << 4;
    int _3046 = _3044 + 512;
    float _3048 = _2894 * _3008;
    uint _3050 = uint(int(uint(_3040) >> uint(2)));
    uint _3052 = uint(int(uint(int(_3050)) >> uint(2)));
    int _3054 = int(_3050) & 3;
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[int(_3052)][_3054];
    int _3058 = int(_3050) + 1;
    uint _3060 = uint(int(uint(_3058) >> uint(2)));
    int _3062 = _3058 & 3;
    float _3064 = (*spvDescriptorSet0.vp_c9)._m0[int(_3060)][_3062];
    float _3066 = _2870 * _3008;
    float _3068 = _2990 * _3008;
    float _3070 = _2966 * _3008;
    out.m_70.w = _3016;
    float _3072 = _2950 * 6.283185482025146484375;
    float _3074 = sin(_3072);
    float _3076 = _3024 * _3016;
    bool _3078 = _169 > 0.5;
    uint _3080 = uint(int(uint(_3046) >> uint(2)));
    uint _3082 = uint(int(uint(int(_3080)) >> uint(2)));
    int _3084 = int(_3080) & 3;
    float _3086 = (*spvDescriptorSet0.vp_c9)._m0[int(_3082)][_3084];
    int _3088 = int(_3080) + 1;
    uint _3090 = uint(int(uint(_3088) >> uint(2)));
    int _3092 = _3088 & 3;
    float _3094 = (*spvDescriptorSet0.vp_c9)._m0[int(_3090)][_3092];
    float _3096 = _3004 + 1.0;
    float _3098 = _2888 * _3076;
    float _3100 = _2902 * _3076;
    float _3102 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2812);
    float _3104 = 1.0 / _2034;
    float _3106 = -_3098;
    float _3108 = _2888 + _3106;
    float _3110 = _2980 * _3042;
    float _3112 = precise::clamp(_3110, 0.0, 1.0);
    int _3114 = _3040 + 8;
    uint _3116 = uint(int(uint(_3114) >> uint(2)));
    uint _3118 = uint(int(uint(int(_3116)) >> uint(2)));
    int _3120 = int(_3116) & 3;
    float _3122 = (*spvDescriptorSet0.vp_c9)._m0[int(_3118)][_3120];
    int _3124 = int(_3116) + 1;
    uint _3126 = uint(int(uint(_3124) >> uint(2)));
    int _3128 = _3124 & 3;
    float _3130 = (*spvDescriptorSet0.vp_c9)._m0[int(_3126)][_3128];
    float _3132 = _2354 * _3096;
    float _3134 = _3108 * _3108;
    float _3136 = -_3112;
    float _3138 = _3136 + 1.0;
    float _3140 = -_3102;
    float _3142 = _3140 + 1.0;
    float _3144 = fma(_3074, _3028, _3022);
    float _3146 = fma(_3074, _3022, _3028);
    float _3148 = -_3100;
    float _3150 = _2902 + _3148;
    float _3152 = _2920 * _3076;
    float _3154 = -_3014;
    float _3156 = fma(_3074, _3036, _3154);
    float _3158 = -_3036;
    float _3160 = fma(_3074, _3014, _3158);
    float _3162 = fma(_3150, _3150, _3134);
    float _3164 = -_3152;
    float _3166 = _2920 + _3164;
    float _3168 = fma(_1934, _3104, -1.0);
    float _3170 = _3138 * _3104;
    int _3172 = abs(_1272);
    float _3174 = fma(_3166, _3166, _3162);
    float _3176 = fma(_3138, _3168, 1.0);
    int _3178 = abs(_1548);
    float _3180 = _1918 * _3170;
    float _3182 = _3018 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _3184 = _3176 * _3176;
    int _3186 = abs(_802);
    float _3188 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3190 = int(_3188);
    float _3192 = _3182 * _2944;
    float _3194 = fma(_3180, _3180, _3184);
    float _3196 = _1932 * _3170;
    int _3198 = _3046 + 8;
    uint _3200 = uint(int(uint(_3198) >> uint(2)));
    uint _3202 = uint(int(uint(int(_3200)) >> uint(2)));
    int _3204 = int(_3200) & 3;
    float _3206 = (*spvDescriptorSet0.vp_c9)._m0[int(_3202)][_3204];
    int _3208 = int(_3200) + 1;
    uint _3210 = uint(int(uint(_3208) >> uint(2)));
    int _3212 = _3208 & 3;
    float _3214 = (*spvDescriptorSet0.vp_c9)._m0[int(_3210)][_3212];
    int _3216 = abs(_1282);
    float _3218 = _3192 * _2932;
    float _3220 = fma(_3196, _3196, _3194);
    int _3222 = ~_3216;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    float _3228 = _2312 * _3218;
    int _3230 = ~_796;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    float _3236 = rsqrt(_3220);
    int _3238 = ~_3178;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _3228 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _3246 = ~_3172;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3234 * as_type<int>(_3064);
    int _3254 = _3226 * as_type<int>(_3094);
    int _3256 = _3242 * as_type<int>(_3056);
    int _3258 = _3256 + _3252;
    int _3260 = ~_3186;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    int _3266 = _3250 * as_type<int>(_3086);
    int _3268 = _3266 + _3254;
    int _3270 = abs(_1618);
    float _3272 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3274 = int(_3272);
    float _3276 = float(uint(_3190));
    int _3278 = _3264 * as_type<int>(_3122);
    int _3280 = _3278 + _3258;
    float _3282 = _3180 * _3236;
    int _3284 = abs(_3190);
    float _3286 = _3176 * _3236;
    int _3288 = ~_3270;
    int _3290 = _3288 + 1;
    int _3292 = _3290 + 1;
    float _3294 = 1.0 / _3276;
    int _3296 = abs(_814);
    float _3298 = _3196 * _3236;
    int _3300 = _3292 * as_type<int>(_3130);
    int _3302 = _3300 + _3280;
    int _3304 = abs(_1402);
    int _3306 = ~_3296;
    int _3308 = _3306 + 1;
    int _3310 = _3308 + 1;
    float _3312 = float(uint(_3284));
    int _3314 = ~_1316;
    int _3316 = _3314 + 1;
    int _3318 = _3316 + 1;
    int _3320 = _3302 * _3310;
    float _3322 = 1.0 / _3312;
    float _3324 = float(uint(_3274));
    int _3326 = _3318 * as_type<int>(_3206);
    int _3328 = _3326 + _3268;
    int _3330 = ~_3304;
    int _3332 = _3330 + 1;
    int _3334 = _3332 + 1;
    int _3336 = _1130 * _3296;
    int _3338 = _3336 + _3320;
    float _3340 = -_3298;
    float _3342 = _2876 * _3340;
    int _3344 = as_type<int>(_3294) + (-2);
    float _3346 = -_3282;
    float _3348 = _2908 * _3346;
    int _3350 = _3334 * as_type<int>(_3214);
    int _3352 = _3350 + _3328;
    float _3354 = float(uint(_3338));
    float _3356 = -_3282;
    float _3358 = -_3342;
    float _3360 = fma(_2878, _3356, _3358);
    int _3362 = abs(_3338);
    float _3364 = 1.0 / _3324;
    int _3366 = abs(_1236);
    float _3368 = as_type<float>(_3344) * _3354;
    int _3370 = as_type<int>(_3322) + (-2);
    float _3372 = _2878 * _3286;
    float _3374 = float(uint(_3362));
    float _3376 = _3360 * _3360;
    int _3378 = ~_3366;
    int _3380 = _3378 + 1;
    int _3382 = _3380 + 1;
    float _3384 = trunc(_3368);
    float _3386 = precise::max(_3384, 0.0);
    uint _3388 = uint(_3386);
    int _3390 = abs(_3274);
    float _3392 = -_3298;
    float _3394 = -_3372;
    float _3396 = fma(_2908, _3392, _3394);
    float _3398 = -_3348;
    float _3400 = fma(_2876, _3286, _3398);
    int _3402 = _3352 * _3382;
    int _3404 = ~_3190;
    int _3406 = _3404 + 1;
    float _3408 = float(uint(_3390));
    float _3410 = sqrt(_3174);
    int _3412 = _1534 * _3366;
    int _3414 = _3412 + _3402;
    int _3416 = as_type<int>(_3364) + (-2);
    int _3418 = ~_3284;
    int _3420 = _3418 + 1;
    float _3422 = float(uint(_3414));
    int _3424 = _3406 * int(_3388);
    int _3426 = _3424 + _3338;
    float _3428 = as_type<float>(_3370) * _3374;
    float _3430 = 1.0 / _3408;
    float _3432 = fma(_3396, _3396, _3376);
    float _3434 = as_type<float>(_3416) * _3422;
    float _3436 = float(uint(_3426));
    float _3438 = fma(_3400, _3400, _3432);
    float _3440 = _3024 * _3410;
    int _3442 = _3414 ^ _3274;
    float _3444 = trunc(_3428);
    float _3446 = precise::max(_3444, 0.0);
    uint _3448 = uint(_3446);
    float _3450 = as_type<float>(_3344) * _3436;
    int _3452 = ~_3274;
    int _3454 = _3452 + 1;
    float _3456 = _2986 * _3440;
    float _3458 = _3244 * _3440;
    float _3460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    uint _3462 = uint(int(uint(_3442) >> uint(31)));
    float _3464 = rsqrt(_3438);
    out.m_72.x = _3456;
    int _3466 = ~int(_3462);
    int _3468 = _3466 + 1;
    int _3470 = _3420 * int(_3448);
    int _3472 = _3470 + _3362;
    float _3474 = trunc(_3434);
    float _3476 = precise::max(_3474, 0.0);
    uint _3478 = uint(_3476);
    float _3480 = float(uint(_3472));
    int _3482 = abs(_3414);
    float _3484 = _3396 * _3464;
    float _3486 = trunc(_3450);
    float _3488 = precise::max(_3486, 0.0);
    uint _3490 = uint(_3488);
    float _3492 = as_type<float>(_3370) * _3480;
    float _3494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    int _3496 = as_type<int>(_3430) + (-2);
    float _3498 = _3360 * _3464;
    float _3500 = float(uint(_3482));
    float _3502 = _3400 * _3464;
    int _3504 = _3454 * int(_3478);
    int _3506 = _3504 + _3414;
    float _3508 = _3456 * _3460;
    float _3510 = trunc(_3492);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    float _3516 = as_type<float>(_3496) * _3500;
    int _3518 = ~_3390;
    int _3520 = _3518 + 1;
    float _3522 = _3458 * _3494;
    float _3524 = float(uint(_3506));
    float _3526 = _2878 * _3484;
    int _3528 = int(_3388) + int(_3490);
    float _3530 = _2908 * _3502;
    float _3532 = trunc(_3516);
    float _3534 = precise::max(_3532, 0.0);
    uint _3536 = uint(_3534);
    int _3538 = ~_3190;
    int _3540 = _3538 + 1;
    float _3542 = -_3526;
    float _3544 = fma(_2876, _3502, _3542);
    float _3546 = as_type<float>(_3416) * _3524;
    float _3548 = -_3530;
    float _3550 = fma(_2878, _3498, _3548);
    int _3552 = _3540 * _3528;
    int _3554 = _3552 + _3338;
    float _3556 = _2876 * _3498;
    int _3558 = int(_3448) + int(_3514);
    float _3560 = trunc(_3546);
    float _3562 = precise::max(_3560, 0.0);
    uint _3564 = uint(_3562);
    int _3566 = ~_3284;
    int _3568 = _3566 + 1;
    float _3570 = -_3556;
    float _3572 = fma(_2908, _3484, _3570);
    int _3574 = _3520 * int(_3536);
    int _3576 = _3574 + _3482;
    float _3578 = -_256;
    int _3580 = _1674 ? as_type<int>(_3578) : as_type<int>(_256);
    int _3582 = _3568 * _3558;
    int _3584 = _3582 + _3362;
    bool _3586 = uint(_3554) >= uint(_3190);
    float _3588 = float(uint(_3576));
    float _3590 = _3544 * _3544;
    bool _3592 = !_3586;
    int _3594 = _3592 ? 0 : (-1);
    bool _3596 = uint(_3584) >= uint(_3284);
    float _3598 = fma(_3550, _3550, _3590);
    float _3600 = as_type<float>(_3496) * _3588;
    int _3602 = ~_3528;
    int _3604 = _3602 + _3594;
    int _3606 = _3604 + 1;
    float _3608 = -_3522;
    float _3610 = _3074 * _3608;
    float _3612 = fma(_3572, _3572, _3598);
    float _3614 = trunc(_3600);
    float _3616 = precise::max(_3614, 0.0);
    uint _3618 = uint(_3616);
    int _3620 = int(_3478) + int(_3564);
    float _3622 = _3048 * _3522;
    int _3624 = ~_3274;
    int _3626 = _3624 + 1;
    float _3628 = _3066 * _3522;
    bool _3630 = !_3596;
    int _3632 = _3630 ? 0 : (-1);
    int _3634 = _3190 * _3606;
    int _3636 = _3634 + _3338;
    bool _3638 = _3190 == 0;
    float _3640 = rsqrt(_3612);
    int _3642 = ~_3390;
    int _3644 = _3642 + 1;
    int _3646 = _3626 * _3620;
    int _3648 = _3646 + _3414;
    bool _3650 = !_3638;
    int _3652 = _3650 ? _3636 : (-1);
    float _3654 = fma(_3068, _3508, _3610);
    float _3656 = fma(_3144, _3508, _3622);
    bool _3658 = uint(_3648) >= uint(_3274);
    float _3660 = fma(_3156, _3508, _3628);
    int _3662 = int(_3536) + int(_3618);
    int _3664 = _3338 ^ _3190;
    bool _3666 = !_3658;
    int _3668 = _3666 ? 0 : (-1);
    int _3670 = _3644 * _3662;
    int _3672 = _3670 + _3482;
    float _3674 = -_256;
    int _3676 = _2826 ? as_type<int>(_3674) : as_type<int>(_256);
    float _3678 = _3550 * _3640;
    float _3680 = _3544 * _3640;
    float _3682 = _3572 * _3640;
    int _3684 = ~_3620;
    int _3686 = _3684 + _3668;
    int _3688 = _3686 + 1;
    float _3690 = _3048 * _3678;
    bool _3692 = uint(_3672) >= uint(_3390);
    float _3694 = _2876 * _3682;
    float _3696 = _2878 * _3680;
    float _3698 = _2908 * _3678;
    bool _3700 = _3190 == 0;
    float _3702 = _3144 * _3678;
    float _3704 = _3144 * _3680;
    float _3706 = _3048 * _3680;
    float _3708 = _3144 * _3682;
    float _3710 = _3048 * _3682;
    float _3712 = _3160 * _3682;
    float _3714 = -_3694;
    float _3716 = fma(_2878, _3678, _3714);
    float _3718 = -_3696;
    float _3720 = fma(_2908, _3682, _3718);
    float _3722 = _3656 * _3682;
    float _3724 = -_3698;
    float _3726 = fma(_2876, _3680, _3724);
    bool _3728 = !_1610;
    float _3730 = _3728 ? _256 : as_type<float>(_3676);
    int _3732 = _3274 * _3688;
    int _3734 = _3732 + _3414;
    bool _3736 = !_3692;
    int _3738 = _3736 ? 0 : (-1);
    float _3740 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3742 = _3274 == 0;
    float _3744 = _3160 * _3678;
    bool _3746 = _3274 == 0;
    float _3748 = _3716 * _3716;
    float _3750 = _3656 * _3678;
    float _3752 = _3656 * _3680;
    int _3754 = ~_3632;
    int _3756 = _3558 + _3754;
    int _3758 = _3756 + 1;
    float _3760 = fma(_3720, _3720, _3748);
    uint _3762 = uint(int(uint(_3664) >> uint(31)));
    float _3764 = _3160 * _3680;
    int _3766 = ~_3738;
    int _3768 = _3662 + _3766;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3726, _3726, _3760);
    float _3774 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3776 = ~int(_3762);
    int _3778 = _3776 + 1;
    float _3780 = -_145;
    float _3782 = fma(_3780, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1628);
    float _3784 = float(_3652);
    float _3786 = _3740 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3788 = _3758 ^ _3778;
    int _3790 = _3770 ^ _3468;
    float _3792 = rsqrt(_3772);
    float _3794 = fma(_3786, _3784, _3782);
    float _3796 = _3730 + 0.5;
    int _3798 = ~_3778;
    int _3800 = _3798 + _3788;
    int _3802 = _3800 + 1;
    bool _3804 = !_3742;
    int _3806 = _3804 ? _3734 : (-1);
    float _3808 = fma(_3786, _3796, _3794);
    int _3810 = ~_3468;
    int _3812 = _3810 + _3790;
    int _3814 = _3812 + 1;
    float _3816 = _3774 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3818 = float(_3806);
    float _3820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3822 = !_1624;
    float _3824 = _3822 ? _256 : as_type<float>(_3580);
    bool _3826 = !_3746;
    int _3828 = _3826 ? _3814 : (-1);
    float _3830 = fma(_3816, _3818, _2208);
    float _3832 = _3726 * _3792;
    float _3834 = _3720 * _3792;
    float _3836 = _3824 + 0.5;
    float _3838 = _3716 * _3792;
    float _3840 = fma(_3654, _3832, _3722);
    float _3842 = fma(_3654, _3834, _3750);
    float _3844 = fma(_3816, _3836, _3830);
    bool _3846 = !_3700;
    int _3848 = _3846 ? _3802 : (-1);
    float _3850 = fma(_2878, _3660, _3840);
    float _3852 = fma(_2876, _3660, _3842);
    float _3854 = -_3074;
    float _3856 = fma(_3854, _3834, _3690);
    float _3858 = fma(_3068, _3834, _3702);
    float _3860 = _2788 + _3850;
    float _3862 = -_3074;
    float _3864 = fma(_3862, _3838, _3706);
    float _3866 = float(_3848);
    float _3868 = fma(_3068, _3838, _3704);
    float _3870 = -_3074;
    float _3872 = fma(_3870, _3832, _3710);
    float _3874 = fma(_3070, _3838, _3764);
    float _3876 = fma(_3070, _3832, _3712);
    float _3878 = _3820 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3880 = fma(_3654, _3838, _3752);
    float _3882 = _2790 + _3852;
    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3886 = _3860 + _3884;
    float _3888 = fma(_3066, _2876, _3856);
    float _3890 = fma(_3066, _2908, _3864);
    float _3892 = -_1620;
    float _3894 = fma(_3878, _3866, _3892);
    float _3896 = fma(_3066, _2878, _3872);
    float _3898 = fma(_3068, _3832, _3708);
    float _3900 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3902 = _3882 + _3900;
    float _3904 = _3886 * _3886;
    float _3906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3908 = fma(_3070, _3834, _3744);
    float _3910 = fma(_2908, _3660, _3880);
    float _3912 = fma(_3902, _3902, _3904);
    float _3914 = -_272;
    int _3916 = _3078 ? as_type<int>(_3914) : as_type<int>(_272);
    float _3918 = fma(_3156, _2876, _3858);
    float _3920 = float(_3828);
    float _3922 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2050);
    float _3924 = sqrt(_3912);
    bool _3926 = !_1590;
    float _3928 = _3926 ? _272 : as_type<float>(_3916);
    float _3930 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3932 = fma(_3146, _2876, _3908);
    float _3934 = fma(_3156, _2908, _3868);
    float _3936 = fma(_3156, _2878, _3898);
    float _3938 = _3928 + (-0.5);
    float _3940 = _3930 * _3890;
    float _3942 = _3906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3944 = _3930 * _3896;
    float _3946 = -_3878;
    float _3948 = fma(_3946, _3938, _3894);
    float _3950 = fma(_3930, _3930, 1.0);
    float _3952 = -_3922;
    float _3954 = fma(_3942, _3920, _3952);
    float _3956 = _836 + (-0.5);
    float _3958 = _2768 + _3910;
    float _3960 = fma(_3146, _2908, _3874);
    bool _3962 = _3924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3964 = -_3942;
    float _3966 = fma(_3964, _3956, _3954);
    float _3968 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3970 = rsqrt(_3950);
    float _3972 = _3930 * _3888;
    out.m_74.x = _3918;
    out.m_74.y = _3934;
    out.m_74.z = _3936;
    float _3974 = fma(_3968, _3934, _3940);
    float _3976 = fma(_3968, _3936, _3944);
    float _3978 = fma(_3968, _3918, _3972);
    float _3980 = fma(_3146, _2878, _3876);
    float _3982 = _3968;
    float _3984 = _3940;
    float _3986 = _3942;
    if (!_3962)
    {
        _3982 = _3882;
    }
    float _3988 = _3982;
    float _3990 = _3988;
    if (!_3962)
    {
        _3984 = _3860;
    }
    float _3992 = _3984;
    float _3994 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2062);
    float _3996 = _3992;
    if (!_3962)
    {
        _3986 = _3958;
    }
    float _3998 = _3986;
    bool _4000 = !_3962;
    float _4002 = _3998;
    if (!_4000)
    {
        float _4004 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4006 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4008 = _3924 + _4006;
        float _4010 = _3958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4012 = rsqrt(_3912);
        float _4014 = _4008 * _4004;
        float _4016 = _4014 * 0.15915493667125701904296875;
        float _4018 = _4016 * 6.283185482025146484375;
        float _4020 = cos(_4018);
        float _4022 = _4016 * 6.283185482025146484375;
        float _4024 = sin(_4022);
        float _4026 = _4020 + (-1.0);
        float _4028 = fma(_4024, _4010, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4030 = _4026 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4032 = _4012 * _4028;
        float _4034 = fma(_3958, _4020, _4030);
        float _4036 = fma(_3902, _4032, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4038 = fma(_3886, _4032, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4002 = _4034;
        _3990 = _4036;
        _3996 = _4038;
    }
    float _4040 = _4002;
    float _4042 = _3990;
    float _4044 = _3996;
    float _4046 = -_2768;
    float _4048 = _4046 + _4040;
    float _4050 = -_3142;
    float _4052 = fma(_3730, _4050, _3808);
    float _4054 = -_2790;
    float _4056 = _4054 + _4042;
    float _4058 = -_2788;
    float _4060 = _4058 + _4044;
    float _4062 = _4048 * _4048;
    float _4064 = -_3994;
    float _4066 = _4064 + 1.0;
    float _4068 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2028);
    float _4070 = _3930 * _3970;
    float _4072 = fma(_4056, _4056, _4062);
    float _4074 = -_4066;
    float _4076 = fma(_3824, _4074, _3844);
    float _4078 = -_4068;
    float _4080 = _4078 + 1.0;
    float _4082 = -_3932;
    float _4084 = _4070 * _4082;
    float _4086 = fma(_4060, _4060, _4072);
    float _4088 = -_3960;
    float _4090 = _4070 * _4088;
    float _4092 = -_3980;
    float _4094 = _4070 * _4092;
    float _4096 = fma(_836, _4080, _3966);
    float _4098 = sqrt(_4086);
    float _4100 = fma(_3970, _3888, _4084);
    float _4102 = fma(_3970, _3890, _4090);
    float _4104 = fma(_3970, _3896, _4094);
    float _4106 = _3932 + _3978;
    float _4108 = _3960 + _3974;
    float _4110 = _3980 + _3976;
    float _4112 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2856);
    out.m_76.x = _4100;
    out.m_76.y = _4102;
    out.m_76.z = _4104;
    float _4114 = -_2122;
    float _4116 = _1372 + _4114;
    float _4118 = _3032 + 1.0;
    float _4120 = -_4112;
    float _4122 = _4120 + 1.0;
    out.m_78.x = _4106;
    out.m_78.y = _4108;
    out.m_78.z = _4110;
    float _4124 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2194);
    float _4126 = -_3152;
    float _4128 = _4126 + _4044;
    float _4130 = fma(_3928, _4122, _3948);
    bool _4132 = _4098 > 0.0;
    float _4134 = _2362 * _4118;
    float _4136 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2198);
    out.m_80.x = _4052;
    out.m_80.y = _4130;
    out.m_80.z = _4076;
    out.m_80.w = _4096;
    float _4138 = fma(_4116, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2196);
    float _4140 = fma(_3132, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4124);
    float _4142 = fma(_4134, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4136);
    float _4144 = -_3100;
    float _4146 = _4144 + _4042;
    float _4148 = -_3100;
    float _4150 = _2790 + _4148;
    float _4152 = -_3152;
    float _4154 = _2788 + _4152;
    float _4156 = _4124;
    float _4158 = _4116;
    float _4160 = _4104;
    float _4162 = _4102;
    float _4164 = _4100;
    float _4166 = _4130;
    float _4168 = _4052;
    float _4170 = _4146;
    float _4172 = _4100;
    if (!_4132)
    {
        _4156 = _4128;
    }
    float _4174 = _4156;
    float _4176 = -_3098;
    float _4178 = _4176 + _4040;
    float _4180 = -_3098;
    float _4182 = _2768 + _4180;
    float _4184 = _4174;
    float _4186 = _4174;
    float _4188 = _4174;
    if (!_4132)
    {
        _4158 = _4178;
    }
    float _4190 = _4158;
    bool _4192 = !_4132;
    float _4194 = _4190;
    float _4196 = _4190;
    if (!_4192)
    {
        bool _4198 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4200 = _4134;
        if (_4198)
        {
            float _4202 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4200 = _4202;
        }
        float _4204 = _4200;
        if (_4198)
        {
            _4160 = _4140;
        }
        float _4206 = _4160;
        float _4208 = _4206;
        if (_4198)
        {
            _4162 = _4138;
        }
        float _4210 = _4162;
        float _4212 = _4210;
        if (_4198)
        {
            _4164 = _4142;
        }
        float _4214 = _4164;
        float _4216 = _4204;
        float _4218 = _4214;
        if (_4198)
        {
            float _4220 = _4140 * _4204;
            _4166 = _4220;
        }
        float _4222 = _4166;
        float _4224 = _4222;
        if (_4198)
        {
            float _4226 = _4138 * _4204;
            _4168 = _4226;
        }
        float _4228 = _4168;
        float _4230 = _4228;
        if (_4198)
        {
            float _4232 = _4142 * _4204;
            _4216 = _4232;
        }
        float _4234 = _4216;
        float _4236 = _4234;
        if (!_4198)
        {
            bool _4238 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4240 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4242 = _4238 || _4240;
            bool _4244 = isnan(1.0);
            bool _4246 = _4242 || _4244;
            float _4248 = _145 + 1.0;
            float _4250 = _4248;
            if (!_4246)
            {
                float _4252 = _4248 * _4248;
                float _4254 = _4252 * 0.5;
                _4184 = _4254;
            }
            float _4256 = _4184;
            float _4258 = _4256;
            if (!_4246)
            {
                float _4260 = _4256 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4258 = _4260;
            }
            float _4262 = _4258;
            bool _4264 = !_4246;
            float _4266 = _4262;
            if (!_4264)
            {
                float _4268 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4270 = log2(_4268);
                float _4272 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4274 = _4272 + 1.0;
                float _4276 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4278 = _4270 * _4248;
                float _4280 = exp2(_4278);
                float _4282 = _4276 * 0.693147182464599609375;
                float _4284 = 1.0 / _4282;
                float _4286 = 1.0 / _4274;
                float _4288 = _4280 + (-1.0);
                float _4290 = -_4288;
                float _4292 = fma(_4290, _4284, _4248);
                float _4294 = _4292 * _4286;
                float _4296 = _4294 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4266 = _4296;
            }
            float _4298 = _4266;
            float _4300 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4302 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4304 = !_4246;
            _4194 = _4302;
            if (!_4304)
            {
                float _4306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4308 = log2(_4306);
                float _4310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4312 = _4310 + 1.0;
                float _4314 = 1.0 / _4312;
                float _4316 = _4308 * _4248;
                float _4318 = exp2(_4316);
                float _4320 = -_4318;
                float _4322 = _4320 + 1.0;
                float _4324 = _4322 * _4314;
                _4250 = _4324;
            }
            float _4326 = _4250;
            float _4328 = fma(_4326, _1326, _4302);
            float _4330 = _4298 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4332 = fma(_4326, _1324, _4300);
            float _4334 = -_2120;
            float _4336 = _4334 + _4328;
            float _4338 = fma(_4326, _1328, _4330);
            float _4340 = -_2118;
            float _4342 = _4340 + _4332;
            float _4344 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4346 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4348 = _4336 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4350 = -_2122;
            float _4352 = _4350 + _4338;
            float _4354 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4344);
            float _4356 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4346);
            float _4358 = fma(_4342, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4348);
            float _4360 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4354);
            float _4362 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4356);
            float _4364 = fma(_4352, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4358);
            _4212 = _4362;
            _4208 = _4360;
            _4218 = _4364;
            _4224 = _4360;
            _4230 = _4362;
            _4236 = _4364;
            _4186 = _4330;
            _1374 = _4356;
        }
        float _4366 = _4212;
        float _4368 = _4208;
        float _4370 = _4218;
        float _4372 = _4224;
        float _4374 = _4230;
        float _4376 = _4236;
        float _4378 = _4194;
        float _4380 = _4186;
        float _4382 = _1374;
        float _4384 = _4366 * _4366;
        float _4386 = fma(_4368, _4368, _4384);
        float _4388 = fma(_4370, _4370, _4386);
        float _4390 = rsqrt(_4086);
        float _4392 = sqrt(_4388);
        float _4394 = _4056 * _4390;
        float _4396 = _4048 * _4390;
        float _4398 = _4060 * _4390;
        bool _4400 = _4392 > 0.0;
        float _4402 = _4378;
        float _4404 = _4380;
        _1376 = _4382;
        _4172 = _4370;
        if (!_4400)
        {
            _4402 = _4178;
        }
        float _4406 = _4402;
        _4196 = _4406;
        if (!_4400)
        {
            _4404 = _4128;
        }
        float _4408 = _4404;
        bool _4410 = !_4400;
        _4188 = _4408;
        if (!_4410)
        {
            float _4412 = rsqrt(_4388);
            float _4414 = _4412 * _4366;
            float _4416 = _4412 * _4368;
            float _4418 = _4412 * _4370;
            float _4420 = _4396 * _4414;
            float _4422 = fma(_4394, _4416, _4420);
            float _4424 = fma(_4398, _4418, _4422);
            float _4426 = _4424 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4428 = fma(_4372, _4426, _4146);
            float _4430 = fma(_4374, _4426, _4178);
            float _4432 = fma(_4376, _4426, _4128);
            _4170 = _4428;
            _4196 = _4430;
            _4188 = _4432;
            _1376 = _4414;
        }
    }
    float _4434 = _4170;
    float _4436 = _4196;
    float _4438 = _4188;
    float _4440 = _1376;
    float _4442 = _4172;
    float _4444 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4446 = fma(_4150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4444);
    float _4448 = _4182 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4450 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4452 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4454 = _4450 || _4452;
    bool _4456 = isnan(0.5);
    bool _4458 = _4454 || _4456;
    float _4460 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4446);
    float _4462 = fma(_4150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4448);
    float _4464 = _4460 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4466 = fma(_4154, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4462);
    bool _4468 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4470 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4472 = _4468 || _4470;
    bool _4474 = isnan(0.5);
    bool _4476 = _4472 || _4474;
    float _4478 = 1.0 / _4464;
    float _4480 = _4466 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4482 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4484 = _4480;
    float _4486 = _4440;
    float _4488 = _4434;
    float _4490 = _4460;
    if (_4458)
    {
        _4482 = _4434;
    }
    float _4492 = _4482;
    float _4494 = _4480 + _4464;
    float _4496 = _4492;
    if (_4458)
    {
        _4484 = _4436;
    }
    float _4498 = _4484;
    float _4500 = _4498;
    if (_4458)
    {
        _4486 = _4438;
    }
    float _4502 = _4486;
    float _4504 = _4502;
    if (!_4458)
    {
        float _4506 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _4508 = _4182 + _4506;
        float _4510 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _4512 = _4150 + _4510;
        float _4514 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4516 = -_4150;
        float _4518 = _4516 + _4434;
        float _4520 = _4508 * _4508;
        float _4522 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _4524 = _4154 + _4522;
        float _4526 = -_4182;
        float _4528 = _4526 + _4436;
        float _4530 = -_4154;
        float _4532 = _4530 + _4438;
        float _4534 = fma(_4512, _4512, _4520);
        float _4536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4538 = fma(_4524, _4524, _4534);
        float _4540 = sqrt(_4538);
        float _4542 = _4514 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4544 = precise::min(_4540, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4546 = _4544 * _4536;
        float _4548 = _4542 * _4546;
        float _4550 = fma(_4518, _4548, _4150);
        float _4552 = fma(_4528, _4548, _4182);
        float _4554 = fma(_4532, _4548, _4154);
        _4500 = _4552;
        _4496 = _4550;
        _4504 = _4554;
        _4488 = _4518;
        _4490 = _4548;
    }
    float _4556 = _4500;
    float _4558 = _4496;
    float _4560 = _4504;
    float _4562 = _4488;
    float _4564 = _4490;
    float _4566 = _4564;
    float _4568 = _4562;
    if (_4476)
    {
        _4566 = 1.0;
    }
    float _4570 = _4566;
    float _4572 = _4494 * _4478;
    float _4574 = _4572 * 0.5;
    float _4576 = _4570;
    float _4578 = _4574;
    if (!_4476)
    {
        float _4580 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4582 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4584 = fma(_4574, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4582);
        float _4586 = _4580 * 0.15915493667125701904296875;
        float _4588 = _4586 * 6.283185482025146484375;
        float _4590 = cos(_4588);
        float _4592 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4594 = _4592 * 0.15915493667125701904296875;
        float _4596 = _4586 * 6.283185482025146484375;
        float _4598 = sin(_4596);
        float _4600 = 1.0 / _4590;
        float _4602 = _4594 * 6.283185482025146484375;
        float _4604 = cos(_4602);
        float _4606 = _4598 * _4600;
        float _4608 = 1.0 / _4584;
        float _4610 = _4604 * _4606;
        float _4612 = _4594 * 6.283185482025146484375;
        float _4614 = sin(_4612);
        float _4616 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4618 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4616;
        float _4620 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4622 = _4608 * _4620;
        float _4624 = 1.0 / _4610;
        float _4626 = 1.0 / _4618;
        float _4628 = _4614 * _4624;
        float _4630 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4632 = fma(_4628, _4622, _4630);
        float _4634 = _4632 * _4626;
        float _4636 = precise::clamp(_4634, 0.0, 1.0);
        _4568 = _4594;
        _4576 = _4636;
    }
    float _4638 = _4568;
    float _4640 = _4576;
    float _4642 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4644 = _4556 + _4642;
    float _4646 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4648 = _4558 + _4646;
    float _4650 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4652 = _4560 + _4650;
    float _4654 = _4644 * _4644;
    float _4656 = fma(_4648, _4648, _4654);
    float _4658 = fma(_4652, _4652, _4656);
    float _4660 = rsqrt(_4658);
    float _4662 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4664 = _4648 * _4662;
    float _4666 = _4652 * _4662;
    float _4668 = _4664 * _4664;
    float _4670 = _4666 * _4666;
    float _4672 = _4668 + _4670;
    float _4674 = sqrt(_4672);
    bool _4676 = _4674 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4678 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4680 = _4674 + _4678;
    float _4682 = _4442;
    float _4684 = _4672;
    float _4686 = _4680;
    float _4688 = _4644;
    float _4690 = _4662;
    float _4692 = _4664;
    if (_4676)
    {
        float _4694 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4682 = _4694;
    }
    float _4696 = _4682;
    if (_4676)
    {
        float _4698 = rsqrt(_4672);
        _4684 = _4698;
    }
    float _4700 = _4684;
    float _4702 = _4696;
    float _4704 = _4700;
    if (_4676)
    {
        float _4706 = _4680 * _4696;
        _4686 = _4706;
    }
    float _4708 = _4686;
    if (_4676)
    {
        float _4710 = _4708 * 0.15915493667125701904296875;
        _4578 = _4710;
    }
    float _4712 = _4578;
    float _4714 = _4652;
    if (_4676)
    {
        float _4716 = _4712 * 6.283185482025146484375;
        float _4718 = sin(_4716);
        _4714 = _4718;
    }
    float _4720 = _4714;
    float _4722 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4724 = precise::max(0.0, _4722);
    float _4726 = _4638;
    float _4728 = _4724;
    if (_4676)
    {
        float _4730 = _4712 * 6.283185482025146484375;
        float _4732 = cos(_4730);
        _4726 = _4732;
    }
    float _4734 = _4726;
    float _4736 = -_4662;
    float _4738 = -_4724;
    float _4740 = fma(_4644, _4736, _4738);
    if (_4676)
    {
        float _4742 = _4740 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4688 = _4742;
    }
    float _4744 = _4688;
    float _4746 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4748 = _4720;
    float _4750 = _4744;
    if (_4676)
    {
        float _4752 = fma(_4720, _4744, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4748 = _4752;
    }
    float _4754 = _4748;
    float _4756 = _4754;
    if (!_4676)
    {
        _4750 = _4666;
    }
    float _4758 = _4750;
    float _4760 = _4758;
    float _4762 = _4734;
    if (_4676)
    {
        float _4764 = _4734 + (-1.0);
        _4728 = _4764;
    }
    float _4766 = _4728;
    if (_4676)
    {
        float _4768 = _4700 * _4754;
        _4690 = _4768;
    }
    float _4770 = _4690;
    if (!_4676)
    {
        _4756 = _4740;
    }
    float _4772 = _4756;
    float _4774 = _4772;
    if (_4676)
    {
        float _4776 = _4766 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4702 = _4776;
    }
    float _4778 = _4702;
    if (_4676)
    {
        float _4780 = _4664 * _4770;
        _4692 = _4780;
    }
    float _4782 = _4692;
    if (!_4676)
    {
        _4704 = _4668;
    }
    float _4784 = _4704;
    float _4786 = _4784;
    if (_4676)
    {
        float _4788 = _4666 * _4770;
        _4760 = _4788;
    }
    float _4790 = _4760;
    if (_4676)
    {
        float _4792 = fma(_4740, _4734, _4778);
        _4774 = _4792;
    }
    float _4794 = _4774;
    if (_4676)
    {
        float _4796 = _4782 * _4782;
        _4786 = _4796;
    }
    float _4798 = _4786;
    float _4800 = sqrt(_4658);
    if (!_4676)
    {
        _4762 = _4670;
    }
    float _4802 = _4762;
    float _4804 = _4802;
    if (_4676)
    {
        float _4806 = _4790 * _4790;
        _4804 = _4806;
    }
    float _4808 = _4804;
    float _4810 = fma(_4794, _4794, _4798);
    float _4812 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4814 = _4810 + _4808;
    float _4816 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4746);
    float _4818 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4820 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4812);
    float _4822 = rsqrt(_4814);
    float _4824 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4816);
    float _4826 = _4556 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4828 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4818);
    float _4830 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4834 = fma(_4800, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4832);
    float _4836 = precise::clamp(_4834, 0.0, 1.0);
    float _4838 = _4824 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4840 = fma(_4558, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4826);
    float _4842 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4828);
    float _4844 = -_4836;
    float _4846 = _4844 + 1.0;
    float _4848 = _4838 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4850 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4840);
    float _4852 = _4842 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4854 = abs(_4846);
    float _4856 = log2(_4854);
    float _4858 = -_4848;
    float _4860 = fma(_4858, _4830, 1.0);
    float _4862 = _4850 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4864 = _4822 * _4782;
    float _4866 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4868 = _4822 * _4794;
    float _4870 = fma(_4560, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4820);
    float _4872 = _4864 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4874 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4866);
    float _4876 = _4822 * _4790;
    float _4878 = _4870 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4880 = -_4872;
    float _4882 = fma(_4868, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4880);
    float _4884 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4874);
    float _4886 = log2(_4860);
    float _4888 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4890 = -_4876;
    float _4892 = fma(_4890, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4882);
    float _4894 = _4856 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4896 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4884);
    float _4898 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4900 = fma(_4892, -0.5, 0.5);
    float _4902 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4888);
    float _4904 = exp2(_4894);
    float _4906 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4898);
    float _4908 = fma(_4892, 0.5, 0.5);
    float _4910 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4902);
    float _4912 = _4868 + 1.0;
    float _4914 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4906);
    float _4916 = fma(_4908, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4918 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4910);
    float _4920 = 1.0 / _4896;
    float _4922 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4914);
    float _4924 = fma(_4908, _4916, -0.212114393711090087890625);
    float _4926 = _4886 * 0.693147182464599609375;
    float _4928 = fma(_4908, _4924, 1.570728778839111328125);
    float _4930 = sqrt(_4900);
    float _4932 = -_4868;
    float _4934 = fma(_4904, _4912, _4932);
    float _4936 = _4926 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4938 = fma(_4934, 0.5, 0.5);
    float _4940 = _4922 * _4920;
    float _4942 = _4918 * _4920;
    float _4944 = fma(_4940, 0.5, 0.5);
    float _4946 = fma(_4942, -0.5, 0.5);
    float _4948 = _4930 * 0.636619746685028076171875;
    float3 _12632 = float3(_4944, _4946, _4936);
    float _4950 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12632, float3(0.0), isnan(_12632)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12632, float3(0.0), isnan(_12632)), level(0.0)).x;
    float3 _12643 = float3(_4944, _4946, _4936);
    float4 _4953 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12643, float3(0.0), isnan(_12643)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12643, float3(0.0), isnan(_12643)), level(0.0)).xyzw;
    float _4955 = _4953.x;
    float _4957 = _4953.y;
    float _4959 = _4953.z;
    float _4961 = _4953.w;
    float _4963 = -_4928;
    float _4965 = fma(_4948, _4963, 1.0);
    float2 _12665 = float2(_4965, _4938);
    float3 _4969 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12665, float2(0.0), isnan(_12665)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12665, float2(0.0), isnan(_12665)), level(0.0)).xyz;
    float _4971 = _4969.x;
    float _4973 = _4969.y;
    float _4975 = _4969.z;
    float _4977 = _4856 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4979 = _4852 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4981 = _4896 * 0.5;
    out.m_82.x = _4150;
    out.m_82.y = _4182;
    out.m_82.z = _4154;
    bool _4983 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4985 = isnan(_4800);
    bool _4987 = _4983 || _4985;
    bool _4989 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4991 = _4987 || _4989;
    float _4993 = fma(_4862, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4979);
    float _4995 = exp2(_4977);
    out.m_84.x = _4558;
    out.m_84.y = _4556;
    out.m_84.z = _4560;
    float _4997 = _4922 + _4896;
    float _4999 = fma(_4838, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4993);
    float _5001 = fma(_4918, -0.5, _4981);
    float _5003 = _4997 * 0.5;
    float _5005 = fma(_4878, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4999);
    float _5007 = _5005 + _4896;
    out.gl_Position.x = _4922;
    out.gl_Position.y = _4918;
    out.gl_Position.z = _5005;
    out.gl_Position.w = _4896;
    float _5009 = _5007 * 0.5;
    float _5011 = -_4995;
    float _5013 = _5011 + 1.0;
    float _5015 = _5013 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_86.x = _5003;
    out.m_86.y = _5001;
    out.m_86.z = _5009;
    out.m_86.w = _4896;
    float _5017 = -_5015;
    float _5019 = _5017 + 1.0;
    float _5021 = _4640 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5023 = _5009;
    float _5025 = _5001;
    float _5027 = _5003;
    if (!_4991)
    {
        _5023 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5029 = _5023;
    float _5031 = _5029;
    float _5033 = _5029;
    if (!_4991)
    {
        _5025 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5035 = _5025;
    float _5037 = _5035;
    float _5039 = _5035;
    if (!_4991)
    {
        _5027 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5041 = _5027;
    float _5043 = _5015 * _4950;
    float _5045 = _4961 * _5043;
    float _5047 = _4961 * _5019;
    float _5049 = _4975 * _5043;
    float _5051 = fma(_4971, _5045, _4955);
    float _5053 = fma(_4973, _5045, _4957);
    float _5055 = fma(_4961, _5049, _4959);
    out.m_88.x = _5051;
    out.m_88.y = _5053;
    out.m_88.z = _5055;
    out.m_88.w = _5047;
    bool _5057 = !_4991;
    float _5059 = _5041;
    float _5061 = _5041;
    if (!_5057)
    {
        bool _5063 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5065 = isnan(_4800);
        bool _5067 = _5063 || _5065;
        bool _5069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5071 = _5067 || _5069;
        if (!_5071)
        {
            float _5073 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5075 = _4800 + _5073;
            float _5077 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5079 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5077;
            float _5081 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5083 = _5081 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5085 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5087 = _5085 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5089 = 1.0 / _5079;
            float _5091 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5093 = _5091 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5095 = _5075 * _5089;
            float _5097 = precise::clamp(_5095, 0.0, 1.0);
            float _5099 = fma(_5097, _5083, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5101 = fma(_5097, _5087, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5103 = fma(_5097, _5093, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _5039 = _5101;
            _5033 = _5099;
            _5061 = _5103;
            _5105 = true;
        }
        else
        {
            bool _5107 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5109 = isnan(_4800);
            bool _5111 = _5107 || _5109;
            bool _5113 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5115 = _5111 || _5113;
            if (!_5115)
            {
                _5031 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5117 = _5031;
            _5033 = _5117;
            if (!_5115)
            {
                _5037 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5119 = _5037;
            _5039 = _5119;
            if (!_5115)
            {
                _5059 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5121 = _5059;
            bool _5123 = !_5115;
            _5061 = _5121;
            if (!_5123)
            {
                bool _5125 = _4800 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5127 = isnan(_4800);
                bool _5129 = _5125 || _5127;
                bool _5131 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5133 = _5129 || _5131;
                if (!_5133)
                {
                    float _5135 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5137 = _4800 + _5135;
                    float _5139 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5141 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5139;
                    float _5143 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5145 = _5143 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5147 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5149 = _5147 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5151 = 1.0 / _5141;
                    float _5153 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5155 = _5153 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5157 = _5137 * _5151;
                    float _5159 = precise::clamp(_5157, 0.0, 1.0);
                    float _5161 = fma(_5159, _5145, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5163 = fma(_5159, _5149, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5165 = fma(_5159, _5155, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _5039 = _5163;
                    _5033 = _5161;
                    _5061 = _5165;
                    _5105 = true;
                }
                else
                {
                    _5039 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5033 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5061 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5105 = false;
    float _5167 = _5039;
    float _5169 = _5033;
    float _5171 = _5061;
    float _5173 = _5021 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5175 = _5167 * 0.586610972881317138671875;
    bool _5177 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5173;
    float _5179 = fma(_5169, 0.298911988735198974609375, _5175);
    bool _5181 = _4640 > 0.0;
    bool _5183 = isnan(_4640);
    bool _5185 = _5181 || _5183;
    bool _5187 = isnan(0.0);
    bool _5189 = _5185 || _5187;
    float _5191 = fma(_5171, 0.114477999508380889892578125, _5179);
    float _5193 = -_5191;
    float _5195 = _5193 + _5169;
    float _5197 = -_5191;
    float _5199 = _5197 + _5167;
    float _5201 = -_5191;
    float _5203 = _5201 + _5171;
    float _5205 = fma(_5195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    float _5207 = fma(_5199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    float _5209 = fma(_5203, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5191);
    bool _5211 = !_5177;
    if (!_5211)
    {
        float _5213 = -_4556;
        float _5215 = _5213 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5217 = -_4558;
        float _5219 = _5217 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5221 = -_4560;
        float _5223 = _5221 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5225 = _5215 * _5215;
        float _5227 = fma(_5219, _5219, _5225);
        float _5229 = fma(_5223, _5223, _5227);
        float _5231 = sqrt(_5229);
        float _5233 = rsqrt(_5229);
        float _5235 = -_5231;
        float _5237 = _5235 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5239 = _5237 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5241 = precise::clamp(_5239, 0.0, 1.0);
        float _5243 = _5219 * _5233;
        float _5245 = _5215 * _5233;
        float _5247 = abs(_5241);
        float _5249 = log2(_5247);
        float _5251 = _5223 * _5233;
        float _5253 = _5243 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5255 = _4108 * _5245;
        float _5257 = -_5245;
        float _5259 = -_5253;
        float _5261 = fma(_5257, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5259);
        float _5263 = fma(_4106, _5243, _5255);
        float _5265 = -_5251;
        float _5267 = fma(_5265, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5261);
        float _5269 = fma(_4110, _5251, _5263);
        float _5271 = precise::clamp(_5269, 0.0, 1.0);
        float _5273 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5275 = _5267 + _5273;
        float _5277 = _5249 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5279 = _5275 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5281 = precise::clamp(_5279, 0.0, 1.0);
        float _5283 = exp2(_5277);
        float _5285 = _5283 * _5281;
        float _5287 = _5271 * _5285;
        float _5289 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5291 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5293 = _5287 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5289;
        out.m_90.y = _5291;
        out.m_90.z = _5293;
    }
    out.m_70.x = _5205;
    out.m_70.y = _5207;
    out.m_70.z = _5209;
    if (_5189)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5295 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5295;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

