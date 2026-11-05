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
    float4 m_82 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_76 [[user(locn2)]];
    float4 m_80 [[user(locn3)]];
    float4 m_72 [[user(locn4)]];
    float4 m_86 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_68 [[user(locn8)]];
    float4 m_90 [[user(locn9)]];
    float4 m_70 [[user(locn10)]];
    float4 m_78 [[user(locn11)]];
    float4 m_47 [[user(locn12)]];
    float4 m_53 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_64 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_66 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3061 = false;
    bool _325 = false;
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
        float _3346 = as_type<float>(_125);
        out.gl_Position.z = _3346;
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3419 = as_type<float>(_165);
        out.gl_Position.z = _3419;
    }
    if (_159)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    float _201 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _203 = 0.0;
    float _205 = _201;
    if (!_179)
    {
        float _207 = _201 * _201;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_195;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_199;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _211;
    if (!_179)
    {
        float _223 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _223;
    }
    float _225 = _221;
    bool _227 = !_179;
    float _229 = _225;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _201 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _201);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_179;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _201 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _205 = _283;
    }
    float _285 = _205;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _291 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _295 = fma(_285, _181, _289);
    float _297 = fma(_285, _183, _291);
    float _299 = fma(_285, _185, _293);
    float _301 = fma(_295, _169, _187);
    float _303 = fma(_297, _169, _189);
    float _305 = fma(_299, _169, _191);
    bool _307 = !_287;
    float _323;
    if (!_307)
    {
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_109);
        float _329 = 1.0 / _327;
        float _331 = _145 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _337 = int(_335);
    float _339 = in.m_51.y;
    float _341 = float(_109);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _333 + _343;
    float _347 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _349 = int(_347);
    float _351 = float(_337);
    float _353 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _355 = int(_353);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _359 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _357);
    float _361 = float(_349);
    float _363 = 1.0 / _351;
    float _365 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _359);
    float _367 = -_365;
    float _369 = _367 + 1.0;
    float _371 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _373 = int(_371);
    float _375 = float(uint(_355));
    bool _377 = _355 == 0;
    int _379 = ~_355;
    int _381 = _379 + 1;
    float _383 = 1.0 / _361;
    float _385 = _363 * _145;
    float _387 = 1.0 / _375;
    float _389 = float(uint(_373));
    int _391 = ~_373;
    int _393 = _391 + 1;
    int _395 = ~_373;
    int _397 = _395 + 1;
    float _399 = trunc(_385);
    int _401 = int(_399);
    float _403 = _383 * _145;
    int _405 = ~_355;
    int _407 = _405 + 1;
    float _409 = 1.0 / _389;
    int _411 = as_type<int>(_387) + (-2);
    float _413 = trunc(_403);
    int _415 = int(_413);
    float _417 = float(uint(_401));
    float _419 = float(_401);
    float _421 = as_type<float>(_411) * _417;
    int _423 = as_type<int>(_409) + (-2);
    float _425 = 1.0 / _341;
    float _427 = float(uint(_415));
    float _429 = trunc(_421);
    float _431 = precise::max(_429, 0.0);
    uint _434 = uint(_431);
    float _436 = as_type<float>(_423) * _427;
    float _438 = trunc(_436);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _446 = _444 != 0;
    float _448 = _425 * _145;
    int _450 = _407 * int(_434);
    int _452 = _450 + _401;
    float _454 = float(uint(_452));
    float _456 = _436;
    float _458 = _454;
    int _460 = _423;
    if (_446)
    {
        _456 = 1.0;
    }
    float _462 = _456;
    int _464 = _393 * int(_442);
    int _466 = _464 + _415;
    float _468 = _462;
    float _470 = as_type<float>(_466);
    if (!_446)
    {
        _468 = 7.345489978790283203125;
    }
    float _472 = _468;
    float _474 = as_type<float>(_411) * _454;
    if (_446)
    {
        _458 = 1.0;
    }
    float _476 = _458;
    float _478 = float(uint(_466));
    float _480 = trunc(_474);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    float _486 = _476;
    if (_446)
    {
        _470 = _131;
    }
    float _488 = _470;
    float _490 = _472 * _131;
    float _492 = _488;
    if (!_446)
    {
        _486 = 1.2345600128173828125;
    }
    float _494 = _486;
    float _496 = as_type<float>(_423) * _478;
    if (!_446)
    {
        _492 = _339;
    }
    float _498 = _492;
    float _500 = floor(_490);
    float _502 = _494 * _498;
    int _504 = ~_355;
    int _506 = _504 + 1;
    float _508 = trunc(_496);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    int _514 = int(_434) + int(_484);
    int _516 = ~_373;
    int _518 = _516 + 1;
    float _520 = floor(_502);
    int _522 = _506 * _514;
    int _524 = _522 + _401;
    float _526 = -_500;
    float _528 = _490 + _526;
    bool _530 = uint(_524) >= uint(_355);
    int _532 = int(_442) + int(_512);
    float _534 = float(_355);
    float _536 = float(_373);
    int _538 = _518 * _532;
    int _540 = _538 + _415;
    float _542 = -_520;
    float _544 = _502 + _542;
    bool _546 = _419 >= _534;
    bool _548 = isnan(_419);
    bool _550 = _546 || _548;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _528 * _534;
    bool _560 = !_530;
    int _562 = _560 ? 0 : (-1);
    float _564 = _534 * _448;
    bool _566 = uint(_540) >= uint(_373);
    float _568 = trunc(_556);
    int _570 = int(_568);
    int _572 = ~_514;
    int _574 = _572 + _562;
    int _576 = _574 + 1;
    float _578 = float(_415);
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _582 = _580 != 0;
    int _584 = _355 * _576;
    int _586 = _584 + _401;
    bool _588 = _578 >= _536;
    bool _590 = isnan(_578);
    bool _592 = _588 || _590;
    bool _594 = isnan(_536);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = trunc(_558);
    int _602 = int(_600);
    bool _604 = !_582;
    int _606 = _604 ? 0 : 1;
    float _608 = _536 * _448;
    bool _610 = !_566;
    int _612 = _610 ? 0 : (-1);
    float _614 = _544 * _536;
    int _616 = abs(_606);
    bool _618 = !_377;
    int _620 = _618 ? _586 : (-1);
    float _622 = trunc(_598);
    int _624 = int(_622);
    int _626 = ~_570;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _642 = _640 != 0;
    int _644 = ~_532;
    int _646 = _644 + _612;
    int _648 = _646 + 1;
    int _650 = _355 + (-1);
    int _652 = _602 * _616;
    int _654 = _652 + _401;
    float _656 = trunc(_564);
    int _658 = int(_656);
    int _660 = _620 * _630;
    bool _662 = !_638;
    int _664 = _662 ? 0 : 1;
    int _666 = _373 * _648;
    int _668 = _666 + _415;
    bool _670 = _373 == 0;
    int _672 = _570 * _650;
    int _674 = _672 + _660;
    int _676 = abs(_664);
    int _678 = ~_624;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = trunc(_614);
    int _686 = int(_684);
    bool _688 = !_670;
    int _690 = _688 ? _668 : (-1);
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _694 = _692 != 0;
    int _696 = _690 * _682;
    bool _698 = !_634;
    int _700 = _698 ? 0 : 1;
    float _702 = trunc(_608);
    int _704 = int(_702);
    bool _706 = !_694;
    int _708 = _706 ? 0 : 1;
    int _710 = _674 * _676;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _714 = _712 != 0;
    int _716 = abs(_700);
    int _718 = abs(_708);
    bool _720 = !_642;
    int _722 = _720 ? 0 : 1;
    int _724 = _658 * _716;
    int _726 = _724 + _710;
    int _728 = _373 + (-1);
    int _730 = _686 * _718;
    int _732 = _730 + _415;
    bool _734 = !_714;
    int _736 = _734 ? 0 : 1;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _748 = _746 != 0;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _752 = _750 != 0;
    int _754 = _624 * _728;
    int _756 = _754 + _696;
    int _758 = abs(_722);
    int _760 = abs(_736);
    bool _762 = !_744;
    int _764 = _762 ? 0 : 1;
    int _766 = abs(_764);
    int _768 = _654 * _758;
    int _770 = _768 + _726;
    bool _772 = !_740;
    int _774 = _772 ? 0 : 1;
    int _776 = _602 * _760;
    int _778 = _776 + _770;
    bool _780 = !_752;
    int _782 = _780 ? 0 : 1;
    int _784 = _756 * _766;
    int _786 = abs(_774);
    float _788 = in.m_51.z;
    int _790 = abs(_782);
    bool _792 = !_748;
    int _794 = _792 ? 0 : 1;
    int _796 = _704 * _786;
    int _798 = _796 + _784;
    float _800 = float(uint(_778));
    int _802 = abs(_794);
    int _804 = ~_355;
    int _806 = _804 + 1;
    float _808 = as_type<float>(_411) * _800;
    bool _810 = _355 == 0;
    int _812 = _732 * _802;
    int _814 = _812 + _798;
    float _816 = trunc(_808);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = _686 * _790;
    int _824 = _822 + _814;
    int _826 = ~_355;
    int _828 = _826 + 1;
    int _830 = ~_373;
    int _832 = _830 + 1;
    float _834 = float(uint(_824));
    float _836 = as_type<float>(_423) * _834;
    int _838 = _828 * int(_820);
    int _840 = _838 + _778;
    float _842 = trunc(_836);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = float(uint(_840));
    float _850 = as_type<float>(_411) * _848;
    float _852 = trunc(_850);
    float _854 = precise::max(_852, 0.0);
    uint _856 = uint(_854);
    int _858 = _832 * int(_846);
    int _860 = _858 + _824;
    float _862 = float(uint(_860));
    int _864 = ~_373;
    int _866 = _864 + 1;
    float _868 = as_type<float>(_423) * _862;
    int _870 = int(_820) + int(_856);
    float _872 = trunc(_868);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    int _878 = _806 * _870;
    int _880 = _878 + _778;
    bool _882 = uint(_880) >= uint(_355);
    bool _884 = !_882;
    int _886 = _884 ? 0 : (-1);
    int _888 = ~_870;
    int _890 = _888 + _886;
    int _892 = _890 + 1;
    int _894 = int(_846) + int(_876);
    int _896 = _355 * _892;
    int _898 = _896 + _778;
    int _900 = _866 * _894;
    int _902 = _900 + _824;
    bool _904 = !_810;
    int _906 = _904 ? _898 : (-1);
    bool _908 = uint(_902) >= uint(_373);
    int _910 = _906 & 3;
    bool _912 = _910 != 0;
    bool _914 = !_908;
    int _916 = _914 ? 0 : (-1);
    bool _918 = uint(_910) > 1u;
    int _920 = ~_894;
    int _922 = _920 + _916;
    int _924 = _922 + 1;
    int _926 = _906 & 3;
    bool _928 = _926 != 0;
    bool _930 = uint(_910) >= 2u;
    int _932 = _373 * _924;
    int _934 = _932 + _824;
    int _936 = _928 ? 0 : 1;
    int _938 = ~_373;
    int _940 = _938 + 1;
    int _942 = ~_936;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    int _948 = _946;
    if (!_918)
    {
        int _950 = ~_936;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = float(uint(_654));
    bool _958 = !_670;
    int _960 = _958 ? _934 : (-1);
    int _962 = _930 ? 0 : 1;
    float _964 = as_type<float>(_411) * _956;
    int _966 = _960 & 3;
    bool _968 = _966 != 0;
    float _970 = float(uint(_732));
    float _972 = trunc(_964);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    int _978 = _960 & 3;
    bool _980 = _978 != 0;
    bool _982 = uint(_966) > 1u;
    float _984 = as_type<float>(_423) * _970;
    int _986 = _980 ? 0 : 1;
    bool _988 = _910 != 3;
    float _990 = trunc(_984);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = ~_986;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    int _1002 = ~_355;
    int _1004 = _1002 + 1;
    int _1006 = ~_962;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    int _1016 = _1004 * int(_976);
    int _1018 = _1016 + _654;
    int _1020 = _1000;
    int _1022 = _1010;
    if (!_982)
    {
        int _1024 = ~_986;
        int _1026 = _1024 + 1;
        _1020 = _1026;
    }
    int _1028 = _1020;
    float _1030 = in.m_51.w;
    bool _1032 = _966 != 3;
    if (_988)
    {
        int _1034 = ~_962;
        int _1036 = _1034 + 1;
        _1022 = _1036;
    }
    int _1038 = _1022;
    float _1040 = _131 * 2.0;
    bool _1042 = uint(_966) >= 2u;
    int _1044 = _940 * int(_994);
    int _1046 = _1044 + _732;
    float _1048 = float(uint(_1018));
    int _1050 = _1042 ? 0 : 1;
    float _1052 = floor(_1040);
    bool _1054 = _131 > 0.5;
    float _1056 = as_type<float>(_411) * _1048;
    int _1058 = ~_1050;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = _1062;
    if (_1032)
    {
        int _1066 = ~_1050;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = _339 * 2.0;
    float _1074 = float(uint(_1046));
    float _1076 = -_215;
    int _1078 = _1054 ? as_type<int>(_1076) : as_type<int>(_215);
    int _1080 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1082 = _1080 != 0;
    float _1084 = as_type<float>(_423) * _1074;
    bool _1086 = _339 > 0.5;
    float _1088 = floor(_1072);
    bool _1090 = !_1082;
    float _1092 = _1090 ? _215 : as_type<float>(_1078);
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1096 = _1094 != 0;
    float _1098 = -_219;
    int _1100 = _1086 ? as_type<int>(_1098) : as_type<int>(_219);
    bool _1102 = _788 > 0.5;
    float _1104 = trunc(_1056);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    bool _1110 = !_1096;
    float _1112 = _1110 ? _219 : as_type<float>(_1100);
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    bool _1118 = _1052 > 0.0;
    float _1120 = -_215;
    int _1122 = _1102 ? as_type<int>(_1120) : as_type<int>(_215);
    float _1124 = trunc(_1084);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    bool _1130 = _1052 >= 0.0;
    bool _1132 = isnan(_1052);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    bool _1140 = !_1116;
    float _1142 = _1140 ? _215 : as_type<float>(_1122);
    bool _1144 = _1030 > 0.5;
    if (_1014)
    {
        _460 = 0;
    }
    int _1146 = _460;
    int _1148 = int(_976) + int(_1108);
    float _1150 = in.m_60.x;
    float _1152 = in.m_60.y;
    float _1154 = in.m_60.z;
    float _1156 = in.m_60.w;
    int _1158 = _1146;
    if (!_1014)
    {
        _1158 = 1;
    }
    int _1160 = _1158;
    int _1162 = _1138 ? 0 : 1;
    int _1164 = _381 * _1148;
    int _1166 = _1164 + _654;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1170 = _1168 != 0;
    float _1172 = -_219;
    int _1174 = _1144 ? as_type<int>(_1172) : as_type<int>(_219);
    int _1176 = int(_994) + int(_1128);
    int _1178 = ~_1162;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = in.m_62.x;
    float _1186 = in.m_62.y;
    float _1188 = in.m_62.z;
    float _1190 = in.m_62.w;
    bool _1192 = _1160 != 1;
    int _1194 = _397 * _1176;
    int _1196 = _1194 + _732;
    int _1198 = _1182;
    if (!_1118)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    bool _1206 = !_1170;
    float _1208 = _1206 ? _219 : as_type<float>(_1174);
    bool _1210 = _1088 > 0.0;
    bool _1212 = _1088 >= 0.0;
    bool _1214 = isnan(_1088);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = in.m_64.x;
    float _1224 = in.m_64.y;
    float _1226 = in.m_64.z;
    float _1228 = in.m_64.w;
    float _1230 = _303 * _1152;
    int _1232 = _1220 ? 0 : 1;
    float _1234 = 0.0;
    if (!_1192)
    {
        _1234 = _339;
    }
    float _1236 = _1234;
    float _1238 = fma(_301, _1150, _1230);
    float _1240 = 0.0;
    float _1242 = _1236;
    if (!_1192)
    {
        _1240 = _339;
    }
    float _1244 = _1240;
    float _1246 = 0.0;
    float _1248 = _1244;
    if (!_1192)
    {
        _1246 = _788;
    }
    float _1250 = _1246;
    float _1252 = fma(_305, _1154, _1238);
    float _1254 = 0.0;
    float _1256 = _1250;
    if (!_1192)
    {
        _1254 = _788;
    }
    float _1258 = _1254;
    float _1260 = _1258;
    if (_1192)
    {
        _1242 = _131;
    }
    float _1262 = _1242;
    if (_1192)
    {
        _1248 = _131;
    }
    float _1264 = _1248;
    if (_1192)
    {
        _1256 = _339;
    }
    float _1266 = _1256;
    if (_1192)
    {
        _1260 = _339;
    }
    float _1268 = _1260;
    bool _1270 = uint(_1196) >= uint(_373);
    bool _1272 = uint(_1166) >= uint(_355);
    int _1274 = ~_1232;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    bool _1280 = !_1270;
    int _1282 = _1280 ? 0 : (-1);
    int _1284 = _1278;
    if (!_1210)
    {
        int _1286 = ~_1232;
        int _1288 = _1286 + 1;
        _1284 = _1288;
    }
    int _1290 = _1284;
    float _1292 = _303 * _1186;
    bool _1294 = !_1272;
    int _1296 = _1294 ? 0 : (-1);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1308 = _1306 != 0;
    float _1310 = _303 * _1224;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1314 = _1312 != 0;
    float _1316 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1320 = _1318 != 0;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1322;
    float _1326 = fma(_301, _1222, _1310);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1332 = 1.0 / _1324;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1334;
    float _1338 = fma(_301, _1184, _1292);
    float _1340 = _788 * 2.0;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1344 = fma(_305, _1188, _1338);
    float _1346 = 1.0 / _1336;
    float _1348 = fma(_305, _1226, _1326);
    float _1350 = -_1342;
    float _1352 = fma(_1316, 2.0, _1350);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1356 = _333 + _1354;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1360 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1362 = 1.0 / _1330;
    float _1364 = _131 + _788;
    float _1366 = fma(_1360, -2.0, _1358);
    float _1368 = -_145;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1372 = _1364 + (-1.0);
    bool _1374 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1376 = isnan(_333);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1366);
    float _1388 = floor(_1340);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1392 = _333 + _1390;
    float _1394 = _1356 * _1346;
    float _1396 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1398 = _1392 * _1332;
    float _1400 = _131 + _339;
    bool _1402 = !_1300;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _345 * _1362;
    bool _1408 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1410 = isnan(_333);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1400 + (-1.0);
    float _1422 = _1348 + _1228;
    float _1424 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1426 = _788 + _339;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1430 = _1388 >= 0.0;
    bool _1432 = isnan(_1388);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = _1426 + (-1.0);
    bool _1442 = !_1304;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1446;
    int _1450 = _1438 ? 0 : 1;
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1454;
    bool _1458 = _1388 > 0.0;
    float _1460 = fma(_1448, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1462 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1464 = isnan(_333);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = fma(_1456, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1484 = !_1308;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = -_1472;
    float _1490 = _1488 + 1.0;
    float _1492 = fma(_1478, _1406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1494 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1496 = isnan(_333);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = fma(_1482, _1406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1508 = _1384 * _1490;
    float _1510 = -_1384;
    float _1512 = _1510 + 1.0;
    float _1514 = _1092 + 0.5;
    float _1516 = -_1504;
    float _1518 = _1516 + 1.0;
    int _1520 = abs(_1444);
    float _1522 = _1504 * _1512;
    float _1524 = _1252 + _1156;
    float _1526 = _1418 * _1518;
    float _1528 = -_1418;
    float _1530 = _1528 + 1.0;
    float _1532 = _1112 + (-0.5);
    float _1534 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1370);
    float _1536 = _1474 * _1526;
    float _1538 = _1460 * _1526;
    float _1540 = -_1532;
    float _1542 = -_1386;
    float _1544 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1542);
    float _1546 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1536);
    float _1548 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1538);
    float _1550 = _1344 + _1190;
    float _1552 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1428);
    float _1554 = fma(_1506, _1522, _1548);
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1560 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1562 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1556);
    float _1564 = float(_1290);
    float _1566 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1568 = log2(_1566);
    float _1570 = -_1558;
    float _1572 = fma(_1560, 2.0, _1570);
    int _1574 = abs(_1486);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1578 = -_145;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1572);
    int _1582 = _960 >> 31;
    float _1584 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1552);
    float _1586 = float(_1520);
    float _1588 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    int _1590 = _906 >> 31;
    int _1592 = _1582 & 3;
    int _1594 = _1590 & 3;
    float _1596 = _1568 * _145;
    int _1598 = _960 + _1592;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1602 = _1524 + _1600;
    int _1604 = _906 + _1594;
    float _1606 = exp2(_1596);
    float _1608 = float(_1204);
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1422 + _1610;
    int _1614 = _1604 >> 2;
    float _1616 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1618 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1620 = _1598 >> 2;
    float _1622 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1616);
    int _1624 = _1614 << 4;
    int _1626 = _1624 + 368;
    float _1628 = fma(_1618, -2.0, _1576);
    float _1630 = float(_1574);
    float _1632 = _1586 * _1608;
    int _1634 = abs(_1404);
    float _1636 = in.m_66.x;
    float _1638 = in.m_66.y;
    float _1640 = in.m_66.z;
    int _1642 = _1620 << 4;
    int _1644 = _1642 + 512;
    uint _1646 = uint(int(uint(_1626) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[int(_1656)][_1658];
    int _1662 = ~_1450;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = _1630 * _1564;
    int _1670 = _1666;
    if (!_1458)
    {
        int _1672 = ~_1450;
        int _1674 = _1672 + 1;
        _1670 = _1674;
    }
    int _1676 = _1670;
    float _1678 = -_1606;
    float _1680 = _1678 + 1.0;
    float _1682 = float(_1634);
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1550 + _1684;
    float _1688 = float(_1676);
    uint _1690 = uint(int(uint(_1644) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = ~_1148;
    int _1708 = _1706 + _1296;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1622);
    int _1714 = abs(_954);
    float _1716 = _1682 * _1688;
    int _1718 = ~_1176;
    int _1720 = _1718 + _1282;
    int _1722 = _1720 + 1;
    int _1724 = _355 * _1710;
    int _1726 = _1724 + _654;
    int _1728 = abs(_1028);
    int _1730 = _1626 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = _1716 * (-2.0);
    bool _1750 = !_912;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _373 * _1722;
    int _1756 = _1754 + _732;
    int _1758 = abs(_1070);
    float _1760 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1628);
    float _1762 = fma(_1748, _1636, _1636);
    bool _1764 = !_968;
    int _1766 = _1764 ? 0 : 1;
    int _1768 = _1644 + 8;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = abs(_1752);
    float _1788 = _1632 * (-2.0);
    int _1790 = abs(_1766);
    float _1792 = fma(_1424, _1748, _1424);
    int _1794 = ~_1714;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = ~_1728;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = abs(_1038);
    int _1808 = ~_1786;
    int _1810 = _1808 + 1;
    int _1812 = _1810 + 1;
    bool _1814 = _910 != 3;
    bool _1816 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1818 = isnan(0.0);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1824 = _1820 || _1822;
    int _1826 = _1798 * as_type<int>(_1660);
    int _1828 = ~_1806;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    int _1834 = _1812 * as_type<int>(_1652);
    int _1836 = _1834 + _1826;
    bool _1838 = !_1314;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1844 = _966 != 3;
    int _1846 = _1804 * as_type<int>(_1704);
    int _1848 = ~_1790;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1856 = 1.0 + _1854;
    float _1858 = _1824 ? _1680 : 0.0;
    float _1860 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1842);
    bool _1862 = _1712 >= 0.0;
    int _1864 = _1852 * as_type<int>(_1696);
    int _1866 = _1864 + _1846;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : (-1);
    int _1872 = _1832 * as_type<int>(_1738);
    int _1874 = _1872 + _1836;
    bool _1876 = !_1814;
    int _1878 = _1876 ? 0 : (-1);
    float _1880 = _1142 + 0.5;
    int _1882 = abs(_1870);
    float _1884 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1860);
    int _1886 = abs(_1878);
    float _1888 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1580);
    float _1890 = 1.0 / _1856;
    bool _1892 = !_1320;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = _1208 + (-0.5);
    int _1898 = abs(_1840);
    if (_1862)
    {
        out.m_47.x = 0.0;
    }
    float _1900 = -_1896;
    float _1902 = -_1760;
    float _1904 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1902);
    int _1906 = ~_1758;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = abs(_1894);
    int _1914 = _1910 * as_type<int>(_1776);
    int _1916 = _1914 + _1866;
    int _1918 = ~_1886;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = ~_1898;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = ~_1882;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = _1922 * as_type<int>(_1746);
    int _1938 = _1936 + _1874;
    float _1940 = fma(_1788, _1638, _1638);
    bool _1942 = _355 == 0;
    int _1944 = _1938 * _1928;
    float _1946 = _1602 * _1602;
    int _1948 = ~_1912;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1934 * as_type<int>(_1784);
    int _1956 = _1954 + _1916;
    bool _1958 = _373 == 0;
    float _1960 = fma(_1612, _1612, _1946);
    bool _1962 = !_1942;
    int _1964 = _1962 ? _1726 : (-1);
    int _1966 = _1956 * _1952;
    bool _1968 = !_1958;
    int _1970 = _1968 ? _1756 : (-1);
    float _1972 = fma(_1686, _1686, _1960);
    bool _1974 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1976 = isnan(1.0);
    bool _1978 = _1974 || _1976;
    bool _1980 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1982 = _1978 || _1980;
    int _1984 = _1964 * _1898;
    int _1986 = _1984 + _1944;
    float _1988 = -_1884;
    float _1990 = _1988 + 1.0;
    float _1992 = rsqrt(_1972);
    int _1994 = _1970 * _1912;
    int _1996 = _1994 + _1966;
    float _1998 = -_1588;
    float _2000 = _1998 + 1.0;
    float _2002 = as_type<float>(_1916);
    if (_1862)
    {
        _2002 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2004 = _2002;
    float _2006 = -_1584;
    float _2008 = _2006 + 1.0;
    float _2010 = fma(_1112, _1990, _1544);
    float _2012 = -_2000;
    float _2014 = fma(_1142, _2012, _1888);
    float _2016 = -_369;
    float _2018 = fma(_1092, _2016, _1534);
    float _2020 = fma(_1208, _2008, _1904);
    int _2022 = as_type<int>(_2004);
    if (_1862)
    {
        float _2024 = _2004 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    float _2028 = float(_1986);
    if (_1982)
    {
        float _2030 = _1858 * _1890;
        _149 = _2030;
    }
    float _2032 = _149;
    float _2034 = float(_1996);
    out.m_68.x = _2018;
    out.m_68.y = _2010;
    out.m_68.z = _2014;
    out.m_68.w = _2020;
    float _2036 = fma(_1452, _1788, _1452);
    float _2038 = _1602 * _1992;
    float _2040 = _1612 * _1992;
    if (_1862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6067 = as_type<float>(_2026);
        out.gl_Position.z = _6067;
    }
    out.m_70.x = _2028;
    out.m_70.y = _2034;
    if (_1862)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2042 = -_2038;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1524);
    float _2046 = _131 + (-0.5);
    float _2048 = _1686 * _1992;
    float _2050 = -_2040;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1422);
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2044 + _2054;
    float _2058 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1762);
    float _2060 = -_2048;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1550);
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2052 + _2064;
    float _2068 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2070 = _339 + (-0.5);
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2074 = _2062 + _2072;
    float _2076 = -_2038;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1602);
    float _2080 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2068);
    float _2082 = _1668 * (-2.0);
    float _2084 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1940);
    float _2086 = -_2040;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2080);
    float _2092 = _2078 * _2078;
    float _2094 = in.m_58.x;
    float _2096 = in.m_58.y;
    float _2098 = fma(_2082, _1640, _1640);
    float _2100 = _788 + (-0.5);
    bool _2102 = _2090 >= 0.0;
    float _2104 = fma(_1792, _2032, _2058);
    float _2106 = fma(_2036, _2032, _2084);
    float _2108 = fma(_2088, _2088, _2092);
    float _2110 = -_2048;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1686);
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2098);
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2120;
    float _2124 = _2104 * 0.15915493667125701904296875;
    float _2126 = _2106 * 0.15915493667125701904296875;
    float _2128 = fma(_2112, _2112, _2108);
    float _2130 = fma(_2118, _1394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2134 = _2062;
    float _2136 = _2044;
    float _2138 = _2052;
    if (_2102)
    {
        _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2140 = _2132;
    float _2142 = fma(_2122, _1394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2144 = _2124 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_2130, _1508, _1554);
    float _2150 = fma(_1396, _2082, _1396);
    int _2152 = as_type<int>(_2140);
    if (_2102)
    {
        float _2154 = _2140 * 5.0;
        _2152 = as_type<int>(_2154);
    }
    int _2156 = _2152;
    float _2158 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2148);
    float _2160 = fma(_2150, _2032, _2114);
    if (_2102)
    {
        out.m_47.x = 0.0;
    }
    float _2162 = _2124 * 6.283185482025146484375;
    float _2164 = cos(_2162);
    float _2166 = fma(_1492, _1522, _1546);
    float _2168 = _2158 * _2096;
    if (_2102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6300 = as_type<float>(_2156);
        out.gl_Position.z = _6300;
    }
    float _2170 = _2160 * 0.15915493667125701904296875;
    float _2172 = _2126 * 6.283185482025146484375;
    float _2174 = sin(_2172);
    float _2176 = sqrt(_2128);
    float _2178 = _2126 * 6.283185482025146484375;
    float _2180 = cos(_2178);
    if (_2102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2182 = fma(_2142, _1508, _2166);
    float _2184 = _2170 * 6.283185482025146484375;
    float _2186 = cos(_2184);
    float _2188 = _1992 * _2176;
    float _2190 = _2168 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2182);
    float _2194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2196 = _2146 * _2174;
    float _2198 = _2188 * _2190;
    float _2200 = _2192 * _2094;
    float _2202 = _2170 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = _2164 * _2174;
    float _2208 = _2194 * _2198;
    float _2210 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _2214 = _2164 * _2180;
    float _2216 = _2146 * _2180;
    float _2218 = _2188 * _2210;
    float _2220 = _2164 * _2186;
    float _2222 = _2146 * _2186;
    float _2224 = _2174 * _2186;
    float _2226 = _2212 * _2218;
    float _2228 = _2220 * _2208;
    float _2230 = _2180 * _2186;
    float _2232 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2234 = _2232 * 0.5;
    float _2236 = _2222 * _2208;
    float _2238 = fma(_2204, _2214, _2196);
    float _2240 = -_2216;
    float _2242 = fma(_2204, _2206, _2240);
    float _2244 = -_2208;
    float _2246 = _2204 * _2244;
    float _2248 = -_2206;
    float _2250 = fma(_2204, _2216, _2248);
    float _2252 = fma(_2238, _2226, _2228);
    float _2254 = fma(_2204, _2196, _2214);
    float _2256 = fma(_2230, _2226, _2246);
    float _2258 = fma(_2250, _2226, _2236);
    float _2260 = fma(_2242, _2234, _2252);
    float _2262 = fma(_2224, _2234, _2256);
    float _2264 = fma(_2254, _2234, _2258);
    float _2266 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2270 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2272 = isnan(0.5);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2278 = _2274 || _2276;
    float _2280 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2282 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2284 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2286 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    float _2288 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2290 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2292 = _1550 + _2288;
    float _2294 = _1422 + _2290;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2298 = _2292 + _2296;
    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2302 = _2294 + _2300;
    float _2304 = _2298 * _2298;
    float _2306 = fma(_2302, _2302, _2304);
    float _2308 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2310 = sqrt(_2306);
    float _2312 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2308);
    float _2314 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2318 = _1524 + _2316;
    bool _2320 = _2310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2322 = _2316;
    float _2324 = _2308;
    float _2326 = _2292;
    float _2328 = _2210;
    float _2330 = _2318;
    if (!_2320)
    {
        _2322 = _2294;
    }
    float _2332 = _2322;
    float _2334 = _2332;
    if (!_2320)
    {
        _2324 = _2318;
    }
    float _2336 = _2324;
    bool _2338 = !_2320;
    float _2340 = _2336;
    if (!_2338)
    {
        float _2342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2346 = _2310 + _2344;
        float _2348 = rsqrt(_2306);
        float _2350 = _2346 * _2342;
        float _2352 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2354 = _2350 * 0.15915493667125701904296875;
        float _2356 = _2354 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354 * 6.283185482025146484375;
        float _2362 = cos(_2360);
        float _2364 = fma(_2358, _2352, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2366 = _2348 * _2364;
        float _2368 = _2362 + (-1.0);
        float _2370 = fma(_2302, _2366, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2372 = fma(_2298, _2366, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2374 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2376 = fma(_2318, _2362, _2374);
        _2334 = _2370;
        _2340 = _2376;
        _2326 = _2372;
        _2328 = _2354;
    }
    float _2378 = _2334;
    float _2380 = _2340;
    float _2382 = _2326;
    float _2384 = _2328;
    float _2386 = -_2040;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2378);
    float _2390 = -_2038;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2380);
    float _2394 = -_2048;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2382);
    float _2398 = _2392;
    float _2400 = _2388;
    float _2402 = _2396;
    float _2404 = _2384;
    if (!_2278)
    {
        float _2406 = _2056 * _2056;
        float _2408 = 1.0 / _2188;
        float _2410 = -_1550;
        float _2412 = _2410 + _2382;
        float _2414 = -_1422;
        float _2416 = _2414 + _2378;
        float _2418 = fma(_2066, _2066, _2406);
        float _2420 = -_1524;
        float _2422 = _2420 + _2380;
        float _2424 = fma(_2074, _2074, _2418);
        float _2426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2428 = sqrt(_2424);
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2432 = precise::min(_2428, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2434 = _2432 * _2426;
        float _2436 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2438 = _2434 * _2408;
        float _2440 = _2412 * _2438;
        float _2442 = _2436 * _2438;
        float _2444 = fma(_2436, _2440, _2062);
        float _2446 = fma(_2416, _2442, _2052);
        float _2448 = fma(_2422, _2442, _2044);
        _2398 = _2448;
        _2400 = _2446;
        _2402 = _2444;
    }
    float _2450 = _2398;
    float _2452 = _2400;
    float _2454 = _2402;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2458 = _2450 + _2456;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2462 = _2452 + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2466 = _2454 + _2464;
    float _2468 = _2458 * _2458;
    float _2470 = fma(_2462, _2462, _2468);
    float _2472 = fma(_2466, _2466, _2470);
    float _2474 = rsqrt(_2472);
    float _2476 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2478 = _2462 * _2476;
    float _2480 = _2466 * _2476;
    float _2482 = _2478 * _2478;
    float _2484 = _2480 * _2480;
    float _2486 = _2482 + _2484;
    float _2488 = sqrt(_2486);
    bool _2490 = _2488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2494 = _2488 + _2492;
    float _2496 = _2466;
    float _2498 = _2474;
    float _2500 = _2494;
    float _2502 = _2458;
    if (_2490)
    {
        float _2504 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2496 = _2504;
    }
    float _2506 = _2496;
    if (_2490)
    {
        float _2508 = rsqrt(_2486);
        _2498 = _2508;
    }
    float _2510 = _2498;
    float _2512 = _2510;
    if (_2490)
    {
        float _2514 = _2494 * _2506;
        _2500 = _2514;
    }
    float _2516 = _2500;
    if (_2490)
    {
        float _2518 = _2516 * 0.15915493667125701904296875;
        _2134 = _2518;
    }
    float _2520 = _2134;
    float _2522 = _2506;
    float _2524 = _2520;
    if (_2490)
    {
        float _2526 = _2520 * 6.283185482025146484375;
        float _2528 = sin(_2526);
        _2522 = _2528;
    }
    float _2530 = _2522;
    float _2532 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2534 = precise::max(0.0, _2532);
    float _2536 = _2468;
    float _2538 = _2534;
    if (_2490)
    {
        float _2540 = _2520 * 6.283185482025146484375;
        float _2542 = cos(_2540);
        _2536 = _2542;
    }
    float _2544 = _2536;
    float _2546 = -_2476;
    float _2548 = -_2534;
    float _2550 = fma(_2458, _2546, _2548);
    if (_2490)
    {
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2538 = _2552;
    }
    float _2554 = _2538;
    float _2556 = _2554;
    if (!_2490)
    {
        _2524 = _2482;
    }
    float _2558 = _2524;
    float _2560 = _2558;
    if (_2490)
    {
        float _2562 = fma(_2530, _2554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2502 = _2562;
    }
    float _2564 = _2502;
    float _2566 = sqrt(_2472);
    float _2568 = _2564;
    float _2570 = _2544;
    if (_2490)
    {
        float _2572 = _2544 + (-1.0);
        _2556 = _2572;
    }
    float _2574 = _2556;
    float _2576 = _2574;
    if (_2490)
    {
        float _2578 = _2510 * _2564;
        _2330 = _2578;
    }
    float _2580 = _2330;
    if (!_2490)
    {
        _2512 = _2478;
    }
    float _2582 = _2512;
    float _2584 = _2582;
    if (_2490)
    {
        float _2586 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2404 = _2586;
    }
    float _2588 = _2404;
    if (_2490)
    {
        float _2590 = _2478 * _2580;
        _2584 = _2590;
    }
    float _2592 = _2584;
    if (!_2490)
    {
        _2568 = _2550;
    }
    float _2594 = _2568;
    float _2596 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2598 = _2594;
    if (!_2490)
    {
        _2576 = _2480;
    }
    float _2600 = _2576;
    float _2602 = _2600;
    if (_2490)
    {
        float _2604 = fma(_2550, _2544, _2588);
        _2598 = _2604;
    }
    float _2606 = _2598;
    if (_2490)
    {
        float _2608 = _2480 * _2580;
        _2602 = _2608;
    }
    float _2610 = _2602;
    if (_2490)
    {
        float _2612 = _2592 * _2592;
        _2560 = _2612;
    }
    float _2614 = _2560;
    if (!_2490)
    {
        _2570 = _2484;
    }
    float _2616 = _2570;
    float _2618 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2620 = _2616;
    if (_2490)
    {
        float _2622 = _2610 * _2610;
        _2620 = _2622;
    }
    float _2624 = _2620;
    float _2626 = fma(_2606, _2606, _2614);
    float _2628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2630 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2618);
    float _2632 = _2626 + _2624;
    float _2634 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2596);
    float _2636 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2640 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2638);
    float _2642 = precise::clamp(_2640, 0.0, 1.0);
    float _2644 = rsqrt(_2632);
    float _2646 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2634);
    float _2648 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2650 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2636);
    float _2652 = -_2642;
    float _2654 = _2652 + 1.0;
    float _2656 = _2646 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2658 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2648);
    float _2660 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2650);
    float _2662 = abs(_2654);
    float _2664 = log2(_2662);
    float _2666 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2668 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2658);
    float _2670 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2672 = -_2666;
    float _2674 = fma(_2672, _2628, 1.0);
    float _2676 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2678 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2630);
    float _2680 = _2644 * _2592;
    float _2682 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2684 = _2644 * _2610;
    float _2686 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2688 = log2(_2674);
    float _2690 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2682);
    float _2692 = _2644 * _2606;
    float _2694 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2698 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2690);
    float _2700 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2702 = -_2694;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2698);
    float _2708 = exp2(_2696);
    float _2710 = -_2684;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2714 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2716 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2700);
    float _2718 = fma(_2712, -0.5, 0.5);
    float _2720 = fma(_2712, 0.5, 0.5);
    float _2722 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2714);
    float _2724 = 1.0 / _2706;
    float _2726 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2716);
    float _2728 = fma(_2720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2730 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2732 = _2692 + 1.0;
    float _2734 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2726);
    float _2736 = fma(_2720, _2728, -0.212114393711090087890625);
    float _2738 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2730);
    float _2740 = sqrt(_2718);
    float _2742 = -_2692;
    float _2744 = fma(_2708, _2732, _2742);
    float _2746 = _2688 * 0.693147182464599609375;
    float _2748 = fma(_2720, _2736, 1.570728778839111328125);
    float _2750 = fma(_2744, 0.5, 0.5);
    float _2752 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2754 = _2738 * _2724;
    float _2756 = _2734 * _2724;
    float _2758 = fma(_2754, 0.5, 0.5);
    float _2760 = fma(_2756, -0.5, 0.5);
    float _2762 = _2740 * 0.636619746685028076171875;
    float3 _7270 = float3(_2758, _2760, _2752);
    float _2764 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7270, float3(0.0), isnan(_7270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7270, float3(0.0), isnan(_7270)), level(0.0)).x;
    float3 _7281 = float3(_2758, _2760, _2752);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7281, float3(0.0), isnan(_7281)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7281, float3(0.0), isnan(_7281)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float _2777 = -_2748;
    float _2779 = fma(_2762, _2777, 1.0);
    float2 _7303 = float2(_2779, _2750);
    float3 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7303, float2(0.0), isnan(_7303)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7303, float2(0.0), isnan(_7303)), level(0.0)).xyz;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2793 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2795 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2799 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2801 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2791);
    float _2803 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2793);
    float _2805 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    float _2807 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2809 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2811 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2813 = -_2204;
    float _2815 = fma(_2813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2797);
    float _2817 = -_2204;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2799);
    float _2821 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2823 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2825 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2809);
    float _2827 = fma(_2811, _2811, 1.0);
    float _2829 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2831 = -_2204;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    float _2835 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2821);
    float _2837 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2823);
    float _2839 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2815);
    float _2841 = rsqrt(_2827);
    float _2843 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2819);
    float _2845 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    float _2847 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2801);
    float _2849 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2803);
    float _2851 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2805);
    float _2853 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2825);
    float _2855 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2835);
    float _2857 = exp2(_2829);
    float _2859 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2837);
    float _2861 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2863 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2865 = _2811 * _2839;
    float _2867 = _2811 * _2843;
    float _2869 = _2811 * _2845;
    float _2871 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2861);
    float _2873 = _2811 * _2841;
    out.m_72.x = _2847;
    out.m_72.y = _2849;
    out.m_72.z = _2851;
    float _2875 = fma(_2863, _2847, _2865);
    float _2877 = fma(_2863, _2849, _2867);
    float _2879 = fma(_2863, _2851, _2869);
    float _2881 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2871);
    float _2883 = _2738 + _2706;
    float _2885 = -_2857;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2881);
    float _2891 = _2883 * 0.5;
    float _2893 = _2855 + _2877;
    float _2895 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2897 = -_2853;
    float _2899 = _2873 * _2897;
    float _2901 = -_2855;
    float _2903 = _2873 * _2901;
    float _2905 = -_2859;
    float _2907 = _2873 * _2905;
    float _2909 = _2706 * 0.5;
    float _2911 = fma(_2841, _2839, _2899);
    float _2913 = fma(_2841, _2843, _2903);
    float _2915 = fma(_2841, _2845, _2907);
    float _2917 = _2889 + _2706;
    float _2919 = fma(_2734, -0.5, _2909);
    float _2921 = _2853 + _2875;
    float _2923 = _2859 + _2879;
    out.m_74.x = _2911;
    out.m_74.y = _2913;
    out.m_74.z = _2915;
    float _2925 = _2917 * 0.5;
    bool _2927 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2929 = isnan(_2566);
    bool _2931 = _2927 || _2929;
    bool _2933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2935 = _2931 || _2933;
    out.m_76.x = _2921;
    out.m_76.y = _2893;
    out.m_76.z = _2923;
    out.m_78.x = _2891;
    out.m_78.y = _2919;
    out.m_78.z = _2925;
    out.m_78.w = _2706;
    float _2937 = -_2895;
    float _2939 = _2937 + 1.0;
    out.m_80.x = _2452;
    out.m_80.y = _2450;
    out.m_80.z = _2454;
    out.m_82.x = _2052;
    out.m_82.y = _2044;
    out.gl_Position.x = _2738;
    out.gl_Position.y = _2734;
    out.gl_Position.z = _2889;
    out.gl_Position.w = _2706;
    float _2941 = _2734;
    float _2943 = _2738;
    if (!_2935)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2945 = _2136;
    float _2947 = _2945;
    float _2949 = _2945;
    if (!_2935)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2951 = _2138;
    float _2953 = _2951;
    float _2955 = _2951;
    if (!_2935)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2957 = _2941;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2935)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2963 = _2943;
    float _2965 = _2895 * _2764;
    float _2967 = _2775 * _2939;
    float _2969 = _2775 * _2965;
    float _2971 = _2789 * _2965;
    float _2973 = fma(_2785, _2969, _2769);
    float _2975 = fma(_2787, _2969, _2771);
    float _2977 = fma(_2775, _2971, _2773);
    float _2979 = _2775;
    float _2981 = _2773;
    float _2983 = _2963;
    float _2985 = _2963;
    if (!_2935)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2987 = _2979;
    float _2989 = _2987;
    float _2991 = _2987;
    if (!_2935)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2993 = _2981;
    out.m_84.x = _2973;
    out.m_84.y = _2975;
    out.m_84.z = _2977;
    out.m_84.w = _2967;
    bool _2995 = !_2935;
    float _2997 = _2993;
    float _2999 = _2993;
    if (!_2995)
    {
        bool _3001 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3003 = isnan(_2566);
        bool _3005 = _3001 || _3003;
        bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3009 = _3005 || _3007;
        if (!_3009)
        {
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3013 = _2566 + _3011;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3017 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3015;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3023 = 1.0 / _3017;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3041 = _3013 * _3023;
            float _3043 = precise::clamp(_3041, 0.0, 1.0);
            float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3049 = fma(_3043, _3021, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3051 = fma(_3043, _3047, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3053 = fma(_3043, _3027, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3055 = fma(_3043, _3031, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3057 = fma(_3043, _3035, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3059 = fma(_3043, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2985 = _3053;
            _2949 = _3057;
            _2961 = _3049;
            _2999 = _3055;
            _2991 = _3051;
            _2955 = _3059;
            _3061 = true;
        }
        else
        {
            bool _3063 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3065 = isnan(_2566);
            bool _3067 = _3063 || _3065;
            bool _3069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3071 = _3067 || _3069;
            if (!_3071)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3073 = _2959;
            _2961 = _3073;
            if (!_3071)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3075 = _2983;
            _2985 = _3075;
            if (!_3071)
            {
                _2989 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3077 = _2989;
            _2991 = _3077;
            if (!_3071)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3079 = _2997;
            _2999 = _3079;
            if (!_3071)
            {
                _2947 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3081 = _2947;
            _2949 = _3081;
            if (!_3071)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3083 = _2953;
            bool _3085 = !_3071;
            _2955 = _3083;
            if (!_3085)
            {
                bool _3087 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3089 = isnan(_2566);
                bool _3091 = _3087 || _3089;
                bool _3093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3095 = _3091 || _3093;
                if (!_3095)
                {
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3099 = _2566 + _3097;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3103 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3101;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3109 = 1.0 / _3103;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3127 = _3099 * _3109;
                    float _3129 = precise::clamp(_3127, 0.0, 1.0);
                    float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3135 = fma(_3129, _3107, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3137 = fma(_3129, _3133, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3139 = fma(_3129, _3113, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3141 = fma(_3129, _3117, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3143 = fma(_3129, _3121, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3145 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2985 = _3139;
                    _2949 = _3143;
                    _2961 = _3135;
                    _2999 = _3141;
                    _2991 = _3137;
                    _2955 = _3145;
                    _3061 = true;
                }
                else
                {
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2949 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2991 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3061 = false;
    float _3147 = _2985;
    float _3149 = _2949;
    float _3151 = _2961;
    float _3153 = _2999;
    float _3155 = _2991;
    float _3157 = _2955;
    float _3159 = fma(_2893, -0.5, 0.5);
    float _3161 = precise::clamp(_3159, 0.0, 1.0);
    float _3163 = -_3147;
    float _3165 = _3163 + _3149;
    float _3167 = -_3151;
    float _3169 = _3167 + _3153;
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    bool _3175 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3177 = fma(_3161, _3165, _3147);
    float _3179 = fma(_3161, _3169, _3151);
    float _3181 = fma(_3161, _3173, _3155);
    float _3183 = _3177 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3185 = fma(_3179, 0.298911988735198974609375, _3183);
    float _3187 = fma(_3181, 0.114477999508380889892578125, _3185);
    out.m_86.x = 0.0;
    float _3189 = -_3187;
    float _3191 = _3179 + _3189;
    float _3193 = -_3187;
    float _3195 = _3177 + _3193;
    float _3197 = -_3187;
    float _3199 = _3181 + _3197;
    float _3201 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3203 = fma(_3191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3205 = fma(_3195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3207 = fma(_3199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    out.m_88.w = _3201;
    out.m_90.x = _3203;
    out.m_90.y = _3205;
    out.m_90.z = _3207;
    if (!_3175)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3209 = -_2450;
    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3213 = -_2452;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3217 = -_2454;
    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3221 = _3211 * _3211;
    float _3223 = fma(_3215, _3215, _3221);
    float _3225 = fma(_3219, _3219, _3223);
    float _3227 = sqrt(_3225);
    float _3229 = rsqrt(_3225);
    float _3231 = -_3227;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3235 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3237 = precise::clamp(_3235, 0.0, 1.0);
    float _3239 = _3215 * _3229;
    float _3241 = _3211 * _3229;
    float _3243 = abs(_3237);
    float _3245 = log2(_3243);
    float _3247 = _3219 * _3229;
    float _3249 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3251 = _2893 * _3241;
    float _3253 = -_3241;
    float _3255 = -_3249;
    float _3257 = fma(_3253, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3255);
    float _3259 = fma(_2921, _3239, _3251);
    float _3261 = -_3247;
    float _3263 = fma(_3261, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3257);
    float _3265 = fma(_2923, _3247, _3259);
    float _3267 = precise::clamp(_3265, 0.0, 1.0);
    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3271 = _3263 + _3269;
    float _3273 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3275 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = exp2(_3273);
    float _3281 = _3279 * _3277;
    float _3283 = _3267 * _3281;
    float _3285 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3287 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3289 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3285;
    out.m_86.y = _3287;
    out.m_86.z = _3289;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3061 = false;
    bool _325 = false;
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
        float _3346 = as_type<float>(_125);
        out.gl_Position.z = _3346;
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3419 = as_type<float>(_165);
        out.gl_Position.z = _3419;
    }
    if (_159)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    float _201 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _203 = 0.0;
    float _205 = _201;
    if (!_179)
    {
        float _207 = _201 * _201;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_195;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_199;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _211;
    if (!_179)
    {
        float _223 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _223;
    }
    float _225 = _221;
    bool _227 = !_179;
    float _229 = _225;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _201 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _201);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_179;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _201 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _205 = _283;
    }
    float _285 = _205;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _291 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _295 = fma(_285, _181, _289);
    float _297 = fma(_285, _183, _291);
    float _299 = fma(_285, _185, _293);
    float _301 = fma(_295, _169, _187);
    float _303 = fma(_297, _169, _189);
    float _305 = fma(_299, _169, _191);
    bool _307 = !_287;
    float _323;
    if (!_307)
    {
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_109);
        float _329 = 1.0 / _327;
        float _331 = _145 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _337 = int(_335);
    float _339 = in.m_51.y;
    float _341 = float(_109);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _333 + _343;
    float _347 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _349 = int(_347);
    float _351 = float(_337);
    float _353 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _355 = int(_353);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _359 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _357);
    float _361 = float(_349);
    float _363 = 1.0 / _351;
    float _365 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _359);
    float _367 = -_365;
    float _369 = _367 + 1.0;
    float _371 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _373 = int(_371);
    float _375 = float(uint(_355));
    bool _377 = _355 == 0;
    int _379 = ~_355;
    int _381 = _379 + 1;
    float _383 = 1.0 / _361;
    float _385 = _363 * _145;
    float _387 = 1.0 / _375;
    float _389 = float(uint(_373));
    int _391 = ~_373;
    int _393 = _391 + 1;
    int _395 = ~_373;
    int _397 = _395 + 1;
    float _399 = trunc(_385);
    int _401 = int(_399);
    float _403 = _383 * _145;
    int _405 = ~_355;
    int _407 = _405 + 1;
    float _409 = 1.0 / _389;
    int _411 = as_type<int>(_387) + (-2);
    float _413 = trunc(_403);
    int _415 = int(_413);
    float _417 = float(uint(_401));
    float _419 = float(_401);
    float _421 = as_type<float>(_411) * _417;
    int _423 = as_type<int>(_409) + (-2);
    float _425 = 1.0 / _341;
    float _427 = float(uint(_415));
    float _429 = trunc(_421);
    float _431 = precise::max(_429, 0.0);
    uint _434 = uint(_431);
    float _436 = as_type<float>(_423) * _427;
    float _438 = trunc(_436);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _446 = _444 != 0;
    float _448 = _425 * _145;
    int _450 = _407 * int(_434);
    int _452 = _450 + _401;
    float _454 = float(uint(_452));
    float _456 = _436;
    float _458 = _454;
    int _460 = _423;
    if (_446)
    {
        _456 = 1.0;
    }
    float _462 = _456;
    int _464 = _393 * int(_442);
    int _466 = _464 + _415;
    float _468 = _462;
    float _470 = as_type<float>(_466);
    if (!_446)
    {
        _468 = 7.345489978790283203125;
    }
    float _472 = _468;
    float _474 = as_type<float>(_411) * _454;
    if (_446)
    {
        _458 = 1.0;
    }
    float _476 = _458;
    float _478 = float(uint(_466));
    float _480 = trunc(_474);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    float _486 = _476;
    if (_446)
    {
        _470 = _131;
    }
    float _488 = _470;
    float _490 = _472 * _131;
    float _492 = _488;
    if (!_446)
    {
        _486 = 1.2345600128173828125;
    }
    float _494 = _486;
    float _496 = as_type<float>(_423) * _478;
    if (!_446)
    {
        _492 = _339;
    }
    float _498 = _492;
    float _500 = floor(_490);
    float _502 = _494 * _498;
    int _504 = ~_355;
    int _506 = _504 + 1;
    float _508 = trunc(_496);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    int _514 = int(_434) + int(_484);
    int _516 = ~_373;
    int _518 = _516 + 1;
    float _520 = floor(_502);
    int _522 = _506 * _514;
    int _524 = _522 + _401;
    float _526 = -_500;
    float _528 = _490 + _526;
    bool _530 = uint(_524) >= uint(_355);
    int _532 = int(_442) + int(_512);
    float _534 = float(_355);
    float _536 = float(_373);
    int _538 = _518 * _532;
    int _540 = _538 + _415;
    float _542 = -_520;
    float _544 = _502 + _542;
    bool _546 = _419 >= _534;
    bool _548 = isnan(_419);
    bool _550 = _546 || _548;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _528 * _534;
    bool _560 = !_530;
    int _562 = _560 ? 0 : (-1);
    float _564 = _534 * _448;
    bool _566 = uint(_540) >= uint(_373);
    float _568 = trunc(_556);
    int _570 = int(_568);
    int _572 = ~_514;
    int _574 = _572 + _562;
    int _576 = _574 + 1;
    float _578 = float(_415);
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _582 = _580 != 0;
    int _584 = _355 * _576;
    int _586 = _584 + _401;
    bool _588 = _578 >= _536;
    bool _590 = isnan(_578);
    bool _592 = _588 || _590;
    bool _594 = isnan(_536);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = trunc(_558);
    int _602 = int(_600);
    bool _604 = !_582;
    int _606 = _604 ? 0 : 1;
    float _608 = _536 * _448;
    bool _610 = !_566;
    int _612 = _610 ? 0 : (-1);
    float _614 = _544 * _536;
    int _616 = abs(_606);
    bool _618 = !_377;
    int _620 = _618 ? _586 : (-1);
    float _622 = trunc(_598);
    int _624 = int(_622);
    int _626 = ~_570;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _642 = _640 != 0;
    int _644 = ~_532;
    int _646 = _644 + _612;
    int _648 = _646 + 1;
    int _650 = _355 + (-1);
    int _652 = _602 * _616;
    int _654 = _652 + _401;
    float _656 = trunc(_564);
    int _658 = int(_656);
    int _660 = _620 * _630;
    bool _662 = !_638;
    int _664 = _662 ? 0 : 1;
    int _666 = _373 * _648;
    int _668 = _666 + _415;
    bool _670 = _373 == 0;
    int _672 = _570 * _650;
    int _674 = _672 + _660;
    int _676 = abs(_664);
    int _678 = ~_624;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = trunc(_614);
    int _686 = int(_684);
    bool _688 = !_670;
    int _690 = _688 ? _668 : (-1);
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _694 = _692 != 0;
    int _696 = _690 * _682;
    bool _698 = !_634;
    int _700 = _698 ? 0 : 1;
    float _702 = trunc(_608);
    int _704 = int(_702);
    bool _706 = !_694;
    int _708 = _706 ? 0 : 1;
    int _710 = _674 * _676;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _714 = _712 != 0;
    int _716 = abs(_700);
    int _718 = abs(_708);
    bool _720 = !_642;
    int _722 = _720 ? 0 : 1;
    int _724 = _658 * _716;
    int _726 = _724 + _710;
    int _728 = _373 + (-1);
    int _730 = _686 * _718;
    int _732 = _730 + _415;
    bool _734 = !_714;
    int _736 = _734 ? 0 : 1;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _748 = _746 != 0;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _752 = _750 != 0;
    int _754 = _624 * _728;
    int _756 = _754 + _696;
    int _758 = abs(_722);
    int _760 = abs(_736);
    bool _762 = !_744;
    int _764 = _762 ? 0 : 1;
    int _766 = abs(_764);
    int _768 = _654 * _758;
    int _770 = _768 + _726;
    bool _772 = !_740;
    int _774 = _772 ? 0 : 1;
    int _776 = _602 * _760;
    int _778 = _776 + _770;
    bool _780 = !_752;
    int _782 = _780 ? 0 : 1;
    int _784 = _756 * _766;
    int _786 = abs(_774);
    float _788 = in.m_51.z;
    int _790 = abs(_782);
    bool _792 = !_748;
    int _794 = _792 ? 0 : 1;
    int _796 = _704 * _786;
    int _798 = _796 + _784;
    float _800 = float(uint(_778));
    int _802 = abs(_794);
    int _804 = ~_355;
    int _806 = _804 + 1;
    float _808 = as_type<float>(_411) * _800;
    bool _810 = _355 == 0;
    int _812 = _732 * _802;
    int _814 = _812 + _798;
    float _816 = trunc(_808);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = _686 * _790;
    int _824 = _822 + _814;
    int _826 = ~_355;
    int _828 = _826 + 1;
    int _830 = ~_373;
    int _832 = _830 + 1;
    float _834 = float(uint(_824));
    float _836 = as_type<float>(_423) * _834;
    int _838 = _828 * int(_820);
    int _840 = _838 + _778;
    float _842 = trunc(_836);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = float(uint(_840));
    float _850 = as_type<float>(_411) * _848;
    float _852 = trunc(_850);
    float _854 = precise::max(_852, 0.0);
    uint _856 = uint(_854);
    int _858 = _832 * int(_846);
    int _860 = _858 + _824;
    float _862 = float(uint(_860));
    int _864 = ~_373;
    int _866 = _864 + 1;
    float _868 = as_type<float>(_423) * _862;
    int _870 = int(_820) + int(_856);
    float _872 = trunc(_868);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    int _878 = _806 * _870;
    int _880 = _878 + _778;
    bool _882 = uint(_880) >= uint(_355);
    bool _884 = !_882;
    int _886 = _884 ? 0 : (-1);
    int _888 = ~_870;
    int _890 = _888 + _886;
    int _892 = _890 + 1;
    int _894 = int(_846) + int(_876);
    int _896 = _355 * _892;
    int _898 = _896 + _778;
    int _900 = _866 * _894;
    int _902 = _900 + _824;
    bool _904 = !_810;
    int _906 = _904 ? _898 : (-1);
    bool _908 = uint(_902) >= uint(_373);
    int _910 = _906 & 3;
    bool _912 = _910 != 0;
    bool _914 = !_908;
    int _916 = _914 ? 0 : (-1);
    bool _918 = uint(_910) > 1u;
    int _920 = ~_894;
    int _922 = _920 + _916;
    int _924 = _922 + 1;
    int _926 = _906 & 3;
    bool _928 = _926 != 0;
    bool _930 = uint(_910) >= 2u;
    int _932 = _373 * _924;
    int _934 = _932 + _824;
    int _936 = _928 ? 0 : 1;
    int _938 = ~_373;
    int _940 = _938 + 1;
    int _942 = ~_936;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    int _948 = _946;
    if (!_918)
    {
        int _950 = ~_936;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = float(uint(_654));
    bool _958 = !_670;
    int _960 = _958 ? _934 : (-1);
    int _962 = _930 ? 0 : 1;
    float _964 = as_type<float>(_411) * _956;
    int _966 = _960 & 3;
    bool _968 = _966 != 0;
    float _970 = float(uint(_732));
    float _972 = trunc(_964);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    int _978 = _960 & 3;
    bool _980 = _978 != 0;
    bool _982 = uint(_966) > 1u;
    float _984 = as_type<float>(_423) * _970;
    int _986 = _980 ? 0 : 1;
    bool _988 = _910 != 3;
    float _990 = trunc(_984);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = ~_986;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    int _1002 = ~_355;
    int _1004 = _1002 + 1;
    int _1006 = ~_962;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    int _1016 = _1004 * int(_976);
    int _1018 = _1016 + _654;
    int _1020 = _1000;
    int _1022 = _1010;
    if (!_982)
    {
        int _1024 = ~_986;
        int _1026 = _1024 + 1;
        _1020 = _1026;
    }
    int _1028 = _1020;
    float _1030 = in.m_51.w;
    bool _1032 = _966 != 3;
    if (_988)
    {
        int _1034 = ~_962;
        int _1036 = _1034 + 1;
        _1022 = _1036;
    }
    int _1038 = _1022;
    float _1040 = _131 * 2.0;
    bool _1042 = uint(_966) >= 2u;
    int _1044 = _940 * int(_994);
    int _1046 = _1044 + _732;
    float _1048 = float(uint(_1018));
    int _1050 = _1042 ? 0 : 1;
    float _1052 = floor(_1040);
    bool _1054 = _131 > 0.5;
    float _1056 = as_type<float>(_411) * _1048;
    int _1058 = ~_1050;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = _1062;
    if (_1032)
    {
        int _1066 = ~_1050;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = _339 * 2.0;
    float _1074 = float(uint(_1046));
    float _1076 = -_215;
    int _1078 = _1054 ? as_type<int>(_1076) : as_type<int>(_215);
    int _1080 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1082 = _1080 != 0;
    float _1084 = as_type<float>(_423) * _1074;
    bool _1086 = _339 > 0.5;
    float _1088 = floor(_1072);
    bool _1090 = !_1082;
    float _1092 = _1090 ? _215 : as_type<float>(_1078);
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1096 = _1094 != 0;
    float _1098 = -_219;
    int _1100 = _1086 ? as_type<int>(_1098) : as_type<int>(_219);
    bool _1102 = _788 > 0.5;
    float _1104 = trunc(_1056);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    bool _1110 = !_1096;
    float _1112 = _1110 ? _219 : as_type<float>(_1100);
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    bool _1118 = _1052 > 0.0;
    float _1120 = -_215;
    int _1122 = _1102 ? as_type<int>(_1120) : as_type<int>(_215);
    float _1124 = trunc(_1084);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    bool _1130 = _1052 >= 0.0;
    bool _1132 = isnan(_1052);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    bool _1140 = !_1116;
    float _1142 = _1140 ? _215 : as_type<float>(_1122);
    bool _1144 = _1030 > 0.5;
    if (_1014)
    {
        _460 = 0;
    }
    int _1146 = _460;
    int _1148 = int(_976) + int(_1108);
    float _1150 = in.m_60.x;
    float _1152 = in.m_60.y;
    float _1154 = in.m_60.z;
    float _1156 = in.m_60.w;
    int _1158 = _1146;
    if (!_1014)
    {
        _1158 = 1;
    }
    int _1160 = _1158;
    int _1162 = _1138 ? 0 : 1;
    int _1164 = _381 * _1148;
    int _1166 = _1164 + _654;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1170 = _1168 != 0;
    float _1172 = -_219;
    int _1174 = _1144 ? as_type<int>(_1172) : as_type<int>(_219);
    int _1176 = int(_994) + int(_1128);
    int _1178 = ~_1162;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = in.m_62.x;
    float _1186 = in.m_62.y;
    float _1188 = in.m_62.z;
    float _1190 = in.m_62.w;
    bool _1192 = _1160 != 1;
    int _1194 = _397 * _1176;
    int _1196 = _1194 + _732;
    int _1198 = _1182;
    if (!_1118)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    bool _1206 = !_1170;
    float _1208 = _1206 ? _219 : as_type<float>(_1174);
    bool _1210 = _1088 > 0.0;
    bool _1212 = _1088 >= 0.0;
    bool _1214 = isnan(_1088);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = in.m_64.x;
    float _1224 = in.m_64.y;
    float _1226 = in.m_64.z;
    float _1228 = in.m_64.w;
    float _1230 = _303 * _1152;
    int _1232 = _1220 ? 0 : 1;
    float _1234 = 0.0;
    if (!_1192)
    {
        _1234 = _339;
    }
    float _1236 = _1234;
    float _1238 = fma(_301, _1150, _1230);
    float _1240 = 0.0;
    float _1242 = _1236;
    if (!_1192)
    {
        _1240 = _339;
    }
    float _1244 = _1240;
    float _1246 = 0.0;
    float _1248 = _1244;
    if (!_1192)
    {
        _1246 = _788;
    }
    float _1250 = _1246;
    float _1252 = fma(_305, _1154, _1238);
    float _1254 = 0.0;
    float _1256 = _1250;
    if (!_1192)
    {
        _1254 = _788;
    }
    float _1258 = _1254;
    float _1260 = _1258;
    if (_1192)
    {
        _1242 = _131;
    }
    float _1262 = _1242;
    if (_1192)
    {
        _1248 = _131;
    }
    float _1264 = _1248;
    if (_1192)
    {
        _1256 = _339;
    }
    float _1266 = _1256;
    if (_1192)
    {
        _1260 = _339;
    }
    float _1268 = _1260;
    bool _1270 = uint(_1196) >= uint(_373);
    bool _1272 = uint(_1166) >= uint(_355);
    int _1274 = ~_1232;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    bool _1280 = !_1270;
    int _1282 = _1280 ? 0 : (-1);
    int _1284 = _1278;
    if (!_1210)
    {
        int _1286 = ~_1232;
        int _1288 = _1286 + 1;
        _1284 = _1288;
    }
    int _1290 = _1284;
    float _1292 = _303 * _1186;
    bool _1294 = !_1272;
    int _1296 = _1294 ? 0 : (-1);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1308 = _1306 != 0;
    float _1310 = _303 * _1224;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1314 = _1312 != 0;
    float _1316 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1320 = _1318 != 0;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1322;
    float _1326 = fma(_301, _1222, _1310);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1332 = 1.0 / _1324;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1334;
    float _1338 = fma(_301, _1184, _1292);
    float _1340 = _788 * 2.0;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1344 = fma(_305, _1188, _1338);
    float _1346 = 1.0 / _1336;
    float _1348 = fma(_305, _1226, _1326);
    float _1350 = -_1342;
    float _1352 = fma(_1316, 2.0, _1350);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1356 = _333 + _1354;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1360 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1362 = 1.0 / _1330;
    float _1364 = _131 + _788;
    float _1366 = fma(_1360, -2.0, _1358);
    float _1368 = -_145;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1372 = _1364 + (-1.0);
    bool _1374 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1376 = isnan(_333);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1366);
    float _1388 = floor(_1340);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1392 = _333 + _1390;
    float _1394 = _1356 * _1346;
    float _1396 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1398 = _1392 * _1332;
    float _1400 = _131 + _339;
    bool _1402 = !_1300;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _345 * _1362;
    bool _1408 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1410 = isnan(_333);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1400 + (-1.0);
    float _1422 = _1348 + _1228;
    float _1424 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1426 = _788 + _339;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1430 = _1388 >= 0.0;
    bool _1432 = isnan(_1388);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = _1426 + (-1.0);
    bool _1442 = !_1304;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1446;
    int _1450 = _1438 ? 0 : 1;
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1454;
    bool _1458 = _1388 > 0.0;
    float _1460 = fma(_1448, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1462 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1464 = isnan(_333);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = fma(_1456, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1484 = !_1308;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = -_1472;
    float _1490 = _1488 + 1.0;
    float _1492 = fma(_1478, _1406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1494 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1496 = isnan(_333);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = fma(_1482, _1406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1508 = _1384 * _1490;
    float _1510 = -_1384;
    float _1512 = _1510 + 1.0;
    float _1514 = _1092 + 0.5;
    float _1516 = -_1504;
    float _1518 = _1516 + 1.0;
    int _1520 = abs(_1444);
    float _1522 = _1504 * _1512;
    float _1524 = _1252 + _1156;
    float _1526 = _1418 * _1518;
    float _1528 = -_1418;
    float _1530 = _1528 + 1.0;
    float _1532 = _1112 + (-0.5);
    float _1534 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1370);
    float _1536 = _1474 * _1526;
    float _1538 = _1460 * _1526;
    float _1540 = -_1532;
    float _1542 = -_1386;
    float _1544 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1542);
    float _1546 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1536);
    float _1548 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1538);
    float _1550 = _1344 + _1190;
    float _1552 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1428);
    float _1554 = fma(_1506, _1522, _1548);
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1560 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1562 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1556);
    float _1564 = float(_1290);
    float _1566 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1568 = log2(_1566);
    float _1570 = -_1558;
    float _1572 = fma(_1560, 2.0, _1570);
    int _1574 = abs(_1486);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1578 = -_145;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1572);
    int _1582 = _960 >> 31;
    float _1584 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1552);
    float _1586 = float(_1520);
    float _1588 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    int _1590 = _906 >> 31;
    int _1592 = _1582 & 3;
    int _1594 = _1590 & 3;
    float _1596 = _1568 * _145;
    int _1598 = _960 + _1592;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1602 = _1524 + _1600;
    int _1604 = _906 + _1594;
    float _1606 = exp2(_1596);
    float _1608 = float(_1204);
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1422 + _1610;
    int _1614 = _1604 >> 2;
    float _1616 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1618 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1620 = _1598 >> 2;
    float _1622 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1616);
    int _1624 = _1614 << 4;
    int _1626 = _1624 + 368;
    float _1628 = fma(_1618, -2.0, _1576);
    float _1630 = float(_1574);
    float _1632 = _1586 * _1608;
    int _1634 = abs(_1404);
    float _1636 = in.m_66.x;
    float _1638 = in.m_66.y;
    float _1640 = in.m_66.z;
    int _1642 = _1620 << 4;
    int _1644 = _1642 + 512;
    uint _1646 = uint(int(uint(_1626) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[int(_1656)][_1658];
    int _1662 = ~_1450;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = _1630 * _1564;
    int _1670 = _1666;
    if (!_1458)
    {
        int _1672 = ~_1450;
        int _1674 = _1672 + 1;
        _1670 = _1674;
    }
    int _1676 = _1670;
    float _1678 = -_1606;
    float _1680 = _1678 + 1.0;
    float _1682 = float(_1634);
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1550 + _1684;
    float _1688 = float(_1676);
    uint _1690 = uint(int(uint(_1644) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = ~_1148;
    int _1708 = _1706 + _1296;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1622);
    int _1714 = abs(_954);
    float _1716 = _1682 * _1688;
    int _1718 = ~_1176;
    int _1720 = _1718 + _1282;
    int _1722 = _1720 + 1;
    int _1724 = _355 * _1710;
    int _1726 = _1724 + _654;
    int _1728 = abs(_1028);
    int _1730 = _1626 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = _1716 * (-2.0);
    bool _1750 = !_912;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _373 * _1722;
    int _1756 = _1754 + _732;
    int _1758 = abs(_1070);
    float _1760 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1628);
    float _1762 = fma(_1748, _1636, _1636);
    bool _1764 = !_968;
    int _1766 = _1764 ? 0 : 1;
    int _1768 = _1644 + 8;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = abs(_1752);
    float _1788 = _1632 * (-2.0);
    int _1790 = abs(_1766);
    float _1792 = fma(_1424, _1748, _1424);
    int _1794 = ~_1714;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = ~_1728;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = abs(_1038);
    int _1808 = ~_1786;
    int _1810 = _1808 + 1;
    int _1812 = _1810 + 1;
    bool _1814 = _910 != 3;
    bool _1816 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1818 = isnan(0.0);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1824 = _1820 || _1822;
    int _1826 = _1798 * as_type<int>(_1660);
    int _1828 = ~_1806;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    int _1834 = _1812 * as_type<int>(_1652);
    int _1836 = _1834 + _1826;
    bool _1838 = !_1314;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1844 = _966 != 3;
    int _1846 = _1804 * as_type<int>(_1704);
    int _1848 = ~_1790;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1856 = 1.0 + _1854;
    float _1858 = _1824 ? _1680 : 0.0;
    float _1860 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1842);
    bool _1862 = _1712 >= 0.0;
    int _1864 = _1852 * as_type<int>(_1696);
    int _1866 = _1864 + _1846;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : (-1);
    int _1872 = _1832 * as_type<int>(_1738);
    int _1874 = _1872 + _1836;
    bool _1876 = !_1814;
    int _1878 = _1876 ? 0 : (-1);
    float _1880 = _1142 + 0.5;
    int _1882 = abs(_1870);
    float _1884 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1860);
    int _1886 = abs(_1878);
    float _1888 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1580);
    float _1890 = 1.0 / _1856;
    bool _1892 = !_1320;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = _1208 + (-0.5);
    int _1898 = abs(_1840);
    if (_1862)
    {
        out.m_47.x = 0.0;
    }
    float _1900 = -_1896;
    float _1902 = -_1760;
    float _1904 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1902);
    int _1906 = ~_1758;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = abs(_1894);
    int _1914 = _1910 * as_type<int>(_1776);
    int _1916 = _1914 + _1866;
    int _1918 = ~_1886;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = ~_1898;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = ~_1882;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = _1922 * as_type<int>(_1746);
    int _1938 = _1936 + _1874;
    float _1940 = fma(_1788, _1638, _1638);
    bool _1942 = _355 == 0;
    int _1944 = _1938 * _1928;
    float _1946 = _1602 * _1602;
    int _1948 = ~_1912;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1934 * as_type<int>(_1784);
    int _1956 = _1954 + _1916;
    bool _1958 = _373 == 0;
    float _1960 = fma(_1612, _1612, _1946);
    bool _1962 = !_1942;
    int _1964 = _1962 ? _1726 : (-1);
    int _1966 = _1956 * _1952;
    bool _1968 = !_1958;
    int _1970 = _1968 ? _1756 : (-1);
    float _1972 = fma(_1686, _1686, _1960);
    bool _1974 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1976 = isnan(1.0);
    bool _1978 = _1974 || _1976;
    bool _1980 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1982 = _1978 || _1980;
    int _1984 = _1964 * _1898;
    int _1986 = _1984 + _1944;
    float _1988 = -_1884;
    float _1990 = _1988 + 1.0;
    float _1992 = rsqrt(_1972);
    int _1994 = _1970 * _1912;
    int _1996 = _1994 + _1966;
    float _1998 = -_1588;
    float _2000 = _1998 + 1.0;
    float _2002 = as_type<float>(_1916);
    if (_1862)
    {
        _2002 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2004 = _2002;
    float _2006 = -_1584;
    float _2008 = _2006 + 1.0;
    float _2010 = fma(_1112, _1990, _1544);
    float _2012 = -_2000;
    float _2014 = fma(_1142, _2012, _1888);
    float _2016 = -_369;
    float _2018 = fma(_1092, _2016, _1534);
    float _2020 = fma(_1208, _2008, _1904);
    int _2022 = as_type<int>(_2004);
    if (_1862)
    {
        float _2024 = _2004 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    float _2028 = float(_1986);
    if (_1982)
    {
        float _2030 = _1858 * _1890;
        _149 = _2030;
    }
    float _2032 = _149;
    float _2034 = float(_1996);
    out.m_68.x = _2018;
    out.m_68.y = _2010;
    out.m_68.z = _2014;
    out.m_68.w = _2020;
    float _2036 = fma(_1452, _1788, _1452);
    float _2038 = _1602 * _1992;
    float _2040 = _1612 * _1992;
    if (_1862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6067 = as_type<float>(_2026);
        out.gl_Position.z = _6067;
    }
    out.m_70.x = _2028;
    out.m_70.y = _2034;
    if (_1862)
    {
        return out;
    }
    float _2042 = -_2038;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1524);
    float _2046 = _131 + (-0.5);
    float _2048 = _1686 * _1992;
    float _2050 = -_2040;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1422);
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2044 + _2054;
    float _2058 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1762);
    float _2060 = -_2048;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1550);
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2052 + _2064;
    float _2068 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2070 = _339 + (-0.5);
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2074 = _2062 + _2072;
    float _2076 = -_2038;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1602);
    float _2080 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2068);
    float _2082 = _1668 * (-2.0);
    float _2084 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1940);
    float _2086 = -_2040;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2080);
    float _2092 = _2078 * _2078;
    float _2094 = in.m_58.x;
    float _2096 = in.m_58.y;
    float _2098 = fma(_2082, _1640, _1640);
    float _2100 = _788 + (-0.5);
    bool _2102 = _2090 >= 0.0;
    float _2104 = fma(_1792, _2032, _2058);
    float _2106 = fma(_2036, _2032, _2084);
    float _2108 = fma(_2088, _2088, _2092);
    float _2110 = -_2048;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1686);
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2098);
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2120;
    float _2124 = _2104 * 0.15915493667125701904296875;
    float _2126 = _2106 * 0.15915493667125701904296875;
    float _2128 = fma(_2112, _2112, _2108);
    float _2130 = fma(_2118, _1394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2134 = _2062;
    float _2136 = _2044;
    float _2138 = _2052;
    if (_2102)
    {
        _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2140 = _2132;
    float _2142 = fma(_2122, _1394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2144 = _2124 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_2130, _1508, _1554);
    float _2150 = fma(_1396, _2082, _1396);
    int _2152 = as_type<int>(_2140);
    if (_2102)
    {
        float _2154 = _2140 * 5.0;
        _2152 = as_type<int>(_2154);
    }
    int _2156 = _2152;
    float _2158 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2148);
    float _2160 = fma(_2150, _2032, _2114);
    if (_2102)
    {
        out.m_47.x = 0.0;
    }
    float _2162 = _2124 * 6.283185482025146484375;
    float _2164 = cos(_2162);
    float _2166 = fma(_1492, _1522, _1546);
    float _2168 = _2158 * _2096;
    if (_2102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6300 = as_type<float>(_2156);
        out.gl_Position.z = _6300;
    }
    float _2170 = _2160 * 0.15915493667125701904296875;
    float _2172 = _2126 * 6.283185482025146484375;
    float _2174 = sin(_2172);
    float _2176 = sqrt(_2128);
    float _2178 = _2126 * 6.283185482025146484375;
    float _2180 = cos(_2178);
    if (_2102)
    {
        return out;
    }
    float _2182 = fma(_2142, _1508, _2166);
    float _2184 = _2170 * 6.283185482025146484375;
    float _2186 = cos(_2184);
    float _2188 = _1992 * _2176;
    float _2190 = _2168 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2182);
    float _2194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2196 = _2146 * _2174;
    float _2198 = _2188 * _2190;
    float _2200 = _2192 * _2094;
    float _2202 = _2170 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = _2164 * _2174;
    float _2208 = _2194 * _2198;
    float _2210 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _2214 = _2164 * _2180;
    float _2216 = _2146 * _2180;
    float _2218 = _2188 * _2210;
    float _2220 = _2164 * _2186;
    float _2222 = _2146 * _2186;
    float _2224 = _2174 * _2186;
    float _2226 = _2212 * _2218;
    float _2228 = _2220 * _2208;
    float _2230 = _2180 * _2186;
    float _2232 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2234 = _2232 * 0.5;
    float _2236 = _2222 * _2208;
    float _2238 = fma(_2204, _2214, _2196);
    float _2240 = -_2216;
    float _2242 = fma(_2204, _2206, _2240);
    float _2244 = -_2208;
    float _2246 = _2204 * _2244;
    float _2248 = -_2206;
    float _2250 = fma(_2204, _2216, _2248);
    float _2252 = fma(_2238, _2226, _2228);
    float _2254 = fma(_2204, _2196, _2214);
    float _2256 = fma(_2230, _2226, _2246);
    float _2258 = fma(_2250, _2226, _2236);
    float _2260 = fma(_2242, _2234, _2252);
    float _2262 = fma(_2224, _2234, _2256);
    float _2264 = fma(_2254, _2234, _2258);
    float _2266 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2270 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2272 = isnan(0.5);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2278 = _2274 || _2276;
    float _2280 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2282 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2284 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2286 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    float _2288 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2290 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2292 = _1550 + _2288;
    float _2294 = _1422 + _2290;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2298 = _2292 + _2296;
    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2302 = _2294 + _2300;
    float _2304 = _2298 * _2298;
    float _2306 = fma(_2302, _2302, _2304);
    float _2308 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2310 = sqrt(_2306);
    float _2312 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2308);
    float _2314 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2318 = _1524 + _2316;
    bool _2320 = _2310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2322 = _2316;
    float _2324 = _2308;
    float _2326 = _2292;
    float _2328 = _2210;
    float _2330 = _2318;
    if (!_2320)
    {
        _2322 = _2294;
    }
    float _2332 = _2322;
    float _2334 = _2332;
    if (!_2320)
    {
        _2324 = _2318;
    }
    float _2336 = _2324;
    bool _2338 = !_2320;
    float _2340 = _2336;
    if (!_2338)
    {
        float _2342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2346 = _2310 + _2344;
        float _2348 = rsqrt(_2306);
        float _2350 = _2346 * _2342;
        float _2352 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2354 = _2350 * 0.15915493667125701904296875;
        float _2356 = _2354 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354 * 6.283185482025146484375;
        float _2362 = cos(_2360);
        float _2364 = fma(_2358, _2352, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2366 = _2348 * _2364;
        float _2368 = _2362 + (-1.0);
        float _2370 = fma(_2302, _2366, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2372 = fma(_2298, _2366, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2374 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2376 = fma(_2318, _2362, _2374);
        _2334 = _2370;
        _2340 = _2376;
        _2326 = _2372;
        _2328 = _2354;
    }
    float _2378 = _2334;
    float _2380 = _2340;
    float _2382 = _2326;
    float _2384 = _2328;
    float _2386 = -_2040;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2378);
    float _2390 = -_2038;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2380);
    float _2394 = -_2048;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2382);
    float _2398 = _2392;
    float _2400 = _2388;
    float _2402 = _2396;
    float _2404 = _2384;
    if (!_2278)
    {
        float _2406 = _2056 * _2056;
        float _2408 = 1.0 / _2188;
        float _2410 = -_1550;
        float _2412 = _2410 + _2382;
        float _2414 = -_1422;
        float _2416 = _2414 + _2378;
        float _2418 = fma(_2066, _2066, _2406);
        float _2420 = -_1524;
        float _2422 = _2420 + _2380;
        float _2424 = fma(_2074, _2074, _2418);
        float _2426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2428 = sqrt(_2424);
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2432 = precise::min(_2428, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2434 = _2432 * _2426;
        float _2436 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2438 = _2434 * _2408;
        float _2440 = _2412 * _2438;
        float _2442 = _2436 * _2438;
        float _2444 = fma(_2436, _2440, _2062);
        float _2446 = fma(_2416, _2442, _2052);
        float _2448 = fma(_2422, _2442, _2044);
        _2398 = _2448;
        _2400 = _2446;
        _2402 = _2444;
    }
    float _2450 = _2398;
    float _2452 = _2400;
    float _2454 = _2402;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2458 = _2450 + _2456;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2462 = _2452 + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2466 = _2454 + _2464;
    float _2468 = _2458 * _2458;
    float _2470 = fma(_2462, _2462, _2468);
    float _2472 = fma(_2466, _2466, _2470);
    float _2474 = rsqrt(_2472);
    float _2476 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2478 = _2462 * _2476;
    float _2480 = _2466 * _2476;
    float _2482 = _2478 * _2478;
    float _2484 = _2480 * _2480;
    float _2486 = _2482 + _2484;
    float _2488 = sqrt(_2486);
    bool _2490 = _2488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2494 = _2488 + _2492;
    float _2496 = _2466;
    float _2498 = _2474;
    float _2500 = _2494;
    float _2502 = _2458;
    if (_2490)
    {
        float _2504 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2496 = _2504;
    }
    float _2506 = _2496;
    if (_2490)
    {
        float _2508 = rsqrt(_2486);
        _2498 = _2508;
    }
    float _2510 = _2498;
    float _2512 = _2510;
    if (_2490)
    {
        float _2514 = _2494 * _2506;
        _2500 = _2514;
    }
    float _2516 = _2500;
    if (_2490)
    {
        float _2518 = _2516 * 0.15915493667125701904296875;
        _2134 = _2518;
    }
    float _2520 = _2134;
    float _2522 = _2506;
    float _2524 = _2520;
    if (_2490)
    {
        float _2526 = _2520 * 6.283185482025146484375;
        float _2528 = sin(_2526);
        _2522 = _2528;
    }
    float _2530 = _2522;
    float _2532 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2534 = precise::max(0.0, _2532);
    float _2536 = _2468;
    float _2538 = _2534;
    if (_2490)
    {
        float _2540 = _2520 * 6.283185482025146484375;
        float _2542 = cos(_2540);
        _2536 = _2542;
    }
    float _2544 = _2536;
    float _2546 = -_2476;
    float _2548 = -_2534;
    float _2550 = fma(_2458, _2546, _2548);
    if (_2490)
    {
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2538 = _2552;
    }
    float _2554 = _2538;
    float _2556 = _2554;
    if (!_2490)
    {
        _2524 = _2482;
    }
    float _2558 = _2524;
    float _2560 = _2558;
    if (_2490)
    {
        float _2562 = fma(_2530, _2554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2502 = _2562;
    }
    float _2564 = _2502;
    float _2566 = sqrt(_2472);
    float _2568 = _2564;
    float _2570 = _2544;
    if (_2490)
    {
        float _2572 = _2544 + (-1.0);
        _2556 = _2572;
    }
    float _2574 = _2556;
    float _2576 = _2574;
    if (_2490)
    {
        float _2578 = _2510 * _2564;
        _2330 = _2578;
    }
    float _2580 = _2330;
    if (!_2490)
    {
        _2512 = _2478;
    }
    float _2582 = _2512;
    float _2584 = _2582;
    if (_2490)
    {
        float _2586 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2404 = _2586;
    }
    float _2588 = _2404;
    if (_2490)
    {
        float _2590 = _2478 * _2580;
        _2584 = _2590;
    }
    float _2592 = _2584;
    if (!_2490)
    {
        _2568 = _2550;
    }
    float _2594 = _2568;
    float _2596 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2598 = _2594;
    if (!_2490)
    {
        _2576 = _2480;
    }
    float _2600 = _2576;
    float _2602 = _2600;
    if (_2490)
    {
        float _2604 = fma(_2550, _2544, _2588);
        _2598 = _2604;
    }
    float _2606 = _2598;
    if (_2490)
    {
        float _2608 = _2480 * _2580;
        _2602 = _2608;
    }
    float _2610 = _2602;
    if (_2490)
    {
        float _2612 = _2592 * _2592;
        _2560 = _2612;
    }
    float _2614 = _2560;
    if (!_2490)
    {
        _2570 = _2484;
    }
    float _2616 = _2570;
    float _2618 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2620 = _2616;
    if (_2490)
    {
        float _2622 = _2610 * _2610;
        _2620 = _2622;
    }
    float _2624 = _2620;
    float _2626 = fma(_2606, _2606, _2614);
    float _2628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2630 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2618);
    float _2632 = _2626 + _2624;
    float _2634 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2596);
    float _2636 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2640 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2638);
    float _2642 = precise::clamp(_2640, 0.0, 1.0);
    float _2644 = rsqrt(_2632);
    float _2646 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2634);
    float _2648 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2650 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2636);
    float _2652 = -_2642;
    float _2654 = _2652 + 1.0;
    float _2656 = _2646 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2658 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2648);
    float _2660 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2650);
    float _2662 = abs(_2654);
    float _2664 = log2(_2662);
    float _2666 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2668 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2658);
    float _2670 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2672 = -_2666;
    float _2674 = fma(_2672, _2628, 1.0);
    float _2676 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2678 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2630);
    float _2680 = _2644 * _2592;
    float _2682 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2684 = _2644 * _2610;
    float _2686 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2688 = log2(_2674);
    float _2690 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2682);
    float _2692 = _2644 * _2606;
    float _2694 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2698 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2690);
    float _2700 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2702 = -_2694;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2698);
    float _2708 = exp2(_2696);
    float _2710 = -_2684;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2714 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2716 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2700);
    float _2718 = fma(_2712, -0.5, 0.5);
    float _2720 = fma(_2712, 0.5, 0.5);
    float _2722 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2714);
    float _2724 = 1.0 / _2706;
    float _2726 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2716);
    float _2728 = fma(_2720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2730 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2732 = _2692 + 1.0;
    float _2734 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2726);
    float _2736 = fma(_2720, _2728, -0.212114393711090087890625);
    float _2738 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2730);
    float _2740 = sqrt(_2718);
    float _2742 = -_2692;
    float _2744 = fma(_2708, _2732, _2742);
    float _2746 = _2688 * 0.693147182464599609375;
    float _2748 = fma(_2720, _2736, 1.570728778839111328125);
    float _2750 = fma(_2744, 0.5, 0.5);
    float _2752 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2754 = _2738 * _2724;
    float _2756 = _2734 * _2724;
    float _2758 = fma(_2754, 0.5, 0.5);
    float _2760 = fma(_2756, -0.5, 0.5);
    float _2762 = _2740 * 0.636619746685028076171875;
    float3 _7270 = float3(_2758, _2760, _2752);
    float _2764 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7270, float3(0.0), isnan(_7270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7270, float3(0.0), isnan(_7270)), level(0.0)).x;
    float3 _7281 = float3(_2758, _2760, _2752);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7281, float3(0.0), isnan(_7281)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7281, float3(0.0), isnan(_7281)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float _2777 = -_2748;
    float _2779 = fma(_2762, _2777, 1.0);
    float2 _7303 = float2(_2779, _2750);
    float3 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7303, float2(0.0), isnan(_7303)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7303, float2(0.0), isnan(_7303)), level(0.0)).xyz;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2793 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2795 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2799 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2801 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2791);
    float _2803 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2793);
    float _2805 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    float _2807 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2809 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2811 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2813 = -_2204;
    float _2815 = fma(_2813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2797);
    float _2817 = -_2204;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2799);
    float _2821 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2823 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2825 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2809);
    float _2827 = fma(_2811, _2811, 1.0);
    float _2829 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2831 = -_2204;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    float _2835 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2821);
    float _2837 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2823);
    float _2839 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2815);
    float _2841 = rsqrt(_2827);
    float _2843 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2819);
    float _2845 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    float _2847 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2801);
    float _2849 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2803);
    float _2851 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2805);
    float _2853 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2825);
    float _2855 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2835);
    float _2857 = exp2(_2829);
    float _2859 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2837);
    float _2861 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2863 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2865 = _2811 * _2839;
    float _2867 = _2811 * _2843;
    float _2869 = _2811 * _2845;
    float _2871 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2861);
    float _2873 = _2811 * _2841;
    out.m_72.x = _2847;
    out.m_72.y = _2849;
    out.m_72.z = _2851;
    float _2875 = fma(_2863, _2847, _2865);
    float _2877 = fma(_2863, _2849, _2867);
    float _2879 = fma(_2863, _2851, _2869);
    float _2881 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2871);
    float _2883 = _2738 + _2706;
    float _2885 = -_2857;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2881);
    float _2891 = _2883 * 0.5;
    float _2893 = _2855 + _2877;
    float _2895 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2897 = -_2853;
    float _2899 = _2873 * _2897;
    float _2901 = -_2855;
    float _2903 = _2873 * _2901;
    float _2905 = -_2859;
    float _2907 = _2873 * _2905;
    float _2909 = _2706 * 0.5;
    float _2911 = fma(_2841, _2839, _2899);
    float _2913 = fma(_2841, _2843, _2903);
    float _2915 = fma(_2841, _2845, _2907);
    float _2917 = _2889 + _2706;
    float _2919 = fma(_2734, -0.5, _2909);
    float _2921 = _2853 + _2875;
    float _2923 = _2859 + _2879;
    out.m_74.x = _2911;
    out.m_74.y = _2913;
    out.m_74.z = _2915;
    float _2925 = _2917 * 0.5;
    bool _2927 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2929 = isnan(_2566);
    bool _2931 = _2927 || _2929;
    bool _2933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2935 = _2931 || _2933;
    out.m_76.x = _2921;
    out.m_76.y = _2893;
    out.m_76.z = _2923;
    out.m_78.x = _2891;
    out.m_78.y = _2919;
    out.m_78.z = _2925;
    out.m_78.w = _2706;
    float _2937 = -_2895;
    float _2939 = _2937 + 1.0;
    out.m_80.x = _2452;
    out.m_80.y = _2450;
    out.m_80.z = _2454;
    out.m_82.x = _2052;
    out.m_82.y = _2044;
    out.gl_Position.x = _2738;
    out.gl_Position.y = _2734;
    out.gl_Position.z = _2889;
    out.gl_Position.w = _2706;
    float _2941 = _2734;
    float _2943 = _2738;
    if (!_2935)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2945 = _2136;
    float _2947 = _2945;
    float _2949 = _2945;
    if (!_2935)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2951 = _2138;
    float _2953 = _2951;
    float _2955 = _2951;
    if (!_2935)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2957 = _2941;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2935)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2963 = _2943;
    float _2965 = _2895 * _2764;
    float _2967 = _2775 * _2939;
    float _2969 = _2775 * _2965;
    float _2971 = _2789 * _2965;
    float _2973 = fma(_2785, _2969, _2769);
    float _2975 = fma(_2787, _2969, _2771);
    float _2977 = fma(_2775, _2971, _2773);
    float _2979 = _2775;
    float _2981 = _2773;
    float _2983 = _2963;
    float _2985 = _2963;
    if (!_2935)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2987 = _2979;
    float _2989 = _2987;
    float _2991 = _2987;
    if (!_2935)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2993 = _2981;
    out.m_84.x = _2973;
    out.m_84.y = _2975;
    out.m_84.z = _2977;
    out.m_84.w = _2967;
    bool _2995 = !_2935;
    float _2997 = _2993;
    float _2999 = _2993;
    if (!_2995)
    {
        bool _3001 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3003 = isnan(_2566);
        bool _3005 = _3001 || _3003;
        bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3009 = _3005 || _3007;
        if (!_3009)
        {
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3013 = _2566 + _3011;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3017 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3015;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3023 = 1.0 / _3017;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3041 = _3013 * _3023;
            float _3043 = precise::clamp(_3041, 0.0, 1.0);
            float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3049 = fma(_3043, _3021, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3051 = fma(_3043, _3047, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3053 = fma(_3043, _3027, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3055 = fma(_3043, _3031, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3057 = fma(_3043, _3035, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3059 = fma(_3043, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2985 = _3053;
            _2949 = _3057;
            _2961 = _3049;
            _2999 = _3055;
            _2991 = _3051;
            _2955 = _3059;
            _3061 = true;
        }
        else
        {
            bool _3063 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3065 = isnan(_2566);
            bool _3067 = _3063 || _3065;
            bool _3069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3071 = _3067 || _3069;
            if (!_3071)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3073 = _2959;
            _2961 = _3073;
            if (!_3071)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3075 = _2983;
            _2985 = _3075;
            if (!_3071)
            {
                _2989 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3077 = _2989;
            _2991 = _3077;
            if (!_3071)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3079 = _2997;
            _2999 = _3079;
            if (!_3071)
            {
                _2947 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3081 = _2947;
            _2949 = _3081;
            if (!_3071)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3083 = _2953;
            bool _3085 = !_3071;
            _2955 = _3083;
            if (!_3085)
            {
                bool _3087 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3089 = isnan(_2566);
                bool _3091 = _3087 || _3089;
                bool _3093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3095 = _3091 || _3093;
                if (!_3095)
                {
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3099 = _2566 + _3097;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3103 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3101;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3109 = 1.0 / _3103;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3127 = _3099 * _3109;
                    float _3129 = precise::clamp(_3127, 0.0, 1.0);
                    float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3135 = fma(_3129, _3107, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3137 = fma(_3129, _3133, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3139 = fma(_3129, _3113, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3141 = fma(_3129, _3117, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3143 = fma(_3129, _3121, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3145 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2985 = _3139;
                    _2949 = _3143;
                    _2961 = _3135;
                    _2999 = _3141;
                    _2991 = _3137;
                    _2955 = _3145;
                    _3061 = true;
                }
                else
                {
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2949 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2991 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3061 = false;
    float _3147 = _2985;
    float _3149 = _2949;
    float _3151 = _2961;
    float _3153 = _2999;
    float _3155 = _2991;
    float _3157 = _2955;
    float _3159 = fma(_2893, -0.5, 0.5);
    float _3161 = precise::clamp(_3159, 0.0, 1.0);
    float _3163 = -_3147;
    float _3165 = _3163 + _3149;
    float _3167 = -_3151;
    float _3169 = _3167 + _3153;
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    bool _3175 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3177 = fma(_3161, _3165, _3147);
    float _3179 = fma(_3161, _3169, _3151);
    float _3181 = fma(_3161, _3173, _3155);
    float _3183 = _3177 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3185 = fma(_3179, 0.298911988735198974609375, _3183);
    float _3187 = fma(_3181, 0.114477999508380889892578125, _3185);
    out.m_86.x = 0.0;
    float _3189 = -_3187;
    float _3191 = _3179 + _3189;
    float _3193 = -_3187;
    float _3195 = _3177 + _3193;
    float _3197 = -_3187;
    float _3199 = _3181 + _3197;
    float _3201 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3203 = fma(_3191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3205 = fma(_3195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3207 = fma(_3199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    out.m_88.w = _3201;
    out.m_90.x = _3203;
    out.m_90.y = _3205;
    out.m_90.z = _3207;
    if (!_3175)
    {
        return out;
    }
    float _3209 = -_2450;
    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3213 = -_2452;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3217 = -_2454;
    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3221 = _3211 * _3211;
    float _3223 = fma(_3215, _3215, _3221);
    float _3225 = fma(_3219, _3219, _3223);
    float _3227 = sqrt(_3225);
    float _3229 = rsqrt(_3225);
    float _3231 = -_3227;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3235 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3237 = precise::clamp(_3235, 0.0, 1.0);
    float _3239 = _3215 * _3229;
    float _3241 = _3211 * _3229;
    float _3243 = abs(_3237);
    float _3245 = log2(_3243);
    float _3247 = _3219 * _3229;
    float _3249 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3251 = _2893 * _3241;
    float _3253 = -_3241;
    float _3255 = -_3249;
    float _3257 = fma(_3253, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3255);
    float _3259 = fma(_2921, _3239, _3251);
    float _3261 = -_3247;
    float _3263 = fma(_3261, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3257);
    float _3265 = fma(_2923, _3247, _3259);
    float _3267 = precise::clamp(_3265, 0.0, 1.0);
    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3271 = _3263 + _3269;
    float _3273 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3275 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = exp2(_3273);
    float _3281 = _3279 * _3277;
    float _3283 = _3267 * _3281;
    float _3285 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3287 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3289 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3285;
    out.m_86.y = _3287;
    out.m_86.z = _3289;
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
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3061 = false;
    bool _325 = false;
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
        float _3346 = as_type<float>(_125);
        out.gl_Position.z = _3346;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _147 = 0.0;
    float _149 = _145;
    if (_141)
    {
        float _151 = float(_109);
        _147 = _151;
    }
    float _153 = _147;
    bool _155 = _145 >= _153;
    bool _157 = !_141;
    bool _159 = _155 || _157;
    if (_159)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _119;
    if (_159)
    {
        out.m_47.x = 0.0;
    }
    if (_159)
    {
        float _163 = _161 * 5.0;
        _127 = as_type<int>(_163);
    }
    int _165 = _127;
    if (_159)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3419 = as_type<float>(_165);
        out.gl_Position.z = _3419;
    }
    if (_159)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_58.w;
    bool _171 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _173 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _175 = _171 || _173;
    bool _177 = isnan(1.0);
    bool _179 = _175 || _177;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = in.m_44.x;
    float _189 = in.m_44.y;
    float _191 = in.m_44.z;
    int _193 = as_type<int>(_167) & 1;
    bool _195 = _193 != 0;
    int _197 = as_type<int>(_167) & 2;
    bool _199 = _197 != 0;
    float _201 = _145 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _203 = 0.0;
    float _205 = _201;
    if (!_179)
    {
        float _207 = _201 * _201;
        float _209 = _207 * 0.5;
        _203 = _209;
    }
    float _211 = _203;
    bool _213 = !_195;
    float _215 = _213 ? (-0.5) : 0.5;
    bool _217 = !_199;
    float _219 = _217 ? (-0.5) : 0.5;
    float _221 = _211;
    if (!_179)
    {
        float _223 = _211 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _221 = _223;
    }
    float _225 = _221;
    bool _227 = !_179;
    float _229 = _225;
    if (!_227)
    {
        float _231 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _233 = log2(_231);
        float _235 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _237 = _235 + 1.0;
        float _239 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = _201 * _233;
        float _243 = 1.0 / _237;
        float _245 = _239 * 0.693147182464599609375;
        float _247 = exp2(_241);
        float _249 = 1.0 / _245;
        float _251 = _247 + (-1.0);
        float _253 = -_251;
        float _255 = fma(_253, _249, _201);
        float _257 = _255 * _243;
        float _259 = _257 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _229 = _259;
    }
    float _261 = _229;
    bool _263 = !_179;
    if (!_263)
    {
        float _265 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _267 = log2(_265);
        float _269 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _271 = _269 + 1.0;
        float _273 = 1.0 / _271;
        float _275 = _201 * _267;
        float _277 = exp2(_275);
        float _279 = -_277;
        float _281 = _279 + 1.0;
        float _283 = _281 * _273;
        _205 = _283;
    }
    float _285 = _205;
    bool _287 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _289 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _291 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _293 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _295 = fma(_285, _181, _289);
    float _297 = fma(_285, _183, _291);
    float _299 = fma(_285, _185, _293);
    float _301 = fma(_295, _169, _187);
    float _303 = fma(_297, _169, _189);
    float _305 = fma(_299, _169, _191);
    bool _307 = !_287;
    float _323;
    if (!_307)
    {
        float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _311 = _131 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _313 = fma(_311, (*spvDescriptorSet0.vp_c9)._m0[12].x, _145);
        float _315 = _313 * _309;
        float _317 = floor(_315);
        float _319 = -_317;
        float _321 = _315 + _319;
        _323 = _321;
        _325 = true;
    }
    else
    {
        float _327 = float(_109);
        float _329 = 1.0 / _327;
        float _331 = _145 * _329;
        _323 = _331;
    }
    _325 = false;
    float _333 = _323;
    float _335 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _337 = int(_335);
    float _339 = in.m_51.y;
    float _341 = float(_109);
    float _343 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _345 = _333 + _343;
    float _347 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _349 = int(_347);
    float _351 = float(_337);
    float _353 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _355 = int(_353);
    float _357 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _359 = fma(_131, (*spvDescriptorSet0.vp_c9)._m0[78].z, _357);
    float _361 = float(_349);
    float _363 = 1.0 / _351;
    float _365 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].z, _359);
    float _367 = -_365;
    float _369 = _367 + 1.0;
    float _371 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _373 = int(_371);
    float _375 = float(uint(_355));
    bool _377 = _355 == 0;
    int _379 = ~_355;
    int _381 = _379 + 1;
    float _383 = 1.0 / _361;
    float _385 = _363 * _145;
    float _387 = 1.0 / _375;
    float _389 = float(uint(_373));
    int _391 = ~_373;
    int _393 = _391 + 1;
    int _395 = ~_373;
    int _397 = _395 + 1;
    float _399 = trunc(_385);
    int _401 = int(_399);
    float _403 = _383 * _145;
    int _405 = ~_355;
    int _407 = _405 + 1;
    float _409 = 1.0 / _389;
    int _411 = as_type<int>(_387) + (-2);
    float _413 = trunc(_403);
    int _415 = int(_413);
    float _417 = float(uint(_401));
    float _419 = float(_401);
    float _421 = as_type<float>(_411) * _417;
    int _423 = as_type<int>(_409) + (-2);
    float _425 = 1.0 / _341;
    float _427 = float(uint(_415));
    float _429 = trunc(_421);
    float _431 = precise::max(_429, 0.0);
    uint _434 = uint(_431);
    float _436 = as_type<float>(_423) * _427;
    float _438 = trunc(_436);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    int _444 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _446 = _444 != 0;
    float _448 = _425 * _145;
    int _450 = _407 * int(_434);
    int _452 = _450 + _401;
    float _454 = float(uint(_452));
    float _456 = _436;
    float _458 = _454;
    int _460 = _423;
    if (_446)
    {
        _456 = 1.0;
    }
    float _462 = _456;
    int _464 = _393 * int(_442);
    int _466 = _464 + _415;
    float _468 = _462;
    float _470 = as_type<float>(_466);
    if (!_446)
    {
        _468 = 7.345489978790283203125;
    }
    float _472 = _468;
    float _474 = as_type<float>(_411) * _454;
    if (_446)
    {
        _458 = 1.0;
    }
    float _476 = _458;
    float _478 = float(uint(_466));
    float _480 = trunc(_474);
    float _482 = precise::max(_480, 0.0);
    uint _484 = uint(_482);
    float _486 = _476;
    if (_446)
    {
        _470 = _131;
    }
    float _488 = _470;
    float _490 = _472 * _131;
    float _492 = _488;
    if (!_446)
    {
        _486 = 1.2345600128173828125;
    }
    float _494 = _486;
    float _496 = as_type<float>(_423) * _478;
    if (!_446)
    {
        _492 = _339;
    }
    float _498 = _492;
    float _500 = floor(_490);
    float _502 = _494 * _498;
    int _504 = ~_355;
    int _506 = _504 + 1;
    float _508 = trunc(_496);
    float _510 = precise::max(_508, 0.0);
    uint _512 = uint(_510);
    int _514 = int(_434) + int(_484);
    int _516 = ~_373;
    int _518 = _516 + 1;
    float _520 = floor(_502);
    int _522 = _506 * _514;
    int _524 = _522 + _401;
    float _526 = -_500;
    float _528 = _490 + _526;
    bool _530 = uint(_524) >= uint(_355);
    int _532 = int(_442) + int(_512);
    float _534 = float(_355);
    float _536 = float(_373);
    int _538 = _518 * _532;
    int _540 = _538 + _415;
    float _542 = -_520;
    float _544 = _502 + _542;
    bool _546 = _419 >= _534;
    bool _548 = isnan(_419);
    bool _550 = _546 || _548;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = _528 * _534;
    bool _560 = !_530;
    int _562 = _560 ? 0 : (-1);
    float _564 = _534 * _448;
    bool _566 = uint(_540) >= uint(_373);
    float _568 = trunc(_556);
    int _570 = int(_568);
    int _572 = ~_514;
    int _574 = _572 + _562;
    int _576 = _574 + 1;
    float _578 = float(_415);
    int _580 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _582 = _580 != 0;
    int _584 = _355 * _576;
    int _586 = _584 + _401;
    bool _588 = _578 >= _536;
    bool _590 = isnan(_578);
    bool _592 = _588 || _590;
    bool _594 = isnan(_536);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    float _600 = trunc(_558);
    int _602 = int(_600);
    bool _604 = !_582;
    int _606 = _604 ? 0 : 1;
    float _608 = _536 * _448;
    bool _610 = !_566;
    int _612 = _610 ? 0 : (-1);
    float _614 = _544 * _536;
    int _616 = abs(_606);
    bool _618 = !_377;
    int _620 = _618 ? _586 : (-1);
    float _622 = trunc(_598);
    int _624 = int(_622);
    int _626 = ~_570;
    int _628 = _626 + 1;
    int _630 = _628 + 1;
    int _632 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _634 = _632 != 0;
    int _636 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _638 = _636 != 0;
    int _640 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _642 = _640 != 0;
    int _644 = ~_532;
    int _646 = _644 + _612;
    int _648 = _646 + 1;
    int _650 = _355 + (-1);
    int _652 = _602 * _616;
    int _654 = _652 + _401;
    float _656 = trunc(_564);
    int _658 = int(_656);
    int _660 = _620 * _630;
    bool _662 = !_638;
    int _664 = _662 ? 0 : 1;
    int _666 = _373 * _648;
    int _668 = _666 + _415;
    bool _670 = _373 == 0;
    int _672 = _570 * _650;
    int _674 = _672 + _660;
    int _676 = abs(_664);
    int _678 = ~_624;
    int _680 = _678 + 1;
    int _682 = _680 + 1;
    float _684 = trunc(_614);
    int _686 = int(_684);
    bool _688 = !_670;
    int _690 = _688 ? _668 : (-1);
    int _692 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _694 = _692 != 0;
    int _696 = _690 * _682;
    bool _698 = !_634;
    int _700 = _698 ? 0 : 1;
    float _702 = trunc(_608);
    int _704 = int(_702);
    bool _706 = !_694;
    int _708 = _706 ? 0 : 1;
    int _710 = _674 * _676;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _714 = _712 != 0;
    int _716 = abs(_700);
    int _718 = abs(_708);
    bool _720 = !_642;
    int _722 = _720 ? 0 : 1;
    int _724 = _658 * _716;
    int _726 = _724 + _710;
    int _728 = _373 + (-1);
    int _730 = _686 * _718;
    int _732 = _730 + _415;
    bool _734 = !_714;
    int _736 = _734 ? 0 : 1;
    int _738 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _740 = _738 != 0;
    int _742 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _744 = _742 != 0;
    int _746 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _748 = _746 != 0;
    int _750 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _752 = _750 != 0;
    int _754 = _624 * _728;
    int _756 = _754 + _696;
    int _758 = abs(_722);
    int _760 = abs(_736);
    bool _762 = !_744;
    int _764 = _762 ? 0 : 1;
    int _766 = abs(_764);
    int _768 = _654 * _758;
    int _770 = _768 + _726;
    bool _772 = !_740;
    int _774 = _772 ? 0 : 1;
    int _776 = _602 * _760;
    int _778 = _776 + _770;
    bool _780 = !_752;
    int _782 = _780 ? 0 : 1;
    int _784 = _756 * _766;
    int _786 = abs(_774);
    float _788 = in.m_51.z;
    int _790 = abs(_782);
    bool _792 = !_748;
    int _794 = _792 ? 0 : 1;
    int _796 = _704 * _786;
    int _798 = _796 + _784;
    float _800 = float(uint(_778));
    int _802 = abs(_794);
    int _804 = ~_355;
    int _806 = _804 + 1;
    float _808 = as_type<float>(_411) * _800;
    bool _810 = _355 == 0;
    int _812 = _732 * _802;
    int _814 = _812 + _798;
    float _816 = trunc(_808);
    float _818 = precise::max(_816, 0.0);
    uint _820 = uint(_818);
    int _822 = _686 * _790;
    int _824 = _822 + _814;
    int _826 = ~_355;
    int _828 = _826 + 1;
    int _830 = ~_373;
    int _832 = _830 + 1;
    float _834 = float(uint(_824));
    float _836 = as_type<float>(_423) * _834;
    int _838 = _828 * int(_820);
    int _840 = _838 + _778;
    float _842 = trunc(_836);
    float _844 = precise::max(_842, 0.0);
    uint _846 = uint(_844);
    float _848 = float(uint(_840));
    float _850 = as_type<float>(_411) * _848;
    float _852 = trunc(_850);
    float _854 = precise::max(_852, 0.0);
    uint _856 = uint(_854);
    int _858 = _832 * int(_846);
    int _860 = _858 + _824;
    float _862 = float(uint(_860));
    int _864 = ~_373;
    int _866 = _864 + 1;
    float _868 = as_type<float>(_423) * _862;
    int _870 = int(_820) + int(_856);
    float _872 = trunc(_868);
    float _874 = precise::max(_872, 0.0);
    uint _876 = uint(_874);
    int _878 = _806 * _870;
    int _880 = _878 + _778;
    bool _882 = uint(_880) >= uint(_355);
    bool _884 = !_882;
    int _886 = _884 ? 0 : (-1);
    int _888 = ~_870;
    int _890 = _888 + _886;
    int _892 = _890 + 1;
    int _894 = int(_846) + int(_876);
    int _896 = _355 * _892;
    int _898 = _896 + _778;
    int _900 = _866 * _894;
    int _902 = _900 + _824;
    bool _904 = !_810;
    int _906 = _904 ? _898 : (-1);
    bool _908 = uint(_902) >= uint(_373);
    int _910 = _906 & 3;
    bool _912 = _910 != 0;
    bool _914 = !_908;
    int _916 = _914 ? 0 : (-1);
    bool _918 = uint(_910) > 1u;
    int _920 = ~_894;
    int _922 = _920 + _916;
    int _924 = _922 + 1;
    int _926 = _906 & 3;
    bool _928 = _926 != 0;
    bool _930 = uint(_910) >= 2u;
    int _932 = _373 * _924;
    int _934 = _932 + _824;
    int _936 = _928 ? 0 : 1;
    int _938 = ~_373;
    int _940 = _938 + 1;
    int _942 = ~_936;
    int _944 = _942 + 1;
    int _946 = _944 + 1;
    int _948 = _946;
    if (!_918)
    {
        int _950 = ~_936;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = float(uint(_654));
    bool _958 = !_670;
    int _960 = _958 ? _934 : (-1);
    int _962 = _930 ? 0 : 1;
    float _964 = as_type<float>(_411) * _956;
    int _966 = _960 & 3;
    bool _968 = _966 != 0;
    float _970 = float(uint(_732));
    float _972 = trunc(_964);
    float _974 = precise::max(_972, 0.0);
    uint _976 = uint(_974);
    int _978 = _960 & 3;
    bool _980 = _978 != 0;
    bool _982 = uint(_966) > 1u;
    float _984 = as_type<float>(_423) * _970;
    int _986 = _980 ? 0 : 1;
    bool _988 = _910 != 3;
    float _990 = trunc(_984);
    float _992 = precise::max(_990, 0.0);
    uint _994 = uint(_992);
    int _996 = ~_986;
    int _998 = _996 + 1;
    int _1000 = _998 + 1;
    int _1002 = ~_355;
    int _1004 = _1002 + 1;
    int _1006 = ~_962;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    int _1012 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1014 = _1012 != 0;
    int _1016 = _1004 * int(_976);
    int _1018 = _1016 + _654;
    int _1020 = _1000;
    int _1022 = _1010;
    if (!_982)
    {
        int _1024 = ~_986;
        int _1026 = _1024 + 1;
        _1020 = _1026;
    }
    int _1028 = _1020;
    float _1030 = in.m_51.w;
    bool _1032 = _966 != 3;
    if (_988)
    {
        int _1034 = ~_962;
        int _1036 = _1034 + 1;
        _1022 = _1036;
    }
    int _1038 = _1022;
    float _1040 = _131 * 2.0;
    bool _1042 = uint(_966) >= 2u;
    int _1044 = _940 * int(_994);
    int _1046 = _1044 + _732;
    float _1048 = float(uint(_1018));
    int _1050 = _1042 ? 0 : 1;
    float _1052 = floor(_1040);
    bool _1054 = _131 > 0.5;
    float _1056 = as_type<float>(_411) * _1048;
    int _1058 = ~_1050;
    int _1060 = _1058 + 1;
    int _1062 = _1060 + 1;
    int _1064 = _1062;
    if (_1032)
    {
        int _1066 = ~_1050;
        int _1068 = _1066 + 1;
        _1064 = _1068;
    }
    int _1070 = _1064;
    float _1072 = _339 * 2.0;
    float _1074 = float(uint(_1046));
    float _1076 = -_215;
    int _1078 = _1054 ? as_type<int>(_1076) : as_type<int>(_215);
    int _1080 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _1082 = _1080 != 0;
    float _1084 = as_type<float>(_423) * _1074;
    bool _1086 = _339 > 0.5;
    float _1088 = floor(_1072);
    bool _1090 = !_1082;
    float _1092 = _1090 ? _215 : as_type<float>(_1078);
    int _1094 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1096 = _1094 != 0;
    float _1098 = -_219;
    int _1100 = _1086 ? as_type<int>(_1098) : as_type<int>(_219);
    bool _1102 = _788 > 0.5;
    float _1104 = trunc(_1056);
    float _1106 = precise::max(_1104, 0.0);
    uint _1108 = uint(_1106);
    bool _1110 = !_1096;
    float _1112 = _1110 ? _219 : as_type<float>(_1100);
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    bool _1118 = _1052 > 0.0;
    float _1120 = -_215;
    int _1122 = _1102 ? as_type<int>(_1120) : as_type<int>(_215);
    float _1124 = trunc(_1084);
    float _1126 = precise::max(_1124, 0.0);
    uint _1128 = uint(_1126);
    bool _1130 = _1052 >= 0.0;
    bool _1132 = isnan(_1052);
    bool _1134 = _1130 || _1132;
    bool _1136 = isnan(0.0);
    bool _1138 = _1134 || _1136;
    bool _1140 = !_1116;
    float _1142 = _1140 ? _215 : as_type<float>(_1122);
    bool _1144 = _1030 > 0.5;
    if (_1014)
    {
        _460 = 0;
    }
    int _1146 = _460;
    int _1148 = int(_976) + int(_1108);
    float _1150 = in.m_60.x;
    float _1152 = in.m_60.y;
    float _1154 = in.m_60.z;
    float _1156 = in.m_60.w;
    int _1158 = _1146;
    if (!_1014)
    {
        _1158 = 1;
    }
    int _1160 = _1158;
    int _1162 = _1138 ? 0 : 1;
    int _1164 = _381 * _1148;
    int _1166 = _1164 + _654;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1170 = _1168 != 0;
    float _1172 = -_219;
    int _1174 = _1144 ? as_type<int>(_1172) : as_type<int>(_219);
    int _1176 = int(_994) + int(_1128);
    int _1178 = ~_1162;
    int _1180 = _1178 + 1;
    int _1182 = _1180 + 1;
    float _1184 = in.m_62.x;
    float _1186 = in.m_62.y;
    float _1188 = in.m_62.z;
    float _1190 = in.m_62.w;
    bool _1192 = _1160 != 1;
    int _1194 = _397 * _1176;
    int _1196 = _1194 + _732;
    int _1198 = _1182;
    if (!_1118)
    {
        int _1200 = ~_1162;
        int _1202 = _1200 + 1;
        _1198 = _1202;
    }
    int _1204 = _1198;
    bool _1206 = !_1170;
    float _1208 = _1206 ? _219 : as_type<float>(_1174);
    bool _1210 = _1088 > 0.0;
    bool _1212 = _1088 >= 0.0;
    bool _1214 = isnan(_1088);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = in.m_64.x;
    float _1224 = in.m_64.y;
    float _1226 = in.m_64.z;
    float _1228 = in.m_64.w;
    float _1230 = _303 * _1152;
    int _1232 = _1220 ? 0 : 1;
    float _1234 = 0.0;
    if (!_1192)
    {
        _1234 = _339;
    }
    float _1236 = _1234;
    float _1238 = fma(_301, _1150, _1230);
    float _1240 = 0.0;
    float _1242 = _1236;
    if (!_1192)
    {
        _1240 = _339;
    }
    float _1244 = _1240;
    float _1246 = 0.0;
    float _1248 = _1244;
    if (!_1192)
    {
        _1246 = _788;
    }
    float _1250 = _1246;
    float _1252 = fma(_305, _1154, _1238);
    float _1254 = 0.0;
    float _1256 = _1250;
    if (!_1192)
    {
        _1254 = _788;
    }
    float _1258 = _1254;
    float _1260 = _1258;
    if (_1192)
    {
        _1242 = _131;
    }
    float _1262 = _1242;
    if (_1192)
    {
        _1248 = _131;
    }
    float _1264 = _1248;
    if (_1192)
    {
        _1256 = _339;
    }
    float _1266 = _1256;
    if (_1192)
    {
        _1260 = _339;
    }
    float _1268 = _1260;
    bool _1270 = uint(_1196) >= uint(_373);
    bool _1272 = uint(_1166) >= uint(_355);
    int _1274 = ~_1232;
    int _1276 = _1274 + 1;
    int _1278 = _1276 + 1;
    bool _1280 = !_1270;
    int _1282 = _1280 ? 0 : (-1);
    int _1284 = _1278;
    if (!_1210)
    {
        int _1286 = ~_1232;
        int _1288 = _1286 + 1;
        _1284 = _1288;
    }
    int _1290 = _1284;
    float _1292 = _303 * _1186;
    bool _1294 = !_1272;
    int _1296 = _1294 ? 0 : (-1);
    int _1298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1300 = _1298 != 0;
    int _1302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1304 = _1302 != 0;
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1308 = _1306 != 0;
    float _1310 = _303 * _1224;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1314 = _1312 != 0;
    float _1316 = _131 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1320 = _1318 != 0;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1324 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _1322;
    float _1326 = fma(_301, _1222, _1310);
    float _1328 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _1330 = _1328 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1332 = 1.0 / _1324;
    float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1336 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _1334;
    float _1338 = fma(_301, _1184, _1292);
    float _1340 = _788 * 2.0;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1344 = fma(_305, _1188, _1338);
    float _1346 = 1.0 / _1336;
    float _1348 = fma(_305, _1226, _1326);
    float _1350 = -_1342;
    float _1352 = fma(_1316, 2.0, _1350);
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _1356 = _333 + _1354;
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1360 = _339 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1362 = 1.0 / _1330;
    float _1364 = _131 + _788;
    float _1366 = fma(_1360, -2.0, _1358);
    float _1368 = -_145;
    float _1370 = fma(_1368, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1352);
    float _1372 = _1364 + (-1.0);
    bool _1374 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1376 = isnan(_333);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1366);
    float _1388 = floor(_1340);
    float _1390 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _1392 = _333 + _1390;
    float _1394 = _1356 * _1346;
    float _1396 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1398 = _1392 * _1332;
    float _1400 = _131 + _339;
    bool _1402 = !_1300;
    int _1404 = _1402 ? 0 : 1;
    float _1406 = _345 * _1362;
    bool _1408 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1410 = isnan(_333);
    bool _1412 = _1408 || _1410;
    bool _1414 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1416 = _1412 || _1414;
    float _1418 = float(_1416);
    float _1420 = _1400 + (-1.0);
    float _1422 = _1348 + _1228;
    float _1424 = fma(_1420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1426 = _788 + _339;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1430 = _1388 >= 0.0;
    bool _1432 = isnan(_1388);
    bool _1434 = _1430 || _1432;
    bool _1436 = isnan(0.0);
    bool _1438 = _1434 || _1436;
    float _1440 = _1426 + (-1.0);
    bool _1442 = !_1304;
    int _1444 = _1442 ? 0 : 1;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1448 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _1446;
    int _1450 = _1438 ? 0 : 1;
    float _1452 = fma(_1440, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _1454;
    bool _1458 = _1388 > 0.0;
    float _1460 = fma(_1448, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _1462 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1464 = isnan(_333);
    bool _1466 = _1462 || _1464;
    bool _1468 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1470 = _1466 || _1468;
    float _1472 = float(_1470);
    float _1474 = fma(_1456, _1398, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _1476 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1478 = _1476 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    bool _1484 = !_1308;
    int _1486 = _1484 ? 0 : 1;
    float _1488 = -_1472;
    float _1490 = _1488 + 1.0;
    float _1492 = fma(_1478, _1406, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _1494 = _333 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1496 = isnan(_333);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = fma(_1482, _1406, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1508 = _1384 * _1490;
    float _1510 = -_1384;
    float _1512 = _1510 + 1.0;
    float _1514 = _1092 + 0.5;
    float _1516 = -_1504;
    float _1518 = _1516 + 1.0;
    int _1520 = abs(_1444);
    float _1522 = _1504 * _1512;
    float _1524 = _1252 + _1156;
    float _1526 = _1418 * _1518;
    float _1528 = -_1418;
    float _1530 = _1528 + 1.0;
    float _1532 = _1112 + (-0.5);
    float _1534 = fma(_1514, (*spvDescriptorSet0.vp_c9)._m0[80].x, _1370);
    float _1536 = _1474 * _1526;
    float _1538 = _1460 * _1526;
    float _1540 = -_1532;
    float _1542 = -_1386;
    float _1544 = fma(_1540, (*spvDescriptorSet0.vp_c9)._m0[80].y, _1542);
    float _1546 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1536);
    float _1548 = fma(_1530, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1538);
    float _1550 = _1344 + _1190;
    float _1552 = fma(_1268, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1428);
    float _1554 = fma(_1506, _1522, _1548);
    float _1556 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1558 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1560 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1562 = fma(_1264, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1556);
    float _1564 = float(_1290);
    float _1566 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1568 = log2(_1566);
    float _1570 = -_1558;
    float _1572 = fma(_1560, 2.0, _1570);
    int _1574 = abs(_1486);
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1578 = -_145;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1572);
    int _1582 = _960 >> 31;
    float _1584 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1552);
    float _1586 = float(_1520);
    float _1588 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1562);
    int _1590 = _906 >> 31;
    int _1592 = _1582 & 3;
    int _1594 = _1590 & 3;
    float _1596 = _1568 * _145;
    int _1598 = _960 + _1592;
    float _1600 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1602 = _1524 + _1600;
    int _1604 = _906 + _1594;
    float _1606 = exp2(_1596);
    float _1608 = float(_1204);
    float _1610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1612 = _1422 + _1610;
    int _1614 = _1604 >> 2;
    float _1616 = _1602 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1618 = _1266 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1620 = _1598 >> 2;
    float _1622 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1616);
    int _1624 = _1614 << 4;
    int _1626 = _1624 + 368;
    float _1628 = fma(_1618, -2.0, _1576);
    float _1630 = float(_1574);
    float _1632 = _1586 * _1608;
    int _1634 = abs(_1404);
    float _1636 = in.m_66.x;
    float _1638 = in.m_66.y;
    float _1640 = in.m_66.z;
    int _1642 = _1620 << 4;
    int _1644 = _1642 + 512;
    uint _1646 = uint(int(uint(_1626) >> uint(2)));
    uint _1648 = uint(int(uint(int(_1646)) >> uint(2)));
    int _1650 = int(_1646) & 3;
    float _1652 = (*spvDescriptorSet0.vp_c9)._m0[int(_1648)][_1650];
    int _1654 = int(_1646) + 1;
    uint _1656 = uint(int(uint(_1654) >> uint(2)));
    int _1658 = _1654 & 3;
    float _1660 = (*spvDescriptorSet0.vp_c9)._m0[int(_1656)][_1658];
    int _1662 = ~_1450;
    int _1664 = _1662 + 1;
    int _1666 = _1664 + 1;
    float _1668 = _1630 * _1564;
    int _1670 = _1666;
    if (!_1458)
    {
        int _1672 = ~_1450;
        int _1674 = _1672 + 1;
        _1670 = _1674;
    }
    int _1676 = _1670;
    float _1678 = -_1606;
    float _1680 = _1678 + 1.0;
    float _1682 = float(_1634);
    float _1684 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1686 = _1550 + _1684;
    float _1688 = float(_1676);
    uint _1690 = uint(int(uint(_1644) >> uint(2)));
    uint _1692 = uint(int(uint(int(_1690)) >> uint(2)));
    int _1694 = int(_1690) & 3;
    float _1696 = (*spvDescriptorSet0.vp_c9)._m0[int(_1692)][_1694];
    int _1698 = int(_1690) + 1;
    uint _1700 = uint(int(uint(_1698) >> uint(2)));
    int _1702 = _1698 & 3;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[int(_1700)][_1702];
    int _1706 = ~_1148;
    int _1708 = _1706 + _1296;
    int _1710 = _1708 + 1;
    float _1712 = fma(_1686, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1622);
    int _1714 = abs(_954);
    float _1716 = _1682 * _1688;
    int _1718 = ~_1176;
    int _1720 = _1718 + _1282;
    int _1722 = _1720 + 1;
    int _1724 = _355 * _1710;
    int _1726 = _1724 + _654;
    int _1728 = abs(_1028);
    int _1730 = _1626 + 8;
    uint _1732 = uint(int(uint(_1730) >> uint(2)));
    uint _1734 = uint(int(uint(int(_1732)) >> uint(2)));
    int _1736 = int(_1732) & 3;
    float _1738 = (*spvDescriptorSet0.vp_c9)._m0[int(_1734)][_1736];
    int _1740 = int(_1732) + 1;
    uint _1742 = uint(int(uint(_1740) >> uint(2)));
    int _1744 = _1740 & 3;
    float _1746 = (*spvDescriptorSet0.vp_c9)._m0[int(_1742)][_1744];
    float _1748 = _1716 * (-2.0);
    bool _1750 = !_912;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = _373 * _1722;
    int _1756 = _1754 + _732;
    int _1758 = abs(_1070);
    float _1760 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1628);
    float _1762 = fma(_1748, _1636, _1636);
    bool _1764 = !_968;
    int _1766 = _1764 ? 0 : 1;
    int _1768 = _1644 + 8;
    uint _1770 = uint(int(uint(_1768) >> uint(2)));
    uint _1772 = uint(int(uint(int(_1770)) >> uint(2)));
    int _1774 = int(_1770) & 3;
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[int(_1772)][_1774];
    int _1778 = int(_1770) + 1;
    uint _1780 = uint(int(uint(_1778) >> uint(2)));
    int _1782 = _1778 & 3;
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[int(_1780)][_1782];
    int _1786 = abs(_1752);
    float _1788 = _1632 * (-2.0);
    int _1790 = abs(_1766);
    float _1792 = fma(_1424, _1748, _1424);
    int _1794 = ~_1714;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    int _1800 = ~_1728;
    int _1802 = _1800 + 1;
    int _1804 = _1802 + 1;
    int _1806 = abs(_1038);
    int _1808 = ~_1786;
    int _1810 = _1808 + 1;
    int _1812 = _1810 + 1;
    bool _1814 = _910 != 3;
    bool _1816 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1818 = isnan(0.0);
    bool _1820 = _1816 || _1818;
    bool _1822 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1824 = _1820 || _1822;
    int _1826 = _1798 * as_type<int>(_1660);
    int _1828 = ~_1806;
    int _1830 = _1828 + 1;
    int _1832 = _1830 + 1;
    int _1834 = _1812 * as_type<int>(_1652);
    int _1836 = _1834 + _1826;
    bool _1838 = !_1314;
    int _1840 = _1838 ? 0 : 1;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1844 = _966 != 3;
    int _1846 = _1804 * as_type<int>(_1704);
    int _1848 = ~_1790;
    int _1850 = _1848 + 1;
    int _1852 = _1850 + 1;
    float _1854 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1856 = 1.0 + _1854;
    float _1858 = _1824 ? _1680 : 0.0;
    float _1860 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1842);
    bool _1862 = _1712 >= 0.0;
    int _1864 = _1852 * as_type<int>(_1696);
    int _1866 = _1864 + _1846;
    bool _1868 = !_1844;
    int _1870 = _1868 ? 0 : (-1);
    int _1872 = _1832 * as_type<int>(_1738);
    int _1874 = _1872 + _1836;
    bool _1876 = !_1814;
    int _1878 = _1876 ? 0 : (-1);
    float _1880 = _1142 + 0.5;
    int _1882 = abs(_1870);
    float _1884 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1860);
    int _1886 = abs(_1878);
    float _1888 = fma(_1880, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1580);
    float _1890 = 1.0 / _1856;
    bool _1892 = !_1320;
    int _1894 = _1892 ? 0 : 1;
    float _1896 = _1208 + (-0.5);
    int _1898 = abs(_1840);
    if (_1862)
    {
        out.m_47.x = 0.0;
    }
    float _1900 = -_1896;
    float _1902 = -_1760;
    float _1904 = fma(_1900, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1902);
    int _1906 = ~_1758;
    int _1908 = _1906 + 1;
    int _1910 = _1908 + 1;
    int _1912 = abs(_1894);
    int _1914 = _1910 * as_type<int>(_1776);
    int _1916 = _1914 + _1866;
    int _1918 = ~_1886;
    int _1920 = _1918 + 1;
    int _1922 = _1920 + 1;
    int _1924 = ~_1898;
    int _1926 = _1924 + 1;
    int _1928 = _1926 + 1;
    int _1930 = ~_1882;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    int _1936 = _1922 * as_type<int>(_1746);
    int _1938 = _1936 + _1874;
    float _1940 = fma(_1788, _1638, _1638);
    bool _1942 = _355 == 0;
    int _1944 = _1938 * _1928;
    float _1946 = _1602 * _1602;
    int _1948 = ~_1912;
    int _1950 = _1948 + 1;
    int _1952 = _1950 + 1;
    int _1954 = _1934 * as_type<int>(_1784);
    int _1956 = _1954 + _1916;
    bool _1958 = _373 == 0;
    float _1960 = fma(_1612, _1612, _1946);
    bool _1962 = !_1942;
    int _1964 = _1962 ? _1726 : (-1);
    int _1966 = _1956 * _1952;
    bool _1968 = !_1958;
    int _1970 = _1968 ? _1756 : (-1);
    float _1972 = fma(_1686, _1686, _1960);
    bool _1974 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1976 = isnan(1.0);
    bool _1978 = _1974 || _1976;
    bool _1980 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1982 = _1978 || _1980;
    int _1984 = _1964 * _1898;
    int _1986 = _1984 + _1944;
    float _1988 = -_1884;
    float _1990 = _1988 + 1.0;
    float _1992 = rsqrt(_1972);
    int _1994 = _1970 * _1912;
    int _1996 = _1994 + _1966;
    float _1998 = -_1588;
    float _2000 = _1998 + 1.0;
    float _2002 = as_type<float>(_1916);
    if (_1862)
    {
        _2002 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2004 = _2002;
    float _2006 = -_1584;
    float _2008 = _2006 + 1.0;
    float _2010 = fma(_1112, _1990, _1544);
    float _2012 = -_2000;
    float _2014 = fma(_1142, _2012, _1888);
    float _2016 = -_369;
    float _2018 = fma(_1092, _2016, _1534);
    float _2020 = fma(_1208, _2008, _1904);
    int _2022 = as_type<int>(_2004);
    if (_1862)
    {
        float _2024 = _2004 * 5.0;
        _2022 = as_type<int>(_2024);
    }
    int _2026 = _2022;
    float _2028 = float(_1986);
    if (_1982)
    {
        float _2030 = _1858 * _1890;
        _149 = _2030;
    }
    float _2032 = _149;
    float _2034 = float(_1996);
    out.m_68.x = _2018;
    out.m_68.y = _2010;
    out.m_68.z = _2014;
    out.m_68.w = _2020;
    float _2036 = fma(_1452, _1788, _1452);
    float _2038 = _1602 * _1992;
    float _2040 = _1612 * _1992;
    if (_1862)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6067 = as_type<float>(_2026);
        out.gl_Position.z = _6067;
    }
    out.m_70.x = _2028;
    out.m_70.y = _2034;
    if (_1862)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2042 = -_2038;
    float _2044 = fma(_2042, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1524);
    float _2046 = _131 + (-0.5);
    float _2048 = _1686 * _1992;
    float _2050 = -_2040;
    float _2052 = fma(_2050, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1422);
    float _2054 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2056 = _2044 + _2054;
    float _2058 = fma(_2046, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1762);
    float _2060 = -_2048;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1550);
    float _2064 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2066 = _2052 + _2064;
    float _2068 = _2056 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2070 = _339 + (-0.5);
    float _2072 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2074 = _2062 + _2072;
    float _2076 = -_2038;
    float _2078 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1602);
    float _2080 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2068);
    float _2082 = _1668 * (-2.0);
    float _2084 = fma(_2070, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1940);
    float _2086 = -_2040;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1612);
    float _2090 = fma(_2074, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2080);
    float _2092 = _2078 * _2078;
    float _2094 = in.m_58.x;
    float _2096 = in.m_58.y;
    float _2098 = fma(_2082, _1640, _1640);
    float _2100 = _788 + (-0.5);
    bool _2102 = _2090 >= 0.0;
    float _2104 = fma(_1792, _2032, _2058);
    float _2106 = fma(_2036, _2032, _2084);
    float _2108 = fma(_2088, _2088, _2092);
    float _2110 = -_2048;
    float _2112 = fma(_2110, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1686);
    float _2114 = fma(_2100, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2098);
    float _2116 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _2118 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _2116;
    float _2120 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _2120;
    float _2124 = _2104 * 0.15915493667125701904296875;
    float _2126 = _2106 * 0.15915493667125701904296875;
    float _2128 = fma(_2112, _2112, _2108);
    float _2130 = fma(_2118, _1394, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _2132 = (*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _2134 = _2062;
    float _2136 = _2044;
    float _2138 = _2052;
    if (_2102)
    {
        _2132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2140 = _2132;
    float _2142 = fma(_2122, _1394, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _2144 = _2124 * 6.283185482025146484375;
    float _2146 = sin(_2144);
    float _2148 = fma(_2130, _1508, _1554);
    float _2150 = fma(_1396, _2082, _1396);
    int _2152 = as_type<int>(_2140);
    if (_2102)
    {
        float _2154 = _2140 * 5.0;
        _2152 = as_type<int>(_2154);
    }
    int _2156 = _2152;
    float _2158 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[146].y, _2148);
    float _2160 = fma(_2150, _2032, _2114);
    if (_2102)
    {
        out.m_47.x = 0.0;
    }
    float _2162 = _2124 * 6.283185482025146484375;
    float _2164 = cos(_2162);
    float _2166 = fma(_1492, _1522, _1546);
    float _2168 = _2158 * _2096;
    if (_2102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6300 = as_type<float>(_2156);
        out.gl_Position.z = _6300;
    }
    float _2170 = _2160 * 0.15915493667125701904296875;
    float _2172 = _2126 * 6.283185482025146484375;
    float _2174 = sin(_2172);
    float _2176 = sqrt(_2128);
    float _2178 = _2126 * 6.283185482025146484375;
    float _2180 = cos(_2178);
    if (_2102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2182 = fma(_2142, _1508, _2166);
    float _2184 = _2170 * 6.283185482025146484375;
    float _2186 = cos(_2184);
    float _2188 = _1992 * _2176;
    float _2190 = _2168 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2192 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[146].x, _2182);
    float _2194 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _219);
    float _2196 = _2146 * _2174;
    float _2198 = _2188 * _2190;
    float _2200 = _2192 * _2094;
    float _2202 = _2170 * 6.283185482025146484375;
    float _2204 = sin(_2202);
    float _2206 = _2164 * _2174;
    float _2208 = _2194 * _2198;
    float _2210 = _2200 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2212 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _215);
    float _2214 = _2164 * _2180;
    float _2216 = _2146 * _2180;
    float _2218 = _2188 * _2210;
    float _2220 = _2164 * _2186;
    float _2222 = _2146 * _2186;
    float _2224 = _2174 * _2186;
    float _2226 = _2212 * _2218;
    float _2228 = _2220 * _2208;
    float _2230 = _2180 * _2186;
    float _2232 = _2188 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2234 = _2232 * 0.5;
    float _2236 = _2222 * _2208;
    float _2238 = fma(_2204, _2214, _2196);
    float _2240 = -_2216;
    float _2242 = fma(_2204, _2206, _2240);
    float _2244 = -_2208;
    float _2246 = _2204 * _2244;
    float _2248 = -_2206;
    float _2250 = fma(_2204, _2216, _2248);
    float _2252 = fma(_2238, _2226, _2228);
    float _2254 = fma(_2204, _2196, _2214);
    float _2256 = fma(_2230, _2226, _2246);
    float _2258 = fma(_2250, _2226, _2236);
    float _2260 = fma(_2242, _2234, _2252);
    float _2262 = fma(_2224, _2234, _2256);
    float _2264 = fma(_2254, _2234, _2258);
    float _2266 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2268 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2270 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2272 = isnan(0.5);
    bool _2274 = _2270 || _2272;
    bool _2276 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2278 = _2274 || _2276;
    float _2280 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2266);
    float _2282 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2268);
    float _2284 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2280);
    float _2286 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2282);
    float _2288 = _2284 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2290 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2292 = _1550 + _2288;
    float _2294 = _1422 + _2290;
    float _2296 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2298 = _2292 + _2296;
    float _2300 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2302 = _2294 + _2300;
    float _2304 = _2298 * _2298;
    float _2306 = fma(_2302, _2302, _2304);
    float _2308 = _2260 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2310 = sqrt(_2306);
    float _2312 = fma(_2262, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2308);
    float _2314 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2312);
    float _2316 = _2314 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2318 = _1524 + _2316;
    bool _2320 = _2310 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2322 = _2316;
    float _2324 = _2308;
    float _2326 = _2292;
    float _2328 = _2210;
    float _2330 = _2318;
    if (!_2320)
    {
        _2322 = _2294;
    }
    float _2332 = _2322;
    float _2334 = _2332;
    if (!_2320)
    {
        _2324 = _2318;
    }
    float _2336 = _2324;
    bool _2338 = !_2320;
    float _2340 = _2336;
    if (!_2338)
    {
        float _2342 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2346 = _2310 + _2344;
        float _2348 = rsqrt(_2306);
        float _2350 = _2346 * _2342;
        float _2352 = _2318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2354 = _2350 * 0.15915493667125701904296875;
        float _2356 = _2354 * 6.283185482025146484375;
        float _2358 = sin(_2356);
        float _2360 = _2354 * 6.283185482025146484375;
        float _2362 = cos(_2360);
        float _2364 = fma(_2358, _2352, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2366 = _2348 * _2364;
        float _2368 = _2362 + (-1.0);
        float _2370 = fma(_2302, _2366, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2372 = fma(_2298, _2366, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2374 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2376 = fma(_2318, _2362, _2374);
        _2334 = _2370;
        _2340 = _2376;
        _2326 = _2372;
        _2328 = _2354;
    }
    float _2378 = _2334;
    float _2380 = _2340;
    float _2382 = _2326;
    float _2384 = _2328;
    float _2386 = -_2040;
    float _2388 = fma(_2386, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2378);
    float _2390 = -_2038;
    float _2392 = fma(_2390, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2380);
    float _2394 = -_2048;
    float _2396 = fma(_2394, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2382);
    float _2398 = _2392;
    float _2400 = _2388;
    float _2402 = _2396;
    float _2404 = _2384;
    if (!_2278)
    {
        float _2406 = _2056 * _2056;
        float _2408 = 1.0 / _2188;
        float _2410 = -_1550;
        float _2412 = _2410 + _2382;
        float _2414 = -_1422;
        float _2416 = _2414 + _2378;
        float _2418 = fma(_2066, _2066, _2406);
        float _2420 = -_1524;
        float _2422 = _2420 + _2380;
        float _2424 = fma(_2074, _2074, _2418);
        float _2426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2428 = sqrt(_2424);
        float _2430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2432 = precise::min(_2428, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2434 = _2432 * _2426;
        float _2436 = _2430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2438 = _2434 * _2408;
        float _2440 = _2412 * _2438;
        float _2442 = _2436 * _2438;
        float _2444 = fma(_2436, _2440, _2062);
        float _2446 = fma(_2416, _2442, _2052);
        float _2448 = fma(_2422, _2442, _2044);
        _2398 = _2448;
        _2400 = _2446;
        _2402 = _2444;
    }
    float _2450 = _2398;
    float _2452 = _2400;
    float _2454 = _2402;
    float _2456 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2458 = _2450 + _2456;
    float _2460 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2462 = _2452 + _2460;
    float _2464 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2466 = _2454 + _2464;
    float _2468 = _2458 * _2458;
    float _2470 = fma(_2462, _2462, _2468);
    float _2472 = fma(_2466, _2466, _2470);
    float _2474 = rsqrt(_2472);
    float _2476 = _2474 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2478 = _2462 * _2476;
    float _2480 = _2466 * _2476;
    float _2482 = _2478 * _2478;
    float _2484 = _2480 * _2480;
    float _2486 = _2482 + _2484;
    float _2488 = sqrt(_2486);
    bool _2490 = _2488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2494 = _2488 + _2492;
    float _2496 = _2466;
    float _2498 = _2474;
    float _2500 = _2494;
    float _2502 = _2458;
    if (_2490)
    {
        float _2504 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2496 = _2504;
    }
    float _2506 = _2496;
    if (_2490)
    {
        float _2508 = rsqrt(_2486);
        _2498 = _2508;
    }
    float _2510 = _2498;
    float _2512 = _2510;
    if (_2490)
    {
        float _2514 = _2494 * _2506;
        _2500 = _2514;
    }
    float _2516 = _2500;
    if (_2490)
    {
        float _2518 = _2516 * 0.15915493667125701904296875;
        _2134 = _2518;
    }
    float _2520 = _2134;
    float _2522 = _2506;
    float _2524 = _2520;
    if (_2490)
    {
        float _2526 = _2520 * 6.283185482025146484375;
        float _2528 = sin(_2526);
        _2522 = _2528;
    }
    float _2530 = _2522;
    float _2532 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2534 = precise::max(0.0, _2532);
    float _2536 = _2468;
    float _2538 = _2534;
    if (_2490)
    {
        float _2540 = _2520 * 6.283185482025146484375;
        float _2542 = cos(_2540);
        _2536 = _2542;
    }
    float _2544 = _2536;
    float _2546 = -_2476;
    float _2548 = -_2534;
    float _2550 = fma(_2458, _2546, _2548);
    if (_2490)
    {
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2538 = _2552;
    }
    float _2554 = _2538;
    float _2556 = _2554;
    if (!_2490)
    {
        _2524 = _2482;
    }
    float _2558 = _2524;
    float _2560 = _2558;
    if (_2490)
    {
        float _2562 = fma(_2530, _2554, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2502 = _2562;
    }
    float _2564 = _2502;
    float _2566 = sqrt(_2472);
    float _2568 = _2564;
    float _2570 = _2544;
    if (_2490)
    {
        float _2572 = _2544 + (-1.0);
        _2556 = _2572;
    }
    float _2574 = _2556;
    float _2576 = _2574;
    if (_2490)
    {
        float _2578 = _2510 * _2564;
        _2330 = _2578;
    }
    float _2580 = _2330;
    if (!_2490)
    {
        _2512 = _2478;
    }
    float _2582 = _2512;
    float _2584 = _2582;
    if (_2490)
    {
        float _2586 = _2574 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2404 = _2586;
    }
    float _2588 = _2404;
    if (_2490)
    {
        float _2590 = _2478 * _2580;
        _2584 = _2590;
    }
    float _2592 = _2584;
    if (!_2490)
    {
        _2568 = _2550;
    }
    float _2594 = _2568;
    float _2596 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2598 = _2594;
    if (!_2490)
    {
        _2576 = _2480;
    }
    float _2600 = _2576;
    float _2602 = _2600;
    if (_2490)
    {
        float _2604 = fma(_2550, _2544, _2588);
        _2598 = _2604;
    }
    float _2606 = _2598;
    if (_2490)
    {
        float _2608 = _2480 * _2580;
        _2602 = _2608;
    }
    float _2610 = _2602;
    if (_2490)
    {
        float _2612 = _2592 * _2592;
        _2560 = _2612;
    }
    float _2614 = _2560;
    if (!_2490)
    {
        _2570 = _2484;
    }
    float _2616 = _2570;
    float _2618 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2620 = _2616;
    if (_2490)
    {
        float _2622 = _2610 * _2610;
        _2620 = _2622;
    }
    float _2624 = _2620;
    float _2626 = fma(_2606, _2606, _2614);
    float _2628 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2630 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2618);
    float _2632 = _2626 + _2624;
    float _2634 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2596);
    float _2636 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2640 = fma(_2566, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2638);
    float _2642 = precise::clamp(_2640, 0.0, 1.0);
    float _2644 = rsqrt(_2632);
    float _2646 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2634);
    float _2648 = _2450 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2650 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2636);
    float _2652 = -_2642;
    float _2654 = _2652 + 1.0;
    float _2656 = _2646 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2658 = fma(_2452, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2648);
    float _2660 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2650);
    float _2662 = abs(_2654);
    float _2664 = log2(_2662);
    float _2666 = _2656 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2668 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2658);
    float _2670 = _2660 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2672 = -_2666;
    float _2674 = fma(_2672, _2628, 1.0);
    float _2676 = _2668 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2678 = fma(_2454, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2630);
    float _2680 = _2644 * _2592;
    float _2682 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2684 = _2644 * _2610;
    float _2686 = _2678 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2688 = log2(_2674);
    float _2690 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2682);
    float _2692 = _2644 * _2606;
    float _2694 = _2680 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2696 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2698 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2690);
    float _2700 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2702 = -_2694;
    float _2704 = fma(_2692, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2702);
    float _2706 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2698);
    float _2708 = exp2(_2696);
    float _2710 = -_2684;
    float _2712 = fma(_2710, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2704);
    float _2714 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2716 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2700);
    float _2718 = fma(_2712, -0.5, 0.5);
    float _2720 = fma(_2712, 0.5, 0.5);
    float _2722 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2714);
    float _2724 = 1.0 / _2706;
    float _2726 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2716);
    float _2728 = fma(_2720, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2730 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2722);
    float _2732 = _2692 + 1.0;
    float _2734 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2726);
    float _2736 = fma(_2720, _2728, -0.212114393711090087890625);
    float _2738 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2730);
    float _2740 = sqrt(_2718);
    float _2742 = -_2692;
    float _2744 = fma(_2708, _2732, _2742);
    float _2746 = _2688 * 0.693147182464599609375;
    float _2748 = fma(_2720, _2736, 1.570728778839111328125);
    float _2750 = fma(_2744, 0.5, 0.5);
    float _2752 = _2746 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2754 = _2738 * _2724;
    float _2756 = _2734 * _2724;
    float _2758 = fma(_2754, 0.5, 0.5);
    float _2760 = fma(_2756, -0.5, 0.5);
    float _2762 = _2740 * 0.636619746685028076171875;
    float3 _7270 = float3(_2758, _2760, _2752);
    float _2764 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7270, float3(0.0), isnan(_7270)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7270, float3(0.0), isnan(_7270)), level(0.0)).x;
    float3 _7281 = float3(_2758, _2760, _2752);
    float4 _2767 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7281, float3(0.0), isnan(_7281)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7281, float3(0.0), isnan(_7281)), level(0.0)).xyzw;
    float _2769 = _2767.x;
    float _2771 = _2767.y;
    float _2773 = _2767.z;
    float _2775 = _2767.w;
    float _2777 = -_2748;
    float _2779 = fma(_2762, _2777, 1.0);
    float2 _7303 = float2(_2779, _2750);
    float3 _2783 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7303, float2(0.0), isnan(_7303)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7303, float2(0.0), isnan(_7303)), level(0.0)).xyz;
    float _2785 = _2783.x;
    float _2787 = _2783.y;
    float _2789 = _2783.z;
    float _2791 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2793 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2795 = _2238 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2797 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2799 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2801 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2791);
    float _2803 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2793);
    float _2805 = fma(_2230, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2795);
    float _2807 = _2220 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2809 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2811 = _219 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2813 = -_2204;
    float _2815 = fma(_2813, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2797);
    float _2817 = -_2204;
    float _2819 = fma(_2817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2799);
    float _2821 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2823 = _2242 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2825 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2809);
    float _2827 = fma(_2811, _2811, 1.0);
    float _2829 = _2664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2831 = -_2204;
    float _2833 = fma(_2831, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2807);
    float _2835 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2821);
    float _2837 = fma(_2224, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2823);
    float _2839 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2815);
    float _2841 = rsqrt(_2827);
    float _2843 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2819);
    float _2845 = fma(_2222, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2833);
    float _2847 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2801);
    float _2849 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2803);
    float _2851 = fma(_2250, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2805);
    float _2853 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2825);
    float _2855 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2835);
    float _2857 = exp2(_2829);
    float _2859 = fma(_2254, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2837);
    float _2861 = _2670 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2863 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2865 = _2811 * _2839;
    float _2867 = _2811 * _2843;
    float _2869 = _2811 * _2845;
    float _2871 = fma(_2676, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2861);
    float _2873 = _2811 * _2841;
    out.m_72.x = _2847;
    out.m_72.y = _2849;
    out.m_72.z = _2851;
    float _2875 = fma(_2863, _2847, _2865);
    float _2877 = fma(_2863, _2849, _2867);
    float _2879 = fma(_2863, _2851, _2869);
    float _2881 = fma(_2656, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2871);
    float _2883 = _2738 + _2706;
    float _2885 = -_2857;
    float _2887 = _2885 + 1.0;
    float _2889 = fma(_2686, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2881);
    float _2891 = _2883 * 0.5;
    float _2893 = _2855 + _2877;
    float _2895 = _2887 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2897 = -_2853;
    float _2899 = _2873 * _2897;
    float _2901 = -_2855;
    float _2903 = _2873 * _2901;
    float _2905 = -_2859;
    float _2907 = _2873 * _2905;
    float _2909 = _2706 * 0.5;
    float _2911 = fma(_2841, _2839, _2899);
    float _2913 = fma(_2841, _2843, _2903);
    float _2915 = fma(_2841, _2845, _2907);
    float _2917 = _2889 + _2706;
    float _2919 = fma(_2734, -0.5, _2909);
    float _2921 = _2853 + _2875;
    float _2923 = _2859 + _2879;
    out.m_74.x = _2911;
    out.m_74.y = _2913;
    out.m_74.z = _2915;
    float _2925 = _2917 * 0.5;
    bool _2927 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2929 = isnan(_2566);
    bool _2931 = _2927 || _2929;
    bool _2933 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2935 = _2931 || _2933;
    out.m_76.x = _2921;
    out.m_76.y = _2893;
    out.m_76.z = _2923;
    out.m_78.x = _2891;
    out.m_78.y = _2919;
    out.m_78.z = _2925;
    out.m_78.w = _2706;
    float _2937 = -_2895;
    float _2939 = _2937 + 1.0;
    out.m_80.x = _2452;
    out.m_80.y = _2450;
    out.m_80.z = _2454;
    out.m_82.x = _2052;
    out.m_82.y = _2044;
    out.gl_Position.x = _2738;
    out.gl_Position.y = _2734;
    out.gl_Position.z = _2889;
    out.gl_Position.w = _2706;
    float _2941 = _2734;
    float _2943 = _2738;
    if (!_2935)
    {
        _2136 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2945 = _2136;
    float _2947 = _2945;
    float _2949 = _2945;
    if (!_2935)
    {
        _2138 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2951 = _2138;
    float _2953 = _2951;
    float _2955 = _2951;
    if (!_2935)
    {
        _2941 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2957 = _2941;
    float _2959 = _2957;
    float _2961 = _2957;
    if (!_2935)
    {
        _2943 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2963 = _2943;
    float _2965 = _2895 * _2764;
    float _2967 = _2775 * _2939;
    float _2969 = _2775 * _2965;
    float _2971 = _2789 * _2965;
    float _2973 = fma(_2785, _2969, _2769);
    float _2975 = fma(_2787, _2969, _2771);
    float _2977 = fma(_2775, _2971, _2773);
    float _2979 = _2775;
    float _2981 = _2773;
    float _2983 = _2963;
    float _2985 = _2963;
    if (!_2935)
    {
        _2979 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2987 = _2979;
    float _2989 = _2987;
    float _2991 = _2987;
    if (!_2935)
    {
        _2981 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2993 = _2981;
    out.m_84.x = _2973;
    out.m_84.y = _2975;
    out.m_84.z = _2977;
    out.m_84.w = _2967;
    bool _2995 = !_2935;
    float _2997 = _2993;
    float _2999 = _2993;
    if (!_2995)
    {
        bool _3001 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3003 = isnan(_2566);
        bool _3005 = _3001 || _3003;
        bool _3007 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3009 = _3005 || _3007;
        if (!_3009)
        {
            float _3011 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3013 = _2566 + _3011;
            float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3017 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3015;
            float _3019 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3021 = _3019 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3023 = 1.0 / _3017;
            float _3025 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3027 = _3025 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3029 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3031 = _3029 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3033 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3035 = _3033 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3037 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3039 = _3037 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3041 = _3013 * _3023;
            float _3043 = precise::clamp(_3041, 0.0, 1.0);
            float _3045 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3047 = _3045 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3049 = fma(_3043, _3021, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3051 = fma(_3043, _3047, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3053 = fma(_3043, _3027, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3055 = fma(_3043, _3031, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3057 = fma(_3043, _3035, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3059 = fma(_3043, _3039, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2985 = _3053;
            _2949 = _3057;
            _2961 = _3049;
            _2999 = _3055;
            _2991 = _3051;
            _2955 = _3059;
            _3061 = true;
        }
        else
        {
            bool _3063 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3065 = isnan(_2566);
            bool _3067 = _3063 || _3065;
            bool _3069 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3071 = _3067 || _3069;
            if (!_3071)
            {
                _2959 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3073 = _2959;
            _2961 = _3073;
            if (!_3071)
            {
                _2983 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3075 = _2983;
            _2985 = _3075;
            if (!_3071)
            {
                _2989 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3077 = _2989;
            _2991 = _3077;
            if (!_3071)
            {
                _2997 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3079 = _2997;
            _2999 = _3079;
            if (!_3071)
            {
                _2947 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3081 = _2947;
            _2949 = _3081;
            if (!_3071)
            {
                _2953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3083 = _2953;
            bool _3085 = !_3071;
            _2955 = _3083;
            if (!_3085)
            {
                bool _3087 = _2566 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3089 = isnan(_2566);
                bool _3091 = _3087 || _3089;
                bool _3093 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3095 = _3091 || _3093;
                if (!_3095)
                {
                    float _3097 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3099 = _2566 + _3097;
                    float _3101 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3103 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3101;
                    float _3105 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3109 = 1.0 / _3103;
                    float _3111 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3113 = _3111 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3115 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3117 = _3115 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3119 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3123 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3125 = _3123 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3127 = _3099 * _3109;
                    float _3129 = precise::clamp(_3127, 0.0, 1.0);
                    float _3131 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3133 = _3131 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3135 = fma(_3129, _3107, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3137 = fma(_3129, _3133, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3139 = fma(_3129, _3113, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3141 = fma(_3129, _3117, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3143 = fma(_3129, _3121, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3145 = fma(_3129, _3125, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2985 = _3139;
                    _2949 = _3143;
                    _2961 = _3135;
                    _2999 = _3141;
                    _2991 = _3137;
                    _2955 = _3145;
                    _3061 = true;
                }
                else
                {
                    _2985 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2949 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2961 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2999 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2991 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3061 = false;
    float _3147 = _2985;
    float _3149 = _2949;
    float _3151 = _2961;
    float _3153 = _2999;
    float _3155 = _2991;
    float _3157 = _2955;
    float _3159 = fma(_2893, -0.5, 0.5);
    float _3161 = precise::clamp(_3159, 0.0, 1.0);
    float _3163 = -_3147;
    float _3165 = _3163 + _3149;
    float _3167 = -_3151;
    float _3169 = _3167 + _3153;
    float _3171 = -_3155;
    float _3173 = _3171 + _3157;
    bool _3175 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3177 = fma(_3161, _3165, _3147);
    float _3179 = fma(_3161, _3169, _3151);
    float _3181 = fma(_3161, _3173, _3155);
    float _3183 = _3177 * 0.586610972881317138671875;
    out.m_47.x = 1.0;
    float _3185 = fma(_3179, 0.298911988735198974609375, _3183);
    float _3187 = fma(_3181, 0.114477999508380889892578125, _3185);
    out.m_86.x = 0.0;
    float _3189 = -_3187;
    float _3191 = _3179 + _3189;
    float _3193 = -_3187;
    float _3195 = _3177 + _3193;
    float _3197 = -_3187;
    float _3199 = _3181 + _3197;
    float _3201 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3203 = fma(_3191, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3205 = fma(_3195, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    float _3207 = fma(_3199, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3187);
    out.m_88.w = _3201;
    out.m_90.x = _3203;
    out.m_90.y = _3205;
    out.m_90.z = _3207;
    if (!_3175)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3209 = -_2450;
    float _3211 = _3209 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3213 = -_2452;
    float _3215 = _3213 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3217 = -_2454;
    float _3219 = _3217 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3221 = _3211 * _3211;
    float _3223 = fma(_3215, _3215, _3221);
    float _3225 = fma(_3219, _3219, _3223);
    float _3227 = sqrt(_3225);
    float _3229 = rsqrt(_3225);
    float _3231 = -_3227;
    float _3233 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3235 = _3233 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3237 = precise::clamp(_3235, 0.0, 1.0);
    float _3239 = _3215 * _3229;
    float _3241 = _3211 * _3229;
    float _3243 = abs(_3237);
    float _3245 = log2(_3243);
    float _3247 = _3219 * _3229;
    float _3249 = _3239 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _3251 = _2893 * _3241;
    float _3253 = -_3241;
    float _3255 = -_3249;
    float _3257 = fma(_3253, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3255);
    float _3259 = fma(_2921, _3239, _3251);
    float _3261 = -_3247;
    float _3263 = fma(_3261, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3257);
    float _3265 = fma(_2923, _3247, _3259);
    float _3267 = precise::clamp(_3265, 0.0, 1.0);
    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _3271 = _3263 + _3269;
    float _3273 = _3245 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _3275 = _3271 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _3277 = precise::clamp(_3275, 0.0, 1.0);
    float _3279 = exp2(_3273);
    float _3281 = _3279 * _3277;
    float _3283 = _3267 * _3281;
    float _3285 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _3287 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _3289 = _3283 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_86.x = _3285;
    out.m_86.y = _3287;
    out.m_86.z = _3289;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

