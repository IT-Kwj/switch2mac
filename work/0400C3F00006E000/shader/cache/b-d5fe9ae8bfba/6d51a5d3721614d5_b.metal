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
    bool _5009 = false;
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
        float _5256 = as_type<float>(_125);
        out.gl_Position.z = _5256;
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
        float _5329 = as_type<float>(_163);
        out.gl_Position.z = _5329;
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
    float _462 = _131 * 2.0;
    float _464 = _169 * 2.0;
    bool _466 = !_446;
    float _468 = _466 ? _256 : as_type<float>(_456);
    float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    bool _472 = !_450;
    float _474 = _472 ? _272 : as_type<float>(_436);
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _486 = _484 != 0;
    float _488 = float(_109);
    float _490 = floor(_462);
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _498 = _496 != 0;
    float _500 = float(_177);
    float _502 = float(_201);
    float _504 = 1.0 / _488;
    bool _506 = !_460;
    int _508 = _506 ? 0 : (-1);
    bool _510 = _502 >= _500;
    bool _512 = isnan(_502);
    bool _514 = _510 || _512;
    bool _516 = isnan(_500);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    int _522 = ~_258;
    int _524 = _522 + _508;
    int _526 = _524 + 1;
    bool _528 = _177 == 0;
    float _530 = floor(_464);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_498)
    {
        _532 = 1.0;
    }
    float _534 = _532;
    float _536 = _534;
    if (!_498)
    {
        _536 = 7.345489978790283203125;
    }
    float _538 = _536;
    int _540 = abs(_360);
    bool _542 = !_478;
    int _544 = _542 ? 0 : 1;
    float _546 = _538 * _131;
    float _548 = trunc(_520);
    int _550 = int(_548);
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _554 = _552 != 0;
    float _556 = floor(_546);
    float _558 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _560 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _562;
    float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _572 = -_556;
    float _574 = _546 + _572;
    float _576 = _145 * _504;
    int _578 = _177 + (-1);
    float _580 = _574 * _500;
    int _582 = _177 * _526;
    int _584 = _582 + _201;
    float _586 = _500 * _576;
    int _588 = ~_550;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = trunc(_580);
    int _596 = int(_594);
    bool _598 = !_528;
    int _600 = _598 ? _584 : (-1);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _602;
    float _606 = trunc(_586);
    int _608 = int(_606);
    int _610 = _600 * _592;
    int _612 = abs(_544);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _614;
    bool _618 = !_554;
    int _620 = _618 ? 0 : 1;
    int _622 = _550 * _578;
    int _624 = _622 + _610;
    int _626 = abs(_494);
    bool _628 = !_486;
    int _630 = _628 ? 0 : 1;
    int _632 = _624 * _626;
    int _634 = abs(_630);
    int _636 = abs(_620);
    int _638 = _596 * _540;
    int _640 = _638 + _201;
    int _642 = _608 * _612;
    int _644 = _642 + _632;
    int _646 = ~_177;
    int _648 = _646 + 1;
    int _650 = ~_177;
    int _652 = _650 + 1;
    int _654 = _640 * _634;
    int _656 = _654 + _644;
    bool _658 = _177 == 0;
    int _660 = ~_432;
    int _662 = _660 + 1;
    int _664 = _596 * _636;
    int _666 = _664 + _656;
    float _668 = float(uint(_666));
    float _670 = as_type<float>(_203) * _668;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    int _678 = _648 * int(_676);
    int _680 = _678 + _666;
    float _682 = float(uint(_680));
    float _684 = as_type<float>(_203) * _682;
    float _686 = trunc(_684);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = int(_676) + int(_690);
    int _694 = _652 * _692;
    int _696 = _694 + _666;
    float _698 = float(uint(_432));
    bool _700 = uint(_696) >= uint(_177);
    bool _702 = !_700;
    int _704 = _702 ? 0 : (-1);
    int _706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _708 = _706 != 0;
    int _710 = ~_692;
    int _712 = _710 + _704;
    int _714 = _712 + 1;
    bool _716 = !_708;
    int _718 = _716 ? 0 : 1;
    int _720 = _177 * _714;
    int _722 = _720 + _666;
    bool _724 = !_658;
    int _726 = _724 ? _722 : (-1);
    int _728 = _726 & 3;
    bool _730 = _728 != 0;
    int _732 = _726 & 3;
    bool _734 = _732 != 0;
    int _736 = _730 ? 0 : 1;
    bool _738 = uint(_732) >= 2u;
    int _740 = ~_736;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    int _746 = _738 ? 0 : 1;
    bool _748 = uint(_732) > 1u;
    int _750 = ~_746;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    bool _756 = !_734;
    int _758 = _756 ? 0 : 1;
    int _760 = _744;
    int _762 = _754;
    if (!_748)
    {
        int _764 = ~_736;
        int _766 = _764 + 1;
        _760 = _766;
    }
    int _768 = _760;
    float _770 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _772 = int(_770);
    bool _774 = _732 != 3;
    int _776 = abs(_768);
    if (_774)
    {
        int _778 = ~_746;
        int _780 = _778 + 1;
        _762 = _780;
    }
    int _782 = _762;
    float _784 = float(_772);
    float _786 = 1.0 / _698;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _790 = _788 != 0;
    bool _792 = !_790;
    int _794 = _792 ? 0 : 1;
    bool _796 = _438 > 0.5;
    float _798 = 1.0 / _784;
    float _800 = -_272;
    int _802 = _796 ? as_type<int>(_800) : as_type<int>(_272);
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _810 = _808 != 0;
    bool _812 = !_442;
    float _814 = _812 ? _272 : as_type<float>(_802);
    int _816 = as_type<int>(_786) + (-2);
    bool _818 = !_806;
    int _820 = _818 ? 0 : 1;
    bool _822 = !_810;
    int _824 = _822 ? 0 : 1;
    int _826 = abs(_820);
    float _828 = _145 * _798;
    int _830 = abs(_824);
    float _832 = trunc(_828);
    int _834 = int(_832);
    float _836 = float(_830);
    int _838 = ~_432;
    int _840 = _838 + 1;
    float _842 = float(uint(_834));
    float _844 = as_type<float>(_816) * _842;
    float _846 = trunc(_844);
    float _848 = precise::max(_846, 0.0);
    uint _850 = uint(_848);
    int _852 = _662 * int(_850);
    int _854 = _852 + _834;
    int _856 = ~_177;
    int _858 = _856 + 1;
    float _860 = float(uint(_854));
    float _862 = as_type<float>(_816) * _860;
    float _864 = trunc(_862);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    int _870 = ~_177;
    int _872 = _870 + 1;
    int _874 = int(_850) + int(_868);
    int _876 = _840 * _874;
    int _878 = _876 + _834;
    bool _880 = uint(_878) >= uint(_432);
    float _882 = float(uint(_640));
    bool _884 = !_880;
    int _886 = _884 ? 0 : (-1);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _890 = _888 != 0;
    float _892 = as_type<float>(_203) * _882;
    int _894 = ~_874;
    int _896 = _894 + _886;
    int _898 = _896 + 1;
    bool _900 = !_890;
    int _902 = _900 ? 0 : 1;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _910 = _908 != 0;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _914 = _912 != 0;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _918 = _916 != 0;
    float _920 = trunc(_892);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    int _926 = _432 * _898;
    int _928 = _926 + _834;
    int _930 = abs(_902);
    bool _932 = !_906;
    int _934 = _932 ? 0 : 1;
    bool _936 = !_910;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_914;
    int _942 = _940 ? 0 : 1;
    int _944 = abs(_938);
    int _946 = _858 * int(_924);
    int _948 = _946 + _640;
    float _950 = float(uint(_948));
    float _952 = as_type<float>(_203) * _950;
    float _954 = trunc(_952);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = float(_432);
    float _962 = _960 * _576;
    int _964 = int(_924) + int(_958);
    float _966 = as_type<float>(_924);
    float _968 = as_type<float>(_964);
    float _970 = _814;
    if (_498)
    {
        _966 = 1.0;
    }
    float _972 = _966;
    float _974 = trunc(_962);
    int _976 = int(_974);
    float _978 = _972;
    if (!_498)
    {
        _978 = 1.2345600128173828125;
    }
    float _980 = _978;
    int _982 = _872 * _964;
    int _984 = _982 + _640;
    float _986 = float(_834);
    bool _988 = uint(_984) >= uint(_177);
    float _990 = as_type<float>(_984);
    if (_498)
    {
        _990 = _131;
    }
    float _992 = _990;
    float _994 = _992;
    if (!_498)
    {
        _994 = _169;
    }
    float _996 = _994;
    bool _998 = _986 >= _960;
    bool _1000 = isnan(_986);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(_960);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    bool _1010 = !_988;
    int _1012 = _1010 ? 0 : (-1);
    float _1014 = _980 * _996;
    bool _1016 = _432 == 0;
    float _1018 = trunc(_1008);
    int _1020 = int(_1018);
    int _1022 = ~_964;
    int _1024 = _1022 + _1012;
    int _1026 = _1024 + 1;
    float _1028 = floor(_1014);
    int _1030 = ~_1020;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = -_1028;
    float _1038 = _1014 + _1036;
    int _1040 = _432 + (-1);
    float _1042 = _1038 * _960;
    bool _1044 = !_1016;
    int _1046 = _1044 ? _928 : (-1);
    bool _1048 = !_918;
    int _1050 = _1048 ? 0 : 1;
    float _1052 = trunc(_1042);
    int _1054 = int(_1052);
    int _1056 = _1046 * _1034;
    bool _1058 = _490 >= 0.0;
    bool _1060 = isnan(_490);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    int _1068 = _1020 * _1040;
    int _1070 = _1068 + _1056;
    int _1072 = abs(_934);
    float _1074 = -_452;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    int _1078 = _1070 * _944;
    int _1080 = abs(_942);
    float _1082 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    int _1086 = abs(_1050);
    int _1088 = _1054 * _930;
    int _1090 = _1088 + _834;
    int _1092 = _976 * _1072;
    int _1094 = _1092 + _1078;
    int _1096 = ~_432;
    int _1098 = _1096 + 1;
    int _1100 = _1090 * _1080;
    int _1102 = _1100 + _1094;
    int _1104 = _1054 * _1086;
    int _1106 = _1104 + _1102;
    int _1108 = ~_432;
    int _1110 = _1108 + 1;
    float _1112 = 1.0 / _1084;
    float _1114 = float(uint(_1106));
    float _1116 = as_type<float>(_816) * _1114;
    float _1118 = trunc(_1116);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = _1110 * int(_1122);
    int _1126 = _1124 + _1106;
    float _1128 = float(uint(_1126));
    float _1130 = as_type<float>(_816) * _1128;
    float _1132 = trunc(_1130);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = ~_432;
    int _1140 = _1138 + 1;
    int _1142 = int(_1122) + int(_1136);
    float _1144 = float(uint(_1090));
    int _1146 = _1098 * _1142;
    int _1148 = _1146 + _1106;
    float _1150 = as_type<float>(_816) * _1144;
    int _1152 = as_type<int>(_1144);
    float _1154 = as_type<float>(_1080);
    float _1156 = as_type<float>(_1072);
    float _1158 = _1112;
    float _1160 = _1084;
    if (_498)
    {
        _1152 = 0;
    }
    int _1162 = _1152;
    bool _1164 = uint(_1148) >= uint(_432);
    float _1166 = trunc(_1150);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = _1162;
    if (!_498)
    {
        _1172 = 1;
    }
    int _1174 = _1172;
    bool _1176 = !_1164;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1182 = _1180 != 0;
    int _1184 = ~_1142;
    int _1186 = _1184 + _1178;
    int _1188 = _1186 + 1;
    bool _1190 = !_1182;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = in.m_58.w;
    int _1196 = _1178;
    if (_498)
    {
        _1196 = 0;
    }
    int _1198 = _1196;
    int _1200 = _432 * _1188;
    int _1202 = _1200 + _1106;
    int _1204 = _1198;
    if (!_498)
    {
        _1204 = 2;
    }
    int _1206 = _1204;
    int _1208 = _177 * _1026;
    int _1210 = _1208 + _640;
    int _1212 = _1140 * int(_1170);
    int _1214 = _1212 + _1090;
    bool _1216 = !_1016;
    int _1218 = _1216 ? _1202 : (-1);
    bool _1220 = !_658;
    int _1222 = _1220 ? _1210 : (-1);
    int _1224 = _1218 & 3;
    bool _1226 = _1224 != 0;
    int _1228 = _1218 & 3;
    bool _1230 = _1228 != 0;
    float _1232 = float(uint(_1214));
    int _1234 = _1226 ? 0 : 1;
    bool _1236 = uint(_1228) > 1u;
    float _1238 = as_type<float>(_816) * _1232;
    int _1240 = ~_1234;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = ~_432;
    int _1248 = _1246 + 1;
    float _1250 = trunc(_1238);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    int _1256 = _1244;
    if (!_1236)
    {
        int _1258 = ~_1234;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    bool _1264 = uint(_1228) >= 2u;
    int _1266 = _1264 ? 0 : 1;
    bool _1268 = _1228 != 3;
    int _1270 = int(_1170) + int(_1254);
    int _1272 = ~_1266;
    int _1274 = _1272 + 1;
    int _1276 = _1274 + 1;
    int _1278 = _1248 * _1270;
    int _1280 = _1278 + _1090;
    int _1282 = _1276;
    if (_1268)
    {
        int _1284 = ~_1266;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    bool _1290 = uint(_1280) >= uint(_432);
    bool _1292 = !_1290;
    int _1294 = _1292 ? 0 : (-1);
    bool _1296 = _1174 != 1;
    float _1298 = in.m_49.x;
    float _1300 = in.m_49.y;
    float _1302 = in.m_49.z;
    if (!_1296)
    {
        _1154 = _169;
    }
    float _1304 = _1154;
    float _1306 = 0.0;
    float _1308 = _1304;
    if (!_1296)
    {
        _1306 = _173;
    }
    float _1310 = _1306;
    float _1312 = 0.0;
    float _1314 = _1310;
    if (!_1296)
    {
        _1312 = _1304;
    }
    float _1316 = _1312;
    float _1318 = _1316;
    if (!_1296)
    {
        _1156 = _173;
    }
    float _1320 = _1156;
    float _1322 = _1320;
    if (_1296)
    {
        _1318 = _131;
    }
    float _1324 = _1318;
    if (_1296)
    {
        _1308 = _131;
    }
    float _1326 = _1308;
    if (_1296)
    {
        _1314 = _169;
    }
    float _1328 = _1314;
    float _1330 = fma(_338, _1302, _1082);
    if (_1296)
    {
        _1322 = _169;
    }
    float _1332 = _1322;
    bool _1334 = _1206 != 2;
    float _1336 = in.m_44.x;
    float _1338 = in.m_44.y;
    float _1340 = in.m_44.z;
    float _1342 = 0.0;
    if (_1334)
    {
        _1342 = _131;
    }
    float _1344 = _1342;
    float _1346 = _1344;
    if (_1334)
    {
        _968 = _169;
    }
    float _1348 = _968;
    float _1350 = _1348;
    if (!_1334)
    {
        _1346 = _173;
    }
    float _1352 = _1346;
    if (!_1334)
    {
        _1350 = _131;
    }
    float _1354 = _1350;
    bool _1356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1358 = fma(_1330, _1194, _1340);
    float _1360 = -_1358;
    float _1362 = precise::max(0.0, _1360);
    float _1364 = _1082;
    if (_1356)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = precise::min(_1084, _1362);
    float _1372 = _1370 * _1112;
    if (_1356)
    {
        float _1374 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1158 = _1374;
    }
    float _1376 = _1158;
    float _1378 = _1376;
    if (_1356)
    {
        float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1372);
        _1378 = _1380;
    }
    float _1382 = _1378;
    float _1384 = 0.0;
    float _1386 = _1382;
    if (!_1356)
    {
        _1384 = _1372;
    }
    float _1388 = _1384;
    out.m_60.x = _1372;
    float _1390 = _1388;
    if (_1356)
    {
        float _1392 = _1382 * _1368;
        _1386 = _1392;
    }
    float _1394 = _1386;
    float _1396 = floor(_458);
    float _1398 = _1370;
    if (_1356)
    {
        float _1400 = floor(_1394);
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _458 + (-1.0);
    if (_1356)
    {
        float _1406 = -_1402;
        float _1408 = _1394 + _1406;
        _1390 = _1408;
    }
    float _1410 = _1390;
    bool _1412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    bool _1414 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1416 = isnan(_1410);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = _1402;
    if (_1412)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1426 = _1428;
    }
    float _1430 = _1426;
    if (_1412)
    {
        float _1432 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1160 = _1432;
    }
    float _1434 = _1160;
    float _1436 = 0.0;
    float _1438 = _1434;
    if (!_1412)
    {
        _1436 = _1372;
    }
    float _1440 = _1436;
    float _1442 = _1440;
    if (_1412)
    {
        float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1372);
        _1438 = _1444;
    }
    float _1446 = _1438;
    float _1448 = _1446;
    if (_1412)
    {
        float _1450 = _1446 * _1430;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1430;
    if (_1412)
    {
        float _1456 = floor(_1452);
        _1454 = _1456;
    }
    float _1458 = _1454;
    if (_1412)
    {
        float _1460 = -_1458;
        float _1462 = _1452 + _1460;
        _1442 = _1462;
    }
    float _1464 = _1442;
    bool _1466 = _1396 >= 0.0;
    bool _1468 = isnan(_1396);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    float _1476 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1478 = log2(_1476);
    int _1480 = _1066 ? 0 : 1;
    int _1482 = _1474 ? 0 : 1;
    bool _1484 = _1396 > 0.0;
    int _1486 = ~_1482;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    bool _1492 = _1228 != 3;
    float _1494 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _1496 = ~_1480;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    bool _1502 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1504 = isnan(_1464);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = _1494 * _470;
    float _1516 = _145 * _1478;
    float _1518 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _1520 = _1490;
    int _1522 = _1500;
    if (!_1484)
    {
        int _1524 = ~_1482;
        int _1526 = _1524 + 1;
        _1520 = _1526;
    }
    int _1528 = _1520;
    float _1530 = -_1512;
    float _1532 = _1530 + 1.0;
    bool _1534 = _490 > 0.0;
    float _1536 = _1518 * _566;
    bool _1538 = !_1230;
    int _1540 = _1538 ? 0 : 1;
    float _1542 = exp2(_1516);
    bool _1544 = _732 != 3;
    bool _1546 = !_1544;
    int _1548 = _1546 ? 0 : (-1);
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1556 = _1554 != 0;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1560 = _1558 != 0;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1566 = _530 > 0.0;
    if (!_1534)
    {
        int _1568 = ~_1480;
        int _1570 = _1568 + 1;
        _1522 = _1570;
    }
    int _1572 = _1522;
    float _1574 = 1.0 / _1564;
    bool _1576 = _530 >= 0.0;
    bool _1578 = isnan(_530);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(0.0);
    bool _1584 = _1580 || _1582;
    bool _1586 = !_1492;
    int _1588 = _1586 ? 0 : (-1);
    float _1590 = -_1542;
    float _1592 = _1590 + 1.0;
    int _1594 = _1584 ? 0 : 1;
    int _1596 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1598 = _1596 != 0;
    int _1600 = ~_1594;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    int _1606 = _1604;
    if (!_1566)
    {
        int _1608 = ~_1594;
        int _1610 = _1608 + 1;
        _1606 = _1610;
    }
    int _1612 = _1606;
    float _1614 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1624 = _1620 || _1622;
    float _1626 = _570 * _1574;
    int _1628 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1630 = _1628 != 0;
    float _1632 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1514);
    float _1634 = _131 + _169;
    float _1636 = _1624 ? _1592 : 0.0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1640 = _1638 != 0;
    float _1642 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1646 = _1634 + (-1.0);
    float _1648 = -_1644;
    float _1650 = fma(_1642, 2.0, _1648);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1662 = 1.0 / _1658;
    float _1664 = fma(_1614, -2.0, _1660);
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1668 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1672 = 1.0 / _1654;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1678 = -_1666;
    float _1680 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1678);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1686 = -_1668;
    float _1688 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1686);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1694 = -_1670;
    float _1696 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1698 = 1.0 / _1684;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1704 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1706 = _564 * _1662;
    float _1708 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1710 = -_1704;
    float _1712 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1710);
    float _1714 = 1.0 / _1692;
    float _1716 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1718 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1720 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1722 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1726 = -_1718;
    float _1728 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1730 = 1.0 / _1676;
    float _1732 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1736 = _1724 * 0.15915493667125701904296875;
    float _1738 = -_1722;
    float _1740 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1738);
    float _1742 = -_1732;
    float _1744 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1742);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1746;
    float _1750 = -_1734;
    float _1752 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1750);
    float _1754 = 1.0 / _1702;
    float _1756 = _1748 * _1672;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1774 = !_1552;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = _1764 * _1698;
    float _1780 = _1768 * _1730;
    float _1782 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1536);
    float _1784 = _131 + _173;
    float _1786 = _173 + _169;
    float _1788 = floor(_1782);
    float _1790 = _1784 + (-1.0);
    float _1792 = _1786 + (-1.0);
    float _1794 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1796 = _1760 * _1754;
    float _1798 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1800 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1802 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1804 = 1.0 + _1802;
    float _1806 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = -_1708;
    float _1810 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1808);
    float _1812 = _1736 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = -_1716;
    float _1818 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1816);
    float _1820 = -_1720;
    float _1822 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1820);
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1826 = 1.0 + _1824;
    float _1828 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1830 = -_1806;
    float _1832 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1830);
    float _1834 = -_1788;
    float _1836 = _1782 + _1834;
    float _1838 = _1782 * 6.283185482025146484375;
    float _1840 = floor(_1632);
    float _1842 = _1828 * _1826;
    float _1844 = _1772 * _1714;
    float _1846 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1818);
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1850 = 1.0 + _1848;
    float _1852 = -_1842;
    float _1854 = _1828 + _1852;
    float _1856 = _1838 * 0.15915493667125701904296875;
    float _1858 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1832);
    float _1860 = _1736 * 6.283185482025146484375;
    float _1862 = sin(_1860);
    float _1864 = fma(_1854, _169, _1842);
    float _1866 = _1814 * _1814;
    float _1868 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1870 = fma(_438, 2.0, -1.0);
    bool _1872 = !_1556;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = -_1868;
    float _1878 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1880 = -_1840;
    float _1882 = _1632 + _1880;
    float _1884 = _1632 * 6.283185482025146484375;
    float _1886 = 1.0 / _1850;
    float _1888 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1810);
    float _1890 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1728);
    float _1892 = _1884 * 0.15915493667125701904296875;
    float _1894 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1822);
    float _1896 = fma(_1862, _1862, _1866);
    float _1898 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1878);
    float _1900 = _1856 * 6.283185482025146484375;
    float _1902 = cos(_1900);
    float _1904 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1740);
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1908 = _1836 < 0.5;
    float _1910 = float(_1908);
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1914 = -_1882;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1918 = -_1836;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1922 = rsqrt(_1896);
    float _1924 = _1636 * _1886;
    bool _1926 = _1882 < 0.5;
    float _1928 = float(_1926);
    float _1930 = -_1912;
    float _1932 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1930);
    float _1934 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1664);
    bool _1936 = !_1560;
    int _1938 = _1936 ? 0 : 1;
    float _1940 = -_1928;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1944 = _1892 * 6.283185482025146484375;
    float _1946 = cos(_1944);
    float _1948 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1950 = fma(_1902, 0.5, 0.5);
    float _1952 = -_1910;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1956 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1958 = -_1906;
    float _1960 = fma(_1948, 2.0, _1958);
    float _1962 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1932);
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1966 = _1862 * _1922;
    float _1968 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1970 = fma(_338, _1300, _1956);
    float _1972 = _1814 * _1922;
    float _1974 = fma(_338, _1298, _1968);
    float _1976 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1978 = fma(_1946, 0.5, 0.5);
    float _1980 = -_1898;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1962);
    float _1984 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1988 = -_1978;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1994 = -_1986;
    float _1996 = fma(_1976, 2.0, _1994);
    float _1998 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2002 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1964);
    float _2004 = fma(_1970, _1194, _1338);
    float _2006 = fma(_1984, -2.0, _1992);
    float _2008 = fma(_1974, _1194, _1336);
    float _2010 = fma(_1998, -2.0, _2000);
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2016 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2018 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2020 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2022 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2014);
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2036 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2016);
    float _2038 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2018);
    float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2042 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2020);
    float _2044 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2036);
    float _2058 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2038);
    float _2060 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2042);
    out.m_62.x = _2044;
    out.m_62.y = _2046;
    out.m_62.z = _2048;
    float _2062 = -_145;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1960);
    float _2066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2010);
    out.m_64.x = _2050;
    out.m_64.y = _2052;
    out.m_64.z = _2054;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2070 = -_1950;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _2074 = abs(_1874);
    float _2076 = _2058 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2078 = _173 > 0.5;
    float _2080 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2006);
    float _2082 = float(_2074);
    float _2084 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2088 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2090 = _468 + 0.5;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2094 = _474 + (-0.5);
    float _2096 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2086);
    float _2098 = fma(_2084, _2090, _2064);
    float _2100 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2092);
    float _2102 = -_2088;
    float _2104 = -_2066;
    float _2106 = fma(_2102, _2094, _2104);
    float _2108 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2096);
    float _2110 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2112 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2100);
    float _2114 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2116 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _2118 = -_2108;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2112;
    float _2124 = _2122 + 1.0;
    float _2126 = fma(_426, _1300, _2114);
    float _2128 = fma(_426, _1298, _2110);
    float _2130 = fma(_426, _1302, _2116);
    float _2132 = -_2120;
    float _2134 = fma(_468, _2132, _2098);
    float _2136 = -_2126;
    float _2138 = _1970 + _2136;
    float _2140 = fma(_474, _2124, _2106);
    float _2142 = -_2128;
    float _2144 = _1974 + _2142;
    int _2146 = abs(_718);
    float _2148 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2152 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2154 = float(_826);
    float _2156 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2148);
    float _2158 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2150);
    float _2160 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2152);
    out.m_66.x = _2134;
    out.m_66.y = _2140;
    float _2162 = abs(_1916);
    float _2164 = _2154 * _2162;
    float _2166 = abs(_1920);
    float _2168 = _2154 * _2166;
    float _2170 = _1076 * _1372;
    float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2172;
    float _2176 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[193].y, _560);
    float _2178 = precise::max(0.0, _2170);
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _2180;
    float _2184 = float(_2146);
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _2186;
    float _2190 = precise::min(_2178, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2196 = fma(_2184, _1990, _2164);
    float _2198 = fma(_2184, _2072, _2168);
    float _2200 = _2190 * _2068;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2204 = _1410 + _2202;
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _2206;
    float _2210 = 1.0 / _2182;
    float _2212 = abs(_1942);
    float _2214 = fma(_836, _2212, _2196);
    float _2216 = fma(_1706, _2204, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2220 = _1410 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2224 = _2222 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2228 = _1410 + _2226;
    float _2230 = _2176 * 0.15915493667125701904296875;
    float _2232 = fma(_1778, _2220, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2234 = 1.0 / _2208;
    float _2236 = fma(_1844, _2228, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2240 = _1410 + _2238;
    float _2242 = abs(_1954);
    float _2244 = fma(_836, _2242, _2198);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2248 = _2246 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2252 = _1410 + _2250;
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2256 = _1410 + _2254;
    float _2258 = fma(_1780, _2240, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2260 = 1.0 / _2188;
    float _2262 = fma(_1626, _2252, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2264 = fma(_1796, _2256, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2268 = _1464 + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2272 = _1464 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2280 = _1410 + _2278;
    float _2282 = 1.0 / _2194;
    float _2284 = _2268 * _2234;
    float _2286 = fma(_1756, _2280, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2290 = _1464 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2296;
    float _2300 = _2230 * 6.283185482025146484375;
    float _2302 = sin(_2300);
    float _2304 = _2272 * _2260;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2308 = _1464 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _2314 = _169 > 0.5;
    float _2316 = fma(_2174, _2304, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2318 = _2308 * _2210;
    float _2320 = -_1864;
    float _2322 = _1966 * _2320;
    float _2324 = 1.0 / _2224;
    float _2326 = fma(_2298, _2318, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2328 = -_1864;
    float _2330 = _1972 * _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _2338 = _2336 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2340 = 1.0 / _2248;
    float _2342 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2344 = fma(_2334, _2318, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _2346 = -_2342;
    float _2348 = _1972 * _2346;
    float _2350 = _1966 * _2342;
    bool _2352 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2354 = isnan(_1410);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2360 = _2356 || _2358;
    float _2362 = float(_2360);
    float _2364 = 1.0 / _2276;
    float _2366 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2368 = _1464 + _2366;
    float _2370 = fma(_1076, _2322, _2348);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _2372;
    float _2376 = fma(_1076, _2330, _2350);
    float _2378 = _2368 * _2282;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2382 = _1464 + _2380;
    float _2384 = fma(_2374, _2304, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _2386 = _2290 * _2340;
    float _2388 = _2382 * _2324;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2392 = _1464 + _2390;
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _2394;
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _2400 = _2398 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2402;
    bool _2406 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2408 = isnan(_1410);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2414 = _2410 || _2412;
    float _2416 = float(_2414);
    float _2418 = _2392 * _2364;
    bool _2420 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2422 = isnan(_1410);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = fma(_2404, _2284, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2434 = fma(_2396, _2284, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    float _2436 = -_2362;
    float _2438 = _2436 + 1.0;
    float _2440 = fma(_2294, _2378, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2442 = -_2430;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2400, _2378, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2452 = fma(_2312, _2388, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2454 = _2362 * _2444;
    bool _2456 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2458 = isnan(_1410);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = fma(_2338, _2388, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _2470 = -_2416;
    float _2472 = _2470 + 1.0;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    bool _2478 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2480 = isnan(_1410);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2486 = _2482 || _2484;
    float _2488 = float(_2486);
    float _2490 = _2416 * _2438;
    float _2492 = fma(_2450, _2386, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2494 = _2466 * _2472;
    float _2496 = -_2466;
    float _2498 = _2496 + 1.0;
    float _2500 = fma(_2476, _2386, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    bool _2502 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2504 = isnan(_1410);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2510 = _2506 || _2508;
    float _2512 = float(_2510);
    float _2514 = -_2488;
    float _2516 = _2514 + 1.0;
    float _2518 = _2488 * _2498;
    bool _2520 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2522 = isnan(_1410);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = abs(_2200);
    float _2534 = log2(_2532);
    float _2536 = _2512 * _2516;
    float _2538 = -_2512;
    float _2540 = _2538 + 1.0;
    bool _2542 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2544 = isnan(_1464);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2550 = _2546 || _2548;
    float _2552 = float(_2550);
    float _2554 = -_2530;
    float _2556 = _2554 + 1.0;
    float _2558 = _1372 * _2376;
    float _2560 = _2530 * _2540;
    float _2562 = fma(_604, _2418, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2564 = -_2552;
    float _2566 = _2564 + 1.0;
    bool _2568 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2570 = isnan(_1464);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2576 = _2572 || _2574;
    float _2578 = float(_2576);
    float _2580 = _1424 * _2556;
    float _2582 = fma(_616, _2418, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    float _2584 = _1512 * _2566;
    bool _2586 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2588 = isnan(_1464);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = _2216 * _2580;
    int _2600 = ~_1270;
    int _2602 = _2600 + _1294;
    int _2604 = _2602 + 1;
    float _2606 = _2578 * _1532;
    float _2608 = -_2578;
    float _2610 = _2608 + 1.0;
    bool _2612 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2614 = isnan(_1464);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = -_2596;
    float _2626 = _2624 + 1.0;
    float _2628 = float(_1572);
    float _2630 = _2596 * _2610;
    bool _2632 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2634 = isnan(_1464);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = -_2622;
    float _2646 = _2644 + 1.0;
    float _2648 = float(_1528);
    float _2650 = _2622 * _2626;
    float _2652 = float(_1612);
    float _2654 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2656 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2658 = isnan(_1464);
    bool _2660 = _2656 || _2658;
    bool _2662 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2664 = _2660 || _2662;
    float _2666 = float(_2664);
    int _2668 = _432 * _2604;
    int _2670 = _2668 + _1090;
    bool _2672 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2674 = isnan(_1464);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2680 = _2676 || _2678;
    float _2682 = float(_2680);
    float _2684 = _2642 * _2646;
    float _2686 = -_2642;
    float _2688 = _2686 + 1.0;
    int _2690 = abs(_1776);
    float _2692 = -_2666;
    float _2694 = _2692 + 1.0;
    int _2696 = abs(_1938);
    float _2698 = _2666 * _2688;
    float _2700 = exp2(_2654);
    float _2702 = _2682 * _2694;
    float _2704 = _1372 * _2370;
    float _2706 = float(_2690);
    float _2708 = -_2682;
    float _2710 = _2708 + 1.0;
    float _2712 = _2316 * _2702;
    float _2714 = _2384 * _2702;
    float _2716 = _2082 * _2628;
    float _2718 = -_1424;
    float _2720 = _2718 + 1.0;
    float _2722 = in.m_68.x;
    float _2724 = in.m_68.y;
    float _2726 = in.m_68.z;
    float _2728 = _2706 * _2648;
    float _2730 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[175].z, _2714);
    float _2732 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2598);
    float _2734 = float(_2696);
    float _2736 = _2716 * (-2.0);
    float _2738 = fma(_2446, _2698, _2730);
    float _2740 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2076);
    float _2742 = _2700 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2744 = fma(_2262, _2560, _2732);
    float _2746 = _2734 * _2652;
    float _2748 = fma(_2344, _2684, _2738);
    float _2750 = -_1966;
    float _2752 = fma(_2750, _2742, _2704);
    float _2754 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2712);
    float _2756 = -_1972;
    float _2758 = fma(_2756, _2742, _2558);
    float _2760 = _2746 * (-2.0);
    float _2762 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2752);
    float _2764 = fma(_2440, _2698, _2754);
    float _2766 = _2728 * (-2.0);
    float _2768 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2758);
    float _2770 = _2056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2772 = _2060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2774 = fma(_1794, _2766, _1794);
    bool _2776 = !_1016;
    int _2778 = _2776 ? _2670 : (-1);
    float _2780 = fma(_2766, _2722, _2722);
    float _2782 = _2762 + _2770;
    bool _2784 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2786 = isnan(1.0);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2792 = _2788 || _2790;
    float _2794 = -_2740;
    float _2796 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2798 = _2768 + _2772;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2802 = !_2792;
    float _2804 = _2802 ? _145 : _1924;
    float _2806 = -_2782;
    float _2808 = _2806 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2810 = -_2798;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2814 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2800);
    float _2816 = _2796 * _2796;
    bool _2818 = _131 > 0.5;
    float _2820 = _131 + (-0.5);
    float _2822 = fma(_2736, _2724, _2724);
    float _2824 = fma(_2808, _2808, _2816);
    float _2826 = in.m_58.x;
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2780);
    float _2830 = fma(_2760, _2726, _2726);
    float _2832 = fma(_2812, _2812, _2824);
    float _2834 = _169 + (-0.5);
    float _2836 = fma(_2804, _2774, _2828);
    float _2838 = fma(_1800, _2736, _1800);
    float _2840 = fma(_2326, _2684, _2764);
    float _2842 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2822);
    float _2844 = rsqrt(_2832);
    float _2846 = _2836 * 0.15915493667125701904296875;
    float _2848 = _173 + (-0.5);
    float _2850 = fma(_2286, _2536, _2744);
    float _2852 = fma(_1798, _2760, _1798);
    float _2854 = fma(_2452, _2650, _2840);
    float _2856 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2830);
    float _2858 = fma(_2236, _2518, _2850);
    float _2860 = fma(_2468, _2650, _2748);
    float _2862 = fma(_2432, _2630, _2854);
    float _2864 = fma(_2804, _2852, _2856);
    float _2866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2868 = _2740 + _2866;
    float _2870 = fma(_2264, _2494, _2858);
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2874 = _2782 + _2872;
    float _2876 = fma(_2434, _2630, _2860);
    float _2878 = fma(_2804, _2838, _2842);
    float _2880 = _2808 * _2844;
    float _2882 = _2812 * _2844;
    float _2884 = fma(_2232, _2490, _2870);
    float _2886 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2888 = _2798 + _2886;
    float _2890 = _2880 * _2880;
    float _2892 = fma(_2492, _2606, _2862);
    float _2894 = fma(_2258, _2454, _2884);
    float _2896 = fma(_2500, _2606, _2876);
    float _2898 = fma(_2882, _2882, _2890);
    float _2900 = _2868 * _2868;
    float _2902 = -_1372;
    float _2904 = _2902 + 1.0;
    float _2906 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2894);
    float _2908 = rsqrt(_2898);
    float _2910 = fma(_2874, _2874, _2900);
    float _2912 = _2878 * 0.15915493667125701904296875;
    bool _2914 = _2904 >= 0.001000000047497451305389404296875;
    bool _2916 = isnan(_2904);
    bool _2918 = _2914 || _2916;
    bool _2920 = isnan(0.001000000047497451305389404296875);
    bool _2922 = _2918 || _2920;
    float _2924 = float(_2922);
    float _2926 = fma(_2888, _2888, _2910);
    float _2928 = _2826 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2932 = _2864 * 0.15915493667125701904296875;
    float _2934 = _2796 * _2844;
    float _2936 = _2928 * _2906;
    float _2938 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2930);
    float _2940 = sqrt(_2926);
    int _2942 = _1218 >> 31;
    float _2944 = _2936 * _2924;
    float _2946 = fma(_2562, _2584, _2892);
    float _2948 = _2882 * _2908;
    float _2950 = _2880 * _2908;
    float _2952 = _2214 * _2944;
    float _2954 = fma(_2582, _2584, _2896);
    float _2956 = -_2948;
    float _2958 = _2882 * _2956;
    float _2960 = _2846 * 6.283185482025146484375;
    float _2962 = sin(_2960);
    float _2964 = -_2948;
    float _2966 = _2934 * _2964;
    float _2968 = in.m_58.y;
    float _2970 = -_2958;
    float _2972 = fma(_2880, _2950, _2970);
    float _2974 = _2934 * _2950;
    float _2976 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2946);
    float _2978 = -_256;
    int _2980 = _2078 ? as_type<int>(_2978) : as_type<int>(_256);
    float _2982 = _2972 * _2972;
    float _2984 = _2912 * 6.283185482025146484375;
    float _2986 = sin(_2984);
    float _2988 = _2940 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2990 = _2976 + 1.0;
    float _2992 = fma(_2974, _2974, _2982);
    int _2994 = _2942 & 3;
    float _2996 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2814);
    float _2998 = _2322 * _2990;
    float _3000 = fma(_2966, _2966, _2992);
    float _3002 = _2912 * 6.283185482025146484375;
    float _3004 = cos(_3002);
    int _3006 = _1218 + _2994;
    float _3008 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[182].z, _2954);
    bool _3010 = !_1640;
    float _3012 = _3010 ? _256 : as_type<float>(_2980);
    float _3014 = -_2996;
    float _3016 = _3014 + 1.0;
    float _3018 = _2932 * 6.283185482025146484375;
    float _3020 = cos(_3018);
    float _3022 = _2962 * _2986;
    float _3024 = _2846 * 6.283185482025146484375;
    float _3026 = cos(_3024);
    float _3028 = _2962 * _3004;
    float _3030 = rsqrt(_2926);
    float _3032 = _2952 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3034 = _726 >> 31;
    float _3036 = _3032 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _3038 = _3034 & 3;
    float _3040 = rsqrt(_3000);
    float _3042 = _2962 * _3020;
    int _3044 = _726 + _3038;
    float _3046 = _3026 * _3004;
    int _3048 = _3006 >> 2;
    float _3050 = _3026 * _2986;
    int _3052 = _3044 >> 2;
    float _3054 = _3004 * _3020;
    float _3056 = precise::min(_3036, _2988);
    float _3058 = 1.0 / _1982;
    int _3060 = _3052 << 4;
    int _3062 = _3060 + 368;
    float _3064 = _3026 * _3020;
    int _3066 = _3048 << 4;
    int _3068 = _3066 + 512;
    float _3070 = _3030 * _3056;
    uint _3072 = uint(int(uint(_3062) >> uint(2)));
    uint _3074 = uint(int(uint(int(_3072)) >> uint(2)));
    int _3076 = int(_3072) & 3;
    float _3078 = (*spvDescriptorSet0.vp_c9)._m0[int(_3074)][_3076];
    int _3080 = int(_3072) + 1;
    uint _3082 = uint(int(uint(_3080) >> uint(2)));
    int _3084 = _3080 & 3;
    float _3086 = (*spvDescriptorSet0.vp_c9)._m0[int(_3082)][_3084];
    float _3088 = _2986 * _3020;
    float _3090 = _2972 * _3040;
    float _3092 = precise::clamp(_3090, 0.0, 1.0);
    float _3094 = _2932 * 6.283185482025146484375;
    float _3096 = sin(_3094);
    float _3098 = _2868 * _3070;
    float _3100 = _2874 * _3070;
    float _3102 = -_3092;
    float _3104 = _3102 + 1.0;
    out.m_70.w = _3056;
    float _3106 = -_3098;
    float _3108 = _2868 + _3106;
    uint _3110 = uint(int(uint(_3068) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    float _3126 = fma(_1894, _3058, -1.0);
    float _3128 = _3108 * _3108;
    float _3130 = _3104 * _3058;
    float _3132 = fma(_3104, _3126, 1.0);
    int _3134 = _3062 + 8;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
    int _3140 = int(_3136) & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = int(_3136) + 1;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    int _3148 = _3144 & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    float _3152 = _1888 * _3130;
    float _3154 = fma(_3096, _3046, _3022);
    float _3156 = fma(_3096, _3022, _3046);
    float _3158 = -_3100;
    float _3160 = _2874 + _3158;
    float _3162 = _2888 * _3070;
    float _3164 = -_3050;
    float _3166 = fma(_3096, _3028, _3164);
    float _3168 = -_3028;
    float _3170 = fma(_3096, _3050, _3168);
    float _3172 = fma(_3160, _3160, _3128);
    float _3174 = -_3162;
    float _3176 = _2888 + _3174;
    int _3178 = abs(_758);
    float _3180 = _3132 * _3132;
    int _3182 = abs(_1540);
    float _3184 = fma(_3176, _3176, _3172);
    float _3186 = _1904 * _3130;
    float _3188 = fma(_3152, _3152, _3180);
    float _3190 = _2968 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _3192 = _3068 + 8;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    float _3210 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3212 = int(_3210);
    int _3214 = abs(_782);
    float _3216 = _3190 * _2906;
    int _3218 = abs(_1262);
    float _3220 = fma(_3186, _3186, _3188);
    int _3222 = ~_3178;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    float _3228 = _3216 * _2924;
    int _3230 = ~_776;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    float _3236 = rsqrt(_3220);
    int _3238 = ~_3218;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _2244 * _3228;
    int _3246 = ~_3182;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3234 * as_type<int>(_3086);
    float _3254 = _3244 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _3256 = _3226 * as_type<int>(_3078);
    int _3258 = _3256 + _3252;
    int _3260 = ~_3214;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    float _3266 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3268 = int(_3266);
    int _3270 = abs(_1548);
    int _3272 = _3242 * as_type<int>(_3124);
    int _3274 = abs(_3212);
    float _3276 = float(uint(_3212));
    int _3278 = _3250 * as_type<int>(_3116);
    int _3280 = _3278 + _3272;
    int _3282 = ~_3270;
    int _3284 = _3282 + 1;
    int _3286 = _3284 + 1;
    float _3288 = _3186 * _3236;
    float _3290 = _3152 * _3236;
    int _3292 = _3264 * as_type<int>(_3142);
    int _3294 = _3292 + _3258;
    float _3296 = 1.0 / _3276;
    int _3298 = abs(_794);
    int _3300 = _3286 * as_type<int>(_3150);
    int _3302 = _3300 + _3294;
    int _3304 = abs(_1288);
    float _3306 = _3132 * _3236;
    float _3308 = float(uint(_3274));
    int _3310 = ~_3298;
    int _3312 = _3310 + 1;
    int _3314 = _3312 + 1;
    int _3316 = abs(_1588);
    int _3318 = _3302 * _3314;
    int _3320 = abs(_3268);
    float _3322 = 1.0 / _3308;
    int _3324 = ~_3304;
    int _3326 = _3324 + 1;
    int _3328 = _3326 + 1;
    int _3330 = _1222 * _3298;
    int _3332 = _3330 + _3318;
    float _3334 = _2882 * _3306;
    int _3336 = ~_3316;
    int _3338 = _3336 + 1;
    int _3340 = _3338 + 1;
    int _3342 = _3328 * as_type<int>(_3200);
    int _3344 = _3342 + _3280;
    int _3346 = abs(_1192);
    float _3348 = -_3288;
    float _3350 = -_3334;
    float _3352 = fma(_2934, _3348, _3350);
    float _3354 = float(uint(_3320));
    int _3356 = _3340 * as_type<int>(_3208);
    int _3358 = _3356 + _3344;
    int _3360 = as_type<int>(_3296) + (-2);
    float _3362 = -_3288;
    float _3364 = _2880 * _3362;
    float _3366 = float(uint(_3332));
    float _3368 = 1.0 / _3354;
    float _3370 = float(uint(_3268));
    float _3372 = -_3290;
    float _3374 = -_3364;
    float _3376 = fma(_2882, _3372, _3374);
    int _3378 = as_type<int>(_3322) + (-2);
    float _3380 = as_type<float>(_3360) * _3366;
    float _3382 = -_3290;
    float _3384 = _2934 * _3382;
    int _3386 = ~_3346;
    int _3388 = _3386 + 1;
    int _3390 = _3388 + 1;
    float _3392 = _3376 * _3376;
    float _3394 = 1.0 / _3370;
    int _3396 = abs(_3332);
    float _3398 = -_3384;
    float _3400 = fma(_2880, _3306, _3398);
    int _3402 = _3358 * _3390;
    int _3404 = ~_3212;
    int _3406 = _3404 + 1;
    float _3408 = float(uint(_3396));
    int _3410 = _2778 * _3346;
    int _3412 = _3410 + _3402;
    float _3414 = trunc(_3380);
    float _3416 = precise::max(_3414, 0.0);
    uint _3418 = uint(_3416);
    float _3420 = as_type<float>(_3378) * _3408;
    float _3422 = fma(_3352, _3352, _3392);
    float _3424 = float(uint(_3412));
    float _3426 = trunc(_3420);
    float _3428 = precise::max(_3426, 0.0);
    uint _3430 = uint(_3428);
    int _3432 = as_type<int>(_3394) + (-2);
    float _3434 = fma(_3400, _3400, _3422);
    int _3436 = ~_3274;
    int _3438 = _3436 + 1;
    int _3440 = _3406 * int(_3418);
    int _3442 = _3440 + _3332;
    float _3444 = as_type<float>(_3432) * _3424;
    float _3446 = sqrt(_3184);
    float _3448 = float(uint(_3442));
    int _3450 = _3438 * int(_3430);
    int _3452 = _3450 + _3396;
    int _3454 = as_type<int>(_3368) + (-2);
    float _3456 = as_type<float>(_3360) * _3448;
    float _3458 = trunc(_3444);
    float _3460 = precise::max(_3458, 0.0);
    uint _3462 = uint(_3460);
    int _3464 = ~_3268;
    int _3466 = _3464 + 1;
    float _3468 = float(uint(_3452));
    int _3470 = abs(_3412);
    float _3472 = _3030 * _3446;
    float _3474 = as_type<float>(_3378) * _3468;
    float _3476 = rsqrt(_3434);
    float _3478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    float _3480 = _3032 * _3472;
    float _3482 = _3254 * _3472;
    float _3484 = float(uint(_3470));
    float _3486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _3488 = _3480 * _3478;
    int _3490 = _3466 * int(_3462);
    int _3492 = _3490 + _3412;
    float _3494 = trunc(_3474);
    float _3496 = precise::max(_3494, 0.0);
    uint _3498 = uint(_3496);
    float _3500 = as_type<float>(_3454) * _3484;
    int _3502 = ~_3274;
    int _3504 = _3502 + 1;
    out.m_72.x = _3480;
    float _3506 = float(uint(_3492));
    float _3508 = _3482 * _3486;
    float _3510 = trunc(_3456);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    float _3516 = _3352 * _3476;
    float _3518 = as_type<float>(_3432) * _3506;
    float _3520 = _3400 * _3476;
    float _3522 = _3376 * _3476;
    float _3524 = trunc(_3500);
    float _3526 = precise::max(_3524, 0.0);
    uint _3528 = uint(_3526);
    int _3530 = int(_3430) + int(_3498);
    float _3532 = _2882 * _3516;
    int _3534 = int(_3418) + int(_3514);
    float _3536 = -_3532;
    float _3538 = fma(_2880, _3520, _3536);
    int _3540 = ~_3212;
    int _3542 = _3540 + 1;
    float _3544 = _2934 * _3520;
    int _3546 = ~_3320;
    int _3548 = _3546 + 1;
    float _3550 = trunc(_3518);
    float _3552 = precise::max(_3550, 0.0);
    uint _3554 = uint(_3552);
    float _3556 = -_3544;
    float _3558 = fma(_2882, _3522, _3556);
    float _3560 = _2880 * _3522;
    int _3562 = _3542 * _3534;
    int _3564 = _3562 + _3332;
    float _3566 = -_3560;
    float _3568 = fma(_2934, _3516, _3566);
    int _3570 = _3548 * int(_3528);
    int _3572 = _3570 + _3470;
    float _3574 = _3538 * _3538;
    int _3576 = _3504 * _3530;
    int _3578 = _3576 + _3396;
    bool _3580 = uint(_3564) >= uint(_3212);
    float _3582 = float(uint(_3572));
    bool _3584 = !_3580;
    int _3586 = _3584 ? 0 : (-1);
    bool _3588 = uint(_3578) >= uint(_3274);
    float _3590 = fma(_3558, _3558, _3574);
    float _3592 = as_type<float>(_3454) * _3582;
    int _3594 = ~_3534;
    int _3596 = _3594 + _3586;
    int _3598 = _3596 + 1;
    float _3600 = -_3508;
    float _3602 = _3096 * _3600;
    float _3604 = fma(_3568, _3568, _3590);
    float _3606 = trunc(_3592);
    float _3608 = precise::max(_3606, 0.0);
    uint _3610 = uint(_3608);
    int _3612 = int(_3462) + int(_3554);
    float _3614 = _3064 * _3508;
    int _3616 = ~_3268;
    int _3618 = _3616 + 1;
    float _3620 = _3042 * _3508;
    bool _3622 = !_3588;
    int _3624 = _3622 ? 0 : (-1);
    int _3626 = _3212 * _3598;
    int _3628 = _3626 + _3332;
    bool _3630 = _3212 == 0;
    float _3632 = rsqrt(_3604);
    int _3634 = _3618 * _3612;
    int _3636 = _3634 + _3412;
    int _3638 = ~_3320;
    int _3640 = _3638 + 1;
    float _3642 = fma(_3154, _3488, _3614);
    float _3644 = fma(_3054, _3488, _3602);
    float _3646 = fma(_3166, _3488, _3620);
    bool _3648 = !_3630;
    int _3650 = _3648 ? _3628 : (-1);
    bool _3652 = uint(_3636) >= uint(_3268);
    int _3654 = int(_3528) + int(_3610);
    float _3656 = -_256;
    int _3658 = _2818 ? as_type<int>(_3656) : as_type<int>(_256);
    bool _3660 = _3212 == 0;
    float _3662 = _3538 * _3632;
    int _3664 = _3332 ^ _3212;
    float _3666 = _3558 * _3632;
    bool _3668 = !_3652;
    int _3670 = _3668 ? 0 : (-1);
    float _3672 = _3568 * _3632;
    int _3674 = _3640 * _3654;
    int _3676 = _3674 + _3470;
    float _3678 = _3154 * _3666;
    int _3680 = ~_3612;
    int _3682 = _3680 + _3670;
    int _3684 = _3682 + 1;
    float _3686 = _2880 * _3672;
    float _3688 = _3064 * _3666;
    bool _3690 = uint(_3676) >= uint(_3320);
    float _3692 = _2934 * _3666;
    float _3694 = _2882 * _3662;
    float _3696 = -_3686;
    float _3698 = fma(_2882, _3666, _3696);
    float _3700 = _3170 * _3666;
    float _3702 = _3642 * _3666;
    float _3704 = _3154 * _3662;
    float _3706 = _3064 * _3662;
    float _3708 = _3170 * _3662;
    float _3710 = _3642 * _3662;
    float _3712 = -_3692;
    float _3714 = fma(_2880, _3662, _3712);
    float _3716 = -_3694;
    float _3718 = fma(_2934, _3672, _3716);
    float _3720 = _3698 * _3698;
    float _3722 = _3642 * _3672;
    float _3724 = _3064 * _3672;
    bool _3726 = !_1598;
    float _3728 = _3726 ? _256 : as_type<float>(_3658);
    float _3730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3732 = !_3690;
    int _3734 = _3732 ? 0 : (-1);
    int _3736 = _3268 * _3684;
    int _3738 = _3736 + _3412;
    bool _3740 = _3268 == 0;
    float _3742 = _3154 * _3672;
    bool _3744 = _3268 == 0;
    float _3746 = _3170 * _3672;
    int _3748 = _3412 ^ _3268;
    float _3750 = fma(_3718, _3718, _3720);
    uint _3752 = uint(int(uint(_3664) >> uint(31)));
    float _3754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3756 = ~_3624;
    int _3758 = _3530 + _3756;
    int _3760 = _3758 + 1;
    float _3762 = -_145;
    float _3764 = fma(_3762, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1650);
    int _3766 = ~_3734;
    int _3768 = _3654 + _3766;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3714, _3714, _3750);
    int _3774 = ~int(_3752);
    int _3776 = _3774 + 1;
    float _3778 = _3730 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3780 = float(_3650);
    float _3782 = -_145;
    float _3784 = fma(_3782, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1996);
    int _3786 = _3760 ^ _3776;
    float _3788 = rsqrt(_3772);
    float _3790 = fma(_3778, _3780, _3764);
    int _3792 = ~_3776;
    int _3794 = _3792 + _3786;
    int _3796 = _3794 + 1;
    bool _3798 = !_3740;
    int _3800 = _3798 ? _3738 : (-1);
    float _3802 = _3754 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3804 = uint(int(uint(_3748) >> uint(31)));
    float _3806 = float(_3800);
    float _3808 = _3728 + 0.5;
    int _3810 = ~int(_3804);
    int _3812 = _3810 + 1;
    float _3814 = fma(_3802, _3806, _3784);
    float _3816 = fma(_3778, _3808, _3790);
    float _3818 = _3012 + 0.5;
    float _3820 = _3718 * _3788;
    float _3822 = _3698 * _3788;
    float _3824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3826 = _3714 * _3788;
    float _3828 = fma(_3054, _3820, _3678);
    float _3830 = -_3096;
    float _3832 = fma(_3830, _3820, _3688);
    float _3834 = -_3096;
    float _3836 = fma(_3834, _3822, _3706);
    float _3838 = fma(_3054, _3826, _3742);
    float _3840 = -_3096;
    float _3842 = fma(_3840, _3826, _3724);
    float _3844 = fma(_3088, _3826, _3746);
    float _3846 = fma(_3644, _3826, _3722);
    float _3848 = fma(_3088, _3820, _3700);
    float _3850 = fma(_3644, _3820, _3702);
    float _3852 = fma(_3802, _3818, _3814);
    float _3854 = fma(_2882, _3646, _3846);
    bool _3856 = !_3660;
    int _3858 = _3856 ? _3796 : (-1);
    float _3860 = fma(_2880, _3646, _3850);
    float _3862 = fma(_3644, _3822, _3710);
    float _3864 = _2798 + _3854;
    float _3866 = float(_3858);
    float _3868 = _3824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3872 = _2782 + _3860;
    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3876 = _3864 + _3874;
    float _3878 = -_1934;
    float _3880 = fma(_3868, _3866, _3878);
    int _3882 = _3770 ^ _3812;
    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3886 = _3872 + _3884;
    float _3888 = _3876 * _3876;
    float _3890 = fma(_3088, _3822, _3708);
    float _3892 = fma(_3054, _3822, _3704);
    float _3894 = fma(_3156, _2880, _3848);
    float _3896 = fma(_3886, _3886, _3888);
    int _3898 = ~_3812;
    int _3900 = _3898 + _3882;
    int _3902 = _3900 + 1;
    float _3904 = fma(_2934, _3646, _3862);
    float _3906 = -_272;
    int _3908 = _2314 ? as_type<int>(_3906) : as_type<int>(_272);
    float _3910 = sqrt(_3896);
    float _3912 = fma(_3156, _2934, _3890);
    float _3914 = fma(_3156, _2882, _3844);
    bool _3916 = !_3744;
    int _3918 = _3916 ? _3902 : (-1);
    float _3920 = _3870 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3922 = !_1630;
    float _3924 = _3922 ? _272 : as_type<float>(_3908);
    float _3926 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3928 = float(_3918);
    float _3930 = fma(_3042, _2880, _3832);
    float _3932 = fma(_3042, _2934, _3836);
    float _3934 = _3924 + (-0.5);
    float _3936 = fma(_3042, _2882, _3842);
    float _3938 = -_2080;
    float _3940 = fma(_3920, _3928, _3938);
    float _3942 = _814 + (-0.5);
    float _3944 = -_3868;
    float _3946 = fma(_3944, _3934, _3880);
    float _3948 = fma(_3926, _3926, 1.0);
    bool _3950 = _3910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3952 = -_3920;
    float _3954 = fma(_3952, _3942, _3940);
    float _3956 = fma(_3166, _2880, _3828);
    float _3958 = rsqrt(_3948);
    float _3960 = fma(_3166, _2934, _3892);
    float _3962 = fma(_3166, _2882, _3838);
    float _3964 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3926 * _3930;
    float _3968 = _3926 * _3932;
    float _3970 = _3926 * _3936;
    float _3972 = _2740 + _3904;
    out.m_74.x = _3956;
    out.m_74.y = _3960;
    out.m_74.z = _3962;
    float _3974 = fma(_3964, _3956, _3966);
    float _3976 = _3880;
    float _3978 = _3966;
    float _3980 = _3964;
    float _3982 = _2126;
    float _3984 = _2130;
    if (!_3950)
    {
        _3976 = _3872;
    }
    float _3986 = _3976;
    float _3988 = _3986;
    if (!_3950)
    {
        _3978 = _3864;
    }
    float _3990 = _3978;
    float _3992 = fma(_3964, _3960, _3968);
    float _3994 = fma(_3964, _3962, _3970);
    float _3996 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2022);
    float _3998 = _3990;
    if (!_3950)
    {
        _3980 = _3972;
    }
    float _4000 = _3980;
    bool _4002 = !_3950;
    float _4004 = _4000;
    if (!_4002)
    {
        float _4006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4010 = _3910 + _4008;
        float _4012 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4014 = rsqrt(_3896);
        float _4016 = _4010 * _4006;
        float _4018 = _4016 * 0.15915493667125701904296875;
        float _4020 = _4018 * 6.283185482025146484375;
        float _4022 = cos(_4020);
        float _4024 = _4018 * 6.283185482025146484375;
        float _4026 = sin(_4024);
        float _4028 = _4022 + (-1.0);
        float _4030 = _4028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4032 = fma(_4026, _4012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4034 = fma(_3972, _4022, _4030);
        float _4036 = _4014 * _4032;
        float _4038 = fma(_3886, _4036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4040 = fma(_3876, _4036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4004 = _4034;
        _3988 = _4038;
        _3998 = _4040;
    }
    float _4042 = _4004;
    float _4044 = _3988;
    float _4046 = _3998;
    float _4048 = -_2740;
    float _4050 = _4048 + _4042;
    float _4052 = -_3016;
    float _4054 = fma(_3728, _4052, _3816);
    float _4056 = -_3996;
    float _4058 = _4056 + 1.0;
    float _4060 = -_2782;
    float _4062 = _4060 + _4044;
    float _4064 = _4050 * _4050;
    float _4066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2938);
    float _4068 = -_4058;
    float _4070 = fma(_3012, _4068, _3852);
    float _4072 = -_2798;
    float _4074 = _4072 + _4046;
    float _4076 = fma(_4062, _4062, _4064);
    float _4078 = _3926 * _3958;
    float _4080 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2002);
    float _4082 = -_4066;
    float _4084 = _4082 + 1.0;
    float _4086 = fma(_4074, _4074, _4076);
    float _4088 = -_3894;
    float _4090 = _4078 * _4088;
    float _4092 = -_4080;
    float _4094 = _4092 + 1.0;
    float _4096 = -_3912;
    float _4098 = _4078 * _4096;
    float _4100 = sqrt(_4086);
    float _4102 = -_3914;
    float _4104 = _4078 * _4102;
    float _4106 = fma(_3924, _4084, _3946);
    float _4108 = fma(_3958, _3930, _4090);
    float _4110 = fma(_814, _4094, _3954);
    float _4112 = fma(_3958, _3932, _4098);
    float _4114 = fma(_3958, _3936, _4104);
    float _4116 = _3894 + _3974;
    float _4118 = _3912 + _3992;
    float _4120 = _3914 + _3994;
    float _4122 = _3008 + 1.0;
    out.m_76.x = _4108;
    out.m_76.y = _4112;
    out.m_76.z = _4114;
    float _4124 = -_2130;
    float _4126 = _1330 + _4124;
    float _4128 = -_3162;
    float _4130 = _4128 + _4046;
    float _4132 = _2330 * _4122;
    out.m_78.x = _4116;
    out.m_78.y = _4118;
    out.m_78.z = _4120;
    bool _4134 = _4100 > 0.0;
    float _4136 = -_3098;
    float _4138 = _4136 + _4042;
    float _4140 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2156);
    out.m_80.x = _4054;
    out.m_80.y = _4106;
    out.m_80.z = _4070;
    out.m_80.w = _4110;
    float _4142 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2160);
    float _4144 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2158);
    float _4146 = fma(_2998, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4140);
    float _4148 = fma(_4132, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4142);
    float _4150 = -_3100;
    float _4152 = _2782 + _4150;
    float _4154 = -_3098;
    float _4156 = _2740 + _4154;
    float _4158 = -_3162;
    float _4160 = _2798 + _4158;
    float _4162 = _4126;
    float _4164 = _4046;
    float _4166 = _4114;
    float _4168 = _4112;
    float _4170 = _4108;
    float _4172 = _4070;
    float _4174 = _4106;
    float _4176 = _4054;
    if (!_4134)
    {
        _4162 = _4138;
    }
    float _4178 = _4162;
    float _4180 = _4178;
    float _4182 = _4178;
    if (!_4134)
    {
        _4164 = _4130;
    }
    float _4184 = _4164;
    float _4186 = -_3100;
    float _4188 = _4186 + _4044;
    float _4190 = _4184;
    float _4192 = _4184;
    if (!_4134)
    {
        _970 = _4188;
    }
    float _4194 = _970;
    bool _4196 = !_4134;
    float _4198 = _4194;
    float _4200 = _4194;
    float _4202 = _4194;
    if (!_4196)
    {
        bool _4204 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4206 = _4054;
        if (_4204)
        {
            float _4208 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4206 = _4208;
        }
        float _4210 = _4206;
        if (_4204)
        {
            _4166 = _4146;
        }
        float _4212 = _4166;
        float _4214 = _4212;
        if (_4204)
        {
            _4168 = _4144;
        }
        float _4216 = _4168;
        float _4218 = _4216;
        if (_4204)
        {
            _4170 = _4148;
        }
        float _4220 = _4170;
        float _4222 = _4210;
        float _4224 = _4220;
        if (_4204)
        {
            float _4226 = _4146 * _4210;
            _4172 = _4226;
        }
        float _4228 = _4172;
        float _4230 = _4228;
        if (_4204)
        {
            float _4232 = _4144 * _4210;
            _4174 = _4232;
        }
        float _4234 = _4174;
        float _4236 = _4234;
        if (_4204)
        {
            float _4238 = _4148 * _4210;
            _4222 = _4238;
        }
        float _4240 = _4222;
        float _4242 = _4240;
        if (!_4204)
        {
            bool _4244 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4246 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4248 = _4244 || _4246;
            bool _4250 = isnan(1.0);
            bool _4252 = _4248 || _4250;
            float _4254 = _145 + 1.0;
            float _4256 = _4254;
            if (!_4252)
            {
                float _4258 = _4254 * _4254;
                float _4260 = _4258 * 0.5;
                _4198 = _4260;
            }
            float _4262 = _4198;
            float _4264 = _4262;
            if (!_4252)
            {
                float _4266 = _4262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4264 = _4266;
            }
            float _4268 = _4264;
            bool _4270 = !_4252;
            float _4272 = _4268;
            if (!_4270)
            {
                float _4274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4276 = log2(_4274);
                float _4278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4280 = _4278 + 1.0;
                float _4282 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4284 = _4276 * _4254;
                float _4286 = 1.0 / _4280;
                float _4288 = _4282 * 0.693147182464599609375;
                float _4290 = exp2(_4284);
                float _4292 = 1.0 / _4288;
                float _4294 = _4290 + (-1.0);
                float _4296 = -_4294;
                float _4298 = fma(_4296, _4292, _4254);
                float _4300 = _4298 * _4286;
                float _4302 = _4300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4272 = _4302;
            }
            float _4304 = _4272;
            float _4306 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4308 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4310 = !_4252;
            _4180 = _4306;
            _4200 = _4304;
            if (!_4310)
            {
                float _4312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4314 = log2(_4312);
                float _4316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4318 = _4316 + 1.0;
                float _4320 = 1.0 / _4318;
                float _4322 = _4314 * _4254;
                float _4324 = exp2(_4322);
                float _4326 = -_4324;
                float _4328 = _4326 + 1.0;
                float _4330 = _4328 * _4320;
                _4256 = _4330;
            }
            float _4332 = _4256;
            float _4334 = fma(_4332, _1300, _4308);
            float _4336 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4338 = fma(_4332, _1298, _4306);
            float _4340 = -_2126;
            float _4342 = _4340 + _4334;
            float _4344 = fma(_4332, _1302, _4336);
            float _4346 = -_2128;
            float _4348 = _4346 + _4338;
            float _4350 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4352 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4354 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4356 = -_2130;
            float _4358 = _4356 + _4344;
            float _4360 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4350);
            float _4362 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4352);
            float _4364 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4354);
            float _4366 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4360);
            float _4368 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4362);
            float _4370 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4364);
            _4218 = _4368;
            _4214 = _4366;
            _4224 = _4370;
            _4230 = _4366;
            _4236 = _4368;
            _4242 = _4370;
            _4190 = _4364;
        }
        float _4372 = _4218;
        float _4374 = _4214;
        float _4376 = _4224;
        float _4378 = _4230;
        float _4380 = _4236;
        float _4382 = _4242;
        float _4384 = _4180;
        float _4386 = _4200;
        float _4388 = _4190;
        float _4390 = _4372 * _4372;
        float _4392 = fma(_4374, _4374, _4390);
        float _4394 = fma(_4376, _4376, _4392);
        float _4396 = rsqrt(_4086);
        float _4398 = sqrt(_4394);
        float _4400 = _4062 * _4396;
        float _4402 = _4050 * _4396;
        float _4404 = _4074 * _4396;
        bool _4406 = _4398 > 0.0;
        float _4408 = _4386;
        float _4410 = _4384;
        float _4412 = _4388;
        _4176 = _4382;
        if (!_4406)
        {
            _4408 = _4188;
        }
        float _4414 = _4408;
        _4202 = _4414;
        if (!_4406)
        {
            _4410 = _4138;
        }
        float _4416 = _4410;
        _4182 = _4416;
        if (!_4406)
        {
            _4412 = _4130;
        }
        float _4418 = _4412;
        bool _4420 = !_4406;
        _4192 = _4418;
        if (!_4420)
        {
            float _4422 = rsqrt(_4394);
            float _4424 = _4422 * _4372;
            float _4426 = _4422 * _4374;
            float _4428 = _4422 * _4376;
            float _4430 = _4402 * _4424;
            float _4432 = fma(_4400, _4426, _4430);
            float _4434 = fma(_4404, _4428, _4432);
            float _4436 = _4434 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4438 = fma(_4378, _4436, _4188);
            float _4440 = fma(_4380, _4436, _4138);
            float _4442 = fma(_4382, _4436, _4130);
            _4182 = _4440;
            _4202 = _4438;
            _4192 = _4442;
        }
    }
    float _4444 = _4182;
    float _4446 = _4202;
    float _4448 = _4192;
    float _4450 = _4176;
    float _4452 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4454 = _4444 + _4452;
    float _4456 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4458 = _4446 + _4456;
    float _4460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4462 = _4448 + _4460;
    float _4464 = _4454 * _4454;
    float _4466 = fma(_4458, _4458, _4464);
    float _4468 = fma(_4462, _4462, _4466);
    float _4470 = rsqrt(_4468);
    float _4472 = sqrt(_4468);
    float _4474 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4476 = _4458 * _4474;
    float _4478 = _4462 * _4474;
    float _4480 = _4476 * _4476;
    float _4482 = _4478 * _4478;
    float _4484 = _4480 + _4482;
    float _4486 = sqrt(_4484);
    bool _4488 = _4486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4492 = _4486 + _4490;
    float _4494 = _4470;
    float _4496 = _4484;
    float _4498 = _4492;
    float _4500 = _4454;
    float _4502 = _4450;
    if (_4488)
    {
        float _4504 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4494 = _4504;
    }
    float _4506 = _4494;
    if (_4488)
    {
        float _4508 = rsqrt(_4484);
        _4496 = _4508;
    }
    float _4510 = _4496;
    float _4512 = _4510;
    if (_4488)
    {
        float _4514 = _4492 * _4506;
        _4498 = _4514;
    }
    float _4516 = _4498;
    if (_4488)
    {
        float _4518 = _4516 * 0.15915493667125701904296875;
        _3982 = _4518;
    }
    float _4520 = _3982;
    float _4522 = _4462;
    if (_4488)
    {
        float _4524 = _4520 * 6.283185482025146484375;
        float _4526 = sin(_4524);
        _4522 = _4526;
    }
    float _4528 = _4522;
    float _4530 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4532 = precise::max(0.0, _4530);
    float _4534 = _4506;
    float _4536 = _4532;
    if (_4488)
    {
        float _4538 = _4520 * 6.283185482025146484375;
        float _4540 = cos(_4538);
        _4534 = _4540;
    }
    float _4542 = _4534;
    float _4544 = -_4474;
    float _4546 = -_4532;
    float _4548 = fma(_4454, _4544, _4546);
    if (_4488)
    {
        float _4550 = _4548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4500 = _4550;
    }
    float _4552 = _4500;
    float _4554 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4556 = _4552;
    float _4558 = _4528;
    if (_4488)
    {
        float _4560 = fma(_4528, _4552, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4556 = _4560;
    }
    float _4562 = _4556;
    float _4564 = _4562;
    if (!_4488)
    {
        _4558 = _4476;
    }
    float _4566 = _4558;
    float _4568 = _4566;
    float _4570 = _4542;
    if (_4488)
    {
        float _4572 = _4542 + (-1.0);
        _4536 = _4572;
    }
    float _4574 = _4536;
    float _4576 = _4574;
    if (_4488)
    {
        float _4578 = _4510 * _4562;
        _4502 = _4578;
    }
    float _4580 = _4502;
    if (!_4488)
    {
        _4564 = _4548;
    }
    float _4582 = _4564;
    float _4584 = _4582;
    if (_4488)
    {
        float _4586 = _4574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3984 = _4586;
    }
    float _4588 = _3984;
    if (_4488)
    {
        float _4590 = _4476 * _4580;
        _4568 = _4590;
    }
    float _4592 = _4568;
    if (!_4488)
    {
        _4576 = _4478;
    }
    float _4594 = _4576;
    float _4596 = _4594;
    if (_4488)
    {
        float _4598 = _4478 * _4580;
        _4596 = _4598;
    }
    float _4600 = _4596;
    if (!_4488)
    {
        _4512 = _4480;
    }
    float _4602 = _4512;
    float _4604 = _4602;
    if (_4488)
    {
        float _4606 = fma(_4548, _4542, _4588);
        _4584 = _4606;
    }
    float _4608 = _4584;
    if (_4488)
    {
        float _4610 = _4592 * _4592;
        _4604 = _4610;
    }
    float _4612 = _4604;
    if (!_4488)
    {
        _4570 = _4482;
    }
    float _4614 = _4570;
    float _4616 = _4614;
    if (_4488)
    {
        float _4618 = _4600 * _4600;
        _4616 = _4618;
    }
    float _4620 = _4616;
    float _4622 = fma(_4608, _4608, _4612);
    float _4624 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4626 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4628 = _4622 + _4620;
    float _4630 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4554);
    float _4632 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4636 = fma(_4472, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4634);
    float _4638 = precise::clamp(_4636, 0.0, 1.0);
    float _4640 = rsqrt(_4628);
    float _4642 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4630);
    float _4644 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4646 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4632);
    float _4648 = -_4638;
    float _4650 = _4648 + 1.0;
    float _4652 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4654 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4644);
    float _4656 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4646);
    float _4658 = abs(_4650);
    float _4660 = log2(_4658);
    float _4662 = _4652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4664 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4654);
    float _4666 = _4656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4668 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4626);
    float _4670 = -_4662;
    float _4672 = fma(_4670, _4624, 1.0);
    float _4674 = _4664 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4676 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4678 = _4640 * _4592;
    float _4680 = _4640 * _4608;
    float _4682 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4668);
    float _4684 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4676);
    float _4686 = _4678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4688 = _4640 * _4600;
    float _4690 = _4682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4692 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4684);
    float _4694 = -_4686;
    float _4696 = fma(_4680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4694);
    float _4698 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4700 = log2(_4672);
    float _4702 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4692);
    float _4704 = -_4688;
    float _4706 = fma(_4704, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4696);
    float _4708 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4710 = _4680 + 1.0;
    float _4712 = fma(_4706, -0.5, 0.5);
    float _4714 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4708);
    float _4716 = exp2(_4698);
    float _4718 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4720 = fma(_4706, 0.5, 0.5);
    float _4722 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4714);
    float _4724 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4718);
    float _4726 = fma(_4720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4728 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4722);
    float _4730 = 1.0 / _4702;
    float _4732 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4724);
    float _4734 = fma(_4720, _4726, -0.212114393711090087890625);
    float _4736 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4732);
    float _4738 = fma(_4720, _4734, 1.570728778839111328125);
    float _4740 = sqrt(_4712);
    float _4742 = -_4680;
    float _4744 = fma(_4716, _4710, _4742);
    float _4746 = _4700 * 0.693147182464599609375;
    float _4748 = fma(_4744, 0.5, 0.5);
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4752 = _4728 * _4730;
    float _4754 = _4736 * _4730;
    float _4756 = fma(_4752, 0.5, 0.5);
    float _4758 = fma(_4754, -0.5, 0.5);
    float _4760 = _4740 * 0.636619746685028076171875;
    float3 _12268 = float3(_4756, _4758, _4750);
    float _4762 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12268, float3(0.0), isnan(_12268)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12268, float3(0.0), isnan(_12268)), level(0.0)).x;
    float3 _12279 = float3(_4756, _4758, _4750);
    float4 _4765 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12279, float3(0.0), isnan(_12279)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12279, float3(0.0), isnan(_12279)), level(0.0)).xyzw;
    float _4767 = _4765.x;
    float _4769 = _4765.y;
    float _4771 = _4765.z;
    float _4773 = _4765.w;
    float _4775 = -_4738;
    float _4777 = fma(_4760, _4775, 1.0);
    float2 _12301 = float2(_4777, _4748);
    float3 _4781 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12301, float2(0.0), isnan(_12301)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12301, float2(0.0), isnan(_12301)), level(0.0)).xyz;
    float _4783 = _4781.x;
    float _4785 = _4781.y;
    float _4787 = _4781.z;
    float _4789 = _4156 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4791 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4793 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _4152;
    out.m_82.y = _4156;
    out.m_82.z = _4160;
    float _4795 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4789);
    bool _4797 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4799 = isnan(_4472);
    bool _4801 = _4797 || _4799;
    bool _4803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4805 = _4801 || _4803;
    float _4807 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4793);
    float _4809 = exp2(_4791);
    float _4811 = fma(_4160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4795);
    float _4813 = _4156 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_84.x = _4446;
    out.m_84.y = _4444;
    out.m_84.z = _4448;
    float _4815 = _4811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4817 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4813);
    float _4819 = 1.0 / _4815;
    bool _4821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4825 = _4821 || _4823;
    bool _4827 = isnan(0.5);
    bool _4829 = _4825 || _4827;
    float _4831 = fma(_4160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4817);
    float _4833 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4807);
    float _4835 = _4831 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4837 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4833);
    float _4839 = -_4809;
    float _4841 = _4839 + 1.0;
    float _4843 = _4835 + _4815;
    float _4845 = _4837 + _4702;
    float _4847 = _4841 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4728;
    out.gl_Position.y = _4736;
    out.gl_Position.z = _4837;
    out.gl_Position.w = _4702;
    float _4849 = _4674;
    float _4851 = _4690;
    float _4853 = _4702;
    float _4855 = _4837;
    float _4857 = _4736;
    float _4859 = _4728;
    if (!_4829)
    {
        _4849 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4861 = _4849;
    float _4863 = _4845 * 0.5;
    float _4865 = _4843 * _4819;
    float _4867 = _4865 * 0.5;
    float _4869 = _4702 * 0.5;
    float _4871 = _4869;
    if (!_4829)
    {
        float _4873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4875 = fma(_4867, _4861, _4873);
        _4851 = _4875;
    }
    float _4877 = _4851;
    float _4879 = fma(_4736, -0.5, _4869);
    if (!_4829)
    {
        _4871 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4881 = _4871;
    float _4883 = _4728 + _4702;
    float _4885 = _4877;
    float _4887 = _4881;
    if (!_4829)
    {
        float _4889 = 1.0 / _4877;
        _4885 = _4889;
    }
    float _4891 = _4885;
    float _4893 = _4883 * 0.5;
    if (_4829)
    {
        _4853 = 1.0;
    }
    float _4895 = _4853;
    float _4897 = _4895;
    if (!_4805)
    {
        _4855 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4899 = _4855;
    out.m_86.x = _4893;
    out.m_86.y = _4879;
    out.m_86.z = _4863;
    out.m_86.w = _4702;
    float _4901 = _4899;
    float _4903 = _4899;
    if (!_4805)
    {
        _4857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4905 = _4857;
    float _4907 = _4905;
    float _4909 = _4905;
    if (!_4805)
    {
        _4859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4911 = _4859;
    float _4913 = _4891;
    float _4915 = _4911;
    float _4917 = _4911;
    if (!_4829)
    {
        float _4919 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4921 = -_4881;
        float _4923 = fma(_4891, _4919, _4921);
        _4913 = _4923;
    }
    float _4925 = _4913;
    if (!_4829)
    {
        float _4927 = -_4881;
        float _4929 = _4927 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4887 = _4929;
    }
    float _4931 = _4887;
    float _4933 = _4931;
    if (!_4829)
    {
        float _4935 = 1.0 / _4931;
        _4933 = _4935;
    }
    float _4937 = _4933;
    if (!_4829)
    {
        float _4939 = _4925 * _4937;
        float _4941 = precise::clamp(_4939, 0.0, 1.0);
        _4897 = _4941;
    }
    float _4943 = _4897;
    float _4945 = _4943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4947 = _4847 * _4762;
    float _4949 = -_4847;
    float _4951 = _4949 + 1.0;
    float _4953 = _4773 * _4947;
    float _4955 = _4773 * _4951;
    float _4957 = _4787 * _4947;
    float _4959 = fma(_4783, _4953, _4767);
    float _4961 = fma(_4785, _4953, _4769);
    float _4963 = fma(_4773, _4957, _4771);
    out.m_88.x = _4959;
    out.m_88.y = _4961;
    out.m_88.z = _4963;
    out.m_88.w = _4955;
    bool _4965 = !_4805;
    if (!_4965)
    {
        bool _4967 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4969 = isnan(_4472);
        bool _4971 = _4967 || _4969;
        bool _4973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4975 = _4971 || _4973;
        if (!_4975)
        {
            float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4979 = _4472 + _4977;
            float _4981 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4983 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4981;
            float _4985 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4987 = _4985 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4991 = _4989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4993 = 1.0 / _4983;
            float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4999 = _4979 * _4993;
            float _5001 = precise::clamp(_4999, 0.0, 1.0);
            float _5003 = fma(_5001, _4987, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5005 = fma(_5001, _4991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5007 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4909 = _5005;
            _4903 = _5003;
            _4917 = _5007;
            _5009 = true;
        }
        else
        {
            bool _5011 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5013 = isnan(_4472);
            bool _5015 = _5011 || _5013;
            bool _5017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5019 = _5015 || _5017;
            if (!_5019)
            {
                _4901 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5021 = _4901;
            _4903 = _5021;
            if (!_5019)
            {
                _4907 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5023 = _4907;
            _4909 = _5023;
            if (!_5019)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5025 = _4915;
            bool _5027 = !_5019;
            _4917 = _5025;
            if (!_5027)
            {
                bool _5029 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5031 = isnan(_4472);
                bool _5033 = _5029 || _5031;
                bool _5035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5037 = _5033 || _5035;
                if (!_5037)
                {
                    float _5039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5041 = _4472 + _5039;
                    float _5043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5043;
                    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5049 = _5047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5051 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5053 = _5051 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5055 = 1.0 / _5045;
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5061 = _5041 * _5055;
                    float _5063 = precise::clamp(_5061, 0.0, 1.0);
                    float _5065 = fma(_5063, _5049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5067 = fma(_5063, _5053, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5069 = fma(_5063, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4909 = _5067;
                    _4903 = _5065;
                    _4917 = _5069;
                    _5009 = true;
                }
                else
                {
                    _4909 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4903 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5009 = false;
    float _5071 = _4909;
    float _5073 = _4903;
    float _5075 = _4917;
    float _5077 = _4945 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5079 = _5071 * 0.586610972881317138671875;
    bool _5081 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5077;
    float _5083 = fma(_5073, 0.298911988735198974609375, _5079);
    bool _5085 = _4943 > 0.0;
    bool _5087 = isnan(_4943);
    bool _5089 = _5085 || _5087;
    bool _5091 = isnan(0.0);
    bool _5093 = _5089 || _5091;
    float _5095 = fma(_5075, 0.114477999508380889892578125, _5083);
    float _5097 = -_5095;
    float _5099 = _5097 + _5073;
    float _5101 = -_5095;
    float _5103 = _5101 + _5071;
    float _5105 = -_5095;
    float _5107 = _5105 + _5075;
    float _5109 = fma(_5099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    float _5111 = fma(_5103, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    float _5113 = fma(_5107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    bool _5115 = !_5081;
    if (!_5115)
    {
        float _5117 = -_4444;
        float _5119 = _5117 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5121 = -_4446;
        float _5123 = _5121 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5125 = -_4448;
        float _5127 = _5125 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5129 = _5119 * _5119;
        float _5131 = fma(_5123, _5123, _5129);
        float _5133 = fma(_5127, _5127, _5131);
        float _5135 = sqrt(_5133);
        float _5137 = rsqrt(_5133);
        float _5139 = -_5135;
        float _5141 = _5139 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5143 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = _5123 * _5137;
        float _5149 = _5119 * _5137;
        float _5151 = abs(_5145);
        float _5153 = log2(_5151);
        float _5155 = _5127 * _5137;
        float _5157 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5159 = _4118 * _5149;
        float _5161 = -_5149;
        float _5163 = -_5157;
        float _5165 = fma(_5161, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5163);
        float _5167 = fma(_4116, _5147, _5159);
        float _5169 = -_5155;
        float _5171 = fma(_5169, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5165);
        float _5173 = fma(_4120, _5155, _5167);
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5179 = _5171 + _5177;
        float _5181 = _5153 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5183 = _5179 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5185 = precise::clamp(_5183, 0.0, 1.0);
        float _5187 = exp2(_5181);
        float _5189 = _5187 * _5185;
        float _5191 = _5175 * _5189;
        float _5193 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5195 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5197 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5193;
        out.m_90.y = _5195;
        out.m_90.z = _5197;
    }
    out.m_70.x = _5109;
    out.m_70.y = _5111;
    out.m_70.z = _5113;
    if (_5093)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _5199 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5199;
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
    bool _5009 = false;
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
        float _5256 = as_type<float>(_125);
        out.gl_Position.z = _5256;
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
        float _5329 = as_type<float>(_163);
        out.gl_Position.z = _5329;
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
    float _462 = _131 * 2.0;
    float _464 = _169 * 2.0;
    bool _466 = !_446;
    float _468 = _466 ? _256 : as_type<float>(_456);
    float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    bool _472 = !_450;
    float _474 = _472 ? _272 : as_type<float>(_436);
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _486 = _484 != 0;
    float _488 = float(_109);
    float _490 = floor(_462);
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _498 = _496 != 0;
    float _500 = float(_177);
    float _502 = float(_201);
    float _504 = 1.0 / _488;
    bool _506 = !_460;
    int _508 = _506 ? 0 : (-1);
    bool _510 = _502 >= _500;
    bool _512 = isnan(_502);
    bool _514 = _510 || _512;
    bool _516 = isnan(_500);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    int _522 = ~_258;
    int _524 = _522 + _508;
    int _526 = _524 + 1;
    bool _528 = _177 == 0;
    float _530 = floor(_464);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_498)
    {
        _532 = 1.0;
    }
    float _534 = _532;
    float _536 = _534;
    if (!_498)
    {
        _536 = 7.345489978790283203125;
    }
    float _538 = _536;
    int _540 = abs(_360);
    bool _542 = !_478;
    int _544 = _542 ? 0 : 1;
    float _546 = _538 * _131;
    float _548 = trunc(_520);
    int _550 = int(_548);
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _554 = _552 != 0;
    float _556 = floor(_546);
    float _558 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _560 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _562;
    float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _572 = -_556;
    float _574 = _546 + _572;
    float _576 = _145 * _504;
    int _578 = _177 + (-1);
    float _580 = _574 * _500;
    int _582 = _177 * _526;
    int _584 = _582 + _201;
    float _586 = _500 * _576;
    int _588 = ~_550;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = trunc(_580);
    int _596 = int(_594);
    bool _598 = !_528;
    int _600 = _598 ? _584 : (-1);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _602;
    float _606 = trunc(_586);
    int _608 = int(_606);
    int _610 = _600 * _592;
    int _612 = abs(_544);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _614;
    bool _618 = !_554;
    int _620 = _618 ? 0 : 1;
    int _622 = _550 * _578;
    int _624 = _622 + _610;
    int _626 = abs(_494);
    bool _628 = !_486;
    int _630 = _628 ? 0 : 1;
    int _632 = _624 * _626;
    int _634 = abs(_630);
    int _636 = abs(_620);
    int _638 = _596 * _540;
    int _640 = _638 + _201;
    int _642 = _608 * _612;
    int _644 = _642 + _632;
    int _646 = ~_177;
    int _648 = _646 + 1;
    int _650 = ~_177;
    int _652 = _650 + 1;
    int _654 = _640 * _634;
    int _656 = _654 + _644;
    bool _658 = _177 == 0;
    int _660 = ~_432;
    int _662 = _660 + 1;
    int _664 = _596 * _636;
    int _666 = _664 + _656;
    float _668 = float(uint(_666));
    float _670 = as_type<float>(_203) * _668;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    int _678 = _648 * int(_676);
    int _680 = _678 + _666;
    float _682 = float(uint(_680));
    float _684 = as_type<float>(_203) * _682;
    float _686 = trunc(_684);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = int(_676) + int(_690);
    int _694 = _652 * _692;
    int _696 = _694 + _666;
    float _698 = float(uint(_432));
    bool _700 = uint(_696) >= uint(_177);
    bool _702 = !_700;
    int _704 = _702 ? 0 : (-1);
    int _706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _708 = _706 != 0;
    int _710 = ~_692;
    int _712 = _710 + _704;
    int _714 = _712 + 1;
    bool _716 = !_708;
    int _718 = _716 ? 0 : 1;
    int _720 = _177 * _714;
    int _722 = _720 + _666;
    bool _724 = !_658;
    int _726 = _724 ? _722 : (-1);
    int _728 = _726 & 3;
    bool _730 = _728 != 0;
    int _732 = _726 & 3;
    bool _734 = _732 != 0;
    int _736 = _730 ? 0 : 1;
    bool _738 = uint(_732) >= 2u;
    int _740 = ~_736;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    int _746 = _738 ? 0 : 1;
    bool _748 = uint(_732) > 1u;
    int _750 = ~_746;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    bool _756 = !_734;
    int _758 = _756 ? 0 : 1;
    int _760 = _744;
    int _762 = _754;
    if (!_748)
    {
        int _764 = ~_736;
        int _766 = _764 + 1;
        _760 = _766;
    }
    int _768 = _760;
    float _770 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _772 = int(_770);
    bool _774 = _732 != 3;
    int _776 = abs(_768);
    if (_774)
    {
        int _778 = ~_746;
        int _780 = _778 + 1;
        _762 = _780;
    }
    int _782 = _762;
    float _784 = float(_772);
    float _786 = 1.0 / _698;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _790 = _788 != 0;
    bool _792 = !_790;
    int _794 = _792 ? 0 : 1;
    bool _796 = _438 > 0.5;
    float _798 = 1.0 / _784;
    float _800 = -_272;
    int _802 = _796 ? as_type<int>(_800) : as_type<int>(_272);
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _810 = _808 != 0;
    bool _812 = !_442;
    float _814 = _812 ? _272 : as_type<float>(_802);
    int _816 = as_type<int>(_786) + (-2);
    bool _818 = !_806;
    int _820 = _818 ? 0 : 1;
    bool _822 = !_810;
    int _824 = _822 ? 0 : 1;
    int _826 = abs(_820);
    float _828 = _145 * _798;
    int _830 = abs(_824);
    float _832 = trunc(_828);
    int _834 = int(_832);
    float _836 = float(_830);
    int _838 = ~_432;
    int _840 = _838 + 1;
    float _842 = float(uint(_834));
    float _844 = as_type<float>(_816) * _842;
    float _846 = trunc(_844);
    float _848 = precise::max(_846, 0.0);
    uint _850 = uint(_848);
    int _852 = _662 * int(_850);
    int _854 = _852 + _834;
    int _856 = ~_177;
    int _858 = _856 + 1;
    float _860 = float(uint(_854));
    float _862 = as_type<float>(_816) * _860;
    float _864 = trunc(_862);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    int _870 = ~_177;
    int _872 = _870 + 1;
    int _874 = int(_850) + int(_868);
    int _876 = _840 * _874;
    int _878 = _876 + _834;
    bool _880 = uint(_878) >= uint(_432);
    float _882 = float(uint(_640));
    bool _884 = !_880;
    int _886 = _884 ? 0 : (-1);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _890 = _888 != 0;
    float _892 = as_type<float>(_203) * _882;
    int _894 = ~_874;
    int _896 = _894 + _886;
    int _898 = _896 + 1;
    bool _900 = !_890;
    int _902 = _900 ? 0 : 1;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _910 = _908 != 0;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _914 = _912 != 0;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _918 = _916 != 0;
    float _920 = trunc(_892);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    int _926 = _432 * _898;
    int _928 = _926 + _834;
    int _930 = abs(_902);
    bool _932 = !_906;
    int _934 = _932 ? 0 : 1;
    bool _936 = !_910;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_914;
    int _942 = _940 ? 0 : 1;
    int _944 = abs(_938);
    int _946 = _858 * int(_924);
    int _948 = _946 + _640;
    float _950 = float(uint(_948));
    float _952 = as_type<float>(_203) * _950;
    float _954 = trunc(_952);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = float(_432);
    float _962 = _960 * _576;
    int _964 = int(_924) + int(_958);
    float _966 = as_type<float>(_924);
    float _968 = as_type<float>(_964);
    float _970 = _814;
    if (_498)
    {
        _966 = 1.0;
    }
    float _972 = _966;
    float _974 = trunc(_962);
    int _976 = int(_974);
    float _978 = _972;
    if (!_498)
    {
        _978 = 1.2345600128173828125;
    }
    float _980 = _978;
    int _982 = _872 * _964;
    int _984 = _982 + _640;
    float _986 = float(_834);
    bool _988 = uint(_984) >= uint(_177);
    float _990 = as_type<float>(_984);
    if (_498)
    {
        _990 = _131;
    }
    float _992 = _990;
    float _994 = _992;
    if (!_498)
    {
        _994 = _169;
    }
    float _996 = _994;
    bool _998 = _986 >= _960;
    bool _1000 = isnan(_986);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(_960);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    bool _1010 = !_988;
    int _1012 = _1010 ? 0 : (-1);
    float _1014 = _980 * _996;
    bool _1016 = _432 == 0;
    float _1018 = trunc(_1008);
    int _1020 = int(_1018);
    int _1022 = ~_964;
    int _1024 = _1022 + _1012;
    int _1026 = _1024 + 1;
    float _1028 = floor(_1014);
    int _1030 = ~_1020;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = -_1028;
    float _1038 = _1014 + _1036;
    int _1040 = _432 + (-1);
    float _1042 = _1038 * _960;
    bool _1044 = !_1016;
    int _1046 = _1044 ? _928 : (-1);
    bool _1048 = !_918;
    int _1050 = _1048 ? 0 : 1;
    float _1052 = trunc(_1042);
    int _1054 = int(_1052);
    int _1056 = _1046 * _1034;
    bool _1058 = _490 >= 0.0;
    bool _1060 = isnan(_490);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    int _1068 = _1020 * _1040;
    int _1070 = _1068 + _1056;
    int _1072 = abs(_934);
    float _1074 = -_452;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    int _1078 = _1070 * _944;
    int _1080 = abs(_942);
    float _1082 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    int _1086 = abs(_1050);
    int _1088 = _1054 * _930;
    int _1090 = _1088 + _834;
    int _1092 = _976 * _1072;
    int _1094 = _1092 + _1078;
    int _1096 = ~_432;
    int _1098 = _1096 + 1;
    int _1100 = _1090 * _1080;
    int _1102 = _1100 + _1094;
    int _1104 = _1054 * _1086;
    int _1106 = _1104 + _1102;
    int _1108 = ~_432;
    int _1110 = _1108 + 1;
    float _1112 = 1.0 / _1084;
    float _1114 = float(uint(_1106));
    float _1116 = as_type<float>(_816) * _1114;
    float _1118 = trunc(_1116);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = _1110 * int(_1122);
    int _1126 = _1124 + _1106;
    float _1128 = float(uint(_1126));
    float _1130 = as_type<float>(_816) * _1128;
    float _1132 = trunc(_1130);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = ~_432;
    int _1140 = _1138 + 1;
    int _1142 = int(_1122) + int(_1136);
    float _1144 = float(uint(_1090));
    int _1146 = _1098 * _1142;
    int _1148 = _1146 + _1106;
    float _1150 = as_type<float>(_816) * _1144;
    int _1152 = as_type<int>(_1144);
    float _1154 = as_type<float>(_1080);
    float _1156 = as_type<float>(_1072);
    float _1158 = _1112;
    float _1160 = _1084;
    if (_498)
    {
        _1152 = 0;
    }
    int _1162 = _1152;
    bool _1164 = uint(_1148) >= uint(_432);
    float _1166 = trunc(_1150);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = _1162;
    if (!_498)
    {
        _1172 = 1;
    }
    int _1174 = _1172;
    bool _1176 = !_1164;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1182 = _1180 != 0;
    int _1184 = ~_1142;
    int _1186 = _1184 + _1178;
    int _1188 = _1186 + 1;
    bool _1190 = !_1182;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = in.m_58.w;
    int _1196 = _1178;
    if (_498)
    {
        _1196 = 0;
    }
    int _1198 = _1196;
    int _1200 = _432 * _1188;
    int _1202 = _1200 + _1106;
    int _1204 = _1198;
    if (!_498)
    {
        _1204 = 2;
    }
    int _1206 = _1204;
    int _1208 = _177 * _1026;
    int _1210 = _1208 + _640;
    int _1212 = _1140 * int(_1170);
    int _1214 = _1212 + _1090;
    bool _1216 = !_1016;
    int _1218 = _1216 ? _1202 : (-1);
    bool _1220 = !_658;
    int _1222 = _1220 ? _1210 : (-1);
    int _1224 = _1218 & 3;
    bool _1226 = _1224 != 0;
    int _1228 = _1218 & 3;
    bool _1230 = _1228 != 0;
    float _1232 = float(uint(_1214));
    int _1234 = _1226 ? 0 : 1;
    bool _1236 = uint(_1228) > 1u;
    float _1238 = as_type<float>(_816) * _1232;
    int _1240 = ~_1234;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = ~_432;
    int _1248 = _1246 + 1;
    float _1250 = trunc(_1238);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    int _1256 = _1244;
    if (!_1236)
    {
        int _1258 = ~_1234;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    bool _1264 = uint(_1228) >= 2u;
    int _1266 = _1264 ? 0 : 1;
    bool _1268 = _1228 != 3;
    int _1270 = int(_1170) + int(_1254);
    int _1272 = ~_1266;
    int _1274 = _1272 + 1;
    int _1276 = _1274 + 1;
    int _1278 = _1248 * _1270;
    int _1280 = _1278 + _1090;
    int _1282 = _1276;
    if (_1268)
    {
        int _1284 = ~_1266;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    bool _1290 = uint(_1280) >= uint(_432);
    bool _1292 = !_1290;
    int _1294 = _1292 ? 0 : (-1);
    bool _1296 = _1174 != 1;
    float _1298 = in.m_49.x;
    float _1300 = in.m_49.y;
    float _1302 = in.m_49.z;
    if (!_1296)
    {
        _1154 = _169;
    }
    float _1304 = _1154;
    float _1306 = 0.0;
    float _1308 = _1304;
    if (!_1296)
    {
        _1306 = _173;
    }
    float _1310 = _1306;
    float _1312 = 0.0;
    float _1314 = _1310;
    if (!_1296)
    {
        _1312 = _1304;
    }
    float _1316 = _1312;
    float _1318 = _1316;
    if (!_1296)
    {
        _1156 = _173;
    }
    float _1320 = _1156;
    float _1322 = _1320;
    if (_1296)
    {
        _1318 = _131;
    }
    float _1324 = _1318;
    if (_1296)
    {
        _1308 = _131;
    }
    float _1326 = _1308;
    if (_1296)
    {
        _1314 = _169;
    }
    float _1328 = _1314;
    float _1330 = fma(_338, _1302, _1082);
    if (_1296)
    {
        _1322 = _169;
    }
    float _1332 = _1322;
    bool _1334 = _1206 != 2;
    float _1336 = in.m_44.x;
    float _1338 = in.m_44.y;
    float _1340 = in.m_44.z;
    float _1342 = 0.0;
    if (_1334)
    {
        _1342 = _131;
    }
    float _1344 = _1342;
    float _1346 = _1344;
    if (_1334)
    {
        _968 = _169;
    }
    float _1348 = _968;
    float _1350 = _1348;
    if (!_1334)
    {
        _1346 = _173;
    }
    float _1352 = _1346;
    if (!_1334)
    {
        _1350 = _131;
    }
    float _1354 = _1350;
    bool _1356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1358 = fma(_1330, _1194, _1340);
    float _1360 = -_1358;
    float _1362 = precise::max(0.0, _1360);
    float _1364 = _1082;
    if (_1356)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = precise::min(_1084, _1362);
    float _1372 = _1370 * _1112;
    if (_1356)
    {
        float _1374 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1158 = _1374;
    }
    float _1376 = _1158;
    float _1378 = _1376;
    if (_1356)
    {
        float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1372);
        _1378 = _1380;
    }
    float _1382 = _1378;
    float _1384 = 0.0;
    float _1386 = _1382;
    if (!_1356)
    {
        _1384 = _1372;
    }
    float _1388 = _1384;
    out.m_60.x = _1372;
    float _1390 = _1388;
    if (_1356)
    {
        float _1392 = _1382 * _1368;
        _1386 = _1392;
    }
    float _1394 = _1386;
    float _1396 = floor(_458);
    float _1398 = _1370;
    if (_1356)
    {
        float _1400 = floor(_1394);
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _458 + (-1.0);
    if (_1356)
    {
        float _1406 = -_1402;
        float _1408 = _1394 + _1406;
        _1390 = _1408;
    }
    float _1410 = _1390;
    bool _1412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    bool _1414 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1416 = isnan(_1410);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = _1402;
    if (_1412)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1426 = _1428;
    }
    float _1430 = _1426;
    if (_1412)
    {
        float _1432 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1160 = _1432;
    }
    float _1434 = _1160;
    float _1436 = 0.0;
    float _1438 = _1434;
    if (!_1412)
    {
        _1436 = _1372;
    }
    float _1440 = _1436;
    float _1442 = _1440;
    if (_1412)
    {
        float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1372);
        _1438 = _1444;
    }
    float _1446 = _1438;
    float _1448 = _1446;
    if (_1412)
    {
        float _1450 = _1446 * _1430;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1430;
    if (_1412)
    {
        float _1456 = floor(_1452);
        _1454 = _1456;
    }
    float _1458 = _1454;
    if (_1412)
    {
        float _1460 = -_1458;
        float _1462 = _1452 + _1460;
        _1442 = _1462;
    }
    float _1464 = _1442;
    bool _1466 = _1396 >= 0.0;
    bool _1468 = isnan(_1396);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    float _1476 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1478 = log2(_1476);
    int _1480 = _1066 ? 0 : 1;
    int _1482 = _1474 ? 0 : 1;
    bool _1484 = _1396 > 0.0;
    int _1486 = ~_1482;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    bool _1492 = _1228 != 3;
    float _1494 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _1496 = ~_1480;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    bool _1502 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1504 = isnan(_1464);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = _1494 * _470;
    float _1516 = _145 * _1478;
    float _1518 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _1520 = _1490;
    int _1522 = _1500;
    if (!_1484)
    {
        int _1524 = ~_1482;
        int _1526 = _1524 + 1;
        _1520 = _1526;
    }
    int _1528 = _1520;
    float _1530 = -_1512;
    float _1532 = _1530 + 1.0;
    bool _1534 = _490 > 0.0;
    float _1536 = _1518 * _566;
    bool _1538 = !_1230;
    int _1540 = _1538 ? 0 : 1;
    float _1542 = exp2(_1516);
    bool _1544 = _732 != 3;
    bool _1546 = !_1544;
    int _1548 = _1546 ? 0 : (-1);
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1556 = _1554 != 0;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1560 = _1558 != 0;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1566 = _530 > 0.0;
    if (!_1534)
    {
        int _1568 = ~_1480;
        int _1570 = _1568 + 1;
        _1522 = _1570;
    }
    int _1572 = _1522;
    float _1574 = 1.0 / _1564;
    bool _1576 = _530 >= 0.0;
    bool _1578 = isnan(_530);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(0.0);
    bool _1584 = _1580 || _1582;
    bool _1586 = !_1492;
    int _1588 = _1586 ? 0 : (-1);
    float _1590 = -_1542;
    float _1592 = _1590 + 1.0;
    int _1594 = _1584 ? 0 : 1;
    int _1596 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1598 = _1596 != 0;
    int _1600 = ~_1594;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    int _1606 = _1604;
    if (!_1566)
    {
        int _1608 = ~_1594;
        int _1610 = _1608 + 1;
        _1606 = _1610;
    }
    int _1612 = _1606;
    float _1614 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1624 = _1620 || _1622;
    float _1626 = _570 * _1574;
    int _1628 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1630 = _1628 != 0;
    float _1632 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1514);
    float _1634 = _131 + _169;
    float _1636 = _1624 ? _1592 : 0.0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1640 = _1638 != 0;
    float _1642 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1646 = _1634 + (-1.0);
    float _1648 = -_1644;
    float _1650 = fma(_1642, 2.0, _1648);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1662 = 1.0 / _1658;
    float _1664 = fma(_1614, -2.0, _1660);
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1668 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1672 = 1.0 / _1654;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1678 = -_1666;
    float _1680 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1678);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1686 = -_1668;
    float _1688 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1686);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1694 = -_1670;
    float _1696 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1698 = 1.0 / _1684;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1704 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1706 = _564 * _1662;
    float _1708 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1710 = -_1704;
    float _1712 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1710);
    float _1714 = 1.0 / _1692;
    float _1716 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1718 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1720 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1722 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1726 = -_1718;
    float _1728 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1730 = 1.0 / _1676;
    float _1732 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1736 = _1724 * 0.15915493667125701904296875;
    float _1738 = -_1722;
    float _1740 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1738);
    float _1742 = -_1732;
    float _1744 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1742);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1746;
    float _1750 = -_1734;
    float _1752 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1750);
    float _1754 = 1.0 / _1702;
    float _1756 = _1748 * _1672;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1774 = !_1552;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = _1764 * _1698;
    float _1780 = _1768 * _1730;
    float _1782 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1536);
    float _1784 = _131 + _173;
    float _1786 = _173 + _169;
    float _1788 = floor(_1782);
    float _1790 = _1784 + (-1.0);
    float _1792 = _1786 + (-1.0);
    float _1794 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1796 = _1760 * _1754;
    float _1798 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1800 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1802 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1804 = 1.0 + _1802;
    float _1806 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = -_1708;
    float _1810 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1808);
    float _1812 = _1736 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = -_1716;
    float _1818 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1816);
    float _1820 = -_1720;
    float _1822 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1820);
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1826 = 1.0 + _1824;
    float _1828 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1830 = -_1806;
    float _1832 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1830);
    float _1834 = -_1788;
    float _1836 = _1782 + _1834;
    float _1838 = _1782 * 6.283185482025146484375;
    float _1840 = floor(_1632);
    float _1842 = _1828 * _1826;
    float _1844 = _1772 * _1714;
    float _1846 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1818);
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1850 = 1.0 + _1848;
    float _1852 = -_1842;
    float _1854 = _1828 + _1852;
    float _1856 = _1838 * 0.15915493667125701904296875;
    float _1858 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1832);
    float _1860 = _1736 * 6.283185482025146484375;
    float _1862 = sin(_1860);
    float _1864 = fma(_1854, _169, _1842);
    float _1866 = _1814 * _1814;
    float _1868 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1870 = fma(_438, 2.0, -1.0);
    bool _1872 = !_1556;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = -_1868;
    float _1878 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1880 = -_1840;
    float _1882 = _1632 + _1880;
    float _1884 = _1632 * 6.283185482025146484375;
    float _1886 = 1.0 / _1850;
    float _1888 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1810);
    float _1890 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1728);
    float _1892 = _1884 * 0.15915493667125701904296875;
    float _1894 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1822);
    float _1896 = fma(_1862, _1862, _1866);
    float _1898 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1878);
    float _1900 = _1856 * 6.283185482025146484375;
    float _1902 = cos(_1900);
    float _1904 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1740);
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1908 = _1836 < 0.5;
    float _1910 = float(_1908);
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1914 = -_1882;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1918 = -_1836;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1922 = rsqrt(_1896);
    float _1924 = _1636 * _1886;
    bool _1926 = _1882 < 0.5;
    float _1928 = float(_1926);
    float _1930 = -_1912;
    float _1932 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1930);
    float _1934 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1664);
    bool _1936 = !_1560;
    int _1938 = _1936 ? 0 : 1;
    float _1940 = -_1928;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1944 = _1892 * 6.283185482025146484375;
    float _1946 = cos(_1944);
    float _1948 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1950 = fma(_1902, 0.5, 0.5);
    float _1952 = -_1910;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1956 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1958 = -_1906;
    float _1960 = fma(_1948, 2.0, _1958);
    float _1962 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1932);
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1966 = _1862 * _1922;
    float _1968 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1970 = fma(_338, _1300, _1956);
    float _1972 = _1814 * _1922;
    float _1974 = fma(_338, _1298, _1968);
    float _1976 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1978 = fma(_1946, 0.5, 0.5);
    float _1980 = -_1898;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1962);
    float _1984 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1988 = -_1978;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1994 = -_1986;
    float _1996 = fma(_1976, 2.0, _1994);
    float _1998 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2002 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1964);
    float _2004 = fma(_1970, _1194, _1338);
    float _2006 = fma(_1984, -2.0, _1992);
    float _2008 = fma(_1974, _1194, _1336);
    float _2010 = fma(_1998, -2.0, _2000);
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2016 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2018 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2020 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2022 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2014);
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2036 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2016);
    float _2038 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2018);
    float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2042 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2020);
    float _2044 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2036);
    float _2058 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2038);
    float _2060 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2042);
    out.m_62.x = _2044;
    out.m_62.y = _2046;
    out.m_62.z = _2048;
    float _2062 = -_145;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1960);
    float _2066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2010);
    out.m_64.x = _2050;
    out.m_64.y = _2052;
    out.m_64.z = _2054;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2070 = -_1950;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _2074 = abs(_1874);
    float _2076 = _2058 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2078 = _173 > 0.5;
    float _2080 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2006);
    float _2082 = float(_2074);
    float _2084 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2088 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2090 = _468 + 0.5;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2094 = _474 + (-0.5);
    float _2096 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2086);
    float _2098 = fma(_2084, _2090, _2064);
    float _2100 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2092);
    float _2102 = -_2088;
    float _2104 = -_2066;
    float _2106 = fma(_2102, _2094, _2104);
    float _2108 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2096);
    float _2110 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2112 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2100);
    float _2114 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2116 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _2118 = -_2108;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2112;
    float _2124 = _2122 + 1.0;
    float _2126 = fma(_426, _1300, _2114);
    float _2128 = fma(_426, _1298, _2110);
    float _2130 = fma(_426, _1302, _2116);
    float _2132 = -_2120;
    float _2134 = fma(_468, _2132, _2098);
    float _2136 = -_2126;
    float _2138 = _1970 + _2136;
    float _2140 = fma(_474, _2124, _2106);
    float _2142 = -_2128;
    float _2144 = _1974 + _2142;
    int _2146 = abs(_718);
    float _2148 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2152 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2154 = float(_826);
    float _2156 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2148);
    float _2158 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2150);
    float _2160 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2152);
    out.m_66.x = _2134;
    out.m_66.y = _2140;
    float _2162 = abs(_1916);
    float _2164 = _2154 * _2162;
    float _2166 = abs(_1920);
    float _2168 = _2154 * _2166;
    float _2170 = _1076 * _1372;
    float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2172;
    float _2176 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[193].y, _560);
    float _2178 = precise::max(0.0, _2170);
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _2180;
    float _2184 = float(_2146);
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _2186;
    float _2190 = precise::min(_2178, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2196 = fma(_2184, _1990, _2164);
    float _2198 = fma(_2184, _2072, _2168);
    float _2200 = _2190 * _2068;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2204 = _1410 + _2202;
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _2206;
    float _2210 = 1.0 / _2182;
    float _2212 = abs(_1942);
    float _2214 = fma(_836, _2212, _2196);
    float _2216 = fma(_1706, _2204, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2220 = _1410 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2224 = _2222 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2228 = _1410 + _2226;
    float _2230 = _2176 * 0.15915493667125701904296875;
    float _2232 = fma(_1778, _2220, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2234 = 1.0 / _2208;
    float _2236 = fma(_1844, _2228, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2240 = _1410 + _2238;
    float _2242 = abs(_1954);
    float _2244 = fma(_836, _2242, _2198);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2248 = _2246 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2252 = _1410 + _2250;
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2256 = _1410 + _2254;
    float _2258 = fma(_1780, _2240, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2260 = 1.0 / _2188;
    float _2262 = fma(_1626, _2252, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2264 = fma(_1796, _2256, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2268 = _1464 + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2272 = _1464 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2280 = _1410 + _2278;
    float _2282 = 1.0 / _2194;
    float _2284 = _2268 * _2234;
    float _2286 = fma(_1756, _2280, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2290 = _1464 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2296;
    float _2300 = _2230 * 6.283185482025146484375;
    float _2302 = sin(_2300);
    float _2304 = _2272 * _2260;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2308 = _1464 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _2314 = _169 > 0.5;
    float _2316 = fma(_2174, _2304, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2318 = _2308 * _2210;
    float _2320 = -_1864;
    float _2322 = _1966 * _2320;
    float _2324 = 1.0 / _2224;
    float _2326 = fma(_2298, _2318, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2328 = -_1864;
    float _2330 = _1972 * _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _2338 = _2336 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2340 = 1.0 / _2248;
    float _2342 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2344 = fma(_2334, _2318, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _2346 = -_2342;
    float _2348 = _1972 * _2346;
    float _2350 = _1966 * _2342;
    bool _2352 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2354 = isnan(_1410);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2360 = _2356 || _2358;
    float _2362 = float(_2360);
    float _2364 = 1.0 / _2276;
    float _2366 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2368 = _1464 + _2366;
    float _2370 = fma(_1076, _2322, _2348);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _2372;
    float _2376 = fma(_1076, _2330, _2350);
    float _2378 = _2368 * _2282;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2382 = _1464 + _2380;
    float _2384 = fma(_2374, _2304, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _2386 = _2290 * _2340;
    float _2388 = _2382 * _2324;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2392 = _1464 + _2390;
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _2394;
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _2400 = _2398 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2402;
    bool _2406 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2408 = isnan(_1410);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2414 = _2410 || _2412;
    float _2416 = float(_2414);
    float _2418 = _2392 * _2364;
    bool _2420 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2422 = isnan(_1410);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = fma(_2404, _2284, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2434 = fma(_2396, _2284, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    float _2436 = -_2362;
    float _2438 = _2436 + 1.0;
    float _2440 = fma(_2294, _2378, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2442 = -_2430;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2400, _2378, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2452 = fma(_2312, _2388, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2454 = _2362 * _2444;
    bool _2456 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2458 = isnan(_1410);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = fma(_2338, _2388, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _2470 = -_2416;
    float _2472 = _2470 + 1.0;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    bool _2478 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2480 = isnan(_1410);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2486 = _2482 || _2484;
    float _2488 = float(_2486);
    float _2490 = _2416 * _2438;
    float _2492 = fma(_2450, _2386, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2494 = _2466 * _2472;
    float _2496 = -_2466;
    float _2498 = _2496 + 1.0;
    float _2500 = fma(_2476, _2386, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    bool _2502 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2504 = isnan(_1410);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2510 = _2506 || _2508;
    float _2512 = float(_2510);
    float _2514 = -_2488;
    float _2516 = _2514 + 1.0;
    float _2518 = _2488 * _2498;
    bool _2520 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2522 = isnan(_1410);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = abs(_2200);
    float _2534 = log2(_2532);
    float _2536 = _2512 * _2516;
    float _2538 = -_2512;
    float _2540 = _2538 + 1.0;
    bool _2542 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2544 = isnan(_1464);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2550 = _2546 || _2548;
    float _2552 = float(_2550);
    float _2554 = -_2530;
    float _2556 = _2554 + 1.0;
    float _2558 = _1372 * _2376;
    float _2560 = _2530 * _2540;
    float _2562 = fma(_604, _2418, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2564 = -_2552;
    float _2566 = _2564 + 1.0;
    bool _2568 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2570 = isnan(_1464);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2576 = _2572 || _2574;
    float _2578 = float(_2576);
    float _2580 = _1424 * _2556;
    float _2582 = fma(_616, _2418, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    float _2584 = _1512 * _2566;
    bool _2586 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2588 = isnan(_1464);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = _2216 * _2580;
    int _2600 = ~_1270;
    int _2602 = _2600 + _1294;
    int _2604 = _2602 + 1;
    float _2606 = _2578 * _1532;
    float _2608 = -_2578;
    float _2610 = _2608 + 1.0;
    bool _2612 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2614 = isnan(_1464);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = -_2596;
    float _2626 = _2624 + 1.0;
    float _2628 = float(_1572);
    float _2630 = _2596 * _2610;
    bool _2632 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2634 = isnan(_1464);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = -_2622;
    float _2646 = _2644 + 1.0;
    float _2648 = float(_1528);
    float _2650 = _2622 * _2626;
    float _2652 = float(_1612);
    float _2654 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2656 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2658 = isnan(_1464);
    bool _2660 = _2656 || _2658;
    bool _2662 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2664 = _2660 || _2662;
    float _2666 = float(_2664);
    int _2668 = _432 * _2604;
    int _2670 = _2668 + _1090;
    bool _2672 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2674 = isnan(_1464);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2680 = _2676 || _2678;
    float _2682 = float(_2680);
    float _2684 = _2642 * _2646;
    float _2686 = -_2642;
    float _2688 = _2686 + 1.0;
    int _2690 = abs(_1776);
    float _2692 = -_2666;
    float _2694 = _2692 + 1.0;
    int _2696 = abs(_1938);
    float _2698 = _2666 * _2688;
    float _2700 = exp2(_2654);
    float _2702 = _2682 * _2694;
    float _2704 = _1372 * _2370;
    float _2706 = float(_2690);
    float _2708 = -_2682;
    float _2710 = _2708 + 1.0;
    float _2712 = _2316 * _2702;
    float _2714 = _2384 * _2702;
    float _2716 = _2082 * _2628;
    float _2718 = -_1424;
    float _2720 = _2718 + 1.0;
    float _2722 = in.m_68.x;
    float _2724 = in.m_68.y;
    float _2726 = in.m_68.z;
    float _2728 = _2706 * _2648;
    float _2730 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[175].z, _2714);
    float _2732 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2598);
    float _2734 = float(_2696);
    float _2736 = _2716 * (-2.0);
    float _2738 = fma(_2446, _2698, _2730);
    float _2740 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2076);
    float _2742 = _2700 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2744 = fma(_2262, _2560, _2732);
    float _2746 = _2734 * _2652;
    float _2748 = fma(_2344, _2684, _2738);
    float _2750 = -_1966;
    float _2752 = fma(_2750, _2742, _2704);
    float _2754 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2712);
    float _2756 = -_1972;
    float _2758 = fma(_2756, _2742, _2558);
    float _2760 = _2746 * (-2.0);
    float _2762 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2752);
    float _2764 = fma(_2440, _2698, _2754);
    float _2766 = _2728 * (-2.0);
    float _2768 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2758);
    float _2770 = _2056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2772 = _2060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2774 = fma(_1794, _2766, _1794);
    bool _2776 = !_1016;
    int _2778 = _2776 ? _2670 : (-1);
    float _2780 = fma(_2766, _2722, _2722);
    float _2782 = _2762 + _2770;
    bool _2784 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2786 = isnan(1.0);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2792 = _2788 || _2790;
    float _2794 = -_2740;
    float _2796 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2798 = _2768 + _2772;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2802 = !_2792;
    float _2804 = _2802 ? _145 : _1924;
    float _2806 = -_2782;
    float _2808 = _2806 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2810 = -_2798;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2814 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2800);
    float _2816 = _2796 * _2796;
    bool _2818 = _131 > 0.5;
    float _2820 = _131 + (-0.5);
    float _2822 = fma(_2736, _2724, _2724);
    float _2824 = fma(_2808, _2808, _2816);
    float _2826 = in.m_58.x;
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2780);
    float _2830 = fma(_2760, _2726, _2726);
    float _2832 = fma(_2812, _2812, _2824);
    float _2834 = _169 + (-0.5);
    float _2836 = fma(_2804, _2774, _2828);
    float _2838 = fma(_1800, _2736, _1800);
    float _2840 = fma(_2326, _2684, _2764);
    float _2842 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2822);
    float _2844 = rsqrt(_2832);
    float _2846 = _2836 * 0.15915493667125701904296875;
    float _2848 = _173 + (-0.5);
    float _2850 = fma(_2286, _2536, _2744);
    float _2852 = fma(_1798, _2760, _1798);
    float _2854 = fma(_2452, _2650, _2840);
    float _2856 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2830);
    float _2858 = fma(_2236, _2518, _2850);
    float _2860 = fma(_2468, _2650, _2748);
    float _2862 = fma(_2432, _2630, _2854);
    float _2864 = fma(_2804, _2852, _2856);
    float _2866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2868 = _2740 + _2866;
    float _2870 = fma(_2264, _2494, _2858);
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2874 = _2782 + _2872;
    float _2876 = fma(_2434, _2630, _2860);
    float _2878 = fma(_2804, _2838, _2842);
    float _2880 = _2808 * _2844;
    float _2882 = _2812 * _2844;
    float _2884 = fma(_2232, _2490, _2870);
    float _2886 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2888 = _2798 + _2886;
    float _2890 = _2880 * _2880;
    float _2892 = fma(_2492, _2606, _2862);
    float _2894 = fma(_2258, _2454, _2884);
    float _2896 = fma(_2500, _2606, _2876);
    float _2898 = fma(_2882, _2882, _2890);
    float _2900 = _2868 * _2868;
    float _2902 = -_1372;
    float _2904 = _2902 + 1.0;
    float _2906 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2894);
    float _2908 = rsqrt(_2898);
    float _2910 = fma(_2874, _2874, _2900);
    float _2912 = _2878 * 0.15915493667125701904296875;
    bool _2914 = _2904 >= 0.001000000047497451305389404296875;
    bool _2916 = isnan(_2904);
    bool _2918 = _2914 || _2916;
    bool _2920 = isnan(0.001000000047497451305389404296875);
    bool _2922 = _2918 || _2920;
    float _2924 = float(_2922);
    float _2926 = fma(_2888, _2888, _2910);
    float _2928 = _2826 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2932 = _2864 * 0.15915493667125701904296875;
    float _2934 = _2796 * _2844;
    float _2936 = _2928 * _2906;
    float _2938 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2930);
    float _2940 = sqrt(_2926);
    int _2942 = _1218 >> 31;
    float _2944 = _2936 * _2924;
    float _2946 = fma(_2562, _2584, _2892);
    float _2948 = _2882 * _2908;
    float _2950 = _2880 * _2908;
    float _2952 = _2214 * _2944;
    float _2954 = fma(_2582, _2584, _2896);
    float _2956 = -_2948;
    float _2958 = _2882 * _2956;
    float _2960 = _2846 * 6.283185482025146484375;
    float _2962 = sin(_2960);
    float _2964 = -_2948;
    float _2966 = _2934 * _2964;
    float _2968 = in.m_58.y;
    float _2970 = -_2958;
    float _2972 = fma(_2880, _2950, _2970);
    float _2974 = _2934 * _2950;
    float _2976 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2946);
    float _2978 = -_256;
    int _2980 = _2078 ? as_type<int>(_2978) : as_type<int>(_256);
    float _2982 = _2972 * _2972;
    float _2984 = _2912 * 6.283185482025146484375;
    float _2986 = sin(_2984);
    float _2988 = _2940 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2990 = _2976 + 1.0;
    float _2992 = fma(_2974, _2974, _2982);
    int _2994 = _2942 & 3;
    float _2996 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2814);
    float _2998 = _2322 * _2990;
    float _3000 = fma(_2966, _2966, _2992);
    float _3002 = _2912 * 6.283185482025146484375;
    float _3004 = cos(_3002);
    int _3006 = _1218 + _2994;
    float _3008 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[182].z, _2954);
    bool _3010 = !_1640;
    float _3012 = _3010 ? _256 : as_type<float>(_2980);
    float _3014 = -_2996;
    float _3016 = _3014 + 1.0;
    float _3018 = _2932 * 6.283185482025146484375;
    float _3020 = cos(_3018);
    float _3022 = _2962 * _2986;
    float _3024 = _2846 * 6.283185482025146484375;
    float _3026 = cos(_3024);
    float _3028 = _2962 * _3004;
    float _3030 = rsqrt(_2926);
    float _3032 = _2952 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3034 = _726 >> 31;
    float _3036 = _3032 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _3038 = _3034 & 3;
    float _3040 = rsqrt(_3000);
    float _3042 = _2962 * _3020;
    int _3044 = _726 + _3038;
    float _3046 = _3026 * _3004;
    int _3048 = _3006 >> 2;
    float _3050 = _3026 * _2986;
    int _3052 = _3044 >> 2;
    float _3054 = _3004 * _3020;
    float _3056 = precise::min(_3036, _2988);
    float _3058 = 1.0 / _1982;
    int _3060 = _3052 << 4;
    int _3062 = _3060 + 368;
    float _3064 = _3026 * _3020;
    int _3066 = _3048 << 4;
    int _3068 = _3066 + 512;
    float _3070 = _3030 * _3056;
    uint _3072 = uint(int(uint(_3062) >> uint(2)));
    uint _3074 = uint(int(uint(int(_3072)) >> uint(2)));
    int _3076 = int(_3072) & 3;
    float _3078 = (*spvDescriptorSet0.vp_c9)._m0[int(_3074)][_3076];
    int _3080 = int(_3072) + 1;
    uint _3082 = uint(int(uint(_3080) >> uint(2)));
    int _3084 = _3080 & 3;
    float _3086 = (*spvDescriptorSet0.vp_c9)._m0[int(_3082)][_3084];
    float _3088 = _2986 * _3020;
    float _3090 = _2972 * _3040;
    float _3092 = precise::clamp(_3090, 0.0, 1.0);
    float _3094 = _2932 * 6.283185482025146484375;
    float _3096 = sin(_3094);
    float _3098 = _2868 * _3070;
    float _3100 = _2874 * _3070;
    float _3102 = -_3092;
    float _3104 = _3102 + 1.0;
    out.m_70.w = _3056;
    float _3106 = -_3098;
    float _3108 = _2868 + _3106;
    uint _3110 = uint(int(uint(_3068) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    float _3126 = fma(_1894, _3058, -1.0);
    float _3128 = _3108 * _3108;
    float _3130 = _3104 * _3058;
    float _3132 = fma(_3104, _3126, 1.0);
    int _3134 = _3062 + 8;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
    int _3140 = int(_3136) & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = int(_3136) + 1;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    int _3148 = _3144 & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    float _3152 = _1888 * _3130;
    float _3154 = fma(_3096, _3046, _3022);
    float _3156 = fma(_3096, _3022, _3046);
    float _3158 = -_3100;
    float _3160 = _2874 + _3158;
    float _3162 = _2888 * _3070;
    float _3164 = -_3050;
    float _3166 = fma(_3096, _3028, _3164);
    float _3168 = -_3028;
    float _3170 = fma(_3096, _3050, _3168);
    float _3172 = fma(_3160, _3160, _3128);
    float _3174 = -_3162;
    float _3176 = _2888 + _3174;
    int _3178 = abs(_758);
    float _3180 = _3132 * _3132;
    int _3182 = abs(_1540);
    float _3184 = fma(_3176, _3176, _3172);
    float _3186 = _1904 * _3130;
    float _3188 = fma(_3152, _3152, _3180);
    float _3190 = _2968 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _3192 = _3068 + 8;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    float _3210 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3212 = int(_3210);
    int _3214 = abs(_782);
    float _3216 = _3190 * _2906;
    int _3218 = abs(_1262);
    float _3220 = fma(_3186, _3186, _3188);
    int _3222 = ~_3178;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    float _3228 = _3216 * _2924;
    int _3230 = ~_776;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    float _3236 = rsqrt(_3220);
    int _3238 = ~_3218;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _2244 * _3228;
    int _3246 = ~_3182;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3234 * as_type<int>(_3086);
    float _3254 = _3244 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _3256 = _3226 * as_type<int>(_3078);
    int _3258 = _3256 + _3252;
    int _3260 = ~_3214;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    float _3266 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3268 = int(_3266);
    int _3270 = abs(_1548);
    int _3272 = _3242 * as_type<int>(_3124);
    int _3274 = abs(_3212);
    float _3276 = float(uint(_3212));
    int _3278 = _3250 * as_type<int>(_3116);
    int _3280 = _3278 + _3272;
    int _3282 = ~_3270;
    int _3284 = _3282 + 1;
    int _3286 = _3284 + 1;
    float _3288 = _3186 * _3236;
    float _3290 = _3152 * _3236;
    int _3292 = _3264 * as_type<int>(_3142);
    int _3294 = _3292 + _3258;
    float _3296 = 1.0 / _3276;
    int _3298 = abs(_794);
    int _3300 = _3286 * as_type<int>(_3150);
    int _3302 = _3300 + _3294;
    int _3304 = abs(_1288);
    float _3306 = _3132 * _3236;
    float _3308 = float(uint(_3274));
    int _3310 = ~_3298;
    int _3312 = _3310 + 1;
    int _3314 = _3312 + 1;
    int _3316 = abs(_1588);
    int _3318 = _3302 * _3314;
    int _3320 = abs(_3268);
    float _3322 = 1.0 / _3308;
    int _3324 = ~_3304;
    int _3326 = _3324 + 1;
    int _3328 = _3326 + 1;
    int _3330 = _1222 * _3298;
    int _3332 = _3330 + _3318;
    float _3334 = _2882 * _3306;
    int _3336 = ~_3316;
    int _3338 = _3336 + 1;
    int _3340 = _3338 + 1;
    int _3342 = _3328 * as_type<int>(_3200);
    int _3344 = _3342 + _3280;
    int _3346 = abs(_1192);
    float _3348 = -_3288;
    float _3350 = -_3334;
    float _3352 = fma(_2934, _3348, _3350);
    float _3354 = float(uint(_3320));
    int _3356 = _3340 * as_type<int>(_3208);
    int _3358 = _3356 + _3344;
    int _3360 = as_type<int>(_3296) + (-2);
    float _3362 = -_3288;
    float _3364 = _2880 * _3362;
    float _3366 = float(uint(_3332));
    float _3368 = 1.0 / _3354;
    float _3370 = float(uint(_3268));
    float _3372 = -_3290;
    float _3374 = -_3364;
    float _3376 = fma(_2882, _3372, _3374);
    int _3378 = as_type<int>(_3322) + (-2);
    float _3380 = as_type<float>(_3360) * _3366;
    float _3382 = -_3290;
    float _3384 = _2934 * _3382;
    int _3386 = ~_3346;
    int _3388 = _3386 + 1;
    int _3390 = _3388 + 1;
    float _3392 = _3376 * _3376;
    float _3394 = 1.0 / _3370;
    int _3396 = abs(_3332);
    float _3398 = -_3384;
    float _3400 = fma(_2880, _3306, _3398);
    int _3402 = _3358 * _3390;
    int _3404 = ~_3212;
    int _3406 = _3404 + 1;
    float _3408 = float(uint(_3396));
    int _3410 = _2778 * _3346;
    int _3412 = _3410 + _3402;
    float _3414 = trunc(_3380);
    float _3416 = precise::max(_3414, 0.0);
    uint _3418 = uint(_3416);
    float _3420 = as_type<float>(_3378) * _3408;
    float _3422 = fma(_3352, _3352, _3392);
    float _3424 = float(uint(_3412));
    float _3426 = trunc(_3420);
    float _3428 = precise::max(_3426, 0.0);
    uint _3430 = uint(_3428);
    int _3432 = as_type<int>(_3394) + (-2);
    float _3434 = fma(_3400, _3400, _3422);
    int _3436 = ~_3274;
    int _3438 = _3436 + 1;
    int _3440 = _3406 * int(_3418);
    int _3442 = _3440 + _3332;
    float _3444 = as_type<float>(_3432) * _3424;
    float _3446 = sqrt(_3184);
    float _3448 = float(uint(_3442));
    int _3450 = _3438 * int(_3430);
    int _3452 = _3450 + _3396;
    int _3454 = as_type<int>(_3368) + (-2);
    float _3456 = as_type<float>(_3360) * _3448;
    float _3458 = trunc(_3444);
    float _3460 = precise::max(_3458, 0.0);
    uint _3462 = uint(_3460);
    int _3464 = ~_3268;
    int _3466 = _3464 + 1;
    float _3468 = float(uint(_3452));
    int _3470 = abs(_3412);
    float _3472 = _3030 * _3446;
    float _3474 = as_type<float>(_3378) * _3468;
    float _3476 = rsqrt(_3434);
    float _3478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    float _3480 = _3032 * _3472;
    float _3482 = _3254 * _3472;
    float _3484 = float(uint(_3470));
    float _3486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _3488 = _3480 * _3478;
    int _3490 = _3466 * int(_3462);
    int _3492 = _3490 + _3412;
    float _3494 = trunc(_3474);
    float _3496 = precise::max(_3494, 0.0);
    uint _3498 = uint(_3496);
    float _3500 = as_type<float>(_3454) * _3484;
    int _3502 = ~_3274;
    int _3504 = _3502 + 1;
    out.m_72.x = _3480;
    float _3506 = float(uint(_3492));
    float _3508 = _3482 * _3486;
    float _3510 = trunc(_3456);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    float _3516 = _3352 * _3476;
    float _3518 = as_type<float>(_3432) * _3506;
    float _3520 = _3400 * _3476;
    float _3522 = _3376 * _3476;
    float _3524 = trunc(_3500);
    float _3526 = precise::max(_3524, 0.0);
    uint _3528 = uint(_3526);
    int _3530 = int(_3430) + int(_3498);
    float _3532 = _2882 * _3516;
    int _3534 = int(_3418) + int(_3514);
    float _3536 = -_3532;
    float _3538 = fma(_2880, _3520, _3536);
    int _3540 = ~_3212;
    int _3542 = _3540 + 1;
    float _3544 = _2934 * _3520;
    int _3546 = ~_3320;
    int _3548 = _3546 + 1;
    float _3550 = trunc(_3518);
    float _3552 = precise::max(_3550, 0.0);
    uint _3554 = uint(_3552);
    float _3556 = -_3544;
    float _3558 = fma(_2882, _3522, _3556);
    float _3560 = _2880 * _3522;
    int _3562 = _3542 * _3534;
    int _3564 = _3562 + _3332;
    float _3566 = -_3560;
    float _3568 = fma(_2934, _3516, _3566);
    int _3570 = _3548 * int(_3528);
    int _3572 = _3570 + _3470;
    float _3574 = _3538 * _3538;
    int _3576 = _3504 * _3530;
    int _3578 = _3576 + _3396;
    bool _3580 = uint(_3564) >= uint(_3212);
    float _3582 = float(uint(_3572));
    bool _3584 = !_3580;
    int _3586 = _3584 ? 0 : (-1);
    bool _3588 = uint(_3578) >= uint(_3274);
    float _3590 = fma(_3558, _3558, _3574);
    float _3592 = as_type<float>(_3454) * _3582;
    int _3594 = ~_3534;
    int _3596 = _3594 + _3586;
    int _3598 = _3596 + 1;
    float _3600 = -_3508;
    float _3602 = _3096 * _3600;
    float _3604 = fma(_3568, _3568, _3590);
    float _3606 = trunc(_3592);
    float _3608 = precise::max(_3606, 0.0);
    uint _3610 = uint(_3608);
    int _3612 = int(_3462) + int(_3554);
    float _3614 = _3064 * _3508;
    int _3616 = ~_3268;
    int _3618 = _3616 + 1;
    float _3620 = _3042 * _3508;
    bool _3622 = !_3588;
    int _3624 = _3622 ? 0 : (-1);
    int _3626 = _3212 * _3598;
    int _3628 = _3626 + _3332;
    bool _3630 = _3212 == 0;
    float _3632 = rsqrt(_3604);
    int _3634 = _3618 * _3612;
    int _3636 = _3634 + _3412;
    int _3638 = ~_3320;
    int _3640 = _3638 + 1;
    float _3642 = fma(_3154, _3488, _3614);
    float _3644 = fma(_3054, _3488, _3602);
    float _3646 = fma(_3166, _3488, _3620);
    bool _3648 = !_3630;
    int _3650 = _3648 ? _3628 : (-1);
    bool _3652 = uint(_3636) >= uint(_3268);
    int _3654 = int(_3528) + int(_3610);
    float _3656 = -_256;
    int _3658 = _2818 ? as_type<int>(_3656) : as_type<int>(_256);
    bool _3660 = _3212 == 0;
    float _3662 = _3538 * _3632;
    int _3664 = _3332 ^ _3212;
    float _3666 = _3558 * _3632;
    bool _3668 = !_3652;
    int _3670 = _3668 ? 0 : (-1);
    float _3672 = _3568 * _3632;
    int _3674 = _3640 * _3654;
    int _3676 = _3674 + _3470;
    float _3678 = _3154 * _3666;
    int _3680 = ~_3612;
    int _3682 = _3680 + _3670;
    int _3684 = _3682 + 1;
    float _3686 = _2880 * _3672;
    float _3688 = _3064 * _3666;
    bool _3690 = uint(_3676) >= uint(_3320);
    float _3692 = _2934 * _3666;
    float _3694 = _2882 * _3662;
    float _3696 = -_3686;
    float _3698 = fma(_2882, _3666, _3696);
    float _3700 = _3170 * _3666;
    float _3702 = _3642 * _3666;
    float _3704 = _3154 * _3662;
    float _3706 = _3064 * _3662;
    float _3708 = _3170 * _3662;
    float _3710 = _3642 * _3662;
    float _3712 = -_3692;
    float _3714 = fma(_2880, _3662, _3712);
    float _3716 = -_3694;
    float _3718 = fma(_2934, _3672, _3716);
    float _3720 = _3698 * _3698;
    float _3722 = _3642 * _3672;
    float _3724 = _3064 * _3672;
    bool _3726 = !_1598;
    float _3728 = _3726 ? _256 : as_type<float>(_3658);
    float _3730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3732 = !_3690;
    int _3734 = _3732 ? 0 : (-1);
    int _3736 = _3268 * _3684;
    int _3738 = _3736 + _3412;
    bool _3740 = _3268 == 0;
    float _3742 = _3154 * _3672;
    bool _3744 = _3268 == 0;
    float _3746 = _3170 * _3672;
    int _3748 = _3412 ^ _3268;
    float _3750 = fma(_3718, _3718, _3720);
    uint _3752 = uint(int(uint(_3664) >> uint(31)));
    float _3754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3756 = ~_3624;
    int _3758 = _3530 + _3756;
    int _3760 = _3758 + 1;
    float _3762 = -_145;
    float _3764 = fma(_3762, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1650);
    int _3766 = ~_3734;
    int _3768 = _3654 + _3766;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3714, _3714, _3750);
    int _3774 = ~int(_3752);
    int _3776 = _3774 + 1;
    float _3778 = _3730 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3780 = float(_3650);
    float _3782 = -_145;
    float _3784 = fma(_3782, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1996);
    int _3786 = _3760 ^ _3776;
    float _3788 = rsqrt(_3772);
    float _3790 = fma(_3778, _3780, _3764);
    int _3792 = ~_3776;
    int _3794 = _3792 + _3786;
    int _3796 = _3794 + 1;
    bool _3798 = !_3740;
    int _3800 = _3798 ? _3738 : (-1);
    float _3802 = _3754 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3804 = uint(int(uint(_3748) >> uint(31)));
    float _3806 = float(_3800);
    float _3808 = _3728 + 0.5;
    int _3810 = ~int(_3804);
    int _3812 = _3810 + 1;
    float _3814 = fma(_3802, _3806, _3784);
    float _3816 = fma(_3778, _3808, _3790);
    float _3818 = _3012 + 0.5;
    float _3820 = _3718 * _3788;
    float _3822 = _3698 * _3788;
    float _3824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3826 = _3714 * _3788;
    float _3828 = fma(_3054, _3820, _3678);
    float _3830 = -_3096;
    float _3832 = fma(_3830, _3820, _3688);
    float _3834 = -_3096;
    float _3836 = fma(_3834, _3822, _3706);
    float _3838 = fma(_3054, _3826, _3742);
    float _3840 = -_3096;
    float _3842 = fma(_3840, _3826, _3724);
    float _3844 = fma(_3088, _3826, _3746);
    float _3846 = fma(_3644, _3826, _3722);
    float _3848 = fma(_3088, _3820, _3700);
    float _3850 = fma(_3644, _3820, _3702);
    float _3852 = fma(_3802, _3818, _3814);
    float _3854 = fma(_2882, _3646, _3846);
    bool _3856 = !_3660;
    int _3858 = _3856 ? _3796 : (-1);
    float _3860 = fma(_2880, _3646, _3850);
    float _3862 = fma(_3644, _3822, _3710);
    float _3864 = _2798 + _3854;
    float _3866 = float(_3858);
    float _3868 = _3824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3872 = _2782 + _3860;
    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3876 = _3864 + _3874;
    float _3878 = -_1934;
    float _3880 = fma(_3868, _3866, _3878);
    int _3882 = _3770 ^ _3812;
    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3886 = _3872 + _3884;
    float _3888 = _3876 * _3876;
    float _3890 = fma(_3088, _3822, _3708);
    float _3892 = fma(_3054, _3822, _3704);
    float _3894 = fma(_3156, _2880, _3848);
    float _3896 = fma(_3886, _3886, _3888);
    int _3898 = ~_3812;
    int _3900 = _3898 + _3882;
    int _3902 = _3900 + 1;
    float _3904 = fma(_2934, _3646, _3862);
    float _3906 = -_272;
    int _3908 = _2314 ? as_type<int>(_3906) : as_type<int>(_272);
    float _3910 = sqrt(_3896);
    float _3912 = fma(_3156, _2934, _3890);
    float _3914 = fma(_3156, _2882, _3844);
    bool _3916 = !_3744;
    int _3918 = _3916 ? _3902 : (-1);
    float _3920 = _3870 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3922 = !_1630;
    float _3924 = _3922 ? _272 : as_type<float>(_3908);
    float _3926 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3928 = float(_3918);
    float _3930 = fma(_3042, _2880, _3832);
    float _3932 = fma(_3042, _2934, _3836);
    float _3934 = _3924 + (-0.5);
    float _3936 = fma(_3042, _2882, _3842);
    float _3938 = -_2080;
    float _3940 = fma(_3920, _3928, _3938);
    float _3942 = _814 + (-0.5);
    float _3944 = -_3868;
    float _3946 = fma(_3944, _3934, _3880);
    float _3948 = fma(_3926, _3926, 1.0);
    bool _3950 = _3910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3952 = -_3920;
    float _3954 = fma(_3952, _3942, _3940);
    float _3956 = fma(_3166, _2880, _3828);
    float _3958 = rsqrt(_3948);
    float _3960 = fma(_3166, _2934, _3892);
    float _3962 = fma(_3166, _2882, _3838);
    float _3964 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3926 * _3930;
    float _3968 = _3926 * _3932;
    float _3970 = _3926 * _3936;
    float _3972 = _2740 + _3904;
    out.m_74.x = _3956;
    out.m_74.y = _3960;
    out.m_74.z = _3962;
    float _3974 = fma(_3964, _3956, _3966);
    float _3976 = _3880;
    float _3978 = _3966;
    float _3980 = _3964;
    float _3982 = _2126;
    float _3984 = _2130;
    if (!_3950)
    {
        _3976 = _3872;
    }
    float _3986 = _3976;
    float _3988 = _3986;
    if (!_3950)
    {
        _3978 = _3864;
    }
    float _3990 = _3978;
    float _3992 = fma(_3964, _3960, _3968);
    float _3994 = fma(_3964, _3962, _3970);
    float _3996 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2022);
    float _3998 = _3990;
    if (!_3950)
    {
        _3980 = _3972;
    }
    float _4000 = _3980;
    bool _4002 = !_3950;
    float _4004 = _4000;
    if (!_4002)
    {
        float _4006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4010 = _3910 + _4008;
        float _4012 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4014 = rsqrt(_3896);
        float _4016 = _4010 * _4006;
        float _4018 = _4016 * 0.15915493667125701904296875;
        float _4020 = _4018 * 6.283185482025146484375;
        float _4022 = cos(_4020);
        float _4024 = _4018 * 6.283185482025146484375;
        float _4026 = sin(_4024);
        float _4028 = _4022 + (-1.0);
        float _4030 = _4028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4032 = fma(_4026, _4012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4034 = fma(_3972, _4022, _4030);
        float _4036 = _4014 * _4032;
        float _4038 = fma(_3886, _4036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4040 = fma(_3876, _4036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4004 = _4034;
        _3988 = _4038;
        _3998 = _4040;
    }
    float _4042 = _4004;
    float _4044 = _3988;
    float _4046 = _3998;
    float _4048 = -_2740;
    float _4050 = _4048 + _4042;
    float _4052 = -_3016;
    float _4054 = fma(_3728, _4052, _3816);
    float _4056 = -_3996;
    float _4058 = _4056 + 1.0;
    float _4060 = -_2782;
    float _4062 = _4060 + _4044;
    float _4064 = _4050 * _4050;
    float _4066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2938);
    float _4068 = -_4058;
    float _4070 = fma(_3012, _4068, _3852);
    float _4072 = -_2798;
    float _4074 = _4072 + _4046;
    float _4076 = fma(_4062, _4062, _4064);
    float _4078 = _3926 * _3958;
    float _4080 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2002);
    float _4082 = -_4066;
    float _4084 = _4082 + 1.0;
    float _4086 = fma(_4074, _4074, _4076);
    float _4088 = -_3894;
    float _4090 = _4078 * _4088;
    float _4092 = -_4080;
    float _4094 = _4092 + 1.0;
    float _4096 = -_3912;
    float _4098 = _4078 * _4096;
    float _4100 = sqrt(_4086);
    float _4102 = -_3914;
    float _4104 = _4078 * _4102;
    float _4106 = fma(_3924, _4084, _3946);
    float _4108 = fma(_3958, _3930, _4090);
    float _4110 = fma(_814, _4094, _3954);
    float _4112 = fma(_3958, _3932, _4098);
    float _4114 = fma(_3958, _3936, _4104);
    float _4116 = _3894 + _3974;
    float _4118 = _3912 + _3992;
    float _4120 = _3914 + _3994;
    float _4122 = _3008 + 1.0;
    out.m_76.x = _4108;
    out.m_76.y = _4112;
    out.m_76.z = _4114;
    float _4124 = -_2130;
    float _4126 = _1330 + _4124;
    float _4128 = -_3162;
    float _4130 = _4128 + _4046;
    float _4132 = _2330 * _4122;
    out.m_78.x = _4116;
    out.m_78.y = _4118;
    out.m_78.z = _4120;
    bool _4134 = _4100 > 0.0;
    float _4136 = -_3098;
    float _4138 = _4136 + _4042;
    float _4140 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2156);
    out.m_80.x = _4054;
    out.m_80.y = _4106;
    out.m_80.z = _4070;
    out.m_80.w = _4110;
    float _4142 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2160);
    float _4144 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2158);
    float _4146 = fma(_2998, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4140);
    float _4148 = fma(_4132, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4142);
    float _4150 = -_3100;
    float _4152 = _2782 + _4150;
    float _4154 = -_3098;
    float _4156 = _2740 + _4154;
    float _4158 = -_3162;
    float _4160 = _2798 + _4158;
    float _4162 = _4126;
    float _4164 = _4046;
    float _4166 = _4114;
    float _4168 = _4112;
    float _4170 = _4108;
    float _4172 = _4070;
    float _4174 = _4106;
    float _4176 = _4054;
    if (!_4134)
    {
        _4162 = _4138;
    }
    float _4178 = _4162;
    float _4180 = _4178;
    float _4182 = _4178;
    if (!_4134)
    {
        _4164 = _4130;
    }
    float _4184 = _4164;
    float _4186 = -_3100;
    float _4188 = _4186 + _4044;
    float _4190 = _4184;
    float _4192 = _4184;
    if (!_4134)
    {
        _970 = _4188;
    }
    float _4194 = _970;
    bool _4196 = !_4134;
    float _4198 = _4194;
    float _4200 = _4194;
    float _4202 = _4194;
    if (!_4196)
    {
        bool _4204 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4206 = _4054;
        if (_4204)
        {
            float _4208 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4206 = _4208;
        }
        float _4210 = _4206;
        if (_4204)
        {
            _4166 = _4146;
        }
        float _4212 = _4166;
        float _4214 = _4212;
        if (_4204)
        {
            _4168 = _4144;
        }
        float _4216 = _4168;
        float _4218 = _4216;
        if (_4204)
        {
            _4170 = _4148;
        }
        float _4220 = _4170;
        float _4222 = _4210;
        float _4224 = _4220;
        if (_4204)
        {
            float _4226 = _4146 * _4210;
            _4172 = _4226;
        }
        float _4228 = _4172;
        float _4230 = _4228;
        if (_4204)
        {
            float _4232 = _4144 * _4210;
            _4174 = _4232;
        }
        float _4234 = _4174;
        float _4236 = _4234;
        if (_4204)
        {
            float _4238 = _4148 * _4210;
            _4222 = _4238;
        }
        float _4240 = _4222;
        float _4242 = _4240;
        if (!_4204)
        {
            bool _4244 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4246 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4248 = _4244 || _4246;
            bool _4250 = isnan(1.0);
            bool _4252 = _4248 || _4250;
            float _4254 = _145 + 1.0;
            float _4256 = _4254;
            if (!_4252)
            {
                float _4258 = _4254 * _4254;
                float _4260 = _4258 * 0.5;
                _4198 = _4260;
            }
            float _4262 = _4198;
            float _4264 = _4262;
            if (!_4252)
            {
                float _4266 = _4262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4264 = _4266;
            }
            float _4268 = _4264;
            bool _4270 = !_4252;
            float _4272 = _4268;
            if (!_4270)
            {
                float _4274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4276 = log2(_4274);
                float _4278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4280 = _4278 + 1.0;
                float _4282 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4284 = _4276 * _4254;
                float _4286 = 1.0 / _4280;
                float _4288 = _4282 * 0.693147182464599609375;
                float _4290 = exp2(_4284);
                float _4292 = 1.0 / _4288;
                float _4294 = _4290 + (-1.0);
                float _4296 = -_4294;
                float _4298 = fma(_4296, _4292, _4254);
                float _4300 = _4298 * _4286;
                float _4302 = _4300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4272 = _4302;
            }
            float _4304 = _4272;
            float _4306 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4308 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4310 = !_4252;
            _4180 = _4306;
            _4200 = _4304;
            if (!_4310)
            {
                float _4312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4314 = log2(_4312);
                float _4316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4318 = _4316 + 1.0;
                float _4320 = 1.0 / _4318;
                float _4322 = _4314 * _4254;
                float _4324 = exp2(_4322);
                float _4326 = -_4324;
                float _4328 = _4326 + 1.0;
                float _4330 = _4328 * _4320;
                _4256 = _4330;
            }
            float _4332 = _4256;
            float _4334 = fma(_4332, _1300, _4308);
            float _4336 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4338 = fma(_4332, _1298, _4306);
            float _4340 = -_2126;
            float _4342 = _4340 + _4334;
            float _4344 = fma(_4332, _1302, _4336);
            float _4346 = -_2128;
            float _4348 = _4346 + _4338;
            float _4350 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4352 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4354 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4356 = -_2130;
            float _4358 = _4356 + _4344;
            float _4360 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4350);
            float _4362 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4352);
            float _4364 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4354);
            float _4366 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4360);
            float _4368 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4362);
            float _4370 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4364);
            _4218 = _4368;
            _4214 = _4366;
            _4224 = _4370;
            _4230 = _4366;
            _4236 = _4368;
            _4242 = _4370;
            _4190 = _4364;
        }
        float _4372 = _4218;
        float _4374 = _4214;
        float _4376 = _4224;
        float _4378 = _4230;
        float _4380 = _4236;
        float _4382 = _4242;
        float _4384 = _4180;
        float _4386 = _4200;
        float _4388 = _4190;
        float _4390 = _4372 * _4372;
        float _4392 = fma(_4374, _4374, _4390);
        float _4394 = fma(_4376, _4376, _4392);
        float _4396 = rsqrt(_4086);
        float _4398 = sqrt(_4394);
        float _4400 = _4062 * _4396;
        float _4402 = _4050 * _4396;
        float _4404 = _4074 * _4396;
        bool _4406 = _4398 > 0.0;
        float _4408 = _4386;
        float _4410 = _4384;
        float _4412 = _4388;
        _4176 = _4382;
        if (!_4406)
        {
            _4408 = _4188;
        }
        float _4414 = _4408;
        _4202 = _4414;
        if (!_4406)
        {
            _4410 = _4138;
        }
        float _4416 = _4410;
        _4182 = _4416;
        if (!_4406)
        {
            _4412 = _4130;
        }
        float _4418 = _4412;
        bool _4420 = !_4406;
        _4192 = _4418;
        if (!_4420)
        {
            float _4422 = rsqrt(_4394);
            float _4424 = _4422 * _4372;
            float _4426 = _4422 * _4374;
            float _4428 = _4422 * _4376;
            float _4430 = _4402 * _4424;
            float _4432 = fma(_4400, _4426, _4430);
            float _4434 = fma(_4404, _4428, _4432);
            float _4436 = _4434 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4438 = fma(_4378, _4436, _4188);
            float _4440 = fma(_4380, _4436, _4138);
            float _4442 = fma(_4382, _4436, _4130);
            _4182 = _4440;
            _4202 = _4438;
            _4192 = _4442;
        }
    }
    float _4444 = _4182;
    float _4446 = _4202;
    float _4448 = _4192;
    float _4450 = _4176;
    float _4452 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4454 = _4444 + _4452;
    float _4456 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4458 = _4446 + _4456;
    float _4460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4462 = _4448 + _4460;
    float _4464 = _4454 * _4454;
    float _4466 = fma(_4458, _4458, _4464);
    float _4468 = fma(_4462, _4462, _4466);
    float _4470 = rsqrt(_4468);
    float _4472 = sqrt(_4468);
    float _4474 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4476 = _4458 * _4474;
    float _4478 = _4462 * _4474;
    float _4480 = _4476 * _4476;
    float _4482 = _4478 * _4478;
    float _4484 = _4480 + _4482;
    float _4486 = sqrt(_4484);
    bool _4488 = _4486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4492 = _4486 + _4490;
    float _4494 = _4470;
    float _4496 = _4484;
    float _4498 = _4492;
    float _4500 = _4454;
    float _4502 = _4450;
    if (_4488)
    {
        float _4504 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4494 = _4504;
    }
    float _4506 = _4494;
    if (_4488)
    {
        float _4508 = rsqrt(_4484);
        _4496 = _4508;
    }
    float _4510 = _4496;
    float _4512 = _4510;
    if (_4488)
    {
        float _4514 = _4492 * _4506;
        _4498 = _4514;
    }
    float _4516 = _4498;
    if (_4488)
    {
        float _4518 = _4516 * 0.15915493667125701904296875;
        _3982 = _4518;
    }
    float _4520 = _3982;
    float _4522 = _4462;
    if (_4488)
    {
        float _4524 = _4520 * 6.283185482025146484375;
        float _4526 = sin(_4524);
        _4522 = _4526;
    }
    float _4528 = _4522;
    float _4530 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4532 = precise::max(0.0, _4530);
    float _4534 = _4506;
    float _4536 = _4532;
    if (_4488)
    {
        float _4538 = _4520 * 6.283185482025146484375;
        float _4540 = cos(_4538);
        _4534 = _4540;
    }
    float _4542 = _4534;
    float _4544 = -_4474;
    float _4546 = -_4532;
    float _4548 = fma(_4454, _4544, _4546);
    if (_4488)
    {
        float _4550 = _4548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4500 = _4550;
    }
    float _4552 = _4500;
    float _4554 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4556 = _4552;
    float _4558 = _4528;
    if (_4488)
    {
        float _4560 = fma(_4528, _4552, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4556 = _4560;
    }
    float _4562 = _4556;
    float _4564 = _4562;
    if (!_4488)
    {
        _4558 = _4476;
    }
    float _4566 = _4558;
    float _4568 = _4566;
    float _4570 = _4542;
    if (_4488)
    {
        float _4572 = _4542 + (-1.0);
        _4536 = _4572;
    }
    float _4574 = _4536;
    float _4576 = _4574;
    if (_4488)
    {
        float _4578 = _4510 * _4562;
        _4502 = _4578;
    }
    float _4580 = _4502;
    if (!_4488)
    {
        _4564 = _4548;
    }
    float _4582 = _4564;
    float _4584 = _4582;
    if (_4488)
    {
        float _4586 = _4574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3984 = _4586;
    }
    float _4588 = _3984;
    if (_4488)
    {
        float _4590 = _4476 * _4580;
        _4568 = _4590;
    }
    float _4592 = _4568;
    if (!_4488)
    {
        _4576 = _4478;
    }
    float _4594 = _4576;
    float _4596 = _4594;
    if (_4488)
    {
        float _4598 = _4478 * _4580;
        _4596 = _4598;
    }
    float _4600 = _4596;
    if (!_4488)
    {
        _4512 = _4480;
    }
    float _4602 = _4512;
    float _4604 = _4602;
    if (_4488)
    {
        float _4606 = fma(_4548, _4542, _4588);
        _4584 = _4606;
    }
    float _4608 = _4584;
    if (_4488)
    {
        float _4610 = _4592 * _4592;
        _4604 = _4610;
    }
    float _4612 = _4604;
    if (!_4488)
    {
        _4570 = _4482;
    }
    float _4614 = _4570;
    float _4616 = _4614;
    if (_4488)
    {
        float _4618 = _4600 * _4600;
        _4616 = _4618;
    }
    float _4620 = _4616;
    float _4622 = fma(_4608, _4608, _4612);
    float _4624 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4626 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4628 = _4622 + _4620;
    float _4630 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4554);
    float _4632 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4636 = fma(_4472, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4634);
    float _4638 = precise::clamp(_4636, 0.0, 1.0);
    float _4640 = rsqrt(_4628);
    float _4642 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4630);
    float _4644 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4646 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4632);
    float _4648 = -_4638;
    float _4650 = _4648 + 1.0;
    float _4652 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4654 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4644);
    float _4656 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4646);
    float _4658 = abs(_4650);
    float _4660 = log2(_4658);
    float _4662 = _4652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4664 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4654);
    float _4666 = _4656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4668 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4626);
    float _4670 = -_4662;
    float _4672 = fma(_4670, _4624, 1.0);
    float _4674 = _4664 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4676 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4678 = _4640 * _4592;
    float _4680 = _4640 * _4608;
    float _4682 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4668);
    float _4684 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4676);
    float _4686 = _4678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4688 = _4640 * _4600;
    float _4690 = _4682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4692 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4684);
    float _4694 = -_4686;
    float _4696 = fma(_4680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4694);
    float _4698 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4700 = log2(_4672);
    float _4702 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4692);
    float _4704 = -_4688;
    float _4706 = fma(_4704, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4696);
    float _4708 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4710 = _4680 + 1.0;
    float _4712 = fma(_4706, -0.5, 0.5);
    float _4714 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4708);
    float _4716 = exp2(_4698);
    float _4718 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4720 = fma(_4706, 0.5, 0.5);
    float _4722 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4714);
    float _4724 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4718);
    float _4726 = fma(_4720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4728 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4722);
    float _4730 = 1.0 / _4702;
    float _4732 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4724);
    float _4734 = fma(_4720, _4726, -0.212114393711090087890625);
    float _4736 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4732);
    float _4738 = fma(_4720, _4734, 1.570728778839111328125);
    float _4740 = sqrt(_4712);
    float _4742 = -_4680;
    float _4744 = fma(_4716, _4710, _4742);
    float _4746 = _4700 * 0.693147182464599609375;
    float _4748 = fma(_4744, 0.5, 0.5);
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4752 = _4728 * _4730;
    float _4754 = _4736 * _4730;
    float _4756 = fma(_4752, 0.5, 0.5);
    float _4758 = fma(_4754, -0.5, 0.5);
    float _4760 = _4740 * 0.636619746685028076171875;
    float3 _12268 = float3(_4756, _4758, _4750);
    float _4762 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12268, float3(0.0), isnan(_12268)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12268, float3(0.0), isnan(_12268)), level(0.0)).x;
    float3 _12279 = float3(_4756, _4758, _4750);
    float4 _4765 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12279, float3(0.0), isnan(_12279)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12279, float3(0.0), isnan(_12279)), level(0.0)).xyzw;
    float _4767 = _4765.x;
    float _4769 = _4765.y;
    float _4771 = _4765.z;
    float _4773 = _4765.w;
    float _4775 = -_4738;
    float _4777 = fma(_4760, _4775, 1.0);
    float2 _12301 = float2(_4777, _4748);
    float3 _4781 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12301, float2(0.0), isnan(_12301)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12301, float2(0.0), isnan(_12301)), level(0.0)).xyz;
    float _4783 = _4781.x;
    float _4785 = _4781.y;
    float _4787 = _4781.z;
    float _4789 = _4156 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4791 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4793 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _4152;
    out.m_82.y = _4156;
    out.m_82.z = _4160;
    float _4795 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4789);
    bool _4797 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4799 = isnan(_4472);
    bool _4801 = _4797 || _4799;
    bool _4803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4805 = _4801 || _4803;
    float _4807 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4793);
    float _4809 = exp2(_4791);
    float _4811 = fma(_4160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4795);
    float _4813 = _4156 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_84.x = _4446;
    out.m_84.y = _4444;
    out.m_84.z = _4448;
    float _4815 = _4811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4817 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4813);
    float _4819 = 1.0 / _4815;
    bool _4821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4825 = _4821 || _4823;
    bool _4827 = isnan(0.5);
    bool _4829 = _4825 || _4827;
    float _4831 = fma(_4160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4817);
    float _4833 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4807);
    float _4835 = _4831 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4837 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4833);
    float _4839 = -_4809;
    float _4841 = _4839 + 1.0;
    float _4843 = _4835 + _4815;
    float _4845 = _4837 + _4702;
    float _4847 = _4841 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4728;
    out.gl_Position.y = _4736;
    out.gl_Position.z = _4837;
    out.gl_Position.w = _4702;
    float _4849 = _4674;
    float _4851 = _4690;
    float _4853 = _4702;
    float _4855 = _4837;
    float _4857 = _4736;
    float _4859 = _4728;
    if (!_4829)
    {
        _4849 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4861 = _4849;
    float _4863 = _4845 * 0.5;
    float _4865 = _4843 * _4819;
    float _4867 = _4865 * 0.5;
    float _4869 = _4702 * 0.5;
    float _4871 = _4869;
    if (!_4829)
    {
        float _4873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4875 = fma(_4867, _4861, _4873);
        _4851 = _4875;
    }
    float _4877 = _4851;
    float _4879 = fma(_4736, -0.5, _4869);
    if (!_4829)
    {
        _4871 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4881 = _4871;
    float _4883 = _4728 + _4702;
    float _4885 = _4877;
    float _4887 = _4881;
    if (!_4829)
    {
        float _4889 = 1.0 / _4877;
        _4885 = _4889;
    }
    float _4891 = _4885;
    float _4893 = _4883 * 0.5;
    if (_4829)
    {
        _4853 = 1.0;
    }
    float _4895 = _4853;
    float _4897 = _4895;
    if (!_4805)
    {
        _4855 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4899 = _4855;
    out.m_86.x = _4893;
    out.m_86.y = _4879;
    out.m_86.z = _4863;
    out.m_86.w = _4702;
    float _4901 = _4899;
    float _4903 = _4899;
    if (!_4805)
    {
        _4857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4905 = _4857;
    float _4907 = _4905;
    float _4909 = _4905;
    if (!_4805)
    {
        _4859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4911 = _4859;
    float _4913 = _4891;
    float _4915 = _4911;
    float _4917 = _4911;
    if (!_4829)
    {
        float _4919 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4921 = -_4881;
        float _4923 = fma(_4891, _4919, _4921);
        _4913 = _4923;
    }
    float _4925 = _4913;
    if (!_4829)
    {
        float _4927 = -_4881;
        float _4929 = _4927 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4887 = _4929;
    }
    float _4931 = _4887;
    float _4933 = _4931;
    if (!_4829)
    {
        float _4935 = 1.0 / _4931;
        _4933 = _4935;
    }
    float _4937 = _4933;
    if (!_4829)
    {
        float _4939 = _4925 * _4937;
        float _4941 = precise::clamp(_4939, 0.0, 1.0);
        _4897 = _4941;
    }
    float _4943 = _4897;
    float _4945 = _4943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4947 = _4847 * _4762;
    float _4949 = -_4847;
    float _4951 = _4949 + 1.0;
    float _4953 = _4773 * _4947;
    float _4955 = _4773 * _4951;
    float _4957 = _4787 * _4947;
    float _4959 = fma(_4783, _4953, _4767);
    float _4961 = fma(_4785, _4953, _4769);
    float _4963 = fma(_4773, _4957, _4771);
    out.m_88.x = _4959;
    out.m_88.y = _4961;
    out.m_88.z = _4963;
    out.m_88.w = _4955;
    bool _4965 = !_4805;
    if (!_4965)
    {
        bool _4967 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4969 = isnan(_4472);
        bool _4971 = _4967 || _4969;
        bool _4973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4975 = _4971 || _4973;
        if (!_4975)
        {
            float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4979 = _4472 + _4977;
            float _4981 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4983 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4981;
            float _4985 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4987 = _4985 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4991 = _4989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4993 = 1.0 / _4983;
            float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4999 = _4979 * _4993;
            float _5001 = precise::clamp(_4999, 0.0, 1.0);
            float _5003 = fma(_5001, _4987, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5005 = fma(_5001, _4991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5007 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4909 = _5005;
            _4903 = _5003;
            _4917 = _5007;
            _5009 = true;
        }
        else
        {
            bool _5011 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5013 = isnan(_4472);
            bool _5015 = _5011 || _5013;
            bool _5017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5019 = _5015 || _5017;
            if (!_5019)
            {
                _4901 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5021 = _4901;
            _4903 = _5021;
            if (!_5019)
            {
                _4907 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5023 = _4907;
            _4909 = _5023;
            if (!_5019)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5025 = _4915;
            bool _5027 = !_5019;
            _4917 = _5025;
            if (!_5027)
            {
                bool _5029 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5031 = isnan(_4472);
                bool _5033 = _5029 || _5031;
                bool _5035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5037 = _5033 || _5035;
                if (!_5037)
                {
                    float _5039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5041 = _4472 + _5039;
                    float _5043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5043;
                    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5049 = _5047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5051 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5053 = _5051 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5055 = 1.0 / _5045;
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5061 = _5041 * _5055;
                    float _5063 = precise::clamp(_5061, 0.0, 1.0);
                    float _5065 = fma(_5063, _5049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5067 = fma(_5063, _5053, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5069 = fma(_5063, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4909 = _5067;
                    _4903 = _5065;
                    _4917 = _5069;
                    _5009 = true;
                }
                else
                {
                    _4909 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4903 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5009 = false;
    float _5071 = _4909;
    float _5073 = _4903;
    float _5075 = _4917;
    float _5077 = _4945 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5079 = _5071 * 0.586610972881317138671875;
    bool _5081 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5077;
    float _5083 = fma(_5073, 0.298911988735198974609375, _5079);
    bool _5085 = _4943 > 0.0;
    bool _5087 = isnan(_4943);
    bool _5089 = _5085 || _5087;
    bool _5091 = isnan(0.0);
    bool _5093 = _5089 || _5091;
    float _5095 = fma(_5075, 0.114477999508380889892578125, _5083);
    float _5097 = -_5095;
    float _5099 = _5097 + _5073;
    float _5101 = -_5095;
    float _5103 = _5101 + _5071;
    float _5105 = -_5095;
    float _5107 = _5105 + _5075;
    float _5109 = fma(_5099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    float _5111 = fma(_5103, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    float _5113 = fma(_5107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    bool _5115 = !_5081;
    if (!_5115)
    {
        float _5117 = -_4444;
        float _5119 = _5117 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5121 = -_4446;
        float _5123 = _5121 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5125 = -_4448;
        float _5127 = _5125 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5129 = _5119 * _5119;
        float _5131 = fma(_5123, _5123, _5129);
        float _5133 = fma(_5127, _5127, _5131);
        float _5135 = sqrt(_5133);
        float _5137 = rsqrt(_5133);
        float _5139 = -_5135;
        float _5141 = _5139 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5143 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = _5123 * _5137;
        float _5149 = _5119 * _5137;
        float _5151 = abs(_5145);
        float _5153 = log2(_5151);
        float _5155 = _5127 * _5137;
        float _5157 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5159 = _4118 * _5149;
        float _5161 = -_5149;
        float _5163 = -_5157;
        float _5165 = fma(_5161, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5163);
        float _5167 = fma(_4116, _5147, _5159);
        float _5169 = -_5155;
        float _5171 = fma(_5169, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5165);
        float _5173 = fma(_4120, _5155, _5167);
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5179 = _5171 + _5177;
        float _5181 = _5153 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5183 = _5179 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5185 = precise::clamp(_5183, 0.0, 1.0);
        float _5187 = exp2(_5181);
        float _5189 = _5187 * _5185;
        float _5191 = _5175 * _5189;
        float _5193 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5195 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5197 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5193;
        out.m_90.y = _5195;
        out.m_90.z = _5197;
    }
    out.m_70.x = _5109;
    out.m_70.y = _5111;
    out.m_70.z = _5113;
    if (_5093)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _5199 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5199;
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
    bool _5009 = false;
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
        float _5256 = as_type<float>(_125);
        out.gl_Position.z = _5256;
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
        float _5329 = as_type<float>(_163);
        out.gl_Position.z = _5329;
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
    float _462 = _131 * 2.0;
    float _464 = _169 * 2.0;
    bool _466 = !_446;
    float _468 = _466 ? _256 : as_type<float>(_456);
    float _470 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    bool _472 = !_450;
    float _474 = _472 ? _272 : as_type<float>(_436);
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _478 = _476 != 0;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _486 = _484 != 0;
    float _488 = float(_109);
    float _490 = floor(_462);
    bool _492 = !_482;
    int _494 = _492 ? 0 : 1;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _498 = _496 != 0;
    float _500 = float(_177);
    float _502 = float(_201);
    float _504 = 1.0 / _488;
    bool _506 = !_460;
    int _508 = _506 ? 0 : (-1);
    bool _510 = _502 >= _500;
    bool _512 = isnan(_502);
    bool _514 = _510 || _512;
    bool _516 = isnan(_500);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    int _522 = ~_258;
    int _524 = _522 + _508;
    int _526 = _524 + 1;
    bool _528 = _177 == 0;
    float _530 = floor(_464);
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_498)
    {
        _532 = 1.0;
    }
    float _534 = _532;
    float _536 = _534;
    if (!_498)
    {
        _536 = 7.345489978790283203125;
    }
    float _538 = _536;
    int _540 = abs(_360);
    bool _542 = !_478;
    int _544 = _542 ? 0 : 1;
    float _546 = _538 * _131;
    float _548 = trunc(_520);
    int _550 = int(_548);
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _554 = _552 != 0;
    float _556 = floor(_546);
    float _558 = (*spvDescriptorSet0.vp_c10)._m0[8].w * 0.00999999977648258209228515625;
    float _560 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[193].z, _558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _562;
    float _566 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].w;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _572 = -_556;
    float _574 = _546 + _572;
    float _576 = _145 * _504;
    int _578 = _177 + (-1);
    float _580 = _574 * _500;
    int _582 = _177 * _526;
    int _584 = _582 + _201;
    float _586 = _500 * _576;
    int _588 = ~_550;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    float _594 = trunc(_580);
    int _596 = int(_594);
    bool _598 = !_528;
    int _600 = _598 ? _584 : (-1);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _602;
    float _606 = trunc(_586);
    int _608 = int(_606);
    int _610 = _600 * _592;
    int _612 = abs(_544);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[181].z;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[182].z + _614;
    bool _618 = !_554;
    int _620 = _618 ? 0 : 1;
    int _622 = _550 * _578;
    int _624 = _622 + _610;
    int _626 = abs(_494);
    bool _628 = !_486;
    int _630 = _628 ? 0 : 1;
    int _632 = _624 * _626;
    int _634 = abs(_630);
    int _636 = abs(_620);
    int _638 = _596 * _540;
    int _640 = _638 + _201;
    int _642 = _608 * _612;
    int _644 = _642 + _632;
    int _646 = ~_177;
    int _648 = _646 + 1;
    int _650 = ~_177;
    int _652 = _650 + 1;
    int _654 = _640 * _634;
    int _656 = _654 + _644;
    bool _658 = _177 == 0;
    int _660 = ~_432;
    int _662 = _660 + 1;
    int _664 = _596 * _636;
    int _666 = _664 + _656;
    float _668 = float(uint(_666));
    float _670 = as_type<float>(_203) * _668;
    float _672 = trunc(_670);
    float _674 = precise::max(_672, 0.0);
    uint _676 = uint(_674);
    int _678 = _648 * int(_676);
    int _680 = _678 + _666;
    float _682 = float(uint(_680));
    float _684 = as_type<float>(_203) * _682;
    float _686 = trunc(_684);
    float _688 = precise::max(_686, 0.0);
    uint _690 = uint(_688);
    int _692 = int(_676) + int(_690);
    int _694 = _652 * _692;
    int _696 = _694 + _666;
    float _698 = float(uint(_432));
    bool _700 = uint(_696) >= uint(_177);
    bool _702 = !_700;
    int _704 = _702 ? 0 : (-1);
    int _706 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _708 = _706 != 0;
    int _710 = ~_692;
    int _712 = _710 + _704;
    int _714 = _712 + 1;
    bool _716 = !_708;
    int _718 = _716 ? 0 : 1;
    int _720 = _177 * _714;
    int _722 = _720 + _666;
    bool _724 = !_658;
    int _726 = _724 ? _722 : (-1);
    int _728 = _726 & 3;
    bool _730 = _728 != 0;
    int _732 = _726 & 3;
    bool _734 = _732 != 0;
    int _736 = _730 ? 0 : 1;
    bool _738 = uint(_732) >= 2u;
    int _740 = ~_736;
    int _742 = _740 + 1;
    int _744 = _742 + 1;
    int _746 = _738 ? 0 : 1;
    bool _748 = uint(_732) > 1u;
    int _750 = ~_746;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    bool _756 = !_734;
    int _758 = _756 ? 0 : 1;
    int _760 = _744;
    int _762 = _754;
    if (!_748)
    {
        int _764 = ~_736;
        int _766 = _764 + 1;
        _760 = _766;
    }
    int _768 = _760;
    float _770 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _772 = int(_770);
    bool _774 = _732 != 3;
    int _776 = abs(_768);
    if (_774)
    {
        int _778 = ~_746;
        int _780 = _778 + 1;
        _762 = _780;
    }
    int _782 = _762;
    float _784 = float(_772);
    float _786 = 1.0 / _698;
    int _788 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _790 = _788 != 0;
    bool _792 = !_790;
    int _794 = _792 ? 0 : 1;
    bool _796 = _438 > 0.5;
    float _798 = 1.0 / _784;
    float _800 = -_272;
    int _802 = _796 ? as_type<int>(_800) : as_type<int>(_272);
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _806 = _804 != 0;
    int _808 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _810 = _808 != 0;
    bool _812 = !_442;
    float _814 = _812 ? _272 : as_type<float>(_802);
    int _816 = as_type<int>(_786) + (-2);
    bool _818 = !_806;
    int _820 = _818 ? 0 : 1;
    bool _822 = !_810;
    int _824 = _822 ? 0 : 1;
    int _826 = abs(_820);
    float _828 = _145 * _798;
    int _830 = abs(_824);
    float _832 = trunc(_828);
    int _834 = int(_832);
    float _836 = float(_830);
    int _838 = ~_432;
    int _840 = _838 + 1;
    float _842 = float(uint(_834));
    float _844 = as_type<float>(_816) * _842;
    float _846 = trunc(_844);
    float _848 = precise::max(_846, 0.0);
    uint _850 = uint(_848);
    int _852 = _662 * int(_850);
    int _854 = _852 + _834;
    int _856 = ~_177;
    int _858 = _856 + 1;
    float _860 = float(uint(_854));
    float _862 = as_type<float>(_816) * _860;
    float _864 = trunc(_862);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    int _870 = ~_177;
    int _872 = _870 + 1;
    int _874 = int(_850) + int(_868);
    int _876 = _840 * _874;
    int _878 = _876 + _834;
    bool _880 = uint(_878) >= uint(_432);
    float _882 = float(uint(_640));
    bool _884 = !_880;
    int _886 = _884 ? 0 : (-1);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _890 = _888 != 0;
    float _892 = as_type<float>(_203) * _882;
    int _894 = ~_874;
    int _896 = _894 + _886;
    int _898 = _896 + 1;
    bool _900 = !_890;
    int _902 = _900 ? 0 : 1;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _910 = _908 != 0;
    int _912 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _914 = _912 != 0;
    int _916 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _918 = _916 != 0;
    float _920 = trunc(_892);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    int _926 = _432 * _898;
    int _928 = _926 + _834;
    int _930 = abs(_902);
    bool _932 = !_906;
    int _934 = _932 ? 0 : 1;
    bool _936 = !_910;
    int _938 = _936 ? 0 : 1;
    bool _940 = !_914;
    int _942 = _940 ? 0 : 1;
    int _944 = abs(_938);
    int _946 = _858 * int(_924);
    int _948 = _946 + _640;
    float _950 = float(uint(_948));
    float _952 = as_type<float>(_203) * _950;
    float _954 = trunc(_952);
    float _956 = precise::max(_954, 0.0);
    uint _958 = uint(_956);
    float _960 = float(_432);
    float _962 = _960 * _576;
    int _964 = int(_924) + int(_958);
    float _966 = as_type<float>(_924);
    float _968 = as_type<float>(_964);
    float _970 = _814;
    if (_498)
    {
        _966 = 1.0;
    }
    float _972 = _966;
    float _974 = trunc(_962);
    int _976 = int(_974);
    float _978 = _972;
    if (!_498)
    {
        _978 = 1.2345600128173828125;
    }
    float _980 = _978;
    int _982 = _872 * _964;
    int _984 = _982 + _640;
    float _986 = float(_834);
    bool _988 = uint(_984) >= uint(_177);
    float _990 = as_type<float>(_984);
    if (_498)
    {
        _990 = _131;
    }
    float _992 = _990;
    float _994 = _992;
    if (!_498)
    {
        _994 = _169;
    }
    float _996 = _994;
    bool _998 = _986 >= _960;
    bool _1000 = isnan(_986);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan(_960);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    bool _1010 = !_988;
    int _1012 = _1010 ? 0 : (-1);
    float _1014 = _980 * _996;
    bool _1016 = _432 == 0;
    float _1018 = trunc(_1008);
    int _1020 = int(_1018);
    int _1022 = ~_964;
    int _1024 = _1022 + _1012;
    int _1026 = _1024 + 1;
    float _1028 = floor(_1014);
    int _1030 = ~_1020;
    int _1032 = _1030 + 1;
    int _1034 = _1032 + 1;
    float _1036 = -_1028;
    float _1038 = _1014 + _1036;
    int _1040 = _432 + (-1);
    float _1042 = _1038 * _960;
    bool _1044 = !_1016;
    int _1046 = _1044 ? _928 : (-1);
    bool _1048 = !_918;
    int _1050 = _1048 ? 0 : 1;
    float _1052 = trunc(_1042);
    int _1054 = int(_1052);
    int _1056 = _1046 * _1034;
    bool _1058 = _490 >= 0.0;
    bool _1060 = isnan(_490);
    bool _1062 = _1058 || _1060;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    int _1068 = _1020 * _1040;
    int _1070 = _1068 + _1056;
    int _1072 = abs(_934);
    float _1074 = -_452;
    float _1076 = fma(_1074, (*spvDescriptorSet0.vp_c9)._m0[191].x, (*spvDescriptorSet0.vp_c9)._m0[191].x);
    int _1078 = _1070 * _944;
    int _1080 = abs(_942);
    float _1082 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _1084 = _1076 * (*spvDescriptorSet0.vp_c9)._m0[192].x;
    int _1086 = abs(_1050);
    int _1088 = _1054 * _930;
    int _1090 = _1088 + _834;
    int _1092 = _976 * _1072;
    int _1094 = _1092 + _1078;
    int _1096 = ~_432;
    int _1098 = _1096 + 1;
    int _1100 = _1090 * _1080;
    int _1102 = _1100 + _1094;
    int _1104 = _1054 * _1086;
    int _1106 = _1104 + _1102;
    int _1108 = ~_432;
    int _1110 = _1108 + 1;
    float _1112 = 1.0 / _1084;
    float _1114 = float(uint(_1106));
    float _1116 = as_type<float>(_816) * _1114;
    float _1118 = trunc(_1116);
    float _1120 = precise::max(_1118, 0.0);
    uint _1122 = uint(_1120);
    int _1124 = _1110 * int(_1122);
    int _1126 = _1124 + _1106;
    float _1128 = float(uint(_1126));
    float _1130 = as_type<float>(_816) * _1128;
    float _1132 = trunc(_1130);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = ~_432;
    int _1140 = _1138 + 1;
    int _1142 = int(_1122) + int(_1136);
    float _1144 = float(uint(_1090));
    int _1146 = _1098 * _1142;
    int _1148 = _1146 + _1106;
    float _1150 = as_type<float>(_816) * _1144;
    int _1152 = as_type<int>(_1144);
    float _1154 = as_type<float>(_1080);
    float _1156 = as_type<float>(_1072);
    float _1158 = _1112;
    float _1160 = _1084;
    if (_498)
    {
        _1152 = 0;
    }
    int _1162 = _1152;
    bool _1164 = uint(_1148) >= uint(_432);
    float _1166 = trunc(_1150);
    float _1168 = precise::max(_1166, 0.0);
    uint _1170 = uint(_1168);
    int _1172 = _1162;
    if (!_498)
    {
        _1172 = 1;
    }
    int _1174 = _1172;
    bool _1176 = !_1164;
    int _1178 = _1176 ? 0 : (-1);
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1182 = _1180 != 0;
    int _1184 = ~_1142;
    int _1186 = _1184 + _1178;
    int _1188 = _1186 + 1;
    bool _1190 = !_1182;
    int _1192 = _1190 ? 0 : 1;
    float _1194 = in.m_58.w;
    int _1196 = _1178;
    if (_498)
    {
        _1196 = 0;
    }
    int _1198 = _1196;
    int _1200 = _432 * _1188;
    int _1202 = _1200 + _1106;
    int _1204 = _1198;
    if (!_498)
    {
        _1204 = 2;
    }
    int _1206 = _1204;
    int _1208 = _177 * _1026;
    int _1210 = _1208 + _640;
    int _1212 = _1140 * int(_1170);
    int _1214 = _1212 + _1090;
    bool _1216 = !_1016;
    int _1218 = _1216 ? _1202 : (-1);
    bool _1220 = !_658;
    int _1222 = _1220 ? _1210 : (-1);
    int _1224 = _1218 & 3;
    bool _1226 = _1224 != 0;
    int _1228 = _1218 & 3;
    bool _1230 = _1228 != 0;
    float _1232 = float(uint(_1214));
    int _1234 = _1226 ? 0 : 1;
    bool _1236 = uint(_1228) > 1u;
    float _1238 = as_type<float>(_816) * _1232;
    int _1240 = ~_1234;
    int _1242 = _1240 + 1;
    int _1244 = _1242 + 1;
    int _1246 = ~_432;
    int _1248 = _1246 + 1;
    float _1250 = trunc(_1238);
    float _1252 = precise::max(_1250, 0.0);
    uint _1254 = uint(_1252);
    int _1256 = _1244;
    if (!_1236)
    {
        int _1258 = ~_1234;
        int _1260 = _1258 + 1;
        _1256 = _1260;
    }
    int _1262 = _1256;
    bool _1264 = uint(_1228) >= 2u;
    int _1266 = _1264 ? 0 : 1;
    bool _1268 = _1228 != 3;
    int _1270 = int(_1170) + int(_1254);
    int _1272 = ~_1266;
    int _1274 = _1272 + 1;
    int _1276 = _1274 + 1;
    int _1278 = _1248 * _1270;
    int _1280 = _1278 + _1090;
    int _1282 = _1276;
    if (_1268)
    {
        int _1284 = ~_1266;
        int _1286 = _1284 + 1;
        _1282 = _1286;
    }
    int _1288 = _1282;
    bool _1290 = uint(_1280) >= uint(_432);
    bool _1292 = !_1290;
    int _1294 = _1292 ? 0 : (-1);
    bool _1296 = _1174 != 1;
    float _1298 = in.m_49.x;
    float _1300 = in.m_49.y;
    float _1302 = in.m_49.z;
    if (!_1296)
    {
        _1154 = _169;
    }
    float _1304 = _1154;
    float _1306 = 0.0;
    float _1308 = _1304;
    if (!_1296)
    {
        _1306 = _173;
    }
    float _1310 = _1306;
    float _1312 = 0.0;
    float _1314 = _1310;
    if (!_1296)
    {
        _1312 = _1304;
    }
    float _1316 = _1312;
    float _1318 = _1316;
    if (!_1296)
    {
        _1156 = _173;
    }
    float _1320 = _1156;
    float _1322 = _1320;
    if (_1296)
    {
        _1318 = _131;
    }
    float _1324 = _1318;
    if (_1296)
    {
        _1308 = _131;
    }
    float _1326 = _1308;
    if (_1296)
    {
        _1314 = _169;
    }
    float _1328 = _1314;
    float _1330 = fma(_338, _1302, _1082);
    if (_1296)
    {
        _1322 = _169;
    }
    float _1332 = _1322;
    bool _1334 = _1206 != 2;
    float _1336 = in.m_44.x;
    float _1338 = in.m_44.y;
    float _1340 = in.m_44.z;
    float _1342 = 0.0;
    if (_1334)
    {
        _1342 = _131;
    }
    float _1344 = _1342;
    float _1346 = _1344;
    if (_1334)
    {
        _968 = _169;
    }
    float _1348 = _968;
    float _1350 = _1348;
    if (!_1334)
    {
        _1346 = _173;
    }
    float _1352 = _1346;
    if (!_1334)
    {
        _1350 = _131;
    }
    float _1354 = _1350;
    bool _1356 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1358 = fma(_1330, _1194, _1340);
    float _1360 = -_1358;
    float _1362 = precise::max(0.0, _1360);
    float _1364 = _1082;
    if (_1356)
    {
        float _1366 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        _1364 = _1366;
    }
    float _1368 = _1364;
    float _1370 = precise::min(_1084, _1362);
    float _1372 = _1370 * _1112;
    if (_1356)
    {
        float _1374 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        _1158 = _1374;
    }
    float _1376 = _1158;
    float _1378 = _1376;
    if (_1356)
    {
        float _1380 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[14].x, _1372);
        _1378 = _1380;
    }
    float _1382 = _1378;
    float _1384 = 0.0;
    float _1386 = _1382;
    if (!_1356)
    {
        _1384 = _1372;
    }
    float _1388 = _1384;
    out.m_60.x = _1372;
    float _1390 = _1388;
    if (_1356)
    {
        float _1392 = _1382 * _1368;
        _1386 = _1392;
    }
    float _1394 = _1386;
    float _1396 = floor(_458);
    float _1398 = _1370;
    if (_1356)
    {
        float _1400 = floor(_1394);
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = _458 + (-1.0);
    if (_1356)
    {
        float _1406 = -_1402;
        float _1408 = _1394 + _1406;
        _1390 = _1408;
    }
    float _1410 = _1390;
    bool _1412 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    bool _1414 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1416 = isnan(_1410);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = _1402;
    if (_1412)
    {
        float _1428 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1426 = _1428;
    }
    float _1430 = _1426;
    if (_1412)
    {
        float _1432 = _131 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1160 = _1432;
    }
    float _1434 = _1160;
    float _1436 = 0.0;
    float _1438 = _1434;
    if (!_1412)
    {
        _1436 = _1372;
    }
    float _1440 = _1436;
    float _1442 = _1440;
    if (_1412)
    {
        float _1444 = fma(_1434, (*spvDescriptorSet0.vp_c9)._m0[14].z, _1372);
        _1438 = _1444;
    }
    float _1446 = _1438;
    float _1448 = _1446;
    if (_1412)
    {
        float _1450 = _1446 * _1430;
        _1448 = _1450;
    }
    float _1452 = _1448;
    float _1454 = _1430;
    if (_1412)
    {
        float _1456 = floor(_1452);
        _1454 = _1456;
    }
    float _1458 = _1454;
    if (_1412)
    {
        float _1460 = -_1458;
        float _1462 = _1452 + _1460;
        _1442 = _1462;
    }
    float _1464 = _1442;
    bool _1466 = _1396 >= 0.0;
    bool _1468 = isnan(_1396);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    float _1476 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1478 = log2(_1476);
    int _1480 = _1066 ? 0 : 1;
    int _1482 = _1474 ? 0 : 1;
    bool _1484 = _1396 > 0.0;
    int _1486 = ~_1482;
    int _1488 = _1486 + 1;
    int _1490 = _1488 + 1;
    bool _1492 = _1228 != 3;
    float _1494 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _1496 = ~_1480;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    bool _1502 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1504 = isnan(_1464);
    bool _1506 = _1502 || _1504;
    bool _1508 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1510 = _1506 || _1508;
    float _1512 = float(_1510);
    float _1514 = _1494 * _470;
    float _1516 = _145 * _1478;
    float _1518 = _145 + (*spvDescriptorSet0.vp_c9)._m0[20].w;
    int _1520 = _1490;
    int _1522 = _1500;
    if (!_1484)
    {
        int _1524 = ~_1482;
        int _1526 = _1524 + 1;
        _1520 = _1526;
    }
    int _1528 = _1520;
    float _1530 = -_1512;
    float _1532 = _1530 + 1.0;
    bool _1534 = _490 > 0.0;
    float _1536 = _1518 * _566;
    bool _1538 = !_1230;
    int _1540 = _1538 ? 0 : 1;
    float _1542 = exp2(_1516);
    bool _1544 = _732 != 3;
    bool _1546 = !_1544;
    int _1548 = _1546 ? 0 : (-1);
    int _1550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1552 = _1550 != 0;
    int _1554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1556 = _1554 != 0;
    int _1558 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1560 = _1558 != 0;
    float _1562 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1564 = _1562 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1566 = _530 > 0.0;
    if (!_1534)
    {
        int _1568 = ~_1480;
        int _1570 = _1568 + 1;
        _1522 = _1570;
    }
    int _1572 = _1522;
    float _1574 = 1.0 / _1564;
    bool _1576 = _530 >= 0.0;
    bool _1578 = isnan(_530);
    bool _1580 = _1576 || _1578;
    bool _1582 = isnan(0.0);
    bool _1584 = _1580 || _1582;
    bool _1586 = !_1492;
    int _1588 = _1586 ? 0 : (-1);
    float _1590 = -_1542;
    float _1592 = _1590 + 1.0;
    int _1594 = _1584 ? 0 : 1;
    int _1596 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1598 = _1596 != 0;
    int _1600 = ~_1594;
    int _1602 = _1600 + 1;
    int _1604 = _1602 + 1;
    int _1606 = _1604;
    if (!_1566)
    {
        int _1608 = ~_1594;
        int _1610 = _1608 + 1;
        _1606 = _1610;
    }
    int _1612 = _1606;
    float _1614 = _169 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1616 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1618 = isnan(0.0);
    bool _1620 = _1616 || _1618;
    bool _1622 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1624 = _1620 || _1622;
    float _1626 = _570 * _1574;
    int _1628 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1630 = _1628 != 0;
    float _1632 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].x, _1514);
    float _1634 = _131 + _169;
    float _1636 = _1624 ? _1592 : 0.0;
    int _1638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1640 = _1638 != 0;
    float _1642 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1646 = _1634 + (-1.0);
    float _1648 = -_1644;
    float _1650 = fma(_1642, 2.0, _1648);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1656 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1658 = _1656 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1662 = 1.0 / _1658;
    float _1664 = fma(_1614, -2.0, _1660);
    float _1666 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _1668 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1670 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1672 = 1.0 / _1654;
    float _1674 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1676 = _1674 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1678 = -_1666;
    float _1680 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1678);
    float _1682 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1684 = _1682 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1686 = -_1668;
    float _1688 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _1686);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1692 = _1690 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1694 = -_1670;
    float _1696 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1694);
    float _1698 = 1.0 / _1684;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1702 = _1700 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1704 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1706 = _564 * _1662;
    float _1708 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1710 = -_1704;
    float _1712 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _1710);
    float _1714 = 1.0 / _1692;
    float _1716 = _1688 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1718 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1720 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _1722 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[194].x * 0.01745329238474369049072265625;
    float _1726 = -_1718;
    float _1728 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1726);
    float _1730 = 1.0 / _1676;
    float _1732 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1734 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _1736 = _1724 * 0.15915493667125701904296875;
    float _1738 = -_1722;
    float _1740 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1738);
    float _1742 = -_1732;
    float _1744 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1742);
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1746;
    float _1750 = -_1734;
    float _1752 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1750);
    float _1754 = 1.0 / _1702;
    float _1756 = _1748 * _1672;
    float _1758 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1760 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1758;
    float _1762 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1764 = _1762 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1766 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1768 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1766;
    float _1770 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1772 = _1770 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    bool _1774 = !_1552;
    int _1776 = _1774 ? 0 : 1;
    float _1778 = _1764 * _1698;
    float _1780 = _1768 * _1730;
    float _1782 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[20].y, _1536);
    float _1784 = _131 + _173;
    float _1786 = _173 + _169;
    float _1788 = floor(_1782);
    float _1790 = _1784 + (-1.0);
    float _1792 = _1786 + (-1.0);
    float _1794 = fma(_1646, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1796 = _1760 * _1754;
    float _1798 = fma(_1790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1800 = fma(_1792, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1802 = -(*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1804 = 1.0 + _1802;
    float _1806 = _1696 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1808 = -_1708;
    float _1810 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].y, _1808);
    float _1812 = _1736 * 6.283185482025146484375;
    float _1814 = cos(_1812);
    float _1816 = -_1716;
    float _1818 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[1].y, _1816);
    float _1820 = -_1720;
    float _1822 = fma(_1680, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1820);
    float _1824 = -(*spvDescriptorSet0.vp_c9)._m0[191].w;
    float _1826 = 1.0 + _1824;
    float _1828 = _1804 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1830 = -_1806;
    float _1832 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1830);
    float _1834 = -_1788;
    float _1836 = _1782 + _1834;
    float _1838 = _1782 * 6.283185482025146484375;
    float _1840 = floor(_1632);
    float _1842 = _1828 * _1826;
    float _1844 = _1772 * _1714;
    float _1846 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1818);
    float _1848 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1850 = 1.0 + _1848;
    float _1852 = -_1842;
    float _1854 = _1828 + _1852;
    float _1856 = _1838 * 0.15915493667125701904296875;
    float _1858 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1832);
    float _1860 = _1736 * 6.283185482025146484375;
    float _1862 = sin(_1860);
    float _1864 = fma(_1854, _169, _1842);
    float _1866 = _1814 * _1814;
    float _1868 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1870 = fma(_438, 2.0, -1.0);
    bool _1872 = !_1556;
    int _1874 = _1872 ? 0 : 1;
    float _1876 = -_1868;
    float _1878 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1880 = -_1840;
    float _1882 = _1632 + _1880;
    float _1884 = _1632 * 6.283185482025146484375;
    float _1886 = 1.0 / _1850;
    float _1888 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1810);
    float _1890 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[1].w, _1728);
    float _1892 = _1884 * 0.15915493667125701904296875;
    float _1894 = fma(_1752, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1822);
    float _1896 = fma(_1862, _1862, _1866);
    float _1898 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1878);
    float _1900 = _1856 * 6.283185482025146484375;
    float _1902 = cos(_1900);
    float _1904 = fma(_1712, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1740);
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    bool _1908 = _1836 < 0.5;
    float _1910 = float(_1908);
    float _1912 = _1890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1914 = -_1882;
    float _1916 = fma(_1914, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1918 = -_1836;
    float _1920 = fma(_1918, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1922 = rsqrt(_1896);
    float _1924 = _1636 * _1886;
    bool _1926 = _1882 < 0.5;
    float _1928 = float(_1926);
    float _1930 = -_1912;
    float _1932 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1930);
    float _1934 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1664);
    bool _1936 = !_1560;
    int _1938 = _1936 ? 0 : 1;
    float _1940 = -_1928;
    float _1942 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1944 = _1892 * 6.283185482025146484375;
    float _1946 = cos(_1944);
    float _1948 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1950 = fma(_1902, 0.5, 0.5);
    float _1952 = -_1910;
    float _1954 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    float _1956 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _1958 = -_1906;
    float _1960 = fma(_1948, 2.0, _1958);
    float _1962 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1932);
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1966 = _1862 * _1922;
    float _1968 = _314 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _1970 = fma(_338, _1300, _1956);
    float _1972 = _1814 * _1922;
    float _1974 = fma(_338, _1298, _1968);
    float _1976 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1978 = fma(_1946, 0.5, 0.5);
    float _1980 = -_1898;
    float _1982 = fma(_1980, (*spvDescriptorSet0.vp_c8)._m0[0].w, _1962);
    float _1984 = _1328 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1986 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1988 = -_1978;
    float _1990 = fma(_1988, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1992 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1994 = -_1986;
    float _1996 = fma(_1976, 2.0, _1994);
    float _1998 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2002 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1964);
    float _2004 = fma(_1970, _1194, _1338);
    float _2006 = fma(_1984, -2.0, _1992);
    float _2008 = fma(_1974, _1194, _1336);
    float _2010 = fma(_1998, -2.0, _2000);
    float _2012 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _2014 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2016 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2018 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2020 = _2004 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2022 = fma(_1326, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2014);
    float _2024 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2032 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2036 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2016);
    float _2038 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2018);
    float _2040 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _2042 = fma(_2008, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2020);
    float _2044 = _2024 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = _2028 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2032 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2036);
    float _2058 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2038);
    float _2060 = fma(_1358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2042);
    out.m_62.x = _2044;
    out.m_62.y = _2046;
    out.m_62.z = _2048;
    float _2062 = -_145;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1960);
    float _2066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2010);
    out.m_64.x = _2050;
    out.m_64.y = _2052;
    out.m_64.z = _2054;
    float _2068 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _2070 = -_1950;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[19].y, 1.0);
    int _2074 = abs(_1874);
    float _2076 = _2058 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _2078 = _173 > 0.5;
    float _2080 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2006);
    float _2082 = float(_2074);
    float _2084 = _2012 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2088 = _2040 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2090 = _468 + 0.5;
    float _2092 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2094 = _474 + (-0.5);
    float _2096 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2086);
    float _2098 = fma(_2084, _2090, _2064);
    float _2100 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2092);
    float _2102 = -_2088;
    float _2104 = -_2066;
    float _2106 = fma(_2102, _2094, _2104);
    float _2108 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2096);
    float _2110 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _2112 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2100);
    float _2114 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _2116 = _402 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _2118 = -_2108;
    float _2120 = _2118 + 1.0;
    float _2122 = -_2112;
    float _2124 = _2122 + 1.0;
    float _2126 = fma(_426, _1300, _2114);
    float _2128 = fma(_426, _1298, _2110);
    float _2130 = fma(_426, _1302, _2116);
    float _2132 = -_2120;
    float _2134 = fma(_468, _2132, _2098);
    float _2136 = -_2126;
    float _2138 = _1970 + _2136;
    float _2140 = fma(_474, _2124, _2106);
    float _2142 = -_2128;
    float _2144 = _1974 + _2142;
    int _2146 = abs(_718);
    float _2148 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2150 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2152 = _2138 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2154 = float(_826);
    float _2156 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2148);
    float _2158 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2150);
    float _2160 = fma(_2144, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2152);
    out.m_66.x = _2134;
    out.m_66.y = _2140;
    float _2162 = abs(_1916);
    float _2164 = _2154 * _2162;
    float _2166 = abs(_1920);
    float _2168 = _2154 * _2166;
    float _2170 = _1076 * _1372;
    float _2172 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2172;
    float _2176 = fma(_2170, (*spvDescriptorSet0.vp_c9)._m0[193].y, _560);
    float _2178 = precise::max(0.0, _2170);
    float _2180 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2182 = (*spvDescriptorSet0.vp_c9)._m0[178].w + _2180;
    float _2184 = float(_2146);
    float _2186 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2188 = (*spvDescriptorSet0.vp_c9)._m0[176].w + _2186;
    float _2190 = precise::min(_2178, (*spvDescriptorSet0.vp_c9)._m0[192].z);
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2194 = _2192 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2196 = fma(_2184, _1990, _2164);
    float _2198 = fma(_2184, _2072, _2168);
    float _2200 = _2190 * _2068;
    float _2202 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2204 = _1410 + _2202;
    float _2206 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2208 = (*spvDescriptorSet0.vp_c9)._m0[180].w + _2206;
    float _2210 = 1.0 / _2182;
    float _2212 = abs(_1942);
    float _2214 = fma(_836, _2212, _2196);
    float _2216 = fma(_1706, _2204, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2218 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2220 = _1410 + _2218;
    float _2222 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2224 = _2222 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2226 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2228 = _1410 + _2226;
    float _2230 = _2176 * 0.15915493667125701904296875;
    float _2232 = fma(_1778, _2220, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2234 = 1.0 / _2208;
    float _2236 = fma(_1844, _2228, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2238 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2240 = _1410 + _2238;
    float _2242 = abs(_1954);
    float _2244 = fma(_836, _2242, _2198);
    float _2246 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2248 = _2246 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2250 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2252 = _1410 + _2250;
    float _2254 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2256 = _1410 + _2254;
    float _2258 = fma(_1780, _2240, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2260 = 1.0 / _2188;
    float _2262 = fma(_1626, _2252, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2264 = fma(_1796, _2256, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2266 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2268 = _1464 + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2272 = _1464 + _2270;
    float _2274 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2276 = (*spvDescriptorSet0.vp_c9)._m0[182].w + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2280 = _1410 + _2278;
    float _2282 = 1.0 / _2194;
    float _2284 = _2268 * _2234;
    float _2286 = fma(_1756, _2280, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2288 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2290 = _1464 + _2288;
    float _2292 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2294 = _2292 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2296 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2296;
    float _2300 = _2230 * 6.283185482025146484375;
    float _2302 = sin(_2300);
    float _2304 = _2272 * _2260;
    float _2306 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2308 = _1464 + _2306;
    float _2310 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2312 = _2310 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    bool _2314 = _169 > 0.5;
    float _2316 = fma(_2174, _2304, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2318 = _2308 * _2210;
    float _2320 = -_1864;
    float _2322 = _1966 * _2320;
    float _2324 = 1.0 / _2224;
    float _2326 = fma(_2298, _2318, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2328 = -_1864;
    float _2330 = _1972 * _2328;
    float _2332 = -(*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2334 = (*spvDescriptorSet0.vp_c9)._m0[178].z + _2332;
    float _2336 = -(*spvDescriptorSet0.vp_c9)._m0[178].z;
    float _2338 = _2336 + (*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2340 = 1.0 / _2248;
    float _2342 = _2302 * (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _2344 = fma(_2334, _2318, (*spvDescriptorSet0.vp_c9)._m0[177].z);
    float _2346 = -_2342;
    float _2348 = _1972 * _2346;
    float _2350 = _1966 * _2342;
    bool _2352 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2354 = isnan(_1410);
    bool _2356 = _2352 || _2354;
    bool _2358 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2360 = _2356 || _2358;
    float _2362 = float(_2360);
    float _2364 = 1.0 / _2276;
    float _2366 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2368 = _1464 + _2366;
    float _2370 = fma(_1076, _2322, _2348);
    float _2372 = -(*spvDescriptorSet0.vp_c9)._m0[175].z;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[176].z + _2372;
    float _2376 = fma(_1076, _2330, _2350);
    float _2378 = _2368 * _2282;
    float _2380 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2382 = _1464 + _2380;
    float _2384 = fma(_2374, _2304, (*spvDescriptorSet0.vp_c9)._m0[175].z);
    float _2386 = _2290 * _2340;
    float _2388 = _2382 * _2324;
    float _2390 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2392 = _1464 + _2390;
    float _2394 = -(*spvDescriptorSet0.vp_c9)._m0[179].z;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[180].z + _2394;
    float _2398 = -(*spvDescriptorSet0.vp_c9)._m0[176].z;
    float _2400 = _2398 + (*spvDescriptorSet0.vp_c9)._m0[177].z;
    float _2402 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2402;
    bool _2406 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2408 = isnan(_1410);
    bool _2410 = _2406 || _2408;
    bool _2412 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2414 = _2410 || _2412;
    float _2416 = float(_2414);
    float _2418 = _2392 * _2364;
    bool _2420 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2422 = isnan(_1410);
    bool _2424 = _2420 || _2422;
    bool _2426 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2428 = _2424 || _2426;
    float _2430 = float(_2428);
    float _2432 = fma(_2404, _2284, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2434 = fma(_2396, _2284, (*spvDescriptorSet0.vp_c9)._m0[179].z);
    float _2436 = -_2362;
    float _2438 = _2436 + 1.0;
    float _2440 = fma(_2294, _2378, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2442 = -_2430;
    float _2444 = _2442 + 1.0;
    float _2446 = fma(_2400, _2378, (*spvDescriptorSet0.vp_c9)._m0[176].z);
    float _2448 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2450 = _2448 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2452 = fma(_2312, _2388, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2454 = _2362 * _2444;
    bool _2456 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2458 = isnan(_1410);
    bool _2460 = _2456 || _2458;
    bool _2462 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2464 = _2460 || _2462;
    float _2466 = float(_2464);
    float _2468 = fma(_2338, _2388, (*spvDescriptorSet0.vp_c9)._m0[178].z);
    float _2470 = -_2416;
    float _2472 = _2470 + 1.0;
    float _2474 = -(*spvDescriptorSet0.vp_c9)._m0[180].z;
    float _2476 = _2474 + (*spvDescriptorSet0.vp_c9)._m0[181].z;
    bool _2478 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2480 = isnan(_1410);
    bool _2482 = _2478 || _2480;
    bool _2484 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2486 = _2482 || _2484;
    float _2488 = float(_2486);
    float _2490 = _2416 * _2438;
    float _2492 = fma(_2450, _2386, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _2494 = _2466 * _2472;
    float _2496 = -_2466;
    float _2498 = _2496 + 1.0;
    float _2500 = fma(_2476, _2386, (*spvDescriptorSet0.vp_c9)._m0[180].z);
    bool _2502 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2504 = isnan(_1410);
    bool _2506 = _2502 || _2504;
    bool _2508 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2510 = _2506 || _2508;
    float _2512 = float(_2510);
    float _2514 = -_2488;
    float _2516 = _2514 + 1.0;
    float _2518 = _2488 * _2498;
    bool _2520 = _1410 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2522 = isnan(_1410);
    bool _2524 = _2520 || _2522;
    bool _2526 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2528 = _2524 || _2526;
    float _2530 = float(_2528);
    float _2532 = abs(_2200);
    float _2534 = log2(_2532);
    float _2536 = _2512 * _2516;
    float _2538 = -_2512;
    float _2540 = _2538 + 1.0;
    bool _2542 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2544 = isnan(_1464);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2550 = _2546 || _2548;
    float _2552 = float(_2550);
    float _2554 = -_2530;
    float _2556 = _2554 + 1.0;
    float _2558 = _1372 * _2376;
    float _2560 = _2530 * _2540;
    float _2562 = fma(_604, _2418, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2564 = -_2552;
    float _2566 = _2564 + 1.0;
    bool _2568 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2570 = isnan(_1464);
    bool _2572 = _2568 || _2570;
    bool _2574 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2576 = _2572 || _2574;
    float _2578 = float(_2576);
    float _2580 = _1424 * _2556;
    float _2582 = fma(_616, _2418, (*spvDescriptorSet0.vp_c9)._m0[181].z);
    float _2584 = _1512 * _2566;
    bool _2586 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2588 = isnan(_1464);
    bool _2590 = _2586 || _2588;
    bool _2592 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2594 = _2590 || _2592;
    float _2596 = float(_2594);
    float _2598 = _2216 * _2580;
    int _2600 = ~_1270;
    int _2602 = _2600 + _1294;
    int _2604 = _2602 + 1;
    float _2606 = _2578 * _1532;
    float _2608 = -_2578;
    float _2610 = _2608 + 1.0;
    bool _2612 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2614 = isnan(_1464);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = -_2596;
    float _2626 = _2624 + 1.0;
    float _2628 = float(_1572);
    float _2630 = _2596 * _2610;
    bool _2632 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2634 = isnan(_1464);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = -_2622;
    float _2646 = _2644 + 1.0;
    float _2648 = float(_1528);
    float _2650 = _2622 * _2626;
    float _2652 = float(_1612);
    float _2654 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[192].w;
    bool _2656 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2658 = isnan(_1464);
    bool _2660 = _2656 || _2658;
    bool _2662 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2664 = _2660 || _2662;
    float _2666 = float(_2664);
    int _2668 = _432 * _2604;
    int _2670 = _2668 + _1090;
    bool _2672 = _1464 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2674 = isnan(_1464);
    bool _2676 = _2672 || _2674;
    bool _2678 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2680 = _2676 || _2678;
    float _2682 = float(_2680);
    float _2684 = _2642 * _2646;
    float _2686 = -_2642;
    float _2688 = _2686 + 1.0;
    int _2690 = abs(_1776);
    float _2692 = -_2666;
    float _2694 = _2692 + 1.0;
    int _2696 = abs(_1938);
    float _2698 = _2666 * _2688;
    float _2700 = exp2(_2654);
    float _2702 = _2682 * _2694;
    float _2704 = _1372 * _2370;
    float _2706 = float(_2690);
    float _2708 = -_2682;
    float _2710 = _2708 + 1.0;
    float _2712 = _2316 * _2702;
    float _2714 = _2384 * _2702;
    float _2716 = _2082 * _2628;
    float _2718 = -_1424;
    float _2720 = _2718 + 1.0;
    float _2722 = in.m_68.x;
    float _2724 = in.m_68.y;
    float _2726 = in.m_68.z;
    float _2728 = _2706 * _2648;
    float _2730 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[175].z, _2714);
    float _2732 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2598);
    float _2734 = float(_2696);
    float _2736 = _2716 * (-2.0);
    float _2738 = fma(_2446, _2698, _2730);
    float _2740 = fma(_2700, (*spvDescriptorSet0.vp_c9)._m0[192].y, _2076);
    float _2742 = _2700 * (*spvDescriptorSet0.vp_c9)._m0[193].w;
    float _2744 = fma(_2262, _2560, _2732);
    float _2746 = _2734 * _2652;
    float _2748 = fma(_2344, _2684, _2738);
    float _2750 = -_1966;
    float _2752 = fma(_2750, _2742, _2704);
    float _2754 = fma(_2710, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2712);
    float _2756 = -_1972;
    float _2758 = fma(_2756, _2742, _2558);
    float _2760 = _2746 * (-2.0);
    float _2762 = fma(_1404, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2752);
    float _2764 = fma(_2440, _2698, _2754);
    float _2766 = _2728 * (-2.0);
    float _2768 = fma(_1870, (*spvDescriptorSet0.vp_c9)._m0[194].y, _2758);
    float _2770 = _2056 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2772 = _2060 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2774 = fma(_1794, _2766, _1794);
    bool _2776 = !_1016;
    int _2778 = _2776 ? _2670 : (-1);
    float _2780 = fma(_2766, _2722, _2722);
    float _2782 = _2762 + _2770;
    bool _2784 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2786 = isnan(1.0);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2792 = _2788 || _2790;
    float _2794 = -_2740;
    float _2796 = _2794 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2798 = _2768 + _2772;
    float _2800 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2802 = !_2792;
    float _2804 = _2802 ? _145 : _1924;
    float _2806 = -_2782;
    float _2808 = _2806 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2810 = -_2798;
    float _2812 = _2810 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2814 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2800);
    float _2816 = _2796 * _2796;
    bool _2818 = _131 > 0.5;
    float _2820 = _131 + (-0.5);
    float _2822 = fma(_2736, _2724, _2724);
    float _2824 = fma(_2808, _2808, _2816);
    float _2826 = in.m_58.x;
    float _2828 = fma(_2820, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2780);
    float _2830 = fma(_2760, _2726, _2726);
    float _2832 = fma(_2812, _2812, _2824);
    float _2834 = _169 + (-0.5);
    float _2836 = fma(_2804, _2774, _2828);
    float _2838 = fma(_1800, _2736, _1800);
    float _2840 = fma(_2326, _2684, _2764);
    float _2842 = fma(_2834, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2822);
    float _2844 = rsqrt(_2832);
    float _2846 = _2836 * 0.15915493667125701904296875;
    float _2848 = _173 + (-0.5);
    float _2850 = fma(_2286, _2536, _2744);
    float _2852 = fma(_1798, _2760, _1798);
    float _2854 = fma(_2452, _2650, _2840);
    float _2856 = fma(_2848, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2830);
    float _2858 = fma(_2236, _2518, _2850);
    float _2860 = fma(_2468, _2650, _2748);
    float _2862 = fma(_2432, _2630, _2854);
    float _2864 = fma(_2804, _2852, _2856);
    float _2866 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2868 = _2740 + _2866;
    float _2870 = fma(_2264, _2494, _2858);
    float _2872 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2874 = _2782 + _2872;
    float _2876 = fma(_2434, _2630, _2860);
    float _2878 = fma(_2804, _2838, _2842);
    float _2880 = _2808 * _2844;
    float _2882 = _2812 * _2844;
    float _2884 = fma(_2232, _2490, _2870);
    float _2886 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2888 = _2798 + _2886;
    float _2890 = _2880 * _2880;
    float _2892 = fma(_2492, _2606, _2862);
    float _2894 = fma(_2258, _2454, _2884);
    float _2896 = fma(_2500, _2606, _2876);
    float _2898 = fma(_2882, _2882, _2890);
    float _2900 = _2868 * _2868;
    float _2902 = -_1372;
    float _2904 = _2902 + 1.0;
    float _2906 = fma(_2430, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2894);
    float _2908 = rsqrt(_2898);
    float _2910 = fma(_2874, _2874, _2900);
    float _2912 = _2878 * 0.15915493667125701904296875;
    bool _2914 = _2904 >= 0.001000000047497451305389404296875;
    bool _2916 = isnan(_2904);
    bool _2918 = _2914 || _2916;
    bool _2920 = isnan(0.001000000047497451305389404296875);
    bool _2922 = _2918 || _2920;
    float _2924 = float(_2922);
    float _2926 = fma(_2888, _2888, _2910);
    float _2928 = _2826 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2930 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2932 = _2864 * 0.15915493667125701904296875;
    float _2934 = _2796 * _2844;
    float _2936 = _2928 * _2906;
    float _2938 = fma(_169, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2930);
    float _2940 = sqrt(_2926);
    int _2942 = _1218 >> 31;
    float _2944 = _2936 * _2924;
    float _2946 = fma(_2562, _2584, _2892);
    float _2948 = _2882 * _2908;
    float _2950 = _2880 * _2908;
    float _2952 = _2214 * _2944;
    float _2954 = fma(_2582, _2584, _2896);
    float _2956 = -_2948;
    float _2958 = _2882 * _2956;
    float _2960 = _2846 * 6.283185482025146484375;
    float _2962 = sin(_2960);
    float _2964 = -_2948;
    float _2966 = _2934 * _2964;
    float _2968 = in.m_58.y;
    float _2970 = -_2958;
    float _2972 = fma(_2880, _2950, _2970);
    float _2974 = _2934 * _2950;
    float _2976 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2946);
    float _2978 = -_256;
    int _2980 = _2078 ? as_type<int>(_2978) : as_type<int>(_256);
    float _2982 = _2972 * _2972;
    float _2984 = _2912 * 6.283185482025146484375;
    float _2986 = sin(_2984);
    float _2988 = _2940 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _2990 = _2976 + 1.0;
    float _2992 = fma(_2974, _2974, _2982);
    int _2994 = _2942 & 3;
    float _2996 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2814);
    float _2998 = _2322 * _2990;
    float _3000 = fma(_2966, _2966, _2992);
    float _3002 = _2912 * 6.283185482025146484375;
    float _3004 = cos(_3002);
    int _3006 = _1218 + _2994;
    float _3008 = fma(_2552, (*spvDescriptorSet0.vp_c9)._m0[182].z, _2954);
    bool _3010 = !_1640;
    float _3012 = _3010 ? _256 : as_type<float>(_2980);
    float _3014 = -_2996;
    float _3016 = _3014 + 1.0;
    float _3018 = _2932 * 6.283185482025146484375;
    float _3020 = cos(_3018);
    float _3022 = _2962 * _2986;
    float _3024 = _2846 * 6.283185482025146484375;
    float _3026 = cos(_3024);
    float _3028 = _2962 * _3004;
    float _3030 = rsqrt(_2926);
    float _3032 = _2952 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _3034 = _726 >> 31;
    float _3036 = _3032 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _3038 = _3034 & 3;
    float _3040 = rsqrt(_3000);
    float _3042 = _2962 * _3020;
    int _3044 = _726 + _3038;
    float _3046 = _3026 * _3004;
    int _3048 = _3006 >> 2;
    float _3050 = _3026 * _2986;
    int _3052 = _3044 >> 2;
    float _3054 = _3004 * _3020;
    float _3056 = precise::min(_3036, _2988);
    float _3058 = 1.0 / _1982;
    int _3060 = _3052 << 4;
    int _3062 = _3060 + 368;
    float _3064 = _3026 * _3020;
    int _3066 = _3048 << 4;
    int _3068 = _3066 + 512;
    float _3070 = _3030 * _3056;
    uint _3072 = uint(int(uint(_3062) >> uint(2)));
    uint _3074 = uint(int(uint(int(_3072)) >> uint(2)));
    int _3076 = int(_3072) & 3;
    float _3078 = (*spvDescriptorSet0.vp_c9)._m0[int(_3074)][_3076];
    int _3080 = int(_3072) + 1;
    uint _3082 = uint(int(uint(_3080) >> uint(2)));
    int _3084 = _3080 & 3;
    float _3086 = (*spvDescriptorSet0.vp_c9)._m0[int(_3082)][_3084];
    float _3088 = _2986 * _3020;
    float _3090 = _2972 * _3040;
    float _3092 = precise::clamp(_3090, 0.0, 1.0);
    float _3094 = _2932 * 6.283185482025146484375;
    float _3096 = sin(_3094);
    float _3098 = _2868 * _3070;
    float _3100 = _2874 * _3070;
    float _3102 = -_3092;
    float _3104 = _3102 + 1.0;
    out.m_70.w = _3056;
    float _3106 = -_3098;
    float _3108 = _2868 + _3106;
    uint _3110 = uint(int(uint(_3068) >> uint(2)));
    uint _3112 = uint(int(uint(int(_3110)) >> uint(2)));
    int _3114 = int(_3110) & 3;
    float _3116 = (*spvDescriptorSet0.vp_c9)._m0[int(_3112)][_3114];
    int _3118 = int(_3110) + 1;
    uint _3120 = uint(int(uint(_3118) >> uint(2)));
    int _3122 = _3118 & 3;
    float _3124 = (*spvDescriptorSet0.vp_c9)._m0[int(_3120)][_3122];
    float _3126 = fma(_1894, _3058, -1.0);
    float _3128 = _3108 * _3108;
    float _3130 = _3104 * _3058;
    float _3132 = fma(_3104, _3126, 1.0);
    int _3134 = _3062 + 8;
    uint _3136 = uint(int(uint(_3134) >> uint(2)));
    uint _3138 = uint(int(uint(int(_3136)) >> uint(2)));
    int _3140 = int(_3136) & 3;
    float _3142 = (*spvDescriptorSet0.vp_c9)._m0[int(_3138)][_3140];
    int _3144 = int(_3136) + 1;
    uint _3146 = uint(int(uint(_3144) >> uint(2)));
    int _3148 = _3144 & 3;
    float _3150 = (*spvDescriptorSet0.vp_c9)._m0[int(_3146)][_3148];
    float _3152 = _1888 * _3130;
    float _3154 = fma(_3096, _3046, _3022);
    float _3156 = fma(_3096, _3022, _3046);
    float _3158 = -_3100;
    float _3160 = _2874 + _3158;
    float _3162 = _2888 * _3070;
    float _3164 = -_3050;
    float _3166 = fma(_3096, _3028, _3164);
    float _3168 = -_3028;
    float _3170 = fma(_3096, _3050, _3168);
    float _3172 = fma(_3160, _3160, _3128);
    float _3174 = -_3162;
    float _3176 = _2888 + _3174;
    int _3178 = abs(_758);
    float _3180 = _3132 * _3132;
    int _3182 = abs(_1540);
    float _3184 = fma(_3176, _3176, _3172);
    float _3186 = _1904 * _3130;
    float _3188 = fma(_3152, _3152, _3180);
    float _3190 = _2968 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    int _3192 = _3068 + 8;
    uint _3194 = uint(int(uint(_3192) >> uint(2)));
    uint _3196 = uint(int(uint(int(_3194)) >> uint(2)));
    int _3198 = int(_3194) & 3;
    float _3200 = (*spvDescriptorSet0.vp_c9)._m0[int(_3196)][_3198];
    int _3202 = int(_3194) + 1;
    uint _3204 = uint(int(uint(_3202) >> uint(2)));
    int _3206 = _3202 & 3;
    float _3208 = (*spvDescriptorSet0.vp_c9)._m0[int(_3204)][_3206];
    float _3210 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3212 = int(_3210);
    int _3214 = abs(_782);
    float _3216 = _3190 * _2906;
    int _3218 = abs(_1262);
    float _3220 = fma(_3186, _3186, _3188);
    int _3222 = ~_3178;
    int _3224 = _3222 + 1;
    int _3226 = _3224 + 1;
    float _3228 = _3216 * _2924;
    int _3230 = ~_776;
    int _3232 = _3230 + 1;
    int _3234 = _3232 + 1;
    float _3236 = rsqrt(_3220);
    int _3238 = ~_3218;
    int _3240 = _3238 + 1;
    int _3242 = _3240 + 1;
    float _3244 = _2244 * _3228;
    int _3246 = ~_3182;
    int _3248 = _3246 + 1;
    int _3250 = _3248 + 1;
    int _3252 = _3234 * as_type<int>(_3086);
    float _3254 = _3244 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _3256 = _3226 * as_type<int>(_3078);
    int _3258 = _3256 + _3252;
    int _3260 = ~_3214;
    int _3262 = _3260 + 1;
    int _3264 = _3262 + 1;
    float _3266 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3268 = int(_3266);
    int _3270 = abs(_1548);
    int _3272 = _3242 * as_type<int>(_3124);
    int _3274 = abs(_3212);
    float _3276 = float(uint(_3212));
    int _3278 = _3250 * as_type<int>(_3116);
    int _3280 = _3278 + _3272;
    int _3282 = ~_3270;
    int _3284 = _3282 + 1;
    int _3286 = _3284 + 1;
    float _3288 = _3186 * _3236;
    float _3290 = _3152 * _3236;
    int _3292 = _3264 * as_type<int>(_3142);
    int _3294 = _3292 + _3258;
    float _3296 = 1.0 / _3276;
    int _3298 = abs(_794);
    int _3300 = _3286 * as_type<int>(_3150);
    int _3302 = _3300 + _3294;
    int _3304 = abs(_1288);
    float _3306 = _3132 * _3236;
    float _3308 = float(uint(_3274));
    int _3310 = ~_3298;
    int _3312 = _3310 + 1;
    int _3314 = _3312 + 1;
    int _3316 = abs(_1588);
    int _3318 = _3302 * _3314;
    int _3320 = abs(_3268);
    float _3322 = 1.0 / _3308;
    int _3324 = ~_3304;
    int _3326 = _3324 + 1;
    int _3328 = _3326 + 1;
    int _3330 = _1222 * _3298;
    int _3332 = _3330 + _3318;
    float _3334 = _2882 * _3306;
    int _3336 = ~_3316;
    int _3338 = _3336 + 1;
    int _3340 = _3338 + 1;
    int _3342 = _3328 * as_type<int>(_3200);
    int _3344 = _3342 + _3280;
    int _3346 = abs(_1192);
    float _3348 = -_3288;
    float _3350 = -_3334;
    float _3352 = fma(_2934, _3348, _3350);
    float _3354 = float(uint(_3320));
    int _3356 = _3340 * as_type<int>(_3208);
    int _3358 = _3356 + _3344;
    int _3360 = as_type<int>(_3296) + (-2);
    float _3362 = -_3288;
    float _3364 = _2880 * _3362;
    float _3366 = float(uint(_3332));
    float _3368 = 1.0 / _3354;
    float _3370 = float(uint(_3268));
    float _3372 = -_3290;
    float _3374 = -_3364;
    float _3376 = fma(_2882, _3372, _3374);
    int _3378 = as_type<int>(_3322) + (-2);
    float _3380 = as_type<float>(_3360) * _3366;
    float _3382 = -_3290;
    float _3384 = _2934 * _3382;
    int _3386 = ~_3346;
    int _3388 = _3386 + 1;
    int _3390 = _3388 + 1;
    float _3392 = _3376 * _3376;
    float _3394 = 1.0 / _3370;
    int _3396 = abs(_3332);
    float _3398 = -_3384;
    float _3400 = fma(_2880, _3306, _3398);
    int _3402 = _3358 * _3390;
    int _3404 = ~_3212;
    int _3406 = _3404 + 1;
    float _3408 = float(uint(_3396));
    int _3410 = _2778 * _3346;
    int _3412 = _3410 + _3402;
    float _3414 = trunc(_3380);
    float _3416 = precise::max(_3414, 0.0);
    uint _3418 = uint(_3416);
    float _3420 = as_type<float>(_3378) * _3408;
    float _3422 = fma(_3352, _3352, _3392);
    float _3424 = float(uint(_3412));
    float _3426 = trunc(_3420);
    float _3428 = precise::max(_3426, 0.0);
    uint _3430 = uint(_3428);
    int _3432 = as_type<int>(_3394) + (-2);
    float _3434 = fma(_3400, _3400, _3422);
    int _3436 = ~_3274;
    int _3438 = _3436 + 1;
    int _3440 = _3406 * int(_3418);
    int _3442 = _3440 + _3332;
    float _3444 = as_type<float>(_3432) * _3424;
    float _3446 = sqrt(_3184);
    float _3448 = float(uint(_3442));
    int _3450 = _3438 * int(_3430);
    int _3452 = _3450 + _3396;
    int _3454 = as_type<int>(_3368) + (-2);
    float _3456 = as_type<float>(_3360) * _3448;
    float _3458 = trunc(_3444);
    float _3460 = precise::max(_3458, 0.0);
    uint _3462 = uint(_3460);
    int _3464 = ~_3268;
    int _3466 = _3464 + 1;
    float _3468 = float(uint(_3452));
    int _3470 = abs(_3412);
    float _3472 = _3030 * _3446;
    float _3474 = as_type<float>(_3378) * _3468;
    float _3476 = rsqrt(_3434);
    float _3478 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _256);
    float _3480 = _3032 * _3472;
    float _3482 = _3254 * _3472;
    float _3484 = float(uint(_3470));
    float _3486 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _272);
    float _3488 = _3480 * _3478;
    int _3490 = _3466 * int(_3462);
    int _3492 = _3490 + _3412;
    float _3494 = trunc(_3474);
    float _3496 = precise::max(_3494, 0.0);
    uint _3498 = uint(_3496);
    float _3500 = as_type<float>(_3454) * _3484;
    int _3502 = ~_3274;
    int _3504 = _3502 + 1;
    out.m_72.x = _3480;
    float _3506 = float(uint(_3492));
    float _3508 = _3482 * _3486;
    float _3510 = trunc(_3456);
    float _3512 = precise::max(_3510, 0.0);
    uint _3514 = uint(_3512);
    float _3516 = _3352 * _3476;
    float _3518 = as_type<float>(_3432) * _3506;
    float _3520 = _3400 * _3476;
    float _3522 = _3376 * _3476;
    float _3524 = trunc(_3500);
    float _3526 = precise::max(_3524, 0.0);
    uint _3528 = uint(_3526);
    int _3530 = int(_3430) + int(_3498);
    float _3532 = _2882 * _3516;
    int _3534 = int(_3418) + int(_3514);
    float _3536 = -_3532;
    float _3538 = fma(_2880, _3520, _3536);
    int _3540 = ~_3212;
    int _3542 = _3540 + 1;
    float _3544 = _2934 * _3520;
    int _3546 = ~_3320;
    int _3548 = _3546 + 1;
    float _3550 = trunc(_3518);
    float _3552 = precise::max(_3550, 0.0);
    uint _3554 = uint(_3552);
    float _3556 = -_3544;
    float _3558 = fma(_2882, _3522, _3556);
    float _3560 = _2880 * _3522;
    int _3562 = _3542 * _3534;
    int _3564 = _3562 + _3332;
    float _3566 = -_3560;
    float _3568 = fma(_2934, _3516, _3566);
    int _3570 = _3548 * int(_3528);
    int _3572 = _3570 + _3470;
    float _3574 = _3538 * _3538;
    int _3576 = _3504 * _3530;
    int _3578 = _3576 + _3396;
    bool _3580 = uint(_3564) >= uint(_3212);
    float _3582 = float(uint(_3572));
    bool _3584 = !_3580;
    int _3586 = _3584 ? 0 : (-1);
    bool _3588 = uint(_3578) >= uint(_3274);
    float _3590 = fma(_3558, _3558, _3574);
    float _3592 = as_type<float>(_3454) * _3582;
    int _3594 = ~_3534;
    int _3596 = _3594 + _3586;
    int _3598 = _3596 + 1;
    float _3600 = -_3508;
    float _3602 = _3096 * _3600;
    float _3604 = fma(_3568, _3568, _3590);
    float _3606 = trunc(_3592);
    float _3608 = precise::max(_3606, 0.0);
    uint _3610 = uint(_3608);
    int _3612 = int(_3462) + int(_3554);
    float _3614 = _3064 * _3508;
    int _3616 = ~_3268;
    int _3618 = _3616 + 1;
    float _3620 = _3042 * _3508;
    bool _3622 = !_3588;
    int _3624 = _3622 ? 0 : (-1);
    int _3626 = _3212 * _3598;
    int _3628 = _3626 + _3332;
    bool _3630 = _3212 == 0;
    float _3632 = rsqrt(_3604);
    int _3634 = _3618 * _3612;
    int _3636 = _3634 + _3412;
    int _3638 = ~_3320;
    int _3640 = _3638 + 1;
    float _3642 = fma(_3154, _3488, _3614);
    float _3644 = fma(_3054, _3488, _3602);
    float _3646 = fma(_3166, _3488, _3620);
    bool _3648 = !_3630;
    int _3650 = _3648 ? _3628 : (-1);
    bool _3652 = uint(_3636) >= uint(_3268);
    int _3654 = int(_3528) + int(_3610);
    float _3656 = -_256;
    int _3658 = _2818 ? as_type<int>(_3656) : as_type<int>(_256);
    bool _3660 = _3212 == 0;
    float _3662 = _3538 * _3632;
    int _3664 = _3332 ^ _3212;
    float _3666 = _3558 * _3632;
    bool _3668 = !_3652;
    int _3670 = _3668 ? 0 : (-1);
    float _3672 = _3568 * _3632;
    int _3674 = _3640 * _3654;
    int _3676 = _3674 + _3470;
    float _3678 = _3154 * _3666;
    int _3680 = ~_3612;
    int _3682 = _3680 + _3670;
    int _3684 = _3682 + 1;
    float _3686 = _2880 * _3672;
    float _3688 = _3064 * _3666;
    bool _3690 = uint(_3676) >= uint(_3320);
    float _3692 = _2934 * _3666;
    float _3694 = _2882 * _3662;
    float _3696 = -_3686;
    float _3698 = fma(_2882, _3666, _3696);
    float _3700 = _3170 * _3666;
    float _3702 = _3642 * _3666;
    float _3704 = _3154 * _3662;
    float _3706 = _3064 * _3662;
    float _3708 = _3170 * _3662;
    float _3710 = _3642 * _3662;
    float _3712 = -_3692;
    float _3714 = fma(_2880, _3662, _3712);
    float _3716 = -_3694;
    float _3718 = fma(_2934, _3672, _3716);
    float _3720 = _3698 * _3698;
    float _3722 = _3642 * _3672;
    float _3724 = _3064 * _3672;
    bool _3726 = !_1598;
    float _3728 = _3726 ? _256 : as_type<float>(_3658);
    float _3730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3732 = !_3690;
    int _3734 = _3732 ? 0 : (-1);
    int _3736 = _3268 * _3684;
    int _3738 = _3736 + _3412;
    bool _3740 = _3268 == 0;
    float _3742 = _3154 * _3672;
    bool _3744 = _3268 == 0;
    float _3746 = _3170 * _3672;
    int _3748 = _3412 ^ _3268;
    float _3750 = fma(_3718, _3718, _3720);
    uint _3752 = uint(int(uint(_3664) >> uint(31)));
    float _3754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3756 = ~_3624;
    int _3758 = _3530 + _3756;
    int _3760 = _3758 + 1;
    float _3762 = -_145;
    float _3764 = fma(_3762, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1650);
    int _3766 = ~_3734;
    int _3768 = _3654 + _3766;
    int _3770 = _3768 + 1;
    float _3772 = fma(_3714, _3714, _3750);
    int _3774 = ~int(_3752);
    int _3776 = _3774 + 1;
    float _3778 = _3730 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3780 = float(_3650);
    float _3782 = -_145;
    float _3784 = fma(_3782, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1996);
    int _3786 = _3760 ^ _3776;
    float _3788 = rsqrt(_3772);
    float _3790 = fma(_3778, _3780, _3764);
    int _3792 = ~_3776;
    int _3794 = _3792 + _3786;
    int _3796 = _3794 + 1;
    bool _3798 = !_3740;
    int _3800 = _3798 ? _3738 : (-1);
    float _3802 = _3754 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    uint _3804 = uint(int(uint(_3748) >> uint(31)));
    float _3806 = float(_3800);
    float _3808 = _3728 + 0.5;
    int _3810 = ~int(_3804);
    int _3812 = _3810 + 1;
    float _3814 = fma(_3802, _3806, _3784);
    float _3816 = fma(_3778, _3808, _3790);
    float _3818 = _3012 + 0.5;
    float _3820 = _3718 * _3788;
    float _3822 = _3698 * _3788;
    float _3824 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3826 = _3714 * _3788;
    float _3828 = fma(_3054, _3820, _3678);
    float _3830 = -_3096;
    float _3832 = fma(_3830, _3820, _3688);
    float _3834 = -_3096;
    float _3836 = fma(_3834, _3822, _3706);
    float _3838 = fma(_3054, _3826, _3742);
    float _3840 = -_3096;
    float _3842 = fma(_3840, _3826, _3724);
    float _3844 = fma(_3088, _3826, _3746);
    float _3846 = fma(_3644, _3826, _3722);
    float _3848 = fma(_3088, _3820, _3700);
    float _3850 = fma(_3644, _3820, _3702);
    float _3852 = fma(_3802, _3818, _3814);
    float _3854 = fma(_2882, _3646, _3846);
    bool _3856 = !_3660;
    int _3858 = _3856 ? _3796 : (-1);
    float _3860 = fma(_2880, _3646, _3850);
    float _3862 = fma(_3644, _3822, _3710);
    float _3864 = _2798 + _3854;
    float _3866 = float(_3858);
    float _3868 = _3824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3872 = _2782 + _3860;
    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3876 = _3864 + _3874;
    float _3878 = -_1934;
    float _3880 = fma(_3868, _3866, _3878);
    int _3882 = _3770 ^ _3812;
    float _3884 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3886 = _3872 + _3884;
    float _3888 = _3876 * _3876;
    float _3890 = fma(_3088, _3822, _3708);
    float _3892 = fma(_3054, _3822, _3704);
    float _3894 = fma(_3156, _2880, _3848);
    float _3896 = fma(_3886, _3886, _3888);
    int _3898 = ~_3812;
    int _3900 = _3898 + _3882;
    int _3902 = _3900 + 1;
    float _3904 = fma(_2934, _3646, _3862);
    float _3906 = -_272;
    int _3908 = _2314 ? as_type<int>(_3906) : as_type<int>(_272);
    float _3910 = sqrt(_3896);
    float _3912 = fma(_3156, _2934, _3890);
    float _3914 = fma(_3156, _2882, _3844);
    bool _3916 = !_3744;
    int _3918 = _3916 ? _3902 : (-1);
    float _3920 = _3870 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3922 = !_1630;
    float _3924 = _3922 ? _272 : as_type<float>(_3908);
    float _3926 = _272 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3928 = float(_3918);
    float _3930 = fma(_3042, _2880, _3832);
    float _3932 = fma(_3042, _2934, _3836);
    float _3934 = _3924 + (-0.5);
    float _3936 = fma(_3042, _2882, _3842);
    float _3938 = -_2080;
    float _3940 = fma(_3920, _3928, _3938);
    float _3942 = _814 + (-0.5);
    float _3944 = -_3868;
    float _3946 = fma(_3944, _3934, _3880);
    float _3948 = fma(_3926, _3926, 1.0);
    bool _3950 = _3910 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3952 = -_3920;
    float _3954 = fma(_3952, _3942, _3940);
    float _3956 = fma(_3166, _2880, _3828);
    float _3958 = rsqrt(_3948);
    float _3960 = fma(_3166, _2934, _3892);
    float _3962 = fma(_3166, _2882, _3838);
    float _3964 = _256 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3966 = _3926 * _3930;
    float _3968 = _3926 * _3932;
    float _3970 = _3926 * _3936;
    float _3972 = _2740 + _3904;
    out.m_74.x = _3956;
    out.m_74.y = _3960;
    out.m_74.z = _3962;
    float _3974 = fma(_3964, _3956, _3966);
    float _3976 = _3880;
    float _3978 = _3966;
    float _3980 = _3964;
    float _3982 = _2126;
    float _3984 = _2130;
    if (!_3950)
    {
        _3976 = _3872;
    }
    float _3986 = _3976;
    float _3988 = _3986;
    if (!_3950)
    {
        _3978 = _3864;
    }
    float _3990 = _3978;
    float _3992 = fma(_3964, _3960, _3968);
    float _3994 = fma(_3964, _3962, _3970);
    float _3996 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2022);
    float _3998 = _3990;
    if (!_3950)
    {
        _3980 = _3972;
    }
    float _4000 = _3980;
    bool _4002 = !_3950;
    float _4004 = _4000;
    if (!_4002)
    {
        float _4006 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4008 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4010 = _3910 + _4008;
        float _4012 = _3972 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4014 = rsqrt(_3896);
        float _4016 = _4010 * _4006;
        float _4018 = _4016 * 0.15915493667125701904296875;
        float _4020 = _4018 * 6.283185482025146484375;
        float _4022 = cos(_4020);
        float _4024 = _4018 * 6.283185482025146484375;
        float _4026 = sin(_4024);
        float _4028 = _4022 + (-1.0);
        float _4030 = _4028 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4032 = fma(_4026, _4012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4034 = fma(_3972, _4022, _4030);
        float _4036 = _4014 * _4032;
        float _4038 = fma(_3886, _4036, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4040 = fma(_3876, _4036, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _4004 = _4034;
        _3988 = _4038;
        _3998 = _4040;
    }
    float _4042 = _4004;
    float _4044 = _3988;
    float _4046 = _3998;
    float _4048 = -_2740;
    float _4050 = _4048 + _4042;
    float _4052 = -_3016;
    float _4054 = fma(_3728, _4052, _3816);
    float _4056 = -_3996;
    float _4058 = _4056 + 1.0;
    float _4060 = -_2782;
    float _4062 = _4060 + _4044;
    float _4064 = _4050 * _4050;
    float _4066 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2938);
    float _4068 = -_4058;
    float _4070 = fma(_3012, _4068, _3852);
    float _4072 = -_2798;
    float _4074 = _4072 + _4046;
    float _4076 = fma(_4062, _4062, _4064);
    float _4078 = _3926 * _3958;
    float _4080 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2002);
    float _4082 = -_4066;
    float _4084 = _4082 + 1.0;
    float _4086 = fma(_4074, _4074, _4076);
    float _4088 = -_3894;
    float _4090 = _4078 * _4088;
    float _4092 = -_4080;
    float _4094 = _4092 + 1.0;
    float _4096 = -_3912;
    float _4098 = _4078 * _4096;
    float _4100 = sqrt(_4086);
    float _4102 = -_3914;
    float _4104 = _4078 * _4102;
    float _4106 = fma(_3924, _4084, _3946);
    float _4108 = fma(_3958, _3930, _4090);
    float _4110 = fma(_814, _4094, _3954);
    float _4112 = fma(_3958, _3932, _4098);
    float _4114 = fma(_3958, _3936, _4104);
    float _4116 = _3894 + _3974;
    float _4118 = _3912 + _3992;
    float _4120 = _3914 + _3994;
    float _4122 = _3008 + 1.0;
    out.m_76.x = _4108;
    out.m_76.y = _4112;
    out.m_76.z = _4114;
    float _4124 = -_2130;
    float _4126 = _1330 + _4124;
    float _4128 = -_3162;
    float _4130 = _4128 + _4046;
    float _4132 = _2330 * _4122;
    out.m_78.x = _4116;
    out.m_78.y = _4118;
    out.m_78.z = _4120;
    bool _4134 = _4100 > 0.0;
    float _4136 = -_3098;
    float _4138 = _4136 + _4042;
    float _4140 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2156);
    out.m_80.x = _4054;
    out.m_80.y = _4106;
    out.m_80.z = _4070;
    out.m_80.w = _4110;
    float _4142 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2160);
    float _4144 = fma(_4126, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2158);
    float _4146 = fma(_2998, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4140);
    float _4148 = fma(_4132, (*spvDescriptorSet0.vp_c10)._m0[2].w, _4142);
    float _4150 = -_3100;
    float _4152 = _2782 + _4150;
    float _4154 = -_3098;
    float _4156 = _2740 + _4154;
    float _4158 = -_3162;
    float _4160 = _2798 + _4158;
    float _4162 = _4126;
    float _4164 = _4046;
    float _4166 = _4114;
    float _4168 = _4112;
    float _4170 = _4108;
    float _4172 = _4070;
    float _4174 = _4106;
    float _4176 = _4054;
    if (!_4134)
    {
        _4162 = _4138;
    }
    float _4178 = _4162;
    float _4180 = _4178;
    float _4182 = _4178;
    if (!_4134)
    {
        _4164 = _4130;
    }
    float _4184 = _4164;
    float _4186 = -_3100;
    float _4188 = _4186 + _4044;
    float _4190 = _4184;
    float _4192 = _4184;
    if (!_4134)
    {
        _970 = _4188;
    }
    float _4194 = _970;
    bool _4196 = !_4134;
    float _4198 = _4194;
    float _4200 = _4194;
    float _4202 = _4194;
    if (!_4196)
    {
        bool _4204 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _4206 = _4054;
        if (_4204)
        {
            float _4208 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _4206 = _4208;
        }
        float _4210 = _4206;
        if (_4204)
        {
            _4166 = _4146;
        }
        float _4212 = _4166;
        float _4214 = _4212;
        if (_4204)
        {
            _4168 = _4144;
        }
        float _4216 = _4168;
        float _4218 = _4216;
        if (_4204)
        {
            _4170 = _4148;
        }
        float _4220 = _4170;
        float _4222 = _4210;
        float _4224 = _4220;
        if (_4204)
        {
            float _4226 = _4146 * _4210;
            _4172 = _4226;
        }
        float _4228 = _4172;
        float _4230 = _4228;
        if (_4204)
        {
            float _4232 = _4144 * _4210;
            _4174 = _4232;
        }
        float _4234 = _4174;
        float _4236 = _4234;
        if (_4204)
        {
            float _4238 = _4148 * _4210;
            _4222 = _4238;
        }
        float _4240 = _4222;
        float _4242 = _4240;
        if (!_4204)
        {
            bool _4244 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _4246 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _4248 = _4244 || _4246;
            bool _4250 = isnan(1.0);
            bool _4252 = _4248 || _4250;
            float _4254 = _145 + 1.0;
            float _4256 = _4254;
            if (!_4252)
            {
                float _4258 = _4254 * _4254;
                float _4260 = _4258 * 0.5;
                _4198 = _4260;
            }
            float _4262 = _4198;
            float _4264 = _4262;
            if (!_4252)
            {
                float _4266 = _4262 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4264 = _4266;
            }
            float _4268 = _4264;
            bool _4270 = !_4252;
            float _4272 = _4268;
            if (!_4270)
            {
                float _4274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4276 = log2(_4274);
                float _4278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4280 = _4278 + 1.0;
                float _4282 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4284 = _4276 * _4254;
                float _4286 = 1.0 / _4280;
                float _4288 = _4282 * 0.693147182464599609375;
                float _4290 = exp2(_4284);
                float _4292 = 1.0 / _4288;
                float _4294 = _4290 + (-1.0);
                float _4296 = -_4294;
                float _4298 = fma(_4296, _4292, _4254);
                float _4300 = _4298 * _4286;
                float _4302 = _4300 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _4272 = _4302;
            }
            float _4304 = _4272;
            float _4306 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _4308 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _4310 = !_4252;
            _4180 = _4306;
            _4200 = _4304;
            if (!_4310)
            {
                float _4312 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _4314 = log2(_4312);
                float _4316 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _4318 = _4316 + 1.0;
                float _4320 = 1.0 / _4318;
                float _4322 = _4314 * _4254;
                float _4324 = exp2(_4322);
                float _4326 = -_4324;
                float _4328 = _4326 + 1.0;
                float _4330 = _4328 * _4320;
                _4256 = _4330;
            }
            float _4332 = _4256;
            float _4334 = fma(_4332, _1300, _4308);
            float _4336 = _4304 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _4338 = fma(_4332, _1298, _4306);
            float _4340 = -_2126;
            float _4342 = _4340 + _4334;
            float _4344 = fma(_4332, _1302, _4336);
            float _4346 = -_2128;
            float _4348 = _4346 + _4338;
            float _4350 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _4352 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _4354 = _4342 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _4356 = -_2130;
            float _4358 = _4356 + _4344;
            float _4360 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _4350);
            float _4362 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _4352);
            float _4364 = fma(_4348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _4354);
            float _4366 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _4360);
            float _4368 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _4362);
            float _4370 = fma(_4358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _4364);
            _4218 = _4368;
            _4214 = _4366;
            _4224 = _4370;
            _4230 = _4366;
            _4236 = _4368;
            _4242 = _4370;
            _4190 = _4364;
        }
        float _4372 = _4218;
        float _4374 = _4214;
        float _4376 = _4224;
        float _4378 = _4230;
        float _4380 = _4236;
        float _4382 = _4242;
        float _4384 = _4180;
        float _4386 = _4200;
        float _4388 = _4190;
        float _4390 = _4372 * _4372;
        float _4392 = fma(_4374, _4374, _4390);
        float _4394 = fma(_4376, _4376, _4392);
        float _4396 = rsqrt(_4086);
        float _4398 = sqrt(_4394);
        float _4400 = _4062 * _4396;
        float _4402 = _4050 * _4396;
        float _4404 = _4074 * _4396;
        bool _4406 = _4398 > 0.0;
        float _4408 = _4386;
        float _4410 = _4384;
        float _4412 = _4388;
        _4176 = _4382;
        if (!_4406)
        {
            _4408 = _4188;
        }
        float _4414 = _4408;
        _4202 = _4414;
        if (!_4406)
        {
            _4410 = _4138;
        }
        float _4416 = _4410;
        _4182 = _4416;
        if (!_4406)
        {
            _4412 = _4130;
        }
        float _4418 = _4412;
        bool _4420 = !_4406;
        _4192 = _4418;
        if (!_4420)
        {
            float _4422 = rsqrt(_4394);
            float _4424 = _4422 * _4372;
            float _4426 = _4422 * _4374;
            float _4428 = _4422 * _4376;
            float _4430 = _4402 * _4424;
            float _4432 = fma(_4400, _4426, _4430);
            float _4434 = fma(_4404, _4428, _4432);
            float _4436 = _4434 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4438 = fma(_4378, _4436, _4188);
            float _4440 = fma(_4380, _4436, _4138);
            float _4442 = fma(_4382, _4436, _4130);
            _4182 = _4440;
            _4202 = _4438;
            _4192 = _4442;
        }
    }
    float _4444 = _4182;
    float _4446 = _4202;
    float _4448 = _4192;
    float _4450 = _4176;
    float _4452 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4454 = _4444 + _4452;
    float _4456 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4458 = _4446 + _4456;
    float _4460 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4462 = _4448 + _4460;
    float _4464 = _4454 * _4454;
    float _4466 = fma(_4458, _4458, _4464);
    float _4468 = fma(_4462, _4462, _4466);
    float _4470 = rsqrt(_4468);
    float _4472 = sqrt(_4468);
    float _4474 = _4470 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4476 = _4458 * _4474;
    float _4478 = _4462 * _4474;
    float _4480 = _4476 * _4476;
    float _4482 = _4478 * _4478;
    float _4484 = _4480 + _4482;
    float _4486 = sqrt(_4484);
    bool _4488 = _4486 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4490 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4492 = _4486 + _4490;
    float _4494 = _4470;
    float _4496 = _4484;
    float _4498 = _4492;
    float _4500 = _4454;
    float _4502 = _4450;
    if (_4488)
    {
        float _4504 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4494 = _4504;
    }
    float _4506 = _4494;
    if (_4488)
    {
        float _4508 = rsqrt(_4484);
        _4496 = _4508;
    }
    float _4510 = _4496;
    float _4512 = _4510;
    if (_4488)
    {
        float _4514 = _4492 * _4506;
        _4498 = _4514;
    }
    float _4516 = _4498;
    if (_4488)
    {
        float _4518 = _4516 * 0.15915493667125701904296875;
        _3982 = _4518;
    }
    float _4520 = _3982;
    float _4522 = _4462;
    if (_4488)
    {
        float _4524 = _4520 * 6.283185482025146484375;
        float _4526 = sin(_4524);
        _4522 = _4526;
    }
    float _4528 = _4522;
    float _4530 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4532 = precise::max(0.0, _4530);
    float _4534 = _4506;
    float _4536 = _4532;
    if (_4488)
    {
        float _4538 = _4520 * 6.283185482025146484375;
        float _4540 = cos(_4538);
        _4534 = _4540;
    }
    float _4542 = _4534;
    float _4544 = -_4474;
    float _4546 = -_4532;
    float _4548 = fma(_4454, _4544, _4546);
    if (_4488)
    {
        float _4550 = _4548 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4500 = _4550;
    }
    float _4552 = _4500;
    float _4554 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4556 = _4552;
    float _4558 = _4528;
    if (_4488)
    {
        float _4560 = fma(_4528, _4552, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4556 = _4560;
    }
    float _4562 = _4556;
    float _4564 = _4562;
    if (!_4488)
    {
        _4558 = _4476;
    }
    float _4566 = _4558;
    float _4568 = _4566;
    float _4570 = _4542;
    if (_4488)
    {
        float _4572 = _4542 + (-1.0);
        _4536 = _4572;
    }
    float _4574 = _4536;
    float _4576 = _4574;
    if (_4488)
    {
        float _4578 = _4510 * _4562;
        _4502 = _4578;
    }
    float _4580 = _4502;
    if (!_4488)
    {
        _4564 = _4548;
    }
    float _4582 = _4564;
    float _4584 = _4582;
    if (_4488)
    {
        float _4586 = _4574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3984 = _4586;
    }
    float _4588 = _3984;
    if (_4488)
    {
        float _4590 = _4476 * _4580;
        _4568 = _4590;
    }
    float _4592 = _4568;
    if (!_4488)
    {
        _4576 = _4478;
    }
    float _4594 = _4576;
    float _4596 = _4594;
    if (_4488)
    {
        float _4598 = _4478 * _4580;
        _4596 = _4598;
    }
    float _4600 = _4596;
    if (!_4488)
    {
        _4512 = _4480;
    }
    float _4602 = _4512;
    float _4604 = _4602;
    if (_4488)
    {
        float _4606 = fma(_4548, _4542, _4588);
        _4584 = _4606;
    }
    float _4608 = _4584;
    if (_4488)
    {
        float _4610 = _4592 * _4592;
        _4604 = _4610;
    }
    float _4612 = _4604;
    if (!_4488)
    {
        _4570 = _4482;
    }
    float _4614 = _4570;
    float _4616 = _4614;
    if (_4488)
    {
        float _4618 = _4600 * _4600;
        _4616 = _4618;
    }
    float _4620 = _4616;
    float _4622 = fma(_4608, _4608, _4612);
    float _4624 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _4626 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4628 = _4622 + _4620;
    float _4630 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4554);
    float _4632 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4634 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4636 = fma(_4472, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4634);
    float _4638 = precise::clamp(_4636, 0.0, 1.0);
    float _4640 = rsqrt(_4628);
    float _4642 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4630);
    float _4644 = _4444 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4646 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4632);
    float _4648 = -_4638;
    float _4650 = _4648 + 1.0;
    float _4652 = _4642 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4654 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4644);
    float _4656 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4646);
    float _4658 = abs(_4650);
    float _4660 = log2(_4658);
    float _4662 = _4652 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4664 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4654);
    float _4666 = _4656 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4668 = fma(_4446, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4626);
    float _4670 = -_4662;
    float _4672 = fma(_4670, _4624, 1.0);
    float _4674 = _4664 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4676 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4678 = _4640 * _4592;
    float _4680 = _4640 * _4608;
    float _4682 = fma(_4448, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4668);
    float _4684 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4676);
    float _4686 = _4678 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4688 = _4640 * _4600;
    float _4690 = _4682 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4692 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4684);
    float _4694 = -_4686;
    float _4696 = fma(_4680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4694);
    float _4698 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4700 = log2(_4672);
    float _4702 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4692);
    float _4704 = -_4688;
    float _4706 = fma(_4704, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4696);
    float _4708 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4710 = _4680 + 1.0;
    float _4712 = fma(_4706, -0.5, 0.5);
    float _4714 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4708);
    float _4716 = exp2(_4698);
    float _4718 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4720 = fma(_4706, 0.5, 0.5);
    float _4722 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4714);
    float _4724 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4718);
    float _4726 = fma(_4720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4728 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4722);
    float _4730 = 1.0 / _4702;
    float _4732 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4724);
    float _4734 = fma(_4720, _4726, -0.212114393711090087890625);
    float _4736 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4732);
    float _4738 = fma(_4720, _4734, 1.570728778839111328125);
    float _4740 = sqrt(_4712);
    float _4742 = -_4680;
    float _4744 = fma(_4716, _4710, _4742);
    float _4746 = _4700 * 0.693147182464599609375;
    float _4748 = fma(_4744, 0.5, 0.5);
    float _4750 = _4746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4752 = _4728 * _4730;
    float _4754 = _4736 * _4730;
    float _4756 = fma(_4752, 0.5, 0.5);
    float _4758 = fma(_4754, -0.5, 0.5);
    float _4760 = _4740 * 0.636619746685028076171875;
    float3 _12268 = float3(_4756, _4758, _4750);
    float _4762 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12268, float3(0.0), isnan(_12268)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12268, float3(0.0), isnan(_12268)), level(0.0)).x;
    float3 _12279 = float3(_4756, _4758, _4750);
    float4 _4765 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12279, float3(0.0), isnan(_12279)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12279, float3(0.0), isnan(_12279)), level(0.0)).xyzw;
    float _4767 = _4765.x;
    float _4769 = _4765.y;
    float _4771 = _4765.z;
    float _4773 = _4765.w;
    float _4775 = -_4738;
    float _4777 = fma(_4760, _4775, 1.0);
    float2 _12301 = float2(_4777, _4748);
    float3 _4781 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12301, float2(0.0), isnan(_12301)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12301, float2(0.0), isnan(_12301)), level(0.0)).xyz;
    float _4783 = _4781.x;
    float _4785 = _4781.y;
    float _4787 = _4781.z;
    float _4789 = _4156 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4791 = _4660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4793 = _4666 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _4152;
    out.m_82.y = _4156;
    out.m_82.z = _4160;
    float _4795 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4789);
    bool _4797 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4799 = isnan(_4472);
    bool _4801 = _4797 || _4799;
    bool _4803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4805 = _4801 || _4803;
    float _4807 = fma(_4674, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4793);
    float _4809 = exp2(_4791);
    float _4811 = fma(_4160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4795);
    float _4813 = _4156 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_84.x = _4446;
    out.m_84.y = _4444;
    out.m_84.z = _4448;
    float _4815 = _4811 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4817 = fma(_4152, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4813);
    float _4819 = 1.0 / _4815;
    bool _4821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4825 = _4821 || _4823;
    bool _4827 = isnan(0.5);
    bool _4829 = _4825 || _4827;
    float _4831 = fma(_4160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4817);
    float _4833 = fma(_4652, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4807);
    float _4835 = _4831 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4837 = fma(_4690, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4833);
    float _4839 = -_4809;
    float _4841 = _4839 + 1.0;
    float _4843 = _4835 + _4815;
    float _4845 = _4837 + _4702;
    float _4847 = _4841 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _4728;
    out.gl_Position.y = _4736;
    out.gl_Position.z = _4837;
    out.gl_Position.w = _4702;
    float _4849 = _4674;
    float _4851 = _4690;
    float _4853 = _4702;
    float _4855 = _4837;
    float _4857 = _4736;
    float _4859 = _4728;
    if (!_4829)
    {
        _4849 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _4861 = _4849;
    float _4863 = _4845 * 0.5;
    float _4865 = _4843 * _4819;
    float _4867 = _4865 * 0.5;
    float _4869 = _4702 * 0.5;
    float _4871 = _4869;
    if (!_4829)
    {
        float _4873 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _4875 = fma(_4867, _4861, _4873);
        _4851 = _4875;
    }
    float _4877 = _4851;
    float _4879 = fma(_4736, -0.5, _4869);
    if (!_4829)
    {
        _4871 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _4881 = _4871;
    float _4883 = _4728 + _4702;
    float _4885 = _4877;
    float _4887 = _4881;
    if (!_4829)
    {
        float _4889 = 1.0 / _4877;
        _4885 = _4889;
    }
    float _4891 = _4885;
    float _4893 = _4883 * 0.5;
    if (_4829)
    {
        _4853 = 1.0;
    }
    float _4895 = _4853;
    float _4897 = _4895;
    if (!_4805)
    {
        _4855 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4899 = _4855;
    out.m_86.x = _4893;
    out.m_86.y = _4879;
    out.m_86.z = _4863;
    out.m_86.w = _4702;
    float _4901 = _4899;
    float _4903 = _4899;
    if (!_4805)
    {
        _4857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4905 = _4857;
    float _4907 = _4905;
    float _4909 = _4905;
    if (!_4805)
    {
        _4859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4911 = _4859;
    float _4913 = _4891;
    float _4915 = _4911;
    float _4917 = _4911;
    if (!_4829)
    {
        float _4919 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _4921 = -_4881;
        float _4923 = fma(_4891, _4919, _4921);
        _4913 = _4923;
    }
    float _4925 = _4913;
    if (!_4829)
    {
        float _4927 = -_4881;
        float _4929 = _4927 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _4887 = _4929;
    }
    float _4931 = _4887;
    float _4933 = _4931;
    if (!_4829)
    {
        float _4935 = 1.0 / _4931;
        _4933 = _4935;
    }
    float _4937 = _4933;
    if (!_4829)
    {
        float _4939 = _4925 * _4937;
        float _4941 = precise::clamp(_4939, 0.0, 1.0);
        _4897 = _4941;
    }
    float _4943 = _4897;
    float _4945 = _4943 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4947 = _4847 * _4762;
    float _4949 = -_4847;
    float _4951 = _4949 + 1.0;
    float _4953 = _4773 * _4947;
    float _4955 = _4773 * _4951;
    float _4957 = _4787 * _4947;
    float _4959 = fma(_4783, _4953, _4767);
    float _4961 = fma(_4785, _4953, _4769);
    float _4963 = fma(_4773, _4957, _4771);
    out.m_88.x = _4959;
    out.m_88.y = _4961;
    out.m_88.z = _4963;
    out.m_88.w = _4955;
    bool _4965 = !_4805;
    if (!_4965)
    {
        bool _4967 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4969 = isnan(_4472);
        bool _4971 = _4967 || _4969;
        bool _4973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4975 = _4971 || _4973;
        if (!_4975)
        {
            float _4977 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4979 = _4472 + _4977;
            float _4981 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4983 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4981;
            float _4985 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4987 = _4985 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4989 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4991 = _4989 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4993 = 1.0 / _4983;
            float _4995 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4997 = _4995 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4999 = _4979 * _4993;
            float _5001 = precise::clamp(_4999, 0.0, 1.0);
            float _5003 = fma(_5001, _4987, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5005 = fma(_5001, _4991, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5007 = fma(_5001, _4997, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4909 = _5005;
            _4903 = _5003;
            _4917 = _5007;
            _5009 = true;
        }
        else
        {
            bool _5011 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5013 = isnan(_4472);
            bool _5015 = _5011 || _5013;
            bool _5017 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5019 = _5015 || _5017;
            if (!_5019)
            {
                _4901 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5021 = _4901;
            _4903 = _5021;
            if (!_5019)
            {
                _4907 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5023 = _4907;
            _4909 = _5023;
            if (!_5019)
            {
                _4915 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5025 = _4915;
            bool _5027 = !_5019;
            _4917 = _5025;
            if (!_5027)
            {
                bool _5029 = _4472 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5031 = isnan(_4472);
                bool _5033 = _5029 || _5031;
                bool _5035 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5037 = _5033 || _5035;
                if (!_5037)
                {
                    float _5039 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5041 = _4472 + _5039;
                    float _5043 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5045 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5043;
                    float _5047 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5049 = _5047 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5051 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5053 = _5051 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5055 = 1.0 / _5045;
                    float _5057 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5059 = _5057 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5061 = _5041 * _5055;
                    float _5063 = precise::clamp(_5061, 0.0, 1.0);
                    float _5065 = fma(_5063, _5049, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5067 = fma(_5063, _5053, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5069 = fma(_5063, _5059, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4909 = _5067;
                    _4903 = _5065;
                    _4917 = _5069;
                    _5009 = true;
                }
                else
                {
                    _4909 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4903 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4917 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _5009 = false;
    float _5071 = _4909;
    float _5073 = _4903;
    float _5075 = _4917;
    float _5077 = _4945 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_90.x = 0.0;
    float _5079 = _5071 * 0.586610972881317138671875;
    bool _5081 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_47.x = _5077;
    float _5083 = fma(_5073, 0.298911988735198974609375, _5079);
    bool _5085 = _4943 > 0.0;
    bool _5087 = isnan(_4943);
    bool _5089 = _5085 || _5087;
    bool _5091 = isnan(0.0);
    bool _5093 = _5089 || _5091;
    float _5095 = fma(_5075, 0.114477999508380889892578125, _5083);
    float _5097 = -_5095;
    float _5099 = _5097 + _5073;
    float _5101 = -_5095;
    float _5103 = _5101 + _5071;
    float _5105 = -_5095;
    float _5107 = _5105 + _5075;
    float _5109 = fma(_5099, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    float _5111 = fma(_5103, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    float _5113 = fma(_5107, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5095);
    bool _5115 = !_5081;
    if (!_5115)
    {
        float _5117 = -_4444;
        float _5119 = _5117 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5121 = -_4446;
        float _5123 = _5121 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5125 = -_4448;
        float _5127 = _5125 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5129 = _5119 * _5119;
        float _5131 = fma(_5123, _5123, _5129);
        float _5133 = fma(_5127, _5127, _5131);
        float _5135 = sqrt(_5133);
        float _5137 = rsqrt(_5133);
        float _5139 = -_5135;
        float _5141 = _5139 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5143 = _5141 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5145 = precise::clamp(_5143, 0.0, 1.0);
        float _5147 = _5123 * _5137;
        float _5149 = _5119 * _5137;
        float _5151 = abs(_5145);
        float _5153 = log2(_5151);
        float _5155 = _5127 * _5137;
        float _5157 = _5147 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5159 = _4118 * _5149;
        float _5161 = -_5149;
        float _5163 = -_5157;
        float _5165 = fma(_5161, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5163);
        float _5167 = fma(_4116, _5147, _5159);
        float _5169 = -_5155;
        float _5171 = fma(_5169, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5165);
        float _5173 = fma(_4120, _5155, _5167);
        float _5175 = precise::clamp(_5173, 0.0, 1.0);
        float _5177 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5179 = _5171 + _5177;
        float _5181 = _5153 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5183 = _5179 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5185 = precise::clamp(_5183, 0.0, 1.0);
        float _5187 = exp2(_5181);
        float _5189 = _5187 * _5185;
        float _5191 = _5175 * _5189;
        float _5193 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5195 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5197 = _5191 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_90.x = _5193;
        out.m_90.y = _5195;
        out.m_90.z = _5197;
    }
    out.m_70.x = _5109;
    out.m_70.y = _5111;
    out.m_70.z = _5113;
    if (_5093)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _5199 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5199;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

