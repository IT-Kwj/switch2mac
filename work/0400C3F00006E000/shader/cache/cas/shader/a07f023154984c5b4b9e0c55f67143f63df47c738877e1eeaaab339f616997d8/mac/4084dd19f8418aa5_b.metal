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

struct _33
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c11 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    const device _33* vp_s0 [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    constant dm_border_t* dm_border [[id(20)]];
};

struct main0_out
{
    float4 m_90 [[user(locn0)]];
    float4 m_78 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_98 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_82 [[user(locn5)]];
    float4 m_88 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_96 [[user(locn8)]];
    float4 m_92 [[user(locn9)]];
    float4 m_94 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_62 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_64 [[attribute(3)]];
    float4 m_68 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_58 [[attribute(6)]];
    float4 m_80 [[attribute(7)]];
    float4 m_72 [[attribute(8)]];
    float4 m_66 [[attribute(9)]];
    float4 m_70 [[attribute(10)]];
    float4 m_74 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1749 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_53.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_56.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_133);
        out.gl_Position.z = _2034;
    }
    if (!_121)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _137 = in.m_58.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_147)
    {
        float _153 = float(_117);
        _127 = _153;
    }
    float _155 = _127;
    bool _157 = _151 >= _155;
    bool _159 = !_147;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_56.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_169);
        out.gl_Position.z = _2103;
    }
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = _171 * _171;
    float _195 = _173 * _173;
    float _197 = _175 * _175;
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = sqrt(_205);
    float _213 = _177 * _191;
    float _215 = sqrt(_207);
    float _217 = sqrt(_209);
    bool _219 = _211 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = trunc(_213);
    int _225 = int(_223);
    float _227 = 0.0;
    float _229 = _215;
    if (!_219)
    {
        _227 = 0.0;
    }
    float _231 = _227;
    bool _233 = _217 > 0.0;
    float _235 = _205;
    float _237 = _217;
    float _239 = _231;
    if (_219)
    {
        float _241 = rsqrt(_205);
        _235 = _241;
    }
    float _243 = _235;
    float _245 = 0.0;
    if (!_219)
    {
        _245 = 0.0;
    }
    float _247 = _245;
    float _249 = 0.0;
    float _251 = _247;
    if (!_219)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = _253;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _259 = _255;
    float _261 = 0.0;
    float _263 = _259;
    if (!_221)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (_221)
    {
        float _271 = rsqrt(_207);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = 0.0;
    if (!_221)
    {
        _275 = 0.0;
    }
    float _277 = _275;
    int _279 = _225 << 4;
    int _281 = _279 + 1712;
    float _283 = 0.0;
    float _285 = _277;
    if (!_233)
    {
        _283 = 0.0;
    }
    float _287 = _283;
    float _289 = _287;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _291 = _237;
    float _293 = _211;
    float _295 = _291;
    if (_233)
    {
        float _297 = rsqrt(_209);
        _293 = _297;
    }
    float _299 = _293;
    if (_219)
    {
        float _301 = _243 * _179;
        _239 = _301;
    }
    float _303 = _239;
    float _305 = _303;
    if (_219)
    {
        float _307 = _243 * _171;
        _251 = _307;
    }
    float _309 = _251;
    if (_219)
    {
        float _311 = _243 * _185;
        _257 = _311;
    }
    float _313 = _257;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _317 = _313;
    if (!_233)
    {
        _229 = 0.0;
    }
    float _319 = _229;
    float _321 = _319;
    if (_221)
    {
        float _323 = _273 * _181;
        _263 = _323;
    }
    float _325 = _263;
    if (_221)
    {
        float _327 = _273 * _173;
        _269 = _327;
    }
    float _329 = _269;
    if (_221)
    {
        float _331 = _273 * _187;
        _285 = _331;
    }
    float _333 = _285;
    if (_233)
    {
        float _335 = _299 * _183;
        _289 = _335;
    }
    float _337 = _289;
    if (_233)
    {
        float _339 = _299 * _175;
        _295 = _339;
    }
    float _341 = _295;
    float _343 = _341;
    if (_233)
    {
        float _345 = _299 * _189;
        _321 = _345;
    }
    float _347 = _321;
    bool _349 = !_315;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _353 = _191 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_117);
        float _371 = 1.0 / _369;
        float _373 = _151 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = in.m_68.w;
    float _379 = in.m_53.x;
    float _381 = in.m_53.y;
    float _383 = in.m_53.z;
    float _385 = in.m_70.x;
    float _387 = in.m_70.y;
    float _389 = in.m_70.z;
    float _391 = in.m_72.x;
    float _393 = in.m_72.y;
    float _395 = in.m_72.z;
    float _397 = in.m_64.w;
    float _399 = in.m_62.w;
    float _401 = trunc(_377);
    int _403 = int(_401);
    float _405 = in.m_60.w;
    int _407 = _403 << 5;
    uint _410 = uint(int(uint(_407) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_410)];
    float _412 = as_type<float>(_dmw0.x);
    int _414 = _407 + 4;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    float _418 = as_type<float>(_dmw0.y);
    int _420 = _407 + 8;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>(_dmw0.z);
    int _426 = _407 + 12;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    float _430 = as_type<float>(_dmw0.w);
    float _432 = _187 * _381;
    float _434 = _387 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _440 = fma(_185, _379, _432);
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _393);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _448 = _389 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _450 = _181 * _381;
    float _452 = _444 * _442;
    float _454 = _446 * _438;
    float _456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _395);
    float _458 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _460 = _452 * _333;
    float _462 = fma(_179, _379, _450);
    float _464 = fma(_189, _383, _440);
    float _466 = _458 * _456;
    float _468 = _452 * _325;
    float _470 = fma(_454, _313, _460);
    float _472 = fma(_183, _383, _462);
    float _474 = _464 + _397;
    float _476 = fma(_454, _303, _468);
    float _478 = fma(_466, _347, _470);
    float _480 = _472 + _399;
    float _482 = _173 * _381;
    float _484 = fma(_466, _337, _476);
    float _486 = _474 + _478;
    float _488 = _452 * _329;
    float _490 = fma(_171, _379, _482);
    float _492 = _480 + _484;
    float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _496 = _486 + _494;
    float _498 = fma(_454, _309, _488);
    float _500 = fma(_175, _383, _490);
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_466, _341, _498);
    float _510 = _500 + _405;
    float _512 = fma(_504, _504, _506);
    float _514 = _510 + _508;
    float _516 = sqrt(_512);
    bool _518 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _520 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.5);
    bool _526 = _522 || _524;
    bool _528 = _516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _530 = _430 * 2.0;
    float _532 = _412 * 2.0;
    float _534 = _418 * 2.0;
    float _536 = _418 * _418;
    float _538 = _424 * _530;
    float _540 = _418 * _530;
    float _542 = _412 * _530;
    float _544 = -_538;
    float _546 = fma(_418, _532, _544);
    float _548 = fma(_418, _532, _538);
    float _550 = fma(_424, _532, _540);
    float _552 = -_540;
    float _554 = fma(_424, _532, _552);
    float _556 = -_542;
    float _558 = fma(_424, _534, _556);
    float _560 = fma(_424, _534, _542);
    float _562 = _418;
    float _564 = _540;
    float _566 = _492;
    float _568 = _486;
    if (!_528)
    {
        _562 = _492;
    }
    float _570 = _562;
    float _572 = _412 * _412;
    float _574 = _424 * _424;
    float _576 = _570;
    if (!_528)
    {
        _564 = _486;
    }
    float _578 = _564;
    float _580 = _578;
    if (!_528)
    {
        _566 = _514;
    }
    float _582 = _566;
    bool _584 = !_528;
    float _586 = _582;
    if (!_584)
    {
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _592 = _516 + _590;
        float _594 = rsqrt(_512);
        float _596 = _592 * _588;
        float _598 = _514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = _596 * 0.15915493667125701904296875;
        float _602 = _600 * 6.283185482025146484375;
        float _604 = cos(_602);
        float _606 = _600 * 6.283185482025146484375;
        float _608 = sin(_606);
        float _610 = _604 + (-1.0);
        float _612 = _610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = fma(_608, _598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _616 = fma(_514, _604, _612);
        float _618 = _594 * _614;
        float _620 = fma(_504, _618, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _622 = fma(_496, _618, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _586 = _616;
        _576 = _620;
        _580 = _622;
    }
    float _624 = _586;
    float _626 = _576;
    float _628 = _580;
    float _630 = -_510;
    float _632 = _630 + _624;
    float _634 = -_480;
    float _636 = _634 + _626;
    float _638 = fma(_572, -2.0, 1.0);
    float _640 = -_474;
    float _642 = _640 + _628;
    float _644 = _632 * _329;
    float _646 = _632 * _309;
    float _648 = _632 * _341;
    float _650 = fma(_536, -2.0, 1.0);
    float _652 = fma(_636, _325, _644);
    float _654 = fma(_574, -2.0, _638);
    float _656 = fma(_636, _303, _646);
    float _658 = fma(_636, _337, _648);
    float _660 = fma(_642, _333, _652);
    float _662 = fma(_574, -2.0, _650);
    float _664 = fma(_642, _313, _656);
    float _666 = fma(_536, -2.0, _638);
    float _668 = _660 * _546;
    float _670 = _660 * _654;
    float _672 = _660 * _560;
    float _674 = fma(_642, _347, _658);
    float _676 = fma(_664, _662, _668);
    float _678 = fma(_664, _548, _670);
    float _680 = fma(_664, _554, _672);
    float _682 = fma(_674, _550, _676);
    float _684 = fma(_674, _558, _678);
    float _686 = fma(_674, _666, _680);
    float _688 = _480 + _682;
    float _690 = _510 + _684;
    float _692 = _474 + _686;
    float _694 = _690;
    float _696 = _688;
    float _698 = _692;
    float _700 = _670;
    float _702 = _682;
    if (!_526)
    {
        float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _706 = _510 + _704;
        float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _710 = _480 + _708;
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _714 = _706 * _706;
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _718 = _474 + _716;
        float _720 = fma(_710, _710, _714);
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _724 = fma(_718, _718, _720);
        float _726 = sqrt(_724);
        float _728 = _712 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _730 = precise::min(_726, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _732 = _730 * _722;
        float _734 = _728 * _732;
        float _736 = fma(_682, _734, _480);
        float _738 = fma(_684, _734, _510);
        float _740 = fma(_686, _734, _474);
        _694 = _738;
        _696 = _736;
        _698 = _740;
        _700 = _732;
    }
    float _742 = _694;
    float _744 = _696;
    float _746 = _698;
    float _748 = _700;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _752 = _742 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _756 = _744 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _760 = _746 + _758;
    float _762 = _752 * _752;
    float _764 = fma(_756, _756, _762);
    float _766 = fma(_760, _760, _764);
    float _768 = rsqrt(_766);
    float _770 = sqrt(_766);
    float _772 = _768 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _774 = _756 * _772;
    float _776 = _760 * _772;
    float _778 = _774 * _774;
    float _780 = _776 * _776;
    float _782 = _778 + _780;
    float _784 = sqrt(_782);
    bool _786 = _784 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = _784 + _788;
    float _792 = _768;
    float _794 = _782;
    float _796 = _790;
    float _798 = _772;
    float _800 = _752;
    if (_786)
    {
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _792 = _802;
    }
    float _804 = _792;
    if (_786)
    {
        float _806 = rsqrt(_782);
        _794 = _806;
    }
    float _808 = _794;
    float _810 = _808;
    if (_786)
    {
        float _812 = _790 * _804;
        _796 = _812;
    }
    float _814 = _796;
    if (_786)
    {
        float _816 = _814 * 0.15915493667125701904296875;
        _702 = _816;
    }
    float _818 = _702;
    float _820 = _748;
    if (_786)
    {
        float _822 = _818 * 6.283185482025146484375;
        float _824 = sin(_822);
        _820 = _824;
    }
    float _826 = _820;
    float _828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _830 = precise::max(0.0, _828);
    float _832 = _760;
    float _834 = _828;
    float _836 = _830;
    if (_786)
    {
        float _838 = _818 * 6.283185482025146484375;
        float _840 = cos(_838);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = -_772;
    float _846 = -_830;
    float _848 = fma(_752, _844, _846);
    if (_786)
    {
        float _850 = _848 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _850;
    }
    float _852 = _834;
    float _854 = _826;
    if (_786)
    {
        float _856 = fma(_826, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _798 = _856;
    }
    float _858 = _798;
    float _860 = _858;
    if (!_786)
    {
        _854 = _848;
    }
    float _862 = _854;
    float _864 = _862;
    float _866 = _842;
    if (_786)
    {
        float _868 = _842 + (-1.0);
        _800 = _868;
    }
    float _870 = _800;
    float _872 = _870;
    if (_786)
    {
        float _874 = _808 * _858;
        _568 = _874;
    }
    float _876 = _568;
    if (!_786)
    {
        _810 = _776;
    }
    float _878 = _810;
    float _880 = _878;
    if (_786)
    {
        float _882 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _836 = _882;
    }
    float _884 = _836;
    if (!_786)
    {
        _872 = _774;
    }
    float _886 = _872;
    float _888 = _886;
    if (_786)
    {
        float _890 = _774 * _876;
        _888 = _890;
    }
    float _892 = _888;
    if (_786)
    {
        float _894 = _776 * _876;
        _880 = _894;
    }
    float _896 = _880;
    if (_786)
    {
        float _898 = fma(_848, _842, _884);
        _864 = _898;
    }
    float _900 = _864;
    if (!_786)
    {
        _866 = _778;
    }
    float _902 = _866;
    float _904 = _902;
    if (_786)
    {
        float _906 = _892 * _892;
        _904 = _906;
    }
    float _908 = _904;
    if (!_786)
    {
        _860 = _780;
    }
    float _910 = _860;
    float _912 = _910;
    if (_786)
    {
        float _914 = _896 * _896;
        _912 = _914;
    }
    float _916 = _912;
    float _918 = fma(_900, _900, _908);
    float _920 = _742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _922 = _742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = fma(_480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _926 = _918 + _916;
    float _928 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _920);
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _932 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[23].w, _930);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _938 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _928);
    float _940 = rsqrt(_926);
    float _942 = -_934;
    float _944 = _942 + 1.0;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _948 = _938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _950 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _936);
    float _952 = _742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _956 = abs(_944);
    float _958 = log2(_956);
    float _960 = _950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _962 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _964 = -_954;
    float _966 = fma(_964, _946, 1.0);
    float _968 = _742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _970 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _952);
    float _972 = _940 * _892;
    float _974 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _968);
    float _976 = _940 * _900;
    float _978 = floor(_924);
    float _980 = _972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _982 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _974);
    float _984 = _940 * _896;
    float _986 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _970);
    float _988 = -_980;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _988);
    float _992 = _982 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _994 = _960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _996 = floor(_962);
    float _998 = -_984;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _990);
    float _1002 = _958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _994);
    float _1006 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1008 = _960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1010 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1004);
    float _1012 = log2(_966);
    float _1014 = -_978;
    float _1016 = _924 + _1014;
    float _1018 = _960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1020 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    float _1022 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1018);
    float _1024 = _976 + 1.0;
    float _1026 = exp2(_1002);
    float _1028 = fma(_1000, -0.5, 0.5);
    float _1030 = fma(_1000, 0.5, 0.5);
    float _1032 = -_996;
    float _1034 = _962 + _1032;
    float _1036 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1008);
    float _1038 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1022);
    float _1040 = fma(_1030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1042 = sqrt(_1028);
    float _1044 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1046 = fma(_1030, _1040, -0.212114393711090087890625);
    float _1048 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1038);
    float _1050 = _1012 * 0.693147182464599609375;
    float _1052 = fma(_1030, _1046, 1.570728778839111328125);
    float _1054 = 1.0 / _1020;
    float _1056 = -_976;
    float _1058 = fma(_1026, _1024, _1056);
    float _1060 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1044);
    float2 _3502 = float2(_1016, _1034);
    float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3502, float2(0.0), isnan(_3502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3502, float2(0.0), isnan(_3502)), level(0.0)).x;
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1066 = fma(_1058, 0.5, 0.5);
    float _1068 = _1042 * 0.636619746685028076171875;
    float _1070 = -_1052;
    float _1072 = fma(_1068, _1070, 1.0);
    float _1074 = _1048 * _1054;
    float _1076 = _1060 * _1054;
    float _1078 = fma(_1074, 0.5, 0.5);
    float _1080 = fma(_1076, -0.5, 0.5);
    float3 _3537 = float3(_1078, _1080, _1064);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3537, float3(0.0), isnan(_3537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3537, float3(0.0), isnan(_3537)), level(0.0)).x;
    float3 _3548 = float3(_1078, _1080, _1064);
    float4 _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3548, float3(0.0), isnan(_3548)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3548, float3(0.0), isnan(_3548)), level(0.0)).xyzw;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = _1085.w;
    float2 _3564 = float2(_1072, _1066);
    float3 _1097 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3564, float2(0.0), isnan(_3564)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3564, float2(0.0), isnan(_3564)), level(0.0)).xyz;
    float _1099 = _1097.x;
    float _1101 = _1097.y;
    float _1103 = _1097.z;
    float _1105 = in.m_66.y;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1109 = _375 + _1107;
    float _1111 = in.m_74.y;
    float _1113 = _958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1117 = _1115 != 0;
    float _1119 = _510 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = in.m_74.x;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1125 = _1123 != 0;
    float _1127 = exp2(_1113);
    bool _1129 = _191 > 0.5;
    bool _1131 = _1129 && _1117;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1143 = _1105 > 0.5;
    float _1145 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1137);
    float _1147 = 1.0 / _1141;
    float _1149 = -_1111;
    float _1151 = _1149 + 1.0;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = _510 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1161 = _1111;
    float _1163 = _1060;
    if (_1125)
    {
        float _1165 = _1143 ? _1151 : _1111;
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = 1.0 / _1153;
    float _1173 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1159);
    float _1175 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1177 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1173);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1183 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1185);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1189);
    float _1193 = _1183 + _1153;
    float _1195 = 1.0 / _1135;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1205 = _1193 * _1171;
    float _1207 = _1205 * 0.5;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1203 * _1147;
    float _1215 = 1.0 / _1181;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1217);
    float _1221 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1225 = _375 + _1223;
    bool _1227 = _393 != 0.0;
    bool _1229 = isnan(_393);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.0);
    bool _1235 = _1231 || _1233;
    float _1237 = -_1127;
    float _1239 = _1237 + 1.0;
    out.m_78.x = _1211;
    out.m_78.y = _1169;
    out.m_78.z = _1221;
    float _1241 = 1.0 / _1219;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1243;
    float _1247 = _1199 * _1195;
    float _1249 = in.m_80.x;
    float _1251 = in.m_80.y;
    float _1253 = in.m_80.z;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _375 + _1255;
    bool _1259 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1261 = isnan(_375);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = fma(_1213, _1225, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1273 = _391 == 0.0;
    bool _1275 = !_1235;
    bool _1277 = _1273 && _1275;
    float _1279 = _1245 * _1215;
    float _1281 = fma(_1247, _1257, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1283 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1285 = isnan(_375);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -_1269;
    float _1297 = _1295 + 1.0;
    bool _1299 = _395 == 0.0;
    bool _1301 = _1299 && _1277;
    float _1303 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1305 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1307 = isnan(_375);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = _1293 * _1297;
    float _1319 = -_1293;
    float _1321 = _1319 + 1.0;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1325 = _1241 * _1323;
    float _1327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1329 = _1121;
    if (_1117)
    {
        _1327 = _1121;
    }
    float _1331 = _1327;
    float _1333 = -_1315;
    float _1335 = _1333 + 1.0;
    float _1337 = _1315 * _1321;
    bool _1339 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1341 = isnan(_375);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = abs(_1325);
    float _1353 = log2(_1351);
    float _1355 = _1331;
    if (_1131)
    {
        float _1357 = -_1331;
        float _1359 = _1357 + 1.0;
        _1355 = _1359;
    }
    float _1361 = _1355;
    float _1363 = fma(_1279, _1109, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1365 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1367 = _1349 * _1335;
    float _1369 = _1249;
    float _1371 = _1251;
    float _1373 = _1253;
    if (!_1301)
    {
        float _1375 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1249);
        _1369 = _1375;
    }
    float _1377 = _1369;
    if (!_1301)
    {
        float _1379 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1251);
        _1371 = _1379;
    }
    float _1381 = _1371;
    if (!_1301)
    {
        float _1383 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1253);
        _1373 = _1383;
    }
    float _1385 = _1373;
    bool _1387 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1389 = isnan(0.0);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1395 = _1391 || _1393;
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1117)
    {
        _1329 = _1361;
    }
    float _1399 = _1329;
    float _1401 = _325 * _1381;
    float _1403 = _329 * _1381;
    float _1405 = _333 * _1381;
    float _1407 = _1281 * _1367;
    float _1409 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1187);
    float _1411 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1415 = fma(_313, _1377, _1405);
    float _1417 = _474 + _1365;
    float _1419 = fma(_303, _1377, _1401);
    if (_1395)
    {
        float _1421 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _317 = _1421;
    }
    float _1423 = _317;
    int _1425 = _281 + 8;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[int(_1429)][_1431];
    float _1435 = fma(_309, _1377, _1403);
    float _1437 = _480 + _1409;
    float _1439 = exp2(_1411);
    float _1441 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1443 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1395)
    {
        float _1445 = precise::min(_1423, 20.0);
        _305 = _1445;
    }
    float _1447 = _305;
    float _1449 = -_1437;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1453 = -_1417;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1457 = fma(_337, _1385, _1419);
    float _1459 = _960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1461 = _1441 * _1413;
    float _1463 = _1443 * _1397;
    float _1465 = -_1349;
    float _1467 = _1465 + 1.0;
    float _1469 = precise::min(_1437, _1451);
    float _1471 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1459);
    out.m_82.x = _1463;
    out.m_82.y = _1461;
    float _1473 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = precise::min(_1417, _1455);
    uint _1479 = uint(int(uint(_281) >> uint(2)));
    uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
    int _1483 = int(_1479) & 3;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[int(_1481)][_1483];
    int _1487 = int(_1479) + 1;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    int _1491 = _1487 & 3;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[int(_1489)][_1491];
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1407);
    float _1497 = _1475 * _1475;
    float _1499 = precise::min(_1469, _1477);
    float _1501 = in.m_84.x;
    float _1503 = fma(_1271, _1337, _1495);
    float _1505 = fma(_1475, -2.0, 3.0);
    float _1507 = fma(_341, _1385, _1435);
    float _1509 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1471);
    bool _1511 = _1325 <= 8000.0;
    bool _1513 = isnan(_1325);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(8000.0);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = _1497 * _1505;
    float _1525 = _1507 * _546;
    float _1527 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1529 = _1507 * _654;
    float _1531 = -_1523;
    float _1533 = _1531 + 1.0;
    float _1535 = _1507 * _560;
    float _1537 = fma(_1363, _1317, _1503);
    float _1539 = fma(_347, _1385, _1415);
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1523);
    float _1543 = fma(_1457, _662, _1525);
    float _1545 = _1527 + _1020;
    float _1547 = fma(_1457, _548, _1529);
    float _1549 = fma(_1457, _554, _1535);
    float _1551 = _1521 * _1541;
    float _1553 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1537);
    float _1555 = _1545 * 0.5;
    float _1557 = fma(_1539, _550, _1543);
    float _1559 = fma(_1539, _558, _1547);
    float _1561 = fma(_1539, _666, _1549);
    float _1563 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1565 = _1271;
    if (_1395)
    {
        float _1567 = 1.0 / _1447;
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = _1433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_86.x = _1557;
    out.m_86.y = _1559;
    out.m_86.z = _1561;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1048;
    float _1577 = _1573;
    if (!_1395)
    {
        _343 = 1.0;
    }
    float _1579 = _343;
    float _1581 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1048;
    out.gl_Position.y = _1060;
    out.gl_Position.z = _1527;
    out.gl_Position.w = _1020;
    out.m_88.z = _1555;
    out.m_88.w = _1020;
    float _1583 = _1579;
    float _1585 = _1581;
    if (_1395)
    {
        float _1587 = _1499 * _1569;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        _1583 = _1589;
    }
    float _1591 = _1583;
    bool _1593 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1595 = isnan(_770);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1601 = _1597 || _1599;
    float _1603 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1605 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1607 = _1591 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1609 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_90.x = _1609;
    out.m_90.y = _1611;
    out.m_90.z = _1573;
    out.m_90.w = _1581;
    float _1613 = _1611;
    float _1615 = _1609;
    if (!_1601)
    {
        _1163 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1617 = _1163;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1601)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1623 = _1575;
    float _1625 = _1623;
    float _1627 = _1623;
    if (!_1601)
    {
        _1585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1629 = _1585;
    float _1631 = _1629;
    float _1633 = _1629;
    if (!_1601)
    {
        _1577 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1635 = _1577;
    float _1637 = _1635;
    float _1639 = _1635;
    if (!_1601)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1641 = _1613;
    float _1643 = _1641;
    float _1645 = _1641;
    if (!_1601)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1647 = _1615;
    float _1649 = -_1062;
    float _1651 = _1649 + 1.0;
    float _1653 = _1651 * _1563;
    float _1655 = precise::clamp(_1653, 0.0, 1.0);
    float _1657 = -_1655;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1661 = _1659 * _1501;
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _1663;
    float _1665 = _1303 * _1082;
    float _1667 = -_1303;
    float _1669 = _1667 + 1.0;
    float _1671 = _1093 * _1665;
    float _1673 = _1103 * _1665;
    float _1675 = _1093 * _1669;
    float _1677 = fma(_1099, _1671, _1087);
    float _1679 = fma(_1101, _1671, _1089);
    float _1681 = fma(_1093, _1673, _1091);
    out.m_94.x = _1677;
    out.m_94.y = _1679;
    out.m_94.z = _1681;
    out.m_94.w = _1675;
    bool _1683 = !_1601;
    float _1685 = _1647;
    float _1687 = _1647;
    if (!_1683)
    {
        bool _1689 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1691 = isnan(_770);
        bool _1693 = _1689 || _1691;
        bool _1695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1697 = _1693 || _1695;
        if (!_1697)
        {
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1701 = _770 + _1699;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1705 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1711 = 1.0 / _1705;
            float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1729 = _1701 * _1711;
            float _1731 = precise::clamp(_1729, 0.0, 1.0);
            float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1735 = _1733 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1737 = fma(_1731, _1709, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1739 = fma(_1731, _1735, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1741 = fma(_1731, _1715, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1743 = fma(_1731, _1719, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1745 = fma(_1731, _1723, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1747 = fma(_1731, _1727, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1627 = _1741;
            _1645 = _1745;
            _1621 = _1737;
            _1639 = _1743;
            _1633 = _1739;
            _1687 = _1747;
            _1749 = true;
        }
        else
        {
            bool _1751 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1753 = isnan(_770);
            bool _1755 = _1751 || _1753;
            bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1759 = _1755 || _1757;
            if (!_1759)
            {
                _1619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1761 = _1619;
            _1621 = _1761;
            if (!_1759)
            {
                _1625 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1763 = _1625;
            _1627 = _1763;
            if (!_1759)
            {
                _1631 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1765 = _1631;
            _1633 = _1765;
            if (!_1759)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1767 = _1637;
            _1639 = _1767;
            if (!_1759)
            {
                _1643 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1769 = _1643;
            _1645 = _1769;
            if (!_1759)
            {
                _1685 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1771 = _1685;
            bool _1773 = !_1759;
            _1687 = _1771;
            if (!_1773)
            {
                bool _1775 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1777 = isnan(_770);
                bool _1779 = _1775 || _1777;
                bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1783 = _1779 || _1781;
                if (!_1783)
                {
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1787 = _770 + _1785;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1789;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1797 = 1.0 / _1791;
                    float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1815 = _1787 * _1797;
                    float _1817 = precise::clamp(_1815, 0.0, 1.0);
                    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1823 = fma(_1817, _1795, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1825 = fma(_1817, _1821, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1827 = fma(_1817, _1801, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1829 = fma(_1817, _1805, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1831 = fma(_1817, _1809, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1833 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1627 = _1827;
                    _1645 = _1831;
                    _1621 = _1823;
                    _1639 = _1829;
                    _1633 = _1825;
                    _1687 = _1833;
                    _1749 = true;
                }
                else
                {
                    _1627 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1645 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1633 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1687 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1749 = false;
    float _1835 = _1627;
    float _1837 = _1645;
    float _1839 = _1621;
    float _1841 = _1639;
    float _1843 = _1633;
    float _1845 = _1687;
    float _1847 = fma(_1559, -0.5, 0.5);
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = -_1835;
    float _1853 = _1851 + _1837;
    float _1855 = -_1839;
    float _1857 = _1855 + _1841;
    float _1859 = -_1843;
    float _1861 = _1859 + _1845;
    bool _1863 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1865 = fma(_1849, _1853, _1835);
    float _1867 = fma(_1849, _1857, _1839);
    float _1869 = fma(_1849, _1861, _1843);
    float _1871 = _1607 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1873 = _1865 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _1875 = fma(_1867, 0.298911988735198974609375, _1873);
    out.m_56.x = _1871;
    float _1877 = fma(_1869, 0.114477999508380889892578125, _1875);
    float _1879 = -_1877;
    float _1881 = _1867 + _1879;
    float _1883 = -_1877;
    float _1885 = _1865 + _1883;
    float _1887 = -_1877;
    float _1889 = _1869 + _1887;
    float _1891 = fma(_1881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    float _1893 = fma(_1885, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    float _1895 = fma(_1889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    out.m_98.x = _1891;
    out.m_98.y = _1893;
    out.m_98.z = _1895;
    if (!_1863)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1897 = -_742;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1901 = -_744;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1905 = -_746;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1909 = _1899 * _1899;
    float _1911 = fma(_1903, _1903, _1909);
    float _1913 = fma(_1907, _1907, _1911);
    float _1915 = sqrt(_1913);
    float _1917 = rsqrt(_1913);
    float _1919 = -_1915;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = _1903 * _1917;
    float _1929 = _1899 * _1917;
    float _1931 = abs(_1925);
    float _1933 = log2(_1931);
    float _1935 = _1907 * _1917;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1939 = _1559 * _1929;
    float _1941 = -_1929;
    float _1943 = -_1937;
    float _1945 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1943);
    float _1947 = fma(_1557, _1927, _1939);
    float _1949 = -_1935;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1945);
    float _1953 = fma(_1561, _1935, _1947);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1959 = _1951 + _1957;
    float _1961 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = exp2(_1961);
    float _1969 = _1967 * _1965;
    float _1971 = _1955 * _1969;
    float _1973 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1973;
    out.m_96.y = _1975;
    out.m_96.z = _1977;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1749 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_53.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_56.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_133);
        out.gl_Position.z = _2034;
    }
    if (!_121)
    {
        return out;
    }
    float _137 = in.m_58.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_147)
    {
        float _153 = float(_117);
        _127 = _153;
    }
    float _155 = _127;
    bool _157 = _151 >= _155;
    bool _159 = !_147;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_56.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_169);
        out.gl_Position.z = _2103;
    }
    if (_161)
    {
        return out;
    }
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = _171 * _171;
    float _195 = _173 * _173;
    float _197 = _175 * _175;
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = sqrt(_205);
    float _213 = _177 * _191;
    float _215 = sqrt(_207);
    float _217 = sqrt(_209);
    bool _219 = _211 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = trunc(_213);
    int _225 = int(_223);
    float _227 = 0.0;
    float _229 = _215;
    if (!_219)
    {
        _227 = 0.0;
    }
    float _231 = _227;
    bool _233 = _217 > 0.0;
    float _235 = _205;
    float _237 = _217;
    float _239 = _231;
    if (_219)
    {
        float _241 = rsqrt(_205);
        _235 = _241;
    }
    float _243 = _235;
    float _245 = 0.0;
    if (!_219)
    {
        _245 = 0.0;
    }
    float _247 = _245;
    float _249 = 0.0;
    float _251 = _247;
    if (!_219)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = _253;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _259 = _255;
    float _261 = 0.0;
    float _263 = _259;
    if (!_221)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (_221)
    {
        float _271 = rsqrt(_207);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = 0.0;
    if (!_221)
    {
        _275 = 0.0;
    }
    float _277 = _275;
    int _279 = _225 << 4;
    int _281 = _279 + 1712;
    float _283 = 0.0;
    float _285 = _277;
    if (!_233)
    {
        _283 = 0.0;
    }
    float _287 = _283;
    float _289 = _287;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _291 = _237;
    float _293 = _211;
    float _295 = _291;
    if (_233)
    {
        float _297 = rsqrt(_209);
        _293 = _297;
    }
    float _299 = _293;
    if (_219)
    {
        float _301 = _243 * _179;
        _239 = _301;
    }
    float _303 = _239;
    float _305 = _303;
    if (_219)
    {
        float _307 = _243 * _171;
        _251 = _307;
    }
    float _309 = _251;
    if (_219)
    {
        float _311 = _243 * _185;
        _257 = _311;
    }
    float _313 = _257;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _317 = _313;
    if (!_233)
    {
        _229 = 0.0;
    }
    float _319 = _229;
    float _321 = _319;
    if (_221)
    {
        float _323 = _273 * _181;
        _263 = _323;
    }
    float _325 = _263;
    if (_221)
    {
        float _327 = _273 * _173;
        _269 = _327;
    }
    float _329 = _269;
    if (_221)
    {
        float _331 = _273 * _187;
        _285 = _331;
    }
    float _333 = _285;
    if (_233)
    {
        float _335 = _299 * _183;
        _289 = _335;
    }
    float _337 = _289;
    if (_233)
    {
        float _339 = _299 * _175;
        _295 = _339;
    }
    float _341 = _295;
    float _343 = _341;
    if (_233)
    {
        float _345 = _299 * _189;
        _321 = _345;
    }
    float _347 = _321;
    bool _349 = !_315;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _353 = _191 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_117);
        float _371 = 1.0 / _369;
        float _373 = _151 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = in.m_68.w;
    float _379 = in.m_53.x;
    float _381 = in.m_53.y;
    float _383 = in.m_53.z;
    float _385 = in.m_70.x;
    float _387 = in.m_70.y;
    float _389 = in.m_70.z;
    float _391 = in.m_72.x;
    float _393 = in.m_72.y;
    float _395 = in.m_72.z;
    float _397 = in.m_64.w;
    float _399 = in.m_62.w;
    float _401 = trunc(_377);
    int _403 = int(_401);
    float _405 = in.m_60.w;
    int _407 = _403 << 5;
    uint _410 = uint(int(uint(_407) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_410)];
    float _412 = as_type<float>(_dmw0.x);
    int _414 = _407 + 4;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    float _418 = as_type<float>(_dmw0.y);
    int _420 = _407 + 8;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>(_dmw0.z);
    int _426 = _407 + 12;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    float _430 = as_type<float>(_dmw0.w);
    float _432 = _187 * _381;
    float _434 = _387 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _440 = fma(_185, _379, _432);
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _393);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _448 = _389 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _450 = _181 * _381;
    float _452 = _444 * _442;
    float _454 = _446 * _438;
    float _456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _395);
    float _458 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _460 = _452 * _333;
    float _462 = fma(_179, _379, _450);
    float _464 = fma(_189, _383, _440);
    float _466 = _458 * _456;
    float _468 = _452 * _325;
    float _470 = fma(_454, _313, _460);
    float _472 = fma(_183, _383, _462);
    float _474 = _464 + _397;
    float _476 = fma(_454, _303, _468);
    float _478 = fma(_466, _347, _470);
    float _480 = _472 + _399;
    float _482 = _173 * _381;
    float _484 = fma(_466, _337, _476);
    float _486 = _474 + _478;
    float _488 = _452 * _329;
    float _490 = fma(_171, _379, _482);
    float _492 = _480 + _484;
    float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _496 = _486 + _494;
    float _498 = fma(_454, _309, _488);
    float _500 = fma(_175, _383, _490);
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_466, _341, _498);
    float _510 = _500 + _405;
    float _512 = fma(_504, _504, _506);
    float _514 = _510 + _508;
    float _516 = sqrt(_512);
    bool _518 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _520 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.5);
    bool _526 = _522 || _524;
    bool _528 = _516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _530 = _430 * 2.0;
    float _532 = _412 * 2.0;
    float _534 = _418 * 2.0;
    float _536 = _418 * _418;
    float _538 = _424 * _530;
    float _540 = _418 * _530;
    float _542 = _412 * _530;
    float _544 = -_538;
    float _546 = fma(_418, _532, _544);
    float _548 = fma(_418, _532, _538);
    float _550 = fma(_424, _532, _540);
    float _552 = -_540;
    float _554 = fma(_424, _532, _552);
    float _556 = -_542;
    float _558 = fma(_424, _534, _556);
    float _560 = fma(_424, _534, _542);
    float _562 = _418;
    float _564 = _540;
    float _566 = _492;
    float _568 = _486;
    if (!_528)
    {
        _562 = _492;
    }
    float _570 = _562;
    float _572 = _412 * _412;
    float _574 = _424 * _424;
    float _576 = _570;
    if (!_528)
    {
        _564 = _486;
    }
    float _578 = _564;
    float _580 = _578;
    if (!_528)
    {
        _566 = _514;
    }
    float _582 = _566;
    bool _584 = !_528;
    float _586 = _582;
    if (!_584)
    {
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _592 = _516 + _590;
        float _594 = rsqrt(_512);
        float _596 = _592 * _588;
        float _598 = _514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = _596 * 0.15915493667125701904296875;
        float _602 = _600 * 6.283185482025146484375;
        float _604 = cos(_602);
        float _606 = _600 * 6.283185482025146484375;
        float _608 = sin(_606);
        float _610 = _604 + (-1.0);
        float _612 = _610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = fma(_608, _598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _616 = fma(_514, _604, _612);
        float _618 = _594 * _614;
        float _620 = fma(_504, _618, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _622 = fma(_496, _618, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _586 = _616;
        _576 = _620;
        _580 = _622;
    }
    float _624 = _586;
    float _626 = _576;
    float _628 = _580;
    float _630 = -_510;
    float _632 = _630 + _624;
    float _634 = -_480;
    float _636 = _634 + _626;
    float _638 = fma(_572, -2.0, 1.0);
    float _640 = -_474;
    float _642 = _640 + _628;
    float _644 = _632 * _329;
    float _646 = _632 * _309;
    float _648 = _632 * _341;
    float _650 = fma(_536, -2.0, 1.0);
    float _652 = fma(_636, _325, _644);
    float _654 = fma(_574, -2.0, _638);
    float _656 = fma(_636, _303, _646);
    float _658 = fma(_636, _337, _648);
    float _660 = fma(_642, _333, _652);
    float _662 = fma(_574, -2.0, _650);
    float _664 = fma(_642, _313, _656);
    float _666 = fma(_536, -2.0, _638);
    float _668 = _660 * _546;
    float _670 = _660 * _654;
    float _672 = _660 * _560;
    float _674 = fma(_642, _347, _658);
    float _676 = fma(_664, _662, _668);
    float _678 = fma(_664, _548, _670);
    float _680 = fma(_664, _554, _672);
    float _682 = fma(_674, _550, _676);
    float _684 = fma(_674, _558, _678);
    float _686 = fma(_674, _666, _680);
    float _688 = _480 + _682;
    float _690 = _510 + _684;
    float _692 = _474 + _686;
    float _694 = _690;
    float _696 = _688;
    float _698 = _692;
    float _700 = _670;
    float _702 = _682;
    if (!_526)
    {
        float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _706 = _510 + _704;
        float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _710 = _480 + _708;
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _714 = _706 * _706;
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _718 = _474 + _716;
        float _720 = fma(_710, _710, _714);
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _724 = fma(_718, _718, _720);
        float _726 = sqrt(_724);
        float _728 = _712 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _730 = precise::min(_726, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _732 = _730 * _722;
        float _734 = _728 * _732;
        float _736 = fma(_682, _734, _480);
        float _738 = fma(_684, _734, _510);
        float _740 = fma(_686, _734, _474);
        _694 = _738;
        _696 = _736;
        _698 = _740;
        _700 = _732;
    }
    float _742 = _694;
    float _744 = _696;
    float _746 = _698;
    float _748 = _700;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _752 = _742 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _756 = _744 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _760 = _746 + _758;
    float _762 = _752 * _752;
    float _764 = fma(_756, _756, _762);
    float _766 = fma(_760, _760, _764);
    float _768 = rsqrt(_766);
    float _770 = sqrt(_766);
    float _772 = _768 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _774 = _756 * _772;
    float _776 = _760 * _772;
    float _778 = _774 * _774;
    float _780 = _776 * _776;
    float _782 = _778 + _780;
    float _784 = sqrt(_782);
    bool _786 = _784 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = _784 + _788;
    float _792 = _768;
    float _794 = _782;
    float _796 = _790;
    float _798 = _772;
    float _800 = _752;
    if (_786)
    {
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _792 = _802;
    }
    float _804 = _792;
    if (_786)
    {
        float _806 = rsqrt(_782);
        _794 = _806;
    }
    float _808 = _794;
    float _810 = _808;
    if (_786)
    {
        float _812 = _790 * _804;
        _796 = _812;
    }
    float _814 = _796;
    if (_786)
    {
        float _816 = _814 * 0.15915493667125701904296875;
        _702 = _816;
    }
    float _818 = _702;
    float _820 = _748;
    if (_786)
    {
        float _822 = _818 * 6.283185482025146484375;
        float _824 = sin(_822);
        _820 = _824;
    }
    float _826 = _820;
    float _828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _830 = precise::max(0.0, _828);
    float _832 = _760;
    float _834 = _828;
    float _836 = _830;
    if (_786)
    {
        float _838 = _818 * 6.283185482025146484375;
        float _840 = cos(_838);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = -_772;
    float _846 = -_830;
    float _848 = fma(_752, _844, _846);
    if (_786)
    {
        float _850 = _848 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _850;
    }
    float _852 = _834;
    float _854 = _826;
    if (_786)
    {
        float _856 = fma(_826, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _798 = _856;
    }
    float _858 = _798;
    float _860 = _858;
    if (!_786)
    {
        _854 = _848;
    }
    float _862 = _854;
    float _864 = _862;
    float _866 = _842;
    if (_786)
    {
        float _868 = _842 + (-1.0);
        _800 = _868;
    }
    float _870 = _800;
    float _872 = _870;
    if (_786)
    {
        float _874 = _808 * _858;
        _568 = _874;
    }
    float _876 = _568;
    if (!_786)
    {
        _810 = _776;
    }
    float _878 = _810;
    float _880 = _878;
    if (_786)
    {
        float _882 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _836 = _882;
    }
    float _884 = _836;
    if (!_786)
    {
        _872 = _774;
    }
    float _886 = _872;
    float _888 = _886;
    if (_786)
    {
        float _890 = _774 * _876;
        _888 = _890;
    }
    float _892 = _888;
    if (_786)
    {
        float _894 = _776 * _876;
        _880 = _894;
    }
    float _896 = _880;
    if (_786)
    {
        float _898 = fma(_848, _842, _884);
        _864 = _898;
    }
    float _900 = _864;
    if (!_786)
    {
        _866 = _778;
    }
    float _902 = _866;
    float _904 = _902;
    if (_786)
    {
        float _906 = _892 * _892;
        _904 = _906;
    }
    float _908 = _904;
    if (!_786)
    {
        _860 = _780;
    }
    float _910 = _860;
    float _912 = _910;
    if (_786)
    {
        float _914 = _896 * _896;
        _912 = _914;
    }
    float _916 = _912;
    float _918 = fma(_900, _900, _908);
    float _920 = _742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _922 = _742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = fma(_480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _926 = _918 + _916;
    float _928 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _920);
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _932 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[23].w, _930);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _938 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _928);
    float _940 = rsqrt(_926);
    float _942 = -_934;
    float _944 = _942 + 1.0;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _948 = _938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _950 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _936);
    float _952 = _742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _956 = abs(_944);
    float _958 = log2(_956);
    float _960 = _950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _962 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _964 = -_954;
    float _966 = fma(_964, _946, 1.0);
    float _968 = _742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _970 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _952);
    float _972 = _940 * _892;
    float _974 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _968);
    float _976 = _940 * _900;
    float _978 = floor(_924);
    float _980 = _972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _982 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _974);
    float _984 = _940 * _896;
    float _986 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _970);
    float _988 = -_980;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _988);
    float _992 = _982 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _994 = _960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _996 = floor(_962);
    float _998 = -_984;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _990);
    float _1002 = _958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _994);
    float _1006 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1008 = _960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1010 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1004);
    float _1012 = log2(_966);
    float _1014 = -_978;
    float _1016 = _924 + _1014;
    float _1018 = _960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1020 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    float _1022 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1018);
    float _1024 = _976 + 1.0;
    float _1026 = exp2(_1002);
    float _1028 = fma(_1000, -0.5, 0.5);
    float _1030 = fma(_1000, 0.5, 0.5);
    float _1032 = -_996;
    float _1034 = _962 + _1032;
    float _1036 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1008);
    float _1038 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1022);
    float _1040 = fma(_1030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1042 = sqrt(_1028);
    float _1044 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1046 = fma(_1030, _1040, -0.212114393711090087890625);
    float _1048 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1038);
    float _1050 = _1012 * 0.693147182464599609375;
    float _1052 = fma(_1030, _1046, 1.570728778839111328125);
    float _1054 = 1.0 / _1020;
    float _1056 = -_976;
    float _1058 = fma(_1026, _1024, _1056);
    float _1060 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1044);
    float2 _3502 = float2(_1016, _1034);
    float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3502, float2(0.0), isnan(_3502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3502, float2(0.0), isnan(_3502)), level(0.0)).x;
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1066 = fma(_1058, 0.5, 0.5);
    float _1068 = _1042 * 0.636619746685028076171875;
    float _1070 = -_1052;
    float _1072 = fma(_1068, _1070, 1.0);
    float _1074 = _1048 * _1054;
    float _1076 = _1060 * _1054;
    float _1078 = fma(_1074, 0.5, 0.5);
    float _1080 = fma(_1076, -0.5, 0.5);
    float3 _3537 = float3(_1078, _1080, _1064);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3537, float3(0.0), isnan(_3537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3537, float3(0.0), isnan(_3537)), level(0.0)).x;
    float3 _3548 = float3(_1078, _1080, _1064);
    float4 _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3548, float3(0.0), isnan(_3548)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3548, float3(0.0), isnan(_3548)), level(0.0)).xyzw;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = _1085.w;
    float2 _3564 = float2(_1072, _1066);
    float3 _1097 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3564, float2(0.0), isnan(_3564)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3564, float2(0.0), isnan(_3564)), level(0.0)).xyz;
    float _1099 = _1097.x;
    float _1101 = _1097.y;
    float _1103 = _1097.z;
    float _1105 = in.m_66.y;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1109 = _375 + _1107;
    float _1111 = in.m_74.y;
    float _1113 = _958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1117 = _1115 != 0;
    float _1119 = _510 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = in.m_74.x;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1125 = _1123 != 0;
    float _1127 = exp2(_1113);
    bool _1129 = _191 > 0.5;
    bool _1131 = _1129 && _1117;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1143 = _1105 > 0.5;
    float _1145 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1137);
    float _1147 = 1.0 / _1141;
    float _1149 = -_1111;
    float _1151 = _1149 + 1.0;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = _510 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1161 = _1111;
    float _1163 = _1060;
    if (_1125)
    {
        float _1165 = _1143 ? _1151 : _1111;
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = 1.0 / _1153;
    float _1173 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1159);
    float _1175 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1177 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1173);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1183 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1185);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1189);
    float _1193 = _1183 + _1153;
    float _1195 = 1.0 / _1135;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1205 = _1193 * _1171;
    float _1207 = _1205 * 0.5;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1203 * _1147;
    float _1215 = 1.0 / _1181;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1217);
    float _1221 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1225 = _375 + _1223;
    bool _1227 = _393 != 0.0;
    bool _1229 = isnan(_393);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.0);
    bool _1235 = _1231 || _1233;
    float _1237 = -_1127;
    float _1239 = _1237 + 1.0;
    out.m_78.x = _1211;
    out.m_78.y = _1169;
    out.m_78.z = _1221;
    float _1241 = 1.0 / _1219;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1243;
    float _1247 = _1199 * _1195;
    float _1249 = in.m_80.x;
    float _1251 = in.m_80.y;
    float _1253 = in.m_80.z;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _375 + _1255;
    bool _1259 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1261 = isnan(_375);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = fma(_1213, _1225, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1273 = _391 == 0.0;
    bool _1275 = !_1235;
    bool _1277 = _1273 && _1275;
    float _1279 = _1245 * _1215;
    float _1281 = fma(_1247, _1257, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1283 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1285 = isnan(_375);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -_1269;
    float _1297 = _1295 + 1.0;
    bool _1299 = _395 == 0.0;
    bool _1301 = _1299 && _1277;
    float _1303 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1305 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1307 = isnan(_375);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = _1293 * _1297;
    float _1319 = -_1293;
    float _1321 = _1319 + 1.0;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1325 = _1241 * _1323;
    float _1327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1329 = _1121;
    if (_1117)
    {
        _1327 = _1121;
    }
    float _1331 = _1327;
    float _1333 = -_1315;
    float _1335 = _1333 + 1.0;
    float _1337 = _1315 * _1321;
    bool _1339 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1341 = isnan(_375);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = abs(_1325);
    float _1353 = log2(_1351);
    float _1355 = _1331;
    if (_1131)
    {
        float _1357 = -_1331;
        float _1359 = _1357 + 1.0;
        _1355 = _1359;
    }
    float _1361 = _1355;
    float _1363 = fma(_1279, _1109, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1365 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1367 = _1349 * _1335;
    float _1369 = _1249;
    float _1371 = _1251;
    float _1373 = _1253;
    if (!_1301)
    {
        float _1375 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1249);
        _1369 = _1375;
    }
    float _1377 = _1369;
    if (!_1301)
    {
        float _1379 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1251);
        _1371 = _1379;
    }
    float _1381 = _1371;
    if (!_1301)
    {
        float _1383 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1253);
        _1373 = _1383;
    }
    float _1385 = _1373;
    bool _1387 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1389 = isnan(0.0);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1395 = _1391 || _1393;
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1117)
    {
        _1329 = _1361;
    }
    float _1399 = _1329;
    float _1401 = _325 * _1381;
    float _1403 = _329 * _1381;
    float _1405 = _333 * _1381;
    float _1407 = _1281 * _1367;
    float _1409 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1187);
    float _1411 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1415 = fma(_313, _1377, _1405);
    float _1417 = _474 + _1365;
    float _1419 = fma(_303, _1377, _1401);
    if (_1395)
    {
        float _1421 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _317 = _1421;
    }
    float _1423 = _317;
    int _1425 = _281 + 8;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[int(_1429)][_1431];
    float _1435 = fma(_309, _1377, _1403);
    float _1437 = _480 + _1409;
    float _1439 = exp2(_1411);
    float _1441 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1443 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1395)
    {
        float _1445 = precise::min(_1423, 20.0);
        _305 = _1445;
    }
    float _1447 = _305;
    float _1449 = -_1437;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1453 = -_1417;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1457 = fma(_337, _1385, _1419);
    float _1459 = _960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1461 = _1441 * _1413;
    float _1463 = _1443 * _1397;
    float _1465 = -_1349;
    float _1467 = _1465 + 1.0;
    float _1469 = precise::min(_1437, _1451);
    float _1471 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1459);
    out.m_82.x = _1463;
    out.m_82.y = _1461;
    float _1473 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = precise::min(_1417, _1455);
    uint _1479 = uint(int(uint(_281) >> uint(2)));
    uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
    int _1483 = int(_1479) & 3;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[int(_1481)][_1483];
    int _1487 = int(_1479) + 1;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    int _1491 = _1487 & 3;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[int(_1489)][_1491];
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1407);
    float _1497 = _1475 * _1475;
    float _1499 = precise::min(_1469, _1477);
    float _1501 = in.m_84.x;
    float _1503 = fma(_1271, _1337, _1495);
    float _1505 = fma(_1475, -2.0, 3.0);
    float _1507 = fma(_341, _1385, _1435);
    float _1509 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1471);
    bool _1511 = _1325 <= 8000.0;
    bool _1513 = isnan(_1325);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(8000.0);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = _1497 * _1505;
    float _1525 = _1507 * _546;
    float _1527 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1529 = _1507 * _654;
    float _1531 = -_1523;
    float _1533 = _1531 + 1.0;
    float _1535 = _1507 * _560;
    float _1537 = fma(_1363, _1317, _1503);
    float _1539 = fma(_347, _1385, _1415);
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1523);
    float _1543 = fma(_1457, _662, _1525);
    float _1545 = _1527 + _1020;
    float _1547 = fma(_1457, _548, _1529);
    float _1549 = fma(_1457, _554, _1535);
    float _1551 = _1521 * _1541;
    float _1553 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1537);
    float _1555 = _1545 * 0.5;
    float _1557 = fma(_1539, _550, _1543);
    float _1559 = fma(_1539, _558, _1547);
    float _1561 = fma(_1539, _666, _1549);
    float _1563 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1565 = _1271;
    if (_1395)
    {
        float _1567 = 1.0 / _1447;
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = _1433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_86.x = _1557;
    out.m_86.y = _1559;
    out.m_86.z = _1561;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1048;
    float _1577 = _1573;
    if (!_1395)
    {
        _343 = 1.0;
    }
    float _1579 = _343;
    float _1581 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1048;
    out.gl_Position.y = _1060;
    out.gl_Position.z = _1527;
    out.gl_Position.w = _1020;
    out.m_88.z = _1555;
    out.m_88.w = _1020;
    float _1583 = _1579;
    float _1585 = _1581;
    if (_1395)
    {
        float _1587 = _1499 * _1569;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        _1583 = _1589;
    }
    float _1591 = _1583;
    bool _1593 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1595 = isnan(_770);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1601 = _1597 || _1599;
    float _1603 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1605 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1607 = _1591 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1609 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_90.x = _1609;
    out.m_90.y = _1611;
    out.m_90.z = _1573;
    out.m_90.w = _1581;
    float _1613 = _1611;
    float _1615 = _1609;
    if (!_1601)
    {
        _1163 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1617 = _1163;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1601)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1623 = _1575;
    float _1625 = _1623;
    float _1627 = _1623;
    if (!_1601)
    {
        _1585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1629 = _1585;
    float _1631 = _1629;
    float _1633 = _1629;
    if (!_1601)
    {
        _1577 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1635 = _1577;
    float _1637 = _1635;
    float _1639 = _1635;
    if (!_1601)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1641 = _1613;
    float _1643 = _1641;
    float _1645 = _1641;
    if (!_1601)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1647 = _1615;
    float _1649 = -_1062;
    float _1651 = _1649 + 1.0;
    float _1653 = _1651 * _1563;
    float _1655 = precise::clamp(_1653, 0.0, 1.0);
    float _1657 = -_1655;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1661 = _1659 * _1501;
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _1663;
    float _1665 = _1303 * _1082;
    float _1667 = -_1303;
    float _1669 = _1667 + 1.0;
    float _1671 = _1093 * _1665;
    float _1673 = _1103 * _1665;
    float _1675 = _1093 * _1669;
    float _1677 = fma(_1099, _1671, _1087);
    float _1679 = fma(_1101, _1671, _1089);
    float _1681 = fma(_1093, _1673, _1091);
    out.m_94.x = _1677;
    out.m_94.y = _1679;
    out.m_94.z = _1681;
    out.m_94.w = _1675;
    bool _1683 = !_1601;
    float _1685 = _1647;
    float _1687 = _1647;
    if (!_1683)
    {
        bool _1689 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1691 = isnan(_770);
        bool _1693 = _1689 || _1691;
        bool _1695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1697 = _1693 || _1695;
        if (!_1697)
        {
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1701 = _770 + _1699;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1705 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1711 = 1.0 / _1705;
            float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1729 = _1701 * _1711;
            float _1731 = precise::clamp(_1729, 0.0, 1.0);
            float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1735 = _1733 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1737 = fma(_1731, _1709, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1739 = fma(_1731, _1735, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1741 = fma(_1731, _1715, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1743 = fma(_1731, _1719, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1745 = fma(_1731, _1723, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1747 = fma(_1731, _1727, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1627 = _1741;
            _1645 = _1745;
            _1621 = _1737;
            _1639 = _1743;
            _1633 = _1739;
            _1687 = _1747;
            _1749 = true;
        }
        else
        {
            bool _1751 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1753 = isnan(_770);
            bool _1755 = _1751 || _1753;
            bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1759 = _1755 || _1757;
            if (!_1759)
            {
                _1619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1761 = _1619;
            _1621 = _1761;
            if (!_1759)
            {
                _1625 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1763 = _1625;
            _1627 = _1763;
            if (!_1759)
            {
                _1631 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1765 = _1631;
            _1633 = _1765;
            if (!_1759)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1767 = _1637;
            _1639 = _1767;
            if (!_1759)
            {
                _1643 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1769 = _1643;
            _1645 = _1769;
            if (!_1759)
            {
                _1685 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1771 = _1685;
            bool _1773 = !_1759;
            _1687 = _1771;
            if (!_1773)
            {
                bool _1775 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1777 = isnan(_770);
                bool _1779 = _1775 || _1777;
                bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1783 = _1779 || _1781;
                if (!_1783)
                {
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1787 = _770 + _1785;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1789;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1797 = 1.0 / _1791;
                    float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1815 = _1787 * _1797;
                    float _1817 = precise::clamp(_1815, 0.0, 1.0);
                    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1823 = fma(_1817, _1795, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1825 = fma(_1817, _1821, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1827 = fma(_1817, _1801, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1829 = fma(_1817, _1805, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1831 = fma(_1817, _1809, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1833 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1627 = _1827;
                    _1645 = _1831;
                    _1621 = _1823;
                    _1639 = _1829;
                    _1633 = _1825;
                    _1687 = _1833;
                    _1749 = true;
                }
                else
                {
                    _1627 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1645 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1633 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1687 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1749 = false;
    float _1835 = _1627;
    float _1837 = _1645;
    float _1839 = _1621;
    float _1841 = _1639;
    float _1843 = _1633;
    float _1845 = _1687;
    float _1847 = fma(_1559, -0.5, 0.5);
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = -_1835;
    float _1853 = _1851 + _1837;
    float _1855 = -_1839;
    float _1857 = _1855 + _1841;
    float _1859 = -_1843;
    float _1861 = _1859 + _1845;
    bool _1863 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1865 = fma(_1849, _1853, _1835);
    float _1867 = fma(_1849, _1857, _1839);
    float _1869 = fma(_1849, _1861, _1843);
    float _1871 = _1607 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1873 = _1865 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _1875 = fma(_1867, 0.298911988735198974609375, _1873);
    out.m_56.x = _1871;
    float _1877 = fma(_1869, 0.114477999508380889892578125, _1875);
    float _1879 = -_1877;
    float _1881 = _1867 + _1879;
    float _1883 = -_1877;
    float _1885 = _1865 + _1883;
    float _1887 = -_1877;
    float _1889 = _1869 + _1887;
    float _1891 = fma(_1881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    float _1893 = fma(_1885, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    float _1895 = fma(_1889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    out.m_98.x = _1891;
    out.m_98.y = _1893;
    out.m_98.z = _1895;
    if (!_1863)
    {
        return out;
    }
    float _1897 = -_742;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1901 = -_744;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1905 = -_746;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1909 = _1899 * _1899;
    float _1911 = fma(_1903, _1903, _1909);
    float _1913 = fma(_1907, _1907, _1911);
    float _1915 = sqrt(_1913);
    float _1917 = rsqrt(_1913);
    float _1919 = -_1915;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = _1903 * _1917;
    float _1929 = _1899 * _1917;
    float _1931 = abs(_1925);
    float _1933 = log2(_1931);
    float _1935 = _1907 * _1917;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1939 = _1559 * _1929;
    float _1941 = -_1929;
    float _1943 = -_1937;
    float _1945 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1943);
    float _1947 = fma(_1557, _1927, _1939);
    float _1949 = -_1935;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1945);
    float _1953 = fma(_1561, _1935, _1947);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1959 = _1951 + _1957;
    float _1961 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = exp2(_1961);
    float _1969 = _1967 * _1965;
    float _1971 = _1955 * _1969;
    float _1973 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1973;
    out.m_96.y = _1975;
    out.m_96.z = _1977;
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
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_98 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1749 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _112 = in.m_53.w;
    float _114 = trunc(_112);
    int _117 = int(_114);
    bool _121 = _117 >= 1;
    float _123 = 0.0;
    if (!_121)
    {
        _123 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _125 = _123;
    float _127 = _125;
    if (!_121)
    {
        out.m_56.x = 0.0;
    }
    int _129 = 0;
    if (!_121)
    {
        float _131 = _125 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    int _135 = _133;
    if (!_121)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2034 = as_type<float>(_133);
        out.gl_Position.z = _2034;
    }
    if (!_121)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _137 = in.m_58.w;
    bool _139 = _137 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = isnan(_137);
    bool _143 = _139 || _141;
    bool _145 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _147 = _143 || _145;
    float _149 = -_137;
    float _151 = _149 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_147)
    {
        float _153 = float(_117);
        _127 = _153;
    }
    float _155 = _127;
    bool _157 = _151 >= _155;
    bool _159 = !_147;
    bool _161 = _157 || _159;
    float _163 = _155;
    if (_161)
    {
        _163 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _163;
    if (_161)
    {
        out.m_56.x = 0.0;
    }
    if (_161)
    {
        float _167 = _165 * 5.0;
        _135 = as_type<int>(_167);
    }
    int _169 = _135;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2103 = as_type<float>(_169);
        out.gl_Position.z = _2103;
    }
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    float _177 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _179 = in.m_62.x;
    float _181 = in.m_62.y;
    float _183 = in.m_62.z;
    float _185 = in.m_64.x;
    float _187 = in.m_64.y;
    float _189 = in.m_64.z;
    float _191 = in.m_66.x;
    float _193 = _171 * _171;
    float _195 = _173 * _173;
    float _197 = _175 * _175;
    float _199 = fma(_179, _179, _193);
    float _201 = fma(_181, _181, _195);
    float _203 = fma(_183, _183, _197);
    float _205 = fma(_185, _185, _199);
    float _207 = fma(_187, _187, _201);
    float _209 = fma(_189, _189, _203);
    float _211 = sqrt(_205);
    float _213 = _177 * _191;
    float _215 = sqrt(_207);
    float _217 = sqrt(_209);
    bool _219 = _211 > 0.0;
    bool _221 = _215 > 0.0;
    float _223 = trunc(_213);
    int _225 = int(_223);
    float _227 = 0.0;
    float _229 = _215;
    if (!_219)
    {
        _227 = 0.0;
    }
    float _231 = _227;
    bool _233 = _217 > 0.0;
    float _235 = _205;
    float _237 = _217;
    float _239 = _231;
    if (_219)
    {
        float _241 = rsqrt(_205);
        _235 = _241;
    }
    float _243 = _235;
    float _245 = 0.0;
    if (!_219)
    {
        _245 = 0.0;
    }
    float _247 = _245;
    float _249 = 0.0;
    float _251 = _247;
    if (!_219)
    {
        _249 = 0.0;
    }
    float _253 = _249;
    float _255 = 0.0;
    float _257 = _253;
    if (!_221)
    {
        _255 = 0.0;
    }
    float _259 = _255;
    float _261 = 0.0;
    float _263 = _259;
    if (!_221)
    {
        _261 = 0.0;
    }
    float _265 = _261;
    float _267 = 0.0;
    float _269 = _265;
    if (_221)
    {
        float _271 = rsqrt(_207);
        _267 = _271;
    }
    float _273 = _267;
    float _275 = 0.0;
    if (!_221)
    {
        _275 = 0.0;
    }
    float _277 = _275;
    int _279 = _225 << 4;
    int _281 = _279 + 1712;
    float _283 = 0.0;
    float _285 = _277;
    if (!_233)
    {
        _283 = 0.0;
    }
    float _287 = _283;
    float _289 = _287;
    if (!_233)
    {
        _237 = 0.0;
    }
    float _291 = _237;
    float _293 = _211;
    float _295 = _291;
    if (_233)
    {
        float _297 = rsqrt(_209);
        _293 = _297;
    }
    float _299 = _293;
    if (_219)
    {
        float _301 = _243 * _179;
        _239 = _301;
    }
    float _303 = _239;
    float _305 = _303;
    if (_219)
    {
        float _307 = _243 * _171;
        _251 = _307;
    }
    float _309 = _251;
    if (_219)
    {
        float _311 = _243 * _185;
        _257 = _311;
    }
    float _313 = _257;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _317 = _313;
    if (!_233)
    {
        _229 = 0.0;
    }
    float _319 = _229;
    float _321 = _319;
    if (_221)
    {
        float _323 = _273 * _181;
        _263 = _323;
    }
    float _325 = _263;
    if (_221)
    {
        float _327 = _273 * _173;
        _269 = _327;
    }
    float _329 = _269;
    if (_221)
    {
        float _331 = _273 * _187;
        _285 = _331;
    }
    float _333 = _285;
    if (_233)
    {
        float _335 = _299 * _183;
        _289 = _335;
    }
    float _337 = _289;
    if (_233)
    {
        float _339 = _299 * _175;
        _295 = _339;
    }
    float _341 = _295;
    float _343 = _341;
    if (_233)
    {
        float _345 = _299 * _189;
        _321 = _345;
    }
    float _347 = _321;
    bool _349 = !_315;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _353 = _191 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[11].y, _151);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_117);
        float _371 = 1.0 / _369;
        float _373 = _151 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = in.m_68.w;
    float _379 = in.m_53.x;
    float _381 = in.m_53.y;
    float _383 = in.m_53.z;
    float _385 = in.m_70.x;
    float _387 = in.m_70.y;
    float _389 = in.m_70.z;
    float _391 = in.m_72.x;
    float _393 = in.m_72.y;
    float _395 = in.m_72.z;
    float _397 = in.m_64.w;
    float _399 = in.m_62.w;
    float _401 = trunc(_377);
    int _403 = int(_401);
    float _405 = in.m_60.w;
    int _407 = _403 << 5;
    uint _410 = uint(int(uint(_407) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_410)];
    float _412 = as_type<float>(_dmw0.x);
    int _414 = _407 + 4;
    uint _416 = uint(int(uint(_414) >> uint(2)));
    float _418 = as_type<float>(_dmw0.y);
    int _420 = _407 + 8;
    uint _422 = uint(int(uint(_420) >> uint(2)));
    float _424 = as_type<float>(_dmw0.z);
    int _426 = _407 + 12;
    uint _428 = uint(int(uint(_426) >> uint(2)));
    float _430 = as_type<float>(_dmw0.w);
    float _432 = _187 * _381;
    float _434 = _387 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _436 = _385 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _438 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _391);
    float _440 = fma(_185, _379, _432);
    float _442 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _393);
    float _444 = _434 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _446 = _436 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _448 = _389 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _450 = _181 * _381;
    float _452 = _444 * _442;
    float _454 = _446 * _438;
    float _456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _395);
    float _458 = _448 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _460 = _452 * _333;
    float _462 = fma(_179, _379, _450);
    float _464 = fma(_189, _383, _440);
    float _466 = _458 * _456;
    float _468 = _452 * _325;
    float _470 = fma(_454, _313, _460);
    float _472 = fma(_183, _383, _462);
    float _474 = _464 + _397;
    float _476 = fma(_454, _303, _468);
    float _478 = fma(_466, _347, _470);
    float _480 = _472 + _399;
    float _482 = _173 * _381;
    float _484 = fma(_466, _337, _476);
    float _486 = _474 + _478;
    float _488 = _452 * _329;
    float _490 = fma(_171, _379, _482);
    float _492 = _480 + _484;
    float _494 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _496 = _486 + _494;
    float _498 = fma(_454, _309, _488);
    float _500 = fma(_175, _383, _490);
    float _502 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _504 = _492 + _502;
    float _506 = _496 * _496;
    float _508 = fma(_466, _341, _498);
    float _510 = _500 + _405;
    float _512 = fma(_504, _504, _506);
    float _514 = _510 + _508;
    float _516 = sqrt(_512);
    bool _518 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _520 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _522 = _518 || _520;
    bool _524 = isnan(0.5);
    bool _526 = _522 || _524;
    bool _528 = _516 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _530 = _430 * 2.0;
    float _532 = _412 * 2.0;
    float _534 = _418 * 2.0;
    float _536 = _418 * _418;
    float _538 = _424 * _530;
    float _540 = _418 * _530;
    float _542 = _412 * _530;
    float _544 = -_538;
    float _546 = fma(_418, _532, _544);
    float _548 = fma(_418, _532, _538);
    float _550 = fma(_424, _532, _540);
    float _552 = -_540;
    float _554 = fma(_424, _532, _552);
    float _556 = -_542;
    float _558 = fma(_424, _534, _556);
    float _560 = fma(_424, _534, _542);
    float _562 = _418;
    float _564 = _540;
    float _566 = _492;
    float _568 = _486;
    if (!_528)
    {
        _562 = _492;
    }
    float _570 = _562;
    float _572 = _412 * _412;
    float _574 = _424 * _424;
    float _576 = _570;
    if (!_528)
    {
        _564 = _486;
    }
    float _578 = _564;
    float _580 = _578;
    if (!_528)
    {
        _566 = _514;
    }
    float _582 = _566;
    bool _584 = !_528;
    float _586 = _582;
    if (!_584)
    {
        float _588 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _590 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _592 = _516 + _590;
        float _594 = rsqrt(_512);
        float _596 = _592 * _588;
        float _598 = _514 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _600 = _596 * 0.15915493667125701904296875;
        float _602 = _600 * 6.283185482025146484375;
        float _604 = cos(_602);
        float _606 = _600 * 6.283185482025146484375;
        float _608 = sin(_606);
        float _610 = _604 + (-1.0);
        float _612 = _610 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _614 = fma(_608, _598, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _616 = fma(_514, _604, _612);
        float _618 = _594 * _614;
        float _620 = fma(_504, _618, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _622 = fma(_496, _618, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _586 = _616;
        _576 = _620;
        _580 = _622;
    }
    float _624 = _586;
    float _626 = _576;
    float _628 = _580;
    float _630 = -_510;
    float _632 = _630 + _624;
    float _634 = -_480;
    float _636 = _634 + _626;
    float _638 = fma(_572, -2.0, 1.0);
    float _640 = -_474;
    float _642 = _640 + _628;
    float _644 = _632 * _329;
    float _646 = _632 * _309;
    float _648 = _632 * _341;
    float _650 = fma(_536, -2.0, 1.0);
    float _652 = fma(_636, _325, _644);
    float _654 = fma(_574, -2.0, _638);
    float _656 = fma(_636, _303, _646);
    float _658 = fma(_636, _337, _648);
    float _660 = fma(_642, _333, _652);
    float _662 = fma(_574, -2.0, _650);
    float _664 = fma(_642, _313, _656);
    float _666 = fma(_536, -2.0, _638);
    float _668 = _660 * _546;
    float _670 = _660 * _654;
    float _672 = _660 * _560;
    float _674 = fma(_642, _347, _658);
    float _676 = fma(_664, _662, _668);
    float _678 = fma(_664, _548, _670);
    float _680 = fma(_664, _554, _672);
    float _682 = fma(_674, _550, _676);
    float _684 = fma(_674, _558, _678);
    float _686 = fma(_674, _666, _680);
    float _688 = _480 + _682;
    float _690 = _510 + _684;
    float _692 = _474 + _686;
    float _694 = _690;
    float _696 = _688;
    float _698 = _692;
    float _700 = _670;
    float _702 = _682;
    if (!_526)
    {
        float _704 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _706 = _510 + _704;
        float _708 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _710 = _480 + _708;
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _714 = _706 * _706;
        float _716 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _718 = _474 + _716;
        float _720 = fma(_710, _710, _714);
        float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _724 = fma(_718, _718, _720);
        float _726 = sqrt(_724);
        float _728 = _712 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _730 = precise::min(_726, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _732 = _730 * _722;
        float _734 = _728 * _732;
        float _736 = fma(_682, _734, _480);
        float _738 = fma(_684, _734, _510);
        float _740 = fma(_686, _734, _474);
        _694 = _738;
        _696 = _736;
        _698 = _740;
        _700 = _732;
    }
    float _742 = _694;
    float _744 = _696;
    float _746 = _698;
    float _748 = _700;
    float _750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _752 = _742 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _756 = _744 + _754;
    float _758 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _760 = _746 + _758;
    float _762 = _752 * _752;
    float _764 = fma(_756, _756, _762);
    float _766 = fma(_760, _760, _764);
    float _768 = rsqrt(_766);
    float _770 = sqrt(_766);
    float _772 = _768 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _774 = _756 * _772;
    float _776 = _760 * _772;
    float _778 = _774 * _774;
    float _780 = _776 * _776;
    float _782 = _778 + _780;
    float _784 = sqrt(_782);
    bool _786 = _784 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _788 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _790 = _784 + _788;
    float _792 = _768;
    float _794 = _782;
    float _796 = _790;
    float _798 = _772;
    float _800 = _752;
    if (_786)
    {
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _792 = _802;
    }
    float _804 = _792;
    if (_786)
    {
        float _806 = rsqrt(_782);
        _794 = _806;
    }
    float _808 = _794;
    float _810 = _808;
    if (_786)
    {
        float _812 = _790 * _804;
        _796 = _812;
    }
    float _814 = _796;
    if (_786)
    {
        float _816 = _814 * 0.15915493667125701904296875;
        _702 = _816;
    }
    float _818 = _702;
    float _820 = _748;
    if (_786)
    {
        float _822 = _818 * 6.283185482025146484375;
        float _824 = sin(_822);
        _820 = _824;
    }
    float _826 = _820;
    float _828 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _830 = precise::max(0.0, _828);
    float _832 = _760;
    float _834 = _828;
    float _836 = _830;
    if (_786)
    {
        float _838 = _818 * 6.283185482025146484375;
        float _840 = cos(_838);
        _832 = _840;
    }
    float _842 = _832;
    float _844 = -_772;
    float _846 = -_830;
    float _848 = fma(_752, _844, _846);
    if (_786)
    {
        float _850 = _848 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _834 = _850;
    }
    float _852 = _834;
    float _854 = _826;
    if (_786)
    {
        float _856 = fma(_826, _852, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _798 = _856;
    }
    float _858 = _798;
    float _860 = _858;
    if (!_786)
    {
        _854 = _848;
    }
    float _862 = _854;
    float _864 = _862;
    float _866 = _842;
    if (_786)
    {
        float _868 = _842 + (-1.0);
        _800 = _868;
    }
    float _870 = _800;
    float _872 = _870;
    if (_786)
    {
        float _874 = _808 * _858;
        _568 = _874;
    }
    float _876 = _568;
    if (!_786)
    {
        _810 = _776;
    }
    float _878 = _810;
    float _880 = _878;
    if (_786)
    {
        float _882 = _870 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _836 = _882;
    }
    float _884 = _836;
    if (!_786)
    {
        _872 = _774;
    }
    float _886 = _872;
    float _888 = _886;
    if (_786)
    {
        float _890 = _774 * _876;
        _888 = _890;
    }
    float _892 = _888;
    if (_786)
    {
        float _894 = _776 * _876;
        _880 = _894;
    }
    float _896 = _880;
    if (_786)
    {
        float _898 = fma(_848, _842, _884);
        _864 = _898;
    }
    float _900 = _864;
    if (!_786)
    {
        _866 = _778;
    }
    float _902 = _866;
    float _904 = _902;
    if (_786)
    {
        float _906 = _892 * _892;
        _904 = _906;
    }
    float _908 = _904;
    if (!_786)
    {
        _860 = _780;
    }
    float _910 = _860;
    float _912 = _910;
    if (_786)
    {
        float _914 = _896 * _896;
        _912 = _914;
    }
    float _916 = _912;
    float _918 = fma(_900, _900, _908);
    float _920 = _742 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _922 = _742 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = fma(_480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _926 = _918 + _916;
    float _928 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[2].x, _920);
    float _930 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _932 = fma(_770, (*spvDescriptorSet0.vp_c15)._m0[23].w, _930);
    float _934 = precise::clamp(_932, 0.0, 1.0);
    float _936 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[1].x, _922);
    float _938 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[2].z, _928);
    float _940 = rsqrt(_926);
    float _942 = -_934;
    float _944 = _942 + 1.0;
    float _946 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _948 = _938 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _950 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[1].z, _936);
    float _952 = _742 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _956 = abs(_944);
    float _958 = log2(_956);
    float _960 = _950 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _962 = fma(_474, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _964 = -_954;
    float _966 = fma(_964, _946, 1.0);
    float _968 = _742 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _970 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[3].x, _952);
    float _972 = _940 * _892;
    float _974 = fma(_744, (*spvDescriptorSet0.vp_c8)._m0[0].x, _968);
    float _976 = _940 * _900;
    float _978 = floor(_924);
    float _980 = _972 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _982 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[0].z, _974);
    float _984 = _940 * _896;
    float _986 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[3].z, _970);
    float _988 = -_980;
    float _990 = fma(_976, (*spvDescriptorSet0.vp_c15)._m0[21].y, _988);
    float _992 = _982 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _994 = _960 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _996 = floor(_962);
    float _998 = -_984;
    float _1000 = fma(_998, (*spvDescriptorSet0.vp_c15)._m0[21].z, _990);
    float _1002 = _958 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1004 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[7].x, _994);
    float _1006 = _986 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1008 = _960 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1010 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1004);
    float _1012 = log2(_966);
    float _1014 = -_978;
    float _1016 = _924 + _1014;
    float _1018 = _960 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1020 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1010);
    float _1022 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1018);
    float _1024 = _976 + 1.0;
    float _1026 = exp2(_1002);
    float _1028 = fma(_1000, -0.5, 0.5);
    float _1030 = fma(_1000, 0.5, 0.5);
    float _1032 = -_996;
    float _1034 = _962 + _1032;
    float _1036 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1008);
    float _1038 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1022);
    float _1040 = fma(_1030, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1042 = sqrt(_1028);
    float _1044 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1036);
    float _1046 = fma(_1030, _1040, -0.212114393711090087890625);
    float _1048 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1038);
    float _1050 = _1012 * 0.693147182464599609375;
    float _1052 = fma(_1030, _1046, 1.570728778839111328125);
    float _1054 = 1.0 / _1020;
    float _1056 = -_976;
    float _1058 = fma(_1026, _1024, _1056);
    float _1060 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1044);
    float2 _3502 = float2(_1016, _1034);
    float _1062 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3502, float2(0.0), isnan(_3502)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3502, float2(0.0), isnan(_3502)), level(0.0)).x;
    float _1064 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1066 = fma(_1058, 0.5, 0.5);
    float _1068 = _1042 * 0.636619746685028076171875;
    float _1070 = -_1052;
    float _1072 = fma(_1068, _1070, 1.0);
    float _1074 = _1048 * _1054;
    float _1076 = _1060 * _1054;
    float _1078 = fma(_1074, 0.5, 0.5);
    float _1080 = fma(_1076, -0.5, 0.5);
    float3 _3537 = float3(_1078, _1080, _1064);
    float _1082 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3537, float3(0.0), isnan(_3537)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3537, float3(0.0), isnan(_3537)), level(0.0)).x;
    float3 _3548 = float3(_1078, _1080, _1064);
    float4 _1085 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3548, float3(0.0), isnan(_3548)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3548, float3(0.0), isnan(_3548)), level(0.0)).xyzw;
    float _1087 = _1085.x;
    float _1089 = _1085.y;
    float _1091 = _1085.z;
    float _1093 = _1085.w;
    float2 _3564 = float2(_1072, _1066);
    float3 _1097 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3564, float2(0.0), isnan(_3564)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3564, float2(0.0), isnan(_3564)), level(0.0)).xyz;
    float _1099 = _1097.x;
    float _1101 = _1097.y;
    float _1103 = _1097.z;
    float _1105 = in.m_66.y;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1109 = _375 + _1107;
    float _1111 = in.m_74.y;
    float _1113 = _958 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_76.x = 1.0;
    out.m_76.y = 1.0;
    out.m_76.z = 1.0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1117 = _1115 != 0;
    float _1119 = _510 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1121 = in.m_74.x;
    int _1123 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1125 = _1123 != 0;
    float _1127 = exp2(_1113);
    bool _1129 = _191 > 0.5;
    bool _1131 = _1129 && _1117;
    float _1133 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1135 = _1133 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1137 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1119);
    float _1139 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1141 = _1139 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1143 = _1105 > 0.5;
    float _1145 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1137);
    float _1147 = 1.0 / _1141;
    float _1149 = -_1111;
    float _1151 = _1149 + 1.0;
    float _1153 = _1145 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1155 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1157 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1159 = _510 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1161 = _1111;
    float _1163 = _1060;
    if (_1125)
    {
        float _1165 = _1143 ? _1151 : _1111;
        _1161 = _1165;
    }
    float _1167 = _1161;
    float _1169 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1171 = 1.0 / _1153;
    float _1173 = fma(_480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1159);
    float _1175 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.300000011920928955078125;
    float _1177 = fma(_474, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1173);
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1181 = _1179 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1183 = _1177 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1185);
    float _1189 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1191 = fma(_1175, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1189);
    float _1193 = _1183 + _1153;
    float _1195 = 1.0 / _1135;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1205 = _1193 * _1171;
    float _1207 = _1205 * 0.5;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1211 = _1157 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1213 = _1203 * _1147;
    float _1215 = 1.0 / _1181;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1219 = fma(_1207, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1217);
    float _1221 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1223 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1225 = _375 + _1223;
    bool _1227 = _393 != 0.0;
    bool _1229 = isnan(_393);
    bool _1231 = _1227 || _1229;
    bool _1233 = isnan(0.0);
    bool _1235 = _1231 || _1233;
    float _1237 = -_1127;
    float _1239 = _1237 + 1.0;
    out.m_78.x = _1211;
    out.m_78.y = _1169;
    out.m_78.z = _1221;
    float _1241 = 1.0 / _1219;
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1243;
    float _1247 = _1199 * _1195;
    float _1249 = in.m_80.x;
    float _1251 = in.m_80.y;
    float _1253 = in.m_80.z;
    float _1255 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1257 = _375 + _1255;
    bool _1259 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1261 = isnan(_375);
    bool _1263 = _1259 || _1261;
    bool _1265 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1267 = _1263 || _1265;
    float _1269 = float(_1267);
    float _1271 = fma(_1213, _1225, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1273 = _391 == 0.0;
    bool _1275 = !_1235;
    bool _1277 = _1273 && _1275;
    float _1279 = _1245 * _1215;
    float _1281 = fma(_1247, _1257, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1283 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1285 = isnan(_375);
    bool _1287 = _1283 || _1285;
    bool _1289 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1291 = _1287 || _1289;
    float _1293 = float(_1291);
    float _1295 = -_1269;
    float _1297 = _1295 + 1.0;
    bool _1299 = _395 == 0.0;
    bool _1301 = _1299 && _1277;
    float _1303 = _1239 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1305 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1307 = isnan(_375);
    bool _1309 = _1305 || _1307;
    bool _1311 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1313 = _1309 || _1311;
    float _1315 = float(_1313);
    float _1317 = _1293 * _1297;
    float _1319 = -_1293;
    float _1321 = _1319 + 1.0;
    float _1323 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1325 = _1241 * _1323;
    float _1327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1329 = _1121;
    if (_1117)
    {
        _1327 = _1121;
    }
    float _1331 = _1327;
    float _1333 = -_1315;
    float _1335 = _1333 + 1.0;
    float _1337 = _1315 * _1321;
    bool _1339 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1341 = isnan(_375);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = abs(_1325);
    float _1353 = log2(_1351);
    float _1355 = _1331;
    if (_1131)
    {
        float _1357 = -_1331;
        float _1359 = _1357 + 1.0;
        _1355 = _1359;
    }
    float _1361 = _1355;
    float _1363 = fma(_1279, _1109, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1365 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1191);
    float _1367 = _1349 * _1335;
    float _1369 = _1249;
    float _1371 = _1251;
    float _1373 = _1253;
    if (!_1301)
    {
        float _1375 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1249);
        _1369 = _1375;
    }
    float _1377 = _1369;
    if (!_1301)
    {
        float _1379 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1251);
        _1371 = _1379;
    }
    float _1381 = _1371;
    if (!_1301)
    {
        float _1383 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1253);
        _1373 = _1383;
    }
    float _1385 = _1373;
    bool _1387 = 0.0 != (*spvDescriptorSet0.vp_c11)._m0[20].z;
    bool _1389 = isnan(0.0);
    bool _1391 = _1387 || _1389;
    bool _1393 = isnan((*spvDescriptorSet0.vp_c11)._m0[20].z);
    bool _1395 = _1391 || _1393;
    float _1397 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1117)
    {
        _1329 = _1361;
    }
    float _1399 = _1329;
    float _1401 = _325 * _1381;
    float _1403 = _329 * _1381;
    float _1405 = _333 * _1381;
    float _1407 = _1281 * _1367;
    float _1409 = fma((*spvDescriptorSet0.vp_c11)._m0[20].z, 0.5, _1187);
    float _1411 = _1353 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1413 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1415 = fma(_313, _1377, _1405);
    float _1417 = _474 + _1365;
    float _1419 = fma(_303, _1377, _1401);
    if (_1395)
    {
        float _1421 = (*spvDescriptorSet0.vp_c11)._m0[20].z * 0.20000000298023223876953125;
        _317 = _1421;
    }
    float _1423 = _317;
    int _1425 = _281 + 8;
    uint _1427 = uint(int(uint(_1425) >> uint(2)));
    uint _1429 = uint(int(uint(int(_1427)) >> uint(2)));
    int _1431 = int(_1427) & 3;
    float _1433 = (*spvDescriptorSet0.vp_c9)._m0[int(_1429)][_1431];
    float _1435 = fma(_309, _1377, _1403);
    float _1437 = _480 + _1409;
    float _1439 = exp2(_1411);
    float _1441 = _1167 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1443 = _1399 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_1395)
    {
        float _1445 = precise::min(_1423, 20.0);
        _305 = _1445;
    }
    float _1447 = _305;
    float _1449 = -_1437;
    float _1451 = _1449 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1453 = -_1417;
    float _1455 = _1453 + (*spvDescriptorSet0.vp_c11)._m0[20].z;
    float _1457 = fma(_337, _1385, _1419);
    float _1459 = _960 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1461 = _1441 * _1413;
    float _1463 = _1443 * _1397;
    float _1465 = -_1349;
    float _1467 = _1465 + 1.0;
    float _1469 = precise::min(_1437, _1451);
    float _1471 = fma(_992, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1459);
    out.m_82.x = _1463;
    out.m_82.y = _1461;
    float _1473 = fma(_1439, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1475 = precise::clamp(_1473, 0.0, 1.0);
    float _1477 = precise::min(_1417, _1455);
    uint _1479 = uint(int(uint(_281) >> uint(2)));
    uint _1481 = uint(int(uint(int(_1479)) >> uint(2)));
    int _1483 = int(_1479) & 3;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[int(_1481)][_1483];
    int _1487 = int(_1479) + 1;
    uint _1489 = uint(int(uint(_1487) >> uint(2)));
    int _1491 = _1487 & 3;
    float _1493 = (*spvDescriptorSet0.vp_c9)._m0[int(_1489)][_1491];
    float _1495 = fma(_1467, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1407);
    float _1497 = _1475 * _1475;
    float _1499 = precise::min(_1469, _1477);
    float _1501 = in.m_84.x;
    float _1503 = fma(_1271, _1337, _1495);
    float _1505 = fma(_1475, -2.0, 3.0);
    float _1507 = fma(_341, _1385, _1435);
    float _1509 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1471);
    bool _1511 = _1325 <= 8000.0;
    bool _1513 = isnan(_1325);
    bool _1515 = _1511 || _1513;
    bool _1517 = isnan(8000.0);
    bool _1519 = _1515 || _1517;
    float _1521 = float(_1519);
    float _1523 = _1497 * _1505;
    float _1525 = _1507 * _546;
    float _1527 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1509);
    float _1529 = _1507 * _654;
    float _1531 = -_1523;
    float _1533 = _1531 + 1.0;
    float _1535 = _1507 * _560;
    float _1537 = fma(_1363, _1317, _1503);
    float _1539 = fma(_347, _1385, _1415);
    float _1541 = fma(_1533, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1523);
    float _1543 = fma(_1457, _662, _1525);
    float _1545 = _1527 + _1020;
    float _1547 = fma(_1457, _548, _1529);
    float _1549 = fma(_1457, _554, _1535);
    float _1551 = _1521 * _1541;
    float _1553 = fma(_1269, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1537);
    float _1555 = _1545 * 0.5;
    float _1557 = fma(_1539, _550, _1543);
    float _1559 = fma(_1539, _558, _1547);
    float _1561 = fma(_1539, _666, _1549);
    float _1563 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1565 = _1271;
    if (_1395)
    {
        float _1567 = 1.0 / _1447;
        _1565 = _1567;
    }
    float _1569 = _1565;
    float _1571 = _1433 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    out.m_86.x = _1557;
    out.m_86.y = _1559;
    out.m_86.z = _1561;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1575 = _1048;
    float _1577 = _1573;
    if (!_1395)
    {
        _343 = 1.0;
    }
    float _1579 = _343;
    float _1581 = _1553 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.gl_Position.x = _1048;
    out.gl_Position.y = _1060;
    out.gl_Position.z = _1527;
    out.gl_Position.w = _1020;
    out.m_88.z = _1555;
    out.m_88.w = _1020;
    float _1583 = _1579;
    float _1585 = _1581;
    if (_1395)
    {
        float _1587 = _1499 * _1569;
        float _1589 = precise::clamp(_1587, 0.0, 1.0);
        _1583 = _1589;
    }
    float _1591 = _1583;
    bool _1593 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1595 = isnan(_770);
    bool _1597 = _1593 || _1595;
    bool _1599 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1601 = _1597 || _1599;
    float _1603 = _1485 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1605 = _1493 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1607 = _1591 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1609 = _1603 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1611 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_90.x = _1609;
    out.m_90.y = _1611;
    out.m_90.z = _1573;
    out.m_90.w = _1581;
    float _1613 = _1611;
    float _1615 = _1609;
    if (!_1601)
    {
        _1163 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1617 = _1163;
    float _1619 = _1617;
    float _1621 = _1617;
    if (!_1601)
    {
        _1575 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1623 = _1575;
    float _1625 = _1623;
    float _1627 = _1623;
    if (!_1601)
    {
        _1585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1629 = _1585;
    float _1631 = _1629;
    float _1633 = _1629;
    if (!_1601)
    {
        _1577 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1635 = _1577;
    float _1637 = _1635;
    float _1639 = _1635;
    if (!_1601)
    {
        _1613 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1641 = _1613;
    float _1643 = _1641;
    float _1645 = _1641;
    if (!_1601)
    {
        _1615 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1647 = _1615;
    float _1649 = -_1062;
    float _1651 = _1649 + 1.0;
    float _1653 = _1651 * _1563;
    float _1655 = precise::clamp(_1653, 0.0, 1.0);
    float _1657 = -_1655;
    float _1659 = fma(_1657, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1661 = _1659 * _1501;
    float _1663 = _1661 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_92.x = _1663;
    float _1665 = _1303 * _1082;
    float _1667 = -_1303;
    float _1669 = _1667 + 1.0;
    float _1671 = _1093 * _1665;
    float _1673 = _1103 * _1665;
    float _1675 = _1093 * _1669;
    float _1677 = fma(_1099, _1671, _1087);
    float _1679 = fma(_1101, _1671, _1089);
    float _1681 = fma(_1093, _1673, _1091);
    out.m_94.x = _1677;
    out.m_94.y = _1679;
    out.m_94.z = _1681;
    out.m_94.w = _1675;
    bool _1683 = !_1601;
    float _1685 = _1647;
    float _1687 = _1647;
    if (!_1683)
    {
        bool _1689 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1691 = isnan(_770);
        bool _1693 = _1689 || _1691;
        bool _1695 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1697 = _1693 || _1695;
        if (!_1697)
        {
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1701 = _770 + _1699;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1705 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1703;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1711 = 1.0 / _1705;
            float _1713 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1715 = _1713 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1717 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1719 = _1717 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1721 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1723 = _1721 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1725 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1727 = _1725 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1729 = _1701 * _1711;
            float _1731 = precise::clamp(_1729, 0.0, 1.0);
            float _1733 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1735 = _1733 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1737 = fma(_1731, _1709, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1739 = fma(_1731, _1735, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1741 = fma(_1731, _1715, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1743 = fma(_1731, _1719, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1745 = fma(_1731, _1723, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1747 = fma(_1731, _1727, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1627 = _1741;
            _1645 = _1745;
            _1621 = _1737;
            _1639 = _1743;
            _1633 = _1739;
            _1687 = _1747;
            _1749 = true;
        }
        else
        {
            bool _1751 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1753 = isnan(_770);
            bool _1755 = _1751 || _1753;
            bool _1757 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1759 = _1755 || _1757;
            if (!_1759)
            {
                _1619 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1761 = _1619;
            _1621 = _1761;
            if (!_1759)
            {
                _1625 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1763 = _1625;
            _1627 = _1763;
            if (!_1759)
            {
                _1631 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1765 = _1631;
            _1633 = _1765;
            if (!_1759)
            {
                _1637 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1767 = _1637;
            _1639 = _1767;
            if (!_1759)
            {
                _1643 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1769 = _1643;
            _1645 = _1769;
            if (!_1759)
            {
                _1685 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1771 = _1685;
            bool _1773 = !_1759;
            _1687 = _1771;
            if (!_1773)
            {
                bool _1775 = _770 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1777 = isnan(_770);
                bool _1779 = _1775 || _1777;
                bool _1781 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1783 = _1779 || _1781;
                if (!_1783)
                {
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1787 = _770 + _1785;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1791 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1789;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1797 = 1.0 / _1791;
                    float _1799 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1801 = _1799 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1803 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1805 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1807 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1809 = _1807 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1811 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1813 = _1811 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1815 = _1787 * _1797;
                    float _1817 = precise::clamp(_1815, 0.0, 1.0);
                    float _1819 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1821 = _1819 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1823 = fma(_1817, _1795, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1825 = fma(_1817, _1821, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1827 = fma(_1817, _1801, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1829 = fma(_1817, _1805, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1831 = fma(_1817, _1809, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1833 = fma(_1817, _1813, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1627 = _1827;
                    _1645 = _1831;
                    _1621 = _1823;
                    _1639 = _1829;
                    _1633 = _1825;
                    _1687 = _1833;
                    _1749 = true;
                }
                else
                {
                    _1627 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1645 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1621 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1639 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1633 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1687 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1749 = false;
    float _1835 = _1627;
    float _1837 = _1645;
    float _1839 = _1621;
    float _1841 = _1639;
    float _1843 = _1633;
    float _1845 = _1687;
    float _1847 = fma(_1559, -0.5, 0.5);
    float _1849 = precise::clamp(_1847, 0.0, 1.0);
    float _1851 = -_1835;
    float _1853 = _1851 + _1837;
    float _1855 = -_1839;
    float _1857 = _1855 + _1841;
    float _1859 = -_1843;
    float _1861 = _1859 + _1845;
    bool _1863 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1865 = fma(_1849, _1853, _1835);
    float _1867 = fma(_1849, _1857, _1839);
    float _1869 = fma(_1849, _1861, _1843);
    float _1871 = _1607 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1873 = _1865 * 0.586610972881317138671875;
    out.m_96.x = 0.0;
    float _1875 = fma(_1867, 0.298911988735198974609375, _1873);
    out.m_56.x = _1871;
    float _1877 = fma(_1869, 0.114477999508380889892578125, _1875);
    float _1879 = -_1877;
    float _1881 = _1867 + _1879;
    float _1883 = -_1877;
    float _1885 = _1865 + _1883;
    float _1887 = -_1877;
    float _1889 = _1869 + _1887;
    float _1891 = fma(_1881, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    float _1893 = fma(_1885, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    float _1895 = fma(_1889, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1877);
    out.m_98.x = _1891;
    out.m_98.y = _1893;
    out.m_98.z = _1895;
    if (!_1863)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1897 = -_742;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1901 = -_744;
    float _1903 = _1901 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1905 = -_746;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1909 = _1899 * _1899;
    float _1911 = fma(_1903, _1903, _1909);
    float _1913 = fma(_1907, _1907, _1911);
    float _1915 = sqrt(_1913);
    float _1917 = rsqrt(_1913);
    float _1919 = -_1915;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1923 = _1921 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1925 = precise::clamp(_1923, 0.0, 1.0);
    float _1927 = _1903 * _1917;
    float _1929 = _1899 * _1917;
    float _1931 = abs(_1925);
    float _1933 = log2(_1931);
    float _1935 = _1907 * _1917;
    float _1937 = _1927 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1939 = _1559 * _1929;
    float _1941 = -_1929;
    float _1943 = -_1937;
    float _1945 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1943);
    float _1947 = fma(_1557, _1927, _1939);
    float _1949 = -_1935;
    float _1951 = fma(_1949, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1945);
    float _1953 = fma(_1561, _1935, _1947);
    float _1955 = precise::clamp(_1953, 0.0, 1.0);
    float _1957 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1959 = _1951 + _1957;
    float _1961 = _1933 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1963 = _1959 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1965 = precise::clamp(_1963, 0.0, 1.0);
    float _1967 = exp2(_1961);
    float _1969 = _1967 * _1965;
    float _1971 = _1955 * _1969;
    float _1973 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1975 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1977 = _1971 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_96.x = _1973;
    out.m_96.y = _1975;
    out.m_96.z = _1977;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_98.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_98.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_98.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_98.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

