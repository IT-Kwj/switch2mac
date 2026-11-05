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
    float4 m_64 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_60 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1530 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2008 = as_type<float>(_107);
        out.gl_Position.z = _2008;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_143);
        out.gl_Position.z = _2077;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _147 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _147);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _147 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _175 = _261;
    }
    float _263 = _175;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _161, _267);
    float _275 = fma(_263, _163, _269);
    float _277 = fma(_263, _165, _271);
    float _279 = fma(_273, _149, _167);
    float _281 = fma(_275, _149, _169);
    float _283 = fma(_277, _149, _171);
    bool _285 = !_265;
    float _305;
    float _307;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _295 = _293 * _289;
        float _297 = float(_91);
        float _299 = floor(_295);
        float _301 = -_299;
        float _303 = _295 + _301;
        _305 = _297;
        _307 = _303;
        _309 = true;
    }
    else
    {
        float _311 = float(_91);
        float _313 = 1.0 / _311;
        float _315 = _125 * _313;
        _305 = _311;
        _307 = _315;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _323 = int(_321);
    float _325 = in.m_56.x;
    float _327 = in.m_56.y;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _331 = int(_329);
    float _333 = float(_323);
    float _335 = 1.0 / _317;
    float _337 = float(uint(_331));
    float _339 = 1.0 / _333;
    int _341 = ~_331;
    int _343 = _341 + 1;
    float _345 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _347 = ~_331;
    int _349 = _347 + 1;
    int _351 = _331 + (-1);
    int _353 = ~_331;
    int _355 = _353 + 1;
    float _357 = 1.0 / _337;
    float _359 = _125 * _339;
    float _361 = trunc(_359);
    int _363 = int(_361);
    int _365 = as_type<int>(_357) + (-2);
    float _367 = float(uint(_363));
    float _369 = as_type<float>(_365) * _367;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    float _378 = float(_331);
    int _380 = _343 * int(_376);
    int _382 = _380 + _363;
    float _384 = float(_363);
    float _386 = float(uint(_382));
    bool _388 = _384 >= _378;
    bool _390 = isnan(_384);
    bool _392 = _388 || _390;
    bool _394 = isnan(_378);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = as_type<float>(_365) * _386;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _404 = _402 != 0;
    float _406 = trunc(_398);
    int _408 = int(_406);
    bool _410 = !_404;
    float _412 = _410 ? 7.345489978790283203125 : 1.0;
    float _414 = _412 * _325;
    float _416 = trunc(_400);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    float _422 = floor(_414);
    int _424 = int(_376) + int(_420);
    int _426 = _349 * _424;
    int _428 = _426 + _363;
    float _430 = -_422;
    float _432 = _414 + _430;
    bool _434 = uint(_428) >= uint(_331);
    float _436 = _432 * _378;
    float _438 = _125 * _378;
    bool _440 = !_434;
    int _442 = _440 ? 0 : (-1);
    bool _444 = _331 == 0;
    float _446 = _438 * _335;
    int _448 = ~_424;
    int _450 = _448 + _442;
    int _452 = _450 + 1;
    int _454 = ~_408;
    int _456 = _454 + 1;
    int _458 = _456 + 1;
    float _460 = trunc(_436);
    int _462 = int(_460);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _474 = _472 != 0;
    int _476 = _331 * _452;
    int _478 = _476 + _363;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _486 = _484 != 0;
    bool _488 = !_444;
    int _490 = _488 ? _478 : (-1);
    float _492 = trunc(_446);
    int _494 = int(_492);
    bool _496 = !_482;
    int _498 = _496 ? 0 : 1;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _502 = _500 != 0;
    int _504 = _490 * _458;
    bool _506 = !_470;
    int _508 = _506 ? 0 : 1;
    int _510 = _408 * _351;
    int _512 = _510 + _504;
    bool _514 = !_466;
    int _516 = _514 ? 0 : 1;
    int _518 = abs(_508);
    bool _520 = !_474;
    int _522 = _520 ? 0 : 1;
    int _524 = abs(_498);
    int _526 = abs(_516);
    bool _528 = !_486;
    int _530 = _528 ? 0 : 1;
    int _532 = _462 * _524;
    int _534 = _532 + _363;
    int _536 = abs(_522);
    int _538 = _512 * _518;
    int _540 = abs(_530);
    int _542 = _494 * _526;
    int _544 = _542 + _538;
    float _546 = float(uint(_534));
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _550 = _548 != 0;
    int _552 = _534 * _536;
    int _554 = _552 + _544;
    int _556 = _462 * _540;
    int _558 = _556 + _554;
    float _560 = in.m_58.x;
    float _562 = in.m_58.y;
    float _564 = in.m_58.z;
    float _566 = float(uint(_558));
    float _568 = as_type<float>(_365) * _566;
    int _570 = ~_331;
    int _572 = _570 + 1;
    float _574 = trunc(_568);
    float _576 = precise::max(_574, 0.0);
    uint _578 = uint(_576);
    float _580 = in.m_60.x;
    float _582 = in.m_60.y;
    float _584 = in.m_60.z;
    int _586 = _572 * int(_578);
    int _588 = _586 + _558;
    float _590 = float(uint(_588));
    float _592 = as_type<float>(_365) * _590;
    float _594 = trunc(_592);
    float _596 = precise::max(_594, 0.0);
    uint _598 = uint(_596);
    float _600 = as_type<float>(_365) * _546;
    float _602 = trunc(_600);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    int _608 = int(_578) + int(_598);
    float _610 = in.m_62.x;
    float _612 = in.m_62.y;
    float _614 = in.m_62.z;
    int _616 = _355 * _608;
    int _618 = _616 + _558;
    bool _620 = uint(_618) >= uint(_331);
    bool _622 = !_620;
    int _624 = _622 ? 0 : (-1);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _628 = _626 != 0;
    int _630 = ~_608;
    int _632 = _630 + _624;
    int _634 = _632 + 1;
    int _636 = _331 * _634;
    int _638 = _636 + _558;
    float _640 = _281 * _562;
    int _642 = ~_331;
    int _644 = _642 + 1;
    float _646 = _281 * _612;
    float _648 = _281 * _582;
    bool _650 = !_444;
    int _652 = _650 ? _638 : (-1);
    float _654 = fma(_279, _560, _640);
    float _656 = fma(_279, _610, _646);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    int _662 = _652 >> 31;
    float _664 = fma(_283, _614, _656);
    int _666 = _644 * int(_606);
    int _668 = _666 + _534;
    int _670 = _662 & 3;
    float _672 = 1.0 / _660;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _680 = _652 + _670;
    float _682 = fma(_279, _580, _648);
    float _684 = float(uint(_668));
    float _686 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _688 = _652 & 3;
    bool _690 = _688 != 0;
    float _692 = 1.0 / _676;
    int _694 = _680 >> 2;
    float _696 = as_type<float>(_365) * _684;
    float _698 = -_678;
    float _700 = fma(_686, 2.0, _698);
    float _702 = fma(_283, _584, _682);
    int _704 = _694 << 4;
    int _706 = _704 + 368;
    float _708 = fma(_283, _564, _654);
    int _710 = _652 & 3;
    bool _712 = _710 != 0;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    uint _716 = uint(int(uint(_706) >> uint(2)));
    uint _718 = uint(int(uint(int(_716)) >> uint(2)));
    int _720 = int(_716) & 3;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[int(_718)][_720];
    int _724 = int(_716) + 1;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    int _728 = _724 & 3;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[int(_726)][_728];
    int _732 = _690 ? 0 : 1;
    float _734 = trunc(_696);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    bool _740 = _325 > 0.5;
    float _742 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _714);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _746 = _319 + _744;
    bool _748 = uint(_710) > 1u;
    int _750 = _706 + 8;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[int(_762)][_764];
    int _768 = ~_732;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _746 * _672;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _782 = _319 + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _786 = _319 + _784;
    float _788 = _708 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = 1.0 / _778;
    float _792 = _782 * _692;
    bool _794 = !_712;
    int _796 = _794 ? 0 : 1;
    bool _798 = _710 != 3;
    int _800 = _772;
    if (!_748)
    {
        int _802 = ~_732;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    bool _808 = uint(_710) >= 2u;
    int _810 = int(_606) + int(_738);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _812;
    int _816 = ~_331;
    int _818 = _816 + 1;
    int _820 = _808 ? 0 : 1;
    float _822 = fma(_814, _774, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _824 = abs(_806);
    int _826 = _818 * _810;
    int _828 = _826 + _534;
    int _830 = ~_820;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = _786 * _790;
    int _838 = _834;
    if (_798)
    {
        int _840 = ~_820;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _850 = uint(_828) >= uint(_331);
    int _852 = abs(_844);
    float _854 = fma(_848, _792, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _856 = ~_824;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = abs(_796);
    int _864 = ~_862;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    int _870 = _860 * as_type<int>(_730);
    bool _872 = !_850;
    int _874 = _872 ? 0 : (-1);
    float _876 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _878 = int(_876);
    int _880 = ~_852;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    int _886 = _868 * as_type<int>(_722);
    int _888 = _886 + _870;
    bool _890 = _710 != 3;
    bool _892 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _894 = isnan(_319);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    int _904 = _884 * as_type<int>(_758);
    int _906 = _904 + _888;
    int _908 = ~_810;
    int _910 = _908 + _874;
    int _912 = _910 + 1;
    bool _914 = !_890;
    int _916 = _914 ? 0 : (-1);
    float _918 = -_902;
    float _920 = _918 + 1.0;
    bool _922 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _924 = isnan(_319);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    int _934 = _331 * _912;
    int _936 = _934 + _534;
    bool _938 = !_550;
    int _940 = _938 ? 0 : 1;
    int _942 = abs(_916);
    float _944 = float(uint(_878));
    bool _946 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _948 = isnan(_319);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    bool _958 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _960 = isnan(_319);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _932 * _920;
    float _972 = -_932;
    float _974 = _972 + 1.0;
    int _976 = abs(_940);
    float _978 = 1.0 / _944;
    int _980 = ~_942;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = _968 * _974;
    float _988 = -_968;
    float _990 = _988 + 1.0;
    int _992 = ~_976;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _984 * as_type<int>(_766);
    int _1000 = _998 + _906;
    int _1002 = abs(_878);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1012 = _956 * _990;
    bool _1014 = !_444;
    int _1016 = _1014 ? _936 : (-1);
    int _1018 = _1000 * _996;
    float _1020 = fma(_1010, _792, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1022 = fma(_1006, _774, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1024 = float(uint(_1002));
    float _1026 = _822 * _1012;
    int _1028 = _1016 * _976;
    int _1030 = _1028 + _1018;
    float _1032 = _1022 * _1012;
    float _1034 = 1.0 / _1024;
    float _1036 = in.m_54.x;
    float _1038 = in.m_54.y;
    int _1040 = as_type<int>(_978) + (-2);
    float _1042 = -_956;
    float _1044 = _1042 + 1.0;
    float _1046 = float(uint(_1030));
    float _1048 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1026);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1050;
    float _1054 = as_type<float>(_1040) * _1046;
    int _1056 = abs(_1030);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1058;
    float _1062 = fma(_1052, _836, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1064 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1032);
    float _1066 = trunc(_1054);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    int _1072 = as_type<int>(_1034) + (-2);
    float _1074 = fma(_1060, _836, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1076 = float(uint(_1056));
    float _1078 = fma(_854, _986, _1048);
    float _1080 = fma(_1020, _986, _1064);
    int _1082 = ~_1002;
    int _1084 = _1082 + 1;
    float _1086 = fma(_1074, _970, _1078);
    float _1088 = as_type<float>(_1072) * _1076;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1092 = fma(_1062, _970, _1080);
    int _1094 = ~_878;
    int _1096 = _1094 + 1;
    float _1098 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1086);
    float _1100 = fma(_345, -2.0, _1090);
    float _1102 = trunc(_1088);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1092);
    float _1110 = _1098 * _1038;
    int _1112 = _1096 * int(_1070);
    int _1114 = _1112 + _1030;
    float _1116 = _1108 * _1036;
    float _1118 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1120 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1122 = float(uint(_1114));
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = _1120 * _1118;
    float _1130 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1132 = as_type<float>(_1040) * _1122;
    float _1134 = _1126 * _1124;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1140 = _1084 * int(_1106);
    int _1142 = _1140 + _1056;
    float _1144 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1136);
    float _1146 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1138);
    float _1148 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = float(uint(_1142));
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1144);
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1158 = _664 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1160 = _702 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1164 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1166 = as_type<float>(_1072) * _1150;
    bool _1168 = _327 > 0.5;
    float _1170 = trunc(_1132);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = _1158 + _1162;
    float _1178 = _1160 + _1164;
    int _1180 = ~_878;
    int _1182 = _1180 + 1;
    float _1184 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1156);
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1188 = _1176 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1192 = _1178 + _1190;
    int _1194 = ~_1002;
    int _1196 = _1194 + 1;
    float _1198 = trunc(_1166);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = _1188 * _1188;
    float _1206 = _1192 * _1192;
    float _1208 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1210 = -_199;
    int _1212 = _740 ? as_type<int>(_1210) : as_type<int>(_199);
    float _1214 = _1204 + _1206;
    float _1216 = -_203;
    int _1218 = _1168 ? as_type<int>(_1216) : as_type<int>(_203);
    float _1220 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1208);
    int _1222 = int(_1070) + int(_1174);
    float _1224 = sqrt(_1214);
    bool _1226 = !_502;
    float _1228 = _1226 ? _199 : as_type<float>(_1212);
    float _1230 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1232 = !_628;
    float _1234 = _1232 ? _203 : as_type<float>(_1218);
    int _1236 = _1182 * _1222;
    int _1238 = _1236 + _1030;
    int _1240 = _1030 ^ _878;
    float _1242 = _788 + _1230;
    int _1244 = int(_1106) + int(_1202);
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1248 = uint(_1238) >= uint(_878);
    uint _1250 = uint(int(uint(_1240) >> uint(31)));
    int _1252 = _1196 * _1244;
    int _1254 = _1252 + _1056;
    bool _1256 = !_1248;
    int _1258 = _1256 ? 0 : (-1);
    int _1260 = ~int(_1250);
    int _1262 = _1260 + 1;
    bool _1264 = uint(_1254) >= uint(_1002);
    float _1266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1268 = _1224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1270 = ~_1222;
    int _1272 = _1270 + _1258;
    int _1274 = _1272 + 1;
    bool _1276 = !_1264;
    float _1278 = _1276 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _1280 = _878 == 0;
    int _1282 = _878 * _1274;
    int _1284 = _1282 + _1030;
    int _1286 = ~as_type<int>(_1278);
    int _1288 = _1244 + _1286;
    int _1290 = _1288 + 1;
    bool _1292 = _878 == 0;
    int _1294 = _1290 ^ _1262;
    bool _1296 = !_1280;
    int _1298 = _1296 ? _1284 : (-1);
    float _1300 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1302 = ~_1262;
    int _1304 = _1302 + _1294;
    int _1306 = _1304 + 1;
    float _1308 = -_125;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _700);
    float _1312 = as_type<float>(_878);
    float _1314 = _1266;
    float _1316 = _1278;
    float _1318 = _1176;
    float _1320 = _1178;
    float _1322 = _1224;
    if (!_1268)
    {
        _1312 = _1206;
    }
    float _1324 = _1312;
    float _1326 = _1324;
    if (!_1268)
    {
        _1314 = _1204;
    }
    float _1328 = _1314;
    float _1330 = float(_1298);
    float _1332 = _1328;
    if (!_1268)
    {
        _1316 = _1242;
    }
    float _1334 = _1316;
    bool _1336 = !_1268;
    float _1338 = _1334;
    if (!_1336)
    {
        float _1340 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1344 = _1224 + _1342;
        float _1346 = rsqrt(_1214);
        float _1348 = _1344 * _1340;
        float _1350 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1352 = _1348 * 0.15915493667125701904296875;
        float _1354 = _1352 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        float _1358 = _1352 * 6.283185482025146484375;
        float _1360 = cos(_1358);
        float _1362 = fma(_1356, _1350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1364 = _1346 * _1362;
        float _1366 = _1360 + (-1.0);
        float _1368 = fma(_1188, _1364, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1370 = fma(_1192, _1364, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1372 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1376 = _1368 + _1374;
        float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1380 = _1370 + _1378;
        float _1382 = fma(_1242, _1360, _1372);
        float _1384 = _1376 * _1376;
        float _1386 = _1380 * _1380;
        _1338 = _1382;
        _1332 = _1384;
        _1326 = _1386;
        _1318 = _1368;
        _1320 = _1370;
    }
    float _1388 = _1338;
    float _1390 = _1332;
    float _1392 = _1326;
    float _1394 = _1318;
    float _1396 = _1320;
    bool _1398 = !_1292;
    int _1400 = _1398 ? _1306 : (-1);
    float _1402 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1404 = fma(_1300, _1330, _1310);
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1408 = _1388 + _1406;
    float _1410 = _1228 + 0.5;
    float _1412 = float(_1400);
    float _1414 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1100);
    float _1416 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _742);
    float _1418 = fma(_1408, _1408, _1390);
    float _1420 = fma(_1300, _1410, _1404);
    float _1422 = -_1414;
    float _1424 = fma(_1402, _1412, _1422);
    float _1426 = _1234 + (-0.5);
    float _1428 = -_1416;
    float _1430 = _1428 + 1.0;
    float _1432 = _1418 + _1392;
    float _1434 = -_1402;
    float _1436 = fma(_1434, _1426, _1424);
    float _1438 = -_1430;
    float _1440 = fma(_1228, _1438, _1420);
    float _1442 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1184);
    float _1444 = sqrt(_1432);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1458 = -_1442;
    float _1460 = _1458 + 1.0;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1234, _1460, _1436);
    out.m_64.x = _1466;
    out.m_64.y = _1468;
    out.m_64.z = _1470;
    out.m_64.w = _1462;
    bool _1480 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1482 = isnan(_1444);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1488 = _1484 || _1486;
    out.m_66.x = _1472;
    out.m_66.y = _1474;
    out.m_66.z = _1476;
    out.m_66.w = _1464;
    out.m_68.x = _1440;
    out.m_68.y = _1478;
    float _1490 = _1460;
    float _1492 = _1474;
    float _1494 = _1476;
    if (!_1488)
    {
        _1490 = 1.0;
    }
    float _1496 = _1490;
    bool _1498 = !_1488;
    float _1500 = _1496;
    if (!_1498)
    {
        bool _1502 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1504 = isnan(_1444);
        bool _1506 = _1502 || _1504;
        bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1510 = _1506 || _1508;
        if (!_1510)
        {
            float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1514 = _1444 + _1512;
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1524 = 1.0 / _1518;
            float _1526 = _1514 * _1524;
            float _1528 = fma(_1526, _1522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1500 = _1528;
            _1530 = true;
        }
        else
        {
            bool _1532 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1534 = isnan(_1444);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1540 = _1536 || _1538;
            if (!_1540)
            {
                float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1544 = _1444 + _1542;
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1554 = 1.0 / _1548;
                float _1556 = _1544 * _1554;
                float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1500 = _1558;
                _1530 = true;
            }
            else
            {
                _1500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1530 = false;
    float _1560 = _1500;
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1564 = _1388 + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1568 = _1394 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1572 = _1396 + _1570;
    float _1574 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1576 = fma(_1568, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1578 = fma(_1572, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1574 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1576 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1592;
    float _1624 = _1618;
    float _1626 = _1582;
    float _1628 = _1602;
    if (_1614)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1630;
    }
    float _1632 = _1620;
    if (_1614)
    {
        float _1634 = rsqrt(_1610);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (_1614)
    {
        float _1640 = _1618 * _1632;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1614)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1492 = _1644;
    }
    float _1646 = _1492;
    float _1648 = _1632;
    if (_1614)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1598;
    float _1662 = _1658;
    if (_1614)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1600;
    float _1672 = -_1658;
    float _1674 = fma(_1582, _1670, _1672);
    if (_1614)
    {
        float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1676;
    }
    float _1678 = _1662;
    float _1680 = sqrt(_1596);
    float _1682 = _1654;
    float _1684 = _1678;
    if (_1614)
    {
        float _1686 = fma(_1654, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1494 = _1686;
    }
    float _1688 = _1494;
    if (!_1614)
    {
        _1682 = _1604;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (_1614)
    {
        float _1694 = _1668 + (-1.0);
        _1684 = _1694;
    }
    float _1696 = _1684;
    float _1698 = _1696;
    if (_1614)
    {
        float _1700 = _1636 * _1688;
        _1322 = _1700;
    }
    float _1702 = _1322;
    if (!_1614)
    {
        _1638 = _1674;
    }
    float _1704 = _1638;
    float _1706 = _1704;
    if (_1614)
    {
        float _1708 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1708;
    }
    float _1710 = _1626;
    float _1712 = _1710;
    if (_1614)
    {
        float _1714 = _1602 * _1702;
        _1628 = _1714;
    }
    float _1716 = _1628;
    if (!_1614)
    {
        _1698 = _1606;
    }
    float _1718 = _1698;
    float _1720 = _1718;
    if (_1614)
    {
        float _1722 = _1604 * _1702;
        _1692 = _1722;
    }
    float _1724 = _1692;
    if (_1614)
    {
        float _1726 = fma(_1674, _1668, _1710);
        _1706 = _1726;
    }
    float _1728 = _1706;
    if (_1614)
    {
        float _1730 = _1716 * _1716;
        _1720 = _1730;
    }
    float _1732 = _1720;
    if (!_1614)
    {
        _1712 = _1608;
    }
    float _1734 = _1712;
    float _1736 = _1734;
    if (_1614)
    {
        float _1738 = _1724 * _1724;
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_1728, _1728, _1732);
    float _1744 = _1742 + _1740;
    float _1746 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1750 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1748);
    float _1752 = precise::clamp(_1750, 0.0, 1.0);
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1756 = rsqrt(_1744);
    float _1758 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1746);
    float _1760 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1762 = -_1752;
    float _1764 = _1762 + 1.0;
    float _1766 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1758);
    float _1768 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1770 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1772 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1774 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1776 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1768);
    float _1778 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1770);
    float _1780 = abs(_1764);
    float _1782 = log2(_1780);
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1786 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1772);
    float _1788 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1776);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = -_1784;
    float _1794 = fma(_1792, _1754, 1.0);
    float _1796 = _1756 * _1716;
    float _1798 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1800 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1802 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1804 = _1756 * _1728;
    float _1806 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1808 = _1756 * _1724;
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1802);
    float _1812 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1814 = -_1806;
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1814);
    float _1818 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1820 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1810);
    float _1822 = log2(_1794);
    float _1824 = -_1808;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1816);
    float _1828 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1820);
    float _1832 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1834 = fma(_1826, -0.5, 0.5);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1838 = fma(_1826, 0.5, 0.5);
    float _1840 = exp2(_1818);
    float _1842 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1832);
    float _1844 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1846 = _1804 + 1.0;
    float _1848 = fma(_1838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1842);
    float _1852 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1854 = 1.0 / _1830;
    float _1856 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1850);
    float _1858 = fma(_1838, _1848, -0.212114393711090087890625);
    float _1860 = _1822 * 0.693147182464599609375;
    float _1862 = fma(_1838, _1858, 1.570728778839111328125);
    float _1864 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1866 = sqrt(_1834);
    float _1868 = -_1804;
    float _1870 = fma(_1840, _1846, _1868);
    float _1872 = fma(_1870, 0.5, 0.5);
    float _1874 = _1852 * _1854;
    float _1876 = _1856 * _1854;
    float _1878 = fma(_1874, 0.5, 0.5);
    float _1880 = fma(_1876, -0.5, 0.5);
    float _1882 = _1866 * 0.636619746685028076171875;
    float3 _4749 = float3(_1878, _1880, _1864);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4749, float3(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4749, float3(0.0), isnan(_4749)), level(0.0)).x;
    float _1886 = -_1862;
    float _1888 = fma(_1882, _1886, 1.0);
    float3 _4765 = float3(_1878, _1880, _1864);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4765, float3(0.0), isnan(_4765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4765, float3(0.0), isnan(_4765)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _4782 = float2(_1888, _1872);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4782, float2(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4782, float2(0.0), isnan(_4782)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1913 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1915 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1913);
    float _1917 = exp2(_1911);
    float _1919 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1915);
    float _1921 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1923 = _1921 + _1830;
    out.gl_Position.x = _1852;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _1921;
    out.gl_Position.w = _1830;
    float _1925 = _1923 * 0.5;
    float _1927 = -_1917;
    float _1929 = _1927 + 1.0;
    float _1931 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1933 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1925;
    out.m_70.w = _1830;
    out.m_47.x = _1931;
    float _1935 = _1933 * _1884;
    float _1937 = -_1933;
    float _1939 = _1937 + 1.0;
    float _1941 = _1899 * _1935;
    float _1943 = _1899 * _1939;
    float _1945 = _1909 * _1935;
    float _1947 = fma(_1905, _1941, _1893);
    float _1949 = fma(_1907, _1941, _1895);
    float _1951 = fma(_1899, _1945, _1897);
    out.m_72.x = _1947;
    out.m_72.y = _1949;
    out.m_72.z = _1951;
    out.m_72.w = _1943;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1530 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2008 = as_type<float>(_107);
        out.gl_Position.z = _2008;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_143);
        out.gl_Position.z = _2077;
    }
    if (_135)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _147 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _147);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _147 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _175 = _261;
    }
    float _263 = _175;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _161, _267);
    float _275 = fma(_263, _163, _269);
    float _277 = fma(_263, _165, _271);
    float _279 = fma(_273, _149, _167);
    float _281 = fma(_275, _149, _169);
    float _283 = fma(_277, _149, _171);
    bool _285 = !_265;
    float _305;
    float _307;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _295 = _293 * _289;
        float _297 = float(_91);
        float _299 = floor(_295);
        float _301 = -_299;
        float _303 = _295 + _301;
        _305 = _297;
        _307 = _303;
        _309 = true;
    }
    else
    {
        float _311 = float(_91);
        float _313 = 1.0 / _311;
        float _315 = _125 * _313;
        _305 = _311;
        _307 = _315;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _323 = int(_321);
    float _325 = in.m_56.x;
    float _327 = in.m_56.y;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _331 = int(_329);
    float _333 = float(_323);
    float _335 = 1.0 / _317;
    float _337 = float(uint(_331));
    float _339 = 1.0 / _333;
    int _341 = ~_331;
    int _343 = _341 + 1;
    float _345 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _347 = ~_331;
    int _349 = _347 + 1;
    int _351 = _331 + (-1);
    int _353 = ~_331;
    int _355 = _353 + 1;
    float _357 = 1.0 / _337;
    float _359 = _125 * _339;
    float _361 = trunc(_359);
    int _363 = int(_361);
    int _365 = as_type<int>(_357) + (-2);
    float _367 = float(uint(_363));
    float _369 = as_type<float>(_365) * _367;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    float _378 = float(_331);
    int _380 = _343 * int(_376);
    int _382 = _380 + _363;
    float _384 = float(_363);
    float _386 = float(uint(_382));
    bool _388 = _384 >= _378;
    bool _390 = isnan(_384);
    bool _392 = _388 || _390;
    bool _394 = isnan(_378);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = as_type<float>(_365) * _386;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _404 = _402 != 0;
    float _406 = trunc(_398);
    int _408 = int(_406);
    bool _410 = !_404;
    float _412 = _410 ? 7.345489978790283203125 : 1.0;
    float _414 = _412 * _325;
    float _416 = trunc(_400);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    float _422 = floor(_414);
    int _424 = int(_376) + int(_420);
    int _426 = _349 * _424;
    int _428 = _426 + _363;
    float _430 = -_422;
    float _432 = _414 + _430;
    bool _434 = uint(_428) >= uint(_331);
    float _436 = _432 * _378;
    float _438 = _125 * _378;
    bool _440 = !_434;
    int _442 = _440 ? 0 : (-1);
    bool _444 = _331 == 0;
    float _446 = _438 * _335;
    int _448 = ~_424;
    int _450 = _448 + _442;
    int _452 = _450 + 1;
    int _454 = ~_408;
    int _456 = _454 + 1;
    int _458 = _456 + 1;
    float _460 = trunc(_436);
    int _462 = int(_460);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _474 = _472 != 0;
    int _476 = _331 * _452;
    int _478 = _476 + _363;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _486 = _484 != 0;
    bool _488 = !_444;
    int _490 = _488 ? _478 : (-1);
    float _492 = trunc(_446);
    int _494 = int(_492);
    bool _496 = !_482;
    int _498 = _496 ? 0 : 1;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _502 = _500 != 0;
    int _504 = _490 * _458;
    bool _506 = !_470;
    int _508 = _506 ? 0 : 1;
    int _510 = _408 * _351;
    int _512 = _510 + _504;
    bool _514 = !_466;
    int _516 = _514 ? 0 : 1;
    int _518 = abs(_508);
    bool _520 = !_474;
    int _522 = _520 ? 0 : 1;
    int _524 = abs(_498);
    int _526 = abs(_516);
    bool _528 = !_486;
    int _530 = _528 ? 0 : 1;
    int _532 = _462 * _524;
    int _534 = _532 + _363;
    int _536 = abs(_522);
    int _538 = _512 * _518;
    int _540 = abs(_530);
    int _542 = _494 * _526;
    int _544 = _542 + _538;
    float _546 = float(uint(_534));
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _550 = _548 != 0;
    int _552 = _534 * _536;
    int _554 = _552 + _544;
    int _556 = _462 * _540;
    int _558 = _556 + _554;
    float _560 = in.m_58.x;
    float _562 = in.m_58.y;
    float _564 = in.m_58.z;
    float _566 = float(uint(_558));
    float _568 = as_type<float>(_365) * _566;
    int _570 = ~_331;
    int _572 = _570 + 1;
    float _574 = trunc(_568);
    float _576 = precise::max(_574, 0.0);
    uint _578 = uint(_576);
    float _580 = in.m_60.x;
    float _582 = in.m_60.y;
    float _584 = in.m_60.z;
    int _586 = _572 * int(_578);
    int _588 = _586 + _558;
    float _590 = float(uint(_588));
    float _592 = as_type<float>(_365) * _590;
    float _594 = trunc(_592);
    float _596 = precise::max(_594, 0.0);
    uint _598 = uint(_596);
    float _600 = as_type<float>(_365) * _546;
    float _602 = trunc(_600);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    int _608 = int(_578) + int(_598);
    float _610 = in.m_62.x;
    float _612 = in.m_62.y;
    float _614 = in.m_62.z;
    int _616 = _355 * _608;
    int _618 = _616 + _558;
    bool _620 = uint(_618) >= uint(_331);
    bool _622 = !_620;
    int _624 = _622 ? 0 : (-1);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _628 = _626 != 0;
    int _630 = ~_608;
    int _632 = _630 + _624;
    int _634 = _632 + 1;
    int _636 = _331 * _634;
    int _638 = _636 + _558;
    float _640 = _281 * _562;
    int _642 = ~_331;
    int _644 = _642 + 1;
    float _646 = _281 * _612;
    float _648 = _281 * _582;
    bool _650 = !_444;
    int _652 = _650 ? _638 : (-1);
    float _654 = fma(_279, _560, _640);
    float _656 = fma(_279, _610, _646);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    int _662 = _652 >> 31;
    float _664 = fma(_283, _614, _656);
    int _666 = _644 * int(_606);
    int _668 = _666 + _534;
    int _670 = _662 & 3;
    float _672 = 1.0 / _660;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _680 = _652 + _670;
    float _682 = fma(_279, _580, _648);
    float _684 = float(uint(_668));
    float _686 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _688 = _652 & 3;
    bool _690 = _688 != 0;
    float _692 = 1.0 / _676;
    int _694 = _680 >> 2;
    float _696 = as_type<float>(_365) * _684;
    float _698 = -_678;
    float _700 = fma(_686, 2.0, _698);
    float _702 = fma(_283, _584, _682);
    int _704 = _694 << 4;
    int _706 = _704 + 368;
    float _708 = fma(_283, _564, _654);
    int _710 = _652 & 3;
    bool _712 = _710 != 0;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    uint _716 = uint(int(uint(_706) >> uint(2)));
    uint _718 = uint(int(uint(int(_716)) >> uint(2)));
    int _720 = int(_716) & 3;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[int(_718)][_720];
    int _724 = int(_716) + 1;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    int _728 = _724 & 3;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[int(_726)][_728];
    int _732 = _690 ? 0 : 1;
    float _734 = trunc(_696);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    bool _740 = _325 > 0.5;
    float _742 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _714);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _746 = _319 + _744;
    bool _748 = uint(_710) > 1u;
    int _750 = _706 + 8;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[int(_762)][_764];
    int _768 = ~_732;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _746 * _672;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _782 = _319 + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _786 = _319 + _784;
    float _788 = _708 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = 1.0 / _778;
    float _792 = _782 * _692;
    bool _794 = !_712;
    int _796 = _794 ? 0 : 1;
    bool _798 = _710 != 3;
    int _800 = _772;
    if (!_748)
    {
        int _802 = ~_732;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    bool _808 = uint(_710) >= 2u;
    int _810 = int(_606) + int(_738);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _812;
    int _816 = ~_331;
    int _818 = _816 + 1;
    int _820 = _808 ? 0 : 1;
    float _822 = fma(_814, _774, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _824 = abs(_806);
    int _826 = _818 * _810;
    int _828 = _826 + _534;
    int _830 = ~_820;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = _786 * _790;
    int _838 = _834;
    if (_798)
    {
        int _840 = ~_820;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _850 = uint(_828) >= uint(_331);
    int _852 = abs(_844);
    float _854 = fma(_848, _792, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _856 = ~_824;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = abs(_796);
    int _864 = ~_862;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    int _870 = _860 * as_type<int>(_730);
    bool _872 = !_850;
    int _874 = _872 ? 0 : (-1);
    float _876 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _878 = int(_876);
    int _880 = ~_852;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    int _886 = _868 * as_type<int>(_722);
    int _888 = _886 + _870;
    bool _890 = _710 != 3;
    bool _892 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _894 = isnan(_319);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    int _904 = _884 * as_type<int>(_758);
    int _906 = _904 + _888;
    int _908 = ~_810;
    int _910 = _908 + _874;
    int _912 = _910 + 1;
    bool _914 = !_890;
    int _916 = _914 ? 0 : (-1);
    float _918 = -_902;
    float _920 = _918 + 1.0;
    bool _922 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _924 = isnan(_319);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    int _934 = _331 * _912;
    int _936 = _934 + _534;
    bool _938 = !_550;
    int _940 = _938 ? 0 : 1;
    int _942 = abs(_916);
    float _944 = float(uint(_878));
    bool _946 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _948 = isnan(_319);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    bool _958 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _960 = isnan(_319);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _932 * _920;
    float _972 = -_932;
    float _974 = _972 + 1.0;
    int _976 = abs(_940);
    float _978 = 1.0 / _944;
    int _980 = ~_942;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = _968 * _974;
    float _988 = -_968;
    float _990 = _988 + 1.0;
    int _992 = ~_976;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _984 * as_type<int>(_766);
    int _1000 = _998 + _906;
    int _1002 = abs(_878);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1012 = _956 * _990;
    bool _1014 = !_444;
    int _1016 = _1014 ? _936 : (-1);
    int _1018 = _1000 * _996;
    float _1020 = fma(_1010, _792, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1022 = fma(_1006, _774, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1024 = float(uint(_1002));
    float _1026 = _822 * _1012;
    int _1028 = _1016 * _976;
    int _1030 = _1028 + _1018;
    float _1032 = _1022 * _1012;
    float _1034 = 1.0 / _1024;
    float _1036 = in.m_54.x;
    float _1038 = in.m_54.y;
    int _1040 = as_type<int>(_978) + (-2);
    float _1042 = -_956;
    float _1044 = _1042 + 1.0;
    float _1046 = float(uint(_1030));
    float _1048 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1026);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1050;
    float _1054 = as_type<float>(_1040) * _1046;
    int _1056 = abs(_1030);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1058;
    float _1062 = fma(_1052, _836, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1064 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1032);
    float _1066 = trunc(_1054);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    int _1072 = as_type<int>(_1034) + (-2);
    float _1074 = fma(_1060, _836, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1076 = float(uint(_1056));
    float _1078 = fma(_854, _986, _1048);
    float _1080 = fma(_1020, _986, _1064);
    int _1082 = ~_1002;
    int _1084 = _1082 + 1;
    float _1086 = fma(_1074, _970, _1078);
    float _1088 = as_type<float>(_1072) * _1076;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1092 = fma(_1062, _970, _1080);
    int _1094 = ~_878;
    int _1096 = _1094 + 1;
    float _1098 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1086);
    float _1100 = fma(_345, -2.0, _1090);
    float _1102 = trunc(_1088);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1092);
    float _1110 = _1098 * _1038;
    int _1112 = _1096 * int(_1070);
    int _1114 = _1112 + _1030;
    float _1116 = _1108 * _1036;
    float _1118 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1120 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1122 = float(uint(_1114));
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = _1120 * _1118;
    float _1130 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1132 = as_type<float>(_1040) * _1122;
    float _1134 = _1126 * _1124;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1140 = _1084 * int(_1106);
    int _1142 = _1140 + _1056;
    float _1144 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1136);
    float _1146 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1138);
    float _1148 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = float(uint(_1142));
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1144);
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1158 = _664 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1160 = _702 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1164 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1166 = as_type<float>(_1072) * _1150;
    bool _1168 = _327 > 0.5;
    float _1170 = trunc(_1132);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = _1158 + _1162;
    float _1178 = _1160 + _1164;
    int _1180 = ~_878;
    int _1182 = _1180 + 1;
    float _1184 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1156);
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1188 = _1176 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1192 = _1178 + _1190;
    int _1194 = ~_1002;
    int _1196 = _1194 + 1;
    float _1198 = trunc(_1166);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = _1188 * _1188;
    float _1206 = _1192 * _1192;
    float _1208 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1210 = -_199;
    int _1212 = _740 ? as_type<int>(_1210) : as_type<int>(_199);
    float _1214 = _1204 + _1206;
    float _1216 = -_203;
    int _1218 = _1168 ? as_type<int>(_1216) : as_type<int>(_203);
    float _1220 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1208);
    int _1222 = int(_1070) + int(_1174);
    float _1224 = sqrt(_1214);
    bool _1226 = !_502;
    float _1228 = _1226 ? _199 : as_type<float>(_1212);
    float _1230 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1232 = !_628;
    float _1234 = _1232 ? _203 : as_type<float>(_1218);
    int _1236 = _1182 * _1222;
    int _1238 = _1236 + _1030;
    int _1240 = _1030 ^ _878;
    float _1242 = _788 + _1230;
    int _1244 = int(_1106) + int(_1202);
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1248 = uint(_1238) >= uint(_878);
    uint _1250 = uint(int(uint(_1240) >> uint(31)));
    int _1252 = _1196 * _1244;
    int _1254 = _1252 + _1056;
    bool _1256 = !_1248;
    int _1258 = _1256 ? 0 : (-1);
    int _1260 = ~int(_1250);
    int _1262 = _1260 + 1;
    bool _1264 = uint(_1254) >= uint(_1002);
    float _1266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1268 = _1224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1270 = ~_1222;
    int _1272 = _1270 + _1258;
    int _1274 = _1272 + 1;
    bool _1276 = !_1264;
    float _1278 = _1276 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _1280 = _878 == 0;
    int _1282 = _878 * _1274;
    int _1284 = _1282 + _1030;
    int _1286 = ~as_type<int>(_1278);
    int _1288 = _1244 + _1286;
    int _1290 = _1288 + 1;
    bool _1292 = _878 == 0;
    int _1294 = _1290 ^ _1262;
    bool _1296 = !_1280;
    int _1298 = _1296 ? _1284 : (-1);
    float _1300 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1302 = ~_1262;
    int _1304 = _1302 + _1294;
    int _1306 = _1304 + 1;
    float _1308 = -_125;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _700);
    float _1312 = as_type<float>(_878);
    float _1314 = _1266;
    float _1316 = _1278;
    float _1318 = _1176;
    float _1320 = _1178;
    float _1322 = _1224;
    if (!_1268)
    {
        _1312 = _1206;
    }
    float _1324 = _1312;
    float _1326 = _1324;
    if (!_1268)
    {
        _1314 = _1204;
    }
    float _1328 = _1314;
    float _1330 = float(_1298);
    float _1332 = _1328;
    if (!_1268)
    {
        _1316 = _1242;
    }
    float _1334 = _1316;
    bool _1336 = !_1268;
    float _1338 = _1334;
    if (!_1336)
    {
        float _1340 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1344 = _1224 + _1342;
        float _1346 = rsqrt(_1214);
        float _1348 = _1344 * _1340;
        float _1350 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1352 = _1348 * 0.15915493667125701904296875;
        float _1354 = _1352 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        float _1358 = _1352 * 6.283185482025146484375;
        float _1360 = cos(_1358);
        float _1362 = fma(_1356, _1350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1364 = _1346 * _1362;
        float _1366 = _1360 + (-1.0);
        float _1368 = fma(_1188, _1364, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1370 = fma(_1192, _1364, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1372 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1376 = _1368 + _1374;
        float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1380 = _1370 + _1378;
        float _1382 = fma(_1242, _1360, _1372);
        float _1384 = _1376 * _1376;
        float _1386 = _1380 * _1380;
        _1338 = _1382;
        _1332 = _1384;
        _1326 = _1386;
        _1318 = _1368;
        _1320 = _1370;
    }
    float _1388 = _1338;
    float _1390 = _1332;
    float _1392 = _1326;
    float _1394 = _1318;
    float _1396 = _1320;
    bool _1398 = !_1292;
    int _1400 = _1398 ? _1306 : (-1);
    float _1402 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1404 = fma(_1300, _1330, _1310);
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1408 = _1388 + _1406;
    float _1410 = _1228 + 0.5;
    float _1412 = float(_1400);
    float _1414 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1100);
    float _1416 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _742);
    float _1418 = fma(_1408, _1408, _1390);
    float _1420 = fma(_1300, _1410, _1404);
    float _1422 = -_1414;
    float _1424 = fma(_1402, _1412, _1422);
    float _1426 = _1234 + (-0.5);
    float _1428 = -_1416;
    float _1430 = _1428 + 1.0;
    float _1432 = _1418 + _1392;
    float _1434 = -_1402;
    float _1436 = fma(_1434, _1426, _1424);
    float _1438 = -_1430;
    float _1440 = fma(_1228, _1438, _1420);
    float _1442 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1184);
    float _1444 = sqrt(_1432);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1458 = -_1442;
    float _1460 = _1458 + 1.0;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1234, _1460, _1436);
    out.m_64.x = _1466;
    out.m_64.y = _1468;
    out.m_64.z = _1470;
    out.m_64.w = _1462;
    bool _1480 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1482 = isnan(_1444);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1488 = _1484 || _1486;
    out.m_66.x = _1472;
    out.m_66.y = _1474;
    out.m_66.z = _1476;
    out.m_66.w = _1464;
    out.m_68.x = _1440;
    out.m_68.y = _1478;
    float _1490 = _1460;
    float _1492 = _1474;
    float _1494 = _1476;
    if (!_1488)
    {
        _1490 = 1.0;
    }
    float _1496 = _1490;
    bool _1498 = !_1488;
    float _1500 = _1496;
    if (!_1498)
    {
        bool _1502 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1504 = isnan(_1444);
        bool _1506 = _1502 || _1504;
        bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1510 = _1506 || _1508;
        if (!_1510)
        {
            float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1514 = _1444 + _1512;
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1524 = 1.0 / _1518;
            float _1526 = _1514 * _1524;
            float _1528 = fma(_1526, _1522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1500 = _1528;
            _1530 = true;
        }
        else
        {
            bool _1532 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1534 = isnan(_1444);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1540 = _1536 || _1538;
            if (!_1540)
            {
                float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1544 = _1444 + _1542;
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1554 = 1.0 / _1548;
                float _1556 = _1544 * _1554;
                float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1500 = _1558;
                _1530 = true;
            }
            else
            {
                _1500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1530 = false;
    float _1560 = _1500;
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1564 = _1388 + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1568 = _1394 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1572 = _1396 + _1570;
    float _1574 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1576 = fma(_1568, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1578 = fma(_1572, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1574 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1576 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1592;
    float _1624 = _1618;
    float _1626 = _1582;
    float _1628 = _1602;
    if (_1614)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1630;
    }
    float _1632 = _1620;
    if (_1614)
    {
        float _1634 = rsqrt(_1610);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (_1614)
    {
        float _1640 = _1618 * _1632;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1614)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1492 = _1644;
    }
    float _1646 = _1492;
    float _1648 = _1632;
    if (_1614)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1598;
    float _1662 = _1658;
    if (_1614)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1600;
    float _1672 = -_1658;
    float _1674 = fma(_1582, _1670, _1672);
    if (_1614)
    {
        float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1676;
    }
    float _1678 = _1662;
    float _1680 = sqrt(_1596);
    float _1682 = _1654;
    float _1684 = _1678;
    if (_1614)
    {
        float _1686 = fma(_1654, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1494 = _1686;
    }
    float _1688 = _1494;
    if (!_1614)
    {
        _1682 = _1604;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (_1614)
    {
        float _1694 = _1668 + (-1.0);
        _1684 = _1694;
    }
    float _1696 = _1684;
    float _1698 = _1696;
    if (_1614)
    {
        float _1700 = _1636 * _1688;
        _1322 = _1700;
    }
    float _1702 = _1322;
    if (!_1614)
    {
        _1638 = _1674;
    }
    float _1704 = _1638;
    float _1706 = _1704;
    if (_1614)
    {
        float _1708 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1708;
    }
    float _1710 = _1626;
    float _1712 = _1710;
    if (_1614)
    {
        float _1714 = _1602 * _1702;
        _1628 = _1714;
    }
    float _1716 = _1628;
    if (!_1614)
    {
        _1698 = _1606;
    }
    float _1718 = _1698;
    float _1720 = _1718;
    if (_1614)
    {
        float _1722 = _1604 * _1702;
        _1692 = _1722;
    }
    float _1724 = _1692;
    if (_1614)
    {
        float _1726 = fma(_1674, _1668, _1710);
        _1706 = _1726;
    }
    float _1728 = _1706;
    if (_1614)
    {
        float _1730 = _1716 * _1716;
        _1720 = _1730;
    }
    float _1732 = _1720;
    if (!_1614)
    {
        _1712 = _1608;
    }
    float _1734 = _1712;
    float _1736 = _1734;
    if (_1614)
    {
        float _1738 = _1724 * _1724;
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_1728, _1728, _1732);
    float _1744 = _1742 + _1740;
    float _1746 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1750 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1748);
    float _1752 = precise::clamp(_1750, 0.0, 1.0);
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1756 = rsqrt(_1744);
    float _1758 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1746);
    float _1760 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1762 = -_1752;
    float _1764 = _1762 + 1.0;
    float _1766 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1758);
    float _1768 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1770 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1772 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1774 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1776 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1768);
    float _1778 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1770);
    float _1780 = abs(_1764);
    float _1782 = log2(_1780);
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1786 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1772);
    float _1788 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1776);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = -_1784;
    float _1794 = fma(_1792, _1754, 1.0);
    float _1796 = _1756 * _1716;
    float _1798 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1800 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1802 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1804 = _1756 * _1728;
    float _1806 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1808 = _1756 * _1724;
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1802);
    float _1812 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1814 = -_1806;
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1814);
    float _1818 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1820 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1810);
    float _1822 = log2(_1794);
    float _1824 = -_1808;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1816);
    float _1828 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1820);
    float _1832 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1834 = fma(_1826, -0.5, 0.5);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1838 = fma(_1826, 0.5, 0.5);
    float _1840 = exp2(_1818);
    float _1842 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1832);
    float _1844 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1846 = _1804 + 1.0;
    float _1848 = fma(_1838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1842);
    float _1852 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1854 = 1.0 / _1830;
    float _1856 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1850);
    float _1858 = fma(_1838, _1848, -0.212114393711090087890625);
    float _1860 = _1822 * 0.693147182464599609375;
    float _1862 = fma(_1838, _1858, 1.570728778839111328125);
    float _1864 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1866 = sqrt(_1834);
    float _1868 = -_1804;
    float _1870 = fma(_1840, _1846, _1868);
    float _1872 = fma(_1870, 0.5, 0.5);
    float _1874 = _1852 * _1854;
    float _1876 = _1856 * _1854;
    float _1878 = fma(_1874, 0.5, 0.5);
    float _1880 = fma(_1876, -0.5, 0.5);
    float _1882 = _1866 * 0.636619746685028076171875;
    float3 _4749 = float3(_1878, _1880, _1864);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4749, float3(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4749, float3(0.0), isnan(_4749)), level(0.0)).x;
    float _1886 = -_1862;
    float _1888 = fma(_1882, _1886, 1.0);
    float3 _4765 = float3(_1878, _1880, _1864);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4765, float3(0.0), isnan(_4765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4765, float3(0.0), isnan(_4765)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _4782 = float2(_1888, _1872);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4782, float2(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4782, float2(0.0), isnan(_4782)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1913 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1915 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1913);
    float _1917 = exp2(_1911);
    float _1919 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1915);
    float _1921 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1923 = _1921 + _1830;
    out.gl_Position.x = _1852;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _1921;
    out.gl_Position.w = _1830;
    float _1925 = _1923 * 0.5;
    float _1927 = -_1917;
    float _1929 = _1927 + 1.0;
    float _1931 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1933 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1925;
    out.m_70.w = _1830;
    out.m_47.x = _1931;
    float _1935 = _1933 * _1884;
    float _1937 = -_1933;
    float _1939 = _1937 + 1.0;
    float _1941 = _1899 * _1935;
    float _1943 = _1899 * _1939;
    float _1945 = _1909 * _1935;
    float _1947 = fma(_1905, _1941, _1893);
    float _1949 = fma(_1907, _1941, _1895);
    float _1951 = fma(_1899, _1945, _1897);
    out.m_72.x = _1947;
    out.m_72.y = _1949;
    out.m_72.z = _1951;
    out.m_72.w = _1943;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1530 = false;
    bool _309 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _2008 = as_type<float>(_107);
        out.gl_Position.z = _2008;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_49.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_121)
    {
        float _127 = float(_91);
        _101 = _127;
    }
    float _129 = _101;
    bool _131 = _125 >= _129;
    bool _133 = !_121;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _109 = as_type<int>(_141);
    }
    int _143 = _109;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2077 = as_type<float>(_143);
        out.gl_Position.z = _2077;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_54.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _147;
    if (!_159)
    {
        float _177 = _147 * _147;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_159)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    int _189 = as_type<int>(_145) & 1;
    bool _191 = _189 != 0;
    int _193 = as_type<int>(_145) & 2;
    bool _195 = _193 != 0;
    bool _197 = !_191;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_195;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_159;
    float _207 = _187;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _147 * _211;
        float _221 = 1.0 / _215;
        float _223 = _217 * 0.693147182464599609375;
        float _225 = exp2(_219);
        float _227 = 1.0 / _223;
        float _229 = _225 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _227, _147);
        float _235 = _233 * _221;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
    }
    float _239 = _207;
    bool _241 = !_159;
    if (!_241)
    {
        float _243 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = log2(_243);
        float _247 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _249 = _247 + 1.0;
        float _251 = 1.0 / _249;
        float _253 = _147 * _245;
        float _255 = exp2(_253);
        float _257 = -_255;
        float _259 = _257 + 1.0;
        float _261 = _259 * _251;
        _175 = _261;
    }
    float _263 = _175;
    bool _265 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _267 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _269 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _273 = fma(_263, _161, _267);
    float _275 = fma(_263, _163, _269);
    float _277 = fma(_263, _165, _271);
    float _279 = fma(_273, _149, _167);
    float _281 = fma(_275, _149, _169);
    float _283 = fma(_277, _149, _171);
    bool _285 = !_265;
    float _305;
    float _307;
    if (!_285)
    {
        float _287 = in.m_56.x;
        float _289 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _291 = _287 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _293 = fma(_291, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _295 = _293 * _289;
        float _297 = float(_91);
        float _299 = floor(_295);
        float _301 = -_299;
        float _303 = _295 + _301;
        _305 = _297;
        _307 = _303;
        _309 = true;
    }
    else
    {
        float _311 = float(_91);
        float _313 = 1.0 / _311;
        float _315 = _125 * _313;
        _305 = _311;
        _307 = _315;
    }
    _309 = false;
    float _317 = _305;
    float _319 = _307;
    float _321 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _323 = int(_321);
    float _325 = in.m_56.x;
    float _327 = in.m_56.y;
    float _329 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _331 = int(_329);
    float _333 = float(_323);
    float _335 = 1.0 / _317;
    float _337 = float(uint(_331));
    float _339 = 1.0 / _333;
    int _341 = ~_331;
    int _343 = _341 + 1;
    float _345 = _327 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _347 = ~_331;
    int _349 = _347 + 1;
    int _351 = _331 + (-1);
    int _353 = ~_331;
    int _355 = _353 + 1;
    float _357 = 1.0 / _337;
    float _359 = _125 * _339;
    float _361 = trunc(_359);
    int _363 = int(_361);
    int _365 = as_type<int>(_357) + (-2);
    float _367 = float(uint(_363));
    float _369 = as_type<float>(_365) * _367;
    float _371 = trunc(_369);
    float _373 = precise::max(_371, 0.0);
    uint _376 = uint(_373);
    float _378 = float(_331);
    int _380 = _343 * int(_376);
    int _382 = _380 + _363;
    float _384 = float(_363);
    float _386 = float(uint(_382));
    bool _388 = _384 >= _378;
    bool _390 = isnan(_384);
    bool _392 = _388 || _390;
    bool _394 = isnan(_378);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = as_type<float>(_365) * _386;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _404 = _402 != 0;
    float _406 = trunc(_398);
    int _408 = int(_406);
    bool _410 = !_404;
    float _412 = _410 ? 7.345489978790283203125 : 1.0;
    float _414 = _412 * _325;
    float _416 = trunc(_400);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    float _422 = floor(_414);
    int _424 = int(_376) + int(_420);
    int _426 = _349 * _424;
    int _428 = _426 + _363;
    float _430 = -_422;
    float _432 = _414 + _430;
    bool _434 = uint(_428) >= uint(_331);
    float _436 = _432 * _378;
    float _438 = _125 * _378;
    bool _440 = !_434;
    int _442 = _440 ? 0 : (-1);
    bool _444 = _331 == 0;
    float _446 = _438 * _335;
    int _448 = ~_424;
    int _450 = _448 + _442;
    int _452 = _450 + 1;
    int _454 = ~_408;
    int _456 = _454 + 1;
    int _458 = _456 + 1;
    float _460 = trunc(_436);
    int _462 = int(_460);
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _466 = _464 != 0;
    int _468 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _470 = _468 != 0;
    int _472 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _474 = _472 != 0;
    int _476 = _331 * _452;
    int _478 = _476 + _363;
    int _480 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _482 = _480 != 0;
    int _484 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _486 = _484 != 0;
    bool _488 = !_444;
    int _490 = _488 ? _478 : (-1);
    float _492 = trunc(_446);
    int _494 = int(_492);
    bool _496 = !_482;
    int _498 = _496 ? 0 : 1;
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _502 = _500 != 0;
    int _504 = _490 * _458;
    bool _506 = !_470;
    int _508 = _506 ? 0 : 1;
    int _510 = _408 * _351;
    int _512 = _510 + _504;
    bool _514 = !_466;
    int _516 = _514 ? 0 : 1;
    int _518 = abs(_508);
    bool _520 = !_474;
    int _522 = _520 ? 0 : 1;
    int _524 = abs(_498);
    int _526 = abs(_516);
    bool _528 = !_486;
    int _530 = _528 ? 0 : 1;
    int _532 = _462 * _524;
    int _534 = _532 + _363;
    int _536 = abs(_522);
    int _538 = _512 * _518;
    int _540 = abs(_530);
    int _542 = _494 * _526;
    int _544 = _542 + _538;
    float _546 = float(uint(_534));
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _550 = _548 != 0;
    int _552 = _534 * _536;
    int _554 = _552 + _544;
    int _556 = _462 * _540;
    int _558 = _556 + _554;
    float _560 = in.m_58.x;
    float _562 = in.m_58.y;
    float _564 = in.m_58.z;
    float _566 = float(uint(_558));
    float _568 = as_type<float>(_365) * _566;
    int _570 = ~_331;
    int _572 = _570 + 1;
    float _574 = trunc(_568);
    float _576 = precise::max(_574, 0.0);
    uint _578 = uint(_576);
    float _580 = in.m_60.x;
    float _582 = in.m_60.y;
    float _584 = in.m_60.z;
    int _586 = _572 * int(_578);
    int _588 = _586 + _558;
    float _590 = float(uint(_588));
    float _592 = as_type<float>(_365) * _590;
    float _594 = trunc(_592);
    float _596 = precise::max(_594, 0.0);
    uint _598 = uint(_596);
    float _600 = as_type<float>(_365) * _546;
    float _602 = trunc(_600);
    float _604 = precise::max(_602, 0.0);
    uint _606 = uint(_604);
    int _608 = int(_578) + int(_598);
    float _610 = in.m_62.x;
    float _612 = in.m_62.y;
    float _614 = in.m_62.z;
    int _616 = _355 * _608;
    int _618 = _616 + _558;
    bool _620 = uint(_618) >= uint(_331);
    bool _622 = !_620;
    int _624 = _622 ? 0 : (-1);
    int _626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _628 = _626 != 0;
    int _630 = ~_608;
    int _632 = _630 + _624;
    int _634 = _632 + 1;
    int _636 = _331 * _634;
    int _638 = _636 + _558;
    float _640 = _281 * _562;
    int _642 = ~_331;
    int _644 = _642 + 1;
    float _646 = _281 * _612;
    float _648 = _281 * _582;
    bool _650 = !_444;
    int _652 = _650 ? _638 : (-1);
    float _654 = fma(_279, _560, _640);
    float _656 = fma(_279, _610, _646);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _658;
    int _662 = _652 >> 31;
    float _664 = fma(_283, _614, _656);
    int _666 = _644 * int(_606);
    int _668 = _666 + _534;
    int _670 = _662 & 3;
    float _672 = 1.0 / _660;
    float _674 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _676 = _674 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _680 = _652 + _670;
    float _682 = fma(_279, _580, _648);
    float _684 = float(uint(_668));
    float _686 = _325 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _688 = _652 & 3;
    bool _690 = _688 != 0;
    float _692 = 1.0 / _676;
    int _694 = _680 >> 2;
    float _696 = as_type<float>(_365) * _684;
    float _698 = -_678;
    float _700 = fma(_686, 2.0, _698);
    float _702 = fma(_283, _584, _682);
    int _704 = _694 << 4;
    int _706 = _704 + 368;
    float _708 = fma(_283, _564, _654);
    int _710 = _652 & 3;
    bool _712 = _710 != 0;
    float _714 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    uint _716 = uint(int(uint(_706) >> uint(2)));
    uint _718 = uint(int(uint(int(_716)) >> uint(2)));
    int _720 = int(_716) & 3;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[int(_718)][_720];
    int _724 = int(_716) + 1;
    uint _726 = uint(int(uint(_724) >> uint(2)));
    int _728 = _724 & 3;
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[int(_726)][_728];
    int _732 = _690 ? 0 : 1;
    float _734 = trunc(_696);
    float _736 = precise::max(_734, 0.0);
    uint _738 = uint(_736);
    bool _740 = _325 > 0.5;
    float _742 = fma(_325, (*spvDescriptorSet0.vp_c9)._m0[78].z, _714);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _746 = _319 + _744;
    bool _748 = uint(_710) > 1u;
    int _750 = _706 + 8;
    uint _752 = uint(int(uint(_750) >> uint(2)));
    uint _754 = uint(int(uint(int(_752)) >> uint(2)));
    int _756 = int(_752) & 3;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[int(_754)][_756];
    int _760 = int(_752) + 1;
    uint _762 = uint(int(uint(_760) >> uint(2)));
    int _764 = _760 & 3;
    float _766 = (*spvDescriptorSet0.vp_c9)._m0[int(_762)][_764];
    int _768 = ~_732;
    int _770 = _768 + 1;
    int _772 = _770 + 1;
    float _774 = _746 * _672;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _776;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _782 = _319 + _780;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _786 = _319 + _784;
    float _788 = _708 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _790 = 1.0 / _778;
    float _792 = _782 * _692;
    bool _794 = !_712;
    int _796 = _794 ? 0 : 1;
    bool _798 = _710 != 3;
    int _800 = _772;
    if (!_748)
    {
        int _802 = ~_732;
        int _804 = _802 + 1;
        _800 = _804;
    }
    int _806 = _800;
    bool _808 = uint(_710) >= 2u;
    int _810 = int(_606) + int(_738);
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _814 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _812;
    int _816 = ~_331;
    int _818 = _816 + 1;
    int _820 = _808 ? 0 : 1;
    float _822 = fma(_814, _774, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    int _824 = abs(_806);
    int _826 = _818 * _810;
    int _828 = _826 + _534;
    int _830 = ~_820;
    int _832 = _830 + 1;
    int _834 = _832 + 1;
    float _836 = _786 * _790;
    int _838 = _834;
    if (_798)
    {
        int _840 = ~_820;
        int _842 = _840 + 1;
        _838 = _842;
    }
    int _844 = _838;
    float _846 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _848 = _846 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _850 = uint(_828) >= uint(_331);
    int _852 = abs(_844);
    float _854 = fma(_848, _792, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    int _856 = ~_824;
    int _858 = _856 + 1;
    int _860 = _858 + 1;
    int _862 = abs(_796);
    int _864 = ~_862;
    int _866 = _864 + 1;
    int _868 = _866 + 1;
    int _870 = _860 * as_type<int>(_730);
    bool _872 = !_850;
    int _874 = _872 ? 0 : (-1);
    float _876 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _878 = int(_876);
    int _880 = ~_852;
    int _882 = _880 + 1;
    int _884 = _882 + 1;
    int _886 = _868 * as_type<int>(_722);
    int _888 = _886 + _870;
    bool _890 = _710 != 3;
    bool _892 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _894 = isnan(_319);
    bool _896 = _892 || _894;
    bool _898 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _900 = _896 || _898;
    float _902 = float(_900);
    int _904 = _884 * as_type<int>(_758);
    int _906 = _904 + _888;
    int _908 = ~_810;
    int _910 = _908 + _874;
    int _912 = _910 + 1;
    bool _914 = !_890;
    int _916 = _914 ? 0 : (-1);
    float _918 = -_902;
    float _920 = _918 + 1.0;
    bool _922 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _924 = isnan(_319);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    int _934 = _331 * _912;
    int _936 = _934 + _534;
    bool _938 = !_550;
    int _940 = _938 ? 0 : 1;
    int _942 = abs(_916);
    float _944 = float(uint(_878));
    bool _946 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _948 = isnan(_319);
    bool _950 = _946 || _948;
    bool _952 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _954 = _950 || _952;
    float _956 = float(_954);
    bool _958 = _319 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _960 = isnan(_319);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _966 = _962 || _964;
    float _968 = float(_966);
    float _970 = _932 * _920;
    float _972 = -_932;
    float _974 = _972 + 1.0;
    int _976 = abs(_940);
    float _978 = 1.0 / _944;
    int _980 = ~_942;
    int _982 = _980 + 1;
    int _984 = _982 + 1;
    float _986 = _968 * _974;
    float _988 = -_968;
    float _990 = _988 + 1.0;
    int _992 = ~_976;
    int _994 = _992 + 1;
    int _996 = _994 + 1;
    int _998 = _984 * as_type<int>(_766);
    int _1000 = _998 + _906;
    int _1002 = abs(_878);
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1004;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1010 = _1008 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1012 = _956 * _990;
    bool _1014 = !_444;
    int _1016 = _1014 ? _936 : (-1);
    int _1018 = _1000 * _996;
    float _1020 = fma(_1010, _792, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1022 = fma(_1006, _774, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1024 = float(uint(_1002));
    float _1026 = _822 * _1012;
    int _1028 = _1016 * _976;
    int _1030 = _1028 + _1018;
    float _1032 = _1022 * _1012;
    float _1034 = 1.0 / _1024;
    float _1036 = in.m_54.x;
    float _1038 = in.m_54.y;
    int _1040 = as_type<int>(_978) + (-2);
    float _1042 = -_956;
    float _1044 = _1042 + 1.0;
    float _1046 = float(uint(_1030));
    float _1048 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1026);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _1050;
    float _1054 = as_type<float>(_1040) * _1046;
    int _1056 = abs(_1030);
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1060 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1058;
    float _1062 = fma(_1052, _836, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _1064 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1032);
    float _1066 = trunc(_1054);
    float _1068 = precise::max(_1066, 0.0);
    uint _1070 = uint(_1068);
    int _1072 = as_type<int>(_1034) + (-2);
    float _1074 = fma(_1060, _836, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1076 = float(uint(_1056));
    float _1078 = fma(_854, _986, _1048);
    float _1080 = fma(_1020, _986, _1064);
    int _1082 = ~_1002;
    int _1084 = _1082 + 1;
    float _1086 = fma(_1074, _970, _1078);
    float _1088 = as_type<float>(_1072) * _1076;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1092 = fma(_1062, _970, _1080);
    int _1094 = ~_878;
    int _1096 = _1094 + 1;
    float _1098 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1086);
    float _1100 = fma(_345, -2.0, _1090);
    float _1102 = trunc(_1088);
    float _1104 = precise::max(_1102, 0.0);
    uint _1106 = uint(_1104);
    float _1108 = fma(_902, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1092);
    float _1110 = _1098 * _1038;
    int _1112 = _1096 * int(_1070);
    int _1114 = _1112 + _1030;
    float _1116 = _1108 * _1036;
    float _1118 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1120 = _1110 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1122 = float(uint(_1114));
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1126 = _1116 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1128 = _1120 * _1118;
    float _1130 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1132 = as_type<float>(_1040) * _1122;
    float _1134 = _1126 * _1124;
    float _1136 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1138 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1140 = _1084 * int(_1106);
    int _1142 = _1140 + _1056;
    float _1144 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1136);
    float _1146 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1138);
    float _1148 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1150 = float(uint(_1142));
    float _1152 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1144);
    float _1154 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1146);
    float _1156 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1158 = _664 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1160 = _702 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1162 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1164 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1166 = as_type<float>(_1072) * _1150;
    bool _1168 = _327 > 0.5;
    float _1170 = trunc(_1132);
    float _1172 = precise::max(_1170, 0.0);
    uint _1174 = uint(_1172);
    float _1176 = _1158 + _1162;
    float _1178 = _1160 + _1164;
    int _1180 = ~_878;
    int _1182 = _1180 + 1;
    float _1184 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1156);
    float _1186 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1188 = _1176 + _1186;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1192 = _1178 + _1190;
    int _1194 = ~_1002;
    int _1196 = _1194 + 1;
    float _1198 = trunc(_1166);
    float _1200 = precise::max(_1198, 0.0);
    uint _1202 = uint(_1200);
    float _1204 = _1188 * _1188;
    float _1206 = _1192 * _1192;
    float _1208 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1148);
    float _1210 = -_199;
    int _1212 = _740 ? as_type<int>(_1210) : as_type<int>(_199);
    float _1214 = _1204 + _1206;
    float _1216 = -_203;
    int _1218 = _1168 ? as_type<int>(_1216) : as_type<int>(_203);
    float _1220 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1208);
    int _1222 = int(_1070) + int(_1174);
    float _1224 = sqrt(_1214);
    bool _1226 = !_502;
    float _1228 = _1226 ? _199 : as_type<float>(_1212);
    float _1230 = _1220 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    bool _1232 = !_628;
    float _1234 = _1232 ? _203 : as_type<float>(_1218);
    int _1236 = _1182 * _1222;
    int _1238 = _1236 + _1030;
    int _1240 = _1030 ^ _878;
    float _1242 = _788 + _1230;
    int _1244 = int(_1106) + int(_1202);
    float _1246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1248 = uint(_1238) >= uint(_878);
    uint _1250 = uint(int(uint(_1240) >> uint(31)));
    int _1252 = _1196 * _1244;
    int _1254 = _1252 + _1056;
    bool _1256 = !_1248;
    int _1258 = _1256 ? 0 : (-1);
    int _1260 = ~int(_1250);
    int _1262 = _1260 + 1;
    bool _1264 = uint(_1254) >= uint(_1002);
    float _1266 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1268 = _1224 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1270 = ~_1222;
    int _1272 = _1270 + _1258;
    int _1274 = _1272 + 1;
    bool _1276 = !_1264;
    float _1278 = _1276 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _1280 = _878 == 0;
    int _1282 = _878 * _1274;
    int _1284 = _1282 + _1030;
    int _1286 = ~as_type<int>(_1278);
    int _1288 = _1244 + _1286;
    int _1290 = _1288 + 1;
    bool _1292 = _878 == 0;
    int _1294 = _1290 ^ _1262;
    bool _1296 = !_1280;
    int _1298 = _1296 ? _1284 : (-1);
    float _1300 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1302 = ~_1262;
    int _1304 = _1302 + _1294;
    int _1306 = _1304 + 1;
    float _1308 = -_125;
    float _1310 = fma(_1308, (*spvDescriptorSet0.vp_c9)._m0[76].x, _700);
    float _1312 = as_type<float>(_878);
    float _1314 = _1266;
    float _1316 = _1278;
    float _1318 = _1176;
    float _1320 = _1178;
    float _1322 = _1224;
    if (!_1268)
    {
        _1312 = _1206;
    }
    float _1324 = _1312;
    float _1326 = _1324;
    if (!_1268)
    {
        _1314 = _1204;
    }
    float _1328 = _1314;
    float _1330 = float(_1298);
    float _1332 = _1328;
    if (!_1268)
    {
        _1316 = _1242;
    }
    float _1334 = _1316;
    bool _1336 = !_1268;
    float _1338 = _1334;
    if (!_1336)
    {
        float _1340 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1344 = _1224 + _1342;
        float _1346 = rsqrt(_1214);
        float _1348 = _1344 * _1340;
        float _1350 = _1242 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1352 = _1348 * 0.15915493667125701904296875;
        float _1354 = _1352 * 6.283185482025146484375;
        float _1356 = sin(_1354);
        float _1358 = _1352 * 6.283185482025146484375;
        float _1360 = cos(_1358);
        float _1362 = fma(_1356, _1350, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1364 = _1346 * _1362;
        float _1366 = _1360 + (-1.0);
        float _1368 = fma(_1188, _1364, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1370 = fma(_1192, _1364, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1372 = _1366 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1374 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1376 = _1368 + _1374;
        float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1380 = _1370 + _1378;
        float _1382 = fma(_1242, _1360, _1372);
        float _1384 = _1376 * _1376;
        float _1386 = _1380 * _1380;
        _1338 = _1382;
        _1332 = _1384;
        _1326 = _1386;
        _1318 = _1368;
        _1320 = _1370;
    }
    float _1388 = _1338;
    float _1390 = _1332;
    float _1392 = _1326;
    float _1394 = _1318;
    float _1396 = _1320;
    bool _1398 = !_1292;
    int _1400 = _1398 ? _1306 : (-1);
    float _1402 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1404 = fma(_1300, _1330, _1310);
    float _1406 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1408 = _1388 + _1406;
    float _1410 = _1228 + 0.5;
    float _1412 = float(_1400);
    float _1414 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1100);
    float _1416 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _742);
    float _1418 = fma(_1408, _1408, _1390);
    float _1420 = fma(_1300, _1410, _1404);
    float _1422 = -_1414;
    float _1424 = fma(_1402, _1412, _1422);
    float _1426 = _1234 + (-0.5);
    float _1428 = -_1416;
    float _1430 = _1428 + 1.0;
    float _1432 = _1418 + _1392;
    float _1434 = -_1402;
    float _1436 = fma(_1434, _1426, _1424);
    float _1438 = -_1430;
    float _1440 = fma(_1228, _1438, _1420);
    float _1442 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1184);
    float _1444 = sqrt(_1432);
    float _1446 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1450 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1458 = -_1442;
    float _1460 = _1458 + 1.0;
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1464 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1468 = _1448 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1470 = _1450 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1472 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1474 = _1454 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1456 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = fma(_1234, _1460, _1436);
    out.m_64.x = _1466;
    out.m_64.y = _1468;
    out.m_64.z = _1470;
    out.m_64.w = _1462;
    bool _1480 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1482 = isnan(_1444);
    bool _1484 = _1480 || _1482;
    bool _1486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1488 = _1484 || _1486;
    out.m_66.x = _1472;
    out.m_66.y = _1474;
    out.m_66.z = _1476;
    out.m_66.w = _1464;
    out.m_68.x = _1440;
    out.m_68.y = _1478;
    float _1490 = _1460;
    float _1492 = _1474;
    float _1494 = _1476;
    if (!_1488)
    {
        _1490 = 1.0;
    }
    float _1496 = _1490;
    bool _1498 = !_1488;
    float _1500 = _1496;
    if (!_1498)
    {
        bool _1502 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1504 = isnan(_1444);
        bool _1506 = _1502 || _1504;
        bool _1508 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1510 = _1506 || _1508;
        if (!_1510)
        {
            float _1512 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1514 = _1444 + _1512;
            float _1516 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1518 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1516;
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1522 = _1520 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1524 = 1.0 / _1518;
            float _1526 = _1514 * _1524;
            float _1528 = fma(_1526, _1522, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1500 = _1528;
            _1530 = true;
        }
        else
        {
            bool _1532 = _1444 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1534 = isnan(_1444);
            bool _1536 = _1532 || _1534;
            bool _1538 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1540 = _1536 || _1538;
            if (!_1540)
            {
                float _1542 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1544 = _1444 + _1542;
                float _1546 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1548 = _1546 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1552 = _1550 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1554 = 1.0 / _1548;
                float _1556 = _1544 * _1554;
                float _1558 = fma(_1556, _1552, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1500 = _1558;
                _1530 = true;
            }
            else
            {
                _1500 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1530 = false;
    float _1560 = _1500;
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1564 = _1388 + _1562;
    float _1566 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1568 = _1394 + _1566;
    float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1572 = _1396 + _1570;
    float _1574 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1576 = fma(_1568, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1578 = fma(_1572, _1560, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1580 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1582 = _1574 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1586 = _1576 + _1584;
    float _1588 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1590 = _1578 + _1588;
    float _1592 = _1582 * _1582;
    float _1594 = fma(_1586, _1586, _1592);
    float _1596 = fma(_1590, _1590, _1594);
    float _1598 = rsqrt(_1596);
    float _1600 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1602 = _1586 * _1600;
    float _1604 = _1590 * _1600;
    float _1606 = _1602 * _1602;
    float _1608 = _1604 * _1604;
    float _1610 = _1606 + _1608;
    float _1612 = sqrt(_1610);
    bool _1614 = _1612 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1616 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1618 = _1612 + _1616;
    float _1620 = _1590;
    float _1622 = _1592;
    float _1624 = _1618;
    float _1626 = _1582;
    float _1628 = _1602;
    if (_1614)
    {
        float _1630 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1620 = _1630;
    }
    float _1632 = _1620;
    if (_1614)
    {
        float _1634 = rsqrt(_1610);
        _1622 = _1634;
    }
    float _1636 = _1622;
    float _1638 = _1636;
    if (_1614)
    {
        float _1640 = _1618 * _1632;
        _1624 = _1640;
    }
    float _1642 = _1624;
    if (_1614)
    {
        float _1644 = _1642 * 0.15915493667125701904296875;
        _1492 = _1644;
    }
    float _1646 = _1492;
    float _1648 = _1632;
    if (_1614)
    {
        float _1650 = _1646 * 6.283185482025146484375;
        float _1652 = sin(_1650);
        _1648 = _1652;
    }
    float _1654 = _1648;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1658 = precise::max(0.0, _1656);
    float _1660 = _1598;
    float _1662 = _1658;
    if (_1614)
    {
        float _1664 = _1646 * 6.283185482025146484375;
        float _1666 = cos(_1664);
        _1660 = _1666;
    }
    float _1668 = _1660;
    float _1670 = -_1600;
    float _1672 = -_1658;
    float _1674 = fma(_1582, _1670, _1672);
    if (_1614)
    {
        float _1676 = _1674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1662 = _1676;
    }
    float _1678 = _1662;
    float _1680 = sqrt(_1596);
    float _1682 = _1654;
    float _1684 = _1678;
    if (_1614)
    {
        float _1686 = fma(_1654, _1678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1494 = _1686;
    }
    float _1688 = _1494;
    if (!_1614)
    {
        _1682 = _1604;
    }
    float _1690 = _1682;
    float _1692 = _1690;
    if (_1614)
    {
        float _1694 = _1668 + (-1.0);
        _1684 = _1694;
    }
    float _1696 = _1684;
    float _1698 = _1696;
    if (_1614)
    {
        float _1700 = _1636 * _1688;
        _1322 = _1700;
    }
    float _1702 = _1322;
    if (!_1614)
    {
        _1638 = _1674;
    }
    float _1704 = _1638;
    float _1706 = _1704;
    if (_1614)
    {
        float _1708 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1626 = _1708;
    }
    float _1710 = _1626;
    float _1712 = _1710;
    if (_1614)
    {
        float _1714 = _1602 * _1702;
        _1628 = _1714;
    }
    float _1716 = _1628;
    if (!_1614)
    {
        _1698 = _1606;
    }
    float _1718 = _1698;
    float _1720 = _1718;
    if (_1614)
    {
        float _1722 = _1604 * _1702;
        _1692 = _1722;
    }
    float _1724 = _1692;
    if (_1614)
    {
        float _1726 = fma(_1674, _1668, _1710);
        _1706 = _1726;
    }
    float _1728 = _1706;
    if (_1614)
    {
        float _1730 = _1716 * _1716;
        _1720 = _1730;
    }
    float _1732 = _1720;
    if (!_1614)
    {
        _1712 = _1608;
    }
    float _1734 = _1712;
    float _1736 = _1734;
    if (_1614)
    {
        float _1738 = _1724 * _1724;
        _1736 = _1738;
    }
    float _1740 = _1736;
    float _1742 = fma(_1728, _1728, _1732);
    float _1744 = _1742 + _1740;
    float _1746 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1748 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1750 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1748);
    float _1752 = precise::clamp(_1750, 0.0, 1.0);
    float _1754 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1756 = rsqrt(_1744);
    float _1758 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1746);
    float _1760 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1762 = -_1752;
    float _1764 = _1762 + 1.0;
    float _1766 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1758);
    float _1768 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1770 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1760);
    float _1772 = _1574 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1774 = _1766 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1776 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1768);
    float _1778 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1770);
    float _1780 = abs(_1764);
    float _1782 = log2(_1780);
    float _1784 = _1774 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1786 = fma(_1576, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1772);
    float _1788 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1776);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1792 = -_1784;
    float _1794 = fma(_1792, _1754, 1.0);
    float _1796 = _1756 * _1716;
    float _1798 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1800 = _1788 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1802 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1804 = _1756 * _1728;
    float _1806 = _1796 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1808 = _1756 * _1724;
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1802);
    float _1812 = _1798 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1814 = -_1806;
    float _1816 = fma(_1804, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1814);
    float _1818 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1820 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1810);
    float _1822 = log2(_1794);
    float _1824 = -_1808;
    float _1826 = fma(_1824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1816);
    float _1828 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1830 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1820);
    float _1832 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1834 = fma(_1826, -0.5, 0.5);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1828);
    float _1838 = fma(_1826, 0.5, 0.5);
    float _1840 = exp2(_1818);
    float _1842 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1832);
    float _1844 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1836);
    float _1846 = _1804 + 1.0;
    float _1848 = fma(_1838, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1850 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1842);
    float _1852 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1844);
    float _1854 = 1.0 / _1830;
    float _1856 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1850);
    float _1858 = fma(_1838, _1848, -0.212114393711090087890625);
    float _1860 = _1822 * 0.693147182464599609375;
    float _1862 = fma(_1838, _1858, 1.570728778839111328125);
    float _1864 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1866 = sqrt(_1834);
    float _1868 = -_1804;
    float _1870 = fma(_1840, _1846, _1868);
    float _1872 = fma(_1870, 0.5, 0.5);
    float _1874 = _1852 * _1854;
    float _1876 = _1856 * _1854;
    float _1878 = fma(_1874, 0.5, 0.5);
    float _1880 = fma(_1876, -0.5, 0.5);
    float _1882 = _1866 * 0.636619746685028076171875;
    float3 _4749 = float3(_1878, _1880, _1864);
    float _1884 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4749, float3(0.0), isnan(_4749)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4749, float3(0.0), isnan(_4749)), level(0.0)).x;
    float _1886 = -_1862;
    float _1888 = fma(_1882, _1886, 1.0);
    float3 _4765 = float3(_1878, _1880, _1864);
    float4 _1891 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4765, float3(0.0), isnan(_4765)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4765, float3(0.0), isnan(_4765)), level(0.0)).xyzw;
    float _1893 = _1891.x;
    float _1895 = _1891.y;
    float _1897 = _1891.z;
    float _1899 = _1891.w;
    float2 _4782 = float2(_1888, _1872);
    float3 _1903 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4782, float2(0.0), isnan(_4782)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4782, float2(0.0), isnan(_4782)), level(0.0)).xyz;
    float _1905 = _1903.x;
    float _1907 = _1903.y;
    float _1909 = _1903.z;
    float _1911 = _1782 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1913 = _1790 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1915 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1913);
    float _1917 = exp2(_1911);
    float _1919 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1915);
    float _1921 = fma(_1812, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1919);
    float _1923 = _1921 + _1830;
    out.gl_Position.x = _1852;
    out.gl_Position.y = _1856;
    out.gl_Position.z = _1921;
    out.gl_Position.w = _1830;
    float _1925 = _1923 * 0.5;
    float _1927 = -_1917;
    float _1929 = _1927 + 1.0;
    float _1931 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1933 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _1925;
    out.m_70.w = _1830;
    out.m_47.x = _1931;
    float _1935 = _1933 * _1884;
    float _1937 = -_1933;
    float _1939 = _1937 + 1.0;
    float _1941 = _1899 * _1935;
    float _1943 = _1899 * _1939;
    float _1945 = _1909 * _1935;
    float _1947 = fma(_1905, _1941, _1893);
    float _1949 = fma(_1907, _1941, _1895);
    float _1951 = fma(_1899, _1945, _1897);
    out.m_72.x = _1947;
    out.m_72.y = _1949;
    out.m_72.z = _1951;
    out.m_72.w = _1943;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

