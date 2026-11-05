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
    float4 m_60 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_80 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_47 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
    float4 m_78 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_82 [[user(locn12)]];
    float4 m_72 [[user(locn13)]];
    float4 m_86 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_70 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2742 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_121);
        out.gl_Position.z = _3321;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_49.w;
    float _127 = float(_105);
    float _129 = in.m_51.x;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    out.m_53.x = _129;
    bool _145 = _133 >= _127;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    float _151 = 1.0 / _127;
    float _153 = _133;
    if (_149)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _113;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    float _161 = _133 * _151;
    float _163 = _161;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3395 = as_type<float>(_159);
        out.gl_Position.z = _3395;
    }
    out.m_55.x = _161;
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _165 = in.m_44.x;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = as_type<float>(int(gl_VertexIndex));
    out.m_60.x = _165;
    int _171 = as_type<int>(_169) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_169) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _163 = _201;
    }
    float _203 = _163;
    float _205 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _207 = int(_205);
    float _209 = in.m_51.y;
    float _211 = _151 * _133;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _215 = _213 != 0;
    float _217 = in.m_51.z;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = in.m_51.w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _229 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _231 = int(_229);
    float _233 = float(_207);
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _239 = in.m_44.y;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _203 + _241;
    float _245 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[88].z, _235);
    float _247 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _249 = int(_247);
    float _251 = float(_221);
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[88].w, _237);
    bool _255 = _209 > 0.5;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _203 + _257;
    bool _261 = _217 > 0.5;
    float _263 = 1.0 / _251;
    float _265 = float(uint(_231));
    int _267 = ~_231;
    int _269 = _267 + 1;
    int _271 = ~_231;
    int _273 = _271 + 1;
    float _275 = 1.0 / _233;
    float _277 = float(uint(_249));
    int _279 = ~_249;
    int _281 = _279 + 1;
    bool _283 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_203);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_203);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = _263 * _133;
    float _309 = 1.0 / _265;
    bool _311 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_203);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = _275 * _133;
    float _325 = trunc(_307);
    int _327 = int(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _329;
    float _333 = 1.0 / _277;
    int _335 = as_type<int>(_309) + (-2);
    float _337 = trunc(_323);
    int _339 = int(_337);
    float _341 = float(uint(_327));
    float _343 = as_type<float>(_335) * _341;
    float _345 = _341;
    if (_215)
    {
        _345 = 1.0;
    }
    float _347 = _345;
    float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _351 = log2(_349);
    int _353 = as_type<int>(_333) + (-2);
    float _355 = _347;
    if (!_215)
    {
        _355 = 7.345489978790283203125;
    }
    float _357 = _355;
    float _359 = float(uint(_339));
    float _361 = trunc(_343);
    float _363 = precise::max(_361, 0.0);
    uint _366 = uint(_363);
    float _368 = _357 * _129;
    float _370 = as_type<float>(_353) * _359;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = ~_249;
    int _380 = _378 + 1;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _396 = _394 != 0;
    int _398 = _269 * int(_366);
    int _400 = _398 + _327;
    bool _402 = !_396;
    int _404 = _402 ? 0 : 1;
    float _406 = float(uint(_400));
    float _408 = floor(_368);
    int _410 = _380 * int(_376);
    int _412 = _410 + _339;
    int _414 = abs(_404);
    float _416 = as_type<float>(_335) * _406;
    float _418 = float(uint(_412));
    float _420 = trunc(_416);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    float _426 = as_type<float>(_353) * _418;
    float _428 = -_181;
    int _430 = _255 ? as_type<int>(_428) : as_type<int>(_181);
    float _432 = -_185;
    int _434 = _261 ? as_type<int>(_432) : as_type<int>(_185);
    bool _436 = !_388;
    float _438 = _436 ? _181 : as_type<float>(_430);
    float _440 = trunc(_426);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    bool _446 = !_392;
    float _448 = _446 ? _185 : as_type<float>(_434);
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _464 = _462 != 0;
    int _466 = int(_366) + int(_424);
    bool _468 = !_464;
    int _470 = _468 ? 0 : 1;
    bool _472 = _223 > 0.5;
    int _474 = _273 * _466;
    int _476 = _474 + _327;
    float _478 = float(_327);
    float _480 = -_408;
    float _482 = _368 + _480;
    float _484 = -_185;
    int _486 = _472 ? as_type<int>(_484) : as_type<int>(_185);
    int _488 = int(_376) + int(_444);
    float _490 = float(_231);
    bool _492 = uint(_476) >= uint(_231);
    int _494 = _281 * _488;
    int _496 = _494 + _339;
    bool _498 = _478 >= _490;
    bool _500 = isnan(_478);
    bool _502 = _498 || _500;
    bool _504 = isnan(_490);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _482 * _490;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _514 = _512 != 0;
    bool _516 = uint(_496) >= uint(_249);
    float _518 = trunc(_508);
    int _520 = int(_518);
    bool _522 = !_384;
    float _524 = _522 ? _185 : as_type<float>(_486);
    bool _526 = !_514;
    int _528 = _526 ? 0 : 1;
    bool _530 = !_492;
    float _532 = _530 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _534 = !_516;
    int _536 = _534 ? 0 : (-1);
    float _538 = trunc(_510);
    int _540 = int(_538);
    bool _542 = !_456;
    int _544 = _542 ? 0 : 1;
    float _546 = _490 * _211;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _566 = _564 != 0;
    int _568 = ~_466;
    int _570 = _568 + as_type<int>(_532);
    int _572 = _570 + 1;
    float _574 = trunc(_546);
    int _576 = int(_574);
    bool _578 = !_554;
    int _580 = _578 ? 0 : 1;
    bool _582 = _231 == 0;
    int _584 = _231 * _572;
    int _586 = _584 + _327;
    int _588 = ~_520;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    int _594 = _231 + (-1);
    int _596 = _540 * _414;
    int _598 = _596 + _327;
    bool _600 = !_582;
    int _602 = _600 ? _586 : (-1);
    float _604 = _490;
    float _606 = _532;
    float _608 = _524;
    if (_566)
    {
        _604 = _129;
    }
    float _610 = _604;
    float _612 = _610;
    if (_566)
    {
        _606 = 1.0;
    }
    float _614 = _606;
    int _616 = _602 * _592;
    float _618 = _614;
    if (!_566)
    {
        _612 = _209;
    }
    float _620 = _612;
    if (!_566)
    {
        _618 = 1.2345600128173828125;
    }
    float _622 = _618;
    int _624 = _520 * _594;
    int _626 = _624 + _616;
    bool _628 = !_452;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_460;
    int _634 = _632 ? 0 : 1;
    float _636 = _620 * _622;
    int _638 = abs(_544);
    int _640 = abs(_630);
    float _642 = floor(_636);
    float _644 = float(_249);
    int _646 = _626 * _638;
    float _648 = float(_339);
    int _650 = abs(_634);
    int _652 = _576 * _640;
    int _654 = _652 + _646;
    int _656 = abs(_470);
    float _658 = _644 * _211;
    bool _660 = _648 >= _644;
    bool _662 = isnan(_648);
    bool _664 = _660 || _662;
    bool _666 = isnan(_644);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = trunc(_658);
    int _674 = int(_672);
    int _676 = ~_488;
    int _678 = _676 + _536;
    int _680 = _678 + 1;
    int _682 = _598 * _650;
    int _684 = _682 + _654;
    float _686 = -_642;
    float _688 = _636 + _686;
    bool _690 = !_550;
    int _692 = _690 ? 0 : 1;
    int _694 = _540 * _656;
    int _696 = _694 + _684;
    bool _698 = _249 == 0;
    float _700 = trunc(_670);
    int _702 = int(_700);
    int _704 = _249 * _680;
    int _706 = _704 + _339;
    float _708 = _688 * _644;
    float _710 = float(uint(_696));
    int _712 = abs(_580);
    bool _714 = !_698;
    int _716 = _714 ? _706 : (-1);
    float _718 = as_type<float>(_335) * _710;
    float _720 = trunc(_708);
    int _722 = int(_720);
    int _724 = _249 + (-1);
    int _726 = ~_231;
    int _728 = _726 + 1;
    int _730 = ~_702;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = trunc(_718);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = abs(_692);
    bool _744 = !_562;
    int _746 = _744 ? 0 : 1;
    int _748 = _716 * _734;
    int _750 = _702 * _724;
    int _752 = _750 + _748;
    int _754 = abs(_528);
    bool _756 = !_558;
    int _758 = _756 ? 0 : 1;
    int _760 = _752 * _712;
    int _762 = abs(_758);
    int _764 = _728 * int(_740);
    int _766 = _764 + _696;
    int _768 = _722 * _754;
    int _770 = _768 + _339;
    int _772 = abs(_746);
    int _774 = _674 * _742;
    int _776 = _774 + _760;
    float _778 = float(uint(_766));
    int _780 = ~_249;
    int _782 = _780 + 1;
    int _784 = _770 * _762;
    int _786 = _784 + _776;
    float _788 = as_type<float>(_335) * _778;
    int _790 = _722 * _772;
    int _792 = _790 + _786;
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    float _800 = float(uint(_792));
    float _802 = as_type<float>(_353) * _800;
    int _804 = ~_231;
    int _806 = _804 + 1;
    float _808 = trunc(_802);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    int _814 = int(_740) + int(_798);
    int _816 = _806 * _814;
    int _818 = _816 + _696;
    float _820 = float(uint(_598));
    int _822 = ~_231;
    int _824 = _822 + 1;
    bool _826 = uint(_818) >= uint(_231);
    float _828 = as_type<float>(_335) * _820;
    int _830 = _782 * int(_812);
    int _832 = _830 + _792;
    bool _834 = !_826;
    int _836 = _834 ? 0 : (-1);
    float _838 = trunc(_828);
    float _840 = precise::max(_838, 0.0);
    uint _842 = uint(_840);
    float _844 = float(uint(_832));
    int _846 = ~_814;
    int _848 = _846 + _836;
    int _850 = _848 + 1;
    float _852 = _209 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _854 = as_type<float>(_353) * _844;
    int _856 = _231 * _850;
    int _858 = _856 + _696;
    int _860 = ~_249;
    int _862 = _860 + 1;
    float _864 = trunc(_854);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    bool _870 = !_582;
    int _872 = _870 ? _858 : (-1);
    int _874 = _824 * int(_842);
    int _876 = _874 + _598;
    int _878 = _872 & 3;
    bool _880 = _878 != 0;
    int _882 = _872 & 3;
    bool _884 = _882 != 0;
    int _886 = _880 ? 0 : 1;
    bool _888 = uint(_882) > 1u;
    float _890 = float(uint(_876));
    int _892 = ~_886;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = int(_812) + int(_868);
    float _900 = as_type<float>(_335) * _890;
    int _902 = ~_231;
    int _904 = _902 + 1;
    int _906 = _862 * _898;
    int _908 = _906 + _792;
    int _910 = _896;
    int _912 = int(_842);
    float _914 = as_type<float>(_904);
    float _916 = as_type<float>(_898);
    if (!_888)
    {
        int _918 = ~_886;
        int _920 = _918 + 1;
        _910 = _920;
    }
    int _922 = _910;
    float _924 = trunc(_900);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    bool _930 = uint(_882) >= 2u;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _934 = abs(_922);
    int _936 = _930 ? 0 : 1;
    bool _938 = uint(_908) >= uint(_249);
    int _940 = ~_936;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    bool _946 = !_938;
    int _948 = _946 ? 0 : (-1);
    bool _950 = _882 != 3;
    int _952 = ~_898;
    int _954 = _952 + _948;
    int _956 = _954 + 1;
    int _958 = int(_842) + int(_928);
    int _960 = _944;
    int _962 = _936;
    float _964 = as_type<float>(_928);
    if (_566)
    {
        _912 = 0;
    }
    int _966 = _912;
    int _968 = _249 * _956;
    int _970 = _968 + _792;
    int _972 = _966;
    if (!_566)
    {
        _972 = 1;
    }
    int _974 = _972;
    bool _976 = !_698;
    int _978 = _976 ? _970 : (-1);
    int _980 = _904 * _958;
    int _982 = _980 + _598;
    float _984 = as_type<float>(_974);
    if (_950)
    {
        int _986 = ~_936;
        int _988 = _986 + 1;
        _960 = _988;
    }
    int _990 = _960;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _994 = _992 != 0;
    bool _996 = uint(_982) >= uint(_231);
    bool _998 = !_994;
    int _1000 = _998 ? 0 : 1;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1004 = _1002 != 0;
    bool _1006 = !_996;
    int _1008 = _1006 ? 0 : (-1);
    bool _1010 = !_1004;
    int _1012 = _1010 ? 0 : 1;
    int _1014 = _978 & 3;
    bool _1016 = _1014 != 0;
    int _1018 = _978 & 3;
    bool _1020 = _1018 != 0;
    int _1022 = _1016 ? 0 : 1;
    bool _1024 = uint(_1018) > 1u;
    int _1026 = ~_1022;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    int _1032 = _1030;
    if (_566)
    {
        _962 = 0;
    }
    int _1034 = _962;
    int _1036 = _1034;
    if (!_566)
    {
        _1036 = 2;
    }
    int _1038 = _1036;
    int _1040 = ~_958;
    int _1042 = _1040 + _1008;
    int _1044 = _1042 + 1;
    float _1046 = _209 * 2.0;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1024)
    {
        int _1050 = ~_1022;
        int _1052 = _1050 + 1;
        _1032 = _1052;
    }
    int _1054 = _1032;
    int _1056 = _231 * _1044;
    int _1058 = _1056 + _598;
    bool _1060 = uint(_1018) >= 2u;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1064 = floor(_1046);
    int _1066 = _1060 ? 0 : 1;
    bool _1068 = _974 != 1;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1072 = ~_1066;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_582;
    int _1080 = _1078 ? _1058 : (-1);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1084 = ~_934;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1092 = abs(_990);
    float _1094 = fma(_852, -2.0, _1082);
    int _1096 = _1076;
    if (!_1068)
    {
        _914 = _209;
    }
    float _1098 = _914;
    float _1100 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1090);
    float _1102 = _1098;
    if (!_1068)
    {
        _964 = _217;
    }
    float _1104 = _964;
    float _1106 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1094);
    float _1108 = _1104;
    if (!_1068)
    {
        _916 = _1098;
    }
    float _1110 = _916;
    float _1112 = _1110;
    if (!_1068)
    {
        _984 = _217;
    }
    float _1114 = _984;
    float _1116 = _1114;
    if (_1068)
    {
        _1112 = _129;
    }
    float _1118 = _1112;
    if (_1068)
    {
        _1102 = _129;
    }
    float _1120 = _1102;
    if (_1068)
    {
        _1108 = _209;
    }
    float _1122 = _1108;
    float _1124 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1068)
    {
        _1116 = _209;
    }
    float _1126 = _1116;
    float _1128 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1048);
    bool _1130 = _1038 != 2;
    float _1132 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1134 = _351 * _133;
    float _1136 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[83].w, _932);
    float _1138 = -_1070;
    float _1140 = fma(_1132, 2.0, _1138);
    float _1142 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1128);
    float _1144 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1136);
    float _1146 = exp2(_1134);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1152 = -_133;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1140);
    float _1156 = _1132;
    if (_1130)
    {
        _1156 = _129;
    }
    float _1158 = _1156;
    float _1160 = fma(_1150, -2.0, _1062);
    float _1162 = _1158;
    if (!_1130)
    {
        _1162 = _217;
    }
    float _1164 = _1162;
    float _1166 = _129 * 2.0;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1170 = -_1148;
    float _1172 = fma(_1124, 2.0, _1170);
    float _1174 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _253);
    float _1176 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1178 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1168);
    float _1180 = -_133;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1172);
    float _1184 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1160);
    float _1186 = -_225;
    float _1188 = fma(_1176, 2.0, _1186);
    float _1190 = _1176;
    if (_1130)
    {
        _1190 = _209;
    }
    float _1192 = _1190;
    float _1194 = -_1146;
    float _1196 = _1194 + 1.0;
    float _1198 = _1192;
    if (!_1130)
    {
        _1198 = _129;
    }
    float _1200 = _1198;
    float _1202 = -_133;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1188);
    bool _1206 = _1018 != 3;
    bool _1208 = !_1020;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1214 = _882 != 3;
    int _1216 = abs(_1210);
    float _1218 = fma(_1212, -2.0, _227);
    bool _1220 = !_1214;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1218);
    if (_1206)
    {
        int _1226 = ~_1066;
        int _1228 = _1226 + 1;
        _1096 = _1228;
    }
    int _1230 = _1096;
    bool _1232 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1234 = isnan(0.0);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1240 = _1236 || _1238;
    float _1242 = floor(_1166);
    int _1244 = ~_1092;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = _1240 ? _1196 : 0.0;
    float _1252 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    bool _1254 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1256 = isnan(1.0);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1262 = _1258 || _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1266 = 1.0 + _1264;
    float _1268 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _245);
    float _1270 = _217 * 2.0;
    float _1272 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1100);
    float _1274 = 1.0 / _1266;
    float _1276 = -_185;
    float _1278 = _1276 + 0.5;
    int _1280 = abs(_1000);
    bool _1282 = _1242 >= 0.0;
    bool _1284 = isnan(_1242);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    if (_1262)
    {
        float _1292 = _1250 * _1274;
        _153 = _1292;
    }
    float _1294 = _153;
    bool _1296 = _1242 > 0.0;
    int _1298 = _1290 ? 0 : 1;
    bool _1300 = !_884;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = ~_1298;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    bool _1310 = _1064 > 0.0;
    bool _1312 = _1064 >= 0.0;
    bool _1314 = isnan(_1064);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan(0.0);
    bool _1320 = _1316 || _1318;
    int _1322 = _1308;
    if (!_1296)
    {
        int _1324 = ~_1298;
        int _1326 = _1324 + 1;
        _1322 = _1326;
    }
    int _1328 = _1322;
    float _1330 = _181 + 0.5;
    bool _1332 = _1018 != 3;
    int _1334 = _1320 ? 0 : 1;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    out.m_62.x = _1330;
    out.m_62.y = _1278;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1350 = _1348 != 0;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1352;
    int _1356 = ~_1334;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1366 = _1360;
    if (!_1310)
    {
        int _1368 = ~_1334;
        int _1370 = _1368 + 1;
        _1366 = _1370;
    }
    int _1372 = _1366;
    float _1374 = 1.0 / _1354;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1378 = _1376 != 0;
    int _1380 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1382 = _1380 != 0;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1386 = 1.0 / _1364;
    float _1388 = _239 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_64.w = _1384;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1390;
    int _1394 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1396 = _1394 != 0;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1400 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1388);
    float _1402 = _243 * _1374;
    float _1404 = float(uint(_770));
    float _1406 = _129 + _217;
    float _1408 = 1.0 / _1392;
    out.m_66.w = _1398;
    float _1410 = _239 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1412 = as_type<float>(_353) * _1404;
    float _1414 = _1406 + (-1.0);
    float _1416 = _239 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1418 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1410);
    float _1420 = trunc(_1412);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1428 = _203 + _1426;
    float _1430 = _129 + _209;
    float _1432 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1416);
    float _1434 = _1428 * _1386;
    float _1436 = _217 + _209;
    float _1438 = _1430 + (-1.0);
    float _1440 = floor(_1270);
    float _1442 = _259 * _1408;
    float _1444 = _1436 + (-1.0);
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1448 = !_1342;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1452;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1458;
    bool _1462 = !_1346;
    int _1464 = _1462 ? 0 : 1;
    float _1466 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1468 = ~_249;
    int _1470 = _1468 + 1;
    float _1472 = fma(_1454, _1402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1474 = fma(_1460, _1402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1480 = float(_1328);
    int _1482 = _1470 * int(_1424);
    int _1484 = _1482 + _770;
    bool _1486 = _1440 >= 0.0;
    bool _1488 = isnan(_1440);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = fma(_331, _1442, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _1498 = !_1350;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1506 = float(uint(_1484));
    bool _1508 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1510 = isnan(_203);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    int _1520 = _1494 ? 0 : 1;
    float _1522 = as_type<float>(_353) * _1506;
    bool _1524 = _1440 > 0.0;
    float _1526 = -_1518;
    float _1528 = _1526 + 1.0;
    float _1530 = in.m_68.x;
    float _1532 = in.m_68.y;
    float _1534 = in.m_68.z;
    float _1536 = _321 * _1528;
    float _1538 = -_321;
    float _1540 = _1538 + 1.0;
    int _1542 = abs(_1464);
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1544;
    float _1548 = _305 * _1540;
    float _1550 = fma(_1478, _1434, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1552 = float(_1542);
    float _1554 = -_305;
    float _1556 = _1554 + 1.0;
    float _1558 = trunc(_1522);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    float _1564 = fma(_1546, _1442, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1566 = fma(_1504, _1434, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1568 = _1552 * _1480;
    float _1570 = _293 * _1556;
    float _1572 = -_293;
    float _1574 = _1572 + 1.0;
    int _1576 = ~_1520;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    float _1582 = _1568 * (-2.0);
    float _1584 = _1472 * _1570;
    float _1586 = _1474 * _1570;
    int _1588 = ~_249;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1456, _1582, _1456);
    float _1594 = fma(_1582, _1532, _1532);
    int _1596 = abs(_1500);
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1584);
    int _1600 = abs(_1450);
    float _1602 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1586);
    int _1604 = int(_1424) + int(_1562);
    float _1606 = _209 + (-0.5);
    float _1608 = float(_1372);
    float _1610 = fma(_1550, _1548, _1598);
    int _1612 = _1590 * _1604;
    int _1614 = _1612 + _770;
    int _1616 = _1580;
    if (!_1524)
    {
        int _1618 = ~_1520;
        int _1620 = _1618 + 1;
        _1616 = _1620;
    }
    int _1622 = _1616;
    float _1624 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1594);
    float _1626 = fma(_1566, _1548, _1602);
    float _1628 = float(_1596);
    float _1630 = fma(_1496, _1536, _1610);
    float _1632 = float(_1622);
    float _1634 = fma(_1564, _1536, _1626);
    float _1636 = float(_1600);
    float _1638 = _1628 * _1608;
    bool _1640 = uint(_1614) >= uint(_249);
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1644 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1630);
    float _1646 = _1636 * _1632;
    bool _1648 = !_1640;
    int _1650 = _1648 ? 0 : (-1);
    float _1652 = in.m_70.x;
    float _1654 = in.m_70.y;
    bool _1656 = _129 > 0.5;
    float _1658 = _1646 * (-2.0);
    float _1660 = _129 + (-0.5);
    float _1662 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1634);
    float _1664 = in.m_44.z;
    float _1666 = fma(_1658, _1530, _1530);
    float _1668 = fma(_1446, _1658, _1446);
    float _1670 = _1638 * (-2.0);
    float _1672 = _217 + (-0.5);
    float _1674 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1666);
    float _1676 = fma(_1592, _1294, _1624);
    float _1678 = fma(_1670, _1534, _1534);
    float _1680 = fma(_1466, _1670, _1466);
    float _1682 = fma(_1668, _1294, _1674);
    float _1684 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1686 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1678);
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1690 = _1682 * 0.15915493667125701904296875;
    float _1692 = _1676 * 0.15915493667125701904296875;
    float _1694 = fma(_1680, _1294, _1686);
    float _1696 = _438 + 0.5;
    float _1698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    int _1700 = ~_1604;
    int _1702 = _1700 + _1650;
    int _1704 = _1702 + 1;
    float _1706 = _1662 * _1654;
    float _1708 = _1644 * _1652;
    float _1710 = _1694 * 0.15915493667125701904296875;
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1716 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1400);
    float _1718 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1418);
    float _1720 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1432);
    float _1722 = fma(_1684, _1696, _1204);
    int _1724 = _872 >> 31;
    float _1726 = _1690 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _1714 * _1712;
    int _1732 = _978 >> 31;
    float _1734 = _1708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1736 = _1724 & 3;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1740 = _1732 & 3;
    float _1742 = _448 + (-0.5);
    float _1744 = _1692 * 6.283185482025146484375;
    float _1746 = sin(_1744);
    int _1748 = _872 + _1736;
    float _1750 = _1734 * _1698;
    int _1752 = _978 + _1740;
    float _1754 = -_1738;
    float _1756 = -_1224;
    float _1758 = fma(_1754, _1742, _1756);
    int _1760 = _1748 >> 2;
    float _1762 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1764 = _1752 >> 2;
    float _1766 = _1710 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    int _1770 = _1760 << 4;
    int _1772 = _1770 + 368;
    int _1774 = _249 * _1704;
    int _1776 = _1774 + _770;
    int _1778 = _1764 << 4;
    int _1780 = _1778 + 512;
    float _1782 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1784 = abs(_1012);
    float _1786 = _1720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1788 = _1690 * 6.283185482025146484375;
    float _1790 = cos(_1788);
    float _1792 = _1728 * _1746;
    float _1794 = _1718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1796 = _1692 * 6.283185482025146484375;
    float _1798 = cos(_1796);
    float _1800 = _1746 * _1768;
    float _1802 = _1728 * _1768;
    float _1804 = _1710 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1790 * _1746;
    uint _1810 = uint(int(uint(_1772) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    float _1826 = _1790 * _1798;
    float _1828 = _1790 * _1768;
    float _1830 = _1728 * _1798;
    float _1832 = _1798 * _1768;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1840 = fma(_1806, _1826, _1792);
    float _1842 = fma(_1806, _1792, _1826);
    float _1844 = -_1808;
    float _1846 = fma(_1806, _1830, _1844);
    uint _1848 = uint(int(uint(_1780) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    float _1864 = -_1830;
    float _1866 = fma(_1806, _1808, _1864);
    float _1868 = -_1730;
    float _1870 = _1806 * _1868;
    float _1872 = _1828 * _1730;
    float _1874 = _1802 * _1730;
    float _1876 = -_1806;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1834);
    float _1880 = -_1806;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1836);
    float _1884 = -_1806;
    float _1886 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1838);
    float _1888 = fma(_1832, _1750, _1870);
    int _1890 = _1780 + 8;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    float _1908 = fma(_1840, _1750, _1872);
    float _1910 = fma(_1846, _1750, _1874);
    float _1912 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1916 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1918 = abs(_1054);
    float _1920 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    int _1922 = _1772 + 8;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    float _1940 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1914);
    float _1942 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1916);
    float _1944 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1878);
    float _1946 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1882);
    float _1948 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1886);
    int _1950 = abs(_1302);
    float _1952 = fma(_1866, _1762, _1908);
    float _1954 = fma(_1800, _1762, _1888);
    float _1956 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1958 = ~_1950;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    float _1964 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1966 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1968 = ~_1918;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1956);
    int _1976 = _1088 * as_type<int>(_1824);
    float _1978 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1964);
    float _1980 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1966);
    int _1982 = abs(_1222);
    int _1984 = _1962 * as_type<int>(_1816);
    int _1986 = _1984 + _1976;
    float _1988 = fma(_1842, _1762, _1910);
    int _1990 = abs(_1230);
    float _1992 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1974);
    int _1994 = ~_1216;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    float _2000 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2002 = int(_2000);
    int _2004 = ~_1990;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1978);
    float _2012 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    int _2014 = _1972 * as_type<int>(_1862);
    int _2016 = ~_1982;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    float _2022 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2024 = int(_2022);
    int _2026 = _1998 * as_type<int>(_1854);
    int _2028 = _2026 + _2014;
    int _2030 = _2008 * as_type<int>(_1898);
    int _2032 = _2030 + _2028;
    int _2034 = abs(_1338);
    float _2036 = float(uint(_2002));
    int _2038 = ~_2034;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = ~_2002;
    int _2046 = _2044 + 1;
    int _2048 = _1248 * as_type<int>(_1930);
    int _2050 = _2048 + _1986;
    float _2052 = float(uint(_2024));
    int _2054 = _2042 * as_type<int>(_1906);
    int _2056 = _2054 + _2032;
    int _2058 = abs(_2024);
    int _2060 = _2020 * as_type<int>(_1938);
    int _2062 = _2060 + _2050;
    int _2064 = ~_1280;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = 1.0 / _2036;
    int _2072 = ~_1784;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    int _2078 = _2062 * _2068;
    bool _2080 = !_698;
    int _2082 = _2080 ? _1776 : (-1);
    int _2084 = _2056 * _2076;
    int _2086 = abs(_2002);
    float _2088 = 1.0 / _2052;
    int _2090 = _1080 * _1280;
    int _2092 = _2090 + _2078;
    float _2094 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2096 = _2082 * _1784;
    int _2098 = _2096 + _2084;
    float _2100 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2102 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    float _2104 = float(uint(_2092));
    float _2106 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2100);
    float _2108 = float(uint(_2058));
    float _2110 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2102);
    int _2112 = as_type<int>(_2070) + (-2);
    float _2114 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2106);
    float _2116 = float(uint(_2098));
    float _2118 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2120 = float(uint(_2086));
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2124 = as_type<int>(_2088) + (-2);
    float _2126 = 1.0 / _2108;
    float _2128 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2130 = as_type<float>(_2112) * _2116;
    float _2132 = _1782 + _2118;
    float _2134 = as_type<float>(_2124) * _2104;
    float _2136 = _1786 + _2122;
    float _2138 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2142 = _2132 + _2140;
    float _2144 = 1.0 / _2120;
    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2148 = _2136 + _2146;
    int _2150 = abs(_2092);
    float _2152 = _2142 * _2142;
    int _2154 = ~_2024;
    int _2156 = _2154 + 1;
    float _2158 = _2148 * _2148;
    float _2160 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2138);
    float _2162 = trunc(_2134);
    float _2164 = precise::max(_2162, 0.0);
    uint _2166 = uint(_2164);
    float _2168 = _2152 + _2158;
    int _2170 = as_type<int>(_2126) + (-2);
    float _2172 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2174 = abs(_2098);
    float _2176 = float(uint(_2150));
    float _2178 = _1794 + _2172;
    float _2180 = trunc(_2130);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    int _2186 = as_type<int>(_2144) + (-2);
    float _2188 = float(uint(_2174));
    float _2190 = as_type<float>(_2170) * _2176;
    int _2192 = ~_2086;
    int _2194 = _2192 + 1;
    float _2196 = sqrt(_2168);
    int _2198 = _2156 * int(_2166);
    int _2200 = _2198 + _2092;
    int _2202 = _2046 * int(_2184);
    int _2204 = _2202 + _2098;
    float _2206 = as_type<float>(_2186) * _2188;
    float _2208 = float(uint(_2200));
    float _2210 = trunc(_2190);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = float(uint(_2204));
    float _2218 = as_type<float>(_2124) * _2208;
    bool _2220 = _2196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2222 = as_type<float>(_2112) * _2216;
    float _2224 = trunc(_2206);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    int _2230 = ~_2058;
    int _2232 = _2230 + 1;
    float _2234 = trunc(_2218);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = _2232 * int(_2214);
    int _2242 = _2240 + _2150;
    float _2244 = _1842;
    float _2246 = _2152;
    float _2248 = _2158;
    float _2250 = _2132;
    float _2252 = _2136;
    if (!_2220)
    {
        _2244 = _2152;
    }
    float _2254 = _2244;
    float _2256 = _2254;
    if (!_2220)
    {
        _2246 = _2178;
    }
    float _2258 = _2246;
    float _2260 = float(uint(_2242));
    int _2262 = _2194 * int(_2228);
    int _2264 = _2262 + _2174;
    float _2266 = float(uint(_2264));
    bool _2268 = !_2220;
    float _2270 = _2258;
    if (!_2268)
    {
        float _2272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2276 = _2196 + _2274;
        float _2278 = rsqrt(_2168);
        float _2280 = _2276 * _2272;
        float _2282 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = _2280 * 0.15915493667125701904296875;
        float _2286 = _2284 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2284 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = fma(_2288, _2282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2296 = _2278 * _2294;
        float _2298 = _2292 + (-1.0);
        float _2300 = fma(_2142, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2302 = fma(_2148, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2308 = _2300 + _2306;
        float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2312 = _2302 + _2310;
        float _2314 = fma(_2178, _2292, _2304);
        float _2316 = _2308 * _2308;
        float _2318 = _2312 * _2312;
        _2270 = _2314;
        _2256 = _2316;
        _2248 = _2318;
        _2250 = _2300;
        _2252 = _2302;
    }
    float _2320 = _2270;
    float _2322 = _2256;
    float _2324 = _2248;
    float _2326 = _2250;
    float _2328 = _2252;
    bool _2330 = _209 > 0.5;
    float _2332 = as_type<float>(_2170) * _2260;
    float _2334 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1920);
    float _2336 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _2338 = -_185;
    int _2340 = _2330 ? as_type<int>(_2338) : as_type<int>(_185);
    float _2342 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1942);
    bool _2344 = _217 > 0.5;
    float _2346 = as_type<float>(_2186) * _2266;
    float _2348 = -_181;
    int _2350 = _1656 ? as_type<int>(_2348) : as_type<int>(_181);
    float _2352 = trunc(_2332);
    float _2354 = precise::max(_2352, 0.0);
    uint _2356 = uint(_2354);
    float _2358 = -_181;
    int _2360 = _2344 ? as_type<int>(_2358) : as_type<int>(_181);
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2364 = _2320 + _2362;
    bool _2366 = !_1382;
    float _2368 = _2366 ? _185 : as_type<float>(_2340);
    float _2370 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2372 = !_1378;
    float _2374 = _2372 ? _181 : as_type<float>(_2360);
    float _2376 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2378 = !_1396;
    float _2380 = _2378 ? _181 : as_type<float>(_2350);
    float _2382 = trunc(_2222);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = _2370 * _1944;
    float _2390 = _2370 * _1946;
    float _2392 = _2370 * _1948;
    int _2394 = int(_2166) + int(_2238);
    float _2396 = fma(_2376, _2334, _2388);
    int _2398 = ~_2024;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2376, _2336, _2390);
    float _2404 = trunc(_2346);
    float _2406 = precise::max(_2404, 0.0);
    uint _2408 = uint(_2406);
    float _2410 = fma(_2376, _2342, _2392);
    float _2412 = fma(_2364, _2364, _2322);
    int _2414 = int(_2214) + int(_2356);
    float _2416 = -_1174;
    float _2418 = _2416 + 1.0;
    int _2420 = ~_2058;
    int _2422 = _2420 + 1;
    float _2424 = _2412 + _2324;
    float _2426 = -_1272;
    float _2428 = _2426 + 1.0;
    int _2430 = int(_2184) + int(_2386);
    float _2432 = -_1142;
    float _2434 = _2432 + 1.0;
    int _2436 = ~_2002;
    int _2438 = _2436 + 1;
    float _2440 = sqrt(_2424);
    float _2442 = -_1144;
    float _2444 = _2442 + 1.0;
    int _2446 = ~_2086;
    int _2448 = _2446 + 1;
    float _2450 = fma(_448, _2418, _1758);
    int _2452 = int(_2228) + int(_2408);
    int _2454 = _2400 * _2394;
    int _2456 = _2454 + _2092;
    int _2458 = _2438 * _2430;
    int _2460 = _2458 + _2098;
    bool _2462 = _2002 == 0;
    int _2464 = _2422 * _2414;
    int _2466 = _2464 + _2150;
    bool _2468 = uint(_2456) >= uint(_2024);
    int _2470 = _2448 * _2452;
    int _2472 = _2470 + _2174;
    bool _2474 = uint(_2460) >= uint(_2002);
    float _2476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2478 = uint(_2466) >= uint(_2058);
    out.m_72.x = _2334;
    out.m_72.y = _2336;
    out.m_72.z = _2342;
    bool _2480 = !_2468;
    int _2482 = _2480 ? 0 : (-1);
    bool _2484 = !_2474;
    int _2486 = _2484 ? 0 : (-1);
    int _2488 = ~_2394;
    int _2490 = _2488 + _2482;
    int _2492 = _2490 + 1;
    int _2494 = ~_2430;
    int _2496 = _2494 + _2486;
    int _2498 = _2496 + 1;
    int _2500 = _2092 ^ _2024;
    int _2502 = _2024 * _2492;
    int _2504 = _2502 + _2092;
    bool _2506 = _2024 == 0;
    int _2508 = _2002 * _2498;
    int _2510 = _2508 + _2098;
    bool _2512 = _2024 == 0;
    bool _2514 = !_2478;
    int _2516 = _2514 ? 0 : (-1);
    uint _2518 = uint(int(uint(_2500) >> uint(31)));
    bool _2520 = uint(_2472) >= uint(_2086);
    float _2522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2524 = ~_2516;
    int _2526 = _2414 + _2524;
    int _2528 = _2526 + 1;
    int _2530 = ~int(_2518);
    int _2532 = _2530 + 1;
    int _2534 = _2098 ^ _2002;
    bool _2536 = !_2506;
    int _2538 = _2536 ? _2504 : (-1);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2542 = _2528 ^ _2532;
    bool _2544 = _2002 == 0;
    uint _2546 = uint(int(uint(_2534) >> uint(31)));
    float _2548 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2550 = float(_2538);
    float _2552 = fma(_2370, _2370, 1.0);
    int _2554 = ~_2532;
    int _2556 = _2554 + _2542;
    int _2558 = _2556 + 1;
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2562 = !_2462;
    int _2564 = _2562 ? _2510 : (-1);
    float _2566 = fma(_2548, _2550, _1154);
    bool _2568 = !_2520;
    int _2570 = _2568 ? 0 : (-1);
    int _2572 = ~int(_2546);
    int _2574 = _2572 + 1;
    float _2576 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2578 = float(_2564);
    float _2580 = _2380 + 0.5;
    int _2582 = ~_2570;
    int _2584 = _2452 + _2582;
    int _2586 = _2584 + 1;
    float _2588 = rsqrt(_2552);
    float _2590 = _2374 + 0.5;
    float _2592 = fma(_2576, _2578, _1182);
    int _2594 = _2586 ^ _2574;
    float _2596 = fma(_2548, _2580, _2566);
    bool _2598 = !_2512;
    int _2600 = _2598 ? _2558 : (-1);
    float _2602 = fma(_2576, _2590, _2592);
    int _2604 = ~_2574;
    int _2606 = _2604 + _2594;
    int _2608 = _2606 + 1;
    float _2610 = -_1268;
    float _2612 = _2610 + 1.0;
    float _2614 = float(_2600);
    float _2616 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2618 = !_2544;
    int _2620 = _2618 ? _2608 : (-1);
    float _2622 = -_2428;
    float _2624 = fma(_2380, _2622, _2596);
    bool _2626 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2628 = isnan(_2440);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2634 = _2630 || _2632;
    float _2636 = -_1106;
    float _2638 = fma(_2616, _2614, _2636);
    float _2640 = _2368 + (-0.5);
    float _2642 = float(_2620);
    float _2644 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2646 = -_2616;
    float _2648 = fma(_2646, _2640, _2638);
    float _2650 = _2370 * _2588;
    float _2652 = -_1184;
    float _2654 = fma(_2644, _2642, _2652);
    float _2656 = _524 + (-0.5);
    float _2658 = -_2612;
    float _2660 = fma(_438, _2658, _1722);
    float _2662 = -_1992;
    float _2664 = _2650 * _2662;
    float _2666 = -_2010;
    float _2668 = _2650 * _2666;
    float _2670 = -_2644;
    float _2672 = fma(_2670, _2656, _2654);
    float _2674 = -_2012;
    float _2676 = _2650 * _2674;
    float _2678 = fma(_2588, _1944, _2664);
    float _2680 = fma(_2588, _1946, _2668);
    float _2682 = -_1252;
    float _2684 = _2682 + 1.0;
    float _2686 = fma(_2588, _1948, _2676);
    float _2688 = _1992 + _2396;
    float _2690 = _2010 + _2402;
    float _2692 = _2012 + _2410;
    float _2694 = -_2434;
    float _2696 = fma(_2374, _2694, _2602);
    float _2698 = fma(_2368, _2684, _2648);
    float _2700 = fma(_524, _2444, _2672);
    out.m_74.x = _2660;
    out.m_74.y = _2450;
    float _2702 = _2684;
    float _2704 = _2336;
    float _2706 = _2660;
    if (!_2634)
    {
        _2702 = 1.0;
    }
    float _2708 = _2702;
    out.m_76.x = _2688;
    out.m_76.y = _2690;
    out.m_76.z = _2692;
    out.m_78.x = _2678;
    out.m_78.y = _2680;
    out.m_78.z = _2686;
    out.m_80.x = _2624;
    out.m_80.y = _2698;
    out.m_80.z = _2696;
    out.m_80.w = _2700;
    bool _2710 = !_2634;
    float _2712 = _2708;
    if (!_2710)
    {
        bool _2714 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2716 = isnan(_2440);
        bool _2718 = _2714 || _2716;
        bool _2720 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2722 = _2718 || _2720;
        if (!_2722)
        {
            float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2726 = _2440 + _2724;
            float _2728 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2730 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2728;
            float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2736 = 1.0 / _2730;
            float _2738 = _2726 * _2736;
            float _2740 = fma(_2738, _2734, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2712 = _2740;
            _2704 = _2736;
            _2742 = true;
        }
        else
        {
            bool _2744 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2746 = isnan(_2440);
            bool _2748 = _2744 || _2746;
            bool _2750 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2752 = _2748 || _2750;
            if (!_2752)
            {
                float _2754 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2756 = _2440 + _2754;
                float _2758 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2760 = _2758 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2764 = _2762 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2766 = 1.0 / _2760;
                float _2768 = _2756 * _2766;
                float _2770 = fma(_2768, _2764, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2712 = _2770;
                _2704 = _2766;
                _2742 = true;
            }
            else
            {
                _2712 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2742 = false;
    float _2772 = _2712;
    float _2774 = _2704;
    float _2776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2778 = _2326 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2782 = _2328 + _2780;
    bool _2784 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan(0.5);
    bool _2792 = _2788 || _2790;
    float _2794 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2796 = _2320 + _2794;
    float _2798 = fma(_2778, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2800 = fma(_2796, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2802 = fma(_2782, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2804 = _2796;
    float _2806 = _2774;
    float _2808 = _2782;
    if (_2792)
    {
        _2804 = _2798;
    }
    float _2810 = _2804;
    float _2812 = _2810;
    if (_2792)
    {
        _2806 = _2800;
    }
    float _2814 = _2806;
    float _2816 = _2814;
    if (_2792)
    {
        _2808 = _2802;
    }
    float _2818 = _2808;
    float _2820 = _2818;
    if (!_2792)
    {
        float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2824 = _1794 + _2822;
        float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2828 = _1782 + _2826;
        float _2830 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2832 = _2824 * _2824;
        float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2836 = _1786 + _2834;
        float _2838 = fma(_2828, _2828, _2832);
        float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2842 = fma(_2836, _2836, _2838);
        float _2844 = sqrt(_2842);
        float _2846 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2848 = precise::min(_2844, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2850 = _2848 * _2840;
        float _2852 = -_1782;
        float _2854 = _2852 + _2798;
        float _2856 = -_1786;
        float _2858 = _2856 + _2802;
        float _2860 = _2846 * _2850;
        float _2862 = -_1794;
        float _2864 = _2862 + _2800;
        float _2866 = fma(_2854, _2860, _1782);
        float _2868 = fma(_2864, _2860, _1794);
        float _2870 = fma(_2858, _2860, _1786);
        _2816 = _2868;
        _2812 = _2866;
        _2820 = _2870;
        _2706 = _2860;
    }
    float _2872 = _2816;
    float _2874 = _2812;
    float _2876 = _2820;
    float _2878 = _2706;
    float _2880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2882 = _2872 + _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2886 = _2874 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2890 = _2876 + _2888;
    float _2892 = _2882 * _2882;
    float _2894 = fma(_2886, _2886, _2892);
    float _2896 = fma(_2890, _2890, _2894);
    float _2898 = rsqrt(_2896);
    float _2900 = sqrt(_2896);
    float _2902 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2904 = _2886 * _2902;
    float _2906 = _2890 * _2902;
    float _2908 = _2904 * _2904;
    float _2910 = _2906 * _2906;
    float _2912 = _2908 + _2910;
    float _2914 = sqrt(_2912);
    bool _2916 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2914 + _2918;
    float _2922 = _2450;
    float _2924 = _2920;
    float _2926 = _2882;
    float _2928 = _2902;
    float _2930 = _2904;
    if (_2916)
    {
        float _2932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2922 = _2932;
    }
    float _2934 = _2922;
    float _2936 = _2934;
    if (_2916)
    {
        float _2938 = _2920 * _2934;
        _2924 = _2938;
    }
    float _2940 = _2924;
    if (_2916)
    {
        float _2942 = rsqrt(_2912);
        _2936 = _2942;
    }
    float _2944 = _2936;
    float _2946 = _2944;
    if (_2916)
    {
        float _2948 = _2940 * 0.15915493667125701904296875;
        _608 = _2948;
    }
    float _2950 = _608;
    float _2952 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2954 = _2890;
    if (_2916)
    {
        float _2956 = _2950 * 6.283185482025146484375;
        float _2958 = sin(_2956);
        _2954 = _2958;
    }
    float _2960 = _2954;
    float _2962 = precise::max(0.0, _2952);
    float _2964 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2966 = _2878;
    float _2968 = _2962;
    if (_2916)
    {
        float _2970 = _2950 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        _2966 = _2972;
    }
    float _2974 = _2966;
    float _2976 = -_2902;
    float _2978 = -_2962;
    float _2980 = fma(_2882, _2976, _2978);
    if (_2916)
    {
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2926 = _2982;
    }
    float _2984 = _2926;
    float _2986 = _2960;
    float _2988 = _2984;
    if (_2916)
    {
        float _2990 = fma(_2960, _2984, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2986 = _2990;
    }
    float _2992 = _2986;
    float _2994 = _2992;
    if (!_2916)
    {
        _2988 = _2980;
    }
    float _2996 = _2988;
    float _2998 = _2996;
    if (_2916)
    {
        float _3000 = _2944 * _2992;
        _2928 = _3000;
    }
    float _3002 = _2928;
    if (!_2916)
    {
        _2994 = _2908;
    }
    float _3004 = _2994;
    float _3006 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3008 = _3004;
    float _3010 = _2974;
    if (_2916)
    {
        float _3012 = _2974 + (-1.0);
        _2968 = _3012;
    }
    float _3014 = _2968;
    float _3016 = _3014;
    if (_2916)
    {
        float _3018 = _2904 * _3002;
        _2930 = _3018;
    }
    float _3020 = _2930;
    float _3022 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3006);
    if (_2916)
    {
        float _3024 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2946 = _3024;
    }
    float _3026 = _2946;
    if (!_2916)
    {
        _3016 = _2906;
    }
    float _3028 = _3016;
    float _3030 = _3028;
    if (_2916)
    {
        float _3032 = _2906 * _3002;
        _3030 = _3032;
    }
    float _3034 = _3030;
    if (_2916)
    {
        float _3036 = _3020 * _3020;
        _3008 = _3036;
    }
    float _3038 = _3008;
    if (_2916)
    {
        float _3040 = fma(_2980, _2974, _3026);
        _2998 = _3040;
    }
    float _3042 = _2998;
    if (!_2916)
    {
        _3010 = _2910;
    }
    float _3044 = _3010;
    float _3046 = _3044;
    if (_2916)
    {
        float _3048 = _3034 * _3034;
        _3046 = _3048;
    }
    float _3050 = _3046;
    float _3052 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3022);
    float _3054 = fma(_3042, _3042, _3038);
    float _3056 = _3052 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3058 = _3054 + _3050;
    float _3060 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3064 = fma(_2900, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3062);
    float _3066 = precise::clamp(_3064, 0.0, 1.0);
    float _3068 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3070 = rsqrt(_3058);
    float _3072 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    float _3074 = -_3066;
    float _3076 = _3074 + 1.0;
    float _3078 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3068);
    float _3080 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3072);
    float _3082 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3084 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3078);
    float _3086 = abs(_3076);
    float _3088 = log2(_3086);
    float _3090 = _3080 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3092 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3082);
    float _3094 = _3084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3096 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3098 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3092);
    float _3100 = _3070 * _3020;
    float _3102 = -_3096;
    float _3104 = fma(_3102, _2964, 1.0);
    float _3106 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3108 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3110 = _3070 * _3042;
    float _3112 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3114 = _3070 * _3034;
    float _3116 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3108);
    float _3118 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3120 = -_3112;
    float _3122 = fma(_3110, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3120);
    float _3124 = log2(_3104);
    float _3126 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3116);
    float _3128 = -_3114;
    float _3130 = fma(_3128, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3122);
    float _3132 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3134 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3126);
    float _3136 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3138 = fma(_3130, -0.5, 0.5);
    float _3140 = exp2(_3118);
    float _3142 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3132);
    float _3144 = fma(_3130, 0.5, 0.5);
    float _3146 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3136);
    float _3148 = _3110 + 1.0;
    float _3150 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3142);
    float _3152 = fma(_3144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3154 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3146);
    float _3156 = 1.0 / _3134;
    float _3158 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3150);
    float _3160 = fma(_3144, _3152, -0.212114393711090087890625);
    float _3162 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3154);
    float _3164 = _3124 * 0.693147182464599609375;
    float _3166 = fma(_3144, _3160, 1.570728778839111328125);
    float _3168 = sqrt(_3138);
    float _3170 = -_3110;
    float _3172 = fma(_3140, _3148, _3170);
    float _3174 = _3164 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3176 = fma(_3172, 0.5, 0.5);
    float _3178 = _3158 * _3156;
    float _3180 = _3162 * _3156;
    float _3182 = fma(_3178, 0.5, 0.5);
    float _3184 = fma(_3180, -0.5, 0.5);
    float _3186 = _3168 * 0.636619746685028076171875;
    float3 _7953 = float3(_3182, _3184, _3174);
    float _3188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7953, float3(0.0), isnan(_7953)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7953, float3(0.0), isnan(_7953)), level(0.0)).x;
    float3 _7964 = float3(_3182, _3184, _3174);
    float4 _3191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7964, float3(0.0), isnan(_7964)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7964, float3(0.0), isnan(_7964)), level(0.0)).xyzw;
    float _3193 = _3191.x;
    float _3195 = _3191.y;
    float _3197 = _3191.z;
    float _3199 = _3191.w;
    float _3201 = -_3166;
    float _3203 = fma(_3186, _3201, 1.0);
    float2 _7986 = float2(_3203, _3176);
    float3 _3207 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7986, float2(0.0), isnan(_7986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7986, float2(0.0), isnan(_7986)), level(0.0)).xyz;
    float _3209 = _3207.x;
    float _3211 = _3207.y;
    float _3213 = _3207.z;
    float _3215 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3217 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3219 = _3158 + _3134;
    float _3221 = _3134 * 0.5;
    out.m_82.x = _2874;
    out.m_82.y = _2872;
    out.m_82.z = _2876;
    float _3223 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3217);
    float _3225 = exp2(_3215);
    float _3227 = _3219 * 0.5;
    float _3229 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3223);
    float _3231 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3229);
    float _3233 = fma(_3162, -0.5, _3221);
    float _3235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3237 = _3231 + _3134;
    out.gl_Position.x = _3158;
    out.gl_Position.y = _3162;
    out.gl_Position.z = _3231;
    out.gl_Position.w = _3134;
    float _3239 = _3237 * 0.5;
    float _3241 = -_3225;
    float _3243 = _3241 + 1.0;
    out.m_47.x = _3235;
    float _3245 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3227;
    out.m_84.y = _3233;
    out.m_84.z = _3239;
    out.m_84.w = _3134;
    float _3247 = -_3245;
    float _3249 = _3247 + 1.0;
    float _3251 = _3245 * _3188;
    float _3253 = _3199 * _3249;
    float _3255 = _3199 * _3251;
    float _3257 = _3213 * _3251;
    float _3259 = fma(_3209, _3255, _3193);
    float _3261 = fma(_3211, _3255, _3195);
    float _3263 = fma(_3199, _3257, _3197);
    out.m_86.x = _3259;
    out.m_86.y = _3261;
    out.m_86.z = _3263;
    out.m_86.w = _3253;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2742 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_121);
        out.gl_Position.z = _3321;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_49.w;
    float _127 = float(_105);
    float _129 = in.m_51.x;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    out.m_53.x = _129;
    bool _145 = _133 >= _127;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    float _151 = 1.0 / _127;
    float _153 = _133;
    if (_149)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _113;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    float _161 = _133 * _151;
    float _163 = _161;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3395 = as_type<float>(_159);
        out.gl_Position.z = _3395;
    }
    out.m_55.x = _161;
    if (_149)
    {
        return out;
    }
    float _165 = in.m_44.x;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = as_type<float>(int(gl_VertexIndex));
    out.m_60.x = _165;
    int _171 = as_type<int>(_169) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_169) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _163 = _201;
    }
    float _203 = _163;
    float _205 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _207 = int(_205);
    float _209 = in.m_51.y;
    float _211 = _151 * _133;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _215 = _213 != 0;
    float _217 = in.m_51.z;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = in.m_51.w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _229 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _231 = int(_229);
    float _233 = float(_207);
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _239 = in.m_44.y;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _203 + _241;
    float _245 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[88].z, _235);
    float _247 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _249 = int(_247);
    float _251 = float(_221);
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[88].w, _237);
    bool _255 = _209 > 0.5;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _203 + _257;
    bool _261 = _217 > 0.5;
    float _263 = 1.0 / _251;
    float _265 = float(uint(_231));
    int _267 = ~_231;
    int _269 = _267 + 1;
    int _271 = ~_231;
    int _273 = _271 + 1;
    float _275 = 1.0 / _233;
    float _277 = float(uint(_249));
    int _279 = ~_249;
    int _281 = _279 + 1;
    bool _283 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_203);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_203);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = _263 * _133;
    float _309 = 1.0 / _265;
    bool _311 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_203);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = _275 * _133;
    float _325 = trunc(_307);
    int _327 = int(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _329;
    float _333 = 1.0 / _277;
    int _335 = as_type<int>(_309) + (-2);
    float _337 = trunc(_323);
    int _339 = int(_337);
    float _341 = float(uint(_327));
    float _343 = as_type<float>(_335) * _341;
    float _345 = _341;
    if (_215)
    {
        _345 = 1.0;
    }
    float _347 = _345;
    float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _351 = log2(_349);
    int _353 = as_type<int>(_333) + (-2);
    float _355 = _347;
    if (!_215)
    {
        _355 = 7.345489978790283203125;
    }
    float _357 = _355;
    float _359 = float(uint(_339));
    float _361 = trunc(_343);
    float _363 = precise::max(_361, 0.0);
    uint _366 = uint(_363);
    float _368 = _357 * _129;
    float _370 = as_type<float>(_353) * _359;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = ~_249;
    int _380 = _378 + 1;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _396 = _394 != 0;
    int _398 = _269 * int(_366);
    int _400 = _398 + _327;
    bool _402 = !_396;
    int _404 = _402 ? 0 : 1;
    float _406 = float(uint(_400));
    float _408 = floor(_368);
    int _410 = _380 * int(_376);
    int _412 = _410 + _339;
    int _414 = abs(_404);
    float _416 = as_type<float>(_335) * _406;
    float _418 = float(uint(_412));
    float _420 = trunc(_416);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    float _426 = as_type<float>(_353) * _418;
    float _428 = -_181;
    int _430 = _255 ? as_type<int>(_428) : as_type<int>(_181);
    float _432 = -_185;
    int _434 = _261 ? as_type<int>(_432) : as_type<int>(_185);
    bool _436 = !_388;
    float _438 = _436 ? _181 : as_type<float>(_430);
    float _440 = trunc(_426);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    bool _446 = !_392;
    float _448 = _446 ? _185 : as_type<float>(_434);
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _464 = _462 != 0;
    int _466 = int(_366) + int(_424);
    bool _468 = !_464;
    int _470 = _468 ? 0 : 1;
    bool _472 = _223 > 0.5;
    int _474 = _273 * _466;
    int _476 = _474 + _327;
    float _478 = float(_327);
    float _480 = -_408;
    float _482 = _368 + _480;
    float _484 = -_185;
    int _486 = _472 ? as_type<int>(_484) : as_type<int>(_185);
    int _488 = int(_376) + int(_444);
    float _490 = float(_231);
    bool _492 = uint(_476) >= uint(_231);
    int _494 = _281 * _488;
    int _496 = _494 + _339;
    bool _498 = _478 >= _490;
    bool _500 = isnan(_478);
    bool _502 = _498 || _500;
    bool _504 = isnan(_490);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _482 * _490;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _514 = _512 != 0;
    bool _516 = uint(_496) >= uint(_249);
    float _518 = trunc(_508);
    int _520 = int(_518);
    bool _522 = !_384;
    float _524 = _522 ? _185 : as_type<float>(_486);
    bool _526 = !_514;
    int _528 = _526 ? 0 : 1;
    bool _530 = !_492;
    float _532 = _530 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _534 = !_516;
    int _536 = _534 ? 0 : (-1);
    float _538 = trunc(_510);
    int _540 = int(_538);
    bool _542 = !_456;
    int _544 = _542 ? 0 : 1;
    float _546 = _490 * _211;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _566 = _564 != 0;
    int _568 = ~_466;
    int _570 = _568 + as_type<int>(_532);
    int _572 = _570 + 1;
    float _574 = trunc(_546);
    int _576 = int(_574);
    bool _578 = !_554;
    int _580 = _578 ? 0 : 1;
    bool _582 = _231 == 0;
    int _584 = _231 * _572;
    int _586 = _584 + _327;
    int _588 = ~_520;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    int _594 = _231 + (-1);
    int _596 = _540 * _414;
    int _598 = _596 + _327;
    bool _600 = !_582;
    int _602 = _600 ? _586 : (-1);
    float _604 = _490;
    float _606 = _532;
    float _608 = _524;
    if (_566)
    {
        _604 = _129;
    }
    float _610 = _604;
    float _612 = _610;
    if (_566)
    {
        _606 = 1.0;
    }
    float _614 = _606;
    int _616 = _602 * _592;
    float _618 = _614;
    if (!_566)
    {
        _612 = _209;
    }
    float _620 = _612;
    if (!_566)
    {
        _618 = 1.2345600128173828125;
    }
    float _622 = _618;
    int _624 = _520 * _594;
    int _626 = _624 + _616;
    bool _628 = !_452;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_460;
    int _634 = _632 ? 0 : 1;
    float _636 = _620 * _622;
    int _638 = abs(_544);
    int _640 = abs(_630);
    float _642 = floor(_636);
    float _644 = float(_249);
    int _646 = _626 * _638;
    float _648 = float(_339);
    int _650 = abs(_634);
    int _652 = _576 * _640;
    int _654 = _652 + _646;
    int _656 = abs(_470);
    float _658 = _644 * _211;
    bool _660 = _648 >= _644;
    bool _662 = isnan(_648);
    bool _664 = _660 || _662;
    bool _666 = isnan(_644);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = trunc(_658);
    int _674 = int(_672);
    int _676 = ~_488;
    int _678 = _676 + _536;
    int _680 = _678 + 1;
    int _682 = _598 * _650;
    int _684 = _682 + _654;
    float _686 = -_642;
    float _688 = _636 + _686;
    bool _690 = !_550;
    int _692 = _690 ? 0 : 1;
    int _694 = _540 * _656;
    int _696 = _694 + _684;
    bool _698 = _249 == 0;
    float _700 = trunc(_670);
    int _702 = int(_700);
    int _704 = _249 * _680;
    int _706 = _704 + _339;
    float _708 = _688 * _644;
    float _710 = float(uint(_696));
    int _712 = abs(_580);
    bool _714 = !_698;
    int _716 = _714 ? _706 : (-1);
    float _718 = as_type<float>(_335) * _710;
    float _720 = trunc(_708);
    int _722 = int(_720);
    int _724 = _249 + (-1);
    int _726 = ~_231;
    int _728 = _726 + 1;
    int _730 = ~_702;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = trunc(_718);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = abs(_692);
    bool _744 = !_562;
    int _746 = _744 ? 0 : 1;
    int _748 = _716 * _734;
    int _750 = _702 * _724;
    int _752 = _750 + _748;
    int _754 = abs(_528);
    bool _756 = !_558;
    int _758 = _756 ? 0 : 1;
    int _760 = _752 * _712;
    int _762 = abs(_758);
    int _764 = _728 * int(_740);
    int _766 = _764 + _696;
    int _768 = _722 * _754;
    int _770 = _768 + _339;
    int _772 = abs(_746);
    int _774 = _674 * _742;
    int _776 = _774 + _760;
    float _778 = float(uint(_766));
    int _780 = ~_249;
    int _782 = _780 + 1;
    int _784 = _770 * _762;
    int _786 = _784 + _776;
    float _788 = as_type<float>(_335) * _778;
    int _790 = _722 * _772;
    int _792 = _790 + _786;
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    float _800 = float(uint(_792));
    float _802 = as_type<float>(_353) * _800;
    int _804 = ~_231;
    int _806 = _804 + 1;
    float _808 = trunc(_802);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    int _814 = int(_740) + int(_798);
    int _816 = _806 * _814;
    int _818 = _816 + _696;
    float _820 = float(uint(_598));
    int _822 = ~_231;
    int _824 = _822 + 1;
    bool _826 = uint(_818) >= uint(_231);
    float _828 = as_type<float>(_335) * _820;
    int _830 = _782 * int(_812);
    int _832 = _830 + _792;
    bool _834 = !_826;
    int _836 = _834 ? 0 : (-1);
    float _838 = trunc(_828);
    float _840 = precise::max(_838, 0.0);
    uint _842 = uint(_840);
    float _844 = float(uint(_832));
    int _846 = ~_814;
    int _848 = _846 + _836;
    int _850 = _848 + 1;
    float _852 = _209 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _854 = as_type<float>(_353) * _844;
    int _856 = _231 * _850;
    int _858 = _856 + _696;
    int _860 = ~_249;
    int _862 = _860 + 1;
    float _864 = trunc(_854);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    bool _870 = !_582;
    int _872 = _870 ? _858 : (-1);
    int _874 = _824 * int(_842);
    int _876 = _874 + _598;
    int _878 = _872 & 3;
    bool _880 = _878 != 0;
    int _882 = _872 & 3;
    bool _884 = _882 != 0;
    int _886 = _880 ? 0 : 1;
    bool _888 = uint(_882) > 1u;
    float _890 = float(uint(_876));
    int _892 = ~_886;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = int(_812) + int(_868);
    float _900 = as_type<float>(_335) * _890;
    int _902 = ~_231;
    int _904 = _902 + 1;
    int _906 = _862 * _898;
    int _908 = _906 + _792;
    int _910 = _896;
    int _912 = int(_842);
    float _914 = as_type<float>(_904);
    float _916 = as_type<float>(_898);
    if (!_888)
    {
        int _918 = ~_886;
        int _920 = _918 + 1;
        _910 = _920;
    }
    int _922 = _910;
    float _924 = trunc(_900);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    bool _930 = uint(_882) >= 2u;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _934 = abs(_922);
    int _936 = _930 ? 0 : 1;
    bool _938 = uint(_908) >= uint(_249);
    int _940 = ~_936;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    bool _946 = !_938;
    int _948 = _946 ? 0 : (-1);
    bool _950 = _882 != 3;
    int _952 = ~_898;
    int _954 = _952 + _948;
    int _956 = _954 + 1;
    int _958 = int(_842) + int(_928);
    int _960 = _944;
    int _962 = _936;
    float _964 = as_type<float>(_928);
    if (_566)
    {
        _912 = 0;
    }
    int _966 = _912;
    int _968 = _249 * _956;
    int _970 = _968 + _792;
    int _972 = _966;
    if (!_566)
    {
        _972 = 1;
    }
    int _974 = _972;
    bool _976 = !_698;
    int _978 = _976 ? _970 : (-1);
    int _980 = _904 * _958;
    int _982 = _980 + _598;
    float _984 = as_type<float>(_974);
    if (_950)
    {
        int _986 = ~_936;
        int _988 = _986 + 1;
        _960 = _988;
    }
    int _990 = _960;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _994 = _992 != 0;
    bool _996 = uint(_982) >= uint(_231);
    bool _998 = !_994;
    int _1000 = _998 ? 0 : 1;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1004 = _1002 != 0;
    bool _1006 = !_996;
    int _1008 = _1006 ? 0 : (-1);
    bool _1010 = !_1004;
    int _1012 = _1010 ? 0 : 1;
    int _1014 = _978 & 3;
    bool _1016 = _1014 != 0;
    int _1018 = _978 & 3;
    bool _1020 = _1018 != 0;
    int _1022 = _1016 ? 0 : 1;
    bool _1024 = uint(_1018) > 1u;
    int _1026 = ~_1022;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    int _1032 = _1030;
    if (_566)
    {
        _962 = 0;
    }
    int _1034 = _962;
    int _1036 = _1034;
    if (!_566)
    {
        _1036 = 2;
    }
    int _1038 = _1036;
    int _1040 = ~_958;
    int _1042 = _1040 + _1008;
    int _1044 = _1042 + 1;
    float _1046 = _209 * 2.0;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1024)
    {
        int _1050 = ~_1022;
        int _1052 = _1050 + 1;
        _1032 = _1052;
    }
    int _1054 = _1032;
    int _1056 = _231 * _1044;
    int _1058 = _1056 + _598;
    bool _1060 = uint(_1018) >= 2u;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1064 = floor(_1046);
    int _1066 = _1060 ? 0 : 1;
    bool _1068 = _974 != 1;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1072 = ~_1066;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_582;
    int _1080 = _1078 ? _1058 : (-1);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1084 = ~_934;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1092 = abs(_990);
    float _1094 = fma(_852, -2.0, _1082);
    int _1096 = _1076;
    if (!_1068)
    {
        _914 = _209;
    }
    float _1098 = _914;
    float _1100 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1090);
    float _1102 = _1098;
    if (!_1068)
    {
        _964 = _217;
    }
    float _1104 = _964;
    float _1106 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1094);
    float _1108 = _1104;
    if (!_1068)
    {
        _916 = _1098;
    }
    float _1110 = _916;
    float _1112 = _1110;
    if (!_1068)
    {
        _984 = _217;
    }
    float _1114 = _984;
    float _1116 = _1114;
    if (_1068)
    {
        _1112 = _129;
    }
    float _1118 = _1112;
    if (_1068)
    {
        _1102 = _129;
    }
    float _1120 = _1102;
    if (_1068)
    {
        _1108 = _209;
    }
    float _1122 = _1108;
    float _1124 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1068)
    {
        _1116 = _209;
    }
    float _1126 = _1116;
    float _1128 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1048);
    bool _1130 = _1038 != 2;
    float _1132 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1134 = _351 * _133;
    float _1136 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[83].w, _932);
    float _1138 = -_1070;
    float _1140 = fma(_1132, 2.0, _1138);
    float _1142 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1128);
    float _1144 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1136);
    float _1146 = exp2(_1134);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1152 = -_133;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1140);
    float _1156 = _1132;
    if (_1130)
    {
        _1156 = _129;
    }
    float _1158 = _1156;
    float _1160 = fma(_1150, -2.0, _1062);
    float _1162 = _1158;
    if (!_1130)
    {
        _1162 = _217;
    }
    float _1164 = _1162;
    float _1166 = _129 * 2.0;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1170 = -_1148;
    float _1172 = fma(_1124, 2.0, _1170);
    float _1174 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _253);
    float _1176 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1178 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1168);
    float _1180 = -_133;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1172);
    float _1184 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1160);
    float _1186 = -_225;
    float _1188 = fma(_1176, 2.0, _1186);
    float _1190 = _1176;
    if (_1130)
    {
        _1190 = _209;
    }
    float _1192 = _1190;
    float _1194 = -_1146;
    float _1196 = _1194 + 1.0;
    float _1198 = _1192;
    if (!_1130)
    {
        _1198 = _129;
    }
    float _1200 = _1198;
    float _1202 = -_133;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1188);
    bool _1206 = _1018 != 3;
    bool _1208 = !_1020;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1214 = _882 != 3;
    int _1216 = abs(_1210);
    float _1218 = fma(_1212, -2.0, _227);
    bool _1220 = !_1214;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1218);
    if (_1206)
    {
        int _1226 = ~_1066;
        int _1228 = _1226 + 1;
        _1096 = _1228;
    }
    int _1230 = _1096;
    bool _1232 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1234 = isnan(0.0);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1240 = _1236 || _1238;
    float _1242 = floor(_1166);
    int _1244 = ~_1092;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = _1240 ? _1196 : 0.0;
    float _1252 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    bool _1254 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1256 = isnan(1.0);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1262 = _1258 || _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1266 = 1.0 + _1264;
    float _1268 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _245);
    float _1270 = _217 * 2.0;
    float _1272 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1100);
    float _1274 = 1.0 / _1266;
    float _1276 = -_185;
    float _1278 = _1276 + 0.5;
    int _1280 = abs(_1000);
    bool _1282 = _1242 >= 0.0;
    bool _1284 = isnan(_1242);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    if (_1262)
    {
        float _1292 = _1250 * _1274;
        _153 = _1292;
    }
    float _1294 = _153;
    bool _1296 = _1242 > 0.0;
    int _1298 = _1290 ? 0 : 1;
    bool _1300 = !_884;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = ~_1298;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    bool _1310 = _1064 > 0.0;
    bool _1312 = _1064 >= 0.0;
    bool _1314 = isnan(_1064);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan(0.0);
    bool _1320 = _1316 || _1318;
    int _1322 = _1308;
    if (!_1296)
    {
        int _1324 = ~_1298;
        int _1326 = _1324 + 1;
        _1322 = _1326;
    }
    int _1328 = _1322;
    float _1330 = _181 + 0.5;
    bool _1332 = _1018 != 3;
    int _1334 = _1320 ? 0 : 1;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    out.m_62.x = _1330;
    out.m_62.y = _1278;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1350 = _1348 != 0;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1352;
    int _1356 = ~_1334;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1366 = _1360;
    if (!_1310)
    {
        int _1368 = ~_1334;
        int _1370 = _1368 + 1;
        _1366 = _1370;
    }
    int _1372 = _1366;
    float _1374 = 1.0 / _1354;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1378 = _1376 != 0;
    int _1380 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1382 = _1380 != 0;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1386 = 1.0 / _1364;
    float _1388 = _239 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_64.w = _1384;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1390;
    int _1394 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1396 = _1394 != 0;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1400 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1388);
    float _1402 = _243 * _1374;
    float _1404 = float(uint(_770));
    float _1406 = _129 + _217;
    float _1408 = 1.0 / _1392;
    out.m_66.w = _1398;
    float _1410 = _239 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1412 = as_type<float>(_353) * _1404;
    float _1414 = _1406 + (-1.0);
    float _1416 = _239 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1418 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1410);
    float _1420 = trunc(_1412);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1428 = _203 + _1426;
    float _1430 = _129 + _209;
    float _1432 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1416);
    float _1434 = _1428 * _1386;
    float _1436 = _217 + _209;
    float _1438 = _1430 + (-1.0);
    float _1440 = floor(_1270);
    float _1442 = _259 * _1408;
    float _1444 = _1436 + (-1.0);
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1448 = !_1342;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1452;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1458;
    bool _1462 = !_1346;
    int _1464 = _1462 ? 0 : 1;
    float _1466 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1468 = ~_249;
    int _1470 = _1468 + 1;
    float _1472 = fma(_1454, _1402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1474 = fma(_1460, _1402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1480 = float(_1328);
    int _1482 = _1470 * int(_1424);
    int _1484 = _1482 + _770;
    bool _1486 = _1440 >= 0.0;
    bool _1488 = isnan(_1440);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = fma(_331, _1442, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _1498 = !_1350;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1506 = float(uint(_1484));
    bool _1508 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1510 = isnan(_203);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    int _1520 = _1494 ? 0 : 1;
    float _1522 = as_type<float>(_353) * _1506;
    bool _1524 = _1440 > 0.0;
    float _1526 = -_1518;
    float _1528 = _1526 + 1.0;
    float _1530 = in.m_68.x;
    float _1532 = in.m_68.y;
    float _1534 = in.m_68.z;
    float _1536 = _321 * _1528;
    float _1538 = -_321;
    float _1540 = _1538 + 1.0;
    int _1542 = abs(_1464);
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1544;
    float _1548 = _305 * _1540;
    float _1550 = fma(_1478, _1434, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1552 = float(_1542);
    float _1554 = -_305;
    float _1556 = _1554 + 1.0;
    float _1558 = trunc(_1522);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    float _1564 = fma(_1546, _1442, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1566 = fma(_1504, _1434, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1568 = _1552 * _1480;
    float _1570 = _293 * _1556;
    float _1572 = -_293;
    float _1574 = _1572 + 1.0;
    int _1576 = ~_1520;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    float _1582 = _1568 * (-2.0);
    float _1584 = _1472 * _1570;
    float _1586 = _1474 * _1570;
    int _1588 = ~_249;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1456, _1582, _1456);
    float _1594 = fma(_1582, _1532, _1532);
    int _1596 = abs(_1500);
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1584);
    int _1600 = abs(_1450);
    float _1602 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1586);
    int _1604 = int(_1424) + int(_1562);
    float _1606 = _209 + (-0.5);
    float _1608 = float(_1372);
    float _1610 = fma(_1550, _1548, _1598);
    int _1612 = _1590 * _1604;
    int _1614 = _1612 + _770;
    int _1616 = _1580;
    if (!_1524)
    {
        int _1618 = ~_1520;
        int _1620 = _1618 + 1;
        _1616 = _1620;
    }
    int _1622 = _1616;
    float _1624 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1594);
    float _1626 = fma(_1566, _1548, _1602);
    float _1628 = float(_1596);
    float _1630 = fma(_1496, _1536, _1610);
    float _1632 = float(_1622);
    float _1634 = fma(_1564, _1536, _1626);
    float _1636 = float(_1600);
    float _1638 = _1628 * _1608;
    bool _1640 = uint(_1614) >= uint(_249);
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1644 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1630);
    float _1646 = _1636 * _1632;
    bool _1648 = !_1640;
    int _1650 = _1648 ? 0 : (-1);
    float _1652 = in.m_70.x;
    float _1654 = in.m_70.y;
    bool _1656 = _129 > 0.5;
    float _1658 = _1646 * (-2.0);
    float _1660 = _129 + (-0.5);
    float _1662 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1634);
    float _1664 = in.m_44.z;
    float _1666 = fma(_1658, _1530, _1530);
    float _1668 = fma(_1446, _1658, _1446);
    float _1670 = _1638 * (-2.0);
    float _1672 = _217 + (-0.5);
    float _1674 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1666);
    float _1676 = fma(_1592, _1294, _1624);
    float _1678 = fma(_1670, _1534, _1534);
    float _1680 = fma(_1466, _1670, _1466);
    float _1682 = fma(_1668, _1294, _1674);
    float _1684 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1686 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1678);
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1690 = _1682 * 0.15915493667125701904296875;
    float _1692 = _1676 * 0.15915493667125701904296875;
    float _1694 = fma(_1680, _1294, _1686);
    float _1696 = _438 + 0.5;
    float _1698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    int _1700 = ~_1604;
    int _1702 = _1700 + _1650;
    int _1704 = _1702 + 1;
    float _1706 = _1662 * _1654;
    float _1708 = _1644 * _1652;
    float _1710 = _1694 * 0.15915493667125701904296875;
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1716 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1400);
    float _1718 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1418);
    float _1720 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1432);
    float _1722 = fma(_1684, _1696, _1204);
    int _1724 = _872 >> 31;
    float _1726 = _1690 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _1714 * _1712;
    int _1732 = _978 >> 31;
    float _1734 = _1708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1736 = _1724 & 3;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1740 = _1732 & 3;
    float _1742 = _448 + (-0.5);
    float _1744 = _1692 * 6.283185482025146484375;
    float _1746 = sin(_1744);
    int _1748 = _872 + _1736;
    float _1750 = _1734 * _1698;
    int _1752 = _978 + _1740;
    float _1754 = -_1738;
    float _1756 = -_1224;
    float _1758 = fma(_1754, _1742, _1756);
    int _1760 = _1748 >> 2;
    float _1762 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1764 = _1752 >> 2;
    float _1766 = _1710 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    int _1770 = _1760 << 4;
    int _1772 = _1770 + 368;
    int _1774 = _249 * _1704;
    int _1776 = _1774 + _770;
    int _1778 = _1764 << 4;
    int _1780 = _1778 + 512;
    float _1782 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1784 = abs(_1012);
    float _1786 = _1720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1788 = _1690 * 6.283185482025146484375;
    float _1790 = cos(_1788);
    float _1792 = _1728 * _1746;
    float _1794 = _1718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1796 = _1692 * 6.283185482025146484375;
    float _1798 = cos(_1796);
    float _1800 = _1746 * _1768;
    float _1802 = _1728 * _1768;
    float _1804 = _1710 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1790 * _1746;
    uint _1810 = uint(int(uint(_1772) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    float _1826 = _1790 * _1798;
    float _1828 = _1790 * _1768;
    float _1830 = _1728 * _1798;
    float _1832 = _1798 * _1768;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1840 = fma(_1806, _1826, _1792);
    float _1842 = fma(_1806, _1792, _1826);
    float _1844 = -_1808;
    float _1846 = fma(_1806, _1830, _1844);
    uint _1848 = uint(int(uint(_1780) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    float _1864 = -_1830;
    float _1866 = fma(_1806, _1808, _1864);
    float _1868 = -_1730;
    float _1870 = _1806 * _1868;
    float _1872 = _1828 * _1730;
    float _1874 = _1802 * _1730;
    float _1876 = -_1806;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1834);
    float _1880 = -_1806;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1836);
    float _1884 = -_1806;
    float _1886 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1838);
    float _1888 = fma(_1832, _1750, _1870);
    int _1890 = _1780 + 8;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    float _1908 = fma(_1840, _1750, _1872);
    float _1910 = fma(_1846, _1750, _1874);
    float _1912 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1916 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1918 = abs(_1054);
    float _1920 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    int _1922 = _1772 + 8;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    float _1940 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1914);
    float _1942 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1916);
    float _1944 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1878);
    float _1946 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1882);
    float _1948 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1886);
    int _1950 = abs(_1302);
    float _1952 = fma(_1866, _1762, _1908);
    float _1954 = fma(_1800, _1762, _1888);
    float _1956 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1958 = ~_1950;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    float _1964 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1966 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1968 = ~_1918;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1956);
    int _1976 = _1088 * as_type<int>(_1824);
    float _1978 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1964);
    float _1980 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1966);
    int _1982 = abs(_1222);
    int _1984 = _1962 * as_type<int>(_1816);
    int _1986 = _1984 + _1976;
    float _1988 = fma(_1842, _1762, _1910);
    int _1990 = abs(_1230);
    float _1992 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1974);
    int _1994 = ~_1216;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    float _2000 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2002 = int(_2000);
    int _2004 = ~_1990;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1978);
    float _2012 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    int _2014 = _1972 * as_type<int>(_1862);
    int _2016 = ~_1982;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    float _2022 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2024 = int(_2022);
    int _2026 = _1998 * as_type<int>(_1854);
    int _2028 = _2026 + _2014;
    int _2030 = _2008 * as_type<int>(_1898);
    int _2032 = _2030 + _2028;
    int _2034 = abs(_1338);
    float _2036 = float(uint(_2002));
    int _2038 = ~_2034;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = ~_2002;
    int _2046 = _2044 + 1;
    int _2048 = _1248 * as_type<int>(_1930);
    int _2050 = _2048 + _1986;
    float _2052 = float(uint(_2024));
    int _2054 = _2042 * as_type<int>(_1906);
    int _2056 = _2054 + _2032;
    int _2058 = abs(_2024);
    int _2060 = _2020 * as_type<int>(_1938);
    int _2062 = _2060 + _2050;
    int _2064 = ~_1280;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = 1.0 / _2036;
    int _2072 = ~_1784;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    int _2078 = _2062 * _2068;
    bool _2080 = !_698;
    int _2082 = _2080 ? _1776 : (-1);
    int _2084 = _2056 * _2076;
    int _2086 = abs(_2002);
    float _2088 = 1.0 / _2052;
    int _2090 = _1080 * _1280;
    int _2092 = _2090 + _2078;
    float _2094 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2096 = _2082 * _1784;
    int _2098 = _2096 + _2084;
    float _2100 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2102 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    float _2104 = float(uint(_2092));
    float _2106 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2100);
    float _2108 = float(uint(_2058));
    float _2110 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2102);
    int _2112 = as_type<int>(_2070) + (-2);
    float _2114 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2106);
    float _2116 = float(uint(_2098));
    float _2118 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2120 = float(uint(_2086));
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2124 = as_type<int>(_2088) + (-2);
    float _2126 = 1.0 / _2108;
    float _2128 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2130 = as_type<float>(_2112) * _2116;
    float _2132 = _1782 + _2118;
    float _2134 = as_type<float>(_2124) * _2104;
    float _2136 = _1786 + _2122;
    float _2138 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2142 = _2132 + _2140;
    float _2144 = 1.0 / _2120;
    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2148 = _2136 + _2146;
    int _2150 = abs(_2092);
    float _2152 = _2142 * _2142;
    int _2154 = ~_2024;
    int _2156 = _2154 + 1;
    float _2158 = _2148 * _2148;
    float _2160 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2138);
    float _2162 = trunc(_2134);
    float _2164 = precise::max(_2162, 0.0);
    uint _2166 = uint(_2164);
    float _2168 = _2152 + _2158;
    int _2170 = as_type<int>(_2126) + (-2);
    float _2172 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2174 = abs(_2098);
    float _2176 = float(uint(_2150));
    float _2178 = _1794 + _2172;
    float _2180 = trunc(_2130);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    int _2186 = as_type<int>(_2144) + (-2);
    float _2188 = float(uint(_2174));
    float _2190 = as_type<float>(_2170) * _2176;
    int _2192 = ~_2086;
    int _2194 = _2192 + 1;
    float _2196 = sqrt(_2168);
    int _2198 = _2156 * int(_2166);
    int _2200 = _2198 + _2092;
    int _2202 = _2046 * int(_2184);
    int _2204 = _2202 + _2098;
    float _2206 = as_type<float>(_2186) * _2188;
    float _2208 = float(uint(_2200));
    float _2210 = trunc(_2190);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = float(uint(_2204));
    float _2218 = as_type<float>(_2124) * _2208;
    bool _2220 = _2196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2222 = as_type<float>(_2112) * _2216;
    float _2224 = trunc(_2206);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    int _2230 = ~_2058;
    int _2232 = _2230 + 1;
    float _2234 = trunc(_2218);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = _2232 * int(_2214);
    int _2242 = _2240 + _2150;
    float _2244 = _1842;
    float _2246 = _2152;
    float _2248 = _2158;
    float _2250 = _2132;
    float _2252 = _2136;
    if (!_2220)
    {
        _2244 = _2152;
    }
    float _2254 = _2244;
    float _2256 = _2254;
    if (!_2220)
    {
        _2246 = _2178;
    }
    float _2258 = _2246;
    float _2260 = float(uint(_2242));
    int _2262 = _2194 * int(_2228);
    int _2264 = _2262 + _2174;
    float _2266 = float(uint(_2264));
    bool _2268 = !_2220;
    float _2270 = _2258;
    if (!_2268)
    {
        float _2272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2276 = _2196 + _2274;
        float _2278 = rsqrt(_2168);
        float _2280 = _2276 * _2272;
        float _2282 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = _2280 * 0.15915493667125701904296875;
        float _2286 = _2284 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2284 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = fma(_2288, _2282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2296 = _2278 * _2294;
        float _2298 = _2292 + (-1.0);
        float _2300 = fma(_2142, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2302 = fma(_2148, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2308 = _2300 + _2306;
        float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2312 = _2302 + _2310;
        float _2314 = fma(_2178, _2292, _2304);
        float _2316 = _2308 * _2308;
        float _2318 = _2312 * _2312;
        _2270 = _2314;
        _2256 = _2316;
        _2248 = _2318;
        _2250 = _2300;
        _2252 = _2302;
    }
    float _2320 = _2270;
    float _2322 = _2256;
    float _2324 = _2248;
    float _2326 = _2250;
    float _2328 = _2252;
    bool _2330 = _209 > 0.5;
    float _2332 = as_type<float>(_2170) * _2260;
    float _2334 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1920);
    float _2336 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _2338 = -_185;
    int _2340 = _2330 ? as_type<int>(_2338) : as_type<int>(_185);
    float _2342 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1942);
    bool _2344 = _217 > 0.5;
    float _2346 = as_type<float>(_2186) * _2266;
    float _2348 = -_181;
    int _2350 = _1656 ? as_type<int>(_2348) : as_type<int>(_181);
    float _2352 = trunc(_2332);
    float _2354 = precise::max(_2352, 0.0);
    uint _2356 = uint(_2354);
    float _2358 = -_181;
    int _2360 = _2344 ? as_type<int>(_2358) : as_type<int>(_181);
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2364 = _2320 + _2362;
    bool _2366 = !_1382;
    float _2368 = _2366 ? _185 : as_type<float>(_2340);
    float _2370 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2372 = !_1378;
    float _2374 = _2372 ? _181 : as_type<float>(_2360);
    float _2376 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2378 = !_1396;
    float _2380 = _2378 ? _181 : as_type<float>(_2350);
    float _2382 = trunc(_2222);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = _2370 * _1944;
    float _2390 = _2370 * _1946;
    float _2392 = _2370 * _1948;
    int _2394 = int(_2166) + int(_2238);
    float _2396 = fma(_2376, _2334, _2388);
    int _2398 = ~_2024;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2376, _2336, _2390);
    float _2404 = trunc(_2346);
    float _2406 = precise::max(_2404, 0.0);
    uint _2408 = uint(_2406);
    float _2410 = fma(_2376, _2342, _2392);
    float _2412 = fma(_2364, _2364, _2322);
    int _2414 = int(_2214) + int(_2356);
    float _2416 = -_1174;
    float _2418 = _2416 + 1.0;
    int _2420 = ~_2058;
    int _2422 = _2420 + 1;
    float _2424 = _2412 + _2324;
    float _2426 = -_1272;
    float _2428 = _2426 + 1.0;
    int _2430 = int(_2184) + int(_2386);
    float _2432 = -_1142;
    float _2434 = _2432 + 1.0;
    int _2436 = ~_2002;
    int _2438 = _2436 + 1;
    float _2440 = sqrt(_2424);
    float _2442 = -_1144;
    float _2444 = _2442 + 1.0;
    int _2446 = ~_2086;
    int _2448 = _2446 + 1;
    float _2450 = fma(_448, _2418, _1758);
    int _2452 = int(_2228) + int(_2408);
    int _2454 = _2400 * _2394;
    int _2456 = _2454 + _2092;
    int _2458 = _2438 * _2430;
    int _2460 = _2458 + _2098;
    bool _2462 = _2002 == 0;
    int _2464 = _2422 * _2414;
    int _2466 = _2464 + _2150;
    bool _2468 = uint(_2456) >= uint(_2024);
    int _2470 = _2448 * _2452;
    int _2472 = _2470 + _2174;
    bool _2474 = uint(_2460) >= uint(_2002);
    float _2476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2478 = uint(_2466) >= uint(_2058);
    out.m_72.x = _2334;
    out.m_72.y = _2336;
    out.m_72.z = _2342;
    bool _2480 = !_2468;
    int _2482 = _2480 ? 0 : (-1);
    bool _2484 = !_2474;
    int _2486 = _2484 ? 0 : (-1);
    int _2488 = ~_2394;
    int _2490 = _2488 + _2482;
    int _2492 = _2490 + 1;
    int _2494 = ~_2430;
    int _2496 = _2494 + _2486;
    int _2498 = _2496 + 1;
    int _2500 = _2092 ^ _2024;
    int _2502 = _2024 * _2492;
    int _2504 = _2502 + _2092;
    bool _2506 = _2024 == 0;
    int _2508 = _2002 * _2498;
    int _2510 = _2508 + _2098;
    bool _2512 = _2024 == 0;
    bool _2514 = !_2478;
    int _2516 = _2514 ? 0 : (-1);
    uint _2518 = uint(int(uint(_2500) >> uint(31)));
    bool _2520 = uint(_2472) >= uint(_2086);
    float _2522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2524 = ~_2516;
    int _2526 = _2414 + _2524;
    int _2528 = _2526 + 1;
    int _2530 = ~int(_2518);
    int _2532 = _2530 + 1;
    int _2534 = _2098 ^ _2002;
    bool _2536 = !_2506;
    int _2538 = _2536 ? _2504 : (-1);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2542 = _2528 ^ _2532;
    bool _2544 = _2002 == 0;
    uint _2546 = uint(int(uint(_2534) >> uint(31)));
    float _2548 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2550 = float(_2538);
    float _2552 = fma(_2370, _2370, 1.0);
    int _2554 = ~_2532;
    int _2556 = _2554 + _2542;
    int _2558 = _2556 + 1;
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2562 = !_2462;
    int _2564 = _2562 ? _2510 : (-1);
    float _2566 = fma(_2548, _2550, _1154);
    bool _2568 = !_2520;
    int _2570 = _2568 ? 0 : (-1);
    int _2572 = ~int(_2546);
    int _2574 = _2572 + 1;
    float _2576 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2578 = float(_2564);
    float _2580 = _2380 + 0.5;
    int _2582 = ~_2570;
    int _2584 = _2452 + _2582;
    int _2586 = _2584 + 1;
    float _2588 = rsqrt(_2552);
    float _2590 = _2374 + 0.5;
    float _2592 = fma(_2576, _2578, _1182);
    int _2594 = _2586 ^ _2574;
    float _2596 = fma(_2548, _2580, _2566);
    bool _2598 = !_2512;
    int _2600 = _2598 ? _2558 : (-1);
    float _2602 = fma(_2576, _2590, _2592);
    int _2604 = ~_2574;
    int _2606 = _2604 + _2594;
    int _2608 = _2606 + 1;
    float _2610 = -_1268;
    float _2612 = _2610 + 1.0;
    float _2614 = float(_2600);
    float _2616 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2618 = !_2544;
    int _2620 = _2618 ? _2608 : (-1);
    float _2622 = -_2428;
    float _2624 = fma(_2380, _2622, _2596);
    bool _2626 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2628 = isnan(_2440);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2634 = _2630 || _2632;
    float _2636 = -_1106;
    float _2638 = fma(_2616, _2614, _2636);
    float _2640 = _2368 + (-0.5);
    float _2642 = float(_2620);
    float _2644 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2646 = -_2616;
    float _2648 = fma(_2646, _2640, _2638);
    float _2650 = _2370 * _2588;
    float _2652 = -_1184;
    float _2654 = fma(_2644, _2642, _2652);
    float _2656 = _524 + (-0.5);
    float _2658 = -_2612;
    float _2660 = fma(_438, _2658, _1722);
    float _2662 = -_1992;
    float _2664 = _2650 * _2662;
    float _2666 = -_2010;
    float _2668 = _2650 * _2666;
    float _2670 = -_2644;
    float _2672 = fma(_2670, _2656, _2654);
    float _2674 = -_2012;
    float _2676 = _2650 * _2674;
    float _2678 = fma(_2588, _1944, _2664);
    float _2680 = fma(_2588, _1946, _2668);
    float _2682 = -_1252;
    float _2684 = _2682 + 1.0;
    float _2686 = fma(_2588, _1948, _2676);
    float _2688 = _1992 + _2396;
    float _2690 = _2010 + _2402;
    float _2692 = _2012 + _2410;
    float _2694 = -_2434;
    float _2696 = fma(_2374, _2694, _2602);
    float _2698 = fma(_2368, _2684, _2648);
    float _2700 = fma(_524, _2444, _2672);
    out.m_74.x = _2660;
    out.m_74.y = _2450;
    float _2702 = _2684;
    float _2704 = _2336;
    float _2706 = _2660;
    if (!_2634)
    {
        _2702 = 1.0;
    }
    float _2708 = _2702;
    out.m_76.x = _2688;
    out.m_76.y = _2690;
    out.m_76.z = _2692;
    out.m_78.x = _2678;
    out.m_78.y = _2680;
    out.m_78.z = _2686;
    out.m_80.x = _2624;
    out.m_80.y = _2698;
    out.m_80.z = _2696;
    out.m_80.w = _2700;
    bool _2710 = !_2634;
    float _2712 = _2708;
    if (!_2710)
    {
        bool _2714 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2716 = isnan(_2440);
        bool _2718 = _2714 || _2716;
        bool _2720 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2722 = _2718 || _2720;
        if (!_2722)
        {
            float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2726 = _2440 + _2724;
            float _2728 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2730 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2728;
            float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2736 = 1.0 / _2730;
            float _2738 = _2726 * _2736;
            float _2740 = fma(_2738, _2734, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2712 = _2740;
            _2704 = _2736;
            _2742 = true;
        }
        else
        {
            bool _2744 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2746 = isnan(_2440);
            bool _2748 = _2744 || _2746;
            bool _2750 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2752 = _2748 || _2750;
            if (!_2752)
            {
                float _2754 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2756 = _2440 + _2754;
                float _2758 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2760 = _2758 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2764 = _2762 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2766 = 1.0 / _2760;
                float _2768 = _2756 * _2766;
                float _2770 = fma(_2768, _2764, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2712 = _2770;
                _2704 = _2766;
                _2742 = true;
            }
            else
            {
                _2712 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2742 = false;
    float _2772 = _2712;
    float _2774 = _2704;
    float _2776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2778 = _2326 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2782 = _2328 + _2780;
    bool _2784 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan(0.5);
    bool _2792 = _2788 || _2790;
    float _2794 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2796 = _2320 + _2794;
    float _2798 = fma(_2778, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2800 = fma(_2796, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2802 = fma(_2782, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2804 = _2796;
    float _2806 = _2774;
    float _2808 = _2782;
    if (_2792)
    {
        _2804 = _2798;
    }
    float _2810 = _2804;
    float _2812 = _2810;
    if (_2792)
    {
        _2806 = _2800;
    }
    float _2814 = _2806;
    float _2816 = _2814;
    if (_2792)
    {
        _2808 = _2802;
    }
    float _2818 = _2808;
    float _2820 = _2818;
    if (!_2792)
    {
        float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2824 = _1794 + _2822;
        float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2828 = _1782 + _2826;
        float _2830 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2832 = _2824 * _2824;
        float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2836 = _1786 + _2834;
        float _2838 = fma(_2828, _2828, _2832);
        float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2842 = fma(_2836, _2836, _2838);
        float _2844 = sqrt(_2842);
        float _2846 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2848 = precise::min(_2844, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2850 = _2848 * _2840;
        float _2852 = -_1782;
        float _2854 = _2852 + _2798;
        float _2856 = -_1786;
        float _2858 = _2856 + _2802;
        float _2860 = _2846 * _2850;
        float _2862 = -_1794;
        float _2864 = _2862 + _2800;
        float _2866 = fma(_2854, _2860, _1782);
        float _2868 = fma(_2864, _2860, _1794);
        float _2870 = fma(_2858, _2860, _1786);
        _2816 = _2868;
        _2812 = _2866;
        _2820 = _2870;
        _2706 = _2860;
    }
    float _2872 = _2816;
    float _2874 = _2812;
    float _2876 = _2820;
    float _2878 = _2706;
    float _2880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2882 = _2872 + _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2886 = _2874 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2890 = _2876 + _2888;
    float _2892 = _2882 * _2882;
    float _2894 = fma(_2886, _2886, _2892);
    float _2896 = fma(_2890, _2890, _2894);
    float _2898 = rsqrt(_2896);
    float _2900 = sqrt(_2896);
    float _2902 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2904 = _2886 * _2902;
    float _2906 = _2890 * _2902;
    float _2908 = _2904 * _2904;
    float _2910 = _2906 * _2906;
    float _2912 = _2908 + _2910;
    float _2914 = sqrt(_2912);
    bool _2916 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2914 + _2918;
    float _2922 = _2450;
    float _2924 = _2920;
    float _2926 = _2882;
    float _2928 = _2902;
    float _2930 = _2904;
    if (_2916)
    {
        float _2932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2922 = _2932;
    }
    float _2934 = _2922;
    float _2936 = _2934;
    if (_2916)
    {
        float _2938 = _2920 * _2934;
        _2924 = _2938;
    }
    float _2940 = _2924;
    if (_2916)
    {
        float _2942 = rsqrt(_2912);
        _2936 = _2942;
    }
    float _2944 = _2936;
    float _2946 = _2944;
    if (_2916)
    {
        float _2948 = _2940 * 0.15915493667125701904296875;
        _608 = _2948;
    }
    float _2950 = _608;
    float _2952 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2954 = _2890;
    if (_2916)
    {
        float _2956 = _2950 * 6.283185482025146484375;
        float _2958 = sin(_2956);
        _2954 = _2958;
    }
    float _2960 = _2954;
    float _2962 = precise::max(0.0, _2952);
    float _2964 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2966 = _2878;
    float _2968 = _2962;
    if (_2916)
    {
        float _2970 = _2950 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        _2966 = _2972;
    }
    float _2974 = _2966;
    float _2976 = -_2902;
    float _2978 = -_2962;
    float _2980 = fma(_2882, _2976, _2978);
    if (_2916)
    {
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2926 = _2982;
    }
    float _2984 = _2926;
    float _2986 = _2960;
    float _2988 = _2984;
    if (_2916)
    {
        float _2990 = fma(_2960, _2984, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2986 = _2990;
    }
    float _2992 = _2986;
    float _2994 = _2992;
    if (!_2916)
    {
        _2988 = _2980;
    }
    float _2996 = _2988;
    float _2998 = _2996;
    if (_2916)
    {
        float _3000 = _2944 * _2992;
        _2928 = _3000;
    }
    float _3002 = _2928;
    if (!_2916)
    {
        _2994 = _2908;
    }
    float _3004 = _2994;
    float _3006 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3008 = _3004;
    float _3010 = _2974;
    if (_2916)
    {
        float _3012 = _2974 + (-1.0);
        _2968 = _3012;
    }
    float _3014 = _2968;
    float _3016 = _3014;
    if (_2916)
    {
        float _3018 = _2904 * _3002;
        _2930 = _3018;
    }
    float _3020 = _2930;
    float _3022 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3006);
    if (_2916)
    {
        float _3024 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2946 = _3024;
    }
    float _3026 = _2946;
    if (!_2916)
    {
        _3016 = _2906;
    }
    float _3028 = _3016;
    float _3030 = _3028;
    if (_2916)
    {
        float _3032 = _2906 * _3002;
        _3030 = _3032;
    }
    float _3034 = _3030;
    if (_2916)
    {
        float _3036 = _3020 * _3020;
        _3008 = _3036;
    }
    float _3038 = _3008;
    if (_2916)
    {
        float _3040 = fma(_2980, _2974, _3026);
        _2998 = _3040;
    }
    float _3042 = _2998;
    if (!_2916)
    {
        _3010 = _2910;
    }
    float _3044 = _3010;
    float _3046 = _3044;
    if (_2916)
    {
        float _3048 = _3034 * _3034;
        _3046 = _3048;
    }
    float _3050 = _3046;
    float _3052 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3022);
    float _3054 = fma(_3042, _3042, _3038);
    float _3056 = _3052 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3058 = _3054 + _3050;
    float _3060 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3064 = fma(_2900, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3062);
    float _3066 = precise::clamp(_3064, 0.0, 1.0);
    float _3068 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3070 = rsqrt(_3058);
    float _3072 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    float _3074 = -_3066;
    float _3076 = _3074 + 1.0;
    float _3078 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3068);
    float _3080 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3072);
    float _3082 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3084 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3078);
    float _3086 = abs(_3076);
    float _3088 = log2(_3086);
    float _3090 = _3080 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3092 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3082);
    float _3094 = _3084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3096 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3098 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3092);
    float _3100 = _3070 * _3020;
    float _3102 = -_3096;
    float _3104 = fma(_3102, _2964, 1.0);
    float _3106 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3108 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3110 = _3070 * _3042;
    float _3112 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3114 = _3070 * _3034;
    float _3116 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3108);
    float _3118 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3120 = -_3112;
    float _3122 = fma(_3110, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3120);
    float _3124 = log2(_3104);
    float _3126 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3116);
    float _3128 = -_3114;
    float _3130 = fma(_3128, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3122);
    float _3132 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3134 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3126);
    float _3136 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3138 = fma(_3130, -0.5, 0.5);
    float _3140 = exp2(_3118);
    float _3142 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3132);
    float _3144 = fma(_3130, 0.5, 0.5);
    float _3146 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3136);
    float _3148 = _3110 + 1.0;
    float _3150 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3142);
    float _3152 = fma(_3144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3154 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3146);
    float _3156 = 1.0 / _3134;
    float _3158 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3150);
    float _3160 = fma(_3144, _3152, -0.212114393711090087890625);
    float _3162 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3154);
    float _3164 = _3124 * 0.693147182464599609375;
    float _3166 = fma(_3144, _3160, 1.570728778839111328125);
    float _3168 = sqrt(_3138);
    float _3170 = -_3110;
    float _3172 = fma(_3140, _3148, _3170);
    float _3174 = _3164 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3176 = fma(_3172, 0.5, 0.5);
    float _3178 = _3158 * _3156;
    float _3180 = _3162 * _3156;
    float _3182 = fma(_3178, 0.5, 0.5);
    float _3184 = fma(_3180, -0.5, 0.5);
    float _3186 = _3168 * 0.636619746685028076171875;
    float3 _7953 = float3(_3182, _3184, _3174);
    float _3188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7953, float3(0.0), isnan(_7953)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7953, float3(0.0), isnan(_7953)), level(0.0)).x;
    float3 _7964 = float3(_3182, _3184, _3174);
    float4 _3191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7964, float3(0.0), isnan(_7964)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7964, float3(0.0), isnan(_7964)), level(0.0)).xyzw;
    float _3193 = _3191.x;
    float _3195 = _3191.y;
    float _3197 = _3191.z;
    float _3199 = _3191.w;
    float _3201 = -_3166;
    float _3203 = fma(_3186, _3201, 1.0);
    float2 _7986 = float2(_3203, _3176);
    float3 _3207 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7986, float2(0.0), isnan(_7986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7986, float2(0.0), isnan(_7986)), level(0.0)).xyz;
    float _3209 = _3207.x;
    float _3211 = _3207.y;
    float _3213 = _3207.z;
    float _3215 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3217 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3219 = _3158 + _3134;
    float _3221 = _3134 * 0.5;
    out.m_82.x = _2874;
    out.m_82.y = _2872;
    out.m_82.z = _2876;
    float _3223 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3217);
    float _3225 = exp2(_3215);
    float _3227 = _3219 * 0.5;
    float _3229 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3223);
    float _3231 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3229);
    float _3233 = fma(_3162, -0.5, _3221);
    float _3235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3237 = _3231 + _3134;
    out.gl_Position.x = _3158;
    out.gl_Position.y = _3162;
    out.gl_Position.z = _3231;
    out.gl_Position.w = _3134;
    float _3239 = _3237 * 0.5;
    float _3241 = -_3225;
    float _3243 = _3241 + 1.0;
    out.m_47.x = _3235;
    float _3245 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3227;
    out.m_84.y = _3233;
    out.m_84.z = _3239;
    out.m_84.w = _3134;
    float _3247 = -_3245;
    float _3249 = _3247 + 1.0;
    float _3251 = _3245 * _3188;
    float _3253 = _3199 * _3249;
    float _3255 = _3199 * _3251;
    float _3257 = _3213 * _3251;
    float _3259 = fma(_3209, _3255, _3193);
    float _3261 = fma(_3211, _3255, _3195);
    float _3263 = fma(_3199, _3257, _3197);
    out.m_86.x = _3259;
    out.m_86.y = _3261;
    out.m_86.z = _3263;
    out.m_86.w = _3253;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2742 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    float _113 = as_type<float>(_105);
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _111;
    if (!_109)
    {
        out.m_47.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3321 = as_type<float>(_121);
        out.gl_Position.z = _3321;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_49.w;
    float _127 = float(_105);
    float _129 = in.m_51.x;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    out.m_53.x = _129;
    bool _145 = _133 >= _127;
    bool _147 = !_143;
    bool _149 = _145 || _147;
    float _151 = 1.0 / _127;
    float _153 = _133;
    if (_149)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _113;
    if (_149)
    {
        out.m_47.x = 0.0;
    }
    if (_149)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    float _161 = _133 * _151;
    float _163 = _161;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3395 = as_type<float>(_159);
        out.gl_Position.z = _3395;
    }
    out.m_55.x = _161;
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _165 = in.m_44.x;
    bool _167 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _169 = as_type<float>(int(gl_VertexIndex));
    out.m_60.x = _165;
    int _171 = as_type<int>(_169) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_169) & 2;
    bool _177 = _175 != 0;
    bool _179 = !_173;
    float _181 = _179 ? (-0.5) : 0.5;
    bool _183 = !_177;
    float _185 = _183 ? (-0.5) : 0.5;
    bool _187 = !_167;
    if (!_187)
    {
        float _189 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _191 = _129 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _193 = fma(_191, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _195 = _193 * _189;
        float _197 = floor(_195);
        float _199 = -_197;
        float _201 = _195 + _199;
        _163 = _201;
    }
    float _203 = _163;
    float _205 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _207 = int(_205);
    float _209 = in.m_51.y;
    float _211 = _151 * _133;
    int _213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _215 = _213 != 0;
    float _217 = in.m_51.z;
    float _219 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _221 = int(_219);
    float _223 = in.m_51.w;
    float _225 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _227 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _229 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _231 = int(_229);
    float _233 = float(_207);
    float _235 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _239 = in.m_44.y;
    float _241 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _243 = _203 + _241;
    float _245 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[88].z, _235);
    float _247 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _249 = int(_247);
    float _251 = float(_221);
    float _253 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[88].w, _237);
    bool _255 = _209 > 0.5;
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = _203 + _257;
    bool _261 = _217 > 0.5;
    float _263 = 1.0 / _251;
    float _265 = float(uint(_231));
    int _267 = ~_231;
    int _269 = _267 + 1;
    int _271 = ~_231;
    int _273 = _271 + 1;
    float _275 = 1.0 / _233;
    float _277 = float(uint(_249));
    int _279 = ~_249;
    int _281 = _279 + 1;
    bool _283 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _285 = isnan(_203);
    bool _287 = _283 || _285;
    bool _289 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _291 = _287 || _289;
    float _293 = float(_291);
    bool _295 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_203);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = _263 * _133;
    float _309 = 1.0 / _265;
    bool _311 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _313 = isnan(_203);
    bool _315 = _311 || _313;
    bool _317 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _319 = _315 || _317;
    float _321 = float(_319);
    float _323 = _275 * _133;
    float _325 = trunc(_307);
    int _327 = int(_325);
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _331 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _329;
    float _333 = 1.0 / _277;
    int _335 = as_type<int>(_309) + (-2);
    float _337 = trunc(_323);
    int _339 = int(_337);
    float _341 = float(uint(_327));
    float _343 = as_type<float>(_335) * _341;
    float _345 = _341;
    if (_215)
    {
        _345 = 1.0;
    }
    float _347 = _345;
    float _349 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _351 = log2(_349);
    int _353 = as_type<int>(_333) + (-2);
    float _355 = _347;
    if (!_215)
    {
        _355 = 7.345489978790283203125;
    }
    float _357 = _355;
    float _359 = float(uint(_339));
    float _361 = trunc(_343);
    float _363 = precise::max(_361, 0.0);
    uint _366 = uint(_363);
    float _368 = _357 * _129;
    float _370 = as_type<float>(_353) * _359;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = ~_249;
    int _380 = _378 + 1;
    int _382 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _384 = _382 != 0;
    int _386 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _388 = _386 != 0;
    int _390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _392 = _390 != 0;
    int _394 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _396 = _394 != 0;
    int _398 = _269 * int(_366);
    int _400 = _398 + _327;
    bool _402 = !_396;
    int _404 = _402 ? 0 : 1;
    float _406 = float(uint(_400));
    float _408 = floor(_368);
    int _410 = _380 * int(_376);
    int _412 = _410 + _339;
    int _414 = abs(_404);
    float _416 = as_type<float>(_335) * _406;
    float _418 = float(uint(_412));
    float _420 = trunc(_416);
    float _422 = precise::max(_420, 0.0);
    uint _424 = uint(_422);
    float _426 = as_type<float>(_353) * _418;
    float _428 = -_181;
    int _430 = _255 ? as_type<int>(_428) : as_type<int>(_181);
    float _432 = -_185;
    int _434 = _261 ? as_type<int>(_432) : as_type<int>(_185);
    bool _436 = !_388;
    float _438 = _436 ? _181 : as_type<float>(_430);
    float _440 = trunc(_426);
    float _442 = precise::max(_440, 0.0);
    uint _444 = uint(_442);
    bool _446 = !_392;
    float _448 = _446 ? _185 : as_type<float>(_434);
    int _450 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _452 = _450 != 0;
    int _454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _456 = _454 != 0;
    int _458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _460 = _458 != 0;
    int _462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _464 = _462 != 0;
    int _466 = int(_366) + int(_424);
    bool _468 = !_464;
    int _470 = _468 ? 0 : 1;
    bool _472 = _223 > 0.5;
    int _474 = _273 * _466;
    int _476 = _474 + _327;
    float _478 = float(_327);
    float _480 = -_408;
    float _482 = _368 + _480;
    float _484 = -_185;
    int _486 = _472 ? as_type<int>(_484) : as_type<int>(_185);
    int _488 = int(_376) + int(_444);
    float _490 = float(_231);
    bool _492 = uint(_476) >= uint(_231);
    int _494 = _281 * _488;
    int _496 = _494 + _339;
    bool _498 = _478 >= _490;
    bool _500 = isnan(_478);
    bool _502 = _498 || _500;
    bool _504 = isnan(_490);
    bool _506 = _502 || _504;
    float _508 = float(_506);
    float _510 = _482 * _490;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _514 = _512 != 0;
    bool _516 = uint(_496) >= uint(_249);
    float _518 = trunc(_508);
    int _520 = int(_518);
    bool _522 = !_384;
    float _524 = _522 ? _185 : as_type<float>(_486);
    bool _526 = !_514;
    int _528 = _526 ? 0 : 1;
    bool _530 = !_492;
    float _532 = _530 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _534 = !_516;
    int _536 = _534 ? 0 : (-1);
    float _538 = trunc(_510);
    int _540 = int(_538);
    bool _542 = !_456;
    int _544 = _542 ? 0 : 1;
    float _546 = _490 * _211;
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _558 = _556 != 0;
    int _560 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _562 = _560 != 0;
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _566 = _564 != 0;
    int _568 = ~_466;
    int _570 = _568 + as_type<int>(_532);
    int _572 = _570 + 1;
    float _574 = trunc(_546);
    int _576 = int(_574);
    bool _578 = !_554;
    int _580 = _578 ? 0 : 1;
    bool _582 = _231 == 0;
    int _584 = _231 * _572;
    int _586 = _584 + _327;
    int _588 = ~_520;
    int _590 = _588 + 1;
    int _592 = _590 + 1;
    int _594 = _231 + (-1);
    int _596 = _540 * _414;
    int _598 = _596 + _327;
    bool _600 = !_582;
    int _602 = _600 ? _586 : (-1);
    float _604 = _490;
    float _606 = _532;
    float _608 = _524;
    if (_566)
    {
        _604 = _129;
    }
    float _610 = _604;
    float _612 = _610;
    if (_566)
    {
        _606 = 1.0;
    }
    float _614 = _606;
    int _616 = _602 * _592;
    float _618 = _614;
    if (!_566)
    {
        _612 = _209;
    }
    float _620 = _612;
    if (!_566)
    {
        _618 = 1.2345600128173828125;
    }
    float _622 = _618;
    int _624 = _520 * _594;
    int _626 = _624 + _616;
    bool _628 = !_452;
    int _630 = _628 ? 0 : 1;
    bool _632 = !_460;
    int _634 = _632 ? 0 : 1;
    float _636 = _620 * _622;
    int _638 = abs(_544);
    int _640 = abs(_630);
    float _642 = floor(_636);
    float _644 = float(_249);
    int _646 = _626 * _638;
    float _648 = float(_339);
    int _650 = abs(_634);
    int _652 = _576 * _640;
    int _654 = _652 + _646;
    int _656 = abs(_470);
    float _658 = _644 * _211;
    bool _660 = _648 >= _644;
    bool _662 = isnan(_648);
    bool _664 = _660 || _662;
    bool _666 = isnan(_644);
    bool _668 = _664 || _666;
    float _670 = float(_668);
    float _672 = trunc(_658);
    int _674 = int(_672);
    int _676 = ~_488;
    int _678 = _676 + _536;
    int _680 = _678 + 1;
    int _682 = _598 * _650;
    int _684 = _682 + _654;
    float _686 = -_642;
    float _688 = _636 + _686;
    bool _690 = !_550;
    int _692 = _690 ? 0 : 1;
    int _694 = _540 * _656;
    int _696 = _694 + _684;
    bool _698 = _249 == 0;
    float _700 = trunc(_670);
    int _702 = int(_700);
    int _704 = _249 * _680;
    int _706 = _704 + _339;
    float _708 = _688 * _644;
    float _710 = float(uint(_696));
    int _712 = abs(_580);
    bool _714 = !_698;
    int _716 = _714 ? _706 : (-1);
    float _718 = as_type<float>(_335) * _710;
    float _720 = trunc(_708);
    int _722 = int(_720);
    int _724 = _249 + (-1);
    int _726 = ~_231;
    int _728 = _726 + 1;
    int _730 = ~_702;
    int _732 = _730 + 1;
    int _734 = _732 + 1;
    float _736 = trunc(_718);
    float _738 = precise::max(_736, 0.0);
    uint _740 = uint(_738);
    int _742 = abs(_692);
    bool _744 = !_562;
    int _746 = _744 ? 0 : 1;
    int _748 = _716 * _734;
    int _750 = _702 * _724;
    int _752 = _750 + _748;
    int _754 = abs(_528);
    bool _756 = !_558;
    int _758 = _756 ? 0 : 1;
    int _760 = _752 * _712;
    int _762 = abs(_758);
    int _764 = _728 * int(_740);
    int _766 = _764 + _696;
    int _768 = _722 * _754;
    int _770 = _768 + _339;
    int _772 = abs(_746);
    int _774 = _674 * _742;
    int _776 = _774 + _760;
    float _778 = float(uint(_766));
    int _780 = ~_249;
    int _782 = _780 + 1;
    int _784 = _770 * _762;
    int _786 = _784 + _776;
    float _788 = as_type<float>(_335) * _778;
    int _790 = _722 * _772;
    int _792 = _790 + _786;
    float _794 = trunc(_788);
    float _796 = precise::max(_794, 0.0);
    uint _798 = uint(_796);
    float _800 = float(uint(_792));
    float _802 = as_type<float>(_353) * _800;
    int _804 = ~_231;
    int _806 = _804 + 1;
    float _808 = trunc(_802);
    float _810 = precise::max(_808, 0.0);
    uint _812 = uint(_810);
    int _814 = int(_740) + int(_798);
    int _816 = _806 * _814;
    int _818 = _816 + _696;
    float _820 = float(uint(_598));
    int _822 = ~_231;
    int _824 = _822 + 1;
    bool _826 = uint(_818) >= uint(_231);
    float _828 = as_type<float>(_335) * _820;
    int _830 = _782 * int(_812);
    int _832 = _830 + _792;
    bool _834 = !_826;
    int _836 = _834 ? 0 : (-1);
    float _838 = trunc(_828);
    float _840 = precise::max(_838, 0.0);
    uint _842 = uint(_840);
    float _844 = float(uint(_832));
    int _846 = ~_814;
    int _848 = _846 + _836;
    int _850 = _848 + 1;
    float _852 = _209 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _854 = as_type<float>(_353) * _844;
    int _856 = _231 * _850;
    int _858 = _856 + _696;
    int _860 = ~_249;
    int _862 = _860 + 1;
    float _864 = trunc(_854);
    float _866 = precise::max(_864, 0.0);
    uint _868 = uint(_866);
    bool _870 = !_582;
    int _872 = _870 ? _858 : (-1);
    int _874 = _824 * int(_842);
    int _876 = _874 + _598;
    int _878 = _872 & 3;
    bool _880 = _878 != 0;
    int _882 = _872 & 3;
    bool _884 = _882 != 0;
    int _886 = _880 ? 0 : 1;
    bool _888 = uint(_882) > 1u;
    float _890 = float(uint(_876));
    int _892 = ~_886;
    int _894 = _892 + 1;
    int _896 = _894 + 1;
    int _898 = int(_812) + int(_868);
    float _900 = as_type<float>(_335) * _890;
    int _902 = ~_231;
    int _904 = _902 + 1;
    int _906 = _862 * _898;
    int _908 = _906 + _792;
    int _910 = _896;
    int _912 = int(_842);
    float _914 = as_type<float>(_904);
    float _916 = as_type<float>(_898);
    if (!_888)
    {
        int _918 = ~_886;
        int _920 = _918 + 1;
        _910 = _920;
    }
    int _922 = _910;
    float _924 = trunc(_900);
    float _926 = precise::max(_924, 0.0);
    uint _928 = uint(_926);
    bool _930 = uint(_882) >= 2u;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _934 = abs(_922);
    int _936 = _930 ? 0 : 1;
    bool _938 = uint(_908) >= uint(_249);
    int _940 = ~_936;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    bool _946 = !_938;
    int _948 = _946 ? 0 : (-1);
    bool _950 = _882 != 3;
    int _952 = ~_898;
    int _954 = _952 + _948;
    int _956 = _954 + 1;
    int _958 = int(_842) + int(_928);
    int _960 = _944;
    int _962 = _936;
    float _964 = as_type<float>(_928);
    if (_566)
    {
        _912 = 0;
    }
    int _966 = _912;
    int _968 = _249 * _956;
    int _970 = _968 + _792;
    int _972 = _966;
    if (!_566)
    {
        _972 = 1;
    }
    int _974 = _972;
    bool _976 = !_698;
    int _978 = _976 ? _970 : (-1);
    int _980 = _904 * _958;
    int _982 = _980 + _598;
    float _984 = as_type<float>(_974);
    if (_950)
    {
        int _986 = ~_936;
        int _988 = _986 + 1;
        _960 = _988;
    }
    int _990 = _960;
    int _992 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _994 = _992 != 0;
    bool _996 = uint(_982) >= uint(_231);
    bool _998 = !_994;
    int _1000 = _998 ? 0 : 1;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1004 = _1002 != 0;
    bool _1006 = !_996;
    int _1008 = _1006 ? 0 : (-1);
    bool _1010 = !_1004;
    int _1012 = _1010 ? 0 : 1;
    int _1014 = _978 & 3;
    bool _1016 = _1014 != 0;
    int _1018 = _978 & 3;
    bool _1020 = _1018 != 0;
    int _1022 = _1016 ? 0 : 1;
    bool _1024 = uint(_1018) > 1u;
    int _1026 = ~_1022;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    int _1032 = _1030;
    if (_566)
    {
        _962 = 0;
    }
    int _1034 = _962;
    int _1036 = _1034;
    if (!_566)
    {
        _1036 = 2;
    }
    int _1038 = _1036;
    int _1040 = ~_958;
    int _1042 = _1040 + _1008;
    int _1044 = _1042 + 1;
    float _1046 = _209 * 2.0;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_1024)
    {
        int _1050 = ~_1022;
        int _1052 = _1050 + 1;
        _1032 = _1052;
    }
    int _1054 = _1032;
    int _1056 = _231 * _1044;
    int _1058 = _1056 + _598;
    bool _1060 = uint(_1018) >= 2u;
    float _1062 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1064 = floor(_1046);
    int _1066 = _1060 ? 0 : 1;
    bool _1068 = _974 != 1;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1072 = ~_1066;
    int _1074 = _1072 + 1;
    int _1076 = _1074 + 1;
    bool _1078 = !_582;
    int _1080 = _1078 ? _1058 : (-1);
    float _1082 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1084 = ~_934;
    int _1086 = _1084 + 1;
    int _1088 = _1086 + 1;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1092 = abs(_990);
    float _1094 = fma(_852, -2.0, _1082);
    int _1096 = _1076;
    if (!_1068)
    {
        _914 = _209;
    }
    float _1098 = _914;
    float _1100 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1090);
    float _1102 = _1098;
    if (!_1068)
    {
        _964 = _217;
    }
    float _1104 = _964;
    float _1106 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1094);
    float _1108 = _1104;
    if (!_1068)
    {
        _916 = _1098;
    }
    float _1110 = _916;
    float _1112 = _1110;
    if (!_1068)
    {
        _984 = _217;
    }
    float _1114 = _984;
    float _1116 = _1114;
    if (_1068)
    {
        _1112 = _129;
    }
    float _1118 = _1112;
    if (_1068)
    {
        _1102 = _129;
    }
    float _1120 = _1102;
    if (_1068)
    {
        _1108 = _209;
    }
    float _1122 = _1108;
    float _1124 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1068)
    {
        _1116 = _209;
    }
    float _1126 = _1116;
    float _1128 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1048);
    bool _1130 = _1038 != 2;
    float _1132 = _129 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1134 = _351 * _133;
    float _1136 = fma(_1126, (*spvDescriptorSet0.vp_c9)._m0[83].w, _932);
    float _1138 = -_1070;
    float _1140 = fma(_1132, 2.0, _1138);
    float _1142 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1128);
    float _1144 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1136);
    float _1146 = exp2(_1134);
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1150 = _1122 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1152 = -_133;
    float _1154 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1140);
    float _1156 = _1132;
    if (_1130)
    {
        _1156 = _129;
    }
    float _1158 = _1156;
    float _1160 = fma(_1150, -2.0, _1062);
    float _1162 = _1158;
    if (!_1130)
    {
        _1162 = _217;
    }
    float _1164 = _1162;
    float _1166 = _129 * 2.0;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1170 = -_1148;
    float _1172 = fma(_1124, 2.0, _1170);
    float _1174 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].w, _253);
    float _1176 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1178 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1168);
    float _1180 = -_133;
    float _1182 = fma(_1180, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1172);
    float _1184 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1160);
    float _1186 = -_225;
    float _1188 = fma(_1176, 2.0, _1186);
    float _1190 = _1176;
    if (_1130)
    {
        _1190 = _209;
    }
    float _1192 = _1190;
    float _1194 = -_1146;
    float _1196 = _1194 + 1.0;
    float _1198 = _1192;
    if (!_1130)
    {
        _1198 = _129;
    }
    float _1200 = _1198;
    float _1202 = -_133;
    float _1204 = fma(_1202, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1188);
    bool _1206 = _1018 != 3;
    bool _1208 = !_1020;
    int _1210 = _1208 ? 0 : 1;
    float _1212 = _1200 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _1214 = _882 != 3;
    int _1216 = abs(_1210);
    float _1218 = fma(_1212, -2.0, _227);
    bool _1220 = !_1214;
    int _1222 = _1220 ? 0 : (-1);
    float _1224 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1218);
    if (_1206)
    {
        int _1226 = ~_1066;
        int _1228 = _1226 + 1;
        _1096 = _1228;
    }
    int _1230 = _1096;
    bool _1232 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1234 = isnan(0.0);
    bool _1236 = _1232 || _1234;
    bool _1238 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1240 = _1236 || _1238;
    float _1242 = floor(_1166);
    int _1244 = ~_1092;
    int _1246 = _1244 + 1;
    int _1248 = _1246 + 1;
    float _1250 = _1240 ? _1196 : 0.0;
    float _1252 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1178);
    bool _1254 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1256 = isnan(1.0);
    bool _1258 = _1254 || _1256;
    bool _1260 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1262 = _1258 || _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1266 = 1.0 + _1264;
    float _1268 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[87].z, _245);
    float _1270 = _217 * 2.0;
    float _1272 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1100);
    float _1274 = 1.0 / _1266;
    float _1276 = -_185;
    float _1278 = _1276 + 0.5;
    int _1280 = abs(_1000);
    bool _1282 = _1242 >= 0.0;
    bool _1284 = isnan(_1242);
    bool _1286 = _1282 || _1284;
    bool _1288 = isnan(0.0);
    bool _1290 = _1286 || _1288;
    if (_1262)
    {
        float _1292 = _1250 * _1274;
        _153 = _1292;
    }
    float _1294 = _153;
    bool _1296 = _1242 > 0.0;
    int _1298 = _1290 ? 0 : 1;
    bool _1300 = !_884;
    int _1302 = _1300 ? 0 : 1;
    int _1304 = ~_1298;
    int _1306 = _1304 + 1;
    int _1308 = _1306 + 1;
    bool _1310 = _1064 > 0.0;
    bool _1312 = _1064 >= 0.0;
    bool _1314 = isnan(_1064);
    bool _1316 = _1312 || _1314;
    bool _1318 = isnan(0.0);
    bool _1320 = _1316 || _1318;
    int _1322 = _1308;
    if (!_1296)
    {
        int _1324 = ~_1298;
        int _1326 = _1324 + 1;
        _1322 = _1326;
    }
    int _1328 = _1322;
    float _1330 = _181 + 0.5;
    bool _1332 = _1018 != 3;
    int _1334 = _1320 ? 0 : 1;
    bool _1336 = !_1332;
    int _1338 = _1336 ? 0 : (-1);
    out.m_62.x = _1330;
    out.m_62.y = _1278;
    int _1340 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1342 = _1340 != 0;
    int _1344 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1346 = _1344 != 0;
    int _1348 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1350 = _1348 != 0;
    float _1352 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1354 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1352;
    int _1356 = ~_1334;
    int _1358 = _1356 + 1;
    int _1360 = _1358 + 1;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1364 = _1362 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    int _1366 = _1360;
    if (!_1310)
    {
        int _1368 = ~_1334;
        int _1370 = _1368 + 1;
        _1366 = _1370;
    }
    int _1372 = _1366;
    float _1374 = 1.0 / _1354;
    int _1376 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1378 = _1376 != 0;
    int _1380 = 2 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1382 = _1380 != 0;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1386 = 1.0 / _1364;
    float _1388 = _239 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    out.m_64.w = _1384;
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1390;
    int _1394 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1396 = _1394 != 0;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1400 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1388);
    float _1402 = _243 * _1374;
    float _1404 = float(uint(_770));
    float _1406 = _129 + _217;
    float _1408 = 1.0 / _1392;
    out.m_66.w = _1398;
    float _1410 = _239 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1412 = as_type<float>(_353) * _1404;
    float _1414 = _1406 + (-1.0);
    float _1416 = _239 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1418 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1410);
    float _1420 = trunc(_1412);
    float _1422 = precise::max(_1420, 0.0);
    uint _1424 = uint(_1422);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1428 = _203 + _1426;
    float _1430 = _129 + _209;
    float _1432 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1416);
    float _1434 = _1428 * _1386;
    float _1436 = _217 + _209;
    float _1438 = _1430 + (-1.0);
    float _1440 = floor(_1270);
    float _1442 = _259 * _1408;
    float _1444 = _1436 + (-1.0);
    float _1446 = fma(_1438, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1448 = !_1342;
    int _1450 = _1448 ? 0 : 1;
    float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1454 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1452;
    float _1456 = fma(_1444, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1458;
    bool _1462 = !_1346;
    int _1464 = _1462 ? 0 : 1;
    float _1466 = fma(_1414, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1468 = ~_249;
    int _1470 = _1468 + 1;
    float _1472 = fma(_1454, _1402, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1474 = fma(_1460, _1402, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1480 = float(_1328);
    int _1482 = _1470 * int(_1424);
    int _1484 = _1482 + _770;
    bool _1486 = _1440 >= 0.0;
    bool _1488 = isnan(_1440);
    bool _1490 = _1486 || _1488;
    bool _1492 = isnan(0.0);
    bool _1494 = _1490 || _1492;
    float _1496 = fma(_331, _1442, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _1498 = !_1350;
    int _1500 = _1498 ? 0 : 1;
    float _1502 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1504 = _1502 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1506 = float(uint(_1484));
    bool _1508 = _203 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1510 = isnan(_203);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1516 = _1512 || _1514;
    float _1518 = float(_1516);
    int _1520 = _1494 ? 0 : 1;
    float _1522 = as_type<float>(_353) * _1506;
    bool _1524 = _1440 > 0.0;
    float _1526 = -_1518;
    float _1528 = _1526 + 1.0;
    float _1530 = in.m_68.x;
    float _1532 = in.m_68.y;
    float _1534 = in.m_68.z;
    float _1536 = _321 * _1528;
    float _1538 = -_321;
    float _1540 = _1538 + 1.0;
    int _1542 = abs(_1464);
    float _1544 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _1544;
    float _1548 = _305 * _1540;
    float _1550 = fma(_1478, _1434, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1552 = float(_1542);
    float _1554 = -_305;
    float _1556 = _1554 + 1.0;
    float _1558 = trunc(_1522);
    float _1560 = precise::max(_1558, 0.0);
    uint _1562 = uint(_1560);
    float _1564 = fma(_1546, _1442, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _1566 = fma(_1504, _1434, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1568 = _1552 * _1480;
    float _1570 = _293 * _1556;
    float _1572 = -_293;
    float _1574 = _1572 + 1.0;
    int _1576 = ~_1520;
    int _1578 = _1576 + 1;
    int _1580 = _1578 + 1;
    float _1582 = _1568 * (-2.0);
    float _1584 = _1472 * _1570;
    float _1586 = _1474 * _1570;
    int _1588 = ~_249;
    int _1590 = _1588 + 1;
    float _1592 = fma(_1456, _1582, _1456);
    float _1594 = fma(_1582, _1532, _1532);
    int _1596 = abs(_1500);
    float _1598 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1584);
    int _1600 = abs(_1450);
    float _1602 = fma(_1574, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1586);
    int _1604 = int(_1424) + int(_1562);
    float _1606 = _209 + (-0.5);
    float _1608 = float(_1372);
    float _1610 = fma(_1550, _1548, _1598);
    int _1612 = _1590 * _1604;
    int _1614 = _1612 + _770;
    int _1616 = _1580;
    if (!_1524)
    {
        int _1618 = ~_1520;
        int _1620 = _1618 + 1;
        _1616 = _1620;
    }
    int _1622 = _1616;
    float _1624 = fma(_1606, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1594);
    float _1626 = fma(_1566, _1548, _1602);
    float _1628 = float(_1596);
    float _1630 = fma(_1496, _1536, _1610);
    float _1632 = float(_1622);
    float _1634 = fma(_1564, _1536, _1626);
    float _1636 = float(_1600);
    float _1638 = _1628 * _1608;
    bool _1640 = uint(_1614) >= uint(_249);
    float _1642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1644 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[146].x, _1630);
    float _1646 = _1636 * _1632;
    bool _1648 = !_1640;
    int _1650 = _1648 ? 0 : (-1);
    float _1652 = in.m_70.x;
    float _1654 = in.m_70.y;
    bool _1656 = _129 > 0.5;
    float _1658 = _1646 * (-2.0);
    float _1660 = _129 + (-0.5);
    float _1662 = fma(_1518, (*spvDescriptorSet0.vp_c9)._m0[146].y, _1634);
    float _1664 = in.m_44.z;
    float _1666 = fma(_1658, _1530, _1530);
    float _1668 = fma(_1446, _1658, _1446);
    float _1670 = _1638 * (-2.0);
    float _1672 = _217 + (-0.5);
    float _1674 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1666);
    float _1676 = fma(_1592, _1294, _1624);
    float _1678 = fma(_1670, _1534, _1534);
    float _1680 = fma(_1466, _1670, _1466);
    float _1682 = fma(_1668, _1294, _1674);
    float _1684 = _1642 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1686 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1678);
    float _1688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1690 = _1682 * 0.15915493667125701904296875;
    float _1692 = _1676 * 0.15915493667125701904296875;
    float _1694 = fma(_1680, _1294, _1686);
    float _1696 = _438 + 0.5;
    float _1698 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _181);
    int _1700 = ~_1604;
    int _1702 = _1700 + _1650;
    int _1704 = _1702 + 1;
    float _1706 = _1662 * _1654;
    float _1708 = _1644 * _1652;
    float _1710 = _1694 * 0.15915493667125701904296875;
    float _1712 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _185);
    float _1714 = _1706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1716 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1400);
    float _1718 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1418);
    float _1720 = fma(_1664, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1432);
    float _1722 = fma(_1684, _1696, _1204);
    int _1724 = _872 >> 31;
    float _1726 = _1690 * 6.283185482025146484375;
    float _1728 = sin(_1726);
    float _1730 = _1714 * _1712;
    int _1732 = _978 >> 31;
    float _1734 = _1708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1736 = _1724 & 3;
    float _1738 = _1688 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1740 = _1732 & 3;
    float _1742 = _448 + (-0.5);
    float _1744 = _1692 * 6.283185482025146484375;
    float _1746 = sin(_1744);
    int _1748 = _872 + _1736;
    float _1750 = _1734 * _1698;
    int _1752 = _978 + _1740;
    float _1754 = -_1738;
    float _1756 = -_1224;
    float _1758 = fma(_1754, _1742, _1756);
    int _1760 = _1748 >> 2;
    float _1762 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    int _1764 = _1752 >> 2;
    float _1766 = _1710 * 6.283185482025146484375;
    float _1768 = cos(_1766);
    int _1770 = _1760 << 4;
    int _1772 = _1770 + 368;
    int _1774 = _249 * _1704;
    int _1776 = _1774 + _770;
    int _1778 = _1764 << 4;
    int _1780 = _1778 + 512;
    float _1782 = _1716 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1784 = abs(_1012);
    float _1786 = _1720 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1788 = _1690 * 6.283185482025146484375;
    float _1790 = cos(_1788);
    float _1792 = _1728 * _1746;
    float _1794 = _1718 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1796 = _1692 * 6.283185482025146484375;
    float _1798 = cos(_1796);
    float _1800 = _1746 * _1768;
    float _1802 = _1728 * _1768;
    float _1804 = _1710 * 6.283185482025146484375;
    float _1806 = sin(_1804);
    float _1808 = _1790 * _1746;
    uint _1810 = uint(int(uint(_1772) >> uint(2)));
    uint _1812 = uint(int(uint(int(_1810)) >> uint(2)));
    int _1814 = int(_1810) & 3;
    float _1816 = (*spvDescriptorSet0.vp_c9)._m0[int(_1812)][_1814];
    int _1818 = int(_1810) + 1;
    uint _1820 = uint(int(uint(_1818) >> uint(2)));
    int _1822 = _1818 & 3;
    float _1824 = (*spvDescriptorSet0.vp_c9)._m0[int(_1820)][_1822];
    float _1826 = _1790 * _1798;
    float _1828 = _1790 * _1768;
    float _1830 = _1728 * _1798;
    float _1832 = _1798 * _1768;
    float _1834 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1836 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1838 = _1828 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1840 = fma(_1806, _1826, _1792);
    float _1842 = fma(_1806, _1792, _1826);
    float _1844 = -_1808;
    float _1846 = fma(_1806, _1830, _1844);
    uint _1848 = uint(int(uint(_1780) >> uint(2)));
    uint _1850 = uint(int(uint(int(_1848)) >> uint(2)));
    int _1852 = int(_1848) & 3;
    float _1854 = (*spvDescriptorSet0.vp_c9)._m0[int(_1850)][_1852];
    int _1856 = int(_1848) + 1;
    uint _1858 = uint(int(uint(_1856) >> uint(2)));
    int _1860 = _1856 & 3;
    float _1862 = (*spvDescriptorSet0.vp_c9)._m0[int(_1858)][_1860];
    float _1864 = -_1830;
    float _1866 = fma(_1806, _1808, _1864);
    float _1868 = -_1730;
    float _1870 = _1806 * _1868;
    float _1872 = _1828 * _1730;
    float _1874 = _1802 * _1730;
    float _1876 = -_1806;
    float _1878 = fma(_1876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1834);
    float _1880 = -_1806;
    float _1882 = fma(_1880, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1836);
    float _1884 = -_1806;
    float _1886 = fma(_1884, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1838);
    float _1888 = fma(_1832, _1750, _1870);
    int _1890 = _1780 + 8;
    uint _1892 = uint(int(uint(_1890) >> uint(2)));
    uint _1894 = uint(int(uint(int(_1892)) >> uint(2)));
    int _1896 = int(_1892) & 3;
    float _1898 = (*spvDescriptorSet0.vp_c9)._m0[int(_1894)][_1896];
    int _1900 = int(_1892) + 1;
    uint _1902 = uint(int(uint(_1900) >> uint(2)));
    int _1904 = _1900 & 3;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[int(_1902)][_1904];
    float _1908 = fma(_1840, _1750, _1872);
    float _1910 = fma(_1846, _1750, _1874);
    float _1912 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1914 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1916 = _1840 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1918 = abs(_1054);
    float _1920 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1912);
    int _1922 = _1772 + 8;
    uint _1924 = uint(int(uint(_1922) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    float _1940 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1914);
    float _1942 = fma(_1832, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1916);
    float _1944 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1878);
    float _1946 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1882);
    float _1948 = fma(_1802, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1886);
    int _1950 = abs(_1302);
    float _1952 = fma(_1866, _1762, _1908);
    float _1954 = fma(_1800, _1762, _1888);
    float _1956 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _1958 = ~_1950;
    int _1960 = _1958 + 1;
    int _1962 = _1960 + 1;
    float _1964 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1966 = _1866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _1968 = ~_1918;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1956);
    int _1976 = _1088 * as_type<int>(_1824);
    float _1978 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1964);
    float _1980 = fma(_1800, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1966);
    int _1982 = abs(_1222);
    int _1984 = _1962 * as_type<int>(_1816);
    int _1986 = _1984 + _1976;
    float _1988 = fma(_1842, _1762, _1910);
    int _1990 = abs(_1230);
    float _1992 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1974);
    int _1994 = ~_1216;
    int _1996 = _1994 + 1;
    int _1998 = _1996 + 1;
    float _2000 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2002 = int(_2000);
    int _2004 = ~_1990;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    float _2010 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1978);
    float _2012 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1980);
    int _2014 = _1972 * as_type<int>(_1862);
    int _2016 = ~_1982;
    int _2018 = _2016 + 1;
    int _2020 = _2018 + 1;
    float _2022 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2024 = int(_2022);
    int _2026 = _1998 * as_type<int>(_1854);
    int _2028 = _2026 + _2014;
    int _2030 = _2008 * as_type<int>(_1898);
    int _2032 = _2030 + _2028;
    int _2034 = abs(_1338);
    float _2036 = float(uint(_2002));
    int _2038 = ~_2034;
    int _2040 = _2038 + 1;
    int _2042 = _2040 + 1;
    int _2044 = ~_2002;
    int _2046 = _2044 + 1;
    int _2048 = _1248 * as_type<int>(_1930);
    int _2050 = _2048 + _1986;
    float _2052 = float(uint(_2024));
    int _2054 = _2042 * as_type<int>(_1906);
    int _2056 = _2054 + _2032;
    int _2058 = abs(_2024);
    int _2060 = _2020 * as_type<int>(_1938);
    int _2062 = _2060 + _2050;
    int _2064 = ~_1280;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = 1.0 / _2036;
    int _2072 = ~_1784;
    int _2074 = _2072 + 1;
    int _2076 = _2074 + 1;
    int _2078 = _2062 * _2068;
    bool _2080 = !_698;
    int _2082 = _2080 ? _1776 : (-1);
    int _2084 = _2056 * _2076;
    int _2086 = abs(_2002);
    float _2088 = 1.0 / _2052;
    int _2090 = _1080 * _1280;
    int _2092 = _2090 + _2078;
    float _2094 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2096 = _2082 * _1784;
    int _2098 = _2096 + _2084;
    float _2100 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2102 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2094);
    float _2104 = float(uint(_2092));
    float _2106 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2100);
    float _2108 = float(uint(_2058));
    float _2110 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2102);
    int _2112 = as_type<int>(_2070) + (-2);
    float _2114 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2106);
    float _2116 = float(uint(_2098));
    float _2118 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2120 = float(uint(_2086));
    float _2122 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    int _2124 = as_type<int>(_2088) + (-2);
    float _2126 = 1.0 / _2108;
    float _2128 = _1952 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2130 = as_type<float>(_2112) * _2116;
    float _2132 = _1782 + _2118;
    float _2134 = as_type<float>(_2124) * _2104;
    float _2136 = _1786 + _2122;
    float _2138 = fma(_1954, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2128);
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2142 = _2132 + _2140;
    float _2144 = 1.0 / _2120;
    float _2146 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2148 = _2136 + _2146;
    int _2150 = abs(_2092);
    float _2152 = _2142 * _2142;
    int _2154 = ~_2024;
    int _2156 = _2154 + 1;
    float _2158 = _2148 * _2148;
    float _2160 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2138);
    float _2162 = trunc(_2134);
    float _2164 = precise::max(_2162, 0.0);
    uint _2166 = uint(_2164);
    float _2168 = _2152 + _2158;
    int _2170 = as_type<int>(_2126) + (-2);
    float _2172 = _2160 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2174 = abs(_2098);
    float _2176 = float(uint(_2150));
    float _2178 = _1794 + _2172;
    float _2180 = trunc(_2130);
    float _2182 = precise::max(_2180, 0.0);
    uint _2184 = uint(_2182);
    int _2186 = as_type<int>(_2144) + (-2);
    float _2188 = float(uint(_2174));
    float _2190 = as_type<float>(_2170) * _2176;
    int _2192 = ~_2086;
    int _2194 = _2192 + 1;
    float _2196 = sqrt(_2168);
    int _2198 = _2156 * int(_2166);
    int _2200 = _2198 + _2092;
    int _2202 = _2046 * int(_2184);
    int _2204 = _2202 + _2098;
    float _2206 = as_type<float>(_2186) * _2188;
    float _2208 = float(uint(_2200));
    float _2210 = trunc(_2190);
    float _2212 = precise::max(_2210, 0.0);
    uint _2214 = uint(_2212);
    float _2216 = float(uint(_2204));
    float _2218 = as_type<float>(_2124) * _2208;
    bool _2220 = _2196 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2222 = as_type<float>(_2112) * _2216;
    float _2224 = trunc(_2206);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    int _2230 = ~_2058;
    int _2232 = _2230 + 1;
    float _2234 = trunc(_2218);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    int _2240 = _2232 * int(_2214);
    int _2242 = _2240 + _2150;
    float _2244 = _1842;
    float _2246 = _2152;
    float _2248 = _2158;
    float _2250 = _2132;
    float _2252 = _2136;
    if (!_2220)
    {
        _2244 = _2152;
    }
    float _2254 = _2244;
    float _2256 = _2254;
    if (!_2220)
    {
        _2246 = _2178;
    }
    float _2258 = _2246;
    float _2260 = float(uint(_2242));
    int _2262 = _2194 * int(_2228);
    int _2264 = _2262 + _2174;
    float _2266 = float(uint(_2264));
    bool _2268 = !_2220;
    float _2270 = _2258;
    if (!_2268)
    {
        float _2272 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2274 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2276 = _2196 + _2274;
        float _2278 = rsqrt(_2168);
        float _2280 = _2276 * _2272;
        float _2282 = _2178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2284 = _2280 * 0.15915493667125701904296875;
        float _2286 = _2284 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2284 * 6.283185482025146484375;
        float _2292 = cos(_2290);
        float _2294 = fma(_2288, _2282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2296 = _2278 * _2294;
        float _2298 = _2292 + (-1.0);
        float _2300 = fma(_2142, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2302 = fma(_2148, _2296, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2304 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2306 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2308 = _2300 + _2306;
        float _2310 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2312 = _2302 + _2310;
        float _2314 = fma(_2178, _2292, _2304);
        float _2316 = _2308 * _2308;
        float _2318 = _2312 * _2312;
        _2270 = _2314;
        _2256 = _2316;
        _2248 = _2318;
        _2250 = _2300;
        _2252 = _2302;
    }
    float _2320 = _2270;
    float _2322 = _2256;
    float _2324 = _2248;
    float _2326 = _2250;
    float _2328 = _2252;
    bool _2330 = _209 > 0.5;
    float _2332 = as_type<float>(_2170) * _2260;
    float _2334 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1920);
    float _2336 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1940);
    float _2338 = -_185;
    int _2340 = _2330 ? as_type<int>(_2338) : as_type<int>(_185);
    float _2342 = fma(_1846, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1942);
    bool _2344 = _217 > 0.5;
    float _2346 = as_type<float>(_2186) * _2266;
    float _2348 = -_181;
    int _2350 = _1656 ? as_type<int>(_2348) : as_type<int>(_181);
    float _2352 = trunc(_2332);
    float _2354 = precise::max(_2352, 0.0);
    uint _2356 = uint(_2354);
    float _2358 = -_181;
    int _2360 = _2344 ? as_type<int>(_2358) : as_type<int>(_181);
    float _2362 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2364 = _2320 + _2362;
    bool _2366 = !_1382;
    float _2368 = _2366 ? _185 : as_type<float>(_2340);
    float _2370 = _185 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2372 = !_1378;
    float _2374 = _2372 ? _181 : as_type<float>(_2360);
    float _2376 = _181 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2378 = !_1396;
    float _2380 = _2378 ? _181 : as_type<float>(_2350);
    float _2382 = trunc(_2222);
    float _2384 = precise::max(_2382, 0.0);
    uint _2386 = uint(_2384);
    float _2388 = _2370 * _1944;
    float _2390 = _2370 * _1946;
    float _2392 = _2370 * _1948;
    int _2394 = int(_2166) + int(_2238);
    float _2396 = fma(_2376, _2334, _2388);
    int _2398 = ~_2024;
    int _2400 = _2398 + 1;
    float _2402 = fma(_2376, _2336, _2390);
    float _2404 = trunc(_2346);
    float _2406 = precise::max(_2404, 0.0);
    uint _2408 = uint(_2406);
    float _2410 = fma(_2376, _2342, _2392);
    float _2412 = fma(_2364, _2364, _2322);
    int _2414 = int(_2214) + int(_2356);
    float _2416 = -_1174;
    float _2418 = _2416 + 1.0;
    int _2420 = ~_2058;
    int _2422 = _2420 + 1;
    float _2424 = _2412 + _2324;
    float _2426 = -_1272;
    float _2428 = _2426 + 1.0;
    int _2430 = int(_2184) + int(_2386);
    float _2432 = -_1142;
    float _2434 = _2432 + 1.0;
    int _2436 = ~_2002;
    int _2438 = _2436 + 1;
    float _2440 = sqrt(_2424);
    float _2442 = -_1144;
    float _2444 = _2442 + 1.0;
    int _2446 = ~_2086;
    int _2448 = _2446 + 1;
    float _2450 = fma(_448, _2418, _1758);
    int _2452 = int(_2228) + int(_2408);
    int _2454 = _2400 * _2394;
    int _2456 = _2454 + _2092;
    int _2458 = _2438 * _2430;
    int _2460 = _2458 + _2098;
    bool _2462 = _2002 == 0;
    int _2464 = _2422 * _2414;
    int _2466 = _2464 + _2150;
    bool _2468 = uint(_2456) >= uint(_2024);
    int _2470 = _2448 * _2452;
    int _2472 = _2470 + _2174;
    bool _2474 = uint(_2460) >= uint(_2002);
    float _2476 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2478 = uint(_2466) >= uint(_2058);
    out.m_72.x = _2334;
    out.m_72.y = _2336;
    out.m_72.z = _2342;
    bool _2480 = !_2468;
    int _2482 = _2480 ? 0 : (-1);
    bool _2484 = !_2474;
    int _2486 = _2484 ? 0 : (-1);
    int _2488 = ~_2394;
    int _2490 = _2488 + _2482;
    int _2492 = _2490 + 1;
    int _2494 = ~_2430;
    int _2496 = _2494 + _2486;
    int _2498 = _2496 + 1;
    int _2500 = _2092 ^ _2024;
    int _2502 = _2024 * _2492;
    int _2504 = _2502 + _2092;
    bool _2506 = _2024 == 0;
    int _2508 = _2002 * _2498;
    int _2510 = _2508 + _2098;
    bool _2512 = _2024 == 0;
    bool _2514 = !_2478;
    int _2516 = _2514 ? 0 : (-1);
    uint _2518 = uint(int(uint(_2500) >> uint(31)));
    bool _2520 = uint(_2472) >= uint(_2086);
    float _2522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2524 = ~_2516;
    int _2526 = _2414 + _2524;
    int _2528 = _2526 + 1;
    int _2530 = ~int(_2518);
    int _2532 = _2530 + 1;
    int _2534 = _2098 ^ _2002;
    bool _2536 = !_2506;
    int _2538 = _2536 ? _2504 : (-1);
    float _2540 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2542 = _2528 ^ _2532;
    bool _2544 = _2002 == 0;
    uint _2546 = uint(int(uint(_2534) >> uint(31)));
    float _2548 = _2476 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2550 = float(_2538);
    float _2552 = fma(_2370, _2370, 1.0);
    int _2554 = ~_2532;
    int _2556 = _2554 + _2542;
    int _2558 = _2556 + 1;
    float _2560 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2562 = !_2462;
    int _2564 = _2562 ? _2510 : (-1);
    float _2566 = fma(_2548, _2550, _1154);
    bool _2568 = !_2520;
    int _2570 = _2568 ? 0 : (-1);
    int _2572 = ~int(_2546);
    int _2574 = _2572 + 1;
    float _2576 = _2522 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2578 = float(_2564);
    float _2580 = _2380 + 0.5;
    int _2582 = ~_2570;
    int _2584 = _2452 + _2582;
    int _2586 = _2584 + 1;
    float _2588 = rsqrt(_2552);
    float _2590 = _2374 + 0.5;
    float _2592 = fma(_2576, _2578, _1182);
    int _2594 = _2586 ^ _2574;
    float _2596 = fma(_2548, _2580, _2566);
    bool _2598 = !_2512;
    int _2600 = _2598 ? _2558 : (-1);
    float _2602 = fma(_2576, _2590, _2592);
    int _2604 = ~_2574;
    int _2606 = _2604 + _2594;
    int _2608 = _2606 + 1;
    float _2610 = -_1268;
    float _2612 = _2610 + 1.0;
    float _2614 = float(_2600);
    float _2616 = _2540 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _2618 = !_2544;
    int _2620 = _2618 ? _2608 : (-1);
    float _2622 = -_2428;
    float _2624 = fma(_2380, _2622, _2596);
    bool _2626 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2628 = isnan(_2440);
    bool _2630 = _2626 || _2628;
    bool _2632 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2634 = _2630 || _2632;
    float _2636 = -_1106;
    float _2638 = fma(_2616, _2614, _2636);
    float _2640 = _2368 + (-0.5);
    float _2642 = float(_2620);
    float _2644 = _2560 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2646 = -_2616;
    float _2648 = fma(_2646, _2640, _2638);
    float _2650 = _2370 * _2588;
    float _2652 = -_1184;
    float _2654 = fma(_2644, _2642, _2652);
    float _2656 = _524 + (-0.5);
    float _2658 = -_2612;
    float _2660 = fma(_438, _2658, _1722);
    float _2662 = -_1992;
    float _2664 = _2650 * _2662;
    float _2666 = -_2010;
    float _2668 = _2650 * _2666;
    float _2670 = -_2644;
    float _2672 = fma(_2670, _2656, _2654);
    float _2674 = -_2012;
    float _2676 = _2650 * _2674;
    float _2678 = fma(_2588, _1944, _2664);
    float _2680 = fma(_2588, _1946, _2668);
    float _2682 = -_1252;
    float _2684 = _2682 + 1.0;
    float _2686 = fma(_2588, _1948, _2676);
    float _2688 = _1992 + _2396;
    float _2690 = _2010 + _2402;
    float _2692 = _2012 + _2410;
    float _2694 = -_2434;
    float _2696 = fma(_2374, _2694, _2602);
    float _2698 = fma(_2368, _2684, _2648);
    float _2700 = fma(_524, _2444, _2672);
    out.m_74.x = _2660;
    out.m_74.y = _2450;
    float _2702 = _2684;
    float _2704 = _2336;
    float _2706 = _2660;
    if (!_2634)
    {
        _2702 = 1.0;
    }
    float _2708 = _2702;
    out.m_76.x = _2688;
    out.m_76.y = _2690;
    out.m_76.z = _2692;
    out.m_78.x = _2678;
    out.m_78.y = _2680;
    out.m_78.z = _2686;
    out.m_80.x = _2624;
    out.m_80.y = _2698;
    out.m_80.z = _2696;
    out.m_80.w = _2700;
    bool _2710 = !_2634;
    float _2712 = _2708;
    if (!_2710)
    {
        bool _2714 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2716 = isnan(_2440);
        bool _2718 = _2714 || _2716;
        bool _2720 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2722 = _2718 || _2720;
        if (!_2722)
        {
            float _2724 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2726 = _2440 + _2724;
            float _2728 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2730 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2728;
            float _2732 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2736 = 1.0 / _2730;
            float _2738 = _2726 * _2736;
            float _2740 = fma(_2738, _2734, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2712 = _2740;
            _2704 = _2736;
            _2742 = true;
        }
        else
        {
            bool _2744 = _2440 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2746 = isnan(_2440);
            bool _2748 = _2744 || _2746;
            bool _2750 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2752 = _2748 || _2750;
            if (!_2752)
            {
                float _2754 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2756 = _2440 + _2754;
                float _2758 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2760 = _2758 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2762 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2764 = _2762 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2766 = 1.0 / _2760;
                float _2768 = _2756 * _2766;
                float _2770 = fma(_2768, _2764, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2712 = _2770;
                _2704 = _2766;
                _2742 = true;
            }
            else
            {
                _2712 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2742 = false;
    float _2772 = _2712;
    float _2774 = _2704;
    float _2776 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2778 = _2326 + _2776;
    float _2780 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2782 = _2328 + _2780;
    bool _2784 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2786 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2788 = _2784 || _2786;
    bool _2790 = isnan(0.5);
    bool _2792 = _2788 || _2790;
    float _2794 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2796 = _2320 + _2794;
    float _2798 = fma(_2778, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2800 = fma(_2796, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2802 = fma(_2782, _2772, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2804 = _2796;
    float _2806 = _2774;
    float _2808 = _2782;
    if (_2792)
    {
        _2804 = _2798;
    }
    float _2810 = _2804;
    float _2812 = _2810;
    if (_2792)
    {
        _2806 = _2800;
    }
    float _2814 = _2806;
    float _2816 = _2814;
    if (_2792)
    {
        _2808 = _2802;
    }
    float _2818 = _2808;
    float _2820 = _2818;
    if (!_2792)
    {
        float _2822 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2824 = _1794 + _2822;
        float _2826 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2828 = _1782 + _2826;
        float _2830 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2832 = _2824 * _2824;
        float _2834 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2836 = _1786 + _2834;
        float _2838 = fma(_2828, _2828, _2832);
        float _2840 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2842 = fma(_2836, _2836, _2838);
        float _2844 = sqrt(_2842);
        float _2846 = _2830 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2848 = precise::min(_2844, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2850 = _2848 * _2840;
        float _2852 = -_1782;
        float _2854 = _2852 + _2798;
        float _2856 = -_1786;
        float _2858 = _2856 + _2802;
        float _2860 = _2846 * _2850;
        float _2862 = -_1794;
        float _2864 = _2862 + _2800;
        float _2866 = fma(_2854, _2860, _1782);
        float _2868 = fma(_2864, _2860, _1794);
        float _2870 = fma(_2858, _2860, _1786);
        _2816 = _2868;
        _2812 = _2866;
        _2820 = _2870;
        _2706 = _2860;
    }
    float _2872 = _2816;
    float _2874 = _2812;
    float _2876 = _2820;
    float _2878 = _2706;
    float _2880 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2882 = _2872 + _2880;
    float _2884 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2886 = _2874 + _2884;
    float _2888 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2890 = _2876 + _2888;
    float _2892 = _2882 * _2882;
    float _2894 = fma(_2886, _2886, _2892);
    float _2896 = fma(_2890, _2890, _2894);
    float _2898 = rsqrt(_2896);
    float _2900 = sqrt(_2896);
    float _2902 = _2898 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2904 = _2886 * _2902;
    float _2906 = _2890 * _2902;
    float _2908 = _2904 * _2904;
    float _2910 = _2906 * _2906;
    float _2912 = _2908 + _2910;
    float _2914 = sqrt(_2912);
    bool _2916 = _2914 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2918 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2920 = _2914 + _2918;
    float _2922 = _2450;
    float _2924 = _2920;
    float _2926 = _2882;
    float _2928 = _2902;
    float _2930 = _2904;
    if (_2916)
    {
        float _2932 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2922 = _2932;
    }
    float _2934 = _2922;
    float _2936 = _2934;
    if (_2916)
    {
        float _2938 = _2920 * _2934;
        _2924 = _2938;
    }
    float _2940 = _2924;
    if (_2916)
    {
        float _2942 = rsqrt(_2912);
        _2936 = _2942;
    }
    float _2944 = _2936;
    float _2946 = _2944;
    if (_2916)
    {
        float _2948 = _2940 * 0.15915493667125701904296875;
        _608 = _2948;
    }
    float _2950 = _608;
    float _2952 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2954 = _2890;
    if (_2916)
    {
        float _2956 = _2950 * 6.283185482025146484375;
        float _2958 = sin(_2956);
        _2954 = _2958;
    }
    float _2960 = _2954;
    float _2962 = precise::max(0.0, _2952);
    float _2964 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2966 = _2878;
    float _2968 = _2962;
    if (_2916)
    {
        float _2970 = _2950 * 6.283185482025146484375;
        float _2972 = cos(_2970);
        _2966 = _2972;
    }
    float _2974 = _2966;
    float _2976 = -_2902;
    float _2978 = -_2962;
    float _2980 = fma(_2882, _2976, _2978);
    if (_2916)
    {
        float _2982 = _2980 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2926 = _2982;
    }
    float _2984 = _2926;
    float _2986 = _2960;
    float _2988 = _2984;
    if (_2916)
    {
        float _2990 = fma(_2960, _2984, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2986 = _2990;
    }
    float _2992 = _2986;
    float _2994 = _2992;
    if (!_2916)
    {
        _2988 = _2980;
    }
    float _2996 = _2988;
    float _2998 = _2996;
    if (_2916)
    {
        float _3000 = _2944 * _2992;
        _2928 = _3000;
    }
    float _3002 = _2928;
    if (!_2916)
    {
        _2994 = _2908;
    }
    float _3004 = _2994;
    float _3006 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3008 = _3004;
    float _3010 = _2974;
    if (_2916)
    {
        float _3012 = _2974 + (-1.0);
        _2968 = _3012;
    }
    float _3014 = _2968;
    float _3016 = _3014;
    if (_2916)
    {
        float _3018 = _2904 * _3002;
        _2930 = _3018;
    }
    float _3020 = _2930;
    float _3022 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3006);
    if (_2916)
    {
        float _3024 = _3014 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2946 = _3024;
    }
    float _3026 = _2946;
    if (!_2916)
    {
        _3016 = _2906;
    }
    float _3028 = _3016;
    float _3030 = _3028;
    if (_2916)
    {
        float _3032 = _2906 * _3002;
        _3030 = _3032;
    }
    float _3034 = _3030;
    if (_2916)
    {
        float _3036 = _3020 * _3020;
        _3008 = _3036;
    }
    float _3038 = _3008;
    if (_2916)
    {
        float _3040 = fma(_2980, _2974, _3026);
        _2998 = _3040;
    }
    float _3042 = _2998;
    if (!_2916)
    {
        _3010 = _2910;
    }
    float _3044 = _3010;
    float _3046 = _3044;
    if (_2916)
    {
        float _3048 = _3034 * _3034;
        _3046 = _3048;
    }
    float _3050 = _3046;
    float _3052 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3022);
    float _3054 = fma(_3042, _3042, _3038);
    float _3056 = _3052 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3058 = _3054 + _3050;
    float _3060 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3062 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3064 = fma(_2900, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3062);
    float _3066 = precise::clamp(_3064, 0.0, 1.0);
    float _3068 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3070 = rsqrt(_3058);
    float _3072 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3060);
    float _3074 = -_3066;
    float _3076 = _3074 + 1.0;
    float _3078 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3068);
    float _3080 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3072);
    float _3082 = _2872 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3084 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3078);
    float _3086 = abs(_3076);
    float _3088 = log2(_3086);
    float _3090 = _3080 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3092 = fma(_2874, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3082);
    float _3094 = _3084 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3096 = _3090 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3098 = fma(_2876, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3092);
    float _3100 = _3070 * _3020;
    float _3102 = -_3096;
    float _3104 = fma(_3102, _2964, 1.0);
    float _3106 = _3098 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3108 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3110 = _3070 * _3042;
    float _3112 = _3100 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3114 = _3070 * _3034;
    float _3116 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3108);
    float _3118 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3120 = -_3112;
    float _3122 = fma(_3110, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3120);
    float _3124 = log2(_3104);
    float _3126 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3116);
    float _3128 = -_3114;
    float _3130 = fma(_3128, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3122);
    float _3132 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3134 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3126);
    float _3136 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3138 = fma(_3130, -0.5, 0.5);
    float _3140 = exp2(_3118);
    float _3142 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3132);
    float _3144 = fma(_3130, 0.5, 0.5);
    float _3146 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3136);
    float _3148 = _3110 + 1.0;
    float _3150 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3142);
    float _3152 = fma(_3144, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3154 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3146);
    float _3156 = 1.0 / _3134;
    float _3158 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3150);
    float _3160 = fma(_3144, _3152, -0.212114393711090087890625);
    float _3162 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3154);
    float _3164 = _3124 * 0.693147182464599609375;
    float _3166 = fma(_3144, _3160, 1.570728778839111328125);
    float _3168 = sqrt(_3138);
    float _3170 = -_3110;
    float _3172 = fma(_3140, _3148, _3170);
    float _3174 = _3164 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3176 = fma(_3172, 0.5, 0.5);
    float _3178 = _3158 * _3156;
    float _3180 = _3162 * _3156;
    float _3182 = fma(_3178, 0.5, 0.5);
    float _3184 = fma(_3180, -0.5, 0.5);
    float _3186 = _3168 * 0.636619746685028076171875;
    float3 _7953 = float3(_3182, _3184, _3174);
    float _3188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7953, float3(0.0), isnan(_7953)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7953, float3(0.0), isnan(_7953)), level(0.0)).x;
    float3 _7964 = float3(_3182, _3184, _3174);
    float4 _3191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7964, float3(0.0), isnan(_7964)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7964, float3(0.0), isnan(_7964)), level(0.0)).xyzw;
    float _3193 = _3191.x;
    float _3195 = _3191.y;
    float _3197 = _3191.z;
    float _3199 = _3191.w;
    float _3201 = -_3166;
    float _3203 = fma(_3186, _3201, 1.0);
    float2 _7986 = float2(_3203, _3176);
    float3 _3207 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7986, float2(0.0), isnan(_7986)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7986, float2(0.0), isnan(_7986)), level(0.0)).xyz;
    float _3209 = _3207.x;
    float _3211 = _3207.y;
    float _3213 = _3207.z;
    float _3215 = _3088 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3217 = _3094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3219 = _3158 + _3134;
    float _3221 = _3134 * 0.5;
    out.m_82.x = _2874;
    out.m_82.y = _2872;
    out.m_82.z = _2876;
    float _3223 = fma(_3106, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3217);
    float _3225 = exp2(_3215);
    float _3227 = _3219 * 0.5;
    float _3229 = fma(_3090, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3223);
    float _3231 = fma(_3056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3229);
    float _3233 = fma(_3162, -0.5, _3221);
    float _3235 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3237 = _3231 + _3134;
    out.gl_Position.x = _3158;
    out.gl_Position.y = _3162;
    out.gl_Position.z = _3231;
    out.gl_Position.w = _3134;
    float _3239 = _3237 * 0.5;
    float _3241 = -_3225;
    float _3243 = _3241 + 1.0;
    out.m_47.x = _3235;
    float _3245 = _3243 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_84.x = _3227;
    out.m_84.y = _3233;
    out.m_84.z = _3239;
    out.m_84.w = _3134;
    float _3247 = -_3245;
    float _3249 = _3247 + 1.0;
    float _3251 = _3245 * _3188;
    float _3253 = _3199 * _3249;
    float _3255 = _3199 * _3251;
    float _3257 = _3213 * _3251;
    float _3259 = fma(_3209, _3255, _3193);
    float _3261 = fma(_3211, _3255, _3195);
    float _3263 = fma(_3199, _3257, _3197);
    out.m_86.x = _3259;
    out.m_86.y = _3261;
    out.m_86.z = _3263;
    out.m_86.w = _3253;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

